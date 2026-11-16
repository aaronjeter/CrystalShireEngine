"""Overworld item audit (claude/overworld-item-audit.md): real pickups and shop lists.

Pickups: warp next to the item (below it), turn up with a short tap, press A through the
"found" text, then `checkitem` the new item. Shops: open the mart / BP list with a script
and read the item names on screen.

usage: test_item_audit.py ROM SYM STATE [case ...]
"""
import sys
from battle_test import Game, SCENE_OFF

ROM, SYM, STATE = sys.argv[1:4]
RESULTS = []


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def game():
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.clear_bag()
    return g


def has_item(g, item):
    g.run_script(f'TestScript:\n\tcheckitem {item}\n\tend')
    g.frames(30)
    return g.rd(g.sym['wScriptVar'][1])


def pickup(name, mapc, x, y, item):
    """The item at (x, y), picked up from a side tile (below first; a wall tile can't be
    stood on, so each side is tried in turn)."""
    for dx, dy, face in [(0, 1, 'U'), (0, -1, 'D'), (1, 0, 'L'), (-1, 0, 'R')]:
        g = game()
        g.run_script(f'TestScript:\n\twarp {mapc}, {x + dx}, {y + dy}\n\tend')
        g.frames(240)
        g.press(face, hold=1, after=20)
        g.press('A', after=30)
        for _ in range(40):
            g.press('B', after=12)
        g.frames(60)
        if has_item(g, item) == 1:
            check(f'{name}: picked up {item}', True, f'from side {face}')
            return
    check(f'{name}: picked up {item}', False, 'no side worked')


def mart_list(name, script, want):
    g = game()
    g.run_script(f'TestScript:\n\topentext\n{script}\n\tclosetext\n\tend')
    rows = ''
    for i in range(60):  # the greeting, then A once on "Buy" to show the list
        g.frames(10)
        rows = g.screen_text().replace('\n', ' ')
        if all(w in rows for w in want):
            break
        if 'BUY' in rows.upper() and 'SELL' in rows.upper():
            g.press('A', after=60)
        elif i % 6 == 5:
            g.press('A', after=10)
    missing = [w for w in want if w not in rows]
    check(f'{name}: list shows {want}', not missing, f'missing={missing} screen={rows[:300]}')


def case_pickups():
    pickup('Route 46 item ball (was X Speed)', 'ROUTE_46', 1, 15, 'EXP_CANDY_S')
    pickup('Ruins of Alph Kabuto room (was Oran Berry)', 'RUINS_OF_ALPH_KABUTO_ITEM_ROOM', 2, 6, 'SALAC_BERRY')
    pickup('Rock Tunnel 1F hidden (was X Defend)', 'ROCK_TUNNEL_1F', 21, 15, 'POWER_BELT')
    pickup('Silver Cave Room 1 item ball (was Escape Rope)', 'SILVER_CAVE_ROOM_1', 5, 30, 'EXP_CANDY_XL')


def case_shops():
    mart_list('Violet specialty counter', '\tpokemart MARTTYPE_STANDARD, MART_VIOLET', ['Sharp Beak', 'Zoom Lens', 'Everstone'])
    mart_list('Mauville specialty counter', '\tpokemart MARTTYPE_STANDARD, MART_MAUVILLE', ['Magnet', 'Cell Battery', 'Thunderstone'])


def case_bp_tier1():
    """BP Tier 1 (14 items now): the clerk's own script; scroll to the last item, Zoom Lens."""
    g = game()
    bank, addr = g.sym['LilycoveChallengeHallClerkScript']
    g.run_script(f'TestScript:\n\tdb farsjump_command\n\tdb {bank}\n\tdw ${addr:04x}')
    rows = ''
    for i in range(80):
        g.frames(10)
        rows = g.screen_text().replace('\n', ' ')
        if 'Exp. Candy S' in rows:
            break
        g.press('A', after=10)
    seen = set()
    for _ in range(18):  # past the end, so the last rows are read too
        rows = g.screen_text().replace('\n', ' ')
        for name in ['Ability Capsule', 'Power Herb', 'Metronome', 'Loaded Dice', 'Absorb Bulb', 'Cell Battery',
                     'Snowball', 'LuminousMoss', 'Safe Goggles', 'Zoom Lens']:
            if name in rows:
                seen.add(name)
        g.press('D', after=40)
    want = {'Power Herb', 'Metronome', 'Loaded Dice', 'Absorb Bulb', 'Cell Battery', 'Snowball', 'LuminousMoss',
            'Safe Goggles', 'Zoom Lens'}
    check('BP Tier 1 lists the 9 batch 4 items (scrolled to the 14th)', want <= seen, f'missing={sorted(want - seen)}')


CASES = [case_pickups, case_shops, case_bp_tier1]


def main():
    names = sys.argv[4:]
    for c in CASES:
        if not names or c.__name__ in names:
            c()
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed' + (f'; failed: {bad}' if bad else ''))


if __name__ == '__main__':
    main()
