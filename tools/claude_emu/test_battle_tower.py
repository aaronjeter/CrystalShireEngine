"""The Battle Resort's Battle Tower (FACILITY_ELITE streaks).

Closed until the three hard halls are cleared. A new streak: pick 4, the game
is saved, then a set of 7 double battles in the battle room (the foes kept at
1 HP); the first set gives 7 BP (later sets 10), the first 7-win prize (5 BP and the chosen
item) and the choice to rest (the streak and team kept, the set flag cleared,
the party back). Resuming finds the same team; a loss ends the streak (best
streak kept). A streak at 42 meets the Tower head at battle 49 and gets the
first 49-win prize (20 BP and a Master Ball). A set left unfinished ends the
streak on the next visit.

usage: test_battle_tower.py ROM SYM STATE
"""
import sys
import test_facility as T
import test_facility_intros as I
from harness import warp_script

ROM, SYM, STATE = sys.argv[1:4]
check = T.check
HARD = ('EVENT_FACILITY_HARD_KANTO', 'EVENT_FACILITY_HARD_JOHTO', 'EVENT_FACILITY_HARD_HOENN')


def streak(g):
    return g.rd16('wTowerStreak')


def best(g):
    return g.rd16('wTowerBestStreak')


def state(g):
    return g.rd('wTowerState')


def bp(g):
    return g.rd16('wBattlePoints')


def setup(flags=HARD):
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.run_script(warp_script('BATTLE_RESORT_TOWER', 9, 7))
    g.frames(200)
    for f in flags:
        g.script(f'\tsetevent {f}', 20)
    g.wr('wPartyCount', 0)
    g.wr('wPartySpecies', 0xff)
    for s_ in ('MACHOP', 'GEODUDE', 'ONIX', 'GROWLITHE', 'PIDGEY'):
        g.script(f'\tgivepoke {s_}, 30', 60)
        for _ in range(6):
            g.press('B', after=20)
    for it in ('LIFE_ORB', 'MASTER_BALL'):
        g.script(f'\ttakeitem {it}, 99', 20)
    g.wr('wBattlePoints', [0, 0])
    g.press('U', hold=4, after=30)
    return g


def run(g, win=True, rest=True, limit=1500):
    """Talks to the receptionist and plays until back in the lobby. Returns the
    battles fought, their results and the trainer IDs met."""
    battles, results, ids = 0, [], []
    head = g.const('TOWER_HEAD')
    g.press('A', after=40)
    asked_rest = False
    for _ in range(limit):
        if g.rd('wBattleMode'):
            ids.append(g.rd('wOtherTrainerID'))
            b = (I.Win if win else I.Lose)(g, [])
            b.round = 9
            b.run()
            results.append(g.rd('wBattleResult') & 0xf)
            battles += 1
            continue
        text = ' '.join(g.screen_text().split('\n')[12:18])
        if 'next set' in text:
            g.press('B', after=40)  # no: rest or retire
            continue
        if 'Would you like to' in text or 'rest?' in text:
            g.press('A' if rest else 'B', after=40)
            asked_rest = True
            continue
        g.press('A', after=30)
        if battles and (g.rd('wMapGroup'), g.rd('wMapNumber')) == map_id(g, 'BATTLE_RESORT_TOWER') \
                and (g.rd('wXCoord'), g.rd('wYCoord')) == (9, 7) and not g.rd('wScriptRunning'):
            break
    for _ in range(10):
        g.press('B', after=30)
    return battles, results, ids, head


def map_id(g, name):
    return (g.const(f'GROUP_{name}'), g.const(f'MAP_{name}'))


def main():
    # closed before the hard halls
    g = setup(flags=())
    g.press('A', after=40)
    for _ in range(12):
        g.press('A', after=40)
    check('closed until the three hard halls are cleared', not g.rd('wBattleMode') and not streak(g) and not state(g))

    # a new streak: 7 wins, the first 7-win prize, rest
    g = setup()
    before = T.party_block(g)
    battles, results, ids, head = run(g)
    check('a set: 7 double battles, all won', battles == 7 and results == [0] * 7, str(results))
    check('no trainer twice in a row, no Tower head', all(a != b for a, b in zip(ids, ids[1:])) and head not in ids, str(ids))
    check('streak 7, the team locked, the set flag cleared after resting',
          streak(g) == 7 and state(g) & 2 and not state(g) & 1, f'{streak(g)} {state(g):#x}')
    check('7 BP for the set + 5 for the first 7 wins, and the chosen Life Orb',
          bp(g) == 12 and I.item_count(g, 'LIFE_ORB'), f'BP {bp(g)}')
    check('the 7-win prize given once (its flag)', state(g) & 4)
    check('the party is back as it was', T.party_block(g) == before)

    # resume with the same team, then lose the first battle
    g.press('U', hold=4, after=30)
    battles, results, ids, head = run(g, win=False)
    check('resumed with the same team: a loss ends the streak', battles == 1 and results == [1] and streak(g) == 0 and best(g) == 7,
          f'{battles} {results} streak {streak(g)} best {best(g)}')
    check('after a loss: no streak or set flag, the party back', not state(g) & 3 and T.party_block(g) == before)

    # a streak at 42: the Tower head at battle 49, the first 49-win prize
    g = setup()
    run(g)
    g.wr('wTowerStreak', [0, 42])
    g.wr('wBattlePoints', [0, 0])
    g.press('U', hold=4, after=30)
    battles, results, ids, head = run(g)
    check('battles 43-49 won, the Tower head last', battles == 7 and results == [0] * 7 and ids[-1] == head and head not in ids[:-1], str(ids))
    check('49 wins: 10 BP for the set + 20, and a Master Ball', streak(g) == 49 and bp(g) == 30 and I.item_count(g, 'MASTER_BALL'),
          f'streak {streak(g)} BP {bp(g)}')

    # a set left unfinished: the streak ends on the next visit
    g.wr('wTowerState', state(g) | 1)
    g.press('U', hold=4, after=30)
    g.press('A', after=60)
    text = ' '.join(g.screen_text().split('\n')[12:18])
    for _ in range(3):
        g.press('A', after=40)
        text += ' ' + ' '.join(g.screen_text().split('\n')[12:18])
    for _ in range(8):
        g.press('B', after=30)
    check('an unfinished set: the streak ended (best 49)', 'ended' in text and streak(g) == 0 and best(g) == 49 and not state(g) & 3,
          f'{text[:60]} streak {streak(g)} best {best(g)}')

    bad = [n for n, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
