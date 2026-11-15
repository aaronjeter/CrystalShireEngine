"""Test for the held items added on Oct 30, 2026 and Poison Heal (singles).
Usage (from a folder holding ROM, .sym and a boot.py state):
    python3 test_held_items.py it.gbc it.sym ow_it.state [test ...]
Machamp vs a wild mon; items and abilities are written at the battle menu before each turn.
The items' 8-bit IDs are allocated (givepoke with the item) before the battle state is saved.
Tests: lifeorb, sheerforce, eviolite, widelens, sash, orbs, poisonheal, sludge, berries, newitems, power, batch3."""
import json, os, re, sys
src = open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'test_more_abilities.py')).read()
TESTS = sys.argv[4:]
sys.argv = sys.argv[:4]
exec(src.split("\nsoft = lambda g")[0])

ITEMS = ['FLAME_ORB', 'TOXIC_ORB', 'EVIOLITE', 'WIDE_LENS', 'BLACK_SLUDGE', 'LIFE_ORB', 'FOCUS_SASH']
IDS = {}
MOVES = ['VICEGRIP', 'SEISMIC_TOSS', 'SPLASH', 'MEGA_KICK']
VICE, TOSS, SPLASH, KICK = range(4)

def setup2(name, moves=MOVES, wild='TAUROS', player='MACHAMP'):
    g = new()
    IDS.clear()
    for it in ITEMS:
        g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
        g.run_script(f"\tgivepoke {player}, 5, {it}\n\tend")
        for i in range(8): g.frames(20); g.press('B', after=10)
        IDS[it] = g.rd('wPartyMon1Item')
    assert len(set(IDS.values())) == len(ITEMS) and 0 not in IDS.values(), IDS
    g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
    g.run_script(party_script(player, 55, moves, sym['wPartyMon1'][1]))
    for i in range(30): g.frames(20); g.press('B', after=10)
    g.run_script(battle_script(wild, 50))
    to_menu(g)
    g.save(name)
    json.dump(IDS, open(name + '.ids', 'w'))

def ids(name):
    IDS.clear()
    IDS.update(json.load(open(name + '.ids')))

def want(t): return not TESTS or t in TESTS

def items(p=None, e=None):
    def f(g):
        g.wr('wBattleMonItem', IDS[p] if p else 0)
        g.wr('wEnemyMonItem', IDS[e] if e else 0)
    return f

def both(*fs):
    def f(g):
        for x in fs: x(g)
    return f

def w16(g, name, v): g.wr(name, [v >> 8, v & 0xFF])
def soft(g): g.wr('wEnemyMonDefense', [0, 60]); g.wr('wEnemyMonSpclDef', [0, 60])
def no_rng(g, value):
    # the accuracy roll only: "call BattleRandom" after the Wide Lens farcall -> "ld a, value; nop"
    a = rom_addr('BattleCommand_CheckHit.skip_brightpowder') + 8
    r = g.rom()
    assert r[a] == 0xCD and bytes(r[a + 1:a + 3]) == bytes([sym['BattleRandom'][1] & 0xFF, sym['BattleRandom'][1] >> 8]), 'accuracy roll not found'
    g.poke_rom(a, [0x3E, value, 0x00])

S = 'hi_tauros.state'
if not os.path.exists(S): setup2(S)
ids(S)
print('item IDs', IDS, flush=True)

if want('lifeorb'):
    g0, a = turn2(S, VICE, SPLASH, extra=soft, fixed=True)
    g1, b = turn2(S, VICE, SPLASH, extra=both(soft, items(p='LIFE_ORB')), fixed=True)
    print('Life Orb', a['dmg'], b['dmg'], a['pdmg'], b['pdmg'])
    check(abs(b['dmg'] - a['dmg'] * 13 // 10) <= 1, f"Life Orb: x1.3 damage ({a['dmg']} -> {b['dmg']})")
    check(a['pdmg'] == 0 and b['pdmg'] == 99, f"Life Orb: recoil 1/10 of 999 = 99 (got {b['pdmg']})")
    check('lost some of' in b['log'], 'Life Orb: recoil text')
    g1, c = turn2(S, VICE, SPLASH, player_ab='ABILITY_MAGIC_GUARD', extra=both(soft, items(p='LIFE_ORB')), fixed=True)
    check(c['pdmg'] == 0 and c['dmg'] == b['dmg'], f"Life Orb + Magic Guard: boost, no recoil ({c['dmg']}, {c['pdmg']})")
    g1, d = turn2(S, TOSS, SPLASH, extra=items(p='LIFE_ORB'), fixed=True)
    check(d['dmg'] == 55 and d['pdmg'] == 99, f"Life Orb + Seismic Toss: 55 damage, recoil ({d['dmg']}, {d['pdmg']})")
    g1, e = turn2(S, SPLASH, SPLASH, extra=items(p='LIFE_ORB'), fixed=True)
    check(e['pdmg'] == 0, f"Life Orb + Splash: no recoil ({e['pdmg']})")
    g1, f = turn2(S, SPLASH, VICE, extra=items(e='LIFE_ORB'), fixed=True)
    eh = g1.rd('wEnemyMonMaxHP', 2); emax = eh[0] * 256 + eh[1]
    check(f['dmg'] == max(1, emax // 10), f"Life Orb (enemy): recoil {f['dmg']} of max HP {emax}")

if want('sheerforce'):
    SF = 'hi_tauros_sf.state'
    if not os.path.exists(SF): setup2(SF, moves=['FIRE_PUNCH', 'SEISMIC_TOSS', 'SPLASH', 'MEGA_KICK'])
    ids(SF)
    g1, a = turn2(SF, 0, SPLASH, player_ab='ABILITY_SHEER_FORCE', extra=both(soft, items(p='LIFE_ORB')), fixed=True)
    g1, b = turn2(SF, 0, SPLASH, player_ab='ABILITY_SHEER_FORCE', extra=soft, fixed=True)
    check(abs(a['dmg'] - b['dmg'] * 13 // 10) <= 1 and a['pdmg'] == 0,
          f"Sheer Force + Life Orb: x1.3, no recoil ({b['dmg']} -> {a['dmg']}, recoil {a['pdmg']})")
    ids(S)

if want('eviolite'):
    for wild, expect in [('MACHOKE', True), ('TAUROS', False), ('CHARIZARD', False), ('SCYTHER', False),
                         ('CHARMELEON', True), ('CHARIZARDX', False)]:
        st = f'hi_{wild.lower()}.state'
        if not os.path.exists(st): setup2(st, wild=wild)
        ids(st)
        g1, a = turn2(st, VICE, SPLASH, extra=soft, fixed=True)
        g1, b = turn2(st, VICE, SPLASH, extra=both(soft, items(e='EVIOLITE')), fixed=True)
        g1, c = turn2(st, TOSS, SPLASH, extra=items(e='EVIOLITE'), fixed=True)
        boosted = b['dmg'] < a['dmg'] * 0.8
        check(boosted == expect and c['dmg'] == 55,
              f"Eviolite on {wild}: {'boost' if expect else 'no boost'} ({a['dmg']} -> {b['dmg']}; Seismic Toss {c['dmg']})")
    ids(S)

if want('widelens'):
    # Mega Kick: 80% = 204 of 255; x1.1 = 224. BattleRandom fixed at 214: a miss without the lens.
    patch = lambda g: no_rng(g, 214)
    g1, a = turn2(S, KICK, SPLASH, extra=soft, fixed=True, patch=patch)
    g1, b = turn2(S, KICK, SPLASH, extra=both(soft, items(p='WIDE_LENS')), fixed=True, patch=patch)
    check(a['dmg'] == 0 and b['dmg'] > 0, f"Wide Lens: miss -> hit at roll 214 ({a['dmg']}, {b['dmg']})")
    patch = lambda g: no_rng(g, 230)
    g1, c = turn2(S, KICK, SPLASH, extra=both(soft, items(p='WIDE_LENS')), fixed=True, patch=patch)
    check(c['dmg'] == 0, f"Wide Lens: still misses at roll 230 ({c['dmg']})")

if want('sash'):
    def small_enemy(hp):
        # low Defense too: Vice Grip must knock it out whatever Machamp's rolled stats
        def f(g): w16(g, 'wEnemyMonMaxHP', 20); w16(g, 'wEnemyMonHP', hp); w16(g, 'wEnemyMonDefense', 10)
        return f
    g1, a = turn2(S, VICE, SPLASH, extra=both(small_enemy(20), items(e='FOCUS_SASH')), fixed=True)
    check(hp(g1, 'Enemy') == 1 and g1.rd('wEnemyMonItem') == 0 and 'Focus Sash' in a['log'],
          f"Focus Sash (enemy, full HP): survives at 1, used up ({hp(g1, 'Enemy')}, item {g1.rd('wEnemyMonItem')})")
    check(g1.rd('wKnockedOffMons+1') & 1, 'Focus Sash (enemy): wKnockedOffMons bit set')
    g1, b = turn2(S, VICE, SPLASH, extra=both(small_enemy(19), items(e='FOCUS_SASH')), fixed=True)
    check(hp(g1, 'Enemy') == 0 and 'Focus Sash' not in b['log'], f"Focus Sash (enemy, not full HP): faints ({hp(g1, 'Enemy')})")
    def small_player(g): w16(g, 'wBattleMonMaxHP', 20); w16(g, 'wBattleMonHP', 20)
    g1, c = turn2(S, SPLASH, VICE, extra=both(small_player, items(p='FOCUS_SASH')), fixed=True)
    pi = g1.rd('wPartyMon1Item')
    check(hp(g1, 'Battle') == 1 and g1.rd('wBattleMonItem') == 0 and g1.rd('wKnockedOffMons') & 1,
          f"Focus Sash (player): survives at 1, battle copy used up ({hp(g1, 'Battle')})")
    print('  party item after the turn:', pi, '(the harness wrote only the battle copy: 0 expected here)')
    g1, d = turn2(S, SPLASH, TOSS, extra=both(small_player, items(p='FOCUS_SASH')), fixed=True)
    check(hp(g1, 'Battle') == 1, f"Focus Sash vs Seismic Toss (55 > 20 HP): survives ({hp(g1, 'Battle')})")

if want('orbs'):
    g1, a = turn2(S, SPLASH, SPLASH, extra=items(p='FLAME_ORB'), fixed=True)
    check(g1.rd('wBattleMonStatus') == BRN and 'Flame Orb' in a['log'], f"Flame Orb: burned ({g1.rd('wBattleMonStatus'):02x})")
    print('  log:', a['log'][-120:])
    g0, a0 = turn2(S, SPLASH, SPLASH, fixed=True)
    at0 = g0.rd('wBattleMonAttack', 2); at1 = g1.rd('wBattleMonAttack', 2)
    check(at1[0] * 256 + at1[1] == (at0[0] * 256 + at0[1]) // 2, f'Flame Orb: Attack halved ({at0} -> {at1})')
    fire = lambda g: g.wr('wBattleMonType1', [TYPES['FIRE'], TYPES['FIRE']])
    g1, b = turn2(S, SPLASH, SPLASH, extra=both(items(p='FLAME_ORB'), fire), fixed=True)
    check(g1.rd('wBattleMonStatus') == 0, 'Flame Orb: not a Fire type')
    g1, b = turn2(S, SPLASH, SPLASH, player_ab='ABILITY_WATER_VEIL', extra=items(p='FLAME_ORB'), fixed=True)
    check(g1.rd('wBattleMonStatus') == 0, 'Flame Orb: not with Water Veil')
    g1, c = turn2(S, SPLASH, SPLASH, extra=items(e='TOXIC_ORB'), fixed=True)
    check(g1.rd('wEnemyMonStatus') == PSN and g1.rd('wEnemySubStatus5') & 1 and 'badly' in c['log'],
          f"Toxic Orb (enemy): badly poisoned ({g1.rd('wEnemyMonStatus'):02x}, {g1.rd('wEnemySubStatus5'):02x})")
    steel = lambda g: g.wr('wBattleMonType1', [TYPES['STEEL'], TYPES['STEEL']])
    g1, d = turn2(S, SPLASH, SPLASH, extra=both(items(p='TOXIC_ORB'), steel), fixed=True)
    check(g1.rd('wBattleMonStatus') == 0, 'Toxic Orb: not a Steel type')
    par = lambda g: g.wr('wBattleMonStatus', PAR)
    g1, d = turn2(S, SPLASH, SPLASH, extra=both(items(p='TOXIC_ORB'), par), fixed=True)
    check(g1.rd('wBattleMonStatus') == PAR, 'Toxic Orb: not over another status')

if want('poisonheal'):
    def poisoned(hp_):
        def f(g): g.wr('wBattleMonStatus', PSN); w16(g, 'wBattleMonHP', hp_)
        return f
    g1, a = turn2(S, SPLASH, SPLASH, player_ab='ABILITY_POISON_HEAL', extra=poisoned(500), fixed=True)
    check(hp(g1, 'Battle') == 500 + 124 and 'restored HP!' in a['log'], f"Poison Heal: +1/8 ({hp(g1, 'Battle')})")
    print('  log:', a['log'][-100:])
    g1, b = turn2(S, SPLASH, SPLASH, extra=poisoned(500), fixed=True)
    check(hp(g1, 'Battle') == 500 - 124, f"no Poison Heal: -1/8 ({hp(g1, 'Battle')})")
    g1, c = turn2(S, SPLASH, SPLASH, player_ab='ABILITY_POISON_HEAL', extra=poisoned(999), fixed=True)
    check(hp(g1, 'Battle') == 999 and 'Poison Heal' not in c['log'], 'Poison Heal at full HP: nothing')
    tox = lambda g: g.wr('wPlayerSubStatus5', g.rd('wPlayerSubStatus5') | 1)
    g1, d = turn2(S, SPLASH, SPLASH, player_ab='ABILITY_POISON_HEAL', extra=both(poisoned(500), tox), fixed=True)
    check(hp(g1, 'Battle') == 624, f"Poison Heal, badly poisoned: +1/8 ({hp(g1, 'Battle')})")
    g1, e = turn2(S, SPLASH, SPLASH, player_ab='ABILITY_POISON_HEAL', extra=items(p='TOXIC_ORB'), fixed=True)
    check(g1.rd('wBattleMonStatus') == PSN, 'Poison Heal + Toxic Orb: badly poisoned at the end of the turn')

if want('sludge'):
    def at(hp_):
        return lambda g: w16(g, 'wBattleMonHP', hp_)
    g1, a = turn2(S, SPLASH, SPLASH, extra=both(items(p='BLACK_SLUDGE'), at(500)), fixed=True)
    check(hp(g1, 'Battle') == 500 - 124 and 'Black Sludge' in a['log'], f"Black Sludge (not Poison): -1/8 ({hp(g1, 'Battle')})")
    pois = lambda g: g.wr('wBattleMonType1', [TYPES['POISON'], TYPES['POISON']])
    g1, b = turn2(S, SPLASH, SPLASH, extra=both(items(p='BLACK_SLUDGE'), at(500), pois), fixed=True)
    check(hp(g1, 'Battle') == 500 + 124, f"Black Sludge (Poison): +1/8 ({hp(g1, 'Battle')})")
    g1, c = turn2(S, SPLASH, SPLASH, player_ab='ABILITY_MAGIC_GUARD', extra=both(items(p='BLACK_SLUDGE'), at(500)), fixed=True)
    check(hp(g1, 'Battle') == 500, 'Black Sludge + Magic Guard: nothing')
    low = lambda g: w16(g, 'wEnemyMonHP', 3)
    g1, d = turn2(S, SPLASH, SPLASH, extra=both(items(e='BLACK_SLUDGE'), low), fixed=True)
    for i in range(60):
        g1.frames(10); g1.press('B', hold=3, after=3)
        if not g1.in_battle(): break
    check(hp(g1, 'Enemy') == 0 or not g1.in_battle(), 'Black Sludge KO: the enemy faints and the battle ends')

if want('berries'):
    # Oct 30, 2026: later-gen berries; used berries come back after the battle (battle copy only)
    BS = 'hi_berries.state'
    ITEMS[:] = ['ORAN_BERRY', 'SITRUS_BERRY', 'LUM_BERRY', 'PERSIM_BERRY', 'LEPPA_BERRY', 'CHERI_BERRY', 'ASPEAR_BERRY']
    if not os.path.exists(BS): setup2(BS, moves=['VICEGRIP', 'HORN_DRILL', 'SPLASH', 'MEGA_KICK'])
    ids(BS)
    at = lambda v: (lambda g: w16(g, 'wBattleMonHP', v))
    def gone_but_kept(g, it, what):
        check(g.rd('wBattleMonItem') == 0 and g.rd('wPartyMon1Item') == IDS[it] and g.rd('wKnockedOffMons') & 1,
              f"{what}: battle copy used, party keeps it, bit set ({g.rd('wBattleMonItem')}, {g.rd('wPartyMon1Item')}, {g.rd('wKnockedOffMons')})")
    def give(it):  # the party copy too, as a real held item
        return lambda g: (g.wr('wBattleMonItem', IDS[it]), g.wr('wPartyMon1Item', IDS[it]))
    g1, a = turn2(BS, SPLASH, SPLASH, extra=both(give('SITRUS_BERRY'), at(400)), fixed=True)
    check(hp(g1, 'Battle') == 400 + 249, f"Sitrus Berry: +1/4 of 999 = 249 ({hp(g1, 'Battle')})")
    gone_but_kept(g1, 'SITRUS_BERRY', 'Sitrus Berry')
    g1, b = turn2(BS, SPLASH, SPLASH, extra=both(give('SITRUS_BERRY'), at(600)), fixed=True)
    check(hp(g1, 'Battle') == 600 and g1.rd('wBattleMonItem') == IDS['SITRUS_BERRY'], 'Sitrus Berry above half HP: not eaten')
    g1, c = turn2(BS, SPLASH, SPLASH, extra=both(give('ORAN_BERRY'), at(400)), fixed=True)
    check(hp(g1, 'Battle') == 410, f"Oran Berry: +10 ({hp(g1, 'Battle')})")
    gone_but_kept(g1, 'ORAN_BERRY', 'Oran Berry')
    par = lambda g: g.wr('wBattleMonStatus', PAR)
    g1, d = turn2(BS, SPLASH, SPLASH, extra=both(give('LUM_BERRY'), par), fixed=True)
    check(g1.rd('wBattleMonStatus') == 0, 'Lum Berry: cures paralysis')
    gone_but_kept(g1, 'LUM_BERRY', 'Lum Berry')
    g1, d = turn2(BS, SPLASH, SPLASH, extra=both(give('CHERI_BERRY'), par), fixed=True)
    check(g1.rd('wBattleMonStatus') == 0, 'Cheri Berry: cures paralysis')
    frz = lambda g: g.wr('wBattleMonStatus', FRZ)
    g1, d = turn2(BS, SPLASH, SPLASH, extra=both(give('ASPEAR_BERRY'), frz), fixed=True)
    check(g1.rd('wBattleMonStatus') == 0, 'Aspear Berry: cures frostbite')
    conf = lambda g: (g.wr('wPlayerSubStatus3', g.rd('wPlayerSubStatus3') | CONFUSED), g.wr('wPlayerConfuseCount', 3))
    g1, e = turn2(BS, SPLASH, SPLASH, extra=both(give('PERSIM_BERRY'), conf), fixed=True)
    check(not g1.rd('wPlayerSubStatus3') & CONFUSED, 'Persim Berry: cures confusion')
    gone_but_kept(g1, 'PERSIM_BERRY', 'Persim Berry')
    def pp0(slot):
        return lambda g: (g.wr(f'wBattleMonPP+{slot}', 0), g.wr(f'wPartyMon1PP+{slot}', 0))
    g1, f = turn2(BS, SPLASH, SPLASH, extra=both(give('LEPPA_BERRY'), pp0(0)), fixed=True)
    check(g1.rd('wBattleMonPP') & 0x3F == 10 and g1.rd('wPartyMon1PP') & 0x3F == 10,
          f"Leppa Berry: Vicegrip (15 PP) 0 -> 10 ({g1.rd('wBattleMonPP') & 0x3F}, party {g1.rd('wPartyMon1PP') & 0x3F})")
    gone_but_kept(g1, 'LEPPA_BERRY', 'Leppa Berry')
    g1, f = turn2(BS, SPLASH, SPLASH, extra=both(give('LEPPA_BERRY'), pp0(1)), fixed=True)
    check(g1.rd('wBattleMonPP+1') & 0x3F == 5, f"Leppa Berry: Horn Drill (5 PP) 0 -> 5 ({g1.rd('wBattleMonPP+1') & 0x3F})")
    ppup = lambda g: (g.wr('wBattleMonPP+1', 0xC0), g.wr('wPartyMon1PP+1', 0xC0))  # 3 PP Ups: max 8
    g1, f = turn2(BS, SPLASH, SPLASH, extra=both(give('LEPPA_BERRY'), ppup), fixed=True)
    check(g1.rd('wBattleMonPP+1') == 0xC8, f"Leppa Berry: Horn Drill with 3 PP Ups 0 -> 8 ({g1.rd('wBattleMonPP+1'):02x})")
    # the enemy's berry (wild): eaten, bit set
    g1, h = turn2(BS, VICE, SPLASH, extra=lambda g: (g.wr('wEnemyMonItem', IDS['ORAN_BERRY']), w16(g, 'wEnemyMonHP', 140)), fixed=True)
    check(g1.rd('wEnemyMonItem') == 0 and 'Oran Berry' in h['log'], f"enemy Oran Berry eaten ({h['log'][-80:]})")

if want('newitems'):
    # Oct 30, 2026: Rocky Helmet, Expert Belt, Muscle Band, Wise Glasses, Shell Bell, Big Root,
    # Binding Band, Macho Brace
    NS = 'hi_new1.state'
    ITEMS[:] = ['ROCKY_HELMET', 'EXPERT_BELT', 'MUSCLE_BAND', 'WISE_GLASSES', 'SHELL_BELL', 'BIG_ROOT', 'BINDING_BAND', 'MACHO_BRACE']
    if not os.path.exists(NS): setup2(NS, moves=['VICEGRIP', 'FLAMETHROWER', 'KARATE_CHOP', 'SPLASH'])
    ids(NS)
    VG, FT, KC, SP = range(4)
    def ratio2(slot, it, extra=soft):
        a = turn(NS, slot, SP, extra=extra, fixed=True)['dmg']
        b = turn(NS, slot, SP, extra=both(extra, items(p=it)), fixed=True)['dmg']
        return a, b, b / a
    for slot, it, want_r, what in [(VG, 'MUSCLE_BAND', 1.1, 'Muscle Band, physical'), (FT, 'MUSCLE_BAND', 1.0, 'Muscle Band, special'),
                                   (FT, 'WISE_GLASSES', 1.1, 'Wise Glasses, special'), (VG, 'WISE_GLASSES', 1.0, 'Wise Glasses, physical'),
                                   (KC, 'EXPERT_BELT', 1.2, 'Expert Belt, super effective'), (VG, 'EXPERT_BELT', 1.0, 'Expert Belt, neutral')]:
        a, b, r = ratio2(slot, it)
        check(abs(r - want_r) < 0.03, f'{what}: x{want_r} ({a} -> {b}, x{r:.3f})')
    g1, a = turn2(NS, VG, SP, extra=both(soft, items(e='ROCKY_HELMET')), fixed=True)
    check(a['pdmg'] == 999 // 6 and 'Rocky Helmet' in a['log'], f"Rocky Helmet: contact hit costs 1/6 = 166 ({a['pdmg']})")
    g1, b = turn2(NS, FT, SP, extra=both(soft, items(e='ROCKY_HELMET')), fixed=True)
    check(b['pdmg'] == 0, f"Rocky Helmet: not for a non-contact move ({b['pdmg']})")
    g1, c = turn2(NS, VG, SP, player_ab='ABILITY_MAGIC_GUARD', extra=both(soft, items(e='ROCKY_HELMET')), fixed=True)
    check(c['pdmg'] == 0, f"Rocky Helmet: not with Magic Guard ({c['pdmg']})")
    g1, d = turn2(NS, SP, VG, extra=items(p='ROCKY_HELMET'), fixed=True)
    eh = g1.rd('wEnemyMonMaxHP', 2); emax = eh[0] * 256 + eh[1]
    check(d['dmg'] == emax // 6, f"Rocky Helmet (player holds it): the enemy loses {d['dmg']} of {emax}")
    half = lambda g: w16(g, 'wBattleMonHP', 500)
    g1, e = turn2(NS, VG, SP, extra=both(soft, half, items(p='SHELL_BELL')), fixed=True)
    check(hp(g1, 'Battle') == 500 + max(1, e['dmg'] // 8) and 'Shell Bell' in e['log'],
          f"Shell Bell: heals 1/8 of {e['dmg']} ({hp(g1, 'Battle') - 500})")
    g1, f = turn2(NS, SP, SP, extra=both(half, items(p='SHELL_BELL')), fixed=True)
    check(hp(g1, 'Battle') == 500, 'Shell Bell: nothing without damage')
    # Macho Brace: turn order. The player 10 Speed faster than the enemy goes first; halved, second.
    def speed(g):
        es = g.rd('wEnemyMonSpeed', 2); w16(g, 'wBattleMonSpeed', es[0] * 256 + es[1] + 10)
    g1, h = turn2(NS, SP, SP, extra=speed, fixed=True)
    g2, i = turn2(NS, SP, SP, extra=both(speed, items(p='MACHO_BRACE')), fixed=True)
    first = lambda log: 'player' if log.find('Machamp used') < log.find('Enemy Tauros used') else 'enemy'
    check(first(h['log']) == 'player' and first(i['log']) == 'enemy', f"Macho Brace: halves Speed for turn order ({first(h['log'])}, {first(i['log'])})")
    # Macho Brace: EVs (KO a 1-HP Tauros, then read Machamp's EVs)
    def ko_evs(extra):
        def pre(g):
            w16(g, 'wEnemyMonHP', 1)
            if extra: extra(g)
        g, x = turn2(NS, VG, SP, extra=pre, fixed=True)
        for k in range(80):
            g.frames(10); g.press('B', hold=3, after=3)
            if not g.in_battle(): break
        return sum(g.rd(sym['wPartyMon1'][1] + 11, 6))
    give = lambda it: (lambda g: (g.wr('wBattleMonItem', IDS[it]), g.wr(sym['wPartyMon1'][1] + 1, IDS[it])))
    pokerus = lambda g: g.wr(sym['wPartyMon1'][1] + 28, 0x11)
    base = sum(H(ROM, None, SYM).rd(sym['wPartyMon1'][1] + 11, 6) for _ in [0]) if False else None
    g0 = H(ROM, None, SYM); g0.load(NS); ev0 = sum(g0.rd(sym['wPartyMon1'][1] + 11, 6))
    e_plain = ko_evs(None) - ev0
    e_brace = ko_evs(give('MACHO_BRACE')) - ev0
    e_rus = ko_evs(pokerus) - ev0
    e_both = ko_evs(both(pokerus, give('MACHO_BRACE'))) - ev0
    check(e_plain > 0 and e_brace == 2 * e_plain and e_rus == 2 * e_plain and e_both == 4 * e_plain,
          f'Macho Brace EVs: plain {e_plain}, brace {e_brace}, Pokerus {e_rus}, both {e_both}')

    NS2 = 'hi_new2.state'
    if not os.path.exists(NS2): setup2(NS2, moves=['GIGA_DRAIN', 'WRAP', 'SPLASH', 'VICEGRIP'])
    ids(NS2)
    g1, a = turn2(NS2, 0, 2, extra=both(soft, half), fixed=True)
    h0 = hp(g1, 'Battle') - 500
    g1, b = turn2(NS2, 0, 2, extra=both(soft, half, items(p='BIG_ROOT')), fixed=True)
    h1 = hp(g1, 'Battle') - 500
    check(a['dmg'] == b['dmg'] and h1 == h0 * 13 // 10, f'Big Root: Giga Drain heals x1.3 ({h0} -> {h1})')
    ingrain = lambda g: g.wr('wPlayerSubStatus2', g.rd('wPlayerSubStatus2') | 1 << 6)
    g1, c = turn2(NS2, 2, 2, extra=both(half, ingrain, items(p='BIG_ROOT')), fixed=True)
    check(hp(g1, 'Battle') == 500 + 124 * 13 // 10, f"Big Root: Ingrain heals 124 x1.3 = 161 ({hp(g1, 'Battle') - 500})")
    g1, d = turn2(NS2, 1, 2, extra=soft, fixed=True)
    g2, e = turn2(NS2, 1, 2, extra=both(soft, items(p='BINDING_BAND')), fixed=True)
    eh = g1.rd('wEnemyMonMaxHP', 2); emax = eh[0] * 256 + eh[1]
    check(g1.rd('wEnemyWrapCount') and e['dmg'] - d['dmg'] == max(1, emax // 4 // 4),  # 1/8 = twice the 1/16 share
          f"Binding Band: Wrap does 1/8 a turn instead of 1/16 ({d['dmg']} -> {e['dmg']}, max HP {emax})")

if want('power'):
    # Power items: +8 EVs in their stat per battle EV gain (doubled by Pokerus), halved Speed
    PS = 'hi_power.state'
    POWER = ['POWER_WEIGHT', 'POWER_BRACER', 'POWER_BELT', 'POWER_ANKLET', 'POWER_LENS', 'POWER_BAND']  # EV order
    ITEMS[:] = ['MACHO_BRACE'] + POWER
    if not os.path.exists(PS): setup2(PS, moves=['VICEGRIP', 'FLAMETHROWER', 'KARATE_CHOP', 'SPLASH'])
    ids(PS)
    VG, SP = 0, 3
    EV = sym['wPartyMon1'][1] + 11
    def ko_vec(extra):
        def pre(g):
            w16(g, 'wEnemyMonHP', 1)
            if extra: extra(g)
        g, x = turn2(PS, VG, SP, extra=pre, fixed=True)
        for k in range(80):
            g.frames(10); g.press('B', hold=3, after=3)
            if not g.in_battle(): break
        return g.rd(EV, 6)
    give = lambda it: (lambda g: (g.wr('wBattleMonItem', IDS[it]), g.wr(sym['wPartyMon1'][1] + 1, IDS[it])))
    pokerus = lambda g: g.wr(sym['wPartyMon1'][1] + 28, 0x11)
    g0 = H(ROM, None, SYM); g0.load(PS); ev0 = g0.rd(EV, 6)
    plain = [a - b for a, b in zip(ko_vec(None), ev0)]
    check(sum(plain) > 0, f'Power items: plain EV gain {plain}')
    for k, it in enumerate(POWER):
        got = [a - b for a, b in zip(ko_vec(give(it)), ev0)]
        want_ = [v + (8 if i == k else 0) for i, v in enumerate(plain)]
        check(got == want_, f'{it}: +8 in stat {k} ({got}, want {want_})')
    got = [a - b for a, b in zip(ko_vec(both(pokerus, give('POWER_ANKLET'))), ev0)]
    want_ = [2 * (v + (8 if i == 3 else 0)) for i, v in enumerate(plain)]
    check(got == want_, f'Power Anklet + Pokerus: (yield + 8) x2 ({got}, want {want_})')
    def high_hp(g): g.wr(EV, 248)
    got = ko_vec(both(high_hp, give('POWER_WEIGHT')))[0]
    check(got == 252, f'Power Weight at 248 HP EVs: capped at 252 ({got})')
    def speed(g):
        es = g.rd('wEnemyMonSpeed', 2); w16(g, 'wBattleMonSpeed', es[0] * 256 + es[1] + 10)
    g1, h = turn2(PS, SP, SP, extra=speed, fixed=True)
    g2, i = turn2(PS, SP, SP, extra=both(speed, items(p='POWER_BELT')), fixed=True)
    first = lambda log: 'player' if log.find('Machamp used') < log.find('Enemy Tauros used') else 'enemy'
    check(first(h['log']) == 'player' and first(i['log']) == 'enemy', f"Power Belt: halves Speed for turn order ({first(h['log'])}, {first(i['log'])})")

if want('batch3'):
    # Held items batch 3 (Nov 15, 2026): Assault Vest, Weakness Policy, Air Balloon, Light Clay,
    # White Herb, Mental Herb, pinch berries
    ITEMS[:] = ['ASSAULT_VEST', 'WEAKNESS_POLICY', 'AIR_BALLOON', 'LIGHT_CLAY', 'WHITE_HERB', 'MENTAL_HERB',
                'LIECHI_BERRY', 'SALAC_BERRY']
    A3, B3 = 'hi_b3a.state', 'hi_b3b.state'
    if not os.path.exists(A3): setup2(A3, moves=['KARATE_CHOP', 'VICEGRIP', 'FLAMETHROWER', 'EARTHQUAKE'])
    if not os.path.exists(B3): setup2(B3, moves=['REFLECT', 'LIGHT_SCREEN', 'LEER', 'TAUNT'])
    ids(A3)
    KC, VG, FT, EQ = range(4)
    def lvl(g, who, i): return g.rd(f'w{who}StatLevels+{i}')
    def txt(r):
        parts = [x.strip() for x in r['log'].split(' / ')]
        keep = [a for a, b in zip(parts, parts[1:] + ['']) if not b.startswith(a)]
        return ' '.join(keep).replace('  ', ' ')
    def tough(g): w16(g, 'wEnemyMonMaxHP', 999); w16(g, 'wEnemyMonHP', 999)
    # Assault Vest: x1.5 Sp. Def against special moves only
    a = turn2(A3, FT, VG, extra=both(soft, tough), fixed=True)[1]['dmg']
    b = turn2(A3, FT, VG, extra=both(soft, tough, items(e='ASSAULT_VEST')), fixed=True)[1]['dmg']
    c = turn2(A3, VG, VG, extra=both(soft, tough), fixed=True)[1]['dmg']
    d_ = turn2(A3, VG, VG, extra=both(soft, tough, items(e='ASSAULT_VEST')), fixed=True)[1]['dmg']
    check(a > 0 and abs(b - a * 2 / 3) <= 2 and c == d_, f'Assault Vest: special {a} -> {b}, physical {c} -> {d_}')
    # Weakness Policy: a super-effective hit -> Attack and Sp. Atk +2, used up
    g, r = turn2(A3, KC, VG, extra=both(tough, items(e='WEAKNESS_POLICY')), fixed=True)
    check(lvl(g, 'Enemy', 0) == 9 and lvl(g, 'Enemy', 3) == 9 and g.rd('wEnemyMonItem') == 0 and 'activated' in txt(r),
          f"Weakness Policy: super effective -> Atk {lvl(g, 'Enemy', 0)}, SpA {lvl(g, 'Enemy', 3)}, item {g.rd('wEnemyMonItem')} | {txt(r)[-160:]}")
    g, r = turn2(A3, VG, VG, extra=both(tough, items(e='WEAKNESS_POLICY')), fixed=True)
    check(lvl(g, 'Enemy', 0) == 7 and g.rd('wEnemyMonItem') == IDS['WEAKNESS_POLICY'],
          f"Weakness Policy: nothing on a neutral hit (Atk {lvl(g, 'Enemy', 0)})")
    # Air Balloon: Ground moves miss; any damaging hit pops it
    g, r = turn2(A3, EQ, VG, extra=both(tough, items(e='AIR_BALLOON')), fixed=True)
    check(r['dmg'] == 0 and g.rd('wEnemyMonItem') == IDS['AIR_BALLOON'] and 'affect' in txt(r),
          f"Air Balloon: Earthquake doesn't affect (dmg {r['dmg']}) | {txt(r)[-120:]}")
    g, r = turn2(A3, VG, VG, extra=both(tough, items(e='AIR_BALLOON')), fixed=True)
    check(r['dmg'] > 0 and g.rd('wEnemyMonItem') == 0 and 'popped' in txt(r),
          f"Air Balloon: Vicegrip pops it (dmg {r['dmg']}) | {txt(r)[-120:]}")
    g0, r0 = turn2(A3, EQ, VG, extra=tough, fixed=True)
    check(r0['dmg'] > 0, f"(control) Earthquake hits without the balloon ({r0['dmg']})")
    # Pinch berries: +1 at 1/4 HP or less, at the end of the turn; used up
    def low_enemy(g): w16(g, 'wEnemyMonMaxHP', 999); w16(g, 'wEnemyMonHP', 240)
    g, r = turn2(A3, VG, VG, extra=both(low_enemy, items(e='LIECHI_BERRY')), fixed=True)
    check(lvl(g, 'Enemy', 0) == 8 and g.rd('wEnemyMonItem') == 0, f"Liechi Berry at 1/4 HP: Attack +1 ({lvl(g, 'Enemy', 0)}) | {txt(r)[-120:]}")
    g, r = turn2(A3, VG, VG, extra=both(tough, items(e='LIECHI_BERRY')), fixed=True)
    check(lvl(g, 'Enemy', 0) == 7 and g.rd('wEnemyMonItem') == IDS['LIECHI_BERRY'], f"Liechi Berry above 1/4 HP: nothing ({lvl(g, 'Enemy', 0)})")
    def low_player(g): w16(g, 'wBattleMonHP', 240); w16(g, 'wBattleMonDefense', 999)
    g, r = turn2(A3, VG, VG, extra=both(tough, low_player, items(p='SALAC_BERRY')), fixed=True)
    check(lvl(g, 'Player', 2) == 8 and g.rd('wBattleMonItem') == 0, f"Salac Berry (player) at 1/4 HP: Speed +1 ({lvl(g, 'Player', 2)}) | {txt(r)[-120:]}")
    # Light Clay: Reflect / Light Screen 8 turns instead of 5
    ids(B3)
    RF, LS, LE, TA = range(4)
    for slot, cnt, name in ((RF, 'wPlayerReflectCount', 'Reflect'), (LS, 'wPlayerLightScreenCount', 'Light Screen')):
        g1, r1 = turn2(B3, slot, LE)
        g2, r2 = turn2(B3, slot, LE, extra=items(p='LIGHT_CLAY'))
        check(g2.rd(cnt) - g1.rd(cnt) == 3, f'Light Clay: {name} count {g1.rd(cnt)} -> {g2.rd(cnt)}')
    # White Herb: Leer's drop undone at once, herb used up
    g, r = turn2(B3, LE, RF)
    check(lvl(g, 'Enemy', 1) < 7, f"(control) Leer lowers Defense ({lvl(g, 'Enemy', 1)})")
    g, r = turn2(B3, LE, RF, extra=items(e='WHITE_HERB'))
    check(lvl(g, 'Enemy', 1) == 7 and g.rd('wEnemyMonItem') == 0 and 'White Herb' in txt(r),
          f"White Herb undoes Leer ({lvl(g, 'Enemy', 1)}) | {txt(r)[-120:]}")
    # Mental Herb: Taunt cured at once
    g, r = turn2(B3, TA, RF)
    check(g.rd('wEnemySubStatus2') & 0b1110, f"(control) Taunt lands ({g.rd('wEnemySubStatus2'):#x})")
    g, r = turn2(B3, TA, RF, extra=items(e='MENTAL_HERB'))
    check(not g.rd('wEnemySubStatus2') & 0b1110 and g.rd('wEnemyMonItem') == 0 and 'Mental Herb' in txt(r),
          f"Mental Herb cures Taunt ({g.rd('wEnemySubStatus2'):#x}) | {txt(r)[-120:]}")

print('FAILS:', fails if fails else 'none')
