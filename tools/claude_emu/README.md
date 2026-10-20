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
- **`scripts.py`:** the assembler helper. `BASE` must be free ROM0 space. It's `$3F90` now, and Home's free space is `$3f8f-$3fff` (Oct 20, 2026, after the ability refactor): only 1 byte to spare. If Home grows, check `pokecrystal.map` and move `BASE`.
- **`boot.py`:** boots with `start_save.bin` (a save in map group 24) and Continues, then writes a state. `start_save.bin` is ignored by git (`*.bin`), so copy it over separately when rebuilding the environment (likewise the ignored `data/tilesets/*.bin` files the build needs).
- **`rmap.py`:** renders a whole map from emulator memory with block IDs on top: `python3 rmap.py MAP blkfile width out.png [x y]`.
- **`test_abilities.py`:** the ability regression test (lookup for every species and slot, entrance abilities, paired-turn checks on both sides, Transform): `python3 test_abilities.py ab.gbc ab.sym ow_ab.state`. Also per-Pokémon slots (A2), with abilities 2/hidden patched into the ROM in memory. About 5 minutes.
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
