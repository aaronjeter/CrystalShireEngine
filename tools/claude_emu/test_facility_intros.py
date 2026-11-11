"""The introductory challenge facilities, played through from the desk.

For Viridian's Trainer House (B1F, the receptionist's coord event) and Earl's
Academy (the teacher): pick 4 of 5 Pokémon, then win the 3 double battles (the
foes are kept at 1 HP) or lose the first one (the party at 1 HP). A win gives
the prize once and sets the cleared flag; either way the player walks back and
the party is as it was.

usage: test_facility_intros.py ROM SYM STATE
"""
import sys
from harness import warp_script
from battle_test import Battle, is_party_menu
import test_facility as T

ROM, SYM, STATE = sys.argv[1:4]
check = T.check

INTROS = [
    # name, map, warp x, y, steps to the desk, end position, flag, prize
    ('Kanto', 'TRAINER_HOUSE_B1F', 9, 4, 'LUL', (8, 3), 'EVENT_FACILITY_INTRO_KANTO', 'RARE_CANDY'),
    ('Johto', 'EARLS_POKEMON_ACADEMY', 1, 12, 'LA', (1, 12), 'EVENT_FACILITY_INTRO_JOHTO', 'RARE_CANDY'),
    ('Hoenn', 'RUSTBORO_TRAINERS_SCHOOL', 1, 12, 'LA', (1, 12), 'EVENT_FACILITY_INTRO_HOENN', 'RARE_CANDY'),
]


class Win(Battle):
    """Keeps every foe at 1 HP."""
    def at_menu(self):
        g = self.g
        psize = g.const('PARTYMON_STRUCT_LENGTH')
        for i in range(g.rd('wOTPartyCount')):
            if g.rd16(f'wOTPartyMon1HP+{i * psize}'):
                g.wr(f'wOTPartyMon1HP+{i * psize}', [0, 1])
        if g.rd16('wEnemyMonHP'):
            g.wr('wEnemyMonHP', [0, 1])
        # doubles: both foes' slots at 1 HP, both of ours at full HP
        size, mon = g.slot_size(), g.const('BSLOT_MON')
        hp, mx = g.const('BATTLEMON_HP'), g.const('BATTLEMON_MAX_HP')
        base = g.sym['wBattlerSlots'][1]
        bank = g.sym['wBattlerSlots'][0]
        for slot in range(4):
            a = base + slot * size + mon
            if slot >= 2:
                if g.rd(f'wBattlerSlots+{slot * size + mon + hp}', 2) != [0, 0]:
                    g.wr(f'wBattlerSlots+{slot * size + mon + hp}', [0, 1])
            else:
                m = g.rd(f'wBattlerSlots+{slot * size + mon + mx}', 2)
                if g.rd(f'wBattlerSlots+{slot * size + mon + hp}', 2) != [0, 0]:
                    g.wr(f'wBattlerSlots+{slot * size + mon + hp}', m)
        if g.rd16('wBattleMonHP'):
            g.wr('wBattleMonHP', g.rd('wBattleMonMaxHP', 2))
        # rounds 1 and 2: the two waiting in the back get hurt, once (round 3 has no heal after it)
        if self.round < 2 and not getattr(self, 'hurt', False):
            self.hurt = True
            for i in (2, 3):
                g.wr(f'wPartyMon1HP+{i * psize}', [0, 1])
        return super().at_menu()


class Lose(Battle):
    """Keeps every party Pokémon at 1 HP."""
    def at_menu(self):
        g = self.g
        psize = g.const('PARTYMON_STRUCT_LENGTH')
        for i in range(g.rd('wPartyCount')):
            if g.rd16(f'wPartyMon1HP+{i * psize}'):
                g.wr(f'wPartyMon1HP+{i * psize}', [0, 1])
        if g.rd16('wBattleMonHP'):
            g.wr('wBattleMonHP', [0, 1])
        return super().at_menu()


def flag(g, name):
    n = g.const16(name)
    return g.rd(f'wEventFlags+{n // 8}') >> (n % 8) & 1


def exactly(g, name, n):
    # n of the item: taking n works, and none are left
    g.script(f'\ttakeitem {name}, {n}', 20)
    took = g.rd('wScriptVar')
    return took and not item_count(g, name)


def item_count(g, name):
    g.script(f'\tcheckitem {name}', 20)
    return g.rd('wScriptVar')


def play(mapc, x, y, steps, end, win, full=False):
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.run_script(warp_script(mapc, x, y))
    g.frames(200)
    g.wr('wPartyCount', 0)
    g.wr('wPartySpecies', 0xff)
    for s_ in ('MACHOP', 'GEODUDE', 'ONIX', 'GROWLITHE', 'PIDGEY'):
        g.script(f'\tgivepoke {s_}, 20', 60)
        for _ in range(6):
            g.press('B', after=20)
    for it in ('RARE_CANDY', 'ABILITY_CAPSULE', 'ABILITY_PATCH'):
        g.script(f'\ttakeitem {it}, 99', 20)
    if full:  # the item pocket full of Potions: no room for the prizes
        pot = g.const16('POTION')
        n = g.const('MAX_ITEMS')
        g.wr('wNumItems', n)
        g.wr('wItems', [pot & 0xff, pot >> 8, 1] * n + [0xff])
    before = T.party_block(g)
    g.money = g.rd('wMoney', 3)
    for d in steps:
        if d == 'A':
            g.press('A', after=40)
        else:
            g.press(d, hold=10, after=40)
    battles, results, healed = 0, [], []
    want = 3 if win else 1
    for _ in range(600):
        if g.rd('wBattleMode'):
            if battles:
                psize = g.const('PARTYMON_STRUCT_LENGTH')
                healed.append(all(g.rd16(f'wPartyMon1HP+{i * psize}') == g.rd16(f'wPartyMon1MaxHP+{i * psize}')
                                  for i in range(4)))
            b = (Win if win else Lose)(g, [])
            b.round = battles
            b.run()
            results.append(g.rd('wBattleResult') & 0xf)
            battles += 1
            continue
        g.press('A', after=30)  # the party menu starts on the first Pokémon not picked yet
        if battles == want and (g.rd('wXCoord'), g.rd('wYCoord')) == end:
            for _ in range(40):  # the rest of the desk's lines and the prizes
                g.press('B', after=40)
            break
        if full and _ > 60:
            break
    g.healed = healed
    return g, before, battles, results


def main():
    for name, mapc, x, y, steps, end, fl, prize in INTROS:
        g, before, battles, results = play(mapc, x, y, steps, end, win=True)
        check(f'{name}: 3 double battles, all won', battles == 3 and results == [0, 0, 0], str(results))
        check(f'{name}: the whole team healed before rounds 2 and 3', g.healed == [True, True], str(g.healed))
        check(f'{name}: the cleared flag, 3 Rare Candies, 2 Ability Capsules, 1 Ability Patch',
              flag(g, fl) and exactly(g, 'RARE_CANDY', 3) and exactly(g, 'ABILITY_CAPSULE', 2) and
              exactly(g, 'ABILITY_PATCH', 1))
        check(f'{name}: the party is back as it was', T.party_block(g) == before)
        check(f'{name}: the 4 picked in party order (the menu starts on the next one)',
              g.rd('wFacilityPicks', 4) == [0, 1, 2, 3], str(g.rd('wFacilityPicks', 4)))
        check(f'{name}: no prize money', g.rd('wMoney', 3) == g.money)
        g, before, battles, results = play(mapc, x, y, steps, end, win=False)
        check(f'{name}: a loss ends the run after one battle', battles == 1 and results == [1], str(results))
        check(f'{name}: after a loss, no flag and the party is back', not flag(g, fl) and T.party_block(g) == before)
    name, mapc, x, y, steps, end, fl, prize = INTROS[0]
    g, before, battles, results = play(mapc, x, y, steps, end, win=True, full=True)
    check('Kanto, Pack too full for the prizes: no challenge, no flag, nothing taken',
          battles == 0 and not flag(g, fl) and g.rd('wNumItems') == g.const('MAX_ITEMS') and
          not item_count(g, 'RARE_CANDY'), str(battles))
    bad = [n for n, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
