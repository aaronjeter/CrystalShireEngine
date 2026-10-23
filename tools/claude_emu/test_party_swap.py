"""Phase 1 install B test: party edits reach a battler stored in a slot (double battles).

There is no double battle yet (phase 2), so each case fakes one inside a singles trainer battle:
at the first battle menu it sets wDoubleBattle, marks E2 empty and builds slot P2 from party
mon 2 (as SaveBattlerSlot would: the live player variables in BattlerSwapList order, with the
battle struct, nickname, stats and party index of mon 2). Then an item, a move or EXP edits
party mon 2, and the party/slot check of battle_test.py must find the slot updated too.

    python3 test_party_swap.py ROM.gbc ROM.sym STATE      (needs ROM.map next to the .sym)
"""
import sys
import battle_test as bt
from gb import Sym

PAR = 1 << 6


def slot_base(g, slot):
    return g.sym['wBattlerSlots'][1] + slot * g.slot_size()


def wram_index(addr, bank):
    return addr - 0xC000 if addr < 0xD000 else bank * 0x1000 + addr - 0xD000


def build_p2(g, status=0, hp=None, speed_div=1):
    """Fake a stored P2 = party mon 2 (and E2 empty)."""
    by, size = bt.swap_layout(g.rom_path, g.sym)
    w = g.wram_full()
    b, a = g.sym['BattlerSwapList']
    r = g.rom()
    p = b * 0x4000 + a - 0x4000
    slot = [0] * size
    off = 0
    while r[p]:
        n, pa = r[p], r[p + 1] | r[p + 2] << 8
        if pa:
            for i in range(n):
                slot[off + i] = w[wram_index(pa + i, 1)]
        off += n; p += 5
    A = lambda s: g.sym[s][1]
    psize = A('wPartyMon2') - A('wPartyMon1')
    if hp is not None:
        g.wr16(f'wPartyMon1HP+{psize}', hp)
    g.wr(f'wPartyMon1Status+{psize}', status)
    mon = g.rd('wPartyMon2', psize)
    pf = lambda f: A(f'wPartyMon1{f}') - A('wPartyMon1')
    mon_off = by[A('wBattleMon')]
    for f, n in [('Species', 1), ('Item', 1), ('Moves', 4), ('DVs', 2), ('PP', 4), ('Happiness', 1),
                 ('Level', 1), ('Status', 1), ('HP', 2), ('MaxHP', 2), ('Attack', 10)]:
        bo = mon_off + A(f'wBattleMon{f}') - A('wBattleMon')
        slot[bo:bo + n] = mon[pf(f):pf(f) + n]
    so = by[A('wPlayerStats')]
    slot[so:so + 10] = mon[pf('Attack'):pf('Attack') + 10]
    if speed_div != 1:  # paralysis quarters the battle struct's Speed (wPlayerStats keeps it)
        bo = mon_off + A('wBattleMonSpeed') - A('wBattleMon')
        sp = (slot[bo] << 8 | slot[bo + 1]) // speed_div
        slot[bo:bo + 2] = [sp >> 8, sp & 0xFF]
    slot[by[A('wCurBattleMon')]] = 1
    nick = g.rd(f'wPartyMonNicknames+{11}', 11)
    slot[by[A('wBattleMonNickname')]:by[A('wBattleMonNickname')] + 11] = nick
    base = slot_base(g, 1)
    for i, v in enumerate(slot):
        g.wr(f'wBattlerSlots+{base - g.sym["wBattlerSlots"][1] + i}', v)
    g.wr('wDoubleBattle', 1)
    g.wr('wAreaSlots', [0, 2])
    g.wr('wEmptyBattlerSlots', 1 << 3)
    g.wr('wPartyMonSwap', 0)
    return by


class FakeDoubles(bt.Battle):
    def __init__(self, g, actions, setup, replace=()):
        super().__init__(g, actions, replace)
        self.setup = setup

    def at_menu(self):
        if self.turn == 0:
            self.by = self.setup(self.g)
        super().at_menu()


def run(rom, sym, state, name, party, trainer, actions, setup, items=(), replace=()):
    g = bt.Game(rom, sym, state)
    g.rom_path = rom
    g.seed()
    g.clear_bag()
    g.set_party(party, items)
    g.seed()
    g.set_trainer('COOLTRAINERM', name[:10].upper(), trainer)
    g.seed()
    g.start_battle('COOLTRAINERM', 0x01 | bt.SCENE_OFF)
    b = FakeDoubles(g, actions, setup, replace)
    recs = b.run()
    return g, b, recs


def report(name, ok, detail=''):
    print(f'{"PASS" if ok else "FAIL"} {name} {detail}')
    return ok


def main():
    rom, sym, state = sys.argv[1:4]
    sy = Sym(sym)
    fails = 0
    MAGIKARP = [(30, 'MAGIKARP', None, ['SPLASH']), (30, 'MAGIKARP', None, ['SPLASH'])]

    # 1. Potion on the stored P2
    g, b, recs = run(rom, sym, state, 'potion',
                     [('MACHAMP', 40, None, ['KARATE_CHOP']), ('PIKACHU', 40, None, ['THUNDERBOLT', 'QUICK_ATTACK'])],
                     MAGIKARP, [('item', 'POTION', 1), ('move', 0)],
                     lambda g: build_p2(g, hp=20), items=[('POTION', 5)])
    menus = [r for r in recs if 'end' not in r]
    probs = bt.check_slots(recs, rom, sy)
    hp_after = menus[1]['wBattlerSlots'][1 * g.slot_size() + b.by[sy['wBattleMon'][1]] + sy['wBattleMonHP'][1] - sy['wBattleMon'][1]:][:2]
    d = menus[1]['wDoubleBattle']
    fails += not report('potion', not probs and hp_after == [0, 40] and d[1:3] == [0, 2] and recs[1]['wCurBattleMon'] == 0,
                        f'slot HP {hp_after}, area slots {d[1:3]}, problems {probs[:2]}')

    # 2. Heal Bell cures the stored partner and recalculates its stats (paralysis Speed)
    g, b, recs = run(rom, sym, state, 'healbell',
                     [('MACHAMP', 40, None, ['HEAL_BELL', 'KARATE_CHOP']), ('PIKACHU', 40, None, ['THUNDERBOLT'])],
                     MAGIKARP, [('move', 0), ('move', 1)],
                     lambda g: build_p2(g, status=PAR, speed_div=4))
    menus = [r for r in recs if 'end' not in r]
    probs = bt.check_slots(recs, rom, sy)
    sz = g.slot_size()
    A = lambda s: sy[s][1]
    so = 1 * sz + b.by[A('wBattleMon')] + A('wBattleMonSpeed') - A('wBattleMon')
    sp = menus[1]['wBattlerSlots'][so:so + 2]
    psize = A('wPartyMon2') - A('wPartyMon1')
    party_sp = menus[1]['wPartyMons'][psize + A('wPartyMon1Speed') - A('wPartyMon1'):][:2]
    fails += not report('heal_bell', not probs and sp == party_sp and menus[1]['wDoubleBattle'][1:3] == [0, 2],
                        f'slot Speed {sp} party Speed {party_sp}, problems {probs[:2]}')

    # 3. EXP: the stored P2 levels up (and learns a move); P1 stays loaded
    def setup_exp(g):
        by = build_p2(g)
        g.wr('wBattleParticipantsNotFainted', 0b11)
        return by
    g, b, recs = run(rom, sym, state, 'exp',
                     [('MACHAMP', 60, None, ['KARATE_CHOP']), ('PIKACHU', 5, None, ['THUNDERSHOCK'])],
                     [(40, 'MAGIKARP', None, ['SPLASH']), (40, 'MAGIKARP', None, ['SPLASH'])],
                     [('move', 0), ('move', 0)], setup_exp)
    menus = [r for r in recs if 'end' not in r]
    probs = bt.check_slots(recs, rom, sy)
    lv_party = menus[1]['wPartyMons'][psize + A('wPartyMon1Level') - A('wPartyMon1')]
    lv_slot = menus[1]['wBattlerSlots'][sz + b.by[A('wBattleMon')] + A('wBattleMonLevel') - A('wBattleMon')]
    mv_party = menus[1]['wPartyMons'][psize + A('wPartyMon1Moves') - A('wPartyMon1'):][:4]
    mv_slot = menus[1]['wBattlerSlots'][sz + b.by[A('wBattleMon')] + A('wBattleMonMoves') - A('wBattleMon'):][:4]
    p1_lv = menus[1]['wBattle'][A('wBattleMonLevel') - A('wBattle')]
    grew = any('grew to' in m for m in menus[1]['log'])
    fails += not report('exp', not probs and lv_party > 5 and lv_slot == lv_party and mv_slot == mv_party
                        and p1_lv == 60 and menus[1]['wDoubleBattle'][1:3] == [0, 2] and menus[1]['wCurBattleMon'] == 0 and grew,
                        f'party lv {lv_party} slot lv {lv_slot}, moves {mv_party} / {mv_slot}, P1 lv {p1_lv}, grew text {grew}, problems {probs[:2]}')

    # 4. On the field (install D): switching to the mon out in P2 is refused ("already out")
    def setup_field(g):
        by = build_p2(g)
        g.wr('wFieldMons', [0b011, 0b001])
        return by
    g, b, recs = run(rom, sym, state, 'onfield',
                     [('MACHAMP', 40, None, ['KARATE_CHOP']), ('PIKACHU', 40, None, ['THUNDERBOLT']),
                      ('GOLEM', 40, None, ['TACKLE'])],
                     MAGIKARP, [('switch', 1), ('move', 0)], setup_field, replace=[2])
    # after "already out" the party menu opens again: the driver then picks Golem
    menus = [r for r in recs if 'end' not in r]
    text = ' '.join(m for r in menus[:2] for m in r['log'])
    fails += not report('on_field', 'already out' in text and menus[1]['wCurBattleMon'] == 2,
                        f'cur mon {menus[1]["wCurBattleMon"]}, text {text[-120:]!r}')

    # 5. Leaving the field (install D): P1 switches out; links to P1 that end when it leaves are
    #    cleared (E1 trapped by P1, stored P2 attracted to P1), E1 seeded by P1 stays, P1's own
    #    links are cleared, and wFieldMons becomes mons 3 + 2.
    L = {n: g.const(f'BATTLER_LINK_{n}') for n in ['TRAPPED_BY', 'SEEDED_BY', 'ATTRACTED_TO', 'TARGET']}
    def setup_links(g):
        by = build_p2(g)
        g.wr('wFieldMons', [0b011, 0b001])
        g.wr(f'wEnemyBattlerLinks+{L["TRAPPED_BY"]}', 1)
        g.wr(f'wEnemyBattlerLinks+{L["SEEDED_BY"]}', 1)
        g.wr(f'wEnemyBattlerLinks+{L["TARGET"]}', 1)
        g.wr(f'wPlayerBattlerLinks+{L["TRAPPED_BY"]}', 4)
        off = 1 * g.slot_size() + by[g.sym['wPlayerBattlerLinks'][1]] + L['ATTRACTED_TO']
        g.wr(f'wBattlerSlots+{off}', 1)
        return by
    g, b, recs = run(rom, sym, state, 'links',
                     [('MACHAMP', 40, None, ['KARATE_CHOP']), ('PIKACHU', 40, None, ['THUNDERBOLT']),
                      ('GOLEM', 40, None, ['TACKLE'])],
                     MAGIKARP, [('switch', 2), ('move', 0)], setup_links)
    menus = [r for r in recs if 'end' not in r]
    m = menus[1]
    d0 = A('wDoubleBattle')
    dd = m['wDoubleBattle']
    field = dd[A('wFieldMons') - d0:][:2]
    elinks = dd[A('wEnemyBattlerLinks') - d0:][:7]
    plinks = dd[A('wPlayerBattlerLinks') - d0:][:7]
    p2_attr = m['wBattlerSlots'][sz + b.by[A('wPlayerBattlerLinks')] + L['ATTRACTED_TO']]
    ok = (m['wCurBattleMon'] == 2 and field[0] == 0b110 and p2_attr == 0 and elinks[L['TRAPPED_BY']] == 0
          and elinks[L['SEEDED_BY']] == 1 and elinks[L['TARGET']] == 1 and not any(plinks))
    fails += not report('leaves_field', ok, f'cur {m["wCurBattleMon"]}, field {field}, P2 attracted {p2_attr}, '
                        f'E1 links {elinks}, P1 links {plinks}')
    sys.exit(1 if fails else 0)


if __name__ == '__main__':
    main()
