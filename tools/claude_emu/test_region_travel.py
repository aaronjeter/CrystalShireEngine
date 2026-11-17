"""First-time travel between regions (engine/events/region_travel.asm).

At 4 badges the start region's professor calls; in the lab they give a parcel
for each of the other professors and the S.S. Ticket (Olivine Port's gangway
opens). The Fast Ship sails from Olivine Port, Vermilion Port and Slateport
Harbor to either other port (a menu after the ticket); delivering a parcel
gives the professor's reward once.

usage: test_region_travel.py ROM SYM STATE [--shots DIR]
"""
import os
import sys
import test_facility as T
from harness import warp_script

ROM, SYM, STATE = sys.argv[1:4]
SHOTS = sys.argv[sys.argv.index('--shots') + 1] if '--shots' in sys.argv else None
check = T.check


def flag(g, name):
    n = g.const16(name)
    return g.rd(f'wEventFlags+{n // 8}') >> (n % 8) & 1


def set_flag(g, name, on=True):
    n = g.const16(name)
    a = f'wEventFlags+{n // 8}'
    v = g.rd(a)
    g.wr(a, v | 1 << (n % 8) if on else v & ~(1 << (n % 8)))


def idle(g, limit=60):
    """Press A until no script is running (dialogs finished)."""
    for _ in range(limit):
        g.frames(20)
        if not g.rd('wScriptRunning'):
            g.frames(20)
            if not g.rd('wScriptRunning'):
                return True
        g.press('A', after=30)
    return False


def has(g, item):
    idle(g)
    g.script(f'\tcheckitem {item}', 20)
    return bool(g.rd('wScriptVar'))


def count(g, item):
    n = 0
    while n < 99 and has(g, item):
        g.script(f'\ttakeitem {item}, 1', 10)
        n += 1
    if n:
        g.script(f'\tgiveitem {item}, {n}', 20)
    return n


def here(g):
    return g.rd('wMapGroup'), g.rd('wMapNumber'), g.rd('wXCoord'), g.rd('wYCoord')


def at(g, mapname, x=None, y=None):
    h = here(g)
    return h[:2] == (g.const(f'GROUP_{mapname}'), g.const(f'MAP_{mapname}')) and \
        (x is None or h[2:] == (x, y))


def shot(g, name):
    if SHOTS:
        g.shot(os.path.join(SHOTS, name), 3)


def setup(badges=0, start=None):
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    if start:
        set_flag(g, f'EVENT_START_{start}')
    bits = (1 << badges) - 1
    g.wr('wBadges', [bits & 0xff, bits >> 8 & 0xff, bits >> 16 & 0xff])
    g.wr('wNewBarkTownSceneID', 1)  # past the intro scenes
    g.wr('wElmsLabSceneID', 2)
    g.frames(10)
    return g


def warp(g, mapname, x, y, face=None):
    g.run_script(warp_script(mapname, x, y))
    g.frames(200)
    if face:
        g.press(face, hold=2, after=20)


def talk(g, until, menu=None, limit=40, texts=None):
    """Press A until `until(g)`; a menu (by its first line) gets `menu` presses of Down first."""
    seen = texts if texts is not None else []
    g.press('A', after=60)
    for _ in range(limit):
        t = g.screen_text()
        seen.append(' '.join(t.split()))
        if until(g):
            return seen
        if menu is not None and 'Cancel' in t and 'sail?' in t:
            for _ in range(menu):
                g.press('D', after=10)
            menu = None
        g.press('A', after=40)
    return seen


def said(texts, s):
    return any(s in t for t in texts)


def walk_steps(g, d, n):
    for _ in range(n):
        g.press(d, hold=8, after=20)


def main():
    if SHOTS:
        os.makedirs(SHOTS, exist_ok=True)

    # --- the call --------------------------------------------------------------------
    for st, call in ((None, 'SPECIALCALL_TRAVEL_ELM'), ('KANTO', 'SPECIALCALL_TRAVEL_OAK'),
                     ('HOENN', 'SPECIALCALL_TRAVEL_BIRCH')):
        name = (st or 'JOHTO').capitalize()
        g = setup(badges=3, start=st)
        warp(g, 'NEW_BARK_TOWN', 6, 8)
        walk_steps(g, 'R', 1)
        walk_steps(g, 'L', 1)
        check(f'{name} start, 3 badges: no call', g.rd('wSpecialPhoneCallID') == 0 and
              not flag(g, 'EVENT_TRAVEL_PROF_CALLED'))
        g = setup(badges=4, start=st)
        warp(g, 'NEW_BARK_TOWN', 6, 8)
        walk_steps(g, 'R', 1)
        got = g.rd('wSpecialPhoneCallID')
        if st is None:
            g.frames(240)
            shot(g, 'call_elm.png')
        for _ in range(30):
            if flag(g, 'EVENT_TRAVEL_PROF_CALLED'):
                break
            g.press('A', after=40)
        check(f'{name} start, 4 badges: {call} (the start region\'s professor), then it is done',
              got == g.const(call) and flag(g, 'EVENT_TRAVEL_PROF_CALLED') and g.rd('wSpecialPhoneCallID') == 0,
              f'call={got}')

    # --- Elm's errand (Johto start) ----------------------------------------------------
    g = setup(badges=4)
    set_flag(g, 'EVENT_TRAVEL_PROF_CALLED')
    tickets = has(g, 'S_S_TICKET')
    warp(g, 'ELMS_LAB', 5, 3, 'U')
    texts = talk(g, lambda g: flag(g, 'EVENT_GOT_TRAVEL_PARCELS'), limit=80)
    check('Elm: the errand, then the two parcels and the S.S. Ticket',
          has(g, 'OAK_PARCEL') and has(g, 'BIRCH_PARCEL') and not has(g, 'ELM_PARCEL') and has(g, 'S_S_TICKET'),
          f'had ticket before: {tickets}')
    check("Elm: the Olivine Port gangway opens (its HOF sprites swap)",
          flag(g, 'EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME') and
          not flag(g, 'EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME') and flag(g, 'EVENT_GOT_SS_TICKET_FROM_ELM'))
    check('Elm: tells where the ship sails', said(texts, 'from Olivine Port'), str(texts[-6:]))
    texts = talk(g, lambda g: g.screen_text().strip() == '' or 'Elm' in g.screen_text() and False, limit=6)
    check('Elm: no second set of parcels', count(g, 'OAK_PARCEL') == 1)

    # --- Olivine Port -> Slateport --------------------------------------------------
    warp(g, 'OLIVINE_PORT', 7, 13)
    first = not flag(g, 'EVENT_FAST_SHIP_FIRST_TIME')
    texts = []
    walk_steps(g, 'D', 2)  # onto the boarding tile
    g.frames(40)
    texts = talk(g, lambda g: at(g, 'FAST_SHIP_1F'), menu=1, limit=60, texts=texts)
    shot(g, 'ship.png')
    check('Olivine: board, "Hoenn: Slateport" from the menu, on the ship',
          at(g, 'FAST_SHIP_1F') and said(texts, 'Hoenn: Slateport') and said(texts, 'Kanto: Vermilion'), str(texts[-8:]))
    check('Olivine -> Slateport: destination flags', flag(g, 'EVENT_FAST_SHIP_DESTINATION_SLATEPORT') and
          not flag(g, 'EVENT_FAST_SHIP_DESTINATION_OLIVINE'))
    idle(g)
    check('the first voyage: the grandpa scene is set up', first and
          g.rd('wFastShip1FSceneID') == 2, str(g.rd('wFastShip1FSceneID')))
    # skip the voyage: the ship has arrived; the sailor at the door lets the player off
    g.wr('wFastShip1FSceneID', 0)
    set_flag(g, 'EVENT_FAST_SHIP_HAS_ARRIVED')
    g.press('U', hold=2, after=20)
    texts = talk(g, lambda g: at(g, 'SLATEPORT_HARBOR'), limit=30)
    g.frames(120)
    check('arrival: "arrived in Slateport City", off at Slateport Harbor (12, 9)',
          at(g, 'SLATEPORT_HARBOR', 12, 9) and said(texts, 'Slateport City'), f'{here(g)} {texts[-4:]}')
    check('arrival: the first voyage is over', flag(g, 'EVENT_FAST_SHIP_FIRST_TIME') and
          flag(g, 'EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP'))
    check('arrival: blacking out now returns to Slateport',
          g.rd('wLastSpawnMapGroup') == g.const('GROUP_SLATEPORT_CITY') and
          g.rd('wLastSpawnMapNumber') == g.const('MAP_SLATEPORT_CITY'))

    # --- Birch's delivery ------------------------------------------------------------
    gb, bells = count(g, 'GREAT_BALL'), count(g, 'SHELL_BELL')
    warp(g, 'BIRCHS_LAB', 5, 3, 'U')
    texts = talk(g, lambda g: flag(g, 'EVENT_DELIVERED_BIRCH_PARCEL') and 'this region' in g.screen_text(), limit=30)
    g.press('A', after=60)
    check('Birch: takes his parcel, 5 Great Balls and a Shell Bell',
          not has(g, 'BIRCH_PARCEL') and count(g, 'GREAT_BALL') == gb + 5 and count(g, 'SHELL_BELL') == bells + 1,
          str(texts[-5:]))
    g.press('A', after=60)
    for _ in range(10):
        g.press('A', after=30)
    check('Birch: only once', count(g, 'SHELL_BELL') == bells + 1)

    # --- Slateport -> Vermilion ------------------------------------------------------
    warp(g, 'SLATEPORT_HARBOR', 12, 9, 'R')
    texts = talk(g, lambda g: at(g, 'FAST_SHIP_1F'), menu=1, limit=40)
    check('Slateport: the pier sailor boards; "Kanto: Vermilion" from the menu',
          at(g, 'FAST_SHIP_1F') and said(texts, 'Johto: Olivine') and not flag(g, 'EVENT_FAST_SHIP_DESTINATION_SLATEPORT')
          and not flag(g, 'EVENT_FAST_SHIP_DESTINATION_OLIVINE'), str(texts[-6:]))
    check('a later voyage: the eastbound passengers are aboard', not flag(g, 'EVENT_FAST_SHIP_PASSENGERS_EASTBOUND')
          and flag(g, 'EVENT_FAST_SHIP_PASSENGERS_WESTBOUND'))
    idle(g)
    set_flag(g, 'EVENT_FAST_SHIP_HAS_ARRIVED')
    g.press('U', hold=2, after=20)
    texts = talk(g, lambda g: at(g, 'VERMILION_PORT'), limit=30)
    g.frames(200)
    check('arrival in Vermilion', at(g, 'VERMILION_PORT') and said(texts, 'Vermilion City'), str(here(g)))

    # --- Oak's delivery --------------------------------------------------------------
    ub, xm = count(g, 'ULTRA_BALL'), count(g, 'EXP_CANDY_M')
    warp(g, 'OAKS_LAB', 4, 3, 'U')
    texts = talk(g, lambda g: flag(g, 'EVENT_DELIVERED_OAK_PARCEL') and 'this region' in g.screen_text(), limit=30)
    g.press('A', after=60)
    check('Oak: takes his parcel, 5 Ultra Balls and an Exp. Candy M', not has(g, 'OAK_PARCEL') and
          count(g, 'ULTRA_BALL') == ub + 5 and count(g, 'EXP_CANDY_M') == xm + 1,
          str(texts[-4:]))

    # --- Vermilion -> Olivine --------------------------------------------------------
    warp(g, 'VERMILION_PORT', 7, 9)
    walk_steps(g, 'D', 2)
    g.frames(40)
    texts = talk(g, lambda g: at(g, 'FAST_SHIP_1F'), menu=0, limit=60)
    check('Vermilion: "Johto: Olivine" from the menu', at(g, 'FAST_SHIP_1F') and
          flag(g, 'EVENT_FAST_SHIP_DESTINATION_OLIVINE') and said(texts, 'Hoenn: Slateport'), str(texts[-6:]))
    idle(g)
    set_flag(g, 'EVENT_FAST_SHIP_HAS_ARRIVED')
    g.press('U', hold=2, after=20)
    talk(g, lambda g: at(g, 'OLIVINE_PORT'), limit=30)
    g.frames(200)
    check('arrival in Olivine', at(g, 'OLIVINE_PORT'), str(here(g)))

    # --- Kanto start: Oak's errand; Elm's delivery ------------------------------------
    g = setup(badges=4, start='KANTO')
    set_flag(g, 'EVENT_TRAVEL_PROF_CALLED')
    warp(g, 'OAKS_LAB', 4, 3, 'U')
    talk(g, lambda g: flag(g, 'EVENT_GOT_TRAVEL_PARCELS') and 'Off you go' not in g.screen_text(), limit=40)
    check('Kanto start: Oak gives the Elm and Birch parcels', has(g, 'ELM_PARCEL') and has(g, 'BIRCH_PARCEL')
          and not has(g, 'OAK_PARCEL') and has(g, 'S_S_TICKET'))
    gb, xm = count(g, 'GREAT_BALL'), count(g, 'EXP_CANDY_M')
    warp(g, 'ELMS_LAB', 5, 3, 'U')
    talk(g, lambda g: flag(g, 'EVENT_DELIVERED_ELM_PARCEL') and 'this region' in g.screen_text(), limit=30)
    g.press('A', after=60)
    check('Elm: takes his parcel, 5 Great Balls and an Exp. Candy M',
          not has(g, 'ELM_PARCEL') and count(g, 'GREAT_BALL') == gb + 5 and count(g, 'EXP_CANDY_M') == xm + 1)

    # --- no ticket ------------------------------------------------------------------
    g = setup(badges=4)
    while has(g, 'S_S_TICKET'):
        g.script('\ttakeitem S_S_TICKET', 10)
    warp(g, 'SLATEPORT_HARBOR', 12, 9, 'R')
    texts = talk(g, lambda g: 'But no Ticket' in g.screen_text(), limit=20)
    for _ in range(6):
        g.press('A', after=30)
    check('no ticket: no boarding', at(g, 'SLATEPORT_HARBOR') and said(texts, 'But no Ticket'))
    # Hoenn start with no call yet: Birch has nothing new
    g = setup(badges=3, start='HOENN')
    warp(g, 'BIRCHS_LAB', 5, 3, 'U')
    talk(g, lambda g: False, limit=6)
    check('before the call: no parcels', not has(g, 'ELM_PARCEL') and not flag(g, 'EVENT_GOT_TRAVEL_PARCELS'))

    bad = [n for n, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
