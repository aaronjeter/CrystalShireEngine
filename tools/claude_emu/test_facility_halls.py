"""The intermediate challenge facilities (Challenge Halls) and the BP shop.

For the intermediate halls (Vermilion, Goldenrod, Mauville) and the hard ones
(Saffron, Route 40, Lilycove): closed until the region's previous facility is
cleared; then win the 3 double battles from the receptionist
(first clear: 3 or 5 BP, the hall's held item, 3 Rare Candies, 2 Ability
Capsules, an Ability Patch; the cleared flag), or lose the first. Then the BP
shops: Tier 1, a Rare Candy for 2 BP and "not enough BP" when short; Tier 2
(the hard halls' second clerk), an Ability Patch for 6 BP.

usage: test_facility_halls.py ROM SYM STATE
"""
import sys
import test_facility as T
import test_facility_intros as I
from harness import warp_script

ROM, SYM, STATE = sys.argv[1:4]
check = T.check

HALLS = [
    # name, map, cleared flag, held item, first-clear BP, the previous facility's flag (needed first)
    ('Kanto', 'VERMILION_CHALLENGE_HALL', 'EVENT_FACILITY_HALL_KANTO', 'WIDE_LENS', 3, 'EVENT_FACILITY_INTRO_KANTO'),
    ('Johto', 'GOLDENROD_CHALLENGE_HALL', 'EVENT_FACILITY_HALL_JOHTO', 'BIG_ROOT', 3, 'EVENT_FACILITY_INTRO_JOHTO'),
    ('Hoenn', 'MAUVILLE_CHALLENGE_HALL', 'EVENT_FACILITY_HALL_HOENN', 'BINDING_BAND', 3, 'EVENT_FACILITY_INTRO_HOENN'),
    ('Kanto hard', 'SAFFRON_CHALLENGE_HALL', 'EVENT_FACILITY_HARD_KANTO', 'EXPERT_BELT', 5, 'EVENT_FACILITY_HALL_KANTO'),
    ('Johto hard', 'ROUTE_40_CHALLENGE_HALL', 'EVENT_FACILITY_HARD_JOHTO', 'ROCKY_HELMET', 5, 'EVENT_FACILITY_HALL_JOHTO'),
    ('Hoenn hard', 'LILYCOVE_CHALLENGE_HALL', 'EVENT_FACILITY_HARD_HOENN', 'SHELL_BELL', 5, 'EVENT_FACILITY_HALL_HOENN'),
]


def bp(g):
    return g.rd16('wBattlePoints')


def shop(g):
    """Buy a Rare Candy (2 BP) at the clerk with 3 BP, then try an Ability Capsule (3 BP) with 1."""
    g.run_script(warp_script('VERMILION_CHALLENGE_HALL', 9, 12))
    g.frames(200)
    g.script('\ttakeitem RARE_CANDY, 99', 20)
    g.wr('wBattlePoints', [0, 3])
    g.press('U', hold=10, after=40)
    for _ in range(12):  # the clerk's lines, until the shop list (its BP box) shows
        if 'BP' in g.screen_text().split('\n')[1]:
            break
        g.press('A', after=40)
    g.frames(30)
    for _ in range(6):
        g.press('D', after=15)
    g.press('A', after=150)  # Rare Candy: costs 2 BP. OK?
    g.press('A', after=150)  # Yes
    g.press('A', after=60)
    after_candy = bp(g)
    g.press('D', after=15)
    g.press('D', after=15)
    g.press('A', after=150)  # Ability Capsule
    g.press('A', after=150)  # Yes: not enough
    text = ' '.join(g.screen_text().split('\n')[13:17])
    g.press('A', after=60)
    for _ in range(6):
        g.press('B', after=40)
    g.frames(60)
    bought = after_candy == 1 and I.item_count(g, 'RARE_CANDY')
    return bought, 'enough BP' in text and bp(g) == 1 and not I.item_count(g, 'ABILITY_CAPSULE')


def shop2(g):
    """Buy an Ability Patch (6 BP, the last Tier 2 item) at Saffron's second clerk with 7 BP."""
    g.run_script(warp_script('SAFFRON_CHALLENGE_HALL', 9, 9))
    g.frames(200)
    g.script('\ttakeitem ABILITY_PATCH, 99', 20)
    g.wr('wBattlePoints', [0, 7])
    g.press('U', hold=4, after=40)
    for _ in range(12):
        if 'BP' in g.screen_text().split('\n')[1]:
            break
        g.press('A', after=40)
    g.frames(30)
    for _ in range(4):
        g.press('D', after=15)
    g.press('A', after=150)
    g.press('A', after=150)
    g.press('A', after=60)
    for _ in range(6):
        g.press('B', after=40)
    return bp(g) == 1 and I.item_count(g, 'ABILITY_PATCH')


def main():
    for name, mapc, fl, item, gain, need in HALLS:
        g, before, battles, results = I.play(mapc, 2, 12, 'UA', (2, 12), win=True, locked=True)
        check(f'{name}: closed until the previous facility is cleared', battles == 0 and not I.flag(g, fl))
        g, before, battles, results = I.play(mapc, 2, 12, 'UA', (2, 12), win=True, flags=[need])
        check(f'{name}: 3 double battles, all won', battles == 3 and results == [0, 0, 0], str(results))
        check(f'{name}: the cleared flag, {gain} BP, {item}, 3 Rare Candies, 2 Capsules, 1 Patch',
              I.flag(g, fl) and bp(g) >= gain and I.item_count(g, item) and I.exactly(g, 'RARE_CANDY', 3) and
              I.exactly(g, 'ABILITY_CAPSULE', 2) and I.exactly(g, 'ABILITY_PATCH', 1), f'BP {bp(g)}')
        check(f'{name}: the party is back as it was, no prize money',
              T.party_block(g) == before and g.rd('wMoney', 3) == g.money)
        g, before, battles, results = I.play(mapc, 2, 12, 'UA', (2, 12), win=False, flags=[need])
        check(f'{name}: a loss ends the run, no flag', battles == 1 and results == [1] and not I.flag(g, fl))
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    bought, refused = shop(g)
    check('BP shop: a Rare Candy for 2 BP', bought, f'BP {bp(g)}')
    check('BP shop: not enough BP for an Ability Capsule', refused)
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    check('Tier 2 BP shop: an Ability Patch for 6 BP', shop2(g), f'BP {bp(g)}')
    bad = [n for n, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
