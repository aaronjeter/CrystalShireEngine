#!/usr/bin/env python3
"""Writes data/pokemon/facility_eligibility.asm: one byte per species for the
challenge facilities (engine/events/facility.asm).

  bit 0  FACILITY_LITTLE_F  in LittleCupMons (data/pokemon/cup_lists.asm)
  bit 1  FACILITY_MIDDLE_F  has a pre-evolution and evolves further (megas ignored)
  bits 2-3                  home region: 0 Johto, 1 Kanto, 2 Hoenn

Home region: the species' base stats file (kanto/johto/hoenn); species in the
alt and mega files take their pre-evolution's region, else the base species'
(the name without a trailing digit), else Johto.

usage: facility_table.py [REPO]   (prints a summary; --list prints every species)
"""
import os
import re
import sys

PARTS = ['kanto', 'johto', 'hoenn', 'alt', 'mega']
REGION = {'johto': 0, 'kanto': 1, 'hoenn': 2}
REGION_NAME = ['Johto', 'Kanto', 'Hoenn']


def species_names(repo):
    names = []
    for l in open(os.path.join(repo, 'data/pokemon/follower_palettes.asm'), encoding='utf-8'):
        m = re.match(r'\s*RGB .*;\s*([A-Z0-9_]+)', l)
        if m and '(no species)' not in l:
            names.append(m[1])
    return names


def parts(repo):
    """The base stats part (kanto, johto...) of each species, in species order."""
    out = []
    for p in PARTS:
        for l in open(os.path.join(repo, f'data/pokemon/base_stats_{p}.asm'), encoding='utf-8'):
            if re.match(r'\s*INCLUDE "', l):
                out.append(p)
    return out


def evolutions(repo, names):
    """species -> list of species it evolves into."""
    evo = {}
    for p in PARTS:
        text = open(os.path.join(repo, f'data/pokemon/evos_attacks_{p}.asm'), encoding='utf-8').read()
        labels = re.findall(r'^\s*dw (\w+EvosAttacks)\s*$', text, re.M)
        for lab in labels:
            m = re.search(rf'^{lab}:\s*\n(.*?)\n\s*db 0', text, re.M | re.S)
            targets = []
            if m:
                for l in m[1].split('\n'):
                    w = l.split(';')[0].split(None, 1)
                    if len(w) < 2:
                        continue
                    a = [x.strip() for x in w[1].split(',')]
                    if w[0].startswith(('db', 'dw')) and len(a) >= 3:
                        targets.append(a[-1])
            evo[lab] = targets
        evo.setdefault('_order', []).extend(labels)
    order = evo.pop('_order')
    assert len(order) == len(names), (len(order), len(names))
    return {n: evo[lab] for n, lab in zip(names, order)}


def little_cup(repo):
    text = open(os.path.join(repo, 'data/pokemon/cup_lists.asm'), encoding='utf-8').read()
    m = re.search(r'LittleCupMons::(.*?)(?:\n\w|\Z)', text, re.S)
    return set(re.findall(r'^\s*dw (\w+)', m[1], re.M))


def build(repo):
    names = species_names(repo)
    part = dict(zip(names, parts(repo)))
    evo = evolutions(repo, names)
    # megas: DRAGONITEX, CHARIZARDY... (the mega file also has forms and customs)
    mega = {n for n in names if part[n] == 'mega' and n[-1] in 'XY' and n[:-1] in part}

    def form(a, b):
        # a regional form or variant of the same species (KADABRA2, ARAICHU, GPONYTA)
        return b in (a + '2', a + '3') or a in (b + '2', b + '3') or \
            (b[1:] == a and b[0] in 'AGHP') or (a[1:] == b and a[0] in 'AGHP')
    pre = {}  # species -> the species that evolve into it (megas: their base)
    for n in names:
        for t in evo[n]:
            if t in part:
                pre.setdefault(t, []).append(n)
    little = little_cup(repo)

    def region(n, seen=()):
        if part[n] in REGION:
            return REGION[part[n]]
        for p in pre.get(n, []):
            if p not in seen:
                return region(p, seen + (n,))
        base = re.sub(r'\d+$', '', n)
        if base != n and base in part:
            return region(base, seen + (n,))
        return 0

    rows = []
    for n in names:
        has_pre = n not in mega and any(not form(p, n) for p in pre.get(n, []))
        evolves = any(t in part and t not in mega and not form(n, t) for t in evo[n])
        rows.append((n, n in little, has_pre and evolves, region(n)))
    return rows


def write(repo, rows):
    lines = ['; Challenge facility eligibility of each species (engine/events/facility.asm).',
             '; Made by tools/facility_table.py: FACILITY_LITTLE, FACILITY_MIDDLE, home region.', '',
             'FacilityEligibility::', '\ttable_width 1', '\tdb 0 ; (no species)']
    for n, lit, mid, reg in rows:
        bits = []
        if lit:
            bits.append('FACILITY_LITTLE')
        if mid:
            bits.append('FACILITY_MIDDLE')
        bits.append(f'FACILITY_{REGION_NAME[reg].upper()}')
        lines.append(f'\tdb {" | ".join(bits)} ; {n}')
    lines.append('\tassert_table_length NUM_POKEMON + 1')
    open(os.path.join(repo, 'data/pokemon/facility_eligibility.asm'), 'w', encoding='utf-8').write('\n'.join(lines) + '\n')


if __name__ == '__main__':
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    repo = args[0] if args else os.path.join(os.path.dirname(__file__), '..')
    rows = build(repo)
    write(repo, rows)
    print(f'{len(rows)} species: {sum(r[1] for r in rows)} Little, {sum(r[2] for r in rows)} Middle; '
          + ', '.join(f'{REGION_NAME[i]} {sum(r[3] == i for r in rows)}' for i in range(3)))
    if '--list' in sys.argv:
        for r in rows:
            print(r[0], 'L' if r[1] else '-', 'M' if r[2] else '-', REGION_NAME[r[3]])
