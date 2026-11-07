"""Switch tuning on real trainer parties (engine/battle/ai/switch_score.asm).

Usage: python3 tune_switch_ai.py ROM.gbc ROM.sym STATE out.json [--hard] [--jobs N] [PARTY_ID ...]
       python3 tune_switch_ai.py report out.json [more.json ...]

Each party is fought as the game loads it (`loadtrainer CLASS, ID`, its Normal or Hard team) at
the badge count of its map (tools/trainer_audit.py's bands and leader versions), against a
player team of that party's region at the level of the party's ace. The player:
- attacks with the move that does the most damage by a simple estimate (power, STAB, the type
  chart, attack / defense);
- switches when another Pokemon in the party would do at least twice as much (not two turns
  in a row);
- replaces a fainted Pokemon with the one that would do the most damage.
The player's Pokemon know 3 moves (a 4th learned by level-up fills the free slot, so no
move-learning prompt) and their EXP is reset at every menu, so they don't level up.

Records per battle: the result, turns, every enemy send-in (voluntary or after a faint) with
the scores the AI saw (wSAIStayScore, wSAIBestScore), and the text log around each switch.
`report` prints switch counts by tier and lists the cases worth a look: switches back to a
Pokemon that left (loops), switches into a Pokemon the player's next move hits super
effectively, and switch-ins knocked out before they act.
Without party IDs: every singles boss party, and a fixed sample of elite and route parties."""
import json, os, re, sys, collections
from multiprocessing import Pool

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(HERE))
sys.path.insert(0, os.path.join(REPO, 'tools'))
import trainer_audit as ta

# player teams by region: final species, picked down to the stage legal at the level
TEAMS = {
    'johto': ['TYPHLOSION', 'AMPHAROS', 'AZUMARILL', 'HERACROSS', 'GENGAR', 'NOCTOWL'],
    'kanto': ['VENUSAUR', 'PIDGEOT', 'RAICHU', 'LAPRAS', 'MACHAMP', 'ARCANINE'],
    'hoenn': ['SWAMPERT', 'GARDEVOIR', 'BRELOOM', 'MANECTRIC', 'SALAMENCE', 'AGGRON'],
}
NON_LEVEL_EVO_LEVEL = 30   # stones, trades and happiness: assumed from this level
SAMPLE = 15                # elite and route parties in the default set (each)


# ---------------------------------------------------------------- source data
def read_moves(repo):
    """move name -> (power, type, category)"""
    out = {}
    for line in open(os.path.join(repo, 'data/moves/moves.asm'), encoding='latin-1'):
        m = re.match(r'\s*move\s+(\w+),\s*(\d+),\s*(\w+),\s*(\w+),.*;\s*(\w+)', line)
        if m:
            out[m.group(5)] = (int(m.group(2)), m.group(3), m.group(4))
    return out


def read_matchups(repo):
    """(attacking type, defending type) -> multiplier"""
    val = {'SUPER_EFFECTIVE': 2.0, 'NOT_VERY_EFFECTIVE': 0.5, 'NO_EFFECT': 0.0}
    out = {}
    for line in open(os.path.join(repo, 'data/types/type_matchups.asm'), encoding='latin-1'):
        code = line.split(';')[0].strip()
        if code == 'db -1':
            break
        m = re.match(r'db (\w+),\s*(\w+),\s*(\w+)$', code)
        if m and m.group(3) in val:
            out[m.group(1), m.group(2)] = val[m.group(3)]
    return out


def stage_at(d, final, level):
    """the species of `final`'s family a player would have at `level`"""
    s = final
    while s in d.pre:
        p, method, param = d.pre[s]
        need = int(param) if method == 'EVOLVE_LEVEL' and param.isdigit() else NON_LEVEL_EVO_LEVEL
        if level >= need:
            break
        s = p
    return s


def player_moves(d, moves, s, level):
    """3 damaging level-up moves of the family known by `level`: the strongest of each type,
    STAB first, then by power."""
    best = {}
    for f in d.family(s):
        for lv, mv in d.levelup[f]:
            if lv <= level and mv in moves and moves[mv][2] != 'STATUS' and moves[mv][0] > 1:
                t = moves[mv][1]
                if t not in best or moves[mv][0] > moves[best[t]][0]:
                    best[t] = mv
    types = d.types[s]
    picks = sorted(best.values(), key=lambda m: (moves[m][1] not in types, -moves[m][0]))
    return picks[:3] or ['TACKLE']


def party_region(d, pid):
    for f, _ in d.uses.get(pid, []):
        for r in ('johto', 'kanto', 'hoenn'):
            if f'maps/{r}/' in f:
                return r
    return 'johto'


def party_list(d):
    singles = [p for p in d.parties.values() if not p['doubles'] and not p['normal']['random']
               and p['normal']['mons'] and ta.party_band(d, p) is not None and not p['id'].endswith('_UNUSED')]
    boss = [p['id'] for p in singles if ta.tier(d, p) == 'boss']
    out = list(boss)
    for t in ('elite', 'route'):
        ids = [p['id'] for p in singles if ta.tier(d, p) == t]
        step = max(1, len(ids) // SAMPLE)
        out += ids[::step][:SAMPLE]
    return out


def case_of(d, moves, pid, hard):
    p = d.parties[pid]
    band = ta.party_band(d, p)
    base = ta.base_level(band)
    team = p['hard'] if hard and p['hard'] else p['normal']
    ace = max(m['level'] for m in team['mons']) + base
    region = party_region(d, pid)
    mine = []
    for final in TEAMS[region]:
        s = stage_at(d, final, ace)
        mine.append((s, ace, None, player_moves(d, moves, s, ace)))
    return dict(id=pid, cls=p['class'], tier=ta.tier(d, p), band=band, base=base, hard=hard,
                region=region, enemy=[m['species'] for m in team['mons']], party=mine)


# ---------------------------------------------------------------- playing
def set_party_fast(g, mons, mon1, size):
    """battle_test's set_party, waiting for each script to end instead of a fixed time"""
    g.wr('wPartyCount', 0); g.wr('wPartySpecies', 0xFF)
    for i, (sp, lv, item, mv) in enumerate(mons):
        lines = [f'\tgivepoke {sp}, {lv}, {item or "NO_ITEM"}']
        lines += [f'\tgivepokemove {m}, ${mon1 + i * size:04X}, {j}' for j, m in enumerate((list(mv) + ['NO_MOVE'] * 4)[:4])]
        g.run_script('\n'.join(lines + ['\tend']))
        for k in range(400):
            g.frames(3)
            if g.rd('wPartyCount') == i + 1 and g.rd('wScriptMode') == 0 and g.rd('wMapReentryScriptQueueFlag') == 0:
                break
            if k % 3 == 0:
                g.press('B', hold=2, after=2)
        g.frames(10)
    assert g.rd('wPartyCount') == len(mons), g.rd('wPartyCount')


class Tuner:
    def __init__(self, rom, sym, state, moves, matchups):
        import battle_test as bt
        self.bt, self.rom, self.sym, self.state = bt, rom, sym, state
        self.moves, self.matchups = moves, matchups

    def eff(self, mtype, types):
        e = 1.0
        for t in dict.fromkeys(types):
            e *= self.matchups.get((mtype, t), 1.0)
        return e

    def est(self, move, own_types, atk, spa, foe_types, dfn, spd):
        power, mtype, cat = self.moves[move]
        a, b = (atk, dfn) if cat == 'PHYSICAL' else (spa, spd)
        stab = 1.5 if mtype in own_types else 1.0
        return power * stab * self.eff(mtype, foe_types) * a / max(b, 1)

    def run(self, case):
        bt, g = self.bt, None
        g = bt.Game(self.rom, self.sym, self.state)
        types = {}
        for t in ('NORMAL', 'FIGHTING', 'FLYING', 'POISON', 'GROUND', 'ROCK', 'BUG', 'GHOST', 'STEEL',
                  'FIRE', 'WATER', 'GRASS', 'ELECTRIC', 'PSYCHIC_TYPE', 'ICE', 'DRAGON', 'DARK', 'FAIRY'):
            types[g.const(t)] = t
        g.seed(); g.clear_bag()
        mon1 = g.sym['wPartyMon1'][1]
        size = g.sym['wPartyMon2'][1] - mon1
        set_party_fast(g, case['party'], mon1, size)
        off = {k: g.const(f'MON_{k}') for k in ('EXP', 'ATK', 'DEF', 'SAT', 'SDF', 'HP')}
        exp0 = [g.rd(mon1 + i * size + off['EXP'], 3) for i in range(len(case['party']))]
        g.wr('wHardMode', 0 if case['hard'] else 1)
        g.wr('wBaseLevel', case['base'])
        g.wr('wOptions', 0x01 | bt.SCENE_OFF)
        g.seed()
        g.run_script(f'''TestScript:
	winlosstext .win, .loss
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	loadtrainer {case['cls']}, {case['id']}
	startbattle
	reloadmapafterbattle
	end
.win
	text "WIN"
	done
.loss
	text "LOSS"
	done''')
        for _ in range(600):
            g.frames(2)
            if g.in_battle():
                break
        else:
            raise RuntimeError('battle did not start')
        tuner = self
        party = case['party']
        my_types = [tuple(dict.fromkeys(self.d_types[s])) for s, *_ in party]

        def stats(i):
            base = mon1 + i * size
            return [g.rd16(base + off[k]) for k in ('ATK', 'SAT')]

        def foe():
            t = [types.get(x, '?') for x in g.rd('wEnemyMonType', 2)]
            return t, g.rd16('wEnemyMonDefense'), g.rd16('wEnemyMonSpclDef')

        def best_of(i, live):
            ft, fd, fs = foe()
            if live:
                atk, spa = g.rd16('wBattleMonAttack'), g.rd16('wBattleMonSpclAtk')
            else:
                atk, spa = stats(i)
            mv = party[i][3]
            scores = [tuner.est(m, my_types[i], atk, spa, ft, fd, fs) for m in mv]
            j = max(range(len(mv)), key=lambda k: scores[k])
            return scores[j], j

        def alive(i):
            return g.rd16(mon1 + i * size + off['HP']) > 0

        class B(bt.Battle):
            def __init__(s, *a, **k):
                super().__init__(*a, **k)
                s.menus, s.last_switch = [], -5

            def at_menu(s):
                for i, e in enumerate(exp0):
                    g.wr(mon1 + i * size + off['EXP'], e)
                cur = g.rd('wCurBattleMon')
                here, slot = best_of(cur, True)
                act = ('move', slot)
                if s.turn - s.last_switch > 1:
                    bench = [(best_of(i, False)[0], i) for i in range(len(party)) if i != cur and alive(i)]
                    if bench and max(bench)[0] >= 2 * here and max(bench)[0] > 0:
                        act = ('switch', max(bench)[1])
                        s.last_switch = s.turn
                s.menus.append(dict(turn=s.turn, ot=g.rd('wCurOTMon'), ot_hp=g.rd16('wEnemyMonHP'),
                                    mon=cur, hp=g.rd16('wBattleMonHP'), switches=g.rd('wEnemySwitchCount'),
                                    stay=g.rd('wSAIStayScore'), best=g.rd('wSAIBestScore'),
                                    best_index=g.rd('wSAIBestIndex'), action=list(act),
                                    move=party[cur][3][act[1]] if act[0] == 'move' else None,
                                    log=list(s.log)))
                s.actions = [act]
                super().at_menu()
                s.records = s.records[-2:]   # the full RAM records aren't needed

            def choose_replacement(s):
                opts = [(best_of(i, False)[0], i) for i in range(len(party))
                        if i != g.rd('wCurBattleMon') and alive(i)]
                s.replace = [max(opts)[1]] if opts else []
                super().choose_replacement()

        b = B(g, [])
        b.run()
        return dict(case, result=g.rd('wBattleResult'), menus=b.menus, end_log=b.log,
                    final_switches=g.rd('wEnemySwitchCount'))


def _work(args):
    rom, sym, state, case, d_types, moves, matchups = args
    t = Tuner(rom, sym, state, moves, matchups)
    t.d_types = d_types
    try:
        return t.run(case)
    except Exception as e:
        return dict(case, error=f'{type(e).__name__}: {e}')


# ---------------------------------------------------------------- report
def events(r):
    """(kind, menu index) for each enemy send-in: 'switch' (voluntary) or 'faint'"""
    out = []
    m = r.get('menus', [])
    for k in range(1, len(m)):
        if m[k]['ot'] != m[k - 1]['ot']:
            out.append(('switch' if m[k]['switches'] > m[k - 1]['switches'] else 'faint', k))
    return out


def report(results, moves=None, matchups=None):
    by = collections.defaultdict(lambda: collections.Counter())
    flagged = []
    for r in results:
        key = (r['tier'], 'Hard' if r['hard'] else 'Normal')
        c = by[key]
        c['battles'] += 1
        if 'error' in r:
            c['errors'] += 1
            flagged.append(('error', r, None))
            continue
        c['won by player' if r['result'] == 0 else 'lost by player'] += 1
        ev = events(r)
        sw = [k for kind, k in ev if kind == 'switch']
        c['switches'] += len(sw)
        c['battles with a switch'] += bool(sw)
        m = r['menus']
        seen = set([m[0]['ot']]) if m else set()
        for k in sw:
            prev, now = m[k - 1], m[k]
            if now['ot'] in seen - {prev['ot']}:
                c['back to an earlier mon'] += 1
                flagged.append(('back', r, k))
            seen.add(now['ot'])
            # knocked out before it acts: the next menu shows another enemy mon after a faint
            nxt = m[k + 1]['log'] if k + 1 < len(m) else r.get('end_log', [])
            if any(x.startswith('Enemy') and x.endswith('fainted!') for x in nxt):
                c['switch-in fainted at once'] += 1
                flagged.append(('fainted', r, k))
    print('tier/mode: counts')
    for key in sorted(by):
        c = by[key]
        print(f'  {key[0]:6} {key[1]:6}', dict(c))
    for kind, r, k in flagged:
        name = f"{r['id']} ({r['cls']}, band {r['band']}, {'Hard' if r['hard'] else 'Normal'})"
        if kind == 'error':
            print(f"ERROR {name}: {r['error']}")
            continue
        m = r['menus']
        print(f"{kind.upper():8} {name}: turn {m[k]['turn']}: {r['enemy'][m[k - 1]['ot']]} -> {r['enemy'][m[k]['ot']]}"
              f" vs {r['party'][m[k - 1]['mon']][0]} (stay {m[k]['stay']}, best {m[k]['best']})")


def main():
    if sys.argv[1] == 'report':
        res = []
        for f in sys.argv[2:]:
            res += json.load(open(f))
        report(res)
        return
    rom, sym, state, out = sys.argv[1:5]
    rest = sys.argv[5:]
    hard = '--hard' in rest
    jobs = 2
    if '--jobs' in rest:
        jobs = int(rest[rest.index('--jobs') + 1])
        rest = [a for i, a in enumerate(rest) if a != '--jobs' and (i == 0 or rest[i - 1] != '--jobs')]
    rest = [a for a in rest if a != '--hard']
    d = ta.Data(REPO)
    moves, matchups = read_moves(REPO), read_matchups(REPO)
    ids = rest or party_list(d)
    cases = [case_of(d, moves, i, hard) for i in ids]
    d_types = {s: d.types[s] for c in cases for s, *_ in c['party']}
    args = [(rom, sym, state, c, d_types, moves, matchups) for c in cases]
    res = []
    with Pool(jobs) as pool:
        for r in pool.imap(_work, args):
            res.append(r)
            ev = events(r)
            print(f"{r['id']:20} {'error ' + r['error'] if 'error' in r else 'result %d, turns %d, switches %d' % (r['result'], len(r['menus']), sum(k == 'switch' for k, _ in ev))}",
                  flush=True)
            json.dump(res, open(out, 'w'))
    report(res)


if __name__ == '__main__':
    main()
