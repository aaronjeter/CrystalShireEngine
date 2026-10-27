# Claude's emulator harness

Python scripts that drive SameBoy (libsameboy) to boot the ROM, warp, press buttons, read RAM by symbol name and take screenshots. They're used to test changes without playing by hand. See `claude/session-handover.md` in the project for the full workflow.

## Needs
- `~/SameBoy/build/lib/libsameboy.so` and `~/SameBoy/build/bin/BootROMs/cgb_boot.bin`. Build them from https://github.com/LIJI32/SameBoy with `make lib bootroms` (commit c458e7c was used).
- rgbds 0.9.4 at `/root/rgbds`. `scripts.py` assembles test scripts with it, and the ROM build needs it too.
- Python 3 with Pillow.
- The `CSE` environment variable pointing at the repo, for `includes.asm` and the charmap.

## Quick start
```
cd /root/cse_pc && export PATH=/root/rgbds:$PATH && make -j8 pokecrystal.gbc
mkdir -p ~/emu && cd ~/emu
cp /root/cse_pc/pokecrystal.gbc fol.gbc && cp /root/cse_pc/pokecrystal.sym fol.sym
export CSE=/root/cse_pc PYTHONPATH=/root/cse_pc/tools/claude_emu
python3 $PYTHONPATH/boot.py fol.gbc fol.sym ow_fol.state   # Continue from start_save.bin into the overworld
```
Re-run `boot.py` after every build. Save states only work with the ROM they were made from.

## Files
- **`gb.py`:** the libsameboy wrapper (class `GB`).
  - `frames(n)`, `press(key, hold, after)` with keys R L U D A B SEL START, `hold(key, on)`
  - `rd(name_or_addr, n)` / `wr(...)`: symbol names like `'wPartyMon1DVs+1'` handle WRAM banks
  - `pc()`, `save(path)` / `load(path)`, `shot(png, scale)`
- **`harness.py`:** class `H(GB)` with:
  - `run_script(body)`: assembles event-script text, pokes it into free ROM0 space and runs it as a map re-entry script
  - `screen_text()`, `in_battle()`, a battle `Driver`, `warp_script(MAP, x, y)`, `oam(g)`, `vram(g)`
- **`scripts.py`:** the assembler helper. `BASE` must be free ROM0 space: since Oct 21, 2026 it's the header gap, `$0063` up to `BASE_END` (`$00e3`, 128 bytes; `run_script` asserts the size), so Home can grow. `battle_test.py` puts its RNG in the rest of the gap (`$00e3-$00ff`) and splits a long party script into one script per mon.
- **`boot.py`:** boots with `start_save.bin` (a save in map group 24) and Continues, then writes a state. `start_save.bin` is ignored by git (`*.bin`), so copy it over separately when rebuilding the environment (likewise the ignored `data/tilesets/*.bin` files the build needs).
- **`rmap.py`:** renders a whole map from emulator memory with block IDs on top: `python3 rmap.py MAP blkfile width out.png [x y]`.
- **`test_abilities.py`:** the ability regression test (lookup for every species and slot, entrance abilities, paired-turn checks on both sides, Transform): `python3 test_abilities.py ab.gbc ab.sym ow_ab.state`. Also per-Pokémon slots (A2), with abilities 2/hidden patched into the ROM in memory. About 5 minutes.
- **`test_new_abilities.py`:** the abilities added on Oct 20, 2026 (Iron Fist, Strong Jaw, Sharpness, Frigid, Effect Spore and the status immunities): `python3 test_new_abilities.py ab.gbc ab.sym ow_ab.state`. About 15 minutes.
- **`battle_test.py`:** the repeatable battle test (double battles phase 0.5, step 1). Plays 10 scripted trainer battles with a deterministic RNG and records the battle state at every battle menu, so two builds can be compared over whole battles. Singles refactors must leave the records identical.
  - `python3 battle_test.py record ROM.gbc ROM.sym STATE out.json [case ...]` (needs `ROM.map` next to the .sym; about 5 minutes for all cases on 2 CPUs, one process per case).
  - `python3 battle_test.py compare base.json new.json ROM.sym` prints the differing bytes per battle menu with WRAM labels, plus differing text and actions. Exit code 1 if anything differs.
  - **RNG:** `Random` jumps to a 16-bit xorshift that the harness writes into the free ROM0 header gap (`$00e3`, the end of `$0063-$00ff`, after the script area), and VBlank's RNG update is blanked. Seeded at each battle start. Results then depend only on how many times `Random` is called, not on timing. (Just swapping the `rDIV` reads for `hRandomSub`/`hRandomAdd` would repeat every 6 calls.)
  - **Seeding:** each case seeds the RNG before creating the party (givepoke rolls DVs; the boot state's RNG differs between builds) and again before the battle.
  - **Parties:** the trainer party is assembled with the repo's own macros into free space in bank 127 (found from the .map), and the class's `TrainerGroups`/`TrainerGroupsHard` entries are repointed. `wBaseLevel` is zeroed so listed levels are exact. The player party and bag are replaced per case; `abilities` pokes `SpeciesAbilities1`.
  - **Wild cases** (`wild=(SPECIES, level)`): `wWildLevel` is zeroed like `wBaseLevel`. They cover the wild mon fainting, "Use next Pokemon?" (Yes; No with a failed and a working escape) and EXP after a Master Ball catch (`('ball',)`, the only ball in the bag). Yes/No answers come from `shift` (default No) and are made by placing the cursor, since B on YES asks "Use next?" again.
  - **Driving:** every input is chosen from the screen once it has been still for 24 frames: battle menu (records, then the next action: `('move', slot)`, `('switch', i)`, `('item', 'ITEM', target)`), party menus (`replace`), Yes/No prompts (`shift`), and B for text. Invalid actions (no PP, switching to the active mon) fall back to a move. Set `BT_TRACE=1` to print each screen.
  - **Recorded:** `wBattle`..`wBattleEnd`, `wEnemyMon`..`wBattleMode` (incl. the enemy ability and slot), a few singles (`wCurBattleMon`, `wBattleResult`…), both parties' full structs, the text since the last menu and the action taken. The text box is read every frame; `compare` ignores log entries that are part of a longer message at the same menu (frames caught mid-scroll depend on timing). Records from before Oct 21, 2026 (afternoon) used another text capture: re-record the baseline.
  - **Checked (Oct 21, 2026):** two runs of one ROM match; a build with NOPs inserted in Battle Core and Effect Commands (code shifted) matches the baseline; the swap test build matches the baseline (step 2).
  - **`check ROM.gbc ROM.sym`** checks `BattlerSwapList` (`engine/battle/battler_swap.asm`), read from the ROM: every byte of `wBattle`, `wTempEnemyMonSpecies`..`wBattleMode`, `wCurBattleMon` and `wCurMoveNum` must be in the list or named in `SHARED` (in this script, with a reason; padding as `var+N`); no byte listed twice; the bytes of each pair must match by name (Player/Enemy/Battle/OT stripped), so a wrong size shows up. Run it after adding any battle variable.
  - **Swap test build:** `make RGBASMFLAGS="-Q8 -P includes.asm -Weverything -Wtruncation=1 -D SWAP_TEST" pokecrystal.gbc` (in a worktree) adds `SwapTest` calls at the start of every turn, before the end-of-turn effects and at each side's action. Each call saves both sides through all four battler slots, wipes the live variables with `$a5` and loads them back. Its records must equal the normal build's.
  - A move-learning prompt stops the test with an error: level-100 player mons get no EXP and can have 4 moves; lower-level ones keep 3 or fewer.
- **`test_party_swap.py`:** party edits reaching a battler stored in a slot, in a double battle faked inside a singles battle (phase 1): `python3 test_party_swap.py ROM.gbc ROM.sym STATE`. About 5 minutes.
- **`test_doubles.py`:** double battles against a harness-written `doubles_trainer` party (phase 2), each played to the end: the slots at the first menu, the party/slot check at every menu, the result and text that must appear: `python3 test_doubles.py ROM.gbc ROM.sym STATE [case ...] [--shot DIR] [--records OUT.json]`. 21 cases (phase 2's 7, phase 3's spread moves, links, move audit and Intimidate, phase 6's AI choices), about 45 minutes. `check_ai(recs, v, n, e1=, e2=)` checks each enemy's (move slot, target slot) choice for the first n turns, read at P1's menu (the AI chooses before the player). `force_target={record index: (enemy slot, player slot)}` pins an enemy's target at that menu (the enemy must be loaded opposite the chooser), for cases that test a move rather than the AI. Case options: `check=fn(recs, view)` (a `View` reads any battler's variables from a record, loaded or stored; `turns()` groups the records by turn with each turn's text), `fixed_damage=True` (no damage rolls or crits), `hp={party index: HP}`. Actions: `('move', n, target)` (target 0 = E1, 1 = E2, for the placeholder target menu) and `('back',)` (B on P2's battle menu), plus the usual ones. `BT_TRACE=1` prints every screen the driver sees. `battle_test.py record` without case names runs only the singles corpus (`SINGLES_CASES`); `compare` ignores the time-of-day bits of the party mons' caught level (they come from the boot state's clock).
- **`anim_sheets.py`:** contact sheets of battle animations in double battles (phase 5): `python3 anim_sheets.py ROM.gbc ROM.sym STATE OUTDIR [MOVE ...]`. Both sides are Snorlax that know the listed moves (4 per battle; `ANIM_ONE=1`: one move per battle, so the enemies' AI uses it too); P1 and P2 use each move on E1/E2 and then E2/E1, HP and PP are refilled at every menu. Every animation on the double battle screen is captured (its distinct frames, plus 30 frames after it), and each move gets `OUTDIR/MOVE.png`: a row per user/target pair (`both` for a spread move), 8 frames evenly spread, the field only. Other animations (stat changes, status) go to `other_N.png`. `ANIM_ABILITY=ABILITY_X` gives every Snorlax that ability (entrance animations); `ANIM_SHOTS=DIR` also saves a screenshot at every battle menu. About 1.5 minutes per battle.
- **`anim_count.py`:** counts battle animations in double battles: `python3 anim_count.py ROM.gbc ROM.sym STATE [case ...]`. Needs a build with `-D ANIM_LOG` (in a worktree: `make RGBASMFLAGS="-Q8 -P includes.asm -Weverything -Wtruncation=1 -D ANIM_LOG" pokecrystal.gbc`), which logs every `PlayBattleAnim` call's `wFXAnimID` into `wAnimLog` (a 16-entry ring in the battle temporaries). Checks that each spread move animates once per use and each each-foe entrance ability (Intimidate, Leech...) once per entrance. Weather (Sandstorm, Hail) must animate once per end-of-turn message, in doubles and singles (`weather_*` cases). About 30 s per case. `test_doubles.py` cases can now set `options` (default fast text, scene off).
- **`continue_test.py`:** saves in-game on a map, reboots, Continues and compares screenshots: `python3 continue_test.py MAP x y tag`.

## Typical test
```python
from harness import H, warp_script
g = H('fol.gbc', None, 'fol.sym'); g.load('ow_fol.state')
g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
g.run_script("\tgivepoke DRAGONITE, 60\n\tgiveitem GOLD_LEAF\n\tend")
for i in range(30): g.frames(20); g.press('B', after=10)
g.run_script(warp_script('METEOR_FALLS', 15, 20)); g.frames(150)
g.press('R', hold=2, after=18); print(g.rd('wXCoord'), g.rd('wYCoord'))
g.shot('test.png', 2)
```
Tips:
- ROM patches (`poke_rom`, and the code `run_script` pokes at `BASE`) aren't part of save states. A state saved in the middle of a scripted battle can only be resumed in the same run: loaded in a new run, the script resumes in unpatched ROM after the battle and the game crashes.
- `hROMBank` is at `$ff9e` (check the .sym file).
- To find what writes some memory, step with `LIB.GB_run(g.gb)` and compare after each instruction.
