"""The Regi gate (maps/hoenn/*/Regi*Lair.asm, engine/events/regi_gate.asm).

Two cracked rocks seal each Regi's chamber. Reading them shows a riddle; the
rocks crumble (their flag, EVENT_REGI*_WALL_OPEN, is set) when the party passes
the lair's test:
  Regirock: the lead Pokémon is Rock-type      (special RegiLeadType)
  Regice:   the lead Pokémon is Ice-type       (special RegiLeadType)
  Registeel: a party Pokémon knows a Steel move (special RegiPartyMoveType)
Each Regi is a boss; caught or not it is gone until the Hoenn League is cleared
again (StevensRoomLevelcap clears EVENT_GOT_*).

usage: test_regi_gate.py ROM SYM STATE [--shots DIR]
"""
import os
import test_kanto_legends as K
import test_boss as B
from test_boss import check, event_set

BOLT = ('JOLTEON', 60, None, ['THUNDERBOLT', 'HARDEN', 'HORN_DRILL', 'DOUBLE_EDGE'])
GEODUDE = ('GEODUDE', 20, None, ['TACKLE'])
JYNX = ('JYNX', 20, None, ['POUND'])
ONIX = ('ONIX', 20, None, ['IRON_TAIL'])

# map, regi, its x/y, the rocks, the spot below the rocks, wall flag, got flag,
# parties that fail and pass the test
LAIRS = [
    ('REGIROCK_LAIR', 'Regirock', 12, 6, [(11, 14), (12, 14)], (11, 15), 'EVENT_REGIROCK_WALL_OPEN', 'EVENT_GOT_RIGIROCK',
     [JYNX, GEODUDE], [GEODUDE, BOLT]),
    ('REGICE_LAIR', 'Regice', 10, 7, [(7, 12), (8, 12)], (7, 13), 'EVENT_REGICE_WALL_OPEN', 'EVENT_GOT_REGICE',
     [GEODUDE, JYNX], [JYNX, BOLT]),
    ('REGISTEEL_LAIR', 'Registeel', 11, 5, [(10, 7), (11, 7)], (10, 8), 'EVENT_REGISTEEL_WALL_OPEN', 'EVENT_GOT_REGISTEEL',
     [BOLT, GEODUDE], [BOLT, ONIX]),
]


def game():
    g = B.setup()
    K.no_spawns(g, True)
    g.wr('wRepelEffect', 250)
    return g


def read_rock(g):
    """Talk to the rock in front; returns the text seen."""
    seen = []
    g.press('A', after=60)
    for _ in range(14):
        seen.append(' '.join(g.screen_text().split()))
        g.press('A', after=50)
    g.frames(120)
    return ' '.join(seen)


def case_lair(mapname, mon, rx, ry, rocks, below, wflag, gflag, bad, good):
    bx, by = below
    g = game()
    g.set_party(bad, ())
    K.warp(g, mapname, bx, by)
    K.go(g, 'U')
    check(f'{mon}: the cracked rocks block the way', K.at(g, mapname, bx, by), str(K.here(g)))
    t = read_rock(g)
    check(f'{mon}: the rocks show the riddle', 'shall open' in t or 'way shall' in t, t[:100])
    check(f'{mon}: the wrong party -> nothing happens', 'Nothing happened' in t and not event_set(g, wflag), t[-80:])
    K.go(g, 'U')
    check(f'{mon}: still blocked', K.at(g, mapname, bx, by), str(K.here(g)))

    g = game()
    g.set_party(good, ())
    K.warp(g, mapname, bx, by)
    g.press('U', hold=2, after=30)
    t = read_rock(g)
    check(f'{mon}: the right party -> the writing glows and the rocks crumble',
          'glows' in t and 'crumbled' in t and event_set(g, wflag), t[-120:])
    K.go(g, 'U')
    check(f'{mon}: the way is open', K.at(g, mapname, bx, by - 1), str(K.here(g)))
    K.warp(g, mapname, bx, by)
    K.go(g, 'U')
    check(f'{mon}: still open on the next visit', K.at(g, mapname, bx, by - 1), str(K.here(g)))


def visible(g, mapname, x, y, boss):
    K.warp(g, mapname, x, y + 1)
    g.press('U', hold=2, after=30)
    g.press('A', after=20)
    for _ in range(200):
        if g.in_battle():
            g.frames(60)
            return g.rd('wBossID') == g.const(boss)
        g.frames(6)
        g.press('B', hold=2, after=2)
    return False


def case_battle(mapname, mon, rx, ry, wflag, gflag, caught):
    boss = 'BOSS_' + mon.upper()
    g = game()
    g.set_party([BOLT], [('MASTER_BALL', 1)])
    g.run_script(f'\tsetevent {wflag}\n\tclearevent {gflag}\n\tend')
    g.frames(20)
    K.warp(g, mapname, rx, ry + 1)
    g.press('U', hold=2, after=30)
    g.press('A', after=20)
    for _ in range(400):
        if g.in_battle():
            break
        g.frames(6)
        g.press('B', hold=2, after=2)
    K.to_menu(g)
    got = g.rd('wBossID')

    def hook(g, turn):
        g.wr('wBossBarsLeft', 0)
        if not caught:
            g.wr('wEnemyMonHP', [0, 1])
    n0 = g.rd('wPartyCount')
    K.HookBattle(g, [('ball',)] if caught else [('move', 0)] * 3, hook=hook).run()
    for _ in range(30):
        g.frames(10)
        g.press('A', hold=2, after=4)
    what = 'caught' if caught else 'knocked out'
    check(f'{mon}: a boss battle ({boss})', got == g.const(boss), str(got))
    if caught:
        check(f'{mon}: caught -> in the party', g.rd('wPartyCount') == n0 + 1)
    check(f'{mon}: {what} -> {gflag} set', event_set(g, gflag))
    check(f'{mon}: {what} -> gone on the next visit', not visible(g, mapname, rx, ry, boss))
    bank, addr = g.sym['StevensRoomLevelcap']
    g.run_script(f'TestScript:\n\tdb farsjump_command\n\tdb {bank}\n\tdw ${addr:04x}')
    g.frames(120)
    check(f'{mon}: back after the Hoenn League is cleared', not event_set(g, gflag) and visible(g, mapname, rx, ry, boss))


def shots():
    for mapname, mon, rx, ry, rocks, below, wflag, *_ in LAIRS:
        g = K.ow(True)
        g.run_script(f'\tclearevent {wflag}\n\tend')
        g.frames(20)
        K.warp(g, mapname, below[0], below[1] + 1)
        K.shot(g, mon.lower() + '_sealed.png')
        g.run_script(f'\tsetevent {wflag}\n\tend')
        g.frames(20)
        K.warp(g, mapname, below[0], below[1] - 3)
        K.shot(g, mon.lower() + '_open.png')


SHUCKLE = ('SHUCKLE', 20, None, ['TACKLE'])    # Bug/Rock: Rock as its second type
DEWGONG = ('DEWGONG', 20, None, ['TACKLE'])    # Water/Ice: Ice as its second type
BOLT_IRON = ('JOLTEON', 60, None, ['THUNDERBOLT', 'HARDEN', 'DOUBLE_EDGE', 'IRON_TAIL'])


def egg_first(g, egg, mon):
    """A party of an egg (slot 1) and mon."""
    g.wr('wPartyCount', 0)
    g.wr('wPartySpecies', 0xFF)
    sp, lv, item, moves = mon
    mon2 = g.sym['wPartyMon2'][1]
    setmoves = ''.join(f'\tgivepokemove {m}, ${mon2:04X}, {j}\n' for j, m in enumerate((list(moves) + ['NO_MOVE'] * 4)[:4]))
    g.run_script(f'\tgiveegg {egg}, 5\n\tgivepoke {sp}, {lv}, {item or "NO_ITEM"}\n{setmoves}\tend')
    for _ in range(30):
        g.frames(20)
        g.press('B', after=10)
    assert g.rd('wPartyCount') == 2 and g.rd('wPartySpecies') == g.const('EGG'), 'the egg party was not set up'


def opens(mapname, below, wflag, party=None, egg=None, faint_lead=False):
    """Read the rocks with this party; True if they crumble."""
    g = game()
    if egg:
        egg_first(g, egg, party[0])
    else:
        g.set_party(party, ())
    if faint_lead:
        g.wr('wPartyMon1HP', [0, 0])
    K.warp(g, mapname, below[0], below[1])
    g.press('U', hold=2, after=30)
    read_rock(g)
    return event_set(g, wflag)


def case_edges():
    rock, ice, steel = LAIRS
    check('Regirock: a lead with Rock as its second type (Shuckle) opens the way',
          opens(rock[0], rock[5], rock[6], [SHUCKLE, BOLT]))
    check('Regirock: an egg in front of a Rock-type does not',
          not opens(rock[0], rock[5], rock[6], [GEODUDE], egg='GEODUDE'))
    check('Regirock: a fainted Rock-type lead still opens it (the lead is party slot 1)',
          opens(rock[0], rock[5], rock[6], [GEODUDE, BOLT], faint_lead=True))
    check('Regice: a lead with Ice as its second type (Dewgong) opens the way',
          opens(ice[0], ice[5], ice[6], [DEWGONG, BOLT]))
    check('Regice: an egg in front of an Ice-type does not',
          not opens(ice[0], ice[5], ice[6], [JYNX], egg='JYNX'))
    check('Registeel: a Steel move in the lead\'s last move slot opens the way',
          opens(steel[0], steel[5], steel[6], [BOLT_IRON]))
    check('Registeel: a Steel move behind an egg still counts (eggs are skipped)',
          opens(steel[0], steel[5], steel[6], [ONIX], egg='GEODUDE'))


def main():
    if K.SHOTS:
        os.makedirs(K.SHOTS, exist_ok=True)
        shots()
    for lair in LAIRS:
        case_lair(*lair)
    case_edges()
    for mapname, mon, rx, ry, rocks, below, wflag, gflag, *_ in LAIRS:
        for caught in (False, True):
            case_battle(mapname, mon, rx, ry, wflag, gflag, caught)
    bad = [n for n, ok in B.RESULTS if not ok]
    print(f'{len(B.RESULTS) - len(bad)}/{len(B.RESULTS)} passed' + (f'; failed: {bad}' if bad else ''))


if __name__ == '__main__':
    main()
