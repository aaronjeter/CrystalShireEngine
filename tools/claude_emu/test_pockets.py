"""The Pack's pockets (engine/items/items.asm, engine/items/pack.asm): each item type
goes to its own list (2-byte entries: the low byte of the index, the quantity),
a full pocket refuses more, the battle Pack opens on Medicine, a Medicine is used
from the Pack, a Treasure is sold at a mart, Berries go to the PC and back, and
Kurt counts and takes Apricorns across stacks.

usage: test_pockets.py ROM SYM STATE
"""
import sys
import test_facility as T

ROM, SYM, STATE = sys.argv[1:4]
check = T.check

CASES = [  # item, its list, its pocket
    ('REPEL', 'wNumItems', 'ITEM_POCKET'),
    ('POTION', 'wNumMedicine', 'MEDICINE_POCKET'),
    ('ORAN_BERRY', 'wNumBerries', 'BERRY_POCKET'),
    ('LEFTOVERS', 'wNumHeldItems', 'HELD_POCKET'),
    ('PROTEIN', 'wNumTrainingItems', 'TRAINING_POCKET'),
    ('NUGGET', 'wNumTreasures', 'TREASURE_POCKET'),
    ('POKE_BALL', 'wNumBalls', 'BALL_POCKET'),
]


HIGHS = {'wNumItems': 0, 'wNumMedicine': 1, 'wNumBerries': 2, 'wNumHeldItems': 3,
         'wNumTrainingItems': 4, 'wNumTreasures': 5, 'wNumBalls': 7}


def pocket(g, num):
    n = g.rd(num)
    data = g.rd(f'{num}+1', 2 * n + 1) if n else [g.rd(f'{num}+1')]
    return [(data[2 * k], data[2 * k + 1]) for k in range(n)], data[-1]


def count_of(g, num, low):
    return sum(q for lo, q in pocket(g, num)[0] if lo == low)


def fresh():
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.frames(30)
    return g


def open_pack_on(g, pocket_const):
    g.wr('wLastPocket', [g.const(pocket_const)])
    g.press('START', after=30)
    g.press('D', after=15)
    g.press('D', after=15)
    g.press('A', after=120)


def main():
    g = fresh()
    for item, num, pck in CASES:
        low = g.const16(item) & 0xff
        before = count_of(g, num, low)
        g.script(f'\tgiveitem {item}, 3', 30)
        ok = g.rd('wScriptVar') == 1 and count_of(g, num, low) == before + 3
        g.script(f'\tcheckitem {item}', 30)
        ok = ok and g.rd('wScriptVar') == 1
        g.script(f'\ttakeitem {item}, 2', 30)
        ok = ok and count_of(g, num, low) == before + 1
        lst, end = pocket(g, num)
        check(f'{item}: given, checked and taken in {num}', ok and end == 0xff, f'{before} {lst}')
        check(f'{item}: its index is in its pocket\'s ID block', g.const16(item) >> 8 == HIGHS[num], hex(g.const16(item)))

    # a full pocket refuses more (Training: 20 entries; stacks of 99 Protein)
    for _ in range(25):
        g.script('\tgiveitem PROTEIN, 99', 20)
    n = g.rd('wNumTrainingItems')
    g.script('\tgiveitem PROTEIN, 99', 20)
    check('full pocket: 20 entries at most, giveitem fails',
          n == g.const('MAX_TRAINING') and g.rd('wScriptVar') == 0, f'{n} {g.rd("wScriptVar")}')
    lst, end = pocket(g, 'wNumTrainingItems')
    check('full pocket: the list still ends with -1', end == 0xff)

    # the battle Pack opens on Medicine
    g = fresh()
    g.wr('wLastPocket', [g.const('KEY_ITEM_POCKET')])
    g.script(g.call('BattlePack'), 150)
    check('battle Pack: opens on Medicine', g.rd('wCurPocket') == g.const('MEDICINE_POCKET'), str(g.rd('wCurPocket')))
    for _ in range(4):
        g.press('B', after=40)

    # using a Potion from the Medicine pocket on the first party Pokémon
    g = fresh()
    g.script('\tgiveitem POTION, 5', 30)
    hp_max = g.rd('wPartyMon1MaxHP', 2)
    g.wr('wPartyMon1HP', [0, 1])
    open_pack_on(g, 'MEDICINE_POCKET')
    check('Pack: opened on the Medicine pocket', g.rd('wCurPocket') == g.const('MEDICINE_POCKET'))
    g.press('A', after=40)  # Potion
    g.press('A', after=150)  # Use
    g.press('A', after=200)  # the first Pokémon
    for _ in range(4):
        g.press('A', after=60)
    hp = g.rd('wPartyMon1HP', 2)
    hp = hp[0] << 8 | hp[1]
    low = g.const16('POTION') & 0xff
    check('Medicine: the Potion healed and one was used', hp > 1 and count_of(g, 'wNumMedicine', low) == 4, f'hp {hp}')

    # selling a Nugget at a mart (Treasures pocket)
    g = fresh()
    g.script('\tgiveitem NUGGET, 2', 30)
    money = g.rd('wMoney', 3)
    g.script('\topentext\n\tpokemart MARTTYPE_STANDARD, MART_CHERRYGROVE\n\tclosetext', 200)
    g.press('D', after=20)
    g.press('A', after=150)  # Sell: the Pack opens on Items
    for _ in range(5):
        g.press('R', hold=6, after=80)  # to Treasures
    pocket_now = g.rd('wJumptableIndex')
    low = g.const16('NUGGET') & 0xff
    pos = [lo for lo, q in pocket(g, 'wNumTreasures')[0]].index(low)
    for _ in range(pos):
        g.press('D', after=20)
    g.press('A', after=60)  # Nugget
    g.press('A', after=60)  # quantity 1
    g.press('A', after=60)  # yes
    for _ in range(3):
        g.press('A', after=60)
    low = g.const16('NUGGET') & 0xff
    m2 = g.rd('wMoney', 3)
    check('mart: sold a Nugget from Treasures', pocket_now == g.const('TREASURE_POCKET') and
          count_of(g, 'wNumTreasures', low) == 1 and m2 != money, f'pocket {pocket_now} money {money} -> {m2}')

    # the PC: Berries deposited (16-bit indexes in the PC's list) and withdrawn
    g = fresh()
    low = g.const16('ORAN_BERRY') & 0xff
    before = count_of(g, 'wNumBerries', low)
    pos = [lo for lo, q in pocket(g, 'wNumBerries')[0]].index(low)
    g.script('\topentext\n' + g.call('PlayersHousePC') + '\n\tclosetext', 200)
    g.press('A', after=60)  # the house PC's menu text
    g.press('D', after=20)
    g.press('A', after=150)  # Deposit Item: the Pack opens on Items
    for _ in range(2):
        g.press('R', hold=6, after=80)  # to Berries
    for _ in range(pos):
        g.press('D', after=20)
    g.press('A', after=60)  # the Oran Berry
    g.press('A', after=60)  # quantity 1: deposited
    pc_n = g.rd('wNumPCItems')
    pc = g.rd('wPCItems', 3 * pc_n)
    idx = g.const16('ORAN_BERRY')
    in_pc = any(pc[3 * k] == idx >> 8 and pc[3 * k + 1] == idx & 0xff for k in range(pc_n))
    check('PC: an Oran Berry deposited from the Berries pocket', in_pc and count_of(g, 'wNumBerries', low) == before - 1,
          f'{before} -> {count_of(g, "wNumBerries", low)}')

    # Kurt: Apricorns across two stacks
    g = fresh()
    g.script('\tgiveitem RED_APRICORN, 99\n\tgiveitem RED_APRICORN, 5', 40)
    g.script('\tsetval 0', 10)
    rid = g.const16('RED_APRICORN')
    # wCurItem needs the 8-bit ID: look it up through the index table
    g.script('\tcheckitem RED_APRICORN', 30)
    cur = g.rd('wCurItem')
    g.wr('wCurItem', [cur])
    g.script(g.call('Kurt_GetQuantityOfApricorn'), 30)
    check('Kurt: counts 104 as 99', g.rd('wItemQuantityChange') == 99, str(g.rd('wItemQuantityChange')))
    g.wr('wCurItem', [cur])
    g.wr('wItemQuantityChange', [101])
    g.script(g.call('Kurt_GiveUpSelectedQuantityOfSelectedApricorn'), 30)
    left = count_of(g, 'wNumBerries', rid & 0xff)
    check('Kurt: takes 101 from two stacks, 3 left', left == 3, str(left))

    bad = [x for x, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
