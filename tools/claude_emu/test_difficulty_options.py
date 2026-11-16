"""Options page 2: Difficulty (Normal <-> Hard) and Level Caps (one way off), through the menu.

Opens START > Option, goes up to page 2 and reads the rows on screen; checks wHardMode
(0 = Hard, 1 = Normal), EVENT_HARDMODE_ENABLED, EVENT_LEVELCAPS_ENABLED and wLevelCap.

usage: test_difficulty_options.py ROM SYM STATE
"""
import sys
from battle_test import Game, assemble_block, SCRIPT_ORG

ROM, SYM, STATE = sys.argv[1:4]
RESULTS = []
ROW_DIFFICULTY, ROW_LEVEL_CAPS = 7, 9


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def flag(g, name):
    lo, hi = assemble_block(f'\tdw {name}', 0, SCRIPT_ORG)[:2]
    ev = lo | hi << 8
    return bool(g.rd(f'wEventFlags+{ev // 8}') >> (ev % 8) & 1)


def set_flag(g, name, on):
    lo, hi = assemble_block(f'\tdw {name}', 0, SCRIPT_ORG)[:2]
    ev = lo | hi << 8
    a = f'wEventFlags+{ev // 8}'
    v = g.rd(a)
    g.wr(a, v | 1 << (ev % 8) if on else v & ~(1 << (ev % 8)))


def row(g, r):
    return g.screen_text().split('\n')[r]


def wait_for(g, cond, n=120):
    for _ in range(n):
        g.frames(5)
        if cond(g.screen_text()):
            return True
    return False


def open_page2(g, ups):
    """START > Option (the last Start menu entry), then up from page 1's top: Cancel (page 2),
    then `ups - 1` more."""
    g.frames(30); g.press('START', after=30)
    g.press('U', after=6)
    g.press('A', after=60)
    for _ in range(ups):
        g.press('U', after=8)


def case_difficulty():
    g = Game(ROM, SYM, STATE)
    g.wr('wHardMode', 1); set_flag(g, 'EVENT_HARDMODE_ENABLED', False)
    open_page2(g, 4)  # Cancel, Nuzlocke, Level Caps, Difficulty
    before = row(g, ROW_DIFFICULTY)
    g.press('R', after=20)
    hard = (g.rd('wHardMode'), flag(g, 'EVENT_HARDMODE_ENABLED'), row(g, ROW_DIFFICULTY))
    g.press('L', after=20)
    normal = (g.rd('wHardMode'), flag(g, 'EVENT_HARDMODE_ENABLED'), row(g, ROW_DIFFICULTY))
    check('Difficulty shows Normal; Right -> Hard (wHardMode 0, flag set)', ':Normal' in before
          and hard[0] == 0 and hard[1] and ':Hard' in hard[2], f'{before.strip()} -> {hard}')
    check('Difficulty: Left -> back to Normal (wHardMode 1, flag clear)', normal[0] == 1 and not normal[1]
          and ':Normal' in normal[2], f'{normal}')


def case_level_caps():
    for ans in ('no', 'yes'):
        g = Game(ROM, SYM, STATE)
        set_flag(g, 'EVENT_LEVELCAPS_ENABLED', True); g.wr('wLevelCap', 30)
        open_page2(g, 3)  # Cancel, Nuzlocke, Level Caps
        shown = ':On' in row(g, ROW_LEVEL_CAPS)
        g.press('R', after=8)
        asked = wait_for(g, lambda s: 'Yes' in s and 'No' in s and 'for good?' in s)
        g.frames(20)
        if ans == 'no':
            g.press('D', after=8)
        g.press('A', after=8)
        wait_for(g, lambda s: 'Yes' not in s)
        g.frames(30)
        state = (flag(g, 'EVENT_LEVELCAPS_ENABLED'), g.rd('wLevelCap'), row(g, ROW_LEVEL_CAPS).strip())
        if ans == 'no':
            check('Level Caps shows On; Right asks; No keeps them (flag set, cap 30)',
                  shown and asked and state[0] and state[1] == 30 and ':On' in state[2], f'{state}')
        else:
            g.press('R', after=60)
            again = 'for good?' in g.screen_text()
            g.press('L', after=60)
            after = (flag(g, 'EVENT_LEVELCAPS_ENABLED'), g.rd('wLevelCap'), row(g, ROW_LEVEL_CAPS).strip())
            check('Level Caps: Yes turns them off (flag clear, cap 100); no way back on',
                  asked and not state[0] and state[1] == 100 and ':Off' in state[2] and not again
                  and after == state, f'{state} then {after}')


def main():
    case_difficulty()
    case_level_caps()
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed' + (f'; failed: {bad}' if bad else ''))


if __name__ == '__main__':
    main()
