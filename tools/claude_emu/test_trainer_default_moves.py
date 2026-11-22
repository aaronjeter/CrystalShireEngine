"""Trainer Pokemon without listed moves: at most 2 status moves (TrainerLimitStatusMoves).

    python3 test_trainer_default_moves.py ROM SYM STATE

Loads parties whose default moves (the last 4 level-up moves) had 3-4 status moves, plus
controls, and compares every OT Pokemon's moves and PP with the rule computed from the
source: while more than 2 are status moves, the earliest status move in the list is
replaced by the latest attacking level-up move (by its level) it doesn't know yet.
"""
import os, re, sys
sys.path.insert(0, os.path.join(os.environ.get('CSE', '/root/cse_pc'), 'tools'))
import trainer_audit as A
from battle_test import Game

ROM, SYM, STATE = sys.argv[1:4]
CSE = os.environ.get('CSE', '/root/cse_pc')
d = A.Data(CSE)
mv = {}
for l in open(os.path.join(CSE, 'data/moves/moves.asm'), encoding='latin-1'):
    m = re.match(r'\s*move\s+\w+,\s*\d+,\s*\w+,\s*(\w+).*;\s*(\w+)', l)
    if m:
        mv[m.group(2)] = m.group(1)
STATUS = {k for k, c in mv.items() if c == 'STATUS'}
CASES = ['EVERGRANDE_DUNGEON_M4', 'JOSH', 'MAUVILLE_BRUCE', 'FALKNER1', 'BUGSY1']


def expected(species, lvl):
    learned = []
    for L, m in d.levelup.get(species, []):
        if L <= lvl and m not in learned:
            learned.append(m)
    cur = learned[-4:]
    while sum(m in STATUS for m in cur) > 2:
        cand = [m for m in learned if m not in STATUS and m not in cur]
        if not cand:
            break
        i = next(i for i, m in enumerate(cur) if m in STATUS)
        cur[i] = cand[-1]
    return cur


results = []
for pid in CASES:
    p = d.parties[pid]
    cls = p['class']
    num = [i for i in dict(d.classes)[cls]].index(pid) + 1
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.set_party([('MEW', 50, None, ['SPLASH'])], ())
    base = 30
    g.start_battle_id = None
    g.wr('wBaseLevel', base)
    g.run_script(f'''TestScript:
	winlosstext .win, .loss
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	loadtrainer {cls}, {num}
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
    psize = g.const('PARTYMON_STRUCT_LENGTH')
    off_m, off_pp, off_l = g.const('MON_MOVES'), g.const('MON_PP'), g.const('MON_LEVEL')
    team = p['normal']['mons']
    for k, mon in enumerate(team):
        lvl = g.rd(f'wOTPartyMon1+{k * psize + off_l}')
        ids = g.rd(f'wOTPartyMon1+{k * psize + off_m}', 4)
        pps = g.rd(f'wOTPartyMon1+{k * psize + off_pp}', 4)
        got = []
        for i in ids:
            v = g.rd16(f'wMoveIndexTableEntries+{(i - 1) * 2}') if i else 0
            got.append(((v & 0xff) << 8 | v >> 8) if i else 0)
        want = [g.const16(m) for m in mon['moves']] if 'moves' in mon else \
            [g.const16(m) for m in expected(mon['species'], lvl)]
        want += [0] * (4 - len(want))
        ok = got == want and all((pp > 0) == (i > 0) for pp, i in zip(pps, ids))
        names = expected(mon['species'], lvl) if 'moves' not in mon else mon['moves']
        print(('PASS' if ok else 'FAIL'), pid, mon['species'], 'L', lvl, names, got, want, pps, flush=True)
        results.append(ok)
print(f'{sum(results)}/{len(results)} passed')
