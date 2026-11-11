"""The intermediate challenge facilities (Challenge Halls) and the BP shop.

For Vermilion, Goldenrod and Mauville: win the 3 double battles from the
receptionist (first clear: 3 BP, the hall's held item, 3 Rare Candies, 2
Ability Capsules, an Ability Patch; the cleared flag), or lose the first. Then
the BP shop (Tier 1): a Rare Candy for 2 BP, and "not enough BP" when short.

usage: test_facility_halls.py ROM SYM STATE
"""
import sys
import test_facility as T
import test_facility_intros as I
from harness import warp_script

ROM, SYM, STATE = sys.argv[1:4]
check = T.check

HALLS = [
    ('Kanto', 'VERMILION_CHALLENGE_HALL', 'EVENT_FACILITY_HALL_KANTO', 'WIDE_LENS'),
    ('Johto', 'GOLDENROD_CHALLENGE_HALL', 'EVENT_FACILITY_HALL_JOHTO', 'BIG_ROOT'),
    ('Hoenn', 'MAUVILLE_CHALLENGE_HALL', 'EVENT_FACILITY_HALL_HOENN', 'BINDING_BAND'),
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


def main():
    for name, mapc, fl, item in HALLS:
        g, before, battles, results = I.play(mapc, 2, 12, 'UA', (2, 12), win=True)
        check(f'{name}: 3 double battles, all won', battles == 3 and results == [0, 0, 0], str(results))
        check(f'{name}: the cleared flag, 3 BP, {item}, 3 Rare Candies, 2 Capsules, 1 Patch',
              I.flag(g, fl) and bp(g) >= 3 and I.item_count(g, item) and I.exactly(g, 'RARE_CANDY', 3) and
              I.exactly(g, 'ABILITY_CAPSULE', 2) and I.exactly(g, 'ABILITY_PATCH', 1), f'BP {bp(g)}')
        check(f'{name}: the party is back as it was, no prize money',
              T.party_block(g) == before and g.rd('wMoney', 3) == g.money)
        g, before, battles, results = I.play(mapc, 2, 12, 'UA', (2, 12), win=False)
        check(f'{name}: a loss ends the run, no flag', battles == 1 and results == [1] and not I.flag(g, fl))
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    bought, refused = shop(g)
    check('BP shop: a Rare Candy for 2 BP', bought, f'BP {bp(g)}')
    check('BP shop: not enough BP for an Ability Capsule', refused)
    bad = [n for n, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
