#!/usr/bin/env python3
"""Per-species overworld behaviors (data/pokemon/overworld_behaviors.asm).

  ow_behaviors.py draft [REPO] > behaviors.csv   first draft from the type map below
  ow_behaviors.py csv   [REPO] > behaviors.csv   the current asm table as CSV
  ow_behaviors.py asm   CSV [REPO]               write the asm table from a CSV

CSV columns (any order; headers matched without case or spaces): Species, Behavior 1,
Behavior 2, Modifiers, Type 1, Type 2, # (modifiers: blank, NOCTURNAL, DIURNAL, SPEEDY, SLUGGISH, BOLD or TIMID;
several joined with "|"). Behaviors may be written with spaces ("Hit and run").
"""
import csv, os, re, sys

BEHAVIORS = ['WANDERER', 'SKITTISH', 'AGGRESSIVE', 'SLEEPY', 'CURIOUS', 'TERRITORIAL',
             'PACER', 'LAZY', 'MIMIC', 'HIT_AND_RUN', 'HIDER', 'TELEPORTER', 'BURROWER']
MODIFIERS = ['NOCTURNAL', 'DIURNAL', 'SPEEDY', 'SLUGGISH', 'BOLD', 'TIMID']
OPPOSITES = [('NOCTURNAL', 'DIURNAL'), ('SPEEDY', 'SLUGGISH'), ('BOLD', 'TIMID')]

# first draft: the behavior each type suggests
TYPE_BEHAVIOR = {
    'NORMAL': 'CURIOUS', 'FIGHTING': 'TERRITORIAL', 'FLYING': 'SKITTISH', 'POISON': 'WANDERER',
    'GROUND': 'BURROWER', 'ROCK': 'SLEEPY', 'BUG': 'HIDER', 'GHOST': 'AGGRESSIVE',
    'STEEL': 'PACER', 'FIRE': 'AGGRESSIVE', 'WATER': 'LAZY', 'GRASS': 'WANDERER',
    'ELECTRIC': 'SKITTISH', 'PSYCHIC_TYPE': 'TELEPORTER', 'ICE': 'SLEEPY', 'DRAGON': 'TERRITORIAL',
    'DARK': 'HIT_AND_RUN', 'FAIRY': 'CURIOUS',
}

# first draft: species that clearly don't fit their types' behaviors
DRAFT_OVERRIDES = {
    'DITTO': ('MIMIC', 'MIMIC', ''), 'SMEARGLE': ('MIMIC', 'CURIOUS', ''),
    'SNORLAX': ('SLEEPY', 'SLEEPY', ''), 'SLAKOTH': ('SLEEPY', 'LAZY', ''),
    'ABRA': ('TELEPORTER', 'TELEPORTER', ''),
    'HOOTHOOT': ('CURIOUS', 'SKITTISH', 'NOCTURNAL'), 'NOCTOWL': ('TERRITORIAL', 'SKITTISH', 'NOCTURNAL'),
    'ZUBAT': ('SKITTISH', 'HIT_AND_RUN', 'NOCTURNAL'), 'GOLBAT': ('AGGRESSIVE', 'HIT_AND_RUN', 'NOCTURNAL'),
    'GASTLY': ('HIT_AND_RUN', 'AGGRESSIVE', 'NOCTURNAL'), 'MURKROW': ('HIT_AND_RUN', 'SKITTISH', 'NOCTURNAL'),
    'MISDREAVUS': ('HIT_AND_RUN', 'AGGRESSIVE', 'NOCTURNAL'), 'SPINARAK': ('HIDER', 'HIDER', 'NOCTURNAL'),
    'VOLTORB': ('SLEEPY', 'AGGRESSIVE', ''), 'SUDOWOODO': ('SLEEPY', 'SLEEPY', ''),
    'PIKACHU': ('CURIOUS', 'SKITTISH', 'SPEEDY'), 'RATTATA': ('HIT_AND_RUN', 'SKITTISH', 'SPEEDY'),
}


def species(repo):
    """(name, type1, type2) in species order, from the base stats includes."""
    names = []
    for l in open(os.path.join(repo, 'data/pokemon/follower_palettes.asm'), encoding='utf-8'):
        m = re.match(r'\s*RGB .*;\s*([A-Z0-9_]+)', l)
        if m and '(no species)' not in l:
            names.append(m[1])
    files = []
    for part in ('kanto', 'johto', 'hoenn', 'alt', 'mega'):
        for l in open(os.path.join(repo, f'data/pokemon/base_stats_{part}.asm'), encoding='utf-8'):
            m = re.match(r'\s*INCLUDE "(.*)"', l)
            if m:
                files.append(m[1])
    assert len(names) == len(files), (len(names), len(files))
    out = []
    for n, f in zip(names, files):
        t = re.search(r'db\s+(\w+),\s*(\w+)\s*; type', open(os.path.join(repo, f), encoding='utf-8').read())
        out.append((n, t[1], t[2]))
    return out


def nice(name):
    return name.replace('_', ' ').title().replace('Psychic Type', 'Psychic')


def write_csv(rows):
    w = csv.writer(sys.stdout)
    w.writerow(['Species', 'Behavior 1', 'Behavior 2', 'Modifiers', 'Type 1', 'Type 2', '#'])
    for i, (n, t1, t2, b1, b2, mods) in enumerate(rows, 1):
        w.writerow([n, nice(b1), nice(b2), nice(mods).replace('|', ' | ') if mods else '', nice(t1), nice(t2), i])


def draft(repo):
    rows = []
    for n, t1, t2 in species(repo):
        rows.append((n, t1, t2) + DRAFT_OVERRIDES.get(n, (TYPE_BEHAVIOR[t1], TYPE_BEHAVIOR[t2], '')))
    write_csv(rows)


def read_asm(repo):
    out = []
    for l in open(os.path.join(repo, 'data/pokemon/overworld_behaviors.asm'), encoding='utf-8'):
        m = re.match(r'\s*ow_behavior\s+OW_(\w+),\s*OW_(\w+)(?:,\s*([\w| ]+?))?\s*;\s*(\w+)', l)
        if m:
            mods = '|'.join(x.strip()[3:] for x in (m[3] or '').split('|') if x.strip())
            out.append((m[4], m[1], m[2], mods))
    return out


def to_csv(repo):
    sp = species(repo)
    rows = read_asm(repo)
    assert len(rows) == len(sp)
    write_csv([(n, t1, t2, b1, b2, mods) for (n, t1, t2), (_, b1, b2, mods) in zip(sp, rows)])


def to_asm(path, repo):
    sp = species(repo)
    rows = [{k.lower().replace(' ', ''): (v or '') for k, v in r.items()}
            for r in csv.DictReader(open(path, encoding='utf-8-sig'))]
    assert len(rows) == len(sp), f'{len(rows)} rows for {len(sp)} species'
    lines = ['; Overworld behaviors of each species (engine/overworld/wild_spawns.asm): a spawn',
             '; takes one of the two at random, plus the modifiers. Edited as a spreadsheet:',
             '; tools/ow_behaviors.py converts it to and from this file.', '',
             'OverworldBehaviors::', '\ttable_width 2',
             '\tow_behavior OW_WANDERER, OW_WANDERER ; (no species)']
    for r, (n, _, _) in zip(rows, sp):
        assert r['species'].strip().upper() == n, (r['species'], n)
        b = []
        for k in ('behavior1', 'behavior2'):
            v = r[k].strip().upper().replace('-', '_').replace(' ', '_')
            assert v in BEHAVIORS, f'{n}: unknown behavior {v}'
            b.append('OW_' + v)
        mods = [m.strip().upper() for m in r['modifiers'].split('|') if m.strip()]
        for m in mods:
            assert m in MODIFIERS, f'{n}: unknown modifier {m}'
        for a, z in OPPOSITES:
            assert not (a in mods and z in mods), f'{n}: {a} and {z} together'
        mod = ', ' + ' | '.join('OW_' + m for m in mods) if mods else ''
        lines.append(f'\tow_behavior {b[0]}, {b[1]}{mod} ; {n}')
    lines.append('\tassert_table_length NUM_POKEMON + 1')
    open(os.path.join(repo, 'data/pokemon/overworld_behaviors.asm'), 'w', encoding='utf-8').write('\n'.join(lines) + '\n')


if __name__ == '__main__':
    cmd = sys.argv[1]
    if cmd == 'draft':
        draft(sys.argv[2] if len(sys.argv) > 2 else '.')
    elif cmd == 'csv':
        to_csv(sys.argv[2] if len(sys.argv) > 2 else '.')
    elif cmd == 'asm':
        to_asm(sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else '.')
