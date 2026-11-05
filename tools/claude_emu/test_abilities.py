"""Ability regression test (ability system plan, phase A1).
Usage (from a folder holding ROM, .sym and a boot.py state):
    python3 test_abilities.py ab.gbc ab.sym ow_ab.state
Checks:
 1. GetSpeciesAbility returns the SpeciesAbilities entry for every species and slot
    (empty or invalid slots fall back to ability 1).
 2. Entrance abilities (Drizzle, Intimidate) and the battle ability bytes.
 3. Ability checks on both sides, by running the same turn from one save state
    with only wBattleMonAbility / wEnemyMonAbility changed.
 4. Transform (Impostor) copies the target's ability.
 5. Per-Pokemon slots (A2), with some species' ability 2 and hidden ability
    patched into the ROM in memory: gift rolls, setnextability, a gift sent to
    the PC, the player's slot in battle, a wild override, catching, and the
    stats screen.
 6. NPC trades; 7. the Ability Capsule and Ability Patch from the Pack.
Not covered: a trainer party's ability line and a fixed npctrade slot (no data uses them
yet; both were tested with temporary data edits), and Day-Care eggs.
Note: ROM patches and run_script code are not part of save states, so a state
saved in the middle of a scripted battle can only be resumed in the same run.
Damage ratios are approximate: wild-battle randomness reads rDIV, so changing
which code runs can shift the damage roll a little."""
import re, sys
from harness import H, Driver, at_menu
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
NAME = {v: k for k, v in AB.items()}
NUM_SPECIES = sum(1 for l in open(f'{CSE}/data/abilities/species_abilities.asm') if l.startswith('\tabilities '))
fails = []
def check(cond, what):
    print(('ok   ' if cond else 'FAIL ') + what)
    if not cond: fails.append(what)

def new():
    g = H(ROM, None, SYM); g.load(STATE); return g

def hp(g, who):
    v = g.rd(f'w{who}MonHP', 2); return v[0] * 256 + v[1]

def setup(player, plevel, moves, wild, wlevel, prep=None):
    g = new()
    if prep: prep(g)
    g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
    g.run_script(party_script(player, plevel, moves, sym['wPartyMon1'][1]))
    for i in range(30): g.frames(20); g.press('B', after=10)
    # the wild Pokemon gets ability 1 (a wild roll is 50/50 between abilities 1 and 2, with a
    # 10% hidden ability)
    g.run_script('\tsetnextability ABILITY_SLOT_1\n' + battle_script(wild, wlevel))
    d = Driver(g)
    for i in range(400):
        g.frames(5); d._scan()
        if g.in_battle() and at_menu(g): break
        g.press('B', hold=3, after=3)
    assert at_menu(g), g.screen_text()
    return g, d

# 1. lookup for every species and slot
bank, addr = sym['GetSpeciesAbility']
buf = sym['wTilemap'][1]
rom = open(ROM, 'rb').read()
b, a = sym['SpeciesAbilities1']; base = b * 0x4000 + a - 0x4000
for slot in range(4):
    g = new()
    g.run_script(f"""TestScript:
	callasm TestCode
	end
TestCode:
	ld bc, 1
	ld hl, ${buf:04X}
.loop
	push hl
	ld a, {slot}
	rst $08 ; FarCall
	db ${bank:02X}
	dw ${addr:04X}
	pop hl
	ld [hli], a
	inc bc
	ld a, b
	cp HIGH({NUM_SPECIES + 1})
	jr nz, .loop
	ld a, c
	cp LOW({NUM_SPECIES + 1})
	jr nz, .loop
	ret
""")
    g.frames(60)
    got = g.rd('wTilemap', NUM_SPECIES)
    exp = []
    for i in range(NUM_SPECIES):
        e = rom[base + 3 * i + slot] if slot < 3 else 0
        exp.append(e or rom[base + 3 * i])
    bad = [i + 1 for i in range(NUM_SPECIES) if got[i] != exp[i]]
    check(not bad, f'GetSpeciesAbility slot {slot}, {NUM_SPECIES} species (mismatched species indexes: {bad[:5]})')

SPECIES = [re.match(r'\tabilities (\w+),', l).group(1) for l in open(f'{CSE}/data/abilities/species_abilities.asm') if l.startswith('\tabilities ')]
def patch(g, species, a1, a2, h):
    # a species' three abilities, in the ROM in memory (the checks below don't depend on the
    # audited data)
    g.poke_rom(base + 3 * SPECIES.index(species), [AB[a1], AB[a2], AB[h]])

# 2. entrance abilities (Politoed patched to Drizzle in every slot: the audit made Drizzle its
# hidden ability, and the gift's slot is rolled)
g, d = setup('POLITOED', 50, ['WATER_GUN', 'EMBER', 'EARTHQUAKE', 'GROWL'], 'ARBOK', 40,
             prep=lambda g: patch(g, 'POLITOED', 'ABILITY_DRIZZLE', 'ABILITY_DRIZZLE', 'ABILITY_DRIZZLE'))
g.save('ab_test_politoed.state')
check(NAME[g.rd('wBattleMonAbility')] == 'ABILITY_DRIZZLE', 'player ability byte (Politoed: Drizzle)')
check(NAME[g.rd('wEnemyMonAbility')] == 'ABILITY_INTIMIDATE', 'enemy ability byte (Arbok: Intimidate)')
check(g.rd('wBattleWeather') == 1, 'Drizzle starts rain')
check(g.rd('wPlayerStatLevels') == 6, 'Intimidate cuts Attack')

# 3. paired turns
# Machamp's gift slot is rolled: Guts in every slot
guts = lambda g: patch(g, 'MACHAMP', 'ABILITY_GUTS', 'ABILITY_GUTS', 'ABILITY_GUTS')
g, d = setup('MACHAMP', 55, ['FLAMETHROWER', 'EARTHQUAKE', 'SURF', 'GROWL'], 'ARBOK', 50, prep=guts)
g.save('ab_test_machamp.state')
def turn(state, slot, enemy_ab=None, player_ab=None, extra=None):
    g = H(ROM, None, SYM); g.load(state); g.frames(60)
    def pre(g):
        if state == M: # keep Machamp from fainting before it moves
            g.wr('wBattleMonHP', [3, 0xE7]); g.wr('wBattleMonMaxHP', [3, 0xE7])
        if enemy_ab: g.wr('wEnemyMonAbility', AB[enemy_ab])
        if player_ab: g.wr('wBattleMonAbility', AB[player_ab])
        if extra: extra(g)
        start[:] = [hp(g, 'Enemy'), hp(g, 'Battle')]
    start = []
    d = Driver(g)
    d.turn(slot, pre)
    first = next((m.split(' used ')[0] for m in d.log if ' used ' in m), None)
    return start[0] - hp(g, 'Enemy'), start[1] - hp(g, 'Battle'), g.rd('wEnemyStatLevels'), first, (lambda v: v[0] * 256 + v[1])(g.rd('wBattleMonMaxHP', 2))
M, P = 'ab_test_machamp.state', 'ab_test_politoed.state'
def pair(state, slot, side, ab, extra=None):
    kw = 'enemy_ab' if side == 'enemy' else 'player_ab'
    return turn(state, slot, extra=extra, **{kw: 'NO_ABILITY'}), turn(state, slot, extra=extra, **{kw: ab})
def enemy_uses(slot):
    return lambda g: g.wr('wEnemyMonMoves', [g.rd('wBattleMonMoves', 4)[slot], 0, 0, 0])
def enemy_hits(slot):
    # Machamp asleep: the enemy's move can't add a status (a burn's damage would skew the numbers)
    return lambda g: (enemy_uses(slot)(g), g.wr('wBattleMonStatus', 3))
x, y = pair(M, 0, 'enemy', 'ABILITY_THICK_FAT'); check(0.4 <= y[0] / x[0] <= 0.6, f'Thick Fat (target): {x[0]} -> {y[0]}')
x, y = pair(M, 1, 'enemy', 'ABILITY_DURABLE'); check(0.6 <= y[0] / x[0] <= 0.85, f'Durable: {x[0]} -> {y[0]}')
x, y = pair(M, 1, 'enemy', 'ABILITY_LEVITATE'); check(x[0] > 0 and y[0] == 0, f'Levitate: {x[0]} -> {y[0]}')
x, y = pair(M, 2, 'enemy', 'ABILITY_WATERPROOF'); check(x[0] > 0 and y[0] == 0, f'Waterproof: {x[0]} -> {y[0]}')
x, y = pair(M, 3, 'enemy', 'ABILITY_CLEAR_BODY'); check(x[2] < 7 and y[2] == 7, f'Clear Body: Attack level {x[2]} -> {y[2]}')
x, y = pair(M, 3, 'player', 'ABILITY_LEVITATE', enemy_hits(1)); check(x[1] > 0 and y[1] == 0, f'Levitate (player, enemy turn): {x[1]} -> {y[1]}')
x, y = pair(M, 3, 'player', 'ABILITY_THICK_FAT', enemy_hits(0)); check(0.4 <= y[1] / x[1] <= 0.6, f'Thick Fat (player, enemy turn): {x[1]} -> {y[1]}')
x, y = pair(M, 1, 'player', 'ABILITY_GUTS', lambda g: g.wr('wBattleMonStatus', 1 << 4)); check(1.2 <= y[0] / x[0] <= 1.8, f'Guts: {x[0]} -> {y[0]}')
# the enemy copies Growl: a wild Arbok may know ExtremeSpeed (priority 2)
x, y = pair(P, 3, 'player', 'ABILITY_PRANKSTER', enemy_uses(3)); check(x[3] != 'Politoed' and y[3] == 'Politoed', f'Prankster: first mover {x[3]} -> {y[3]}')
slow = lambda g: (enemy_uses(3)(g), g.wr('wEnemyMonSpeed', [0, 120]))
x, y = pair(P, 3, 'player', 'ABILITY_SWIFT_SWIM', slow); check(x[3] != 'Politoed' and y[3] == 'Politoed', f'Swift Swim in rain: first mover {x[3]} -> {y[3]}')
x, y = pair(P, 3, 'player', 'ABILITY_CHLOROPHYLL', slow); check(y[3] != 'Politoed', 'Chlorophyll does nothing in rain')
hurt = lambda g: (enemy_uses(3)(g), g.wr('wBattleMonHP', [0, 100]))
x, y = pair(P, 3, 'player', 'ABILITY_RAIN_DISH', hurt); check(x[1] - y[1] == y[4] // 8, f'Rain Dish heals 1/8 of {y[4]}: {x[1] - y[1]}')
x, y = pair(P, 3, 'player', 'ABILITY_REGENERATION', hurt); check(x[1] - y[1] == y[4] // 16, f'Regeneration heals 1/16 of {y[4]}: {x[1] - y[1]}')

# 4. Impostor / Transform
g, d = setup('MACHAMP', 55, ['FLAMETHROWER', 'EARTHQUAKE', 'SURF', 'GROWL'], 'DITTO', 40, prep=guts)
check(NAME[g.rd('wEnemyMonAbility')] == 'ABILITY_GUTS', 'Impostor Ditto takes Machamp\'s Guts')

# 5. per-Pokemon ability slots
def new_patched():
    g = new()
    patch(g, 'MACHAMP', 'ABILITY_GUTS', 'ABILITY_LEVITATE', 'ABILITY_THICK_FAT')
    patch(g, 'POLITOED', 'ABILITY_DRIZZLE', 'ABILITY_SWIFT_SWIM', 'ABILITY_RAIN_DISH')
    # no ability 2 and no hidden ability: a gift always gets ability 1
    patch(g, 'WOBBUFFET', 'ABILITY_SHADOW_TAG', 'NO_ABILITY', 'NO_ABILITY')
    return g
def settle(g, n):
    for i in range(n): g.frames(20); g.press('B', after=10)
def slots(g):
    # by symbol name, so the right WRAM bank is read
    return [g.rd(f'wPartyMon{i + 1}AbilitySlot') & 3 for i in range(g.rd('wPartyCount'))]

g = new_patched()
check(all(g.rd(f'wPartyMon{i + 1}AbilitySlot', 4) == [0, 0, 0, 0] for i in range(g.rd('wPartyCount'))), 'the boot save\'s party has zero padding (ability 1)')
g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
g.run_script('\tgivepoke MACHAMP, 20\n' * 4 + '\tsetnextability ABILITY_SLOT_HIDDEN\n\tgivepoke MACHAMP, 20\n\tgivepoke WOBBUFFET, 20\n\tend')
settle(g, 60)
sl = slots(g)
# gifts roll ability 1 or 2, or the hidden ability (10%) when the species has one
check(set(sl[:4]) <= {0, 1, 2} and sl[:4].count(2) <= 2, f'gift rolls are ability 1 or 2 (rarely hidden): {sl[:4]}')
check(sl[4] == 2 and g.rd('wAbilitySlotOverride') == 0, f'setnextability gives the hidden slot once: {sl[4]}')
check(sl[5] == 0, 'a species without ability 2 rolls ability 1')
g.run_script('\tsetnextability ABILITY_SLOT_HIDDEN\n\tgivepoke POLITOED, 20\n\tend')
settle(g, 60)
check(g.rd('wBufferMonAbilitySlot') & 3 == 2 and g.rd('wAbilitySlotOverride') == 0, 'a gift sent to the PC gets the setnextability slot')

g = new_patched()
g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
g.run_script('\tgivepoke MACHAMP, 50\n\tgiveitem MASTER_BALL, 5\n\tend')
settle(g, 30)
g.wr('wPartyMon1AbilitySlot', 1)
g.run_script('\tsetnextability ABILITY_SLOT_HIDDEN\n' + battle_script('POLITOED', 20))
for i in range(400):
    g.frames(5)
    if g.in_battle() and at_menu(g): break
    g.press('B', hold=3, after=3)
check(NAME[g.rd('wBattleMonAbility')] == 'ABILITY_LEVITATE', 'the player\'s Pokemon battles with its own slot (Machamp slot 2: Levitate)')
check(g.rd('wEnemyAbilitySlot') == 2 and NAME[g.rd('wEnemyMonAbility')] == 'ABILITY_RAIN_DISH' and g.rd('wBattleWeather') == 0,
      'setnextability before a wild battle: hidden Rain Dish, so no Drizzle rain')
g.frames(60); g.press('D', after=20); g.press('A', after=60); g.press('R', after=40)
g.press('A', after=40); g.press('A', after=60)
for i in range(300):
    g.frames(10)
    if not g.in_battle(): break
    g.press('B', hold=3, after=3)
check(slots(g) == [1, 2], f'a caught Pokemon keeps its battle slot: {slots(g)}')
settle(g, 10); g.frames(30)
g.press('START', after=40); g.press('D', after=15); g.press('A', after=60)
g.press('A', after=30); g.press('A', after=90)
for p in range(4): g.press('R', after=40)
t1 = g.screen_text()
g.press('D', after=90)
t2 = g.screen_text()
check('Ability:' in t1 and 'Hidden' not in t1 and 'Levitate' in t1, 'stats screen: Machamp in slot 2 shows Levitate')
check('Hidden Ability:' in t2 and 'Rain Dish' in t2, 'stats screen: the caught Politoed shows Hidden Ability: Rain Dish')

# 6. NPC trades: no slot in the npctrade entry -> rolled like a gift
g = new()
patch(g, 'DUSKULL', 'ABILITY_LEVITATE', 'ABILITY_HASTE', 'ABILITY_FOCUS')
g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
g.run_script('\tgivepoke ABRA, 10\n\tend')
settle(g, 30)
abra = g.rd('wPartySpecies')
g.run_script('\ttrade NPC_TRADE_MIKE\n\tend')
for i in range(150):
    g.frames(20); g.press('A', after=10)
    if g.rd('wPartySpecies') != abra and g.rd('wPartyCount') == 1: break
check(g.rd('wPartySpecies') != abra and g.rd('wPartyMon1AbilitySlot') & 3 in (0, 1),
      f"NPC trade without a slot rolls ability 1 or 2: {g.rd('wPartyMon1AbilitySlot') & 3}")

# 7. Ability Capsule and Ability Patch, used from the Pack on Machamp (patched abilities)
def item_use(item, start_slot, answer='yes'):
    """item 0 = Ability Capsule, 1 = Ability Patch. Returns (new slot, capsules left, patches left)."""
    g = new_patched()
    g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
    g.wr('wNumItems', 0); g.wr('wItems', 0xFF)
    g.run_script('\tgivepoke MACHAMP, 30\n\tgiveitem ABILITY_CAPSULE, 5\n\tgiveitem ABILITY_PATCH, 5\n\tend')
    settle(g, 40); g.frames(30)
    g.wr('wPartyMon1AbilitySlot', start_slot)
    g.press('START', after=40); g.press('D', after=15); g.press('D', after=15); g.press('A', after=60)
    for i in range(item): g.press('D', after=20)
    g.press('A', after=40); g.press('A', after=60); g.press('A', after=200)
    if 'Yes' in g.screen_text():
        g.press('A' if answer == 'yes' else 'B', after=200)
    for i in range(12): g.press('B', after=30)
    items = g.rd('wItems', 6)
    return g.rd('wPartyMon1AbilitySlot') & 3, items[2], items[5]
r = item_use(0, 0); check(r == (1, 4, 5), f'Ability Capsule: slot 1 -> 2, one Capsule used {r}')
r = item_use(0, 2); check(r == (2, 5, 5), f'Ability Capsule on a hidden ability: no effect, not used {r}')
r = item_use(1, 1); check(r == (2, 5, 4), f'Ability Patch: slot 2 -> hidden, one Patch used {r}')
r = item_use(1, 2, 'no'); check(r == (2, 5, 5), f'Ability Patch, answering No: unchanged, not used {r}')

print(f'\n{len(fails)} failure(s)')
sys.exit(1 if fails else 0)
