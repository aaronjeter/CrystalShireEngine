"""Kyogre and Groudon (maps/hoenn/dungeons/CaveOfOrigin*.asm, MtChimney*.asm).

The Cave of Origin opens from Sootopolis's north wall and Mt. Chimney's depths from
a third opening in the Fiery Path. Guards block both until the player has the Rain
Badge (they step aside in the map's object callback). Kyogre and Groudon are boss
battles; caught or not, they are gone until the Hoenn League is cleared again
(StevensRoomLevelcap clears their flags).

usage: test_weather_duo.py ROM SYM STATE [--shots DIR]
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


def ow(badge):
    """The overworld state with or without the Rain Badge (the boot save has it)."""
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.frames(10)
    g.run_script('\t%sflag ENGINE_RAINBADGE\n\tsetevent EVENT_TRAVEL_PROF_CALLED\n\tend' % ('set' if badge else 'clear'))
    g.frames(20)
    g.wr('wRepelEffect', 250)  # no wild battles on the way (the wild cases clear it)
    return g


def go(g, d):
    """Face d, then take a step (a warp leaves the player facing down)."""
    g.press(d, hold=2, after=20)
    step(g, d)


def talk_text(g, limit=8):
    seen = []
    g.press('A', after=60)
    for _ in range(limit):
        seen.append(' '.join(g.screen_text().split()))
        g.press('A', after=40)
    return ' '.join(seen)


def case_sootopolis():
    g = ow(False)
    warp(g, 'SOOTOPOLIS_CITY', 33, 19)
    go(g, 'U')
    shot(g, 'soot_closed.png')
    check('Sootopolis, no Rain Badge: the guard blocks the cave mouth', at(g, 'SOOTOPOLIS_CITY', 33, 19), str(here(g)))
    t = talk_text(g)
    check('... and says only Rain Badge holders may enter', 'Rain Badge may' in t, t[:120])

    g = ow(True)
    warp(g, 'SOOTOPOLIS_CITY', 33, 19)
    shot(g, 'soot_open.png')
    go(g, 'U')
    check('with the badge the guard has stepped aside', at(g, 'SOOTOPOLIS_CITY', 33, 18), str(here(g)))
    step(g, 'U')
    g.frames(120)
    shot(g, 'cave_of_origin.png')
    check('up into the cave mouth: Cave of Origin (11, 19)', at(g, 'CAVE_OF_ORIGIN', 11, 19), str(here(g)))
    step(g, 'D')
    g.frames(120)
    check('back down: Sootopolis, out of the cave mouth', at(g, 'SOOTOPOLIS_CITY', 33, 18), str(here(g)))

    warp(g, 'CAVE_OF_ORIGIN', 4, 6)
    go(g, 'U')
    g.frames(120)
    shot(g, 'cave_of_origin_depths.png')
    check('the ladder: Cave of Origin depths (4, 5)', at(g, 'CAVE_OF_ORIGIN_DEPTHS', 4, 5), str(here(g)))
    warp(g, 'CAVE_OF_ORIGIN_DEPTHS', 4, 6)
    go(g, 'U')
    g.frames(120)
    check('and back up: Cave of Origin (4, 5)', at(g, 'CAVE_OF_ORIGIN', 4, 5), str(here(g)))


def case_fiery_path():
    g = ow(False)
    warp(g, 'FIERY_PATH', 7, 36)
    go(g, 'D')
    shot(g, 'fiery_closed.png')
    blocked = at(g, 'FIERY_PATH', 7, 36)
    warp(g, 'FIERY_PATH', 8, 37)
    go(g, 'L')
    check('Fiery Path, no Rain Badge: the ranger stands in the opening (from above and the side)',
          blocked and at(g, 'FIERY_PATH', 8, 37), str(here(g)))
    warp(g, 'FIERY_PATH', 7, 36)
    g.press('D', hold=2, after=20)
    t = talk_text(g)
    check('... and lets only Rain Badge holders through', 'Rain Badge holders' in t, t[:120])

    g = ow(True)
    warp(g, 'FIERY_PATH', 7, 36)
    shot(g, 'fiery_open.png')
    go(g, 'D')
    check('with the badge the ranger has stepped aside', at(g, 'FIERY_PATH', 7, 37), str(here(g)))
    step(g, 'D')
    g.frames(120)
    shot(g, 'mt_chimney_depths.png')
    check('down the opening: Mt. Chimney depths (11, 23)', at(g, 'MT_CHIMNEY_DEPTHS', 11, 23), str(here(g)))
    step(g, 'D')
    g.frames(120)
    check('and back: the Fiery Path opening (7, 37)', at(g, 'FIERY_PATH', 7, 37), str(here(g)))

    warp(g, 'MT_CHIMNEY_DEPTHS', 17, 4)
    go(g, 'D')
    step(g, 'D')
    g.frames(120)
    shot(g, 'mt_chimney_chamber.png')
    check('the depths\' inner opening: the chamber (9, 15)', at(g, 'MT_CHIMNEY_CHAMBER', 9, 15), str(here(g)))
    step(g, 'D')
    g.frames(120)
    check('and back: the depths (17, 5)', at(g, 'MT_CHIMNEY_DEPTHS', 17, 5), str(here(g)))


def legend(name, mapname, x, y, flag, caught):
    g = setup()
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
    b = HookBattle(g, [('ball',)] if caught else [('move', 0)] * 3, hook=hook)
    r = b.run()
    seen = []
    for _ in range(30):
        seen.append(' '.join(g.screen_text().split()))
        g.frames(10)
        g.press('A', hold=2, after=4)
    seen = ' '.join(seen)
    check(f'{name}: a boss battle ({g.const("BOSS_" + name.upper())})', boss == g.const('BOSS_' + name.upper()), str(boss))
    if caught:
        check(f'{name}: caught -> in the party', g.rd('wPartyCount') == n0 + 1, f'party {n0}->{g.rd("wPartyCount")}')
    check(f'{name}: its flag is set after the battle', event_set(g, flag))

    def meets():
        warp(g, mapname, x, y + 1)
        g.press('U', hold=2, after=30)
        g.press('A', after=20)
        for _ in range(200):
            if g.in_battle():
                return True
            g.frames(6)
            g.press('B', hold=2, after=2)
        return False
    check(f'{name}: gone on the next visit', not meets())
    bank, addr = g.sym['StevensRoomLevelcap']
    g.run_script(f'TestScript:\n\tdb farsjump_command\n\tdb {bank}\n\tdw ${addr:04x}')
    g.frames(120)
    check(f'{name}: back after the Hoenn League is cleared', not event_set(g, flag) and meets())


def case_wild(mapname, x, y, species, d=('L', 'R')):
    g = ow(True)
    g.wr('wRepelEffect', 0)
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
    want = {s.capitalize() for s in species}
    check(f'{mapname}: wild encounters from its list', seen and seen <= want, f'{seen} want {want}')


def legend_shots():
    for mapname, x, y, name in (('CAVE_OF_ORIGIN_DEPTHS', 21, 8, 'kyogre'), ('MT_CHIMNEY_CHAMBER', 9, 10, 'groudon')):
        g = ow(True)
        warp(g, mapname, x, y)
        shot(g, name + '.png')


def main():
    if SHOTS:
        os.makedirs(SHOTS, exist_ok=True)
    legend_shots()
    case_sootopolis()
    case_fiery_path()
    legend('Kyogre', 'CAVE_OF_ORIGIN_DEPTHS', 21, 5, 'EVENT_GOT_KYOGRE', False)
    legend('Kyogre', 'CAVE_OF_ORIGIN_DEPTHS', 21, 5, 'EVENT_GOT_KYOGRE', True)
    legend('Groudon', 'MT_CHIMNEY_CHAMBER', 9, 7, 'EVENT_GOT_GROUDON', False)
    legend('Groudon', 'MT_CHIMNEY_CHAMBER', 9, 7, 'EVENT_GOT_GROUDON', True)
    case_wild('CAVE_OF_ORIGIN', 10, 13, ['GOLBAT', 'SABLEYE', 'LUNATONE'])
    case_wild('MT_CHIMNEY_DEPTHS', 12, 13, ['NUMEL', 'SLUGMA', 'TORKOAL', 'CAMERUPT', 'MAGCARGO'])
    bad = [n for n, ok in B.RESULTS if not ok]
    print(f'{len(B.RESULTS) - len(bad)}/{len(B.RESULTS)} passed' + (f'; failed: {bad}' if bad else ''))


if __name__ == '__main__':
    main()
