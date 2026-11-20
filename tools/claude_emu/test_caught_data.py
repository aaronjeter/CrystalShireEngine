"""Caught data (engine/pokemon/caught_data.asm): byte 0 = level (7 bits) | the
OT's gender, byte 1 = the whole landmark, the time of day + 1 in its own byte.

Checks a level-100 evening catch on Route 120 (a landmark above $7f), a gift
Pokémon, the stats screen's Met/ rows and the Poké Seer's reading.

usage: test_caught_data.py ROM SYM STATE
"""
import sys
import test_facility as T
from harness import warp_script

ROM, SYM, STATE = sys.argv[1:4]
FEMALE_TILE = 0xf5  # "♀" in constants/charmap.asm
check = T.check


def force_time(g, tod):
    """Every hour gives time of day tod (patches the TimesOfDay table)."""
    b, a = g.sym['TimesOfDay']
    base = a if b == 0 else b * 0x4000 + a - 0x4000
    for i in range(6):
        g.poke_rom(base + 2 * i + 1, [tod])


def stats_text(g, slot):
    """The orange stats page of party slot `slot` (0-5)."""
    g.press('START', after=30)
    g.press('D', after=20)
    g.press('A', after=60)
    keys = {0: [], 1: ['R'], 2: ['D'], 3: ['D', 'R'], 4: ['D', 'D'], 5: ['D', 'D', 'R']}[slot]
    for k in keys:
        g.press(k, after=15)
    g.press('A', after=40)
    g.press('A', after=150)
    for _ in range(3):
        g.press('R', after=90)
    return g.screen_text()


def main():
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.frames(30)
    g.run_script(warp_script('ROUTE_120', 10, 10))
    g.frames(200)
    last = g.rd('wPartyCount') - 1
    p = f'wPartyMon{last + 1}'
    eve = g.const('EVE_F')
    force_time(g, eve)
    g.frames(30)
    g.wr('wCurPartyLevel', [100])
    g.wr('wPlayerGender', [1])
    g.run_script('TestScript:\n' + g.call('SetCaughtData') + '\n\tend\n')
    g.frames(60)
    lv, loc, tm = g.rd(p + 'CaughtLevel'), g.rd(p + 'CaughtLocation'), g.rd(p + 'CaughtTime')
    want_loc = g.const('LANDMARK_ROUTE_120')
    check('catch: level 100 kept with the gender bit', lv == 100 | 0x80, f'{lv:#x}')
    check('catch: Route 120 stored whole', loc == want_loc and want_loc >= 0x80, f'{loc:#x} want {want_loc:#x}')
    check('catch: evening stored', tm == eve + 1, str(tm))

    # the Poké Seer's reading of it
    g.wr('wCurPartyMon', [last])
    g.wr('wPartyMenuCursor', [last + 1])
    g.run_script('TestScript:\n' + g.call('ReadCaughtData') + '\n\tend\n')
    g.frames(60)
    seer_loc = g.rd('wSeerCaughtLocation', 9)
    seer_tod = g.rd('wSeerTimeOfDay', 7)
    seer_lv = g.rd('wSeerCaughtLevelString', 3)
    from harness import CHARS
    text = lambda b: ''.join(CHARS.get(c, '?') for c in b)
    check('seer: the place', text(seer_loc).startswith('Route'), text(seer_loc))
    check('seer: evening', text(seer_tod) == 'Evening', text(seer_tod))
    check('seer: level 100', text(seer_lv) == '100', text(seer_lv))

    # the stats screen (party slot 1 gets the same caught data)
    for f in ('CaughtLevel', 'CaughtLocation', 'CaughtTime'):
        g.wr('wPartyMon1' + f, [g.rd(p + f)])
    t = stats_text(g, 0)
    rows = t.split('\n')
    check('stats: Met/ Lv.100 Evening', 'Lv.100 Evening' in rows[16], rows[16])
    check('stats: the place on the next row', 'Route' in rows[17] and '120' in rows[17], rows[17])
    mark = g.rd(f'wTilemap+{14 * 20 + 12}')
    check('stats: the ♀ mark (OT gender)', mark == FEMALE_TILE, f'{mark:#x}')

    # a gift Pokémon: no level, LANDMARK_GIFT, no time
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.frames(30)
    last = g.rd('wPartyCount') - 1
    p = f'wPartyMon{last + 1}'
    g.run_script('TestScript:\n\tdb callasm_command\n'
                 f'\tdb ${g.sym["SetGiftPartyMonCaughtData"][0]:02x}\n\tdw ${g.sym["SetGiftPartyMonCaughtData"][1]:04x}\n\tend\n')
    g.frames(30)
    lv, loc, tm = g.rd(p + 'CaughtLevel'), g.rd(p + 'CaughtLocation'), g.rd(p + 'CaughtTime')
    check('gift: no level, LANDMARK_GIFT, no time', lv & 0x7f == 0 and loc == g.const('LANDMARK_GIFT') and tm == 0,
          f'{lv:#x} {loc:#x} {tm}')
    for f in ('CaughtLevel', 'CaughtLocation', 'CaughtTime'):
        g.wr('wPartyMon1' + f, [g.rd(p + f)])
    t = stats_text(g, 0)
    check('stats: a gift says Gift', 'Met/Gift' in t.split('\n')[16], t.split('\n')[16])

    bad = [x for x, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
