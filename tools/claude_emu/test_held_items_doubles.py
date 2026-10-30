"""Held items (Oct 30, 2026) through test_doubles.py's runner:
    python3 test_held_items_doubles.py ROM.gbc ROM.sym STATE [case ...]
items_doubles: Life Orb recoil once for a spread move (Earthquake), Black Sludge, Flame Orb and
               Toxic Orb at the end of a double-battle turn.
sash_singles:  a trainer's Earthquake would knock out a full-HP Focus Sash holder: it hangs on, the
               sash is used up for the battle, and the party mon still holds it after the win."""
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import test_doubles as td


def check_items_doubles(recs, v):
    t, p = td.turns(recs, v), []
    t1 = t[0][1]
    t12 = t1 + ' | ' + t[1][1]  # the end-of-turn text can land in the next turn's records
    print('TURN 1:', t1, '\nTURN 2:', t[1][1][:600], flush=True)
    if t1.count('some of its HP!') != 1:
        p.append(f'turn 1: Life Orb recoil {t1.count("some of its HP!")} times (expected 1)')
    for w in ('hurt by its', 'badly poisoned', 'was burned by'):
        if w not in t12:
            p.append(f'turns 1-2: no "{w}"')
    return p


def check_sash(recs, v):
    p = []
    text = ' '.join(' '.join(r.get('log') or []) for r in recs)
    if 'Focus Sash' not in text:
        p.append('no Focus Sash text')
    if v.g.rd('wPartyMon1Item') == 0:
        p.append('the party mon lost its Focus Sash after the battle')
    return p


NO = 'NO_ABILITY'
td.CASES.update({
    'items_doubles': dict(
        cls='COOLTRAINERM',
        party=[('GOLEM', 30, 'LIFE_ORB', ['EARTHQUAKE']), ('MACHAMP', 60, 'BLACK_SLUDGE', ['SPLASH', 'KARATE_CHOP'])],
        trainer=[(30, 'PIDGEOT', 'TOXIC_ORB', ['SPLASH']), (40, 'SNORLAX', 'FLAME_ORB', ['SPLASH'])],
        abilities={'GOLEM': NO, 'MACHAMP': NO, 'PIDGEOT': NO, 'SNORLAX': NO},
        actions=[('move', 0), ('move', 0)] + [('move', 0), ('move', 1, 0), ('move', 0), ('move', 1, 1)] * 20,
        check=lambda recs, v: check_items_doubles(recs, v),
        result=td.WIN),
    'sash_singles': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('MACHAMP', 20, 'FOCUS_SASH', ['SEISMIC_TOSS'])],
        trainer=[(60, 'GOLEM', None, ['EARTHQUAKE'])],
        abilities={'MACHAMP': NO, 'GOLEM': NO},
        setup=lambda g: g.wr16('wEnemyMonHP', 1),
        actions=[('move', 0)] * 5,
        check=lambda recs, v: check_sash(recs, v),
        result=td.WIN),
})

if __name__ == '__main__':
    rom, sym, state = sys.argv[1:4]
    names = sys.argv[4:] or ['items_doubles', 'sash_singles']
    bad = 0
    for n in names:
        problems, recs = td.run_case(rom, sym, state, n)
        print(('ok   ' if not problems else 'FAIL ') + n, problems, flush=True)
        bad += bool(problems)
    sys.exit(1 if bad else 0)
