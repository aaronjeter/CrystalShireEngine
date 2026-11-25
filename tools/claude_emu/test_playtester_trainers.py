"""The playtesters' Victory Road trainers (Victory Road, Silver Pass, Routes 47/48,
Evergrande Dungeon 1F/B1F): stepping onto the far end of each one's line of sight
starts their battle (class, party, six Pokemon, the seen text); winning sets the
beaten flag; talking again gives the after-battle text.

usage: test_playtester_trainers.py ROM SYM STATE
"""
import re
import sys
from harness import warp_script
import test_facility as T
from test_facility_intros import Win

ROM, SYM, STATE = sys.argv[1:4]
check = T.check


class Over(Exception):
    pass


class VRWin(Win):
    def settle(self, limit=12000):
        t = super().settle(limit)
        if t is None:
            raise Over
        return t


MAPS = {
    'VictoryRoad': ('VICTORY_ROAD', 'maps/kanto/dungeons/VictoryRoad.asm'),
    'SilverPass': ('SILVER_PASS', 'maps/johto/silvertown/SilverPass.asm'),
    'Route47': ('ROUTE_47', 'maps/johto/silvertown/Route47.asm'),
    'Route48': ('ROUTE_48', 'maps/johto/silvertown/Route48.asm'),
    'EvergrandeDungeon': ('EVERGRANDE_DUNGEON', 'maps/hoenn/evergrande/EvergrandeDungeon.asm'),
    'EvergrandeDungeonB1F': ('EVERGRANDE_DUNGEON_B1F', 'maps/hoenn/evergrande/EvergrandeDungeonB1F.asm'),
}
STEP = {'UP': (0, -1), 'DOWN': (0, 1), 'LEFT': (-1, 0), 'RIGHT': (1, 0)}
BACK = {'UP': 'D', 'DOWN': 'U', 'LEFT': 'R', 'RIGHT': 'L'}


def trainers():
    """(map const, x, y, facing, range, class, party, flag, first seen line, first after line) per trainer."""
    import os
    cse = os.environ.get('CSE', '.')
    out = []
    for mp, (const, path) in MAPS.items():
        s = open(f'{cse}/{path}', encoding='latin-1').read()
        for m in re.finditer(r'object_event\s+(\d+),\s*(\d+),\s*\w+,\s*SPRITEMOVEDATA_STANDING_(\w+),[^\n]*'
                             r'OBJECTTYPE_TRAINER,\s*(\d+),\s*(TrainerPlaytester\w+)', s):
            x, y, d, r, label = int(m[1]), int(m[2]), m[3], int(m[4]), m[5]
            h = re.search(rf'^{label}:\n\ttrainer (\w+), (\w+), (\w+), (\w+), \w+, 0, \.Script\n\n\.Script:\n'
                          rf'\ttrainerafter (\w+)', s, re.M)
            seen = re.search(rf'^{h[4]}:\n\ttext "([^"]*)"', s, re.M)[1]
            after = re.search(rf'^{h[5]}:\n\ttext "([^"]*)"', s, re.M)[1]
            out.append((const, x, y, d, r, h[1], h[2], h[3], seen, after))
    return out


def flag(g, name):
    n = g.const16(name)
    return g.rd(f'wEventFlags+{n // 8}') >> (n % 8) & 1


def shows(texts, line):
    """The line's words are on one screen (words with an apostrophe are left out: the
    'll/'s/'t tiles and # don't read back as text)."""
    words = [w for w in line.split() if "'" not in w and '#' not in w]
    return any(all(w in t for w in words) for t in texts)


def page(g, until, limit=80):
    texts = []
    for _ in range(limit):
        g.frames(30)
        t = ' '.join(g.screen_text().split())
        if t and (not texts or texts[-1] != t):
            texts.append(t)
        if until(g):
            break
        g.press('A', after=10)
    return texts


def case(row):
    const, x, y, d, r, cls, party, fl, seen_line, after_line = row
    name = party
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.wr('wOptions', g.rd('wOptions') | 1 << g.const('BATTLE_SHIFT'))
    g.wr('wRepelEffect', 250)
    dx, dy = STEP[d]
    # one tile short of the far end, then a step onto it (facing along the line, away from the trainer)
    fx, fy = x + dx * (r - 1), y + dy * (r - 1)
    g.run_script(warp_script(const, fx, fy))
    g.frames(200)
    g.press({'UP': 'U', 'DOWN': 'D', 'LEFT': 'L', 'RIGHT': 'R'}[d], hold=8, after=10)
    texts = page(g, lambda g: g.in_battle() and g.rd('wOTPartyCount'))
    ok = g.in_battle() and g.rd('wOtherTrainerClass') == g.const(cls) and g.rd('wOtherTrainerID') == g.const(party)
    check(f'{name}: sighted from ({x + dx * r},{y + dy * r}) -> a battle with {cls} {party}', ok,
          f"class {g.rd('wOtherTrainerClass')} id {g.rd('wOtherTrainerID')}")
    check(f'{name}: six Pokemon, the seen text first ("{seen_line}")',
          g.rd('wOTPartyCount') == 6 and shows(texts, seen_line), str(texts[:3]))
    if not ok:
        return
    b = VRWin(g, [])
    b.round = 9
    try:
        b.run()
    except Over:
        pass
    check(f'{name}: won', g.rd('wBattleResult') & 0xf == 0, str(g.rd('wBattleResult')))
    page(g, lambda g: not g.rd('wScriptRunning') and not g.in_battle(), 30)
    g.frames(60)
    check(f'{name}: the beaten flag ({fl})', flag(g, fl))
    # the trainer walked up to the player: face back towards them and talk
    g.press(BACK[d], hold=2, after=20)
    g.press('A', after=60)
    t = page(g, lambda g: not g.rd('wScriptRunning'), 12)
    check(f'{name}: the after-battle text ("{after_line}")', shows(t, after_line), str(t[:2]))


def main():
    rows = trainers()
    check('15 playtester trainers on the six maps', len(rows) == 15, str(len(rows)))
    for row in rows:
        case(row)
    fails = [n for n, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(fails)}/{len(T.RESULTS)} passed')
    sys.exit(1 if fails else 0)


if __name__ == '__main__':
    main()
