"""Scaled trainer parties (party option SCALED; engine/battle/scaled_trainers.asm) and
badge-tier Pokemon (`tier 2` / `tier 3` in the party data).

- A Pokemon with a tier mark joins only from that badge tier (2: TIER2_BADGES total
  badges, 3: TIER3_BADGES); this works in any party.
- In a SCALED party each Pokemon evolves as far as its level allows
  (data/trainers/scaled_evolutions.asm); one that evolved drops its listed moves for
  its default moves. A SCALED random team draws one more Pokemon per tier above 1.

usage: test_scaled_trainers.py ROM SYM STATE
"""
import os
import re
import subprocess
import sys
from battle_test import Game

ROM, SYM, STATE = sys.argv[1:4]
CSE = os.environ.get('CSE', '/root/cse_pc')
RESULTS = []

SPECIES = [None]
for line in open(os.path.join(CSE, 'constants/pokemon_constants.asm'), encoding='utf-8'):
    if 'DEF NUM_POKEMON' in line:
        break
    m = re.match(r'\s*const\s+(\w+)', line)
    if m:
        SPECIES.append(m.group(1))
MOVES = [None]
for line in open(os.path.join(CSE, 'constants/move_constants.asm'), encoding='utf-8'):
    if 'DEF NUM_ATTACKS' in line:
        break
    m = re.match(r'\s*const\s+(\w+)', line)
    if m and m.group(1) != 'NO_MOVE':
        MOVES.append(m.group(1))


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def badge_bits(n):
    bits = (1 << n) - 1
    return [bits & 0xff, bits >> 8 & 0xff, bits >> 16 & 0xff]


def index16(g, table, i):
    v = g.rd16(f'{table}+{(i - 1) * 2}')
    return (v & 0xff) << 8 | v >> 8


def ot_party(g):
    """[(species, level, [moves])] of the OT party"""
    n = g.rd('wOTPartyCount')
    size = g.sym['wOTPartyMon2'][1] - g.sym['wOTPartyMon1'][1]
    lvl, mv = g.const('MON_LEVEL'), g.const('MON_MOVES')
    out = []
    for i in range(n):
        sid = g.rd(f'wOTPartySpecies+{i}')
        moves = [MOVES[index16(g, 'wMoveIndexTableEntries', m)]
                 for m in g.rd(f'wOTPartyMon1+{i * size + mv}', 4) if m]
        out.append((SPECIES[index16(g, 'wPokemonIndexTableEntries', sid)],
                    g.rd(f'wOTPartyMon1+{i * size + lvl}'), moves))
    return out


def load(cls, pid, badges, base, hard=False, patch=None):
    """Start a battle with trainer cls/pid at `badges` badges and wBaseLevel `base`;
    the OT party once the battle has started."""
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.wr('wBadges', badge_bits(badges))
    g.wr('wBaseLevel', base)
    g.wr('wHardMode', 0 if hard else 1)
    if patch:
        patch(g)
    g.run_script(f'''TestScript:
	winlosstext .win, .win
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	loadtrainer {cls}, {pid}
	startbattle
	reloadmapafterbattle
	end
.win
	text "X"
	done''')
    for _ in range(600):
        g.frames(2)
        if g.in_battle() and g.rd('wOTPartyCount'):
            break
    g.frames(4)
    return ot_party(g)


def names(party):
    return [s for s, _, _ in party]


def case_tiers_and_evolution():
    # Josh (Rustboro Gym, SCALED): Geodude 4, Alolan Geodude 4; Larvitar (tier 2), Lileep (tier 3)
    p = load('YOUNGSTER', 'RUSTBORO_JOSH', 0, 0)
    check('Josh, 0 badges: the two untiered Pokemon, unevolved',
          names(p) == ['GEODUDE', 'AGEODUDE'] and [l for _, l, _ in p] == [4, 4], p)
    p = load('YOUNGSTER', 'RUSTBORO_JOSH', 3, 15)
    check('3 badges (tier 1), level 19: no tier Pokemon, nothing evolves', names(p) == ['GEODUDE', 'AGEODUDE'], p)
    p = load('YOUNGSTER', 'RUSTBORO_JOSH', 4, 20)
    check('4 badges (tier 2), level 24: + Larvitar, nothing at its evolution level yet',
          names(p) == ['GEODUDE', 'AGEODUDE', 'LARVITAR'], p)
    p = load('YOUNGSTER', 'RUSTBORO_JOSH', 8, 21)
    check('8 badges (tier 2), level 25: Graveler and Alolan Graveler, + Larvitar',
          names(p) == ['GRAVELER', 'AGRAVELER', 'LARVITAR'], p)
    p = load('YOUNGSTER', 'RUSTBORO_JOSH', 14, 46)
    check('14 badges (tier 3), level 50: Golems, Pupitar, + Cradily',
          names(p) == ['GOLEM', 'AGOLEM', 'PUPITAR', 'CRADILY'] and all(l == 50 for _, l, _ in p), p)
    p = load('YOUNGSTER', 'RUSTBORO_JOSH', 24, 64)
    check('24 badges, level 68: Tyranitar too', names(p) == ['GOLEM', 'AGOLEM', 'TYRANITAR', 'CRADILY'], p)
    p = load('YOUNGSTER', 'RUSTBORO_JOSH', 14, 46, hard=True)
    check('Hard team at tier 3: its 3 + the 2 tier Pokemon, evolved',
          names(p) == ['GOLEM', 'AGOLEM', 'AGGRON', 'PUPITAR', 'CRADILY'] and all(l == 51 for _, l, _ in p), p)
    ok = all(m for _, _, m in p)
    check('evolved Pokemon have moves', ok, [m for _, _, m in p])


def case_default_moves():
    # an evolved Pokemon of a scaled party with listed moves gets its default moves;
    # unevolved, the listed ones stay. Falkner 1's Natu (PECK, LEER, NIGHT_SHADE,
    # CONFUSION) with his party patched to SCALED.
    def scaled(g):
        a = g.rom_addr('TrainerGroups') + 3 * (g.const('FALKNER') - 1)
        rom = g.rom()
        bank, addr = rom[a], rom[a + 1] | rom[a + 2] << 8
        p = bank * 0x4000 + addr - 0x4000 + 2  # party 1, after its size word
        while rom[p] != 0x50:  # "@"
            p += 1
        g.poke_rom(p + 1, [rom[p + 1] | 1 << g.const('TRAINERTYPE_SCALED_F')])
    p = load('FALKNER', 'FALKNER1', 0, 0, patch=scaled)
    check('scaled, not evolved: Natu keeps its listed moves',
          p[0][0] == 'NATU' and p[0][2] == ['PECK', 'LEER', 'NIGHT_SHADE', 'CONFUSION'], p[0])
    p = load('FALKNER', 'FALKNER1', 0, 30, patch=scaled)
    check('scaled, evolved: Xatu has default moves, not the listed ones',
          p[0][0] == 'XATU' and p[0][2] != ['PECK', 'LEER', 'NIGHT_SHADE', 'CONFUSION'] and len(p[0][2]) == 4,
          p[0])
    p = load('FALKNER', 'FALKNER1', 0, 30)
    check('not scaled (Falkner as shipped): Natu stays Natu at level 36 with its moves',
          p[0][0] == 'NATU' and p[0][2] == ['PECK', 'LEER', 'NIGHT_SHADE', 'CONFUSION'], p[0])


def case_random_team():
    for badges, n in ((0, 3), (4, 4), (14, 5)):
        p = load('BIRD_KEEPER', 'ROD', badges, 50)
        check(f'Rod (random, scaled) at {badges} badges: {n} Pokemon', len(p) == n and len(set(names(p))) == n, p)
    p = load('BIRD_KEEPER', 'ROD', 14, 50)
    check('Rod at level 55: evolved birds (no Pidgey/Spearow/Zubat/Hoothoot left)',
          not set(names(p)) & {'PIDGEY', 'SPEAROW', 'ZUBAT', 'HOOTHOOT', 'NATU', 'DODUO'}, names(p))


def case_branches():
    # Victoria (Goldenrod Gym): Sentret, Zigzagoon, Eevee -> an Eeveelution at 30+
    a = load('BEAUTY', 'VICTORIA', 8, 40)
    b = load('BEAUTY', 'VICTORIA', 8, 40)
    evo = {'JOLTEON', 'VAPOREON', 'FLAREON', 'ESPEON', 'UMBREON', 'SYLVEON', 'LEAFEON', 'GLACEON'}
    check('Eevee at 47 becomes an Eeveelution', a[2][0] in evo, a)
    check('the same trainer gets the same branch every time', names(a) == names(b), (names(a), names(b)))
    p = load('BOARDER', 'BRAD', 0, 50)
    check('Brad\'s two Piloswine at 57: both Mamoswine', names(p)[:2] == ['MAMOSWINE', 'MAMOSWINE'], p)


def case_not_scaled():
    # a party without SCALED (Falkner 1) and without tier marks reads as before
    p = load('FALKNER', 'FALKNER1', 24, 0)
    check('Falkner 1 at 24 badges: unchanged (Natu 6, Pidgey 5, ...)', p[0][:2] == ('NATU', 6) and
          p[1][:2] == ('PIDGEY', 5), p)


def case_table():
    r = subprocess.run([sys.executable, os.path.join(CSE, 'tools/scaled_evos_table.py'), CSE, '--check'],
                       capture_output=True, text=True)
    check('the evolution table is up to date', r.returncode == 0, r.stdout.strip())
    text = open(os.path.join(CSE, 'data/trainers/scaled_evolutions.asm'), encoding='utf-8').read()
    rows = re.findall(r'scaled_evo (\w+), \d+, (\w+)(.*)', text)
    # (level evolutions are the game's own, e.g. Weezing -> Galarian Weezing at 42)
    swaps = [r for r in rows if 'item' in r[2] and r[1] != 'PORYGON2' and
             r[1] in ('A' + r[0], 'G' + r[0], 'H' + r[0], r[0] + '2', r[0][1:], r[0][:-1])
             or re.search(r'ITE_[XY]', r[2])]
    check('no form swaps or Mega Stones in the table', not swaps and 'GEODUDE, 25, GRAVELER' in text, swaps)


def case_gym_rematch():
    # the real path: Rustboro Gym at 14 badges, Josh not beaten; he challenges on sight
    # with his scaled party
    import test_vs_seeker as V
    V.ROM, V.SYM, V.STATE = ROM, SYM, STATE
    g = V.new('RUSTBORO_GYM', 5, 16, beaten=[], give=False,
              setup='\tclearevent EVENT_BEAT_RUSTBORO_JOSH')
    g.wr('wBadges', badge_bits(14))
    g.wr('wBaseLevel', 46)
    for d in 'UUU':
        V.step(g, d)
        if g.rd('wScriptRunning') or g.in_battle():
            break
    for _ in range(300):
        g.frames(2)
        if g.in_battle() and g.rd('wOTPartyCount'):
            break
        if g.rd('wScriptRunning'):
            g.press('A', after=6)
    g.frames(4)
    p = ot_party(g) if g.in_battle() else []
    check('gym rematch: Josh\'s tier 3 party, evolved', names(p) == ['GOLEM', 'AGOLEM', 'PUPITAR', 'CRADILY'], p)


def case_doubles():
    # Laura & Ty (Dewford Gym, DOUBLES, SCALED): Mankey, Tyrogue, Meditite, Machop; + Combusken (tier 2)
    p = load('FIGHTERS', 'LAURAANDTY', 0, 0)
    check('doubles party, tier 1: its 4', names(p) == ['MANKEY', 'TYROGUE', 'MEDITITE', 'MACHOP'], p)
    p = load('FIGHTERS', 'LAURAANDTY', 4, 30)
    check('doubles party, tier 2 at 36: evolved + Blaziken (Combusken at 36)', len(p) == 5 and
          names(p)[0] == 'PRIMEAPE' and names(p)[1] in ('HITMONCHAN', 'HITMONLEE', 'HITMONTOP') and
          names(p)[4] == 'BLAZIKEN', p)


CASES = [case_doubles, case_gym_rematch, case_tiers_and_evolution, case_default_moves, case_random_team, case_branches, case_not_scaled,
         case_table]

if __name__ == '__main__':
    names_ = [a for a in sys.argv[4:] if a.startswith('case_')]
    for c in CASES:
        if not names_ or c.__name__ in names_:
            try:
                c()
            except Exception as e:
                import traceback; traceback.print_exc()
                check(c.__name__ + ' ran', False, repr(e))
    fails = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(fails)}/{len(RESULTS)} passed')
    sys.exit(1 if fails else 0)
