"""Test for the abilities added on Oct 28, 2026 (singles; the doubles cases are in test_doubles.py).
Usage (from a folder holding ROM, .sym and a boot.py state):
    python3 test_more_abilities.py ab.gbc ab.sym ow_ab.state
Machamp vs a wild Tauros, ability bytes written before each turn, as test_new_abilities.py:
 1. Insulated halves Water and Electric damage, not Fire.
 2. Lightning Rod / Storm Drain: no damage or status, Sp. Atk +1 (or "absorbed" at +6).
 3. Keen Eye: Sand Attack blocked (Clear Body's text still right); accuracy x1.2, evasion
    boosts ignored.
 4. Sniper: crits do 3x instead of 2x; +1 crit level (CriticalHitChances patched so level 0
    never crits and level 1 always does).
 5. Speed Boost: +1 Speed at the end of the turn, nothing at +6.
 6. Plus/Minus do nothing in a single battle.
 7. Air Lock (either side) makes Rain Dance fail.
 8. Volt Absorb / Water Absorb heal 1/4 (or absorb at full HP), Thunder Wave included.
 9. Sap Sipper: Grass moves do nothing, Attack +1 ("absorbed" at +6).
10. Flash Fire: Fire moves (Will-O-Wisp too) do nothing, Sp. Atk +1.
11. Iron Barbs (and Rough Skin's text). 12. Cloud Nine. 13. Poison Touch.
14. Cute Charm. 15. Gooey. 16. Mold Breaker. 17. Pixilate. 18. The other -ate abilities, Normalize. 19. Hydration (and Shed Skin's text). 20. Tinted Lens. 21. Scrappy. 22. Sheer Force.
23. Battle Armor, Shell Armor. 24-25. Synchronize. (The trapping abilities: test_doubles.py.)
(Sturdy, Natural Cure, Regenerator: test_doubles.py's singles cases.)"""
import re, sys
from harness import H, Driver, at_menu, PSN, BRN, FRZ, PAR
from scripts import party_script, battle_script, CSE

ROM, SYM, STATE = sys.argv[1:4]
sym = {}
for l in open(SYM):
    m = re.match(r'([0-9a-f]+):([0-9a-f]+) (\S+)', l)
    if m: sym[m.group(3)] = (int(m.group(1), 16), int(m.group(2), 16))
AB = {}
for l in open(f'{CSE}/constants/ability_constants.asm'):
    m = re.match(r'\s*const (\w+)', l)
    if m:
        if m.group(1) == 'ABILITY_SLOT_1': break
        AB[m.group(1)] = len(AB)
TYPES, n = {}, 0
for l in open(f'{CSE}/constants/type_constants.asm'):
    m = re.match(r'\s*const_next (\d+)', l)
    if m: n = int(m.group(1)); continue
    m = re.match(r'\s*const (\w+)', l)
    if m: TYPES[m.group(1)] = n; n += 1
SLP = 7
CONFUSED = 1 << 7
fails = []
def check(cond, what):
    print(('ok   ' if cond else 'FAIL ') + what, flush=True)
    if not cond: fails.append(what)

def new():
    g = H(ROM, None, SYM); g.load(STATE); return g

def hp(g, who):
    v = g.rd(f'w{who}MonHP', 2); return v[0] * 256 + v[1]

def to_menu(g):
    d = Driver(g)
    for i in range(400):
        g.frames(5); d._scan()
        if g.in_battle() and at_menu(g): break
        g.press('B', hold=3, after=3)
    assert at_menu(g), g.screen_text()
    return d

def setup(name, moves, wild='TAUROS', player='MACHAMP'):
    g = new()
    g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
    g.run_script(party_script(player, 55, moves, sym['wPartyMon1'][1]))
    for i in range(30): g.frames(20); g.press('B', after=10)
    g.run_script(battle_script(wild, 50))
    to_menu(g)
    g.save(name)

def rom_addr(name):
    b, a = sym[name]; return b * 0x4000 + a - 0x4000 if b else a

def turn(state, slot, enemy_slot, enemy_ab='NO_ABILITY', player_ab='NO_ABILITY', extra=None, wait=60, fixed=False):
    g = H(ROM, None, SYM); g.load(state); g.frames(wait)
    if fixed: # no damage roll, no crits: exact damage
        g.poke_rom(rom_addr('BattleCommand_DamageVariation'), [0xC9])
        g.poke_rom(rom_addr('BattleCommand_Critical'), [0xC9])
    start = []
    def pre(g):
        g.wr('wBattleMonHP', [3, 0xE7]); g.wr('wBattleMonMaxHP', [3, 0xE7])
        g.wr('wEnemyMonAbility', AB[enemy_ab]); g.wr('wBattleMonAbility', AB[player_ab])
        g.wr('wPlayerStatLevels+5', 13) # max accuracy: status moves always hit
        g.wr('wEnemyMonMoves', [g.rd('wBattleMonMoves', 4)[enemy_slot], 0, 0, 0])
        if extra: extra(g)
        start[:] = [hp(g, 'Enemy'), hp(g, 'Battle')]
    d = Driver(g)
    d.turn(slot, pre)
    return dict(dmg=start[0] - hp(g, 'Enemy'), est=g.rd('wEnemyMonStatus'), pst=g.rd('wBattleMonStatus'),
                esub3=g.rd('wEnemySubStatus3'), php=hp(g, 'Battle'), log=' / '.join(d.log))

def ratio(state, slot, ab):
    # low Defense and Sp. Def for bigger damage numbers
    soft = lambda g: (g.wr('wEnemyMonDefense', [0, 20]), g.wr('wEnemyMonSpclDef', [0, 20]))
    x = turn(state, slot, 3, extra=soft, fixed=True)['dmg']; y = turn(state, slot, 3, player_ab=ab, extra=soft, fixed=True)['dmg']
    return x, y


def eturn(state, slot, enemy_slot, **kw):
    return turn(state, slot, enemy_slot, **kw)

def lv(g, who, i): return g.rd(f'w{who}StatLevels+{i}')
SPATK, ACC, EVA, SPD = 3, 5, 6, 2

def turn2(state, slot, enemy_slot, enemy_ab='NO_ABILITY', player_ab='NO_ABILITY', extra=None, wait=60, fixed=False, patch=None):
    """turn() that also returns the game for RAM reads after the turn."""
    g = H(ROM, None, SYM); g.load(state); g.frames(wait)
    if fixed:
        g.poke_rom(rom_addr('BattleCommand_DamageVariation'), [0xC9])
        g.poke_rom(rom_addr('BattleCommand_Critical'), [0xC9])
    if patch: patch(g)
    start = []
    def pre(g):
        g.wr('wBattleMonHP', [3, 0xE7]); g.wr('wBattleMonMaxHP', [3, 0xE7])
        g.wr('wEnemyMonAbility', AB[enemy_ab]); g.wr('wBattleMonAbility', AB[player_ab])
        g.wr('wEnemyMonMoves', [g.rd('wBattleMonMoves', 4)[enemy_slot], 0, 0, 0])
        if extra: extra(g)
        start[:] = [hp(g, 'Enemy'), hp(g, 'Battle')]
    d = Driver(g)
    d.turn(slot, pre)
    return g, dict(dmg=start[0] - hp(g, 'Enemy'), pdmg=start[1] - hp(g, 'Battle'), est=g.rd('wEnemyMonStatus'),
                   log=' / '.join(d.log))

soft = lambda g: (g.wr('wEnemyMonDefense', [0, 20]), g.wr('wEnemyMonSpclDef', [0, 20]))
def txt(r):  # the log's text box lines, joined (each entry is a growing line; keep the last of each)
    parts = [x.strip() for x in r['log'].split(' / ')]
    keep = [a for a, b in zip(parts, parts[1:] + ['']) if not b.startswith(a)]
    return ' '.join(keep).replace('  ', ' ')

# Machamp: Thunderbolt, Surf, Fire Punch, Growl; Tauros copies Growl (slot 3)
S1 = 'mab_s1.state'
setup(S1, ['THUNDERBOLT', 'SURF', 'FIRE_PUNCH', 'GROWL'])

# 1. Insulated
for slot, move, halved in ((0, 'Thunderbolt', True), (1, 'Surf', True), (2, 'Fire Punch', False)):
    x = turn2(S1, slot, 3, extra=soft, fixed=True)[1]['dmg']
    y = turn2(S1, slot, 3, enemy_ab='ABILITY_INSULATED', extra=soft, fixed=True)[1]['dmg']
    ok = abs(y - x // 2) <= 1 if halved else y == x
    check(x > 0 and ok, f'Insulated vs {move}: {x} -> {y}')

# 2. Lightning Rod / Storm Drain
for slot, ab, name in ((0, 'ABILITY_LIGHTNING_ROD', 'Lightning Rod'), (1, 'ABILITY_STORM_DRAIN', 'Storm Drain')):
    g, r = turn2(S1, slot, 3, enemy_ab=ab)
    check(r['dmg'] == 0 and lv(g, 'Enemy', SPATK) == 8 and f'{name} raised its Sp.Atk' in txt(r)
          and 'affect Enemy Tauros' in txt(r), f'{name} absorbs: dmg {r["dmg"]}, SpA level {lv(g, "Enemy", SPATK)} | {txt(r)[-200:]}')
    maxed = lambda g: g.wr('wEnemyStatLevels+3', 13)
    g, r = turn2(S1, slot, 3, enemy_ab=ab, extra=maxed)
    check(r['dmg'] == 0 and lv(g, 'Enemy', SPATK) == 13 and f'{name} absorbed the move' in txt(r),
          f'{name} at +6: dmg {r["dmg"]} | {txt(r)[-200:]}')
g, r = turn2(S1, 1, 3, enemy_ab='ABILITY_LIGHTNING_ROD')
check(r['dmg'] > 0 and lv(g, 'Enemy', SPATK) == 7, f'Lightning Rod leaves Surf alone: {r["dmg"]}')

# Thunder Wave (status move) into Lightning Rod; Tauros copies Growl
S2 = 'mab_s2.state'
setup(S2, ['THUNDER_WAVE', 'SMOKESCREEN', 'ZAP_CANNON', 'GROWL'])
nomax = lambda g: g.wr('wPlayerStatLevels+5', 7)
g, r = turn2(S2, 0, 3, extra=nomax)
check(r['est'] == PAR, f'(control) Thunder Wave paralyzes: {r["est"]:#x}')
g, r = turn2(S2, 0, 3, enemy_ab='ABILITY_LIGHTNING_ROD', extra=nomax)
check(r['est'] == 0 and lv(g, 'Enemy', SPATK) == 8, f'Lightning Rod absorbs Thunder Wave: {r["est"]:#x} | {txt(r)[-200:]}')

# 3. Keen Eye. Tauros uses Smokescreen (slot 1) on Machamp, which uses Growl.
g, r = turn2(S2, 3, 1, extra=nomax)
check(lv(g, 'Player', ACC) == 6, f'(control) Smokescreen lowers accuracy: {lv(g, "Player", ACC)}')
g, r = turn2(S2, 3, 1, player_ab='ABILITY_KEEN_EYE', extra=nomax)
check(lv(g, 'Player', ACC) == 7 and 'Keen Eye blocks stat loss' in txt(r), f'Keen Eye blocks Smokescreen | {txt(r)[-200:]}')
# Mud-Slap's 100% accuracy drop is blocked silently
S3 = 'mab_s3.state'
setup(S3, ['MUD_SLAP', 'GROWL', 'GROWL', 'GROWL'])
g, r = turn2(S3, 1, 0, extra=nomax)
check(lv(g, 'Player', ACC) == 6, f'(control) Mud-Slap lowers accuracy: {lv(g, "Player", ACC)}')
g, r = turn2(S3, 1, 0, player_ab='ABILITY_KEEN_EYE', extra=nomax)
check(lv(g, 'Player', ACC) == 7 and 'blocks' not in txt(r), f'Keen Eye blocks Mud-Slap silently | {txt(r)[-200:]}')
g, r = turn2(S2, 3, 3, enemy_ab='ABILITY_CLEAR_BODY', extra=nomax)
check(lv(g, 'Enemy', 0) == 7 and 'Clear Body blocks stat loss' in txt(r), f'Clear Body text | {txt(r)[-200:]}')
g, r = turn2(S2, 3, 3, enemy_ab='ABILITY_KEEN_EYE', extra=nomax)
check(lv(g, 'Enemy', 0) < 7, f'Keen Eye lets Attack drop (Growl is -2 here): {lv(g, "Enemy", 0)}')
# accuracy after CheckHit: Zap Cannon's move struct byte
acc = lambda g: g.rd('wPlayerMoveStruct+4')
eva2 = lambda g: (g.wr('wPlayerStatLevels+5', 7), g.wr('wEnemyStatLevels+6', 9))
base = turn2(S2, 2, 3, extra=nomax)[0]; a0 = acc(base)
a1 = acc(turn2(S2, 2, 3, player_ab='ABILITY_KEEN_EYE', extra=nomax)[0])
a2 = acc(turn2(S2, 2, 3, extra=eva2)[0])
a3 = acc(turn2(S2, 2, 3, player_ab='ABILITY_KEEN_EYE', extra=eva2)[0])
check(a1 == a0 * 6 // 5 and a2 < a0 and a3 == a1, f'Keen Eye accuracy: base {a0}, Keen Eye {a1}, foe +2 evasion {a2}, both {a3}')

# 4. Sniper. Crits forced: BattleCommand_Critical -> wCriticalHit = 1.
def force_crit(g):
    w = sym['wCriticalHit'][1]
    g.poke_rom(rom_addr('BattleCommand_Critical'), [0x3E, 1, 0xEA, w & 0xFF, w >> 8, 0xC9])
    g.poke_rom(rom_addr('BattleCommand_DamageVariation'), [0xC9])
x = turn2(S1, 2, 3, extra=soft, patch=force_crit)[1]['dmg']
y = turn2(S1, 2, 3, player_ab='ABILITY_SNIPER', extra=soft, patch=force_crit)[1]['dmg']
# a crit's damage is 2q + 2 (q: the damage before the crit and the +2), Sniper's 3q + 2.
# (A crit ignores the lowered Defense written by soft(), so it's compared with Sniper only.)
check(x > 2 and abs((y - 2) - 3 * (x - 2) // 2) <= 2, f'Sniper crit: crit {x}, Sniper crit {y}')
def crit_table(g):  # level 0 never crits, level 1 always
    g.poke_rom(rom_addr('CriticalHitChances'), [0, 255])
    g.poke_rom(rom_addr('BattleCommand_DamageVariation'), [0xC9])
r0 = [turn2(S1, 2, 3, extra=soft, patch=crit_table, wait=60 + 5 * i)[1] for i in range(2)]
r1 = [turn2(S1, 2, 3, player_ab='ABILITY_SNIPER', extra=soft, patch=crit_table, wait=60 + 5 * i)[1] for i in range(2)]
check(all('critical' not in t['log'] for t in r0) and all('critical' in t['log'] for t in r1),
      f'Sniper +1 crit level: {[t["dmg"] for t in r0]} / {[t["dmg"] for t in r1]}')

# 5. Speed Boost
g, r = turn2(S1, 3, 3, player_ab='ABILITY_SPEED_BOOST')
check(lv(g, 'Player', SPD) == 8 and 'Speed Boost raised its Speed' in txt(r), f'Speed Boost +1 | {txt(r)[-200:]}')
g, r = turn2(S1, 3, 3, enemy_ab='ABILITY_SPEED_BOOST')
check(lv(g, 'Enemy', SPD) == 8, f'Speed Boost on the enemy: {lv(g, "Enemy", SPD)}')
g, r = turn2(S1, 3, 3, player_ab='ABILITY_SPEED_BOOST', extra=lambda g: g.wr('wPlayerStatLevels+2', 13))
check(lv(g, 'Player', SPD) == 13 and 'Speed Boost' not in txt(r), f'Speed Boost at +6 is silent | {txt(r)[-200:]}')

# 6. Plus/Minus in singles: no boost
x = turn2(S1, 0, 3, extra=soft, fixed=True)[1]['dmg']
y = turn2(S1, 0, 3, player_ab='ABILITY_PLUS', extra=soft, fixed=True)[1]['dmg']
check(x == y > 0, f'Plus does nothing in singles: {x} -> {y}')

# 7. Air Lock: Rain Dance fails with an Air Lock battler on either side
S4 = 'mab_s4.state'
setup(S4, ['RAIN_DANCE', 'GROWL', 'GROWL', 'GROWL'])
for kw, want_rain in (({}, 1), (dict(player_ab='ABILITY_AIR_LOCK'), 0), (dict(enemy_ab='ABILITY_AIR_LOCK'), 0)):
    g, r = turn2(S4, 0, 1, **kw)
    w = g.rd('wBattleWeather')
    check(w == want_rain and (want_rain or 'failed' in txt(r)), f'Rain Dance {kw or "(control)"}: weather {w} | {txt(r)[-120:]}')

# 8. Volt Absorb / Water Absorb: no damage; 1/4 max HP back, or "absorbed" at full HP
def low(g): g.wr('wEnemyMonHP', [0, 10])
for slot, ab, name, other in ((0, 'ABILITY_VOLT_ABSORB', 'Volt Absorb', 1), (1, 'ABILITY_WATER_ABSORB', 'Water Absorb', 0)):
    g, r = turn2(S1, slot, 3, enemy_ab=ab, extra=low)
    mx = g.rd16('wEnemyMonMaxHP')
    check(hp(g, 'Enemy') == min(mx, 10 + mx // 4) and f'{name} restored its HP' in txt(r),
          f'{name} heals: 10 -> {hp(g, "Enemy")} (max {mx}) | {txt(r)[-140:]}')
    g, r = turn2(S1, slot, 3, enemy_ab=ab)
    check(r['dmg'] == 0 and f'{name} absorbed the move' in txt(r), f'{name} at full HP: dmg {r["dmg"]} | {txt(r)[-140:]}')
    g, r = turn2(S1, other, 3, enemy_ab=ab)
    check(r['dmg'] > 0, f'{name} leaves the other type alone: {r["dmg"]}')
g, r = turn2(S2, 0, 3, enemy_ab='ABILITY_VOLT_ABSORB', extra=lambda g: (nomax(g), low(g)))
check(r['est'] == 0 and hp(g, 'Enemy') > 10, f'Volt Absorb absorbs Thunder Wave: {r["est"]:#x}, HP {hp(g, "Enemy")}')

# 9. Sap Sipper: Machamp's Mega Drain (Grass) does nothing, Tauros's Attack +1; Thunderbolt hits
S5 = 'mab_s5.state'
setup(S5, ['MEGA_DRAIN', 'THUNDERBOLT', 'GROWL', 'GROWL'])
g, r = turn2(S5, 0, 2, enemy_ab='ABILITY_SAP_SIPPER')
check(r['dmg'] == 0 and lv(g, 'Enemy', 0) == 8 and 'Sap Sipper raised its Attack' in txt(r),
      f'Sap Sipper absorbs Mega Drain: dmg {r["dmg"]}, Attack level {lv(g, "Enemy", 0)} | {txt(r)[-140:]}')
g, r = turn2(S5, 0, 2, enemy_ab='ABILITY_SAP_SIPPER', extra=lambda g: g.wr('wEnemyStatLevels', 13))
check(r['dmg'] == 0 and 'Sap Sipper absorbed the move' in txt(r), f'Sap Sipper at +6 | {txt(r)[-140:]}')
g, r = turn2(S5, 1, 2, enemy_ab='ABILITY_SAP_SIPPER')
check(r['dmg'] > 0 and lv(g, 'Enemy', 0) == 7, f'Sap Sipper leaves Thunderbolt alone: {r["dmg"]}')

# 10. Flash Fire: Fire Punch does nothing, Sp. Atk +1; Will-O-Wisp absorbed too
g, r = turn2(S1, 2, 3, enemy_ab='ABILITY_FLASH_FIRE')
check(r['dmg'] == 0 and lv(g, 'Enemy', SPATK) == 8 and 'Flash Fire raised its Sp.Atk' in txt(r),
      f'Flash Fire absorbs Fire Punch: dmg {r["dmg"]}, SpA level {lv(g, "Enemy", SPATK)} | {txt(r)[-140:]}')
S6 = 'mab_s6.state'
setup(S6, ['WILLOWISP', 'GROWL', 'GROWL', 'GROWL'])
g, r = turn2(S6, 0, 1, enemy_ab='ABILITY_FLASH_FIRE', extra=lambda g: g.wr('wPlayerStatLevels+5', 13))
check(r['est'] == 0 and lv(g, 'Enemy', SPATK) == 8, f'Flash Fire absorbs Will-O-Wisp: status {r["est"]:#x} | {txt(r)[-140:]}')

# 11. Iron Barbs (and Rough Skin's text): Fire Punch (contact) costs Machamp (999 HP) 1/8
for ab, name in (('ABILITY_IRON_BARBS', 'Iron Barbs'), ('ABILITY_ROUGH_SKIN', 'Rough Skin')):
    g, r = turn2(S1, 2, 3, enemy_ab=ab)
    check(r['pdmg'] == 999 // 8 and f'{name} hurt' in txt(r), f'{name}: Machamp lost {r["pdmg"]} | {txt(r)[-120:]}')
g, r = turn2(S1, 0, 3, enemy_ab='ABILITY_IRON_BARBS')
check(r['pdmg'] == 0, f'Iron Barbs leaves Thunderbolt (no contact) alone: {r["pdmg"]}')

# 12. Cloud Nine: like Air Lock
g, r = turn2(S4, 0, 1, player_ab='ABILITY_CLOUD_NINE')
check(g.rd('wBattleWeather') == 0 and 'failed' in txt(r), f'Cloud Nine: Rain Dance fails | {txt(r)[-120:]}')

# 13. Poison Touch: 30% on contact (Fire Punch); never with Thunderbolt or through Shield Dust
r = [turn2(S1, 2, 3, player_ab='ABILITY_POISON_TOUCH', wait=60 + 7 * i)[1] for i in range(12)]
got = [t['est'] for t in r]
check(any(x == PSN for x in got) and all(x in (0, PSN, BRN) for x in got)  # BRN: Fire Punch's own 10% burn (then no poison)
      and any('poisoned' in txt(t) for t in r if t['est']),
      f'Poison Touch on contact: {got}')
got = [turn2(S1, 0, 3, player_ab='ABILITY_POISON_TOUCH', wait=60 + 7 * i)[1]['est'] for i in range(8)]
check(all(not x & PSN for x in got), f'Poison Touch: not with Thunderbolt: {got}')  # Thunderbolt's own paralysis is fine
got = [turn2(S1, 2, 3, player_ab='ABILITY_POISON_TOUCH', enemy_ab='ABILITY_SHIELD_DUST', wait=60 + 7 * i)[1]['est'] for i in range(8)]
check(all(x == 0 for x in got), f'Poison Touch: not through Shield Dust: {got}')

# 14. Cute Charm (wild Miltank, female; Machamp's DVs made male): 30% on contact
S7 = 'mab_s7.state'
setup(S7, ['FIRE_PUNCH', 'THUNDERBOLT', 'GROWL', 'GROWL'], wild='MILTANK')
male = lambda g: g.wr('wPartyMon1DVs', [0xFF, 0xFF])
IN_LOVE = 1 << 7
love = lambda g: g.rd('wPlayerSubStatus1') & IN_LOVE
r = [turn2(S7, 0, 2, enemy_ab='ABILITY_CUTE_CHARM', extra=male, wait=60 + 7 * i) for i in range(12)]
got = [bool(love(g)) for g, t in r]
check(any(got) and not all(got) and any('fell in love' in txt(t) for g, t in r if love(g)), f'Cute Charm on contact: {got}')
got = [bool(love(turn2(S7, 1, 2, enemy_ab='ABILITY_CUTE_CHARM', extra=male, wait=60 + 7 * i)[0])) for i in range(6)]
check(not any(got), f'Cute Charm: not with Thunderbolt: {got}')

# 15. Gooey: contact lowers the attacker's Speed one stage
g, r = turn2(S1, 2, 3, enemy_ab='ABILITY_GOOEY')
check(lv(g, 'Player', SPD) == 6 and 'Gooey' in txt(r), f'Gooey: Machamp Speed level {lv(g, "Player", SPD)} | {txt(r)[-120:]}')
g, r = turn2(S1, 0, 3, enemy_ab='ABILITY_GOOEY')
check(lv(g, 'Player', SPD) == 7, f'Gooey: not with Thunderbolt: {lv(g, "Player", SPD)}')

# 16. Mold Breaker: Volt Absorb, Thick Fat and Clear Body ignored; Rough Skin still hurts
g, r = turn2(S1, 0, 3, enemy_ab='ABILITY_VOLT_ABSORB', player_ab='ABILITY_MOLD_BREAKER')
check(r['dmg'] > 0, f'Mold Breaker: Thunderbolt hits Volt Absorb: {r["dmg"]}')
x = turn2(S1, 2, 3, extra=soft, fixed=True)[1]['dmg']
y = turn2(S1, 2, 3, enemy_ab='ABILITY_THICK_FAT', player_ab='ABILITY_MOLD_BREAKER', extra=soft, fixed=True)[1]['dmg']
z = turn2(S1, 2, 3, enemy_ab='ABILITY_THICK_FAT', extra=soft, fixed=True)[1]['dmg']
check(x == y and z < x, f'Mold Breaker: Thick Fat ignored: none {x}, Mold Breaker {y}, Thick Fat alone {z}')
g, r = turn2(S1, 3, 3, enemy_ab='ABILITY_CLEAR_BODY', player_ab='ABILITY_MOLD_BREAKER')
check(lv(g, 'Enemy', 0) < 7, f'Mold Breaker: Growl through Clear Body: {lv(g, "Enemy", 0)}')
g, r = turn2(S1, 2, 3, enemy_ab='ABILITY_ROUGH_SKIN', player_ab='ABILITY_MOLD_BREAKER')
check(r['pdmg'] == 999 // 8, f'Mold Breaker: Rough Skin still hurts: {r["pdmg"]}')
g, r = turn2(S2, 0, 3, enemy_ab='ABILITY_LIMBER', player_ab='ABILITY_MOLD_BREAKER', extra=nomax)
check(r['est'] == PAR, f'Mold Breaker: Thunder Wave through Limber: {r["est"]:#x}')

# 17. Pixilate: Horn Attack (Normal) x1.25 as Fairy; it then hits a Ghost (Gastly)
S8 = 'mab_s8.state'
setup(S8, ['HORN_ATTACK', 'GROWL', 'GROWL', 'GROWL'])
# (the target made pure Normal: Fairy and Normal both hit it neutrally)
softn = lambda g: (soft(g), g.wr('wEnemyMonType1', [TYPES['NORMAL'], TYPES['NORMAL']]))
x = turn2(S8, 0, 1, extra=softn, fixed=True)[1]['dmg']
y = turn2(S8, 0, 1, player_ab='ABILITY_PIXILATE', extra=softn, fixed=True)[1]['dmg']
check(x > 0 and abs(y - x * 5 // 4) <= 1, f'Pixilate x1.25: {x} -> {y}')
S9 = 'mab_s9.state'
setup(S9, ['HORN_ATTACK', 'GROWL', 'GROWL', 'GROWL'], wild='GASTLY')
x = turn2(S9, 0, 1)[1]['dmg']
y = turn2(S9, 0, 1, player_ab='ABILITY_PIXILATE')[1]['dmg']
check(x == 0 and y > 0, f'Pixilate: Horn Attack hits Gastly as Fairy: {x} -> {y}')

# 18. The other type-changing abilities: Horn Attack becomes their type (the move struct after
# the turn) and hits Gastly (Ghost); Galvanize and Normalize x1.25; Normalize makes Thunderbolt
# Normal (no effect on Gastly)
mtype = lambda g: g.rd('wPlayerMoveStruct+3') & 0x3F
for ab, t in (('GALVANIZE', 'ELECTRIC'), ('AERILATE', 'FLYING'), ('REFRIGERATE', 'ICE'), ('DRAGONIZE', 'DRAGON'),
              ('IMMOLATE', 'FIRE'), ('HYDRATE', 'WATER'), ('CONTAMINATE', 'POISON'), ('VERDIFY', 'GRASS')):
    g, r = turn2(S9, 0, 1, player_ab='ABILITY_' + ab)
    check(mtype(g) == TYPES[t] and r['dmg'] > 0, f'{ab}: Horn Attack is {t} ({mtype(g)}), hits Gastly: {r["dmg"]}')
for ab in ('GALVANIZE', 'NORMALIZE'):
    x = turn2(S8, 0, 1, extra=softn, fixed=True)[1]['dmg']
    y = turn2(S8, 0, 1, player_ab='ABILITY_' + ab, extra=softn, fixed=True)[1]['dmg']
    check(x > 0 and abs(y - x * 5 // 4) <= 1, f'{ab} x1.25 on Horn Attack: {x} -> {y}')
S10 = 'mab_s10.state'
setup(S10, ['THUNDERBOLT', 'GROWL', 'GROWL', 'GROWL'], wild='GASTLY')
x = turn2(S10, 0, 1)[1]['dmg']
g, r = turn2(S10, 0, 1, player_ab='ABILITY_NORMALIZE')
check(x > 0 and r['dmg'] == 0 and mtype(g) == TYPES['NORMAL'], f'Normalize: Thunderbolt becomes Normal: {x} -> {r["dmg"]}, type {mtype(g)}')

# 19. Hydration: Machamp's burn is cured at the end of the turn in the rain (not without rain);
# Shed Skin's 30% cure says "Shed Skin cured its status!"
burn = lambda g: (g.wr('wBattleMonStatus', BRN), g.wr('wPartyMon1Status', BRN))
rain = lambda g: (burn(g), g.wr('wBattleWeather', 1), g.wr('wWeatherCount', 5))
g, r = turn2(S1, 3, 3, player_ab='ABILITY_HYDRATION', extra=rain)
check(g.rd('wBattleMonStatus') == 0 and 'Hydration cured' in txt(r), f'Hydration in rain | {txt(r)[-120:]}')
g, r = turn2(S1, 3, 3, player_ab='ABILITY_HYDRATION', extra=burn)
check(g.rd('wBattleMonStatus') == BRN, f'Hydration without rain: status {g.rd("wBattleMonStatus"):#x}')
r = [turn2(S1, 3, 3, player_ab='ABILITY_SHED_SKIN', extra=burn, wait=60 + 7 * i) for i in range(10)]
check(any(g.rd('wBattleMonStatus') == 0 and 'Shed Skin cured' in txt(t) for g, t in r),
      f'Shed Skin: {[g.rd("wBattleMonStatus") for g, t in r]}')

# 20. Tinted Lens: Fire Punch on a Water type x2 (not very effective), neutral unchanged
water = lambda g: (soft(g), g.wr('wEnemyMonType1', [TYPES['WATER'], TYPES['WATER']]))
x = turn2(S1, 2, 3, extra=water, fixed=True)[1]['dmg']
y = turn2(S1, 2, 3, player_ab='ABILITY_TINTED_LENS', extra=water, fixed=True)[1]['dmg']
check(x > 0 and abs(y - 2 * x) <= 1, f'Tinted Lens on a resisted hit: {x} -> {y}')
x = turn2(S8, 0, 1, extra=softn, fixed=True)[1]['dmg']
y = turn2(S8, 0, 1, player_ab='ABILITY_TINTED_LENS', extra=softn, fixed=True)[1]['dmg']
check(x == y > 0, f'Tinted Lens: neutral hit unchanged: {x} -> {y}')

# 21. Scrappy: Horn Attack hits Gastly
x = turn2(S9, 0, 1)[1]['dmg']
y = turn2(S9, 0, 1, player_ab='ABILITY_SCRAPPY')[1]['dmg']
check(x == 0 and y > 0, f'Scrappy: Horn Attack on Gastly: {x} -> {y}')

# 22. Sheer Force: Fire Punch (10% burn) x1.3; Horn Attack (no added effect) unchanged;
# Zap Cannon's 100% paralysis doesn't happen
x = turn2(S1, 2, 3, extra=softn, fixed=True)[1]['dmg']
y = turn2(S1, 2, 3, player_ab='ABILITY_SHEER_FORCE', extra=softn, fixed=True)[1]['dmg']
check(x > 0 and abs(y - x * 13 // 10) <= 1, f'Sheer Force x1.3 on Fire Punch: {x} -> {y}')
x = turn2(S8, 0, 1, extra=softn, fixed=True)[1]['dmg']
y = turn2(S8, 0, 1, player_ab='ABILITY_SHEER_FORCE', extra=softn, fixed=True)[1]['dmg']
check(x == y > 0, f'Sheer Force: Horn Attack unchanged: {x} -> {y}')
acc = lambda g: g.wr('wPlayerStatLevels+5', 13)
g, r = turn2(S2, 2, 3, extra=acc)
check(r['est'] == PAR, f'(control) Zap Cannon paralyzes: {r["est"]:#x}')
g, r = turn2(S2, 2, 3, player_ab='ABILITY_SHEER_FORCE', extra=acc)
check(r['est'] == 0 and r['dmg'] > 0, f'Sheer Force: no paralysis from Zap Cannon: {r["est"]:#x}')

# 23. Battle Armor: no crits (CriticalHitChances patched so level 0 always crits)
always = lambda g: g.poke_rom(rom_addr('CriticalHitChances'), [255])
r0 = turn2(S1, 2, 3, patch=always)[1]
r1 = turn2(S1, 2, 3, enemy_ab='ABILITY_BATTLE_ARMOR', patch=always)[1]
check('critical' in r0['log'] and 'critical' not in r1['log'], f'Battle Armor blocks crits')
r2 = turn2(S1, 2, 3, enemy_ab='ABILITY_SHELL_ARMOR', patch=always)[1]
check('critical' not in r2['log'], f'Shell Armor blocks crits')

hit = lambda g: g.wr('wPlayerStatLevels+5', 13)
# 24. Synchronize (accuracy maxed: the status moves can miss): Thunder Wave on a Synchronize Tauros paralyzes Machamp too; not an Electric
# Machamp
g, r = turn2(S2, 0, 3, enemy_ab='ABILITY_SYNCHRONIZE', extra=hit)
pst = g.rd('wBattleMonStatus')
check(r['est'] == PAR and pst == PAR and 'Synchronize' in txt(r), f'Synchronize: {r["est"]:#x} / {pst:#x} | {txt(r)[-120:]}')
elec = lambda g: (hit(g), g.wr('wBattleMonType1', [TYPES['ELECTRIC'], TYPES['ELECTRIC']]))
g, r = turn2(S2, 0, 3, enemy_ab='ABILITY_SYNCHRONIZE', extra=elec)
pst = g.rd('wBattleMonStatus')
check(r['est'] == PAR and pst == 0, f'Synchronize: an Electric attacker is not paralyzed: {pst:#x}')

# Synchronize with a burn (Will-O-Wisp): the right text (each status picks its own)
g, r = turn2(S6, 0, 1, enemy_ab='ABILITY_SYNCHRONIZE', extra=lambda g: g.wr('wPlayerStatLevels+5', 13))
pst = g.rd('wBattleMonStatus')
check(r['est'] == BRN and pst == BRN and 'burned' in txt(r) and 'paralyzed' not in txt(r), f'Synchronize burn: {r["est"]:#x} / {pst:#x} | {txt(r)[-120:]}')

# 25. Synchronize passes frostbite too (Frostbite, the frostbite status move since Oct 29); not to an Ice type
S11 = 'mab_s11.state'
setup(S11, ['FROSTBITE', 'GROWL', 'GROWL', 'GROWL'])
g, r = turn2(S11, 0, 1, enemy_ab='ABILITY_SYNCHRONIZE', extra=hit)
pst = g.rd('wBattleMonStatus')
check(r['est'] == FRZ and pst == FRZ and 'Synchronize' in txt(r) and 'paralyzed' not in txt(r), f'Synchronize frostbite: {r["est"]:#x} / {pst:#x} | {txt(r)[-120:]}')
ice = lambda g: (hit(g), g.wr('wBattleMonType1', [TYPES['ICE'], TYPES['ICE']]))
g, r = turn2(S11, 0, 1, enemy_ab='ABILITY_SYNCHRONIZE', extra=ice)
check(r['est'] == FRZ and g.rd('wBattleMonStatus') == 0, f'Synchronize: an Ice attacker gets no frostbite: {g.rd("wBattleMonStatus"):#x}')

print('FAILED:' if fails else 'all passed', *fails, sep='\n')
