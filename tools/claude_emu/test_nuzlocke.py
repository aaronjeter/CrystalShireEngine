"""Nuzlocke mode (engine/events/nuzlocke.asm): one case per rule.

Each battle case boots the overworld state, gives a party and a bag, turns Nuzlocke mode
on (wOptions2 bit NUZLOCKE_ON) and starts a wild battle with a script. It reads
wNuzlockeEncounter and the area flags at the first battle menu, then optionally throws a
ball and checks the messages. The last cases use the Pack outside battle, the options
menu and a new game from start_save.bin.

usage: test_nuzlocke.py ROM SYM STATE
"""
import sys
import ctypes as C
from gb import LIB
from battle_test import Game, Battle, SCENE_OFF, assemble_block, SCRIPT_ORG
from harness import at_menu

ROM, SYM, STATE = sys.argv[1:4]
NUZLOCKE_ON = 1 << 4
CATCHABLE = 3  # NUZLOCKE_CATCHABLE
BALL_TILE = 0x5d  # the HUD's Poké Ball tile
PARTY = [('SCYTHER', 40, None, ['FALSE_SWIPE']), ('ABRA', 20, None, ['TELEPORT'])]


def area_bits(g):
    """(area flag bytes, the 8 event flag bytes holding EVENT_NUZLOCKE_AREA_96..+63)."""
    ev = const16(g, 'EVENT_NUZLOCKE_AREA_96')
    assert ev % 8 == 0
    return list(g.rd('wNuzlockeAreaFlags', 12)), list(g.rd(f'wEventFlags+{ev // 8}', 8))


def set_bits(nbytes):
    return [i * 8 + b for i, x in enumerate(nbytes) for b in range(8) if x >> b & 1]


def const16(g, expr):
    lo, hi = assemble_block(f'\tdw {expr}', 0, SCRIPT_ORG)[:2]
    return lo | hi << 8


def setup(nz=True, party=PARTY, items=(('POKE_BALL', 5),), pre=None):
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.clear_bag()
    g.set_party(party, items)
    if nz:
        g.wr('wOptions2', g.rd('wOptions2') | NUZLOCKE_ON)
    if pre:
        pre(g)
    g.seed()
    return g


def start(g, species, level, battletype=None, mapc=None):
    g.wr('wWildLevel', 0)
    g.wr('wOptions', 0x01 | SCENE_OFF)
    if mapc:
        g.wr('wMapGroup', g.const(f'GROUP_{mapc}')); g.wr('wMapNumber', g.const(f'MAP_{mapc}'))
    bt = f'\tloadvar VAR_BATTLETYPE, {battletype}\n' if battletype else ''
    g.run_script(f'TestScript:\n{bt}\tloadwildmon {species}, {level}\n\tstartbattle\n\treloadmapafterbattle\n\tend')
    for _ in range(3000):
        g.frames(2)
        if g.in_battle() and at_menu(g):
            g.frames(60)
            return g.rd('wNuzlockeEncounter')
        if g.in_battle():
            g.press('B', hold=2, after=2)
    raise RuntimeError('no battle menu:\n' + g.screen_text())


def throw(g):
    """One ball from the battle menu; returns (message log, the ball count where it stops:
    back at the battle menu, at the naming screen or after the battle)."""
    b = Battle(g, [('ball',)])
    b.at_menu()
    log = []
    for _ in range(400):
        g.frames(4)
        t = g.screen_text()
        log.append(t)
        if not g.in_battle() or at_menu(g):
            break
        if naming_screen(g):
            break
        g.press('B', hold=2, after=2)
    msgs = []
    for t in log:
        m = ' '.join(x.strip() for x in t.split('\n')[12:18] if x.strip())
        if m and (not msgs or msgs[-1] != m):
            msgs.append(m)
    n = g.rd('wNumBalls')
    return msgs, (g.rd('wBalls', 2)[1] if n else 0)


def naming_screen(g):
    """The naming screen's keyboard (its "DEL"/"END" row)."""
    t = g.screen_text()
    return 'DEL' in t and 'END' in t


RESULTS = []


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def case_first():
    g = setup()
    a0 = area_bits(g)
    enc = start(g, 'RATTATA', 3)
    a1 = area_bits(g)
    new = set_bits(a1[0]), set_bits(a1[1])
    check('first encounter: catchable', enc == CATCHABLE, f'enc={enc}')
    check('first encounter: ball icon right of the HUD', g.rd(0xC4A0 + 20 + 10) == BALL_TILE)
    check('first encounter: one area bit set', set_bits(a0[0]) == [] and len(new[0]) == 1 and new[1] == [], str(new))
    msgs, left = throw_until_caught(g)
    check('first encounter: catch opens the naming screen', naming_screen(g), msgs[-1:] and msgs[-1][:60])
    finish_naming(g)
    balls = g.rd('wBalls', 2)[1] if g.rd('wNumBalls') else 0
    check('first encounter: ball used', balls < 5, f'balls={balls}')
    nick = g.rd(f'wPartyMonNicknames+{2 * 11}', 2)
    check('first encounter: the typed nickname is kept', g.rd('wPartyCount') == 3 and nick[0] == 0x80 and nick[1] == 0x50,
          f'count={g.rd("wPartyCount")} nick={list(nick)}')
    return new[0][0]


def finish_naming(g):
    """Type "A" on the naming screen, END, then press B until the battle is over."""
    g.frames(60)
    g.press('A', after=8)
    g.press('START', after=8); g.press('A', after=8)
    for _ in range(300):
        g.frames(4)
        if not g.in_battle():
            break
        g.press('B', hold=2, after=2)


def throw_until_caught(g):
    msgs, left = [], None
    for _ in range(10):
        m, left = throw(g)
        msgs += m
        if naming_screen(g) or not g.in_battle():
            break
    return msgs, left


def case_second(area):
    def pre(g):
        a = g.sym['wNuzlockeAreaFlags'][1]
        g.wr(a + area // 8, 1 << (area % 8))
    g = setup(pre=pre)
    enc = start(g, 'SENTRET', 3)
    check('second encounter: not catchable (area used)', enc == 1, f'enc={enc}')
    check('second encounter: no ball icon', g.rd(0xC4A0 + 20 + 10) != BALL_TILE)
    msgs, left = throw(g)
    check('second encounter: ball refused with the area message',
          any('catch is already used!' in m for m in msgs), str(msgs[:4]))
    check('second encounter: ball not used up', left == 5, f'left={left}')
    check('second encounter: back at the battle menu', at_menu(g))


def case_dupe():
    g = setup(party=[('PIDGEY', 10, None, ['TACKLE'])] + PARTY[1:])
    a0 = area_bits(g)
    enc = start(g, 'PIDGEOTTO', 18)
    check('dupe: not catchable (family caught)', enc == 2, f'enc={enc}')
    check('dupe: area untouched', area_bits(g) == a0)
    msgs, left = throw(g)
    check('dupe: family message, ball kept', any('family' in m for m in msgs) and left == 5, f'{msgs[:3]} left={left}')


def case_evo_dupe():
    # a caught evolved form blocks its basic stage too (FirstEvoStages)
    g = setup(party=[('PIDGEOT', 40, None, ['TACKLE'])] + PARTY[1:])
    enc = start(g, 'PIDGEY', 5)
    check('dupe: an evolved form blocks the basic stage', enc == 2, f'enc={enc}')


def case_shiny():
    g = setup()
    a0 = area_bits(g)
    enc = start(g, 'RATTATA', 3, 'BATTLETYPE_FORCESHINY')
    dv = g.rd('wEnemyMonDVs', 2)
    check('shiny: catchable, area untouched', enc == CATCHABLE and area_bits(g) == a0, f'enc={enc} dvs={list(dv)}')


def case_shiny_area_used(area):
    def pre(g):
        g.wr(g.sym['wNuzlockeAreaFlags'][1] + area // 8, 1 << (area % 8))
    g = setup(pre=pre)
    enc = start(g, 'RATTATA', 3, 'BATTLETYPE_FORCESHINY')
    check('shiny: catchable even in a used area', enc == CATCHABLE, f'enc={enc}')


def case_legendary(area):
    def pre(g):
        g.wr(g.sym['wNuzlockeAreaFlags'][1] + area // 8, 1 << (area % 8))
    g = setup(pre=pre)
    a0 = area_bits(g)
    enc = start(g, 'RAIKOU', 40)
    check('legendary: catchable in a used area, area untouched', enc == CATCHABLE and area_bits(g) == a0, f'enc={enc}')


def case_no_balls():
    g = setup(items=())
    a0 = area_bits(g)
    enc = start(g, 'RATTATA', 3)
    check('no balls yet: no restriction, area untouched', enc == 0 and area_bits(g) == a0, f'enc={enc}')


def case_off(area):
    def pre(g):
        g.wr(g.sym['wNuzlockeAreaFlags'][1] + area // 8, 1 << (area % 8))
    g = setup(nz=False, pre=pre)
    a0 = area_bits(g)
    enc = start(g, 'RATTATA', 3)
    check('mode off: no rule, area untouched, no ball icon', enc == 0 and area_bits(g) == a0
          and g.rd(0xC4A0 + 20 + 10) != BALL_TILE, f'enc={enc}')
    msgs, left = throw_until_caught(g)
    t = '\n'.join(msgs)
    check('mode off: "Give a nickname?" asked (no forced naming)', 'nickname' in t.lower(), msgs[-2:])


def case_hoenn():
    g = setup()
    a0 = area_bits(g)
    enc = start(g, 'ZIGZAGOON', 3, mapc='ROUTE_101')
    a1 = area_bits(g)
    want = g.const('LANDMARK_ROUTE_101') - 96
    check('landmark >= 96: event flag path', enc == CATCHABLE and a1[0] == a0[0] and set_bits(a1[1]) == [want],
          f'enc={enc} ev={set_bits(a1[1])} want={want}')


def case_hoenn_used():
    def pre(g):
        ev = const16(g, 'EVENT_NUZLOCKE_AREA_96') + g.const('LANDMARK_ROUTE_101') - 96
        a = g.sym['wEventFlags'][1] + ev // 8
        g.wr(a, g.rd(a) | 1 << (ev % 8))
    g = setup(pre=pre)
    enc = start(g, 'ZIGZAGOON', 3, mapc='ROUTE_101')
    check('landmark >= 96: used area read from the event flag', enc == 1, f'enc={enc}')


def case_revive():
    g = setup(party=[('SCYTHER', 40, None, ['FALSE_SWIPE']), ('ABRA', 20, None, ['TELEPORT'])],
              items=(('REVIVE', 2), ('POKE_BALL', 5)))
    hp = g.sym['wPartyMon2HP'][1]
    g.wr(hp, [0, 0])
    enc = start(g, 'RATTATA', 3)
    b = Battle(g, [('item', 'REVIVE', 1)])
    b.at_menu()
    msgs = []
    for _ in range(200):
        g.frames(4)
        m = ' '.join(x.strip() for x in g.screen_text().split('\n')[12:18] if x.strip())
        if m and (not msgs or msgs[-1] != m):
            msgs.append(m)
        if 'effect' in m:
            break
    n = g.rd('wNumItems')
    items = g.rd('wItems', 3 * n)
    revives = [items[3 * i + 2] for i in range(n) if (items[3 * i], items[3 * i + 1]) ==
               (g.const('HIGH(REVIVE)'), g.const('LOW(REVIVE)'))]
    check('revive: refused on a fainted mon', any('effect' in m for m in msgs) and g.rd(hp, 2) == [0, 0]
          and revives == [2], f'{msgs[-2:]} hp={list(g.rd(hp, 2))} revives={revives}')


def case_sacred_ash():
    """Sacred Ash (used from the Pack outside battle) is refused while Nuzlocke is on."""
    out = {}
    for nz in (True, False):
        g = setup(nz=nz, items=(('SACRED_ASH', 1),))
        hp = g.sym['wPartyMon2HP'][1]
        g.wr(hp, [0, 0])
        g.frames(30); g.press('START', after=30)
        g.press('D', after=6); g.press('D', after=6); g.press('A', after=60)   # Pack
        g.press('A', after=30); g.press('A', after=200)                       # Sacred Ash, Use
        out[nz] = list(g.rd(hp, 2))
    check('sacred ash: refused when on, revives when off', out[True] == [0, 0] and out[False] != [0, 0], str(out))


def sram(g, sym, n, data=None):
    """Read (or write) n bytes of cartridge RAM at a symbol."""
    b, a = g.sym[sym]
    size = C.c_size_t(); bank = C.c_uint16()
    p = LIB.GB_get_direct_access(g.gb, 2, C.byref(size), C.byref(bank))
    arr = (C.c_uint8 * size.value).from_address(p)
    o = b * 0x2000 + a - 0xA000
    if data is not None:
        for i, x in enumerate(data):
            arr[o + i] = x
    return list(arr[o:o + n])


def trainer_battle(g, mons, actions, replace=(), doubles=False, battletype='BATTLETYPE_NORMAL'):
    """A trainer battle started like a map script's: startbattle, then reloadmapafterbattle."""
    g.set_trainer('YOUNGSTER', 'Joey', mons, doubles=doubles)
    g.seed()
    g.wr('wBaseLevel', 0)
    g.wr('wOptions', 0x01 | SCENE_OFF)
    g.run_script(f'''TestScript:
	winlosstext .win, .loss
	loadvar VAR_BATTLETYPE, {battletype}
	loadtrainer YOUNGSTER, 1
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
        if g.in_battle():
            break
        g.frames(2)
    b = Battle(g, actions, replace)
    r = b.run()
    return [m for rec in r for m in rec.get('log', [])], r[-1].get('result')


def party_hp(g, i):
    return g.rd16(f'wPartyMon1HP+{i * (g.sym["wPartyMon2"][1] - g.sym["wPartyMon1"][1])}')


def case_bury():
    """A trainer battle: the fainted Weedle goes to box 13 and Caterpie's level-up evolution still
    happens from its new slot."""
    party = [('WEEDLE', 3, None, ['STRING_SHOT']), ('SCYTHER', 60, None, ['WING_ATTACK']),
             ('CATERPIE', 6, None, ['TACKLE'])]
    g = setup(party=party, items=())
    log, res = trainer_battle(g, [(30, 'RATTATA', None, ['HYPER_FANG']), (25, 'RATTATA', None, ['TACKLE'])],
                              [('move', 0)] * 4, replace=[1])
    box = sram(g, 'sNewBox13Entries', 20)
    check('bury: fainted mon laid to rest with a message', 'Weedle was laid to rest.' in log, str(log[-3:]))
    check('bury: party shrinks, box 13 slot 1 used', g.rd('wPartyCount') == 2 and box[0] != 0 and box[1:] == [0] * 19,
          f'count={g.rd("wPartyCount")} box={box[:3]}')
    check('bury: the evolvable flag follows the slot (Caterpie evolves)', 'What? Caterpie is evolving!' in log,
          str(log[-4:]))


def case_can_lose():
    """Battles the player may lose (BATTLETYPE_CANLOSE) don't count: a win heals everyone and buries
    nobody; a loss heals the party and the run goes on."""
    party = [('WEEDLE', 3, None, ['STRING_SHOT']), ('SCYTHER', 60, None, ['WING_ATTACK'])]
    g = setup(party=party, items=())
    log, res = trainer_battle(g, [(30, 'RATTATA', None, ['HYPER_FANG'])], [('move', 0)] * 3, replace=[1],
                              battletype='BATTLETYPE_CANLOSE')
    check('can-lose win: nobody buried, the fainted mon healed', g.rd('wPartyCount') == 2 and party_hp(g, 0) > 0
          and sram(g, 'sNewBox13Entries', 20) == [0] * 20 and not any('laid' in m for m in log), str(log[-2:]))
    g = setup(party=[('WEEDLE', 3, None, ['STRING_SHOT'])], items=())
    log, res = trainer_battle(g, [(30, 'RATTATA', None, ['HYPER_FANG'])], [('move', 0)] * 2,
                              battletype='BATTLETYPE_CANLOSE')
    check('can-lose loss: the run goes on, party healed, nothing buried', g.rd('wOptions2') & NUZLOCKE_ON
          and party_hp(g, 0) > 0 and g.rd('wPartyCount') == 1 and not any('run is over' in m for m in log)
          and sram(g, 'sNewBox13Entries', 20) == [0] * 20, f'{log[-3:]} hp={party_hp(g, 0)}')


def case_bury_off():
    party = [('WEEDLE', 3, None, ['STRING_SHOT']), ('SCYTHER', 60, None, ['WING_ATTACK'])]
    g = setup(nz=False, party=party, items=())
    log, res = trainer_battle(g, [(30, 'RATTATA', None, ['HYPER_FANG'])], [('move', 0)] * 3, replace=[1])
    check('mode off: nobody buried, the fainted mon stays in the party', g.rd('wPartyCount') == 2
          and party_hp(g, 0) == 0 and not any('laid' in m for m in log), str(log[-2:]))


def case_bury_full():
    party = [('WEEDLE', 3, None, ['STRING_SHOT']), ('SCYTHER', 60, None, ['WING_ATTACK'])]
    def pre(g):
        for n in range(13, 16):
            sram(g, f'sNewBox{n}Entries', 20, [1] * 20)
    g = setup(party=party, items=(), pre=pre)
    log, res = trainer_battle(g, [(30, 'RATTATA', None, ['HYPER_FANG'])], [('move', 0)] * 3, replace=[1])
    check('graveyard full: released with a message', g.rd('wPartyCount') == 1 and
          any('released. The graveyard is full.' in m for m in log), str(log[-2:]))


def case_run_over():
    g = setup(party=[('WEEDLE', 3, None, ['STRING_SHOT'])], items=())
    log, res = trainer_battle(g, [(30, 'RATTATA', None, ['HYPER_FANG'])], [('move', 0)] * 2)
    on = g.rd('wOptions2') & NUZLOCKE_ON
    check('loss: "run is over", mode off, nothing buried', any('Nuzlocke run is over!' in m for m in log) and not on
          and sram(g, 'sNewBox13Entries', 20) == [0] * 20 and g.rd('wPartyCount') == 1, f'{log[-3:]} opt2={g.rd("wOptions2")}')


def case_bury_wild_flee():
    party = [('WEEDLE', 3, None, ['STRING_SHOT']), ('JOLTEON', 60, None, ['THUNDERSHOCK'])]
    g = setup(party=party)
    start(g, 'RATICATE', 40)
    b = Battle(g, [('move', 0), ('run',), ('run',), ('run',)], replace=[1])
    r = b.run()
    log = [m for rec in r for m in rec.get('log', [])]
    check('wild battle fled: the fainted mon is buried', g.rd('wPartyCount') == 1 and
          'Weedle was laid to rest.' in log, f'count={g.rd("wPartyCount")} {log[-3:]}')


def case_bury_doubles():
    party = [('WEEDLE', 3, None, ['STRING_SHOT']), ('CATERPIE', 3, None, ['TACKLE']),
             ('SCYTHER', 60, None, ['WING_ATTACK']), ('JOLTEON', 60, None, ['THUNDERSHOCK'])]
    g = setup(party=party, items=())
    log, res = trainer_battle(g, [(40, 'RATTATA', None, ['HYPER_FANG']), (40, 'RATTATA', None, ['HYPER_FANG'])],
                              [('move', 0)] * 12, doubles=True)
    box = sram(g, 'sNewBox13Entries', 20)
    check('doubles: two buried', g.rd('wPartyCount') == 2 and box[0] and box[1] and
          'Weedle was laid to rest.' in log and 'Caterpie was laid to rest.' in log, f'count={g.rd("wPartyCount")} {log[-3:]}')


def case_box_skips_graveyard():
    """With the party full and the current box set to box 13, a catch goes to box 1."""
    party = [('SCYTHER', 60, None, ['FALSE_SWIPE'])] + [('ABRA', 5, None, ['TELEPORT'])] * 5
    def pre(g):
        g.wr('wCurBox', 12)
    g = setup(party=party, items=(('MASTER_BALL', 1),), pre=pre)
    start(g, 'RATTATA', 3)
    throw_until_caught(g)
    finish_naming(g)
    check('catch with a full party skips the graveyard boxes', sram(g, 'sNewBox13Entries', 20) == [0] * 20
          and sram(g, 'sNewBox1Entries', 20)[0] != 0, str(sram(g, 'sNewBox1Entries', 3)))


def open_pc(g, box):
    """Bill's PC (UseBillsPC through callasm) on box `box` (1-based)."""
    g.wr('wCurBox', box - 1)
    b, a = g.sym['UseBillsPC']
    g.run_script(f'TestScript:\n\tdb callasm_command\n\tdb ${b:02x}\n\tdw ${a:04x}\n\tend')
    g.frames(360)


def case_pc():
    """Box 13 holds a buried Weedle. In swap mode: party -> graveyard and graveyard -> party are
    refused with a message; moving inside the graveyard works."""
    party = [('WEEDLE', 3, None, ['STRING_SHOT']), ('SCYTHER', 60, None, ['WING_ATTACK']),
             ('ABRA', 5, None, ['TELEPORT'])]
    g = setup(party=party, items=())
    trainer_battle(g, [(30, 'RATTATA', None, ['HYPER_FANG'])], [('move', 0)] * 3, replace=[1])
    open_pc(g, 13)

    def p(k, n=1):
        for _ in range(n):
            g.press(k, hold=2, after=30)

    def refused():
        ok = 'Graveyard Boxes' in g.screen_text() and 'off limits!' in g.screen_text()
        p('A'); p('B')                      # close the message, put the mon back
        return ok
    p('SEL')                                # swap mode
    p('D', 2); p('L', 2)                    # party slot 1 (Scyther)
    p('A'); p('R', 2); p('U', 2); p('R')    # box 13 slot 2 (empty)
    p('A'); g.frames(30)
    r1 = refused()
    g.wr('wBillsPC_CursorPos', 0x12); p('U'); p('D')   # box 13 slot 1 (Weedle)
    p('A'); p('D', 2); p('L')               # party slot 2
    p('A'); g.frames(30)
    r2 = refused()
    g.wr('wBillsPC_CursorPos', 0x12); p('U'); p('D')
    p('A'); p('R'); p('A'); g.frames(30)    # box 13 slot 1 -> slot 2
    box = sram(g, 'sNewBox13Entries', 3)
    check('PC: party -> graveyard refused', r1 and g.rd('wPartyCount') == 2)
    check('PC: graveyard -> party refused', r2 and g.rd('wPartyCount') == 2)
    check('PC: moving inside the graveyard works', box[0] == 0 and box[1] != 0, str(box))


def case_poison():
    """Overworld poison (every mode) stops at 1 HP and cures the poison, with a message."""
    g = setup(nz=False, items=())
    hp1, st1 = g.sym['wPartyMon1HP'][1], g.sym['wPartyMon1Status'][1]
    hp2, st2 = g.sym['wPartyMon2HP'][1], g.sym['wPartyMon2Status'][1]
    psn = 1 << 3
    g.wr(hp1, [0, 4]); g.wr(st1, psn)
    g.wr(hp2, [0, 1]); g.wr(st2, psn)
    seen = set()
    for i in range(24):
        g.press('L' if (i // 2) % 2 == 0 else 'R', hold=16, after=10)
        for _ in range(20):
            t = ' '.join(x.strip() for x in g.screen_text().split('\n') if x.strip())
            if 'survived' not in t and 'poisoning' not in t:
                break
            seen.add(t)
            g.press('A', after=30)
    msg = any('poisoning!' in t for t in seen)
    check('poison: stops at 1 HP and cures, with a message', g.rd(hp1, 2) == [0, 1] and g.rd(st1) == 0
          and g.rd(hp2, 2) == [0, 1] and g.rd(st2) == 0 and msg, f'{sorted(seen)[:2]}')


def wait_for(g, cond, n=1200):
    for _ in range(n):
        g.frames(2)
        if cond(g.screen_text()):
            return True
    return False


def case_options():
    """Options page 2: Right on "Nuzlocke" asks; No keeps it on, Yes turns it off for good."""
    for ans in ('no', 'yes'):
        g = Game(ROM, SYM, STATE)
        g.wr('wOptions2', g.rd('wOptions2') | NUZLOCKE_ON)
        g.frames(30); g.press('START', after=30)
        for _ in range(6):
            g.press('D', after=6)       # Option
        g.press('A', after=60)
        for _ in range(2):
            g.press('U', after=8)       # Cancel (page 2), then Nuzlocke
        shown = 'Nuzlocke' in g.screen_text() and ':On' in g.screen_text().split('\n')[7]
        g.press('R', after=8)
        asked = wait_for(g, lambda s: 'Yes' in s and 'No' in s and 'for good?' in s)
        g.frames(20)
        if ans == 'no':
            g.press('D', after=8)
        g.press('A', after=8)
        wait_for(g, lambda s: 'Yes' not in s)
        g.frames(30)
        row = g.screen_text().split('\n')[7]
        on = bool(g.rd('wOptions2') & NUZLOCKE_ON)
        if ans == 'no':
            check('options: shows On; Right asks; No keeps it on', shown and asked and on and ':On' in row, row.strip())
        else:
            g.press('R', after=60); g.press('L', after=60)
            row2 = g.screen_text().split('\n')[7]
            check('options: Yes turns it off; Left/Right can\'t turn it back on',
                  asked and not on and ':Off' in row and ':Off' in row2 and not g.rd('wOptions2') & NUZLOCKE_ON, row2.strip())


def case_new_game():
    """New game: the Nuzlocke menu comes after Hard mode; "Nuzlocke On" sets the bit."""
    from harness import H
    import os
    g = H(ROM, os.path.join(os.path.dirname(os.path.abspath(__file__)), 'start_save.bin'), SYM)
    g.frames(400)
    picked = False
    for i in range(4000):
        g.frames(4)
        s = g.screen_text()
        if 'Nuzlocke Off' in s:
            break
        if 'New Game' in s and not picked:
            g.frames(60); g.press('D', hold=4, after=30); g.press('A', after=20)
            picked = True
            continue
        if i % 15 == 14:
            g.press('A', hold=2, after=2)
    menu = 'Nuzlocke Off' in g.screen_text() and 'Nuzlocke On' in g.screen_text()
    g.frames(30); g.press('D', hold=4, after=20); g.press('A', after=60)
    check('new game: Nuzlocke menu after Hard mode; "On" sets the bit', menu and g.rd('wOptions2') & NUZLOCKE_ON,
          f'opt2={g.rd("wOptions2")}')


def main():
    area = case_first()
    case_second(area)
    case_dupe()
    case_evo_dupe()
    case_shiny()
    case_shiny_area_used(area)
    case_legendary(area)
    case_no_balls()
    case_off(area)
    case_hoenn()
    case_hoenn_used()
    case_revive()
    case_sacred_ash()
    case_bury()
    case_can_lose()
    case_bury_off()
    case_bury_full()
    case_run_over()
    case_bury_wild_flee()
    case_bury_doubles()
    case_box_skips_graveyard()
    case_pc()
    case_poison()
    case_options()
    case_new_game()
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
