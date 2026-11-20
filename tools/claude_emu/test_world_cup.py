"""The World Cup from registration to the champion's Hall of Fame entry.

Registers at the lobby, plays the three qualifiers through the lobby's floor
trigger, then walks Round One to Round Four and the finals (Oak), winning every
battle (foes kept at 1 HP). Checks the flags each step sets and that the round
three rival follows the start region. Maps are entered by warping to their
first tile; inside a map the player walks.

usage: test_world_cup.py ROM SYM STATE [--shots DIR]
"""
import os
import sys

import test_facility as T
import test_facility_intros as I
from harness import warp_script

ROM, SYM, STATE = sys.argv[1:4]
SHOTS = sys.argv[sys.argv.index('--shots') + 1] if '--shots' in sys.argv else None
check = T.check
ROUND_FLAGS = ('EVENT_WORLD_CUP_BEAT_ROUND_ONE', 'EVENT_WORLD_CUP_BEAT_ROUND_TWO',
               'EVENT_WORLD_CUP_BEAT_ROUND_THREE', 'EVENT_WORLD_CUP_BEAT_ROUND_FOUR')


def shot(g, name):
    if SHOTS:
        os.makedirs(SHOTS, exist_ok=True)
        g.shot(f'{SHOTS}/{name}.png', 2)


def where(g):
    return g.rd('wMapGroup'), g.rd('wMapNumber'), g.rd('wXCoord'), g.rd('wYCoord')


def map_id(g, name):
    return g.const(f'GROUP_{name}'), g.const(f'MAP_{name}')


def on_map(g, name):
    return where(g)[:2] == map_id(g, name)


def event(g, name):
    n = g.const16(name)
    return g.rd(g.sym['wEventFlags'][1] + n // 8) >> (n % 8) & 1


def text_shown(g):
    return any(c.strip() for c in g.screen_text().split('\n')[12:18])


def settle(g, limit=400, opponents=None):
    """Answers text and wins battles until the player is free to walk."""
    free = 0
    for _ in range(limit):
        if g.rd('wBattleMode'):
            if opponents is not None:
                opponents.append((g.rd('wOtherTrainerClass'), g.rd('wOtherTrainerID')))
            b = I.Win(g, [])
            b.round = 9
            b.run()
            free = 0
            continue
        if g.rd('wScriptRunning') or text_shown(g):
            g.press('A', after=20)
            free = 0
            continue
        free += 1
        if free >= 3:
            return True
        g.frames(20)
    return False


def step(g, d, opponents=None):
    g.press(d, hold=16, after=8)
    settle(g, opponents=opponents)


def face_and_talk(g, d, opponents=None):
    g.press(d, hold=2, after=10)
    g.press('A', after=30)
    settle(g, opponents=opponents)


def warp(g, name, x, y):
    g.run_script(warp_script(name, x, y))
    g.frames(150)
    settle(g)


def walk_to_x(g, x, opponents=None):
    for _ in range(10):
        cx = where(g)[2]
        if cx == x:
            return
        step(g, 'R' if cx < x else 'L', opponents)


def climb(g, opponents, start_map):
    """Walks up the round's hall: talks to the opponent in the way, then takes
    the door at the top. Returns once the map changes."""
    start = where(g)[:2]
    walk_to_x(g, 7, opponents)
    for _ in range(30):
        if where(g)[:2] != start:
            return True
        y = where(g)[3]
        step(g, 'U', opponents)
        if where(g)[:2] != start:
            return True
        if where(g)[3] == y:
            # blocked: the opponent, or the closed door before the battle
            n = len(opponents)
            face_and_talk(g, 'U', opponents)
            if len(opponents) == n and where(g)[2] == 7:
                walk_to_x(g, 6, opponents)
    return False


def setup(start=None):
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.frames(10)
    flags = ['EVENT_BEAT_JOHTO_LEAGUE']
    if start:
        flags.append(start)
    for f in flags:
        g.script(f'\tsetevent {f}', 20)
    for f in ('EVENT_WORLD_CUP_REGISTERED', 'EVENT_WORLD_CUP_QUALIFIED', 'EVENT_WORLD_CUP_CHAMPION',
              'EVENT_BEAT_QUALIFIER_ROUND_ONE', 'EVENT_BEAT_QUALIFIER_ROUND_TWO',
              'EVENT_BEAT_QUALIFIER_ROUND_THREE', 'EVENT_START_HOENN', 'EVENT_START_KANTO') + ROUND_FLAGS:
        if f != start:
            g.script(f'\tclearevent {f}', 20)
    g.script('\tsetmapscene WC_FINALS, 0', 20)
    g.wr('wJohtoBadges', [0xff, 0xff, 0xff])
    g.wr('wStatusFlags', g.rd('wStatusFlags') | 1 << g.const('STATUSFLAGS_NO_WILD_ENCOUNTERS_F'))
    return g


def run_cup(g, label):
    # registration
    warp(g, 'WORLD_CUP_LOBBY', 12, 12)
    face_and_talk(g, 'U')
    check(f'{label}: registered at the lobby', event(g, 'EVENT_WORLD_CUP_REGISTERED'))
    shot(g, f'{label}_registered')

    # qualifiers: the floor trigger in front of the qualifier clerk
    opps = []
    for i, flag in enumerate(('EVENT_BEAT_QUALIFIER_ROUND_ONE', 'EVENT_BEAT_QUALIFIER_ROUND_TWO',
                              'EVENT_BEAT_QUALIFIER_ROUND_THREE')):
        warp(g, 'WORLD_CUP_LOBBY', 9, 9)
        step(g, 'U', opps)  # the clerk sends the player to the qualifier room
        for _ in range(3):
            if not on_map(g, 'WORLD_CUP_LOBBY'):
                step(g, 'U', opps)  # the room's floor trigger starts the battle
        check(f'{label}: qualifier {i + 1} won, back in the lobby',
              event(g, flag) and on_map(g, 'WORLD_CUP_LOBBY'), f'{where(g)} opponents {opps}')
    warp(g, 'WORLD_CUP_LOBBY', 9, 9)
    step(g, 'U')
    check(f'{label}: qualified', event(g, 'EVENT_WORLD_CUP_QUALIFIED'))

    # the rounds: enter each hall from its bottom door
    rounds = []
    warp(g, 'WC_ROUND_ONE', 6, 17)
    step(g, 'U')
    for i, (name, nxt) in enumerate((('WC_ROUND_ONE', 'WC_ROUND_TWO'), ('WC_ROUND_TWO', 'WC_ROUND_THREE'),
                                     ('WC_ROUND_THREE', 'WC_ROUND_FOUR'), ('WC_ROUND_FOUR', 'WC_FINALS'))):
        n = len(rounds)
        ok = climb(g, rounds, name)
        check(f'{label}: round {i + 1} won, through the door', ok and event(g, ROUND_FLAGS[i])
              and on_map(g, nxt) and len(rounds) == n + 1, f'{where(g)} {rounds[n:]}')
        shot(g, f'{label}_round{i + 1}')
        if nxt != 'WC_FINALS':
            step(g, 'U')  # into the next hall: the door locks behind

    # the finals: Oak's trigger, then the Hall of Fame
    fin = []
    for _ in range(4):
        if event(g, 'EVENT_WORLD_CUP_CHAMPION'):
            break
        step(g, 'U', fin)
    for _ in range(200):
        if event(g, 'EVENT_WORLD_CUP_CHAMPION') and not g.rd('wBattleMode') and not g.rd('wScriptRunning'):
            break
        settle(g, limit=40, opponents=fin)
        g.press('A', after=30)
    check(f'{label}: beat Oak in the finals, World Cup champion',
          event(g, 'EVENT_WORLD_CUP_CHAMPION') and fin[:1] == [(g.const('OAK'), g.const('WC_OAK'))], str(fin))
    shot(g, f'{label}_champion')
    return rounds


def main():
    g = setup()
    rounds = run_cup(g, 'Johto start')
    want3 = (g.const('RIVAL2'), g.const('RIVAL2_WC'))
    check('Johto start: round three is Silver', len(rounds) > 2 and rounds[2] == want3, str(rounds))
    want = [(g.const('LORELEI'), g.const('LORELEI1')), (g.const('FALKNER'), g.const('WCFALKNER'))]
    check('rounds one and two: Lorelei, then Falkner', rounds[:2] == want, str(rounds))
    check('round four: Giovanni', len(rounds) > 3 and rounds[3] == (g.const('GIOVANNI'), g.const('WC_GIOVANNI')),
          str(rounds))

    for start, cls, tid, who in (('EVENT_START_KANTO', 'GREEN', 'WC_GREEN', 'Green'),
                                 ('EVENT_START_HOENN', 'WALLY', 'WC_WALLY', 'Wally')):
        g = setup(start)
        rounds = run_cup(g, f'{who} start')
        check(f'{who} start: round three is {who}', len(rounds) > 2 and rounds[2] == (g.const(cls), g.const(tid)),
              str(rounds))
    bad = [n for n, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


main()
