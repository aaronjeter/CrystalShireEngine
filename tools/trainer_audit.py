#!/usr/bin/env python3
"""Trainer party audit tool (claude/trainer-audit.md in the project).

    python3 tools/trainer_audit.py summary              counts of every finding
    python3 tools/trainer_audit.py area REGION[/AREA]   parties used in maps/REGION/AREA
    python3 tools/trainer_audit.py class CLASS          every party of a class
    python3 tools/trainer_audit.py party ID             one party (e.g. FALKNER3)
    python3 tools/trainer_audit.py unused               parties with no direct `trainer`/`loadtrainer` reference
    python3 tools/trainer_audit.py bands                maps with trainers and their band
    python3 tools/trainer_audit.py learn SPECIES [LEVEL] what it can know at LEVEL
    python3 tools/trainer_audit.py coverage [all]       maps missing an elite or a double battle

Run from the repo root (or pass --repo PATH). Reads the source only, no build needed.
Levels: wBaseLevel = 5 + the badge modifier (engine/events/std_scripts.asm); a party's
effective level is shown for the badge count of its map's band (tools/trainer_bands.txt).
"""
import argparse, collections, glob, os, re, sys

# ---------------------------------------------------------------- reading
def rd(path):
    return open(path, encoding='latin-1').read()

def code_lines(path):
    """(line number, code without comment, comment) for each line"""
    for n, line in enumerate(rd(path).splitlines(), 1):
        code, _, com = line.partition(';')
        yield n, code.strip(), com.strip()

def args_of(s):
    return [a.strip() for a in s.split(',')] if s.strip() else []


class Data:
    def __init__(self, repo):
        self.repo = repo
        self.p = lambda *a: os.path.join(repo, *a)
        self._species()
        self._tms()
        self._learnsets()
        self._eggs()
        self._classes()
        self._parties()
        self._random_lists()
        self._uses()
        self._bands()
        self._items()
        self._abilities()

    # ------------------------------------------------------------ species
    def _species(self):
        self.species = []  # index-1 -> name
        for n, code, _ in code_lines(self.p('constants/pokemon_constants.asm')):
            if code.startswith('DEF NUM_POKEMON'):
                break
            m = re.match(r'const (\w+)$', code)
            if m:
                self.species.append(m.group(1))
        self.sidx = {s: i + 1 for i, s in enumerate(self.species)}
        # base stats files in index order -> tmhm lists, types
        files = []
        for part in ('kanto', 'johto', 'hoenn', 'alt', 'mega'):
            for n, code, _ in code_lines(self.p(f'data/pokemon/base_stats_{part}.asm')):
                m = re.match(r'INCLUDE "(.*)"', code)
                if m:
                    files.append(m.group(1))
        assert len(files) == len(self.species), (len(files), len(self.species))
        self.tmhm = {}
        self.types = {}
        for s, f in zip(self.species, files):
            t = rd(self.p(f))
            m = re.search(r'^\s*tmhm\s*(.*)$', t, re.M)
            self.tmhm[s] = set(args_of(m.group(1).split(';')[0])) if m else set()
            m = re.search(r'^\s*db (\w+), (\w+) ; type', t, re.M)
            self.types[s] = (m.group(1), m.group(2)) if m else ('?', '?')

    def _tms(self):
        self.tm_moves = set()
        for n, code, _ in code_lines(self.p('constants/item_constants.asm')):
            m = re.match(r'add_(tm|hm|mt)\s+(\w+)', code)
            if m:
                self.tm_moves.add(m.group(2))
        t = rd(self.p('engine/items/tmhm2.asm'))
        u = re.search(r'^UniversalTMs:(.*?)^\s*db -1', t, re.M | re.S).group(1)
        self.universal = set(re.findall(r'db (\w+?)_TMNUM', u))
        n_ = re.search(r'^NoTMSpecies:(.*?)^\s*dw -1', t, re.M | re.S).group(1)
        self.no_tm = set(re.findall(r'dw (\w+)', n_))

    def _learnsets(self):
        labels = []
        for part in ('kanto', 'johto', 'hoenn', 'alt', 'mega'):
            t = rd(self.p(f'data/pokemon/evos_attacks_{part}.asm'))
            labels += re.findall(r'^\s*dw (\w+EvosAttacks)\b', t, re.M)
        assert len(labels) == len(self.species), (len(labels), len(self.species))
        bodies = {}
        for part in ('kanto', 'johto', 'hoenn', 'alt', 'mega'):
            cur = None
            for n, code, _ in code_lines(self.p(f'data/pokemon/evos_attacks_{part}.asm')):
                m = re.match(r'(\w+EvosAttacks):', code)
                if m:
                    cur = bodies.setdefault(m.group(1), [])
                    continue
                if cur is not None and code:
                    cur.append(code)
        self.evos = {}    # species -> [(method, param, target)]
        self.levelup = {} # species -> [(level, move)]
        for s, lab in zip(self.species, labels):
            ev, lu, phase = [], [], 0
            for c in bodies[lab]:
                kw, _, a = c.partition(' ')
                a = args_of(a)
                if kw == 'db' and a == ['0']:
                    phase += 1
                    if phase == 2:
                        break
                    continue
                if phase == 0:
                    ev.append((a[0], a[1], a[-1]))
                elif kw == 'dbw':
                    lu.append((int(a[0]), a[1]))
            self.evos[s] = ev
            self.levelup[s] = lu
        self.pre = {}  # species -> (pre-evolution, method, param)
        for s, ev in self.evos.items():
            for method, param, tgt in ev:
                self.pre.setdefault(tgt, (s, method, param))

    def _eggs(self):
        labels = []
        for part in ('kanto', 'johto'):
            t = rd(self.p(f'data/pokemon/egg_moves_{part}.asm'))
            labels += re.findall(r'^\s*dw (\w+)\s*$', t[:t.index('\n\n', t.index('EggMovePointers'))], re.M)
        bodies = {}
        for part in ('kanto', 'johto'):
            cur = None
            for n, code, _ in code_lines(self.p(f'data/pokemon/egg_moves_{part}.asm')):
                m = re.match(r'(\w+):', code)
                if m and not code.startswith('EggMovePointers'):
                    cur = bodies.setdefault(m.group(1), [])
                    continue
                if cur is not None and code.startswith('dw '):
                    v = code[3:].strip()
                    if v == '-1':
                        cur = None
                    else:
                        cur.append(v)
        self.egg = {}
        for s, lab in zip(self.species, labels):
            self.egg[s] = set(bodies.get(lab, []))

    # ------------------------------------------------------------ trainers
    def _classes(self):
        src = rd(self.p('constants/trainer_constants.asm'))
        head = src.split('DEF NUM_TRAINER_CLASSES')[0]
        self.classes = []      # index -> (class, [ids])
        self.id_class = {}
        for line in head.splitlines():
            code = line.split(';')[0].strip()
            m = re.match(r'trainerclass\s+(\w+)', code)
            if m:
                self.classes.append((m.group(1), []))
                continue
            m = re.match(r'const\s+(\w+)', code)
            if m and self.classes:
                self.classes[-1][1].append(m.group(1))
                self.id_class[m.group(1)] = self.classes[-1][0]
        ptr = rd(self.p('data/trainers/party_pointers.asm'))
        self.groups = re.findall(r'dba (\w+)', ptr)
        self.group_class = {g: self.classes[i + 1][0] for i, g in enumerate(self.groups)}
        self.class_names = {}
        names = re.findall(r'li "([^"]*)"', rd(self.p('data/trainers/class_names.asm')))
        for i, (c, _) in enumerate(self.classes[1:]):
            if i < len(names):
                self.class_names[c] = names[i]

    def _parse_team_lines(self, lines, where):
        team = {'mons': [], 'random': None}
        for n, code in lines:
            kw, _, a = code.partition(' ')
            a = args_of(a)
            if kw == 'mon':
                team['mons'].append({'level': int(a[0]), 'species': a[1], 'line': n})
            elif kw == 'random_mons':
                team['random'] = (int(a[0]), a[1])
            elif kw in ('item', 'ability', 'ev_spread', 'nickname'):
                team['mons'][-1][kw] = a[0].strip('"') if kw == 'nickname' else a[0]
            elif kw == 'moves':
                team['mons'][-1]['moves'] = a
            elif kw == 'dvs':
                team['mons'][-1]['dvs'] = ', '.join(a)
            elif kw == 'shiny':
                team['mons'][-1]['shiny'] = True
            else:
                raise ValueError(f'{where}:{n}: {code}')
        return team

    def _parties(self):
        self.parties = collections.OrderedDict()  # ID -> party
        path = 'data/trainers/parties.asm'
        group = None
        cur = None
        for n, code, com in code_lines(self.p(path)):
            m = re.match(r'(\w+Group):', code)
            if m:
                group = m.group(1)
                continue
            m = re.match(r'party (\w+), "([^"]*)"(.*)', code)
            if m:
                cur = {'id': m.group(1), 'name': m.group(2), 'doubles': 'DOUBLES' in m.group(3),
                       'class': self.group_class[group], 'line': n, 'comment': com,
                       'normal': [], 'hard': None}
                body = cur['normal']
                continue
            if cur is None:
                continue
            if code == 'hard':
                cur['hard'] = body = []
            elif code == 'end_party':
                cur['normal'] = self._parse_team_lines(cur['normal'], path)
                if cur['hard'] is not None:
                    cur['hard'] = self._parse_team_lines(cur['hard'], path)
                self.parties[cur['id']] = cur
                cur = None
            elif code:
                body.append((n, code))

    def _random_lists(self):
        self.rlists = {}
        cur = None
        lines = []
        for n, code, _ in code_lines(self.p('data/trainers/random_parties.asm')):
            m = re.match(r'random_list (\w+)', code)
            if m:
                cur, lines = m.group(1), []
            elif code == 'end_random_list':
                self.rlists[cur] = self._parse_team_lines(lines, 'random_parties.asm')['mons']
                cur = None
            elif cur and code:
                lines.append((n, code))

    def _uses(self):
        """party ID -> [(map file, line)] from `trainer`/`loadtrainer` in maps and engine"""
        self.uses = collections.defaultdict(list)
        files = glob.glob(self.p('maps', '**', '*.asm'), recursive=True)
        files += glob.glob(self.p('engine', '**', '*.asm'), recursive=True)
        for f in files:
            rel = os.path.relpath(f, self.repo)
            for n, code, _ in code_lines(f):
                m = re.match(r'(trainer|loadtrainer)\s+(\w+),\s*(\w+)', code)
                if m and m.group(3) in self.parties:
                    self.uses[m.group(3)].append((rel, n))
        # Bug-Catching Contest winners: names only (no battle); not counted as a map's trainer
        self.name_uses = set()
        for n, code, _ in code_lines(self.p('data/events/bug_contest_winners.asm')):
            m = re.match(r'db (\w+), (\w+)$', code)
            if m and m.group(2) in self.parties:
                self.name_uses.add(m.group(2))

    def _bands(self):
        """tools/trainer_bands.txt: lines 'maps/REGION/AREA[/MAP.asm]  BAND'; the longest
        matching prefix wins."""
        self.band_rules = []
        path = self.p('tools/trainer_bands.txt')
        if os.path.exists(path):
            for line in rd(path).splitlines():
                line = line.split('#')[0].strip()
                if line:
                    k, v = line.split()
                    self.band_rules.append((k, int(v)))
        self.band_rules.sort(key=lambda kv: -len(kv[0]))

    def _abilities(self):
        self.abilities = {}
        for n, code, _ in code_lines(self.p('data/abilities/species_abilities.asm')):
            m = re.match(r'abilities (\w+),\s*(\w+),\s*(\w+),\s*(\w+)', code)
            if m:
                self.abilities[m.group(1)] = [a.replace('ABILITY_', '') for a in m.group(2, 3, 4)]

    def _items(self):
        self.placeholder_items = set()
        for n, code, com in code_lines(self.p('constants/item_constants.asm')):
            m = re.match(r'const (ITEM_\w+)$', code)
            if m:
                self.placeholder_items.add(m.group(1))

    # ------------------------------------------------------------ helpers
    def band_of(self, path):
        for k, v in self.band_rules:
            if path.startswith(k):
                return v
        return None

    def family(self, s):
        """s and its pre-evolutions, nearest first"""
        out = [s]
        while out[-1] in self.pre and self.pre[out[-1]][0] not in out:  # some forms evolve both ways
            out.append(self.pre[out[-1]][0])
        return out


# badge count -> wLevelMod (engine/events/std_scripts.asm, .CalculateLevels)
LEVEL_MOD = [0, 5, 10, 15, 20, 25, 30, 35, 40, 42, 44, 46, 48, 50, 52, 54, 56,
             57, 58, 59, 60, 61, 62, 63, 64]

def base_level(badges):
    return 5 + LEVEL_MOD[min(badges, 24)]


# ---------------------------------------------------------------- tiers
BOSS_NAMES = {'Leader', 'Elite', 'Champion'}
BOSS_CLASSES = {'RIVAL1', 'RIVAL2', 'WALLY', 'GREEN', 'RED', 'EXECUTIVEM', 'EXECUTIVEF',
                'GIOVANNI', 'AGATHA'}
ONE_OFF = {'OAK', 'ELM', 'BIRCH', 'NURSE', 'OFFICER', 'CAL', 'MYSTICALMAN', 'LINK_KRIS'}
ELITE_CLASSES = {'COOLTRAINERM', 'COOLTRAINERF', 'RANGERM', 'RANGERF', 'KIMONO_GIRL', 'ACE_DUO', 'RANGERS'}
# duo classes (Nov 2): one party for two NPCs, always DOUBLES
DUO_CLASSES = {'TWINS', 'TATELIZA', 'COUPLE', 'SWIMMERS', 'ACE_DUO', 'RANGERS', 'FIGHTERS',
               'BIRDERS', 'HIKERS', 'POKEFANS', 'PUPILS'}
# not held to the elite/double rule (user, Nov 2): Gyms, Sprout Tower (an easy intro Gym), the Wise
# Trio (a boss), the Dance Theater (all elites); Rocket hideouts and Radio Tower get their own pass
COVERAGE_SKIP = ('Gym', 'SproutTower', 'WiseTriosRoom', 'DanceTheater', 'TeamRocketBase', 'RadioTower',
                 'GoldenrodUndergroundSwitchRoom', '/safari/', 'NewMauville')  # Rocket areas (user, Nov 2): the Safari Zone; New Mauville (its scientists are Rocket-affiliated)
GRUNT_CLASSES = {'GRUNTM', 'GRUNTF', 'EXECUTIVEM', 'EXECUTIVEF'}
# parties based on playtesters' teams (user, Nov 2): species and party size stay; moves may change
PLAYTESTER_PARTIES = {'RONALD1', 'RONALD2', 'RONALD3', 'MARINA1', 'MARINA2', 'MARINA3',
                      'DALORIC2', 'CONTEST_CRYSTAL2', 'KLUTCH3', 'AMAYA3', 'AARON3',  # + Johto Games (later)
                      'JESS1', 'JESS2'}

# joke Fishers (user, Nov 2): Magikarp stay Magikarp, with one Gyarados ace
EVOLUTION_EXEMPT = {'RAYMOND', 'MARVIN', 'JOSHUA'}  # + Joshua's Pikachu

# single parties treated as bosses (user, Nov 2): the Karate King
BOSS_PARTIES = {'KIYO', 'GAKU', 'MASA', 'KOJI'}  # Kiyo; the Wise Trio (one boss fight in three stages, user Nov 2)
# single parties treated as elite trainers (user, Nov 2)
ELITE_PARTIES = {'ROUTE105_JOSUE', 'RONALD3', 'JESS2'}  # + World Cup qualifiers (tournament)

def tier(d, p):
    c = p['class']
    if p['id'] in BOSS_PARTIES:
        return 'boss'
    if p['id'] in ELITE_PARTIES or '(elite)' in p['comment']:  # promoted in place (Nov 2)
        return 'elite'
    if c in BOSS_CLASSES or d.class_names.get(c) in BOSS_NAMES:
        return 'boss'
    if c in ONE_OFF:
        return 'one-off'
    if c in ELITE_CLASSES:
        return 'elite'
    return 'route'


# ---------------------------------------------------------------- checks
def move_status(d, s, lvl, move):
    """'' if legal, else a short reason"""
    fam = d.family(s)
    for f in fam:
        if any(m == move and l <= lvl for l, m in d.levelup[f]):
            return ''
    if move in d.tm_moves:
        if move in d.tmhm[s] or any(move in d.tmhm[f] for f in fam):
            return ''
        if move in d.universal and s not in d.no_tm:
            return ''
        if any(m == move for _, m in d.levelup[s]):
            return ''  # level-up fallback (any level)
    if any(move in d.egg.get(f, ()) for f in fam):
        return ''
    later = [l for f in fam for l, m in d.levelup[f] if m == move]
    if later:
        return f'early (L{min(later)})'
    return 'illegal'

def evo_status(d, s, lvl):
    out = []
    if s in d.pre:
        p, method, param = d.pre[s]
        if method == 'EVOLVE_LEVEL' and lvl < int(param):
            out.append(f'over-evolved ({p} evolves at {param})')
    for method, param, tgt in d.evos[s]:
        if method == 'EVOLVE_LEVEL' and lvl >= int(param) + 5:
            out.append(f'could be {tgt} (L{param})')
    return out

# Gym Leader versions are picked by total badges: version 1 at 0-3, 2 at 4-13, 3 at 14+
# (e.g. maps/johto/violet/VioletGym.asm); version 1 counts at its Gym's band.
LEADER_VERSION_BADGES = {2: 4, 3: 14}
# parties fought right after another version (same badges as the map's band)
FOLLOW_UP_PARTIES = {'CLAIR3',  # BlackthornGym1F: a solo Mega after Clair 1 or 2
                     'BLUE1',  # ViridianGym: Blue's only version, at any badge count
                     'WALLACE1'}  # SootopolisGym: 0-13 badges (his Gym is late)
# World Cup bracket (maps/hoenn/battle/WCRound*.asm, WCFinals.asm)
WORLD_CUP_PARTIES = {'LORELEI1', 'WCFALKNER', 'RIVAL2_WC', 'WC_WALLY', 'WC_GREEN', 'WC_GIOVANNI', 'WC_OAK',
                     # qualifiers (WCQualifier1-3.asm)
                     'WEEKDAY_WESLEY', 'WEEKDAY_ARTHUR', 'WEEKDAY_SANTOS', 'WEEKDAY_MONICA',
                     'WEEKDAY_TUSCANY', 'WEEKDAY_FRIEDA', 'RONALD3', 'MARINA3', 'JESS2'}
# leaders with their own version thresholds
PARTY_BADGES = {'WALLACE2': 14}  # SootopolisGym: 14+ badges
# League rooms: version 1 below 16 badges (shown at the band), version 2 at 16+;
# LANCE3 / STEVEN3 follow either version (shown at the band)
PARTY_BADGES.update({p: 16 for p in ('WILL2', 'KOGA2', 'BRUNO2', 'KAREN2', 'LANCE2',
                                     'SIDNEY2', 'PHOEBE2', 'GLACIA2', 'DRAKE2', 'STEVEN2')})

def party_band(d, p):
    """badge count the party's levels are shown for"""
    if p['id'] in WORLD_CUP_PARTIES or p['id'].startswith('WC'):
        return 8  # World Cup: open after the Indigo League, so 8+ badges (normal world levels)
    bands = [d.band_of(f) for f, _ in d.uses.get(p['id'], [])]
    bands = [b for b in bands if b is not None]
    band = min(bands) if bands else None
    if p['id'] in PARTY_BADGES:
        return max(band or 0, PARTY_BADGES[p['id']])
    if d.class_names.get(p['class']) == 'Leader' and p['id'] not in FOLLOW_UP_PARTIES:
        ids = [i for i in dict(d.classes)[p['class']] if not i.startswith('WC')]
        if p['id'] in ids:
            v = ids.index(p['id']) + 1
            if v in LEADER_VERSION_BADGES:
                return max(band or 0, LEADER_VERSION_BADGES[v])
            if v == 1 and band is not None and band > 3:
                return 3  # version 1 is used at 0-3 badges (reachable out of order)
    return band

def team_findings(d, p, team, mode, band):
    """list of (mon index or None, finding)"""
    out = []
    t = tier(d, p)
    if team['random']:
        n, lst = team['random']
        size = n
        mons = []
    else:
        mons = team['mons']
        size = len(mons)
    playtester = p['id'] in PLAYTESTER_PARTIES or p['id'] in WORLD_CUP_PARTIES  # World Cup: 6 allowed
    if t == 'route' and size == 1 and not playtester:
        out.append((None, f'{mode}: 1 Pokemon (route trainers have 2-3)'))
    if t == 'route' and size > (4 if p['doubles'] else 3) and not playtester:
        out.append((None, f'{mode}: {size} Pokemon (route trainers have 2-3, doubles up to 4)'))
    if t == 'elite' and size > (6 if p['doubles'] else 4) and not playtester:
        out.append((None, f'{mode}: {size} Pokemon (elite: up to 4, doubles 4-6)'))
    if t == 'elite' and p['doubles'] and size < 4 and not playtester:
        out.append((None, f'{mode}: {size} Pokemon (elite doubles have 4-6)'))
    base = base_level(band) if band is not None else None
    for i, m in enumerate(mons):
        lvl = (base + m['level']) if base is not None else None
        s = m['species']
        # policies (user, Nov 1): route trainers strict (moves and evolution); elites may have
        # moves early; bosses may also break a rule occasionally (shown as "rule break");
        # bosses and elites may evolve early freely
        if lvl is not None and not playtester and p['id'] not in EVOLUTION_EXEMPT:
            for e in evo_status(d, s, lvl):
                if e.startswith('over-evolved') and t in ('boss', 'elite'):
                    continue
                out.append((i, f'{mode}: {s} L{lvl}: {e}'))
        for mv in m.get('moves', []):
            st = move_status(d, s, lvl if lvl is not None else 100, mv)
            if st.startswith('early') and t in ('boss', 'elite'):
                continue
            if st == 'illegal' and t == 'boss':
                st = 'rule break (illegal)'
            if st:
                out.append((i, f'{mode}: {s}: {mv} {st}'))
        if m.get('item') in d.placeholder_items:
            out.append((i, f'{mode}: {s}: placeholder item {m["item"]}'))
    # one of each held item per team (user, Nov 2): a second healer is Black Sludge, Shell Bell or a Berry
    seen = {}
    for i, m in enumerate(team['mons']):
        it = m.get('item')
        if it and it != 'NO_ITEM':
            if it in seen:
                out.append((i, f'{mode}: {m["species"]}: repeated item {it} (also on #{seen[it] + 1})'))
            else:
                seen[it] = i
    return out

def party_findings(d, p):
    band = party_band(d, p)
    out = team_findings(d, p, p['normal'], 'N', band)
    if p['hard'] is not None:
        out += team_findings(d, p, p['hard'], 'H', band)
        n, h = p['normal'], p['hard']
        if not n['random'] and not h['random']:
            if len(h['mons']) < len(n['mons']):
                out.append((None, f'hard has fewer Pokemon ({len(h["mons"])} < {len(n["mons"])})'))
            if max(m['level'] for m in h['mons']) < max(m['level'] for m in n['mons']):
                out.append((None, 'hard top level below normal'))
    if p['id'] not in d.uses and p['id'] not in d.name_uses:
        out.append((None, 'unused (no map or script)'))
    if p['class'] in DUO_CLASSES and not p['doubles']:
        out.append((None, 'duo class without DOUBLES'))
    # "<ENEMY>" = class, space, name, at the start of an 18-tile text line (Nov 2)
    tiles = lambda t: len(t.replace('#', 'POKe').replace('<PKMN>', 'PK'))
    if p['class'] not in ('RIVAL1', 'RIVAL2'):
        n = tiles(d.class_names.get(p['class'], '')) + 1 + tiles(p['name'])
        if n > 18:
            out.append((None, f'class + name is {n} characters (the text line has 18)'))
    return out


def coverage(d, show_all=False):
    """elites and doubles pass (Nov 2): every banded map with route/elite trainers needs at least
    one elite and one double battle; Gyms and maps with only Rocket/Aqua/Magma classes are skipped.
    A building's floors (same name without the 1F/B2F suffix, same band) count as one area."""
    maps = collections.defaultdict(list)
    for pid, uses in d.uses.items():
        for f, _ in uses:
            if pid not in maps[f]:
                maps[f].append(pid)
    areas = collections.OrderedDict()
    key = lambda f: (f.split('/')[1], d.band_of(f) if d.band_of(f) is not None else 99, f)
    for f in sorted(maps, key=key):
        b = d.band_of(f)
        if b is None or any(k in f for k in COVERAGE_SKIP):
            continue
        ps = [d.parties[i] for i in maps[f]]
        ps = [p for p in ps if tier(d, p) in ('route', 'elite')]
        if not ps or all(p['class'] in GRUNT_CLASSES for p in ps):
            continue
        a = (re.sub(r'(B?\d+F)?(Inside|Outside)?\.asm$', '', f), b)
        if 'FastShip' in f:  # the ship's deck and cabins are one area
            a = ('maps/FastShip', b)
        areas.setdefault(a, []).extend(p for p in ps if p not in areas.get(a, []))
    tot = collections.Counter()
    for (f, b), ps in areas.items():
        n_el = sum(tier(d, p) == 'elite' for p in ps)
        n_db = sum(p['doubles'] for p in ps)
        flag = ('' if n_el else ' NO-ELITE') + ('' if n_db else ' NO-DOUBLE')
        tot['areas'] += 1; tot['no elite'] += not n_el; tot['no double'] += not n_db
        if flag or show_all:
            names = ', '.join(p['id'] + ('*' if tier(d, p) == 'elite' else '') + ('+' if p['doubles'] else '')
                              for p in ps)
            print(f'{f[5:]:45} band {b}  {len(ps):2} trainers  elite {n_el}  double {n_db}{flag}')
            print(f'      {names}')
    print(dict(tot), '(* elite, + double)')


# ---------------------------------------------------------------- output
def fmt_team(d, team, base):
    if team['random']:
        n, lst = team['random']
        return [f'    random {n} of {lst}']
    out = []
    for m in team['mons']:
        lv = f'L{base + m["level"]}' if base is not None else f'+{m["level"]}'
        bits = [f'{m["species"]} {lv} (+{m["level"]})']
        for k in ('item', 'ability', 'ev_spread', 'nickname'):
            if k in m:
                bits.append(f'{k} {m[k]}')
        if 'dvs' in m:
            bits.append(f'dvs {m["dvs"]}')
        if m.get('shiny'):
            bits.append('shiny')
        if 'moves' in m:
            bits.append('/'.join(m['moves']))
        out.append('    ' + ' | '.join(bits))
    return out

def show_party(d, p, findings=True):
    band = party_band(d, p)
    base = base_level(band) if band is not None else None
    where = sorted({f.replace('maps/', '').replace('.asm', '') for f, _ in d.uses.get(p['id'], [])})
    head = (f'{p["id"]} "{p["name"]}" [{tier(d, p)}{", doubles" if p["doubles"] else ""}]'
            f' band {band if band is not None else "?"}'
            + (f' (base L{base})' if base is not None else '')
            + f' - {", ".join(where) or "unused"}')
    lines = [head, '  Normal:'] + fmt_team(d, p['normal'], base)
    if p['hard'] is not None:
        lines += ['  Hard:'] + fmt_team(d, p['hard'], base)
    else:
        lines.append('  Hard: same team')
    if findings:
        for _, f in party_findings(d, p):
            lines.append(f'  ! {f}')
    return '\n'.join(lines)

def summary(d):
    kinds = collections.Counter()
    by_tier = collections.Counter()
    for p in d.parties.values():
        by_tier[tier(d, p)] += 1
        for _, f in party_findings(d, p):
            k = re.sub(r'^[NH]: ', '', f)
            k = re.sub(r'^\S+ L\d+: ', '', k)
            k = re.sub(r'^\S+: \S+ ', 'move ', k)
            k = re.sub(r'\(.*?\)', '', k).strip()
            k = re.sub(r'^could be \S+', 'could be evolved', k)
            k = re.sub(r'^\S+: placeholder item.*', 'placeholder item', k)
            kinds[k] += 1
    print('parties by tier:', dict(by_tier))
    print('no band (map not in tools/trainer_bands.txt):',
          sum(1 for p in d.parties.values() if p['id'] in d.uses and party_band(d, p) is None))
    for k, v in kinds.most_common():
        print(f'{v:5}  {k}')

def area(d, prefix):
    for p in d.parties.values():
        if any(f.startswith('maps/' + prefix) for f, _ in d.uses.get(p['id'], [])):
            print(show_party(d, p)); print()

def bands(d):
    maps = collections.defaultdict(set)
    for pid, uses in d.uses.items():
        for f, _ in uses:
            maps[f].add(pid)
    for f in sorted(maps):
        b = d.band_of(f)
        print(f'{f:60} {b if b is not None else "?":>2}  {len(maps[f])} parties')

def learn(d, s, lvl):
    fam = d.family(s)
    print(f'{s} {"/".join(d.types[s])}  abilities {" / ".join(d.abilities.get(s, []))}'
          + (f'  family {" < ".join(fam)}' if len(fam) > 1 else ''))
    for method, param, tgt in d.evos[s]:
        print(f'  evolves: {tgt} ({method.replace("EVOLVE_", "").lower()} {param})')
    lu = sorted({(l, m) for f in fam for l, m in d.levelup[f]})
    seen = set(); now, later = [], []
    for l, m in lu:
        if m in seen:
            continue
        seen.add(m)
        (now if l <= lvl else later).append(f'{m}{l}')
    print('  level-up:', ' '.join(now))
    print('  later   :', ' '.join(later))
    tm = sorted(m for m in d.tm_moves if m not in seen and move_status(d, s, lvl, m) == '')
    print('  TM/tutor:', ' '.join(tm))
    eg = sorted({m for f in fam for m in d.egg.get(f, ())} - seen)
    print('  egg     :', ' '.join(eg))

def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('cmd', choices=['summary', 'area', 'class', 'party', 'unused', 'bands', 'learn', 'coverage'])
    ap.add_argument('arg', nargs='?')
    ap.add_argument('level', nargs='?', type=int, default=100)
    ap.add_argument('--repo', default='.')
    a = ap.parse_args()
    d = Data(a.repo)
    if a.cmd == 'summary':
        summary(d)
    elif a.cmd == 'area':
        area(d, a.arg)
    elif a.cmd == 'class':
        for p in d.parties.values():
            if p['class'] == a.arg:
                print(show_party(d, p)); print()
    elif a.cmd == 'party':
        print(show_party(d, d.parties[a.arg]))
    elif a.cmd == 'unused':
        for p in d.parties.values():
            if p['id'] not in d.uses:
                print(p['id'], f'"{p["name"]}"', p['comment'])
    elif a.cmd == 'bands':
        bands(d)
    elif a.cmd == 'coverage':
        coverage(d, a.arg == 'all')
    elif a.cmd == 'learn':
        learn(d, a.arg, a.level)

if __name__ == '__main__':
    import signal
    signal.signal(signal.SIGPIPE, signal.SIG_DFL)
    main()
