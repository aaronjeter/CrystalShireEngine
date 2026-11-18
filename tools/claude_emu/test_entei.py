"""The Mt. Mortar Entei (maps/johto/dungeons/MoltresLair.asm).

A second, static Entei where Moltres used to stand; the roaming Entei stays.
It appears once the beasts are released (EVENT_RELEASED_THE_BEASTS; the Burned
Tower release clears EVENT_GOT_ENTEI). It is a boss battle; caught or not, it is
gone until the Johto League is cleared again (Lance's win clears EVENT_GOT_ENTEI).

usage: test_entei.py ROM SYM STATE [--shots DIR]
"""
import os
import test_kanto_legends as K
import test_boss as B
from test_boss import check, event_set

LAIR = 'MOLTRES_LAIR'
X, Y = 20, 0


def visible(g):
    """Talk to the spot in front of where Entei stands: a boss battle means it is there."""
    K.warp(g, LAIR, X, Y + 1)
    g.press('U', hold=2, after=30)
    g.press('A', after=20)
    for _ in range(200):
        if g.in_battle():
            g.frames(60)
            return g.rd('wBossID') == g.const('BOSS_ENTEI')
        g.frames(6)
        g.press('B', hold=2, after=2)
    return False


def case_gate():
    g = K.ow(True)
    g.run_script('\tclearevent EVENT_RELEASED_THE_BEASTS\n\tclearevent EVENT_GOT_ENTEI\n\tend')
    g.frames(20)
    check('beasts not released: no Entei in the lair', not visible(g))
    g = K.ow(True)
    g.run_script('\tsetevent EVENT_RELEASED_THE_BEASTS\n\tclearevent EVENT_GOT_ENTEI\n\tend')
    g.frames(20)
    K.warp(g, LAIR, X, Y + 3)
    K.shot(g, 'entei.png')
    check('beasts released: Entei stands where Moltres was, as a boss battle', visible(g))


def case_flag_clears():
    src = open(os.path.join(os.environ.get('CSE', '.'), 'maps/johto/silvertown/SilverLeagueLancesRoom.asm')).read()
    won = src[src.index('.Won:'):]
    won = won[:won.index('halloffame')]
    check("Lance's win (the Johto League) clears EVENT_GOT_ENTEI", 'clearevent EVENT_GOT_ENTEI' in won)
    src = open(os.path.join(os.environ.get('CSE', '.'), 'maps/johto/ecruteak/BurnedTowerB1F.asm')).read()
    check('releasing the beasts clears EVENT_GOT_ENTEI',
          'setevent EVENT_RELEASED_THE_BEASTS\n\tclearevent EVENT_GOT_ENTEI' in src)


def main():
    if K.SHOTS:
        os.makedirs(K.SHOTS, exist_ok=True)
    case_gate()
    case_flag_clears()
    for caught in (False, True):
        legend_entei(caught)
    bad = [n for n, ok in B.RESULTS if not ok]
    print(f'{len(B.RESULTS) - len(bad)}/{len(B.RESULTS)} passed' + (f'; failed: {bad}' if bad else ''))


def legend_entei(caught):
    """test_kanto_legends.legend with the beasts released first, and the league
    clear done by clearing the flag (the league script itself is checked above)."""
    orig = B.setup

    def setup():
        g = orig()
        g.run_script('\tsetevent EVENT_RELEASED_THE_BEASTS\n\tclearevent EVENT_GOT_ENTEI\n\tend')
        g.frames(20)
        return g
    B.setup = K.setup = setup
    try:
        legend('Entei', LAIR, X, Y, 'EVENT_GOT_ENTEI', caught)
    finally:
        B.setup = K.setup = orig


def legend(name, mapname, x, y, flag, caught):
    g = K.setup()
    K.no_spawns(g, True)
    g.set_party(K.BOLT, [('MASTER_BALL', 1)])
    K.warp(g, mapname, x, y + 1)
    g.press('U', hold=2, after=30)
    check(f'{name}: there before the battle', not event_set(g, flag))
    g.press('A', after=20)
    for _ in range(400):
        if g.in_battle():
            break
        g.frames(6)
        g.press('B', hold=2, after=2)
    K.to_menu(g)
    boss = g.rd('wBossID')

    def hook(g, turn):
        g.wr('wBossBarsLeft', 0)
        if not caught:
            g.wr('wEnemyMonHP', [0, 1])
    n0 = g.rd('wPartyCount')
    K.HookBattle(g, [('ball',)] if caught else [('move', 0)] * 3, hook=hook).run()
    for _ in range(30):
        g.frames(10)
        g.press('A', hold=2, after=4)
    check(f'{name}: a boss battle (BOSS_ENTEI)', boss == g.const('BOSS_ENTEI'), str(boss))
    if caught:
        check(f'{name}: caught -> in the party', g.rd('wPartyCount') == n0 + 1, f'party {n0}->{g.rd("wPartyCount")}')
    check(f'{name}: {"caught" if caught else "knocked out"} -> its flag is set', event_set(g, flag))
    check(f'{name}: gone on the next visit', not visible(g))
    g.run_script(f'\tclearevent {flag}\n\tend')
    g.frames(20)
    check(f'{name}: back once the flag is cleared (the Johto League)', visible(g))


if __name__ == '__main__':
    main()
