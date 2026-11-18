"""The legendary birds' and Mewtwo's Kanto homes (maps/kanto/dungeons/).

Seafoam Islands (Articuno) off Route 20, the Cinnabar volcano (Moltres), Zapdos's
roost above the Power Plant (Route 10) and Cerulean Cave (Mewtwo). Cerulean Cave's
guard steps aside once the Kanto League is beaten (EVENT_BEAT_INDIGO_LEAGUE). Each
legendary is a boss battle; caught or not, it is gone until the Kanto League is
cleared again (HallOfFameLevelcap clears its flag).

usage: test_kanto_legends.py ROM SYM STATE [--shots DIR]
"""
import os
import sys
import test_boss as B
import test_facility as T
from test_boss import check, setup, to_menu, HookBattle, BOLT, event_set

ROM, SYM, STATE = sys.argv[1:4]
SHOTS = sys.argv[sys.argv.index('--shots') + 1] if '--shots' in sys.argv else None


def shot(g, name):
    if SHOTS:
        g.shot(os.path.join(SHOTS, name), 3)


def here(g):
    return g.rd('wMapGroup'), g.rd('wMapNumber'), g.rd('wXCoord'), g.rd('wYCoord')


def at(g, mapname, x=None, y=None):
    h = here(g)
    return h[:2] == (g.const(f'GROUP_{mapname}'), g.const(f'MAP_{mapname}')) and \
        (x is None or h[2:] == (x, y))


def warp(g, mapname, x, y):
    g.run_script(f'\twarp {mapname}, {x}, {y}\n\tend')
    g.frames(240)


def step(g, d, n=1):
    for _ in range(n):
        g.press(d, hold=8, after=24)
    g.frames(60)


def go(g, d):
    """Face d, then take a step (a warp leaves the player facing down)."""
    g.press(d, hold=2, after=20)
    step(g, d)


def slide(g, d):
    g.press(d, hold=8, after=20)
    g.frames(120)


def ow(league):
    """The overworld state, with or without the Kanto League beaten."""
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.frames(10)
    g.run_script('\t%sevent EVENT_BEAT_INDIGO_LEAGUE\n\tsetevent EVENT_TRAVEL_PROF_CALLED\n\tend'
                 % ('set' if league else 'clear'))
    g.frames(20)
    g.wr('wRepelEffect', 250)  # no wild battles on the way (the wild cases clear it)
    no_spawns(g, True)
    return g


def no_spawns(g, on):
    """No overworld spawns (they can stand in the way of a slide or start a battle)."""
    bit = 1 << g.const('STATUSFLAGS_NO_WILD_ENCOUNTERS_F')
    v = g.rd('wStatusFlags')
    g.wr('wStatusFlags', (v | bit) if on else (v & ~bit & 0xff))


def talk_text(g, limit=8):
    seen = []
    g.press('A', after=60)
    for _ in range(limit):
        seen.append(' '.join(g.screen_text().split()))
        g.press('A', after=40)
    return ' '.join(seen)


def door(g, name, outside, ox, oy, inside, ix, iy, shotname):
    """Walk up into an overworld cave door, then back down out of it."""
    warp(g, outside, ox, oy + 1)
    go(g, 'U')
    g.frames(120)
    if shotname:
        shot(g, shotname)
    check(f'{name}: {outside} ({ox}, {oy}) -> {inside} ({ix}, {iy})', at(g, inside, ix, iy), str(here(g)))
    step(g, 'D')
    g.frames(120)
    check(f'{name}: and back out to ({ox}, {oy + 1})', at(g, outside, ox, oy + 1), str(here(g)))


def inner(g, name, a, ax, ay, d, b, bx, by):
    """From (ax, ay) on map a, face d and step: lands on map b at (bx, by)."""
    sx, sy = {'U': (ax, ay + 1), 'D': (ax, ay - 1)}[d]
    warp(g, a, sx, sy)
    go(g, d)
    if d == 'D':
        step(g, 'D')
    g.frames(120)
    check(f'{name}: {a} ({ax}, {ay}) -> {b} ({bx}, {by})', at(g, b, bx, by), str(here(g)))


def case_warps():
    g = ow(True)
    door(g, 'Seafoam', 'ROUTE_20', 30, 5, 'SEAFOAM_ISLANDS_1F', 11, 19, 'seafoam_door.png')
    inner(g, 'Seafoam hole', 'SEAFOAM_ISLANDS_1F', 19, 3, 'U', 'SEAFOAM_ISLANDS_B1F', 19, 19)
    warp(g, 'SEAFOAM_ISLANDS_B1F', 19, 18)
    go(g, 'D')
    g.frames(120)
    check('Seafoam ladder: SEAFOAM_ISLANDS_B1F (19, 19) -> SEAFOAM_ISLANDS_1F, out of the hole (19, 4)', at(g, 'SEAFOAM_ISLANDS_1F', 19, 4), str(here(g)))
    door(g, 'Volcano', 'CINNABAR_ISLAND', 8, 5, 'CINNABAR_VOLCANO', 17, 21, 'volcano_door.png')
    inner(g, 'Volcano', 'CINNABAR_VOLCANO', 13, 5, 'D', 'CINNABAR_VOLCANO_CRATER', 10, 16)
    shot(g, 'volcano_summit.png')
    warp(g, 'CINNABAR_VOLCANO_CRATER', 10, 16)
    go(g, 'U')
    g.frames(120)
    check('Volcano: the summit door (10, 15) -> back on the cave carpet (13, 5)', at(g, 'CINNABAR_VOLCANO', 13, 5), str(here(g)))
    door(g, 'Zapdos', 'ROUTE_10', 2, 33, 'ZAPDOS_ROOST_CAVE', 7, 11, 'zapdos_door.png')
    # the roost cave's hole in the north wall and the crag's cave door
    warp(g, 'ZAPDOS_ROOST_CAVE', 9, 4)
    go(g, 'U')
    g.frames(120)
    check('Zapdos: the cave\'s north hole -> the roost (6, 4), out of its door', at(g, 'ZAPDOS_ROOST', 6, 4), str(here(g)))
    shot(g, 'zapdos_roost.png')
    go(g, 'U')
    g.frames(120)
    check('Zapdos: back into the door -> the cave below the hole (9, 4)', at(g, 'ZAPDOS_ROOST_CAVE', 9, 4), str(here(g)))
    door(g, 'Cerulean Cave (League beaten)', 'CERULEAN_CITY', 8, 3, 'CERULEAN_CAVE_1F', 15, 19, 'cerulean_door_open.png')
    inner(g, 'Cerulean Cave hole', 'CERULEAN_CAVE_1F', 23, 3, 'U', 'CERULEAN_CAVE_B1F', 5, 17)
    warp(g, 'CERULEAN_CAVE_B1F', 5, 16)
    go(g, 'D')
    step(g, 'D')
    g.frames(120)
    check('Cerulean Cave carpet: B1F (5, 17) -> 1F, out of the hole (23, 4)', at(g, 'CERULEAN_CAVE_1F', 23, 4), str(here(g)))


def case_cerulean_guard():
    g = ow(False)
    warp(g, 'CERULEAN_CITY', 9, 4)
    go(g, 'L')
    shot(g, 'cerulean_guard.png')
    check('Cerulean Cave, League not beaten: the guard stands in front of the door',
          at(g, 'CERULEAN_CITY', 9, 4), str(here(g)))
    g.press('L', hold=2, after=20)
    t = talk_text(g)
    check('... and says only the Champion may go in', 'Only the Champion' in t, t[:120])


def case_ice():
    g = ow(True)
    warp(g, 'SEAFOAM_ISLANDS_B1F', 17, 16)
    shot(g, 'seafoam_ice.png')
    path = []
    for d in 'ULDLUL':
        slide(g, d)
        path.append(here(g)[2:])
    want = [(17, 4), (14, 4), (14, 7), (10, 7), (10, 4), (7, 4)]
    check("Seafoam B1F ice: up, left, down, left, up, left from the ladder floor reaches Articuno's ledge (7, 4)",
          path == want, str(path))
    warp(g, 'SEAFOAM_ISLANDS_B1F', 7, 5)
    path = []
    for d in 'RDR':
        slide(g, d)
        path.append(here(g)[2:])
    check('Seafoam B1F ice: right, down, right from the ledge leads back to the ladder floor (16, 17)',
          path == [(11, 5), (11, 17), (16, 17)], str(path))


def case_jynx():
    g = ow(True)
    warp(g, 'SEAFOAM_ISLANDS_1F', 7, 4)
    shot(g, 'seafoam_jynx.png')
    met = False
    for i in range(60):
        g.press('L', hold=8, after=16)
        g.press('A', hold=2, after=10)
        if g.in_battle():
            met = True
            break
        if i % 10 == 9:
            warp(g, 'SEAFOAM_ISLANDS_1F', 7, 4)
    name = ''
    for _ in range(100):
        g.frames(8)
        t = ' '.join(g.screen_text().split())
        if 'appeared' in t:
            name = t
            break
    check('Seafoam 1F: the Jynx in the top-left corner starts a battle', met and 'Jynx' in name, f'battle={met} {name[:60]}')


def legend(name, mapname, x, y, flag, caught):
    g = setup()
    no_spawns(g, True)
    g.set_party(BOLT, [('MASTER_BALL', 1)])
    warp(g, mapname, x, y + 1)
    g.press('U', hold=2, after=30)
    check(f'{name}: there before the battle', not event_set(g, flag))
    g.press('A', after=20)
    for _ in range(400):
        if g.in_battle():
            break
        g.frames(6)
        g.press('B', hold=2, after=2)
    to_menu(g)
    boss = g.rd('wBossID')

    def hook(g, turn):
        g.wr('wBossBarsLeft', 0)
        if not caught:
            g.wr('wEnemyMonHP', [0, 1])
    n0 = g.rd('wPartyCount')
    HookBattle(g, [('ball',)] if caught else [('move', 0)] * 3, hook=hook).run()
    for _ in range(30):
        g.frames(10)
        g.press('A', hold=2, after=4)
    check(f'{name}: a boss battle', boss == g.const('BOSS_' + name.upper()), str(boss))
    if caught:
        check(f'{name}: caught -> in the party', g.rd('wPartyCount') == n0 + 1, f'party {n0}->{g.rd("wPartyCount")}')
    check(f'{name}: its flag is set after the battle', event_set(g, flag))

    def meets():
        warp(g, mapname, x, y + 1)
        g.press('U', hold=2, after=30)
        g.press('A', after=20)
        for _ in range(200):
            if g.in_battle():
                g.frames(60)
                return g.rd('wBossID') != 0
            g.frames(6)
            g.press('B', hold=2, after=2)
        return False
    check(f'{name}: gone on the next visit', not meets())
    bank, addr = g.sym['HallOfFameLevelcap']
    g.run_script(f'TestScript:\n\tdb farsjump_command\n\tdb {bank}\n\tdw ${addr:04x}')
    g.frames(120)
    check(f'{name}: back after the Kanto League is cleared', not event_set(g, flag) and meets())


def case_wild(mapname, x, y, species, d=('L', 'R')):
    g = ow(True)
    g.wr('wRepelEffect', 0)
    no_spawns(g, False)
    warp(g, mapname, x, y)
    seen = set()
    for i in range(600):
        g.press(d[i % 2], hold=8, after=16)
        if g.in_battle():
            name = None
            for _ in range(100):
                g.frames(8)
                t = ' '.join(g.screen_text().split())
                if 'appeared' in t:
                    name = t.split('Wild ')[1].split(' appeared')[0]
                    break
            if name:
                seen.add(name)
            g.frames(60)
            B.run_away(g)
            g.frames(120)
            if len(seen) >= 3:
                break
    want = {s.capitalize().replace('_', ' ') for s in species}
    check(f'{mapname}: wild encounters from its list', seen and seen <= want, f'{seen} want {want}')


def legend_shots():
    for mapname, x, y, name in (('SEAFOAM_ISLANDS_B1F', 5, 7, 'articuno'), ('CINNABAR_VOLCANO_CRATER', 11, 9, 'moltres'),
                                ('ZAPDOS_ROOST', 13, 9, 'zapdos'), ('CERULEAN_CAVE_B1F', 17, 5, 'mewtwo'),
                                ('SEAFOAM_ISLANDS_1F', 11, 19, 'seafoam_1f'), ('CINNABAR_VOLCANO', 17, 19, 'volcano_1f'),
                                ('CERULEAN_CAVE_1F', 15, 18, 'cerulean_1f'), ('ZAPDOS_ROOST_CAVE', 7, 9, 'zapdos_cave')):
        g = ow(True)
        warp(g, mapname, x, y)
        shot(g, name + '.png')


def main():
    if SHOTS:
        os.makedirs(SHOTS, exist_ok=True)
        legend_shots()
    case_warps()
    case_cerulean_guard()
    case_ice()
    case_jynx()
    for args in (('Articuno', 'SEAFOAM_ISLANDS_B1F', 5, 5, 'EVENT_GOT_ARTICUNO'),
                 ('Moltres', 'CINNABAR_VOLCANO_CRATER', 11, 6, 'EVENT_GOT_MOLTRES'),
                 ('Zapdos', 'ZAPDOS_ROOST', 13, 6, 'EVENT_GOT_ZAPDOS'),
                 ('Mewtwo', 'CERULEAN_CAVE_B1F', 17, 4, 'EVENT_GOT_MEWTWO')):
        legend(*args, caught=False)
        legend(*args, caught=True)
    case_wild('SEAFOAM_ISLANDS_1F', 10, 12, ['ZUBAT', 'SEEL', 'SHELLDER', 'SLOWPOKE', 'GOLBAT', 'DEWGONG', 'SLOWBRO'])
    case_wild('CINNABAR_VOLCANO', 12, 13, ['PONYTA', 'SLUGMA', 'KOFFING', 'GROWLITHE', 'MAGBY', 'MAGMAR', 'RAPIDASH'])
    case_wild('CERULEAN_CAVE_1F', 3, 6,  ['GOLBAT', 'PARASECT', 'KADABRA', 'DITTO', 'ELECTRODE', 'WOBBUFFET', 'CHANSEY'])
    case_wild('ZAPDOS_ROOST_CAVE', 7, 7, ['VOLTORB', 'MAGNEMITE', 'ZUBAT', 'ELEKID', 'MAGNETON', 'ELECTABUZZ'])
    bad = [n for n, ok in B.RESULTS if not ok]
    print(f'{len(B.RESULTS) - len(bad)}/{len(B.RESULTS)} passed' + (f'; failed: {bad}' if bad else ''))


if __name__ == '__main__':
    main()
