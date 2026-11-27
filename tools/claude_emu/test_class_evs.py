"""Trainer class EVs (ReadTrainerMon.DefaultEVs): real parties loaded in battle on
Normal and Hard; every Pokemon's EVs match the class's tier and preset at its level
(data/trainers/class_evs.asm, data/trainers/ev_spreads.asm).

  shape: the preset, off-stats (< 128) raised to 126 (EVS_ALL: 168 each);
         Hard bosses (EV_TIER_MAX): 252 in every stat
  ratio: ROUTE level x 3 / 2, ELITE level x 3, BOSS and MAX level x 5 (capped at 255)
  EV = shape x (ratio + 1) / 256; Hard moves a class up one tier

usage: test_class_evs.py ROM SYM STATE
"""
import os
import re
import sys

ROM, SYM, STATE = sys.argv[1:4]
sys.argv = ['x', ROM, SYM, STATE]
import test_scaled_trainers as T  # noqa: E402

CSE = os.environ.get('CSE', '.')
TIERS = ['ROUTE', 'ELITE', 'BOSS', 'MAX']
RESULTS = []


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS' if ok else 'FAIL'), name, f' [{info}]' if info else '')


def presets():
    rows = []
    for line in open(os.path.join(CSE, 'data/trainers/ev_spreads.asm'), encoding='utf-8'):
        m = re.match(r'\s*db\s+([\d,\s]+);\s*(EVS_\w+)', line)
        if m:
            rows.append((m.group(2)[4:], [int(x) for x in m.group(1).split(',')]))
    return dict(rows)


def class_rows():
    out = {}
    for line in open(os.path.join(CSE, 'data/trainers/class_evs.asm'), encoding='utf-8'):
        m = re.match(r'\s*class_evs\s+(\w+),\s*(\w+)\s*;\s*(\w+)', line)
        if m:
            out[m.group(3)] = (m.group(1), m.group(2))
    return out


PRESETS, CLASSES = presets(), class_rows()


def expected(cls, level, hard):
    tier, preset = CLASSES[cls]
    t = TIERS.index(tier) + (1 if hard else 0)
    if t >= 3:
        shape = [252] * 6
    elif preset == 'ALL':
        shape = [168] * 6
    else:
        shape = [x if x >= 128 else 126 for x in PRESETS[preset]]
    ratio = min(255, level * 3 // 2 if t == 0 else level * 3 if t == 1 else level * 5)
    return [(s * ratio + s) >> 8 for s in shape]


def party_evs(g):
    n = g.rd('wOTPartyCount')
    size = g.sym['wOTPartyMon2'][1] - g.sym['wOTPartyMon1'][1]
    ev, lvl = g.const('MON_EVS'), g.const('MON_LEVEL')
    return [(g.rd(f'wOTPartyMon1+{i * size + lvl}'), list(g.rd(f'wOTPartyMon1+{i * size + ev}', 6)))
            for i in range(n)]


captured = {}
_ot_party = T.ot_party


def _capture(g):
    captured['evs'] = party_evs(g)
    return _ot_party(g)


T.ot_party = _capture

CASES = [  # class, party, badges, wBaseLevel
    ('YOUNGSTER', 'JOEY', 0, 0),        # ROUTE
    ('COOLTRAINERM', 'NICK', 4, 20),    # ELITE (Hard: the BOSS curve)
    ('FALKNER', 'FALKNER1', 0, 0),      # BOSS, low levels
    ('MORTY', 'MORTY1', 3, 15),         # BOSS, mid levels
    ('PRYCE', 'PRYCE1', 6, 30),         # BOSS, L38-42
    ('MORTY', 'MORTY2', 8, 40),         # BOSS at the cap (L51+)
]


def main():
    for cls, pid, badges, base in CASES:
        for hard in (False, True):
            names = T.load(cls, pid, badges, base, hard)
            bad = []
            for (species, _, _), (level, evs) in zip(names, captured['evs']):
                want = expected(cls, level, hard)
                if evs != want:
                    bad.append(f'{species} L{level} {evs} != {want}')
            mode = 'Hard' if hard else 'Normal'
            lv = [lv for lv, _ in captured['evs']]
            check(f'{cls} {pid} ({mode}, L{min(lv)}-{max(lv)}): EVs follow the {CLASSES[cls][0]} curve',
                  not bad, '; '.join(bad))
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
