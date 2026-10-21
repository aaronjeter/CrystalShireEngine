"""Test for the abilities added on Oct 20, 2026 (see test_abilities.py for the rest).
Usage (from a folder holding ROM, .sym and a boot.py state):
    python3 test_new_abilities.py ab.gbc ab.sym ow_ab.state
Checks:
 1. Iron Fist, Strong Jaw, Sharpness: +25% for their move groups only.
 2. Status moves against Limber, Insomnia, Immunity, Water Veil, Magma Armor
    and Own Tempo fail with "protected by <ability>"; without them they work.
 3. Contact: Frigid gives frostbite, Effect Spore poison/paralysis/sleep,
    not to Grass types; Limber blocks Static.
 4. Inner Focus blocks flinching; Insomnia blocks Rest.
 5. Entrance: a paralyzed Limber Pokemon is cured when it enters battle.
Contact and flinch effects are 30% chances, so they're run several times with
different timing (wild-battle randomness reads rDIV)."""
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

# 1. move-group boosts. Machamp vs Tauros; Tauros uses Growl.
S1 = 'nab_s1.state'
setup(S1, ['FIRE_PUNCH', 'CRUNCH', 'SLASH', 'GROWL'])
for slot, ab, move in ((0, 'ABILITY_IRON_FIST', 'Fire Punch'), (1, 'ABILITY_STRONG_JAW', 'Crunch'), (2, 'ABILITY_SHARPNESS', 'Slash')):
    x, y = ratio(S1, slot, ab)
    check(x > 0 and abs(y - x * 5 // 4) <= 1, f'{ab} boosts {move} by 25%: {x} -> {y}')
x, y = ratio(S1, 1, 'ABILITY_IRON_FIST')
check(x > 0 and y == x, f'Iron Fist leaves Crunch alone: {x} -> {y}')

# 3. contact abilities, with Fire Punch
def trials(n, **kw):
    return [turn(S1, 0, 3, wait=60 + 7 * i, **kw) for i in range(n)]
r = trials(10, enemy_ab='ABILITY_FRIGID')
got = [t['pst'] for t in r]
check(any(s == FRZ for s in got) and all(s in (0, FRZ) for s in got), f'Frigid gives frostbite on contact: {got}')
check(any('Frigid gave' in t['log'] for t in r if t['pst']), 'Frigid text')
r = trials(20, enemy_ab='ABILITY_EFFECT_SPORE')
got = [t['pst'] for t in r]
kinds = {('SLP' if s & SLP else {PSN: 'PSN', PAR: 'PAR'}.get(s, hex(s))) for s in got if s}
check(kinds and kinds <= {'SLP', 'PSN', 'PAR'} and 3 <= sum(1 for s in got if s) <= 14, f'Effect Spore: {got} -> {kinds}')
check(all(not (s & SLP) or 2 <= s <= 4 for s in got), 'Effect Spore sleep lasts 2-4 turns')
grass = lambda g: g.wr('wBattleMonType1', [TYPES['GRASS'], TYPES['GRASS']])
got = [t['pst'] for t in trials(10, enemy_ab='ABILITY_EFFECT_SPORE', extra=grass)]
check(all(s == 0 for s in got), f'Effect Spore never affects a Grass type: {got}')
got = [t['pst'] for t in trials(10, enemy_ab='ABILITY_STATIC')]
check(any(s == PAR for s in got), f'(control) Static paralyzes: {got}')
got = [t['pst'] for t in trials(10, enemy_ab='ABILITY_STATIC', player_ab='ABILITY_LIMBER')]
check(all(s == 0 for s in got), f'Limber blocks Static: {got}')

# 2. status moves. Tauros uses Growl (S2) or Rest at full HP (S3): no effect.
S2 = 'nab_s2.state'
setup(S2, ['THUNDER_WAVE', 'SPORE', 'TOXIC', 'GROWL'])
S3 = 'nab_s3.state'
setup(S3, ['WILLOWISP', 'ICY_WIND', 'CONFUSE_RAY', 'REST'])
for state, slot, eslot, ab, name, test in (
        (S2, 0, 3, 'ABILITY_LIMBER', 'Limber', lambda t: t['est'] == PAR),
        (S2, 1, 3, 'ABILITY_INSOMNIA', 'Insomnia', lambda t: t['est'] & SLP),
        (S2, 2, 3, 'ABILITY_IMMUNITY', 'Immunity', lambda t: t['est'] == PSN),
        (S3, 0, 3, 'ABILITY_WATER_VEIL', 'Water Veil', lambda t: t['est'] == BRN),
        (S3, 1, 3, 'ABILITY_MAGMA_ARMOR', 'Magma Armor', lambda t: t['est'] == FRZ),
        (S3, 2, 3, 'ABILITY_OWN_TEMPO', 'Own Tempo', lambda t: t['esub3'] & CONFUSED)):
    x = turn(state, slot, eslot); y = turn(state, slot, eslot, enemy_ab=ab)
    check(test(x) and not test(y) and y['est'] == 0 and f'protected by {name}' in y['log'].replace('  ', ' '),
          f'{name}: without {x["est"]:#x}/{x["esub3"]:#x}, with {y["est"]:#x}/{y["esub3"]:#x} | {y["log"][:120]}')

# 4. Inner Focus (Machamp made faster so Headbutt can flinch), Insomnia + Rest
fast = lambda g: g.wr('wEnemyMonSpeed', [0, 10])
S4 = 'nab_s4.state'
setup(S4, ['HEADBUTT', 'GROWL'])
x = [turn(S4, 0, 1, extra=fast, wait=60 + 7 * i) for i in range(10)]
y = [turn(S4, 0, 1, enemy_ab='ABILITY_INNER_FOCUS', extra=fast, wait=60 + 7 * i) for i in range(10)]
check(any('flinched' in t['log'] for t in x) and not any('flinched' in t['log'] for t in y),
      f'Inner Focus blocks flinching: {sum("flinched" in t["log"] for t in x)} -> {sum("flinched" in t["log"] for t in y)}')
hurt = lambda g: g.wr('wBattleMonHP', [0, 100])
x = turn(S3, 3, 3, extra=hurt); y = turn(S3, 3, 3, player_ab='ABILITY_INSOMNIA', extra=hurt)
check(x['pst'] & SLP and x['php'] == 999 and y['pst'] == 0 and y['php'] == 100, f'Insomnia blocks Rest: {x["pst"]},{x["php"]} -> {y["pst"]},{y["php"]}')

# 5. entrance cure: Machamp with Limber as ability 1, paralyzed before the battle
rom = open(ROM, 'rb').read()
SPECIES = [re.match(r'\tabilities (\w+),', l).group(1) for l in open(f'{CSE}/data/abilities/species_abilities.asm') if l.startswith('\tabilities ')]
b, a = sym['SpeciesAbilities1']; base = b * 0x4000 + a - 0x4000
g = new()
g.poke_rom(base + 3 * SPECIES.index('MACHAMP'), [AB['ABILITY_LIMBER'], 0, 0])
g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
g.run_script(party_script('MACHAMP', 55, ['TACKLE'], sym['wPartyMon1'][1]))
for i in range(30): g.frames(20); g.press('B', after=10)
g.wr('wPartyMon1Status', PAR)
g.run_script(battle_script('TAUROS', 50))
d = to_menu(g)
log = ' / '.join(d.log)
check(g.rd('wBattleMonStatus') == 0 and g.rd('wPartyMon1Status') == 0 and 'Limber cured' in log,
      f'Limber cures paralysis on entry: {g.rd("wBattleMonStatus")}, {g.rd("wPartyMon1Status")} | {log[-80:]}')

# 6. Multiscale: half damage at full HP only, on both sides (exact damage)
soft = lambda g: (g.wr('wEnemyMonDefense', [0, 20]), g.wr('wEnemyMonSpclDef', [0, 20]))
def not_full(g):
    soft(g); m = g.rd('wEnemyMonMaxHP', 2); v = m[0] * 256 + m[1] - 1
    g.wr('wEnemyMonHP', [v >> 8, v & 0xFF])
x = turn(S1, 0, 3, extra=soft, fixed=True)['dmg']
y = turn(S1, 0, 3, enemy_ab='ABILITY_MULTISCALE', extra=soft, fixed=True)['dmg']
z = turn(S1, 0, 3, enemy_ab='ABILITY_MULTISCALE', extra=not_full, fixed=True)['dmg']
check(x > 0 and y == x // 2 and z == x, f'Multiscale (enemy): {x} -> full HP {y}, 1 HP below full {z}')
def hits_me(ab):
    t = turn(S4, 1, 0, player_ab=ab, fixed=True) # Machamp Growls, Tauros Headbutts the full-HP Machamp
    return 999 - t['php']
x, y = hits_me('NO_ABILITY'), hits_me('ABILITY_MULTISCALE')
check(x > 0 and y == x // 2, f'Multiscale (player, enemy turn): {x} -> {y}')

# 7. Oct 21 batch: Blaze/Torrent, Tough Claws, Rock Head, Gale Wings, Shield Dust, Rough Skin
def at_hp(v):
    return lambda g: (soft(g), g.wr('wBattleMonHP', [v >> 8, v & 0xFF]))
x = turn(S1, 0, 3, extra=at_hp(333), fixed=True)['dmg']
y = turn(S1, 0, 3, player_ab='ABILITY_BLAZE', extra=at_hp(333), fixed=True)['dmg']
z = turn(S1, 0, 3, player_ab='ABILITY_BLAZE', extra=at_hp(334), fixed=True)['dmg']
w = turn(S1, 0, 3, player_ab='ABILITY_TORRENT', extra=at_hp(333), fixed=True)['dmg']
check(x > 0 and y == x * 3 // 2 and z == x and w == x, f'Blaze: Fire Punch {x} -> at 1/3 HP {y}, above 1/3 {z}; Torrent {w}')
x, y = ratio(S1, 0, 'ABILITY_TOUGH_CLAWS')
check(x > 0 and abs(y - x * 5 // 4) <= 1, f'Tough Claws boosts Fire Punch (contact): {x} -> {y}')
S5 = 'nab_s5.state'
setup(S5, ['EARTHQUAKE', 'DOUBLE_EDGE', 'DRILL_PECK', 'GROWL'])
x, y = ratio(S5, 0, 'ABILITY_TOUGH_CLAWS')
check(x > 0 and y == x, f'Tough Claws leaves Earthquake (no contact) alone: {x} -> {y}')
x = turn(S5, 1, 3)['php']; y = turn(S5, 1, 3, player_ab='ABILITY_ROCK_HEAD')['php']
check(x < 999 and y == 999, f'Rock Head: HP after Double-Edge {x} -> {y}')
def first(t): return next((m.split(' used ')[0] for m in t['log'].split(' / ') if ' used ' in m), None)
x = turn(S5, 2, 3); y = turn(S5, 2, 3, player_ab='ABILITY_GALE_WINGS'); z = turn(S5, 0, 3, player_ab='ABILITY_GALE_WINGS')
check('Machamp' not in first(x) and 'Machamp' in first(y) and 'Machamp' not in first(z),
      f'Gale Wings: first with Drill Peck {first(x)} -> {first(y)}; with Earthquake {first(z)}')
S6 = 'nab_s6.state'
setup(S6, ['ZAP_CANNON', 'DYNAMICPUNCH', 'GROWL'])
x = turn(S6, 0, 2); y = turn(S6, 0, 2, enemy_ab='ABILITY_SHIELD_DUST')
check(x['est'] == PAR and y['est'] == 0 and y['dmg'] > 0, f'Shield Dust blocks Zap Cannon paralysis: {x["est"]:#x} -> {y["est"]:#x}')
x = turn(S6, 1, 2); y = turn(S6, 1, 2, enemy_ab='ABILITY_SHIELD_DUST')
check(x['esub3'] & CONFUSED and not y['esub3'] & CONFUSED and y['dmg'] > 0, f'Shield Dust blocks DynamicPunch confusion: {x["esub3"]:#x} -> {y["esub3"]:#x}')
eighth = (999 >> 2) >> 1
x = turn(S1, 0, 3, enemy_ab='ABILITY_ROUGH_SKIN')
y = turn(S1, 0, 3, enemy_ab='ABILITY_ROUGH_SKIN', player_ab='ABILITY_MAGIC_GUARD')
z = turn(S5, 0, 3, enemy_ab='ABILITY_ROUGH_SKIN')
check(x['php'] == 999 - eighth and 'Rough Skin hurt' in x['log'] and y['php'] == 999 and z['php'] == 999,
      f'Rough Skin: contact {x["php"]}, with Magic Guard {y["php"]}, Earthquake {z["php"]}')

print(f'\n{len(fails)} failure(s)')
for f in fails: print('  ' + f)
