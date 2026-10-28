"""Repeatable battle test (double battles phase 0.5, step 1).

Plays a corpus of scripted trainer battles with a deterministic RNG and records the
battle state at every battle menu, so two builds can be compared over whole battles.

Usage (from a folder holding the ROM, .sym, .map and a boot.py state):
    python3 battle_test.py record ROM.gbc ROM.sym STATE out.json [case ...]
    python3 battle_test.py compare a.json b.json ROM.sym
    python3 battle_test.py check ROM.gbc ROM.sym      (BattlerSwapList completeness)
ROM.map is found next to ROM.sym. See README.md.

How it stays repeatable:
- The harness patches the ROM in memory (no source change). `Random` jumps to a 16-bit
  xorshift written into the free ROM0 header gap, and VBlank's RNG update is blanked.
  The RNG is reseeded at the start of each case. Randomness then depends only on how many
  times `Random` is called, not on timing.
- Custom trainer parties are assembled with the repo's own macros into free ROMX space,
  and a trainer class's TrainerGroups/TrainerGroupsHard entries are repointed to them.
- Every input is chosen from the screen state (menus, prompts), never from frame counts.
"""
import json, os, re, subprocess, sys, tempfile
from harness import H, CHARS
from gb import LIB
from scripts import CSE, RGB, BASE_END, party_script

RNG_ORG = 0x00E3          # end of the free ROM0 header gap ($0063-$00ff), after the script area
SCRIPT_ORG = 0x0063       # harness script area (see scripts.py)
TRAINER_CLASS = 'COOLTRAINERM'  # class whose group gets repointed (affects AI and trainer items)
SEED = 0x1234


# ---------------------------------------------------------------- assembling
def assemble_at(body, bank, org):
    """Assemble `body` (with includes.asm) at bank:org and return the bytes."""
    sect = f'SECTION "t", ROM0[${org:04X}]' if bank == 0 else f'SECTION "t", ROMX[${org:04X}], BANK[${bank:02X}]'
    d = tempfile.mkdtemp()
    a, o, b = f'{d}/t.asm', f'{d}/t.o', f'{d}/t.gbc'
    open(a, 'w', encoding='latin-1').write(sect + '\n' + body + '\n')
    subprocess.run([f'{RGB}/rgbasm', '-Q8', '-P', 'includes.asm', '-o', o, a], cwd=CSE, check=True)
    subprocess.run([f'{RGB}/rgblink', '-o', b, o], cwd=CSE, check=True)
    data = open(b, 'rb').read()
    start = org if bank == 0 else bank * 0x4000 + org - 0x4000
    # rgblink pads with 0; find the real end from the object's section size via a marker
    return data, start


def assemble_block(body, bank, org):
    data, start = assemble_at(body + '\n__end__:\n\tdb $D3, $D3, $D3, $D3', bank, org)
    end = data.index(b'\xD3\xD3\xD3\xD3', start)
    return data[start:end]


def free_space(map_path, bank, need):
    cur = None
    for l in open(map_path):
        m = re.match(r'ROMX bank #(\d+)', l)
        if m: cur = int(m.group(1))
        m = re.search(r'EMPTY: \$(\w+)-\$(\w+) \(\$(\w+) bytes', l)
        if m and cur == bank and int(m.group(3), 16) >= need and int(m.group(1), 16) < 0x8000:
            return int(m.group(1), 16)
    raise RuntimeError(f'no {need} free bytes in bank {bank}')


# ---------------------------------------------------------------- the patched game
class Game(H):
    def slot_size(self):
        """BATTLER_SLOT_SIZE: the total of BattlerSwapList's sizes, read from the ROM."""
        b, a = self.sym['BattlerSwapList']
        r = self.rom()
        p, n = b * 0x4000 + a - 0x4000, 0
        while r[p]:
            n += r[p]; p += 5
        return n

    def __init__(self, rom, sym, state, map_path=None):
        super().__init__(rom, None, sym)
        self.map = map_path or os.path.splitext(sym)[0] + '.map'
        self.load(state)
        LIB.GB_set_rendering_disabled(self.gb, True)
        self.patch_rng()

    def rom_addr(self, name):
        b, a = self.sym[name]
        return a if b == 0 else b * 0x4000 + a - 0x4000

    def patch_rng(self):
        add, sub = self.sym['hRandomAdd'][1], self.sym['hRandomSub'][1]
        # xorshift16 (7,9,8) by John Metcalf, state in hRandomAdd:hRandomSub; returns a = hRandomSub
        code = assemble_block(f'''
	push hl
	ldh a, [${add:04X}]
	ld h, a
	ldh a, [${sub:04X}]
	ld l, a
	ld a, h
	rra
	ld a, l
	rra
	xor h
	ld h, a
	ld a, l
	rra
	ld a, h
	rra
	xor l
	ld l, a
	xor h
	ld h, a
	ldh [${add:04X}], a
	ld a, l
	ldh [${sub:04X}], a
	pop hl
	ret''', 0, RNG_ORG)
        assert RNG_ORG + len(code) <= 0x100
        rom = bytes(self.rom()[:0x4000])
        # the two-byte-pair RNG update appears in Random and in VBlank
        pat = bytes([0xF0, 0x04, 0x47, 0xF0, add & 0xFF, 0x88, 0xE0, add & 0xFF,
                     0xF0, 0x04, 0x47, 0xF0, sub & 0xFF, 0x98, 0xE0, sub & 0xFF])
        hits = [m.start() for m in re.finditer(re.escape(pat), rom)]
        rnd = self.sym['Random'][1]
        assert len(hits) == 2 and rnd + 1 in hits, hits
        vbl = [h for h in hits if h != rnd + 1][0]
        assert rom[RNG_ORG:RNG_ORG + len(code)] == bytes(len(code)), 'RNG area not free'
        self.poke_rom(RNG_ORG, code)
        self.poke_rom(rnd, [0xC3, RNG_ORG & 0xFF, RNG_ORG >> 8])  # jp XorRandom
        self.poke_rom(vbl, [0] * len(pat))                         # nop out VBlank's update

    def seed(self, s=SEED):
        self.wr('hRandomAdd', s >> 8); self.wr('hRandomSub', s & 0xFF)

    # ------------------------------------------------------------ case setup
    def const(self, expr):
        return assemble_block(f'\tdb {expr}', 0, SCRIPT_ORG)[0]

    def set_trainer(self, cls, name, mons, ttype=None, doubles=False):
        """mons: list of (level, species, item or None, [moves] or None). doubles: a
        doubles_trainer party (a double battle)."""
        if ttype is None:
            ttype = ' | '.join(['TRAINERTYPE_NORMAL'] + (['TRAINERTYPE_ITEM'] if any(m[2] for m in mons) else [])
                                + (['TRAINERTYPE_MOVES'] if any(m[3] for m in mons) else []))
        header = f'\tdoubles_trainer "{name}", {ttype}' if doubles else f'\tdb "{name}@", {ttype}'
        lines = ['TestGroup:', '\tnext_list_item', header]
        for lv, sp, item, moves in mons:
            lines.append(f'\titemmon {lv}, {sp}, {item or "NO_ITEM"}' if 'TRAINERTYPE_ITEM' in ttype else f'\tmon {lv}, {sp}')
            if 'TRAINERTYPE_MOVES' in ttype:
                mv = list(moves or []) + ['NO_MOVE'] * 4
                lines.append('\tmoves ' + ', '.join(mv[:4]))
        lines += ['\tend_party', '\tend_list_items']
        body = '\n'.join(lines)
        bank = 127
        org = free_space(self.map, bank, 0x200)
        data = assemble_block(body, bank, org)
        self.poke_rom(bank * 0x4000 + org - 0x4000, data)
        idx = self.const(cls) - 1
        for tbl in ('TrainerGroups', 'TrainerGroupsHard'):
            self.poke_rom(self.rom_addr(tbl) + 3 * idx, [bank, org & 0xFF, org >> 8])

    def set_party(self, mons, items=()):
        """mons: list of (species, level, item or None, [moves]); items: list of (ITEM, qty)."""
        self.wr('wPartyCount', 0); self.wr('wPartySpecies', 0xFF)
        mon1 = self.sym['wPartyMon1'][1]
        size = self.sym['wPartyMon2'][1] - mon1
        lines = []
        for i, (sp, lv, item, moves) in enumerate(mons):
            lines.append(f'\tgivepoke {sp}, {lv}, {item or "NO_ITEM"}')
            for j, m in enumerate((list(moves) + ['NO_MOVE'] * 4)[:4]):
                lines.append(f'\tgivepokemove {m}, ${mon1 + i * size:04X}, {j}')
        for it, q in items:
            lines.append(f'\tgiveitem {it}, {q}')
        # one script if it fits the script area, else one per mon (each waits for its messages)
        chunks = [lines]
        if len(assemble_block('\n'.join(lines + ['\tend']), 0, SCRIPT_ORG)) > BASE_END - SCRIPT_ORG:
            chunks, cur = [], []
            for l in lines:
                if l.startswith('\tgivepoke ') and cur:
                    chunks.append(cur); cur = []
                cur.append(l)
            chunks.append(cur)
        for c in chunks:
            self.run_script('\n'.join(c + ['\tend']))
            for i in range(30):
                self.frames(20); self.press('B', after=10)
        assert self.rd('wPartyCount') == len(mons), self.rd('wPartyCount')

    def start_battle(self, cls, options=None):
        self.wr('wBaseLevel', 0)   # trainer levels are wBaseLevel + the listed level
        if options is not None:
            self.wr('wOptions', options)
        self.run_script(f'''TestScript:
	winlosstext .win, .loss
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	loadtrainer {cls}, 1
	startbattle
	reloadmapafterbattle
	end
.win
	text "WIN"
	done
.loss
	text "LOSS"
	done''')
        for _ in range(600):
            self.frames(2)
            if self.in_battle():
                return
        raise RuntimeError('battle did not start')

    def clear_bag(self):
        self.wr('wNumItems', 0); self.wr('wItems', [0xFF, 0xFF, 0xFF])
        self.wr('wCurPocket', 0); self.wr('wItemsPocketCursor', 0); self.wr('wItemsPocketScrollPosition', 0)
        self.wr('wNumBalls', 0); self.wr('wBalls', [0xFF, 0xFF])
        self.wr('wLastPocket', 0)

    def start_wild(self, species, level, options=None):
        self.wr('wWildLevel', 0)   # wild levels are wWildLevel + the listed level
        if options is not None:
            self.wr('wOptions', options)
        self.run_script(f'TestScript:\n\tloadwildmon {species}, {level}\n\tstartbattle\n\treloadmapafterbattle\n\tend')
        for _ in range(600):
            self.frames(2)
            if self.in_battle():
                return
        raise RuntimeError('battle did not start')


# ---------------------------------------------------------------- recording
REGIONS = [('wBattle', 'wBattleEnd'), ('wEnemyMon', 'wBattleMode')]
SINGLES = ['wBattleMode', 'wCurBattleMon', 'wBattlePlayerAction', 'wBattleResult', 'wOTPartyCount', 'wPartyCount']


def record(g):
    r = {}
    for a, b in REGIONS:
        r[a] = g.rd(a, g.sym[b][1] - g.sym[a][1])
    for s in SINGLES:
        r[s] = g.rd(s)
    size = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    r['wPartyMons'] = g.rd('wPartyMon1', size * g.rd('wPartyCount'))
    r['wOTPartyMons'] = g.rd('wOTPartyMon1', size * g.rd('wOTPartyCount'))
    if 'wDoubleBattle' in g.sym.d and g.rd('wDoubleBattle'):  # doubles only, so singles records don't change
        for a, b in DOUBLES_REGIONS:
            r[a] = g.rd(a, g.sym[b][1] - g.sym[a][1])
        r['wBattlerSlots'] = g.rd('wBattlerSlots', 4 * g.slot_size())
    return r


DOUBLES_REGIONS = [('wDoubleBattle', 'wBattleStateEnd')]  # flag, area slots, masks, swap, links


# ---------------------------------------------------------------- party/slot consistency
# At a battle menu, every player battler on the field must agree with its party struct (HP,
# status, level, PP): the loaded one through the live variables, stored ones (doubles) through
# wBattlerSlots. It catches a party mon changed while its slot copy wasn't (or the reverse).
# Only the player's side: the enemy's party struct is written back only when it leaves the
# field (UpdateEnemyMonInParty), so it lags in singles too. PP is compared only for move slots
# that hold the party mon's own move (Transform and Mimic change the battle copy only).
SLOT_FIELDS = [('HP', 2), ('Status', 1), ('Level', 1), ('PP', 4)]


def swap_layout(rom_path, sym):
    """Slot offsets of BattlerSwapList entries, by the player address (or enemy address)."""
    rom = open(rom_path, 'rb').read()
    b, a = sym['BattlerSwapList']
    p = b * 0x4000 + a - 0x4000
    off, by_addr = 0, {}
    while rom[p]:
        size, pa, ea = rom[p], rom[p + 1] | rom[p + 2] << 8, rom[p + 3] | rom[p + 4] << 8
        for ad in (pa, ea):
            if ad: by_addr[ad] = off
        off += size; p += 5
    return by_addr, off


def check_slots(records, rom_path, sym):
    """Returns a list of problems (strings) for one case's records."""
    by_addr, slot_size = swap_layout(rom_path, sym)
    A = lambda n: sym[n][1]
    psize = A('wPartyMon2') - A('wPartyMon1')
    pfield = {f: A(f'wPartyMon1{f}') - A('wPartyMon1') for f, _ in SLOT_FIELDS + [('Moves', 4)]}
    bfield = {f: A(f'wBattleMon{f}') - A('wBattleMon') for f, _ in SLOT_FIELDS + [('Moves', 4)]}
    problems = []
    for i, r in enumerate(records):
        if 'end' in r:
            continue
        def party(side, idx, f, n):
            mons = r['wPartyMons' if side == 0 else 'wOTPartyMons']
            o = idx * psize + pfield[f]
            return mons[o:o + n] if o + n <= len(mons) else None
        battlers = []  # (name, side, party index, {field: bytes})
        wb = r['wBattle']
        live = [(0, r['wCurBattleMon'], lambda f, n: wb[A('wBattleMon') - A('wBattle') + bfield[f]:][:n]),
                (1, wb[A('wCurOTMon') - A('wBattle')], lambda f, n: r['wEnemyMon'][bfield[f]:][:n])]
        doubles = 'wBattlerSlots' in r
        if doubles:
            d = r['wDoubleBattle']
            areas = d[A('wAreaSlots') - A('wDoubleBattle'):][:2]
            empty = d[A('wEmptyBattlerSlots') - A('wDoubleBattle')]
        for side, idx, get in live:
            if side == 1:
                continue  # the enemy's party struct lags (see above)
            name = f'P{areas[0] + 1}' if doubles and side == 0 else f'E{areas[1] - 1}' if doubles else ('player' if side == 0 else 'enemy')
            battlers.append((name, side, idx, get))
        if doubles:
            for slot in range(2):  # the player's slots
                if slot in areas or empty & (1 << slot):
                    continue
                base = slot * slot_size
                sl = r['wBattlerSlots'][base:base + slot_size]
                side = slot >> 1
                idx = sl[by_addr[A('wCurBattleMon') if side == 0 else A('wCurOTMon')]]
                mon = by_addr[A('wBattleMon')]
                battlers.append((f'{"PE"[side]}{slot % 2 + 1} (stored)', side, idx,
                                 lambda f, n, sl=sl, mon=mon: sl[mon + bfield[f]:][:n]))
        for name, side, idx, get in battlers:
            pm, bm = party(side, idx, 'Moves', 4), list(get('Moves', 4))
            for f, n in SLOT_FIELDS:
                pv = party(side, idx, f, n)
                bv = list(get(f, n))
                if pv is not None and f == 'PP':
                    keep = [j for j in range(4) if pm[j] == bm[j]]
                    pv, bv = [pv[j] for j in keep], [bv[j] for j in keep]
                if pv is not None and list(pv) != bv:
                    problems.append(f'menu {i} {name} (party mon {idx + 1}) {f}: battle {bv} party {list(pv)}')
    return problems


_BATTLE_LABELS = None


def battle_labels():
    """Labels declared between wBattle:: and wBattleEnd:: in wram.asm (wBattle is in a union,
    so other members share its addresses)."""
    global _BATTLE_LABELS
    if _BATTLE_LABELS is None:
        names, inside = set(), False
        for l in open(f'{CSE}/ram/wram.asm', encoding='latin-1'):
            m = re.match(r'(w\w+)::', l)
            if m:
                if m.group(1) == 'wBattle': inside = True
                if inside: names.add(m.group(1))
                if m.group(1) == 'wBattleEnd': break
        _BATTLE_LABELS = names
    return _BATTLE_LABELS


REGION_SYMS = {'wPartyMons': 'wPartyMon1', 'wOTPartyMons': 'wOTPartyMon1'}


def label_for(sym, region_start, off):
    """Nearest WRAM symbol at or before region_start+off, for readable diffs."""
    region_start = REGION_SYMS.get(region_start, region_start)
    if region_start not in sym.d:
        return f'{region_start}[{off}]'
    addr = sym[region_start][1] + off
    bank = sym[region_start][0]
    best = None
    only = battle_labels() if region_start == 'wBattle' else None
    for k, (b, a) in sym.d.items():
        if only is not None and k not in only:
            continue
        if (b == bank or a < 0xD000) and a <= addr and 0xC000 <= a < 0xE000 and '.' not in k:
            if best is None or a > best[1] or (a == best[1] and len(k) > len(best[0])):
                best = (k, a)
    return f'{best[0]}+{addr - best[1]}' if best else hex(addr)


# ---------------------------------------------------------------- driving
TEXT_ROWS = slice(12, 18)


def is_party_menu(t):
    return 'Cancel' in '\n'.join(t) and re.search(r'\d+/ *\d+', t[1]) is not None


class Battle:
    """Plays one battle. Actions are consumed at each battle menu:
         ('move', slot) | ('switch', party_index) | ('item', 'ITEM_CONST', party_index_or_None)
       After the list runs out, ('move', 0) is used. `replace` lists the party index to send in
       each time the player must replace a fainted Pokemon (default: first usable one).
       `shift` lists answers (True/False) for the "Will you switch?" prompt (default False)."""

    text_rows = TEXT_ROWS  # the text box (the double battle screen's starts a row lower)
    STABLE = 24  # frames the screen must stay unchanged before an input

    def __init__(self, g, actions, replace=(), shift=()):
        self.g, self.actions, self.replace, self.shift = g, list(actions), list(replace), list(shift)
        self.records, self.log, self.turn = [], [], 0
        self.trace = os.environ.get('BT_TRACE')
        self.target = 0

    def text(self):
        t = bytes(self.g.wram_full()[0x4A0:0x4A0 + 360])  # wTilemap ($c4a0)
        rows = [''.join(CHARS.get(c, ' ') for c in t[y * 20:(y + 1) * 20]) for y in range(18)]
        rows[17] = rows[17][:18] + ' ' + rows[17][19:]   # mask the blinking prompt arrow
        return rows

    def tile(self, x, y):
        return self.g.wram_full()[0x4A0 + y * 20 + x]   # wTilemap ($c4a0)

    def settle(self, limit=12000):
        """Run until the screen has been still for STABLE frames. Every frame's text box goes
        to the log, so short messages are caught however the timing shifts between builds."""
        last, same = None, 0
        for _ in range(limit):
            self.g.frames(1)
            if not self.g.in_battle():
                return None
            t = self.text()
            self.note(t)
            same = same + 1 if t == last else 0
            last = t
            if same >= self.STABLE:
                return t
        raise RuntimeError('screen never settled:\n' + '\n'.join(last))

    def note(self, t):
        """Add the text box to the log. Text prints letter by letter, so a message that extends
        the last entry replaces it, and one the last entry already starts with is skipped."""
        if 'Fight' in t[14] and 'Run' in t[16]:
            return
        msg = ' '.join(x.strip() for x in t[self.text_rows] if x.strip())
        if not msg:
            return
        if self.log:
            last = self.log[-1]
            if last.startswith(msg):
                return
            if msg.startswith(last):
                self.log[-1] = msg
                return
        self.log.append(msg)

    def run(self, max_steps=3000):
        g = self.g
        for _ in range(max_steps):
            t = self.settle()
            if t is None:
                # battle over: let the map reload
                for _ in range(40):
                    g.frames(10); g.press('B', hold=2, after=4)
                self.records.append({'end': True, 'log': self.log, 'result': g.rd('wBattleResult')})
                return self.records
            s = '\n'.join(t)
            if self.trace:
                print('STEP', ' | '.join(x.strip() for x in t if x.strip())[:160], flush=True)
            if 'Fight' in t[14] and 'Run' in t[16]:
                self.at_menu()
            elif 'Target:' in t[14] or (t[14].rstrip().endswith(' on') and self.tile(1, 16) == 0xED):
                # double battles: the target menu ("<move> on" / "▶<foe>"; phase 2's was "Target:")
                g.wr('wMenuCursorY', self.target + 1)
                g.press('A', after=4)
            elif is_party_menu(t):
                bottom = ' '.join(t[15:18])
                if 'Use on' in bottom:
                    g.press('B', after=4)   # an item menu left open: back out
                elif 'Which' in bottom or 'Choose a' in bottom:
                    self.choose_replacement()
                else:
                    self.note(t)            # a message over the party menu (item used)
                    g.press('B', hold=2, after=2)
            elif 'Delete an older' in s or 'Stop learning' in s:
                raise RuntimeError('move-learning prompt; give the mon fewer than 4 moves:\n' + s)
            elif 'Yes' in s and 'No' in s:
                self.note(t)
                ans = self.shift.pop(0) if self.shift else False
                g.wr('wMenuCursorY', 1 if ans else 2)   # YES / NO (B on YES asks again for "Use next?")
                g.press('A', after=8)
            else:
                self.note(t)
                g.press('B', hold=2, after=2)
        raise RuntimeError('battle did not end')

    def at_menu(self):
        g = self.g
        rec = record(g)
        rec['log'] = self.log
        self.log = []
        act = self.valid(self.actions.pop(0) if self.actions else ('move', 0))
        rec['action'] = list(act)
        self.target = act[2] if act[0] == 'move' and len(act) > 2 else 0  # doubles: 0 = E1, 1 = E2
        if self.turn > 80:
            raise RuntimeError('more than 80 turns')
        self.records.append(rec)
        self.turn += 1
        kind = act[0]
        if kind == 'move':
            g.wr('wCurMoveNum', act[1])
            self.menu_pick(1, 1)
            t = self.settle()
            if t and self.tile(0, 12) == 0xBA and self.tile(5, 13) == 0xBD and not ('Fight' in t[14] and 'Run' in t[16]):
                g.press('A', after=4)   # the move menu (its box from row 12, the divider in column 5): the cursor sits on wCurMoveNum
        elif kind == 'switch':
            self.menu_pick(1, 2)
            self.settle()
            g.wr('wMenuCursorY', act[1] + 1); g.press('A', after=4)
            self.settle()
            g.press('A', after=4)       # "Switch"
        elif kind == 'item':
            self.pack_item(act[1], act[2] if len(act) > 2 else None)
        elif kind == 'ball':           # the only ball type in the bag
            g.wr('wLastPocket', 1); g.wr('wBallsPocketCursor', 1); g.wr('wBallsPocketScrollPosition', 0)
            self.menu_pick(2, 1)
            self.settle()
            g.press('A', after=4)
            t = self.settle()
            if t and 'Use' in '\n'.join(t):
                g.press('A', after=4)
            g.wr('wLastPocket', 0)
        elif kind == 'run':
            self.menu_pick(2, 2)
        elif kind == 'back':           # doubles: B on P2's battle menu (back to P1)
            g.press('B', after=4)
        else:
            raise ValueError(act)

    def hp(self, i):
        size = self.g.sym['wPartyMon2'][1] - self.g.sym['wPartyMon1'][1]
        return self.g.rd16(f'wPartyMon1HP+{i * size}')

    def valid(self, act):
        """Replace an action the game would refuse (no PP, switching to the active or a fainted mon)."""
        g = self.g
        field = g.rd('wFieldMons') if 'wDoubleBattle' in g.sym.d and g.rd('wDoubleBattle') else 0
        if act[0] == 'switch' and (act[1] == g.rd('wCurBattleMon') or act[1] >= g.rd('wPartyCount') or not self.hp(act[1])
                                   or field >> act[1] & 1):
            act = ('move', 0)
        if act[0] == 'move':
            pp = [x & 0x3F for x in g.rd('wBattleMonPP', 4)]
            moves = g.rd('wBattleMonMoves', 4)  # nonzero low bytes are enough to spot empty slots
            ok = [i for i in range(4) if pp[i] and moves[i]]
            if ok and act[1] not in ok:
                act = ('move', ok[0])
        return act

    def menu_pick(self, y, x):
        g = self.g
        g.wr('wMenuCursorY', y); g.wr('wMenuCursorX', x)
        g.press('A', after=4)

    def pack_item(self, item, target):
        g = self.g
        iid = g.const(f'HIGH({item})'), g.const(f'LOW({item})')
        n = g.rd('wNumItems')
        bag = [(g.rd('wItems', 3 * n)[3 * i], g.rd('wItems', 3 * n)[3 * i + 1]) for i in range(n)]
        idx = bag.index(iid)
        assert idx < 4, 'keep test bags small (no scrolling)'
        g.wr('wCurPocket', 0); g.wr('wItemsPocketCursor', idx + 1); g.wr('wItemsPocketScrollPosition', 0)
        self.menu_pick(2, 1)
        self.settle()
        g.press('A', after=4)           # the item
        t = self.settle()
        if t and 'Use' in '\n'.join(t):
            g.press('A', after=4)       # "Use"
            t = self.settle()
        if target is not None and t and is_party_menu(t):
            g.wr('wMenuCursorY', target + 1); g.press('A', after=4)

    def choose_replacement(self):
        g = self.g
        if self.replace:
            i = self.replace.pop(0)
        else:
            cur = g.rd('wCurBattleMon')
            field = g.rd('wFieldMons') if 'wDoubleBattle' in g.sym.d and g.rd('wDoubleBattle') else 0
            i = next(i for i in range(g.rd('wPartyCount')) if i != cur and self.hp(i) and not field >> i & 1)
        g.wr('wMenuCursorY', i + 1); g.press('A', after=4)
        t = self.settle()
        if t and 'Switch' in '\n'.join(t):
            g.press('A', after=4)


# ---------------------------------------------------------------- the corpus
# Player mons: (species, level, held item, moves). Trainer mons: (level, species, item, moves).
# Level-100 player mons get no EXP, so 4 moves are safe; lower levels can level up, so they keep
# 3 moves or fewer (a 4-move mon learning a move would stop on a prompt).
# options: wOptions. $01 = fast text, battle scene on, Shift; | $80 = scene off; | $40 = Set.
SCENE_OFF, SET_STYLE = 0x80, 0x40
CASES = {
    'basic': dict(  # items both sides, voluntary switches, Shift prompt (yes), crits, EXP, win; animations on
        options=0x01, cls='PRYCE',
        party=[('MACHAMP', 40, None, ['KARATE_CHOP', 'ROCK_SLIDE']), ('PIKACHU', 40, None, ['THUNDERBOLT', 'QUICK_ATTACK'])],
        items=[('POTION', 5), ('X_ATTACK', 2)],
        trainer=[(38, 'GEODUDE', None, ['TACKLE', 'DEFENSE_CURL']), (38, 'ONIX', None, ['RAGE', 'BIND']), (39, 'PILOSWINE', None, ['POWDER_SNOW', 'TAKE_DOWN'])],
        actions=[('item', 'X_ATTACK'), ('switch', 1), ('item', 'POTION', 0), ('move', 1), ('switch', 0)],
        shift=[True], replace=[1]),
    'player_loses': dict(  # player faints repeatedly: forced replacements, the loss path
        cls='COOLTRAINERM',
        party=[('RATTATA', 20, None, ['TACKLE']), ('PIDGEY', 22, None, ['GUST', 'SAND_ATTACK']), ('CATERPIE', 15, None, ['TACKLE', 'STRING_SHOT'])],
        trainer=[(45, 'ARCANINE', None, ['FLAMETHROWER', 'BITE', 'ROAR']), (45, 'GYARADOS', None, ['SURF'])],
        actions=[('move', 0), ('move', 1), ('move', 0)]),
    'weather': dict(  # rain, sun, sandstorm and their end-of-turn effects, Solar Beam in sun, Thunder in rain
        cls='COOLTRAINERM',
        party=[('TYRANITAR', 100, None, ['SANDSTORM', 'CRUNCH', 'ROCK_SLIDE', 'PROTECT']),
               ('VENUSAUR', 100, None, ['SUNNY_DAY', 'SOLARBEAM', 'SYNTHESIS', 'LEECH_SEED']),
               ('LANTURN', 100, None, ['RAIN_DANCE', 'THUNDER', 'SURF', 'CONFUSE_RAY'])],
        trainer=[(85, 'POLITOED', None, ['RAIN_DANCE', 'SURF', 'HYPNOSIS', 'BODY_SLAM']),
                 (85, 'NINETALES', None, ['SUNNY_DAY', 'FLAMETHROWER', 'CONFUSE_RAY', 'QUICK_ATTACK']),
                 (85, 'SANDSLASH', None, ['SANDSTORM', 'SLASH', 'EARTHQUAKE', 'DEFENSE_CURL'])],
        actions=[('move', 0), ('move', 3), ('move', 3), ('switch', 1), ('move', 0), ('move', 1), ('move', 2),
                 ('switch', 2), ('move', 0), ('move', 1), ('move', 2), ('move', 1)] + [('move', 1)] * 6),
    'multiturn': dict(  # charge moves, recharge, rampage + confusion, Rollout, Bide, trapping, Rage
        options=0x01 | SCENE_OFF, cls='COOLTRAINERM',
        party=[('CHARIZARD', 100, None, ['FLY', 'HYPER_BEAM', 'OUTRAGE', 'FIRE_SPIN']),
               ('GOLEM', 100, None, ['ROLLOUT', 'DIG', 'BIDE', 'DEFENSE_CURL'])],
        trainer=[(85, 'SNORLAX', None, ['SOLARBEAM', 'THRASH', 'REST', 'BIDE']),
                 (85, 'DRAGONITE', None, ['SKY_ATTACK', 'RAZOR_WIND', 'WRAP', 'HYPER_BEAM']),
                 (85, 'SKARMORY', None, ['RAGE', 'FLY', 'STEEL_WING', 'WHIRLWIND'])],
        actions=[('move', 0), ('move', 1), ('move', 2), ('move', 3), ('switch', 1), ('move', 0),
                 ('move', 2), ('move', 3), ('move', 1)] + [('move', 0)] * 8),
    'residual': dict(  # Toxic, Leech Seed, burn, Nightmare, Curse, Future Sight, Perish Song, Leftovers, Spikes
        options=0x01 | SCENE_OFF, cls='COOLTRAINERM',
        party=[('GENGAR', 100, 'LEFTOVERS', ['HYPNOSIS', 'NIGHTMARE', 'CURSE', 'PERISH_SONG']),
               ('ALAKAZAM', 100, None, ['FUTURE_SIGHT', 'PSYCHIC_M', 'RECOVER', 'REFLECT']),
               ('CLOYSTER', 100, None, ['SPIKES', 'TOXIC', 'SURF', 'PROTECT'])],
        trainer=[(85, 'VENUSAUR', 'LEFTOVERS', ['LEECH_SEED', 'TOXIC', 'RAZOR_LEAF', 'SLEEP_POWDER']),
                 (85, 'RAPIDASH', None, ['WILLOWISP', 'FIRE_SPIN', 'STOMP', 'AGILITY']),
                 (85, 'MUK', 'LEFTOVERS', ['TOXIC', 'SLUDGE_BOMB', 'MINIMIZE', 'PROTECT'])],
        actions=[('switch', 2), ('move', 0), ('move', 1), ('switch', 0), ('move', 0), ('move', 1), ('move', 2),
                 ('switch', 1), ('move', 0), ('move', 1), ('switch', 0), ('move', 3)] + [('move', 0)] * 8),
    'screens': dict(  # Reflect, Light Screen, Safeguard, Mist, Spikes on both sides, Roar/Whirlwind
        options=0x01 | SCENE_OFF | SET_STYLE, cls='COOLTRAINERM',
        party=[('STARMIE', 100, None, ['REFLECT', 'LIGHT_SCREEN', 'RAPID_SPIN', 'SURF']),
               ('ARCANINE', 100, None, ['ROAR', 'SAFEGUARD', 'FLAMETHROWER', 'EXTREMESPEED']),
               ('FORRETRESS', 100, None, ['SPIKES', 'EXPLOSION', 'RAPID_SPIN', 'PROTECT'])],
        trainer=[(85, 'SKARMORY', None, ['SPIKES', 'WHIRLWIND', 'DRILL_PECK', 'TOXIC']),
                 (85, 'JYNX', None, ['LIGHT_SCREEN', 'LOVELY_KISS', 'ICE_BEAM', 'MIST']),
                 (85, 'MACHAMP', None, ['REFLECT', 'CROSS_CHOP', 'ROCK_SLIDE', 'SCARY_FACE'])],
        actions=[('switch', 2), ('move', 0), ('move', 0), ('switch', 0), ('move', 0), ('move', 1), ('move', 3),
                 ('switch', 1), ('move', 0), ('move', 1), ('move', 2), ('switch', 2), ('move', 2), ('move', 1)] + [('move', 2)] * 8),
    'switching': dict(  # Baton Pass, Substitute, Pursuit on a switch, Mean Look, AI switching (SWITCH_OFTEN)
        options=0x01 | SCENE_OFF, cls='SCHOOLBOY',
        party=[('JOLTEON', 100, None, ['BATON_PASS', 'SUBSTITUTE', 'AGILITY', 'THUNDERBOLT']),
               ('UMBREON', 100, None, ['MEAN_LOOK', 'PURSUIT', 'BATON_PASS', 'CONFUSE_RAY']),
               ('GOLEM', 100, None, ['EARTHQUAKE', 'ROCK_SLIDE', 'EXPLOSION', 'CURSE'])],
        trainer=[(85, 'GYARADOS', None, ['SURF', 'BITE', 'DRAGON_DANCE', 'THRASH']),
                 (85, 'TYRANITAR', None, ['PURSUIT', 'CRUNCH', 'EARTHQUAKE', 'ROCK_SLIDE']),
                 (85, 'ESPEON', None, ['PSYCHIC_M', 'BATON_PASS', 'CALM_MIND', 'MORNING_SUN'])],
        actions=[('move', 2), ('move', 1), ('move', 0), ('move', 3), ('switch', 1), ('move', 0), ('move', 2),
                 ('move', 3), ('switch', 2), ('move', 0), ('move', 1)] + [('move', 0)] * 8,
        replace=[2, 1, 0]),
    'special': dict(  # Counter, Mirror Coat, Destiny Bond, Encore, Disable, Transform, Mimic, Present, Beat Up, Thief, Endure
        options=0x01 | SCENE_OFF, cls='COOLTRAINERM',
        party=[('WOBBUFFET', 100, None, ['COUNTER', 'MIRROR_COAT', 'ENCORE', 'DESTINY_BOND']),
               ('DITTO', 100, None, ['TRANSFORM']),
               ('MISDREAVUS', 100, None, ['MIMIC', 'DISABLE', 'THIEF', 'PERISH_SONG'])],
        trainer=[(85, 'HITMONLEE', 'FOCUS_BAND', ['HI_JUMP_KICK', 'ENDURE', 'REVERSAL', 'MEDITATE']),
                 (85, 'DELIBIRD', None, ['PRESENT', 'ICE_BEAM', 'PROTECT', 'SWAGGER']),
                 (85, 'HOUNDOOM', 'KINGS_ROCK', ['BEAT_UP', 'CRUNCH', 'FLAMETHROWER', 'COUNTER'])],
        actions=[('move', 0), ('move', 2), ('move', 1), ('switch', 2), ('move', 1), ('move', 0), ('move', 2),
                 ('switch', 1), ('move', 0), ('move', 0), ('move', 1), ('move', 2)] + [('move', 0)] * 8,
        replace=[2, 1]),
    'held_items': dict(  # berries, Quick Claw, Bright Powder, Full Heal/Max Potion by the trainer, player status items
        options=0x01 | SCENE_OFF, cls='BLAINE',
        party=[('NIDOKING', 100, 'QUICK_CLAW', ['EARTHQUAKE', 'TOXIC', 'THUNDER_WAVE', 'ICE_BEAM']),
               ('SNORLAX', 100, 'MIRACLEBERRY', ['BODY_SLAM', 'REST', 'SLEEP_TALK', 'SNORE'])],
        items=[('FULL_HEAL', 2), ('HYPER_POTION', 2), ('X_SPEED', 1)],
        trainer=[(85, 'MAGMAR', 'BRIGHTPOWDER', ['FIRE_PUNCH', 'CONFUSE_RAY', 'SMOG', 'THUNDERPUNCH']),
                 (85, 'ARCANINE', 'MINT_BERRY', ['FLAMETHROWER', 'REST', 'EXTREMESPEED', 'ROAR']),
                 (85, 'RAPIDASH', 'PRZCUREBERRY', ['FIRE_BLAST', 'STOMP', 'AGILITY', 'DOUBLE_KICK'])],
        actions=[('move', 1), ('move', 2), ('item', 'X_SPEED'), ('move', 0), ('switch', 1), ('move', 1), ('move', 2),
                 ('move', 3), ('item', 'HYPER_POTION', 1), ('item', 'FULL_HEAL', 1), ('move', 0)] + [('move', 0)] * 8),
    'hp_berries': dict(  # held HP berries on both sides (HandleHPHealingItem's HP bar), added in phase 1 install C
        options=0x01 | SCENE_OFF, cls='COOLTRAINERM',
        party=[('SNORLAX', 70, 'GOLD_BERRY', ['BODY_SLAM', 'DEFENSE_CURL']), ('CHANSEY', 60, 'BERRY', ['POUND'])],
        trainer=[(55, 'MACHAMP', 'GOLD_BERRY', ['KARATE_CHOP', 'LEER']), (55, 'GOLEM', 'BERRY', ['TACKLE', 'DEFENSE_CURL'])],
        actions=[('move', 0)] * 4 + [('switch', 1)] + [('move', 0)] * 12, replace=[1]),
    'abilities': dict(  # entrance weather/Intimidate on both sides, contact abilities, Speed Boost-like end-of-turn
        options=0x01 | SCENE_OFF, cls='COOLTRAINERM',
        abilities={'GYARADOS': 'ABILITY_INTIMIDATE', 'POLITOED': 'ABILITY_DRIZZLE', 'TYRANITAR': 'ABILITY_SAND_STREAM',
                   'MAGNETON': 'ABILITY_STATIC', 'NINETALES': 'ABILITY_DROUGHT', 'KINGDRA': 'ABILITY_SWIFT_SWIM',
                   'BLISSEY': 'ABILITY_REGENERATION'},
        party=[('GYARADOS', 100, None, ['WATERFALL', 'BITE', 'DRAGON_DANCE', 'THRASH']),
               ('TYRANITAR', 100, None, ['CRUNCH', 'ROCK_SLIDE', 'EARTHQUAKE', 'PROTECT']),
               ('NINETALES', 100, None, ['FLAMETHROWER', 'SOLARBEAM', 'CONFUSE_RAY', 'QUICK_ATTACK'])],
        trainer=[(85, 'POLITOED', None, ['SURF', 'HYPNOSIS', 'BODY_SLAM', 'PERISH_SONG']),
                 (85, 'MAGNETON', None, ['THUNDERBOLT', 'THUNDER_WAVE', 'SCREECH', 'TRI_ATTACK']),
                 (85, 'KINGDRA', None, ['SURF', 'DRAGONBREATH', 'AGILITY', 'SMOKESCREEN']),
                 (85, 'BLISSEY', None, ['SOFTBOILED', 'SEISMIC_TOSS', 'TOXIC', 'EGG_BOMB'])],
        actions=[('move', 0), ('switch', 1), ('move', 0), ('move', 1), ('switch', 2), ('move', 0), ('move', 1),
                 ('switch', 0), ('move', 0), ('move', 1), ('move', 3)] + [('move', 0)] * 10),
    'double_faint': dict(  # both sides faint at once, twice, and both replace (DoubleSwitch):
        # the player's Explosion goes through HandleEnemyMonFaint, the enemy's through HandlePlayerMonFaint
        options=0x01 | SCENE_OFF, cls='COOLTRAINERM',
        party=[('ELECTRODE', 50, None, ['EXPLOSION']), ('ABRA', 30, None, ['TACKLE']), ('MACHAMP', 60, None, ['CROSS_CHOP'])],
        trainer=[(30, 'PIKACHU', None, ['THUNDERSHOCK']), (60, 'ELECTRODE', None, ['EXPLOSION']), (20, 'RATTATA', None, ['TACKLE'])],
        actions=[('move', 0), ('move', 0), ('move', 0)], replace=[1, 2]),
    'moved_effects': dict(  # effects moved to another bank in step 7 that the other cases miss:
        # Sketch (fails, then works), Spite, Pain Split, Conversion, Conversion2, both sides
        options=0x01 | SCENE_OFF, cls='COOLTRAINERM',
        party=[('MISDREAVUS', 100, None, ['SKETCH', 'SPITE', 'PAIN_SPLIT', 'CONVERSION']),  # givepokemove keeps the old PP: use mons with 4 learned moves
               ('PORYGON2', 100, None, ['CONVERSION2', 'TRI_ATTACK', 'RECOVER', 'SKETCH'])],
        trainer=[(85, 'MISDREAVUS', None, ['PAIN_SPLIT', 'SPITE', 'PSYWAVE', 'CONFUSE_RAY']),
                 (85, 'PORYGON', None, ['CONVERSION', 'CONVERSION2', 'TRI_ATTACK', 'RECOVER']),
                 (85, 'SMEARGLE', None, ['SKETCH', 'SPITE', 'TACKLE', 'SPORE'])],
        actions=[('move', 0), ('move', 0), ('move', 2), ('move', 3), ('move', 2), ('move', 3), ('move', 1),
                 ('move', 2), ('move', 3), ('switch', 1), ('move', 0), ('move', 3), ('move', 1)] + [('move', 1)] * 10),
    # wild battles: the battle ends when the wild mon faints; "Use next Pokemon?"; EXP after a catch
    'wild_win': dict(  # switch so two mons take part, a third gets the half EXP of non-participants
        wild=('GRAVELER', 30),
        party=[('MACHOP', 28, None, ['KARATE_CHOP', 'LEER']), ('POLIWHIRL', 29, None, ['WATER_GUN', 'HYPNOSIS']),
               ('PIDGEOTTO', 27, None, ['GUST'])],
        actions=[('move', 1), ('switch', 1), ('move', 0), ('move', 0), ('move', 0)]),
    'wild_faint': dict(  # the lead faints: Yes to "Use next Pokemon?", then win
        wild=('ARCANINE', 40),
        party=[('CATERPIE', 12, None, ['TACKLE']), ('GYARADOS', 45, None, ['SURF', 'BITE'])],
        actions=[('move', 0)], shift=[True]),
    'wild_flee': dict(  # the lead faints: No to "Use next Pokemon?", so the player runs
        wild=('RATICATE', 30),
        party=[('WEEDLE', 8, None, ['POISON_STING']), ('JOLTEON', 50, None, ['THUNDERBOLT'])],
        actions=[('move', 0)], shift=[False, False, False, False]),
    'wild_escape': dict(  # the fast lead explodes and faints; No to "Use next Pokemon?" and the escape works
        wild=('GOLEM', 40),
        party=[('ELECTRODE', 30, None, ['EXPLOSION']), ('MACHAMP', 50, None, ['CROSS_CHOP'])],
        actions=[('move', 0)], shift=[False, False]),
    'wild_runs_first': dict(  # Raikou always flees: faster, so before the AI's decision
        wild=('RAIKOU', 60),
        party=[('SLOWPOKE', 10, None, ['TACKLE'])],
        actions=[('move', 0)]),
    'wild_runs_second': dict(  # slower: the player moves first, then it flees
        wild=('RAIKOU', 10),
        party=[('JOLTEON', 60, None, ['GROWL'])],
        actions=[('move', 0)]),
    'wild_catch': dict(  # False Swipe, then a Master Ball: EXP after the catch, no nickname
        wild=('SNORLAX', 30),
        party=[('SCYTHER', 35, None, ['FALSE_SWIPE', 'QUICK_ATTACK']), ('ABRA', 20, None, ['TELEPORT'])],
        items=[('MASTER_BALL', 1)],
        actions=[('move', 0), ('ball',)], shift=[False]),
}


SINGLES_CASES = list(CASES)  # the baseline corpus; doubles cases (test_doubles.py) are run by name


def set_abilities(g, abilities):
    names = [re.match(r'\tabilities (\w+),', l).group(1)
             for l in open(f'{CSE}/data/abilities/species_abilities.asm') if l.startswith('\tabilities ')]
    base = g.rom_addr('SpeciesAbilities1')
    for sp, ab in abilities.items():
        g.poke_rom(base + 3 * names.index(sp), [g.const(ab), 0, 0])


def run_case(rom, sym, state, name):
    c = CASES[name]
    g = Game(rom, sym, state)
    g.seed()  # before the party too: givepoke rolls DVs, and the boot state's RNG differs per build
    if c.get('abilities'):
        set_abilities(g, c['abilities'])
    g.clear_bag()
    g.set_party(c['party'], c.get('items', ()))
    g.seed()
    if c.get('wild'):
        g.start_wild(*c['wild'], c.get('options', 0x01 | SCENE_OFF))
    else:
        g.set_trainer(c['cls'], name.replace('_', ' ')[:10].title(), c['trainer'], doubles=c.get('doubles', False))
        g.seed()
        g.start_battle(c['cls'], c.get('options', 0x01 | SCENE_OFF))
    b = Battle(g, c['actions'], c.get('replace', ()), c.get('shift', ()))
    return b.run()


def _worker(args):
    rom, sym, state, name = args
    try:
        return name, run_case(rom, sym, state, name)
    except Exception as e:  # report and keep going
        return name, [{'error': f'{type(e).__name__}: {e}'}]


# ---------------------------------------------------------------- compare
def norm_log(log):
    """Drop entries that are part of a longer message at the same menu: frames caught while the
    text scrolls or is cleared depend on timing, so they differ between builds."""
    out = [m for m in log if not any(m != o and m in o for o in log)]
    return [m for i, m in enumerate(out) if i == 0 or out[i - 1] != m]


def mask_caught_time(recs, sym):
    """Clear the time-of-day bits of each party mon's caught level: givepoke stores the boot
    state's clock time there, so it differs between states booted at different times."""
    size = sym['wPartyMon2'][1] - sym['wPartyMon1'][1]
    off = sym['wPartyMon1CaughtLevel'][1] - sym['wPartyMon1'][1]
    for r in recs.values():
        for x in r:
            for k in ('wPartyMons', 'wOTPartyMons'):
                if k in x:
                    for j in range(off, len(x[k]), size):
                        x[k][j] &= 0x3F


def compare(a, b, sym, limit=12):
    """Print the differences between two record files. Returns the number of differing cases."""
    bad = 0
    mask_caught_time(a, sym)
    mask_caught_time(b, sym)
    for name in sorted(set(a) | set(b)):
        ra, rb = a.get(name), b.get(name)
        out = []
        if ra is None or rb is None:
            out.append('missing in one file')
        else:
            if len(ra) != len(rb):
                out.append(f'{len(ra)} vs {len(rb)} records')
            for i, (x, y) in enumerate(zip(ra, rb)):
                for k in sorted(set(x) | set(y)):
                    if x.get(k) == y.get(k):
                        continue
                    if k == 'log' and norm_log(x.get(k) or []) == norm_log(y.get(k) or []):
                        continue
                    if isinstance(x.get(k), list) and isinstance(y.get(k), list) and k != 'log' and k != 'action':
                        diffs = [j for j in range(max(len(x[k]), len(y[k])))
                                 if (x[k][j] if j < len(x[k]) else None) != (y[k][j] if j < len(y[k]) else None)]
                        desc = ', '.join(f'{label_for(sym, k, j)}: {x[k][j] if j < len(x[k]) else "-"} -> {y[k][j] if j < len(y[k]) else "-"}'
                                         for j in diffs[:6])
                        out.append(f'menu {i} {k}: {len(diffs)} bytes: {desc}')
                    else:
                        out.append(f'menu {i} {k}: {x.get(k)!r:.150} -> {y.get(k)!r:.150}')
                if len(out) >= limit:
                    break
        if out:
            bad += 1
            print(f'--- {name}')
            for l in out[:limit]:
                print('   ', l)
        else:
            print(f'same {name} ({len(ra)} records)')
    return bad


def main():
    from multiprocessing import Pool
    from gb import Sym
    if sys.argv[1] == 'record':
        rom, sym, state, out = sys.argv[2:6]
        names = sys.argv[6:] or SINGLES_CASES
        with Pool(min(len(names), os.cpu_count() or 4)) as p:
            res = dict(p.map(_worker, [(rom, sym, state, n) for n in names]))
        sy = Sym(sym)
        for n in names:
            r = res[n]
            print(f'{n}: ' + (r[0]['error'] if 'error' in r[0] else f'{len(r)} records, result {r[-1].get("result")}'))
            if 'error' not in r[0]:
                for pr in check_slots(r, rom, sy):
                    print('  SLOT MISMATCH', pr)
        json.dump(res, open(out, 'w'))
    elif sys.argv[1] == 'slots':  # slots ROM SYM records.json: the party/slot check on saved records
        rom, sy, recs = sys.argv[2], Sym(sys.argv[3]), json.load(open(sys.argv[4]))
        bad = 0
        for n, r in recs.items():
            pr = check_slots(r, rom, sy) if 'error' not in r[0] else []
            print(f'{n}: ' + ('ok' if not pr else f'{len(pr)} mismatches'))
            for x in pr[:8]:
                print('   ', x)
            bad += bool(pr)
        sys.exit(1 if bad else 0)
    elif sys.argv[1] == 'check':
        sys.exit(0 if check_swap_list(sys.argv[2], sys.argv[3]) else 1)
    elif sys.argv[1] == 'compare':
        a, b = json.load(open(sys.argv[2])), json.load(open(sys.argv[3]))
        sym = Sym(sys.argv[4])
        sys.exit(1 if compare(a, b, sym) else 0)



# ---------------------------------------------------------------- swap-list check
# wBattle variables that are NOT per-battler, so BattlerSwapList leaves them out.
SHARED = {
    'wHiddenPowerPaletteMon': 'temp while loading a pic palette',
    'wWildMon': 'wild battle (ball and catch)',
    'wEnemyTrainerItem1': 'trainer', 'wEnemyTrainerItem2': 'trainer', 'wEnemyTrainerBaseReward': 'trainer',
    'wEnemyTrainerAIFlags': 'trainer', 'wOTClassName': 'trainer',
    'wTypeModifier': 'per action', 'wCriticalHit': 'per action', 'wAttackMissed': 'per action',
    'wBattleReward': 'battle', 'wBattleAnimParam': 'per action', 'wBattleScriptBuffer': 'per action',
    'wBattleScriptBufferAddress': 'per action', 'wTurnEnded': 'per action', 'wIsConfusionDamage': 'per action',
    'wUnusedPlayerLockedMove': 'unused', 'wLinkBattleRNCount': 'link', 'wPayDayMoney': 'battle',
    'wAlreadyDisobeyed': 'per action', 'wWhichMonFaintedFirst': 'per turn', 'wAlreadyFailed': 'per action',
    'wBattleLowHealthAlarm': 'HUD', 'wPlayerScreens': 'side (step 6)', 'wEnemyScreens': 'side (step 6)',
    'wPlayerSafeguardCount': 'side', 'wPlayerLightScreenCount': 'side', 'wPlayerReflectCount': 'side',
    'wEnemySafeguardCount': 'side', 'wEnemyLightScreenCount': 'side', 'wEnemyReflectCount': 'side',
    'wBattleWeather': 'field', 'wWeatherCount': 'field', 'wLoweredStat': 'per action',
    'wEffectFailed': 'per action', 'wFailedMessage': 'per action', 'wEnemyGoesFirst': 'turn order (step 4)',
    'wTempLevel': 'temp', 'wGivingExperienceToExpShareHolders': 'EXP routine',
    'wBeatUpHitAtLeastOnce': 'per action', 'wBattleEnded': 'battle', 'wWildMonMoves': 'wild battle',
    'wWildMonPP': 'wild battle', 'wAmuletCoin': 'battle', 'wSomeoneIsRampaging': 'per action (cleared in DoTurn)',
    'wAbilitySlotOverride': 'Pokemon creation, not battle', 'wBattleMode': 'battle',
    # unnamed padding after a variable
    'wWildMon+1': 'padding', 'wPlayerTurnsTaken+1': 'padding', 'wUnusedPlayerLockedMove+1': 'padding', 'wEnemyItemState+1': 'padding', 'wEnemyItemState+2': 'padding',
    'wPayDayMoney+3': 'padding', 'wEnemyReflectCount+1': 'padding',
}
# per-battler variables outside wBattle that the list must cover
OUTSIDE = [('wCurBattleMon', 1), ('wCurMoveNum', 1), ('wTempEnemyMonSpecies', 'wBattleMode')]


def battle_block_labels():
    """(name, offset-from-wBattle) for labels declared in the wBattle block, in order."""
    out, inside = [], False
    for l in open(f'{CSE}/ram/wram.asm', encoding='latin-1'):
        m = re.match(r'(w\w+)::', l)
        if m:
            if m.group(1) == 'wBattle': inside = True
            if m.group(1) == 'wBattleEnd': break
            if inside: out.append(m.group(1))
    return out


def check_swap_list(rom_path, sym_path):
    from gb import Sym
    sym = Sym(sym_path)
    rom = open(rom_path, 'rb').read()
    b, a = sym['BattlerSwapList']
    p = b * 0x4000 + a - 0x4000
    entries = []
    while rom[p]:
        entries.append((rom[p], rom[p + 1] | rom[p + 2] << 8, rom[p + 3] | rom[p + 4] << 8)); p += 5
    # labels by address (WRAM0, and WRAMX bank 1)
    def key(name):
        bk, ad = sym[name]
        return (bk if ad >= 0xD000 else 0, ad)
    at = {}
    battle = set(battle_block_labels())
    for name, (bk, ad) in sym.d.items():
        if '.' in name or not (0xC000 <= ad < 0xE000): continue
        if 0xC000 <= ad < 0xD000 and sym['wBattle'][1] <= ad < sym['wBattleEnd'][1] \
                and not any(name.startswith(x) for x in battle): continue  # union members; keep struct fields
        k = (bk if ad >= 0xD000 else 0, ad)
        if ad >= 0xD000 and bk != 1: continue
        at.setdefault(k, []).append(name)
    def k_of(addr):
        return (1 if addr >= 0xD000 else 0, addr)
    covered = {}
    problems = []
    def owner_listed(owner):
        return k_of(owner[1]) in covered
    norm = lambda n: re.sub(r'Player|Enemy|Battle|OT', '', n)
    for size, pa, ea in entries:
        for base in (pa, ea):
            if not base: continue
            if k_of(base) not in at:
                problems.append(f'entry at {base:#x} does not start at a label')
            for i in range(size):
                kk = k_of(base + i)
                if kk in covered:
                    problems.append(f'{base + i:#x} listed twice')
                covered[kk] = base
        if pa and ea:
            for i in range(size):
                x, y = at.get(k_of(pa + i)), at.get(k_of(ea + i))
                if x is None and y is None: continue
                nx, ny = {norm(n) for n in x or []}, {norm(n) for n in y or []}
                if not (nx & ny):
                    problems.append(f'pair mismatch at +{i}: {x} vs {y}')
    # every byte of the checked regions: covered, or its owner label is SHARED
    regions = [(k_of(sym['wBattle'][1]), sym['wBattleEnd'][1] - sym['wBattle'][1])]
    for name, n in OUTSIDE:
        start = key(name)
        size = n if isinstance(n, int) else key(n)[1] - start[1] + 1
        regions.append((start, size))
    listed = {n for kk in covered for n in at.get(kk, [])}
    for (bk, start), size in regions:
        owner = None
        for ad in range(start, start + size):
            kk = (bk, ad)
            if kk in at:
                owner = (sorted(at[kk], key=len)[-1], ad)
            if kk in covered:
                continue
            name = owner[0] if ad == owner[1] else f'{owner[0]}+{ad - owner[1]}'
            names = at.get(kk, []) if ad == owner[1] else [name]
            # inside a shared variable is fine; padding after a listed one must be named "var+N"
            if owner[1] not in [c for c in covered.values()] and not owner_listed(owner):
                names = names + [owner[0]]
            if not any(n in SHARED for n in names):
                problems.append(f'{ad:#x} {name} is neither in BattlerSwapList nor SHARED')
    for n in SHARED:
        if n in listed:
            problems.append(f'{n} is in SHARED but also listed')
    total = sum(e[0] for e in entries)
    print(f'BattlerSwapList: {len(entries)} entries, {total} bytes per slot')
    for pr in problems:
        print('PROBLEM', pr)
    return not problems


if __name__ == '__main__':
    main()
