#!/usr/bin/env python3
"""Static progression checker.

Reads the map, tileset and script sources (no build needed) and works out, for
each start region, what the player can reach: maps (tile by tile, with ledges,
water, Cut trees, rocks, boulders, standing NPCs and coord events), items,
event and engine flags, badges and map scenes. Every script reached is run with
its branches; a flag that can be set counts as possibly set from then on (and
possibly clear), so the check finds what can never happen, not the exact order.
Travel between regions is left out: each start is checked on its own.

The report lists, per start: the order badges and key items open, which badges
each badge needs (--order), maps not reached, and items/flags that never happen
on a reached map, each with the reason (a condition never met, a hidden NPC, a
field ability the start never gets, a standing NPC in the way, another region).

Usage: python3 tools/progression_check.py [REPO] [--start johto|kanto|hoenn]
       [--out REPORT.md] [--json OUT.json] [--order] [--why FACT ...]
  --why EVENT_X / ENGINE_X / ITEM / MAP:NAME  prints how a fact is first reached
"""

import os
import re
import sys
import json
from collections import defaultdict, deque

# ---------------------------------------------------------------------------
# Source reading
# ---------------------------------------------------------------------------

def read_text(path):
    with open(path, 'rb') as f:
        data = f.read()
    try:
        return data.decode('utf-8')
    except UnicodeDecodeError:
        return data.decode('latin-1')


def strip_comment(line):
    out = []
    in_str = False
    for ch in line:
        if ch == '"':
            in_str = not in_str
        elif ch == ';' and not in_str:
            break
        out.append(ch)
    return ''.join(out).rstrip()


def logical_lines(path):
    """Lines of an asm file without comments, with debug-only blocks removed."""
    lines = []
    stack = []  # one entry per open `if`: True if that branch is debug-only
    for raw in read_text(path).splitlines():
        line = strip_comment(raw)
        s = line.strip()
        low = s.lower()
        if low.startswith('if ') or low.startswith('if('):
            stack.append('debug' if '_debug' in low and '!' not in low else 'other')
            lines.append('')
            continue
        if low == 'else' and stack:
            if stack[-1] == 'debug':
                stack[-1] = 'debug_else'
            lines.append('')
            continue
        if low == 'endc' and stack:
            stack.pop()
            lines.append('')
            continue
        if 'debug' in stack:
            lines.append('')
            continue
        lines.append(line)
    return lines


def split_args(s):
    """Split macro arguments on commas outside parentheses and strings."""
    args, depth, cur, in_str = [], 0, [], False
    for ch in s:
        if ch == '"':
            in_str = not in_str
        if not in_str:
            if ch == '(':
                depth += 1
            elif ch == ')':
                depth -= 1
            elif ch == ',' and depth == 0:
                args.append(''.join(cur).strip())
                cur = []
                continue
        cur.append(ch)
    if cur or args:
        args.append(''.join(cur).strip())
    return args


def parse_num(s, consts=None):
    s = s.strip()
    if consts is not None and s in consts:
        return consts[s]
    if s.startswith('$'):
        return int(s[1:], 16)
    if s.startswith('%'):
        return int(s[1:], 2)
    try:
        return int(s, 10)
    except ValueError:
        if consts is not None:
            try:
                expr = re.sub(r'\$([0-9a-fA-F]+)', r'0x\1', s)
                expr = re.sub(r'[A-Za-z_][A-Za-z0-9_]*',
                              lambda m: str(consts.get(m.group(0), 'X')), expr)
                if 'X' in expr:
                    return None
                return int(eval(expr, {}, {}))
            except Exception:
                return None
        return None


def const_list(path, prefix=None):
    """Values of `const NAME` lines (const_def N [, step]) in a constants file."""
    vals = {}
    value, step = 0, 1
    for line in logical_lines(path):
        s = line.strip()
        m = re.match(r'const_def\s*(.*)$', s)
        if m:
            a = split_args(m.group(1)) if m.group(1) else []
            value = parse_num(a[0]) if a else 0
            step = parse_num(a[1]) if len(a) > 1 else 1
            continue
        m = re.match(r'const\s+(\w+)', s)
        if m:
            if prefix is None or m.group(1).startswith(prefix):
                vals[m.group(1)] = value
            value += step
            continue
        m = re.match(r'const_skip(?:\s+(\S+))?', s)
        if m:
            value += step * (parse_num(m.group(1)) if m.group(1) else 1)
            continue
        m = re.match(r'DEF\s+(\w+)\s+EQU\s+const_value\b', s)
        if m and (prefix is None or m.group(1).startswith(prefix)):
            vals[m.group(1)] = value
            continue
        m = re.match(r'const_next\s+(\S+)', s)
        if m:
            value = parse_num(m.group(1), vals)
    return vals


# ---------------------------------------------------------------------------
# World data
# ---------------------------------------------------------------------------

# Collision permission classes
LAND, WATER, WALL = 0, 1, 15

DIRS = {'down': (0, 1), 'up': (0, -1), 'left': (-1, 0), 'right': (1, 0)}
OPP = {'down': 'up', 'up': 'down', 'left': 'right', 'right': 'left'}


class World:
    def __init__(self, repo):
        self.repo = repo
        self.p = lambda *a: os.path.join(repo, *a)
        self.load_constants()
        self.load_collision_constants()
        self.load_tilesets()
        self.load_map_headers()
        self.load_map_sizes()
        self.load_attributes()
        self.load_blocks()
        self.load_cond_warps()
        self.load_map_files()
        self.load_spawns()

    # -- constants ---------------------------------------------------------
    def load_constants(self):
        self.landmarks = const_list(self.p('constants/landmark_constants.asm'))
        self.tileset_ids = const_list(self.p('constants/tileset_constants.asm'), 'TILESET_')
        self.engine_flags = const_list(self.p('constants/engine_flags.asm'), 'ENGINE_')
        self.events = const_list(self.p('constants/event_flags.asm'), 'EVENT_')

    def landmark_region(self, lm):
        v = self.landmarks.get(lm)
        if v is None:
            return None
        k = self.landmarks['KANTO_LANDMARK']
        h = self.landmarks['HOENN_LANDMARK']
        n = self.landmarks['NUM_LANDMARKS']
        if v == 0 or v >= n:
            return None
        if lm == 'LANDMARK_FAST_SHIP':
            return 'travel'  # the voyage between regions
        if v < k:
            return 'johto'
        if v < h:
            return 'kanto'
        return 'hoenn'

    def load_collision_constants(self):
        coll = {}
        for line in logical_lines(self.p('constants/collision_constants.asm')):
            m = re.match(r'\s*DEF\s+(COLL_\w+)\s+EQU\s+(\$[0-9a-fA-F]+|\d+)', line)
            if m:
                coll[m.group(1)] = parse_num(m.group(2))
        self.coll = coll
        # permission table, one entry per collision value
        perm = []
        consts = {'LAND_TILE': LAND, 'WATER_TILE': WATER, 'WALL_TILE': WALL, 'TALK': 0x10}
        for line in logical_lines(self.p('data/collision/collision_permissions.asm')):
            m = re.match(r'\s*db\s+(.+)$', line)
            if m:
                expr = m.group(1).replace('|', ' | ')
                v = 0
                for part in expr.split('|'):
                    v |= consts[part.strip()]
                perm.append(v)
        self.perm = perm

    def permission(self, c):
        if c >= 0xd0 and c <= 0xd2:  # bridges: walkable on the deck
            return LAND
        if c < len(self.perm):
            return self.perm[c] & 0x0f
        return WALL

    def is_talk(self, c):
        return c < len(self.perm) and bool(self.perm[c] & 0x10)

    # -- tilesets ----------------------------------------------------------
    def load_tilesets(self):
        # TILESET_* id -> Tileset label (data/tilesets.asm order, from 0)
        labels = []
        for line in logical_lines(self.p('data/tilesets.asm')):
            m = re.match(r'\s*tileset\s+(\w+)', line)
            if m:
                labels.append(m.group(1))
        # label -> collision file
        coll_file = {}
        pending = []
        for line in logical_lines(self.p('gfx/tilesets.asm')):
            m = re.match(r'(\w+)Coll::', line.strip())
            if m:
                pending.append(m.group(1))
                continue
            m = re.match(r'\s*INCLUDE\s+"(data/tilesets/\w+_collision\.asm)"', line)
            if m and pending:
                for lab in pending:
                    coll_file[lab] = m.group(1)
                pending = []
            elif line.strip() and not line.strip().endswith('::'):
                pending = []
        self.tileset_coll = {}
        cache = {}
        for name, idx in self.tileset_ids.items():
            if idx >= len(labels):
                continue
            lab = labels[idx]
            f = coll_file.get(lab)
            if f is None:
                continue
            if f not in cache:
                blocks = []
                for line in logical_lines(self.p(f)):
                    m = re.match(r'\s*tilecoll\s+(.+)$', line)
                    if m:
                        vals = []
                        for a in split_args(m.group(1)):
                            key = 'COLL_' + a
                            if key in self.coll:
                                vals.append(self.coll[key])
                            else:
                                vals.append(parse_num(a) if parse_num(a) is not None else int(a, 16))
                        blocks.append(vals)
                cache[f] = blocks
            self.tileset_coll[name] = cache[f]

    # -- maps --------------------------------------------------------------
    def load_map_headers(self):
        self.maps = {}  # MAP_CONST -> dict
        self.name_to_const = {}
        # map constants in group order to pair with maps.asm entries
        order = []
        for line in logical_lines(self.p('constants/map_constants.asm')):
            m = re.match(r'\s*map_const\s+(\w+)\s*,\s*(\d+)\s*,\s*(\d+)', line)
            if m:
                order.append((m.group(1), int(m.group(2)), int(m.group(3))))
        entries = []
        for line in logical_lines(self.p('data/maps/maps.asm')):
            m = re.match(r'\s*map\s+(\w+)\s*,\s*(.+)$', line)
            if m:
                a = split_args(m.group(2))
                entries.append((m.group(1), a[0], a[1], a[2]))
        if len(order) != len(entries):
            print('warning: %d map constants vs %d map headers' % (len(order), len(entries)), file=sys.stderr)
        for (const, w, h), (name, tileset, env, lm) in zip(order, entries):
            self.maps[const] = dict(const=const, name=name, w=w, h=h, tileset=tileset,
                                    env=env, landmark=lm, region=self.landmark_region(lm))
            self.name_to_const[name] = const

    def load_map_sizes(self):
        pass

    def load_attributes(self):
        cur = None
        for line in logical_lines(self.p('data/maps/attributes.asm')):
            s = line.strip()
            m = re.match(r'map_attributes\s+(.+)$', s)
            if m:
                a = split_args(m.group(1))
                cur = a[1]
                if cur in self.maps:
                    self.maps[cur]['attr_name'] = a[0]
                    self.maps[cur]['conns'] = []
                else:
                    cur = None
                continue
            m = re.match(r'connection\s+(.+)$', s)
            if m and cur:
                a = split_args(m.group(1))
                if len(a) == 6:
                    off = parse_num(a[3]) - parse_num(a[4])
                else:
                    off = parse_num(a[3])
                self.maps[cur]['conns'].append((a[0], a[2], off))

    def load_blocks(self):
        label_file = {}
        pending = []
        for line in logical_lines(self.p('data/maps/blocks.asm')):
            s = line.strip()
            m = re.match(r'(\w+)_Blocks::?$', s)
            if m:
                pending.append(m.group(1))
                continue
            m = re.match(r'INCBIN\s+"([^"]+)"', s)
            if m:
                for lab in pending:
                    label_file[lab] = m.group(1)
                pending = []
        for const, mp in self.maps.items():
            name = mp.get('attr_name', mp['name'])
            f = label_file.get(name)
            mp['blocks'] = None
            if f and os.path.exists(self.p(f)):
                with open(self.p(f), 'rb') as fh:
                    mp['blocks'] = bytearray(fh.read())

    def load_map_files(self):
        """Find each map's script/event file and parse its events."""
        files = {}
        for root, _, names in os.walk(self.p('maps')):
            for n in names:
                if n.endswith('.asm'):
                    files.setdefault(n[:-4], os.path.join(root, n))
        self.map_files = files
        for const, mp in self.maps.items():
            f = files.get(mp['name'])
            mp['file'] = f
            mp['warps'] = []
            mp['coords'] = []
            mp['bgs'] = []
            mp['objects'] = []
            mp['scene_scripts'] = []
            mp['callbacks'] = []
            mp['obj_consts'] = {}
            if not f:
                continue
            self.parse_map_file(mp, f)

    def load_cond_warps(self):
        """Conditional warp tables (data/maps/conditional_warps.asm): name -> list of
        (flag or None for always, wanted value, map or None for locked, warp)."""
        self.cond_warps = {}
        path = self.p('data/maps/conditional_warps.asm')
        if not os.path.exists(path):
            return
        cur = None
        for line in logical_lines(path):
            s = line.strip()
            m = re.match(r'(\w+)::?$', s)
            if m:
                cur = self.cond_warps.setdefault(m.group(1), [])
                continue
            m = re.match(r'(warp_if_not|warp_if|warp_else|warp_locked)\b\s*(.*)$', s)
            if not m or cur is None:
                continue
            kind, a = m.group(1), split_args(m.group(2)) if m.group(2) else []
            if kind == 'warp_if':
                cur.append((a[0], True, a[1], parse_num(a[2])))
            elif kind == 'warp_if_not':
                cur.append((a[0], False, a[1], parse_num(a[2])))
            elif kind == 'warp_else':
                cur.append((None, None, a[0], parse_num(a[1])))
            else:
                cur.append((None, None, None, None))

    def warp_maps(self, wp):
        """Every map a warp can lead to."""
        if wp.get('cond'):
            return [e[2] for e in self.cond_warps.get(wp['cond'], []) if e[2]]
        return [wp['map']]

    def parse_map_file(self, mp, f):
        obj_index = 1  # object_const_def starts at 2; index 1 = first object
        consts = []
        for line in logical_lines(f):
            s = line.strip()
            m = re.match(r'object_const_def', s)
            if m:
                consts = []
                continue
            m = re.match(r'const\s+(\w+)$', s)
            if m:
                consts.append(m.group(1))
                continue
            m = re.match(r'scene_const\s+(\w+)$', s)
            if m:
                mp['scene_scripts'].append((None, m.group(1)))
                continue
            m = re.match(r'(scene_script|callback|cond_warp_event|warp_event|coord_event|bg_event|object_event)\s+(.+)$', s)
            if not m:
                continue
            kind, a = m.group(1), split_args(m.group(2))
            if kind == 'scene_script':
                mp['scene_scripts'].append((a[0], a[1] if len(a) > 1 else None))
            elif kind == 'callback':
                mp['callbacks'].append((a[0], a[1]))
            elif kind == 'cond_warp_event':
                mp['warps'].append(dict(x=parse_num(a[0]), y=parse_num(a[1]), map=None,
                                        dest=None, cond=a[2]))
            elif kind == 'warp_event':
                mp['warps'].append(dict(x=parse_num(a[0]), y=parse_num(a[1]), map=a[2],
                                        dest=parse_num(a[3])))
            elif kind == 'coord_event':
                mp['coords'].append(dict(x=parse_num(a[0]), y=parse_num(a[1]), scene=a[2],
                                         script=a[3]))
            elif kind == 'bg_event':
                mp['bgs'].append(dict(x=parse_num(a[0]), y=parse_num(a[1]), kind=a[2],
                                      script=a[3]))
            elif kind == 'object_event':
                obj = dict(x=parse_num(a[0]), y=parse_num(a[1]), sprite=a[2], move=a[3],
                           rx=parse_num(a[4]) or 0, ry=parse_num(a[5]) or 0,
                           h1=a[6], h2=a[7], type=a[9], sight=a[10], script=a[11],
                           flag=a[12], index=len(mp['objects']))
                mp['objects'].append(obj)
        for i, c in enumerate(consts):
            mp['obj_consts'][c] = i
        # the scene scripts' index order gives the scene number
        mp['scene_ids'] = {}
        for i, (scr, sc) in enumerate(mp['scene_scripts']):
            if sc:
                mp['scene_ids'][sc] = i

    def load_spawns(self):
        spawn_consts = const_list(self.p('constants/map_data_constants.asm'), 'SPAWN_') \
            if os.path.exists(self.p('constants/map_data_constants.asm')) else {}
        self.spawns = {}
        idx = 0
        for line in logical_lines(self.p('data/maps/spawn_points.asm')):
            m = re.match(r'\s*spawn\s+(\w+)\s*,\s*(\d+)\s*,\s*(\d+)', line)
            if m:
                self.spawns[idx] = (m.group(1), int(m.group(2)), int(m.group(3)))
                idx += 1
        self.spawn_names = {v: k for k, v in spawn_consts.items()}
        self.spawn_by_name = {}
        for i, sp in self.spawns.items():
            n = self.spawn_names.get(i)
            if n:
                self.spawn_by_name[n] = sp

    # -- tiles -------------------------------------------------------------
    def tile_coll(self, mp, x, y, block_override=None):
        """Collision values possible at step tile (x, y)."""
        w, h = mp['w'], mp['h']
        if x < 0 or y < 0 or x >= 2 * w or y >= 2 * h or mp['blocks'] is None:
            return None
        bi = (y // 2) * w + (x // 2)
        coll = self.tileset_coll.get(mp['tileset'])
        if coll is None:
            return None
        q = (y % 2) * 2 + (x % 2)
        blocks = [mp['blocks'][bi]] if bi < len(mp['blocks']) else [0]
        if block_override:
            blocks += block_override.get((x // 2, y // 2), [])
        out = []
        for b in blocks:
            out.append(coll[b][q] if b < len(coll) else self.coll['COLL_WALL'])
        return out


# ---------------------------------------------------------------------------
# Scripts
# ---------------------------------------------------------------------------

# Commands that leave the script variable alone: a check before them still
# decides a branch after them.
KEEP_VAR = {
    'opentext', 'closetext', 'writetext', 'farwritetext', 'waitbutton', 'promptbutton',
    'faceplayer', 'faceobject', 'turnobject', 'applymovement', 'applymovementlasttalked',
    'playsound', 'waitsfx', 'pause', 'playmusic', 'cry', 'showemote', 'pokepic',
    'closepokepic', 'opendialog', 'closedialog', 'setlasttalked', 'musicfadeout',
    'specialsound', 'warpsound', 'wait', 'reanchormap', 'repeattext', 'opentrainerdialog',
    'openpokedialog', 'playmapmusic', 'dontrestartmapmusic', 'encountermusic', 'loademote',
}
TERMINATE = {'end', 'endcallback', 'reloadend', 'return'}
END_ALL = {'endall', 'jumptext', 'jumptextfaceplayer', 'farjumptext', 'stopandsjump',
           'halloffame', 'credits', 'memjump', 'trainerafter', 'pokemart', 'trade', 'battletowertext'}
GOTO = {'sjump', 'farsjump', 'jumpstd'}
CALL = {'scall', 'farscall', 'callstd', 'sdefer'}
BRANCH1 = {'iftrue', 'iffalse'}
BRANCH2 = {'ifequal', 'ifnotequal', 'ifgreater', 'ifless'}

MAX_PATHS = 400
MERGE_AFTER = 3000
MAX_STATES = 3000


class Path:
    __slots__ = ('conds', 'effects', 'kind')

    def __init__(self, conds, effects, kind='emit'):
        self.conds = conds
        self.effects = effects
        self.kind = kind


class Scripts:
    def __init__(self, world):
        self.w = world
        self.files = {}
        self.labels = {}
        self.commands = set()
        self.aliases = {}
        self.load_commands()
        dirs = ['maps', 'engine/events', 'engine/overworld', 'engine/phone', 'data/events',
                'data/phone', 'engine/items', 'engine/pokemon', 'engine/menus']
        for d in dirs:
            for root, _, names in os.walk(world.p(d)):
                for n in sorted(names):
                    if n.endswith('.asm'):
                        self.index(os.path.join(root, n))
        self.cache = {}
        self.find_engine_managed()
        self.unresolved = defaultdict(set)
        self.truncated = set()

    def find_engine_managed(self):
        """Flags named in engine code or data tables outside scripts (the engine
        sets or clears them), plus engine flags no script sets."""
        out = set()
        for d in ('engine', 'home', 'data'):
            for root, _, names in os.walk(self.w.p(d)):
                for n in names:
                    if not n.endswith('.asm'):
                        continue
                    path = os.path.join(root, n)
                    for line in logical_lines(path):
                        m = re.match(r'\s*(?:dw|ld\s+(?:de|hl|bc)\s*,)\s*(EVENT_\w+|ENGINE_\w+)', line)
                        if m:
                            out.add(m.group(1))
        out -= {'EVENT_START_JOHTO', 'EVENT_START_KANTO', 'EVENT_START_HOENN'}
        self.engine_managed = out

    def load_commands(self):
        for f in ('macros/scripts/events.asm', 'macros/scripts/maps.asm'):
            for line in logical_lines(self.w.p(f)):
                m = re.match(r'\s*MACRO\s+(\w+)', line)
                if m:
                    self.commands.add(m.group(1))
        for line in logical_lines(self.w.p('macros/legacy.asm')):
            m = re.match(r'\s*DEF\s+(\w+)\s+EQUS\s+"(\w+)"', line)
            if m:
                self.aliases[m.group(1)] = m.group(2)
                self.commands.add(m.group(1))

    def expand_macros(self, lines):
        """Expand macros defined in the file itself and collect its DEF constants."""
        macros = {}
        out = []
        i = 0
        while i < len(lines):
            st = lines[i].strip()
            m = re.match(r'MACRO\s+(\w+)', st)
            if m:
                body = []
                i += 1
                while i < len(lines) and lines[i].strip() != 'ENDM':
                    body.append(lines[i])
                    i += 1
                macros[m.group(1)] = body
                out.append('')
                i += 1
                continue
            parts = st.split(None, 1)
            if parts and parts[0] in macros:
                args = split_args(parts[1]) if len(parts) > 1 else []
                for bl in macros[parts[0]]:
                    for k, v in enumerate(args, 1):
                        bl = bl.replace('\\%d' % k, v)
                    self.def_line(bl)
                    out.append(bl)
                i += 1
                continue
            self.def_line(lines[i])
            out.append(lines[i])
            i += 1
        return out

    def def_line(self, line):
        m = re.match(r'\s*DEF\s+(\w+)\s+EQU\s+(.+)$', line)
        if m:
            v = parse_num(m.group(2).strip(), self.w.const_all)
            if v is not None:
                self.w.const_all[m.group(1)] = v

    def index(self, path):
        lines = logical_lines(path)
        if path.startswith(self.w.p('maps')) and any(l.strip().startswith('MACRO') for l in lines):
            lines = self.expand_macros(lines)
        self.files[path] = lines
        scope = None
        scopes = []
        for i, line in enumerate(lines):
            st = line.strip()
            m = re.match(r'([A-Za-z_]\w*)(::?)(.*)$', line)
            m2 = re.match(r'([A-Za-z_]\w*)::?$', st)
            if (m and not line[0].isspace()) or m2:
                scope = (m or m2).group(1)
                self.labels.setdefault(scope, (path, i))
            else:
                m = re.match(r'(\.\w+):?(.*)$', st)
                if m and scope and (not line[0].isspace() or re.match(r'\.\w+:?$', st)):
                    self.labels.setdefault(scope + m.group(1), (path, i))
            scopes.append(scope)
        self.files[path] = (lines, scopes)

    def resolve(self, name, scope):
        if name.startswith('.'):
            return self.labels.get((scope or '') + name)
        return self.labels.get(name)

    def instr(self, path, i):
        lines, scopes = self.files[path]
        line = lines[i]
        s = line.strip()
        # strip a leading label
        m = re.match(r'(\.?\w+)::?\s*(.*)$', s)
        if m and (not line[0].isspace() or not m.group(2).strip()):
            s = m.group(2).strip()
        elif re.match(r'\.\w+$', s):
            s = ''
        if not s:
            return None, [], scopes[i]
        parts = s.split(None, 1)
        cmd = parts[0]
        cmd = self.aliases.get(cmd, cmd)
        args = split_args(parts[1]) if len(parts) > 1 else []
        return cmd, args, scopes[i]

    def entry(self, label, mapconst):
        """The paths of a script: list of Path(conds frozenset, effects frozenset)."""
        key = (label, mapconst)
        if key in self.cache:
            return self.cache[key]
        self.cache[key] = []  # recursion guard
        loc = self.labels.get(label)
        if loc is None:
            self.unresolved[label].add(mapconst)
            return []
        res = self.run(loc[0], loc[1], mapconst, label)
        self.cache[key] = res
        return res

    def run(self, path, idx, mapconst, label):
        """Explore a script. Returns Paths of two kinds: 'emit' (one effect and the
        conditions in force when it happens) and 'end' (how the script ends: the
        conditions of the whole branch, its flag changes, warps and player moves)."""
        loc_path, loc_idx = path, idx
        emits = {}      # effect -> list of condition sets (minimal)
        ends = {}
        states = 0
        # state: (path, idx, calls, conds, flags, last, visited, fol, disp, warped)
        stack = [(path, idx, (), frozenset(), frozenset(), None, frozenset(), None, (0, 0), False)]
        truncated = False
        memo = {}

        def emit(e, conds):
            lst = emits.setdefault(e, [])
            if any(c <= conds for c in lst):
                return
            lst[:] = [c for c in lst if not conds <= c] + [conds]

        while stack:
            pruned = False
            states += 1
            if states > MAX_STATES:
                truncated = True
                break
            path, idx, calls, conds, flags, last, visited, fol, disp, warped = stack.pop()
            lines = self.files[path][0]
            while True:
                if idx >= len(lines):
                    break
                pos = (path, idx, calls)  # a script called twice runs again
                if pos in visited:
                    break  # loop: this path adds nothing new
                visited = visited | {pos}
                mk = (pos, calls, last, fol, disp, flags, warped)
                seen = memo.setdefault(mk, [])
                if any(c <= conds for c in seen):
                    pruned = True
                    break
                # two branches that rejoin with one flag flipped: drop that flag
                for c in seen:
                    diff = c ^ conds
                    if len(diff) == 2:
                        a, b = tuple(diff)
                        if a[0] in ('ev', 'fl') and b[0] == a[0] and a[1] == b[1] and a[2] != b[2]:
                            conds = conds - diff
                            break
                if any(c <= conds for c in seen):
                    pruned = True
                    break
                seen.append(conds)
                cmd, args, scope = self.instr(path, idx)
                idx += 1
                if cmd is None:
                    continue
                if cmd not in self.commands:
                    cmd = 'end'  # data or text: the script ran off its end
                if cmd in TERMINATE:
                    if calls:
                        path, idx, scope_ret = calls[-1]
                        calls = calls[:-1]
                        lines = self.files[path][0]
                        continue
                    break
                if cmd in END_ALL:
                    break
                if cmd in GOTO or cmd in CALL:
                    if not args:
                        break
                    tgt = self.resolve(args[0], scope)
                    if tgt is None:
                        self.unresolved[args[0]].add(mapconst)
                        if cmd in GOTO:
                            break
                        continue
                    if cmd in CALL:
                        calls = calls + ((path, idx, scope),)
                    path, idx = tgt
                    lines = self.files[path][0]
                    continue
                if cmd in BRANCH1 or cmd in BRANCH2:
                    tgt_name = args[-1]
                    tgt = self.resolve(tgt_name, scope)
                    ct, cf = self.branch_conds(cmd, args, last)
                    # a flag this path already set or cleared decides the branch
                    if last is not None and last[0] in ('ev', 'fl') and cmd in BRANCH1:
                        on = (last[0], last[1], True) in flags
                        off = (last[0], last[1], False) in flags
                        if on != off:
                            taken = on == (cmd == 'iftrue')
                            ct, cf = (None, False) if taken else (False, None)
                    if ct and any((c[0], c[1], not c[2]) in conds for c in ct if c[0] in ('ev', 'fl')):
                        ct = False
                    if cf and any((c[0], c[1], not c[2]) in conds for c in cf if c[0] in ('ev', 'fl')):
                        cf = False
                    if tgt is not None and ct is not False:
                        nc = conds | ct if ct else conds
                        stack.append((tgt[0], tgt[1], calls, nc, flags, last, visited, fol, disp, warped))
                    elif tgt is None:
                        self.unresolved[tgt_name].add(mapconst)
                    if cf is False:
                        break
                    if cf:
                        conds = conds | cf
                    continue
                if cmd == 'follow' and len(args) > 1:
                    if args[1] == 'PLAYER':
                        fol = args[0]
                    continue
                if cmd == 'stopfollow':
                    fol = None
                    continue
                if cmd == 'applymovement' and len(args) > 1 and (args[0] == 'PLAYER' or args[0] == fol):
                    d = self.movement(args[1], scope)
                    disp = (disp[0] + d[0], disp[1] + d[1])
                    continue
                if cmd == 'moveobject' and args:
                    emit(('objmove', mapconst, args[0]), conds)
                    continue
                if cmd == 'applymovement' and len(args) > 1 and args[0] not in ('PLAYER', 'LAST_TALKED'):
                    if self.movement(args[1], scope) != (0, 0):
                        emit(('objmove', mapconst, args[0]), conds)
                    continue
                eff, newlast = self.effect(cmd, args, mapconst, last)
                if eff:
                    for e in eff:
                        emit(e, conds)
                        if e[0] in ('ev', 'fl'):
                            flags = (flags - {(e[0], e[1], not e[2])}) | {e}
                            if e[2] and e[1].endswith('BADGE'):
                                # what follows a badge happens only once it is earned
                                conds = conds | {('did', e[1])}
                        elif e[0] in ('warp', 'warpidx'):
                            warped = True
                last = newlast
            if pruned:
                continue
            lst = ends.setdefault((disp, warped), [])
            if not any(c <= conds for c in lst):
                lst[:] = [c for c in lst if not conds <= c] + [conds]
        out = []
        for e, lst in emits.items():
            for c in lst:
                out.append(Path(c, frozenset([e]), 'emit'))
        for (disp, warped), lst in ends.items():
          for conds in lst:
            effs = set()
            if disp != (0, 0):
                effs.add(('disp', disp[0], disp[1]))
            if warped:
                effs.add(('warped',))
            out.append(Path(conds, frozenset(effs), 'end'))
        if truncated:
            self.truncated.add((label, mapconst))
            # too many branches: every effect the script can reach, no conditions
            out.append(Path(frozenset(), self.union_effects(loc_path, loc_idx, mapconst), 'emit'))
        return out

    def union_effects(self, path, idx, mapconst):
        seen = set()
        out = set()
        todo = [(path, idx)]
        while todo:
            path, idx = todo.pop()
            lines = self.files[path][0]
            while idx < len(lines) and (path, idx) not in seen:
                seen.add((path, idx))
                cmd, args, scope = self.instr(path, idx)
                idx += 1
                if cmd is None:
                    continue
                if cmd not in self.commands or cmd in TERMINATE or cmd in END_ALL:
                    break
                if cmd in GOTO or cmd in CALL or cmd in BRANCH1 or cmd in BRANCH2:
                    tgt = self.resolve(args[-1] if (cmd in BRANCH1 or cmd in BRANCH2) else args[0], scope) if args else None
                    if tgt:
                        todo.append(tgt)
                    if cmd in GOTO:
                        break
                    continue
                eff, _ = self.effect(cmd, args, mapconst, None)
                if eff:
                    out |= eff
        return frozenset(out)

    def branch_conds(self, cmd, args, last):
        """Conditions for (taken, fall-through); None = no condition, False = impossible."""
        if last is None:
            return None, None
        kind = last[0]
        if cmd in BRANCH1:
            want = cmd == 'iftrue'
            if kind in ('ev', 'fl'):
                return (frozenset([(kind, last[1], want)]), frozenset([(kind, last[1], not want)]))
            if kind == 'item':
                return ((frozenset([('item', last[1])]) if want else None),
                        (None if want else frozenset([('item', last[1])])))
            if kind == 'poke_any':
                return ((frozenset([('poke',)]) if want else None),
                        (None if want else frozenset([('poke',)])))
            if kind == 'const':
                v = bool(last[1])
                return (None if v == want else False), (False if v == want else None)
            return None, None
        n = parse_num(args[0], self.w.const_all) if len(args) > 1 else None
        if kind == 'badges' and n is not None:
            if cmd == 'ifgreater':
                return frozenset([('badges_gt', n)]), None
            if cmd == 'ifequal':
                return frozenset([('badges_ge', n)]), None
            if cmd == 'ifless':
                return None, frozenset([('badges_ge', n)])
            if cmd == 'ifnotequal':
                return None, frozenset([('badges_ge', n)])
        if kind == 'call' and n is not None:
            if cmd == 'ifequal':
                return frozenset([('call', n)]), None
            return None, None
        if kind == 'scene' and n is not None:
            if cmd == 'ifequal':
                return frozenset([('scene', last[1], n)]), None
            if cmd == 'ifnotequal':
                return None, frozenset([('scene', last[1], n)])
        if kind == 'const' and n is not None:
            v = last[1]
            ok = {'ifequal': v == n, 'ifnotequal': v != n, 'ifgreater': v > n, 'ifless': v < n}[cmd]
            return (None if ok else False), (False if ok else None)
        return None, None

    def effect(self, cmd, args, mapconst, last):
        """(effects frozenset or None, new script-variable meaning)."""
        w = self.w
        if cmd == 'checkevent':
            return None, ('ev', args[0])
        if cmd == 'checkflag':
            return None, ('fl', args[0])
        if cmd == 'checkitem':
            return None, ('item', args[0])
        if cmd == 'checkpoke':
            return None, ('poke_any',)
        if cmd == 'checkscene':
            return None, ('scene', mapconst)
        if cmd == 'checkmapscene':
            return None, ('scene', args[0])
        if cmd == 'readvar':
            if args and args[0] == 'VAR_BADGES':
                return None, ('badges',)
            if args and args[0] == 'VAR_PARTYCOUNT':
                return None, ('poke_any',)
            if args and args[0] == 'VAR_SPECIALPHONECALL':
                return None, ('call',)
            return None, None
        if cmd == 'setval':
            v = parse_num(args[0], w.const_all) if args else None
            return None, (('const', v) if v is not None else None)
        if cmd == 'fruittree' and args:
            item = w.fruit_items.get(args[0])
            return (frozenset([('item', item)]) if item else None), None
        if cmd == 'specialphonecall':
            v = parse_num(args[0], w.const_all) if args else None
            return (frozenset([('call', v)]) if v else None), last
        if cmd in ('setevent', 'clearevent'):
            return frozenset([('ev', args[0], cmd == 'setevent')]), last
        if cmd in ('setflag', 'clearflag'):
            return frozenset([('fl', args[0], cmd == 'setflag')]), last
        if cmd in ('giveitem', 'verbosegiveitem'):
            return frozenset([('item', args[0])]), None
        if cmd in ('givepoke', 'giveegg', 'givepokemail'):
            return frozenset([('poke',)]), None
        if cmd == 'setscene':
            v = w.scene_value(args[0])
            return (frozenset([('scene', mapconst, v)]) if v is not None else None), last
        if cmd == 'setmapscene':
            v = w.scene_value(args[1])
            return (frozenset([('scene', args[0], v)]) if v is not None else None), last
        if cmd in ('warp', 'warpfacing'):
            a = args[1:] if cmd == 'warpfacing' else args
            if len(a) >= 3:
                x, y = parse_num(a[1], w.const_all), parse_num(a[2], w.const_all)
                return frozenset([('warp', a[0], x, y)]), None
            return None, None
        if cmd in ('appear', 'disappear'):
            return frozenset([('obj', mapconst, args[0], cmd == 'appear')]), last
        if cmd == 'changeblock':
            x, y = parse_num(args[0], w.const_all), parse_num(args[1], w.const_all)
            b = parse_num(args[2], w.const_all)
            if None not in (x, y, b):
                return frozenset([('block', mapconst, x // 2, y // 2, b)]), last
            return None, last
        if cmd == 'elevator':
            return frozenset(self.elevator(args[0], mapconst)), None
        if cmd in ('startbattle',):
            return frozenset([('battle',)]), None
        if cmd in KEEP_VAR:
            return None, last
        return None, None

    STEP_LEN = {'step': 1, 'slow_step': 1, 'big_step': 1, 'slide_step': 1, 'slow_slide_step': 1,
                'fast_slide_step': 1, 'jump_step': 2, 'slow_jump_step': 2, 'fast_jump_step': 2,
                'bike_step': 1}
    VEC = {'DOWN': (0, 1), 'UP': (0, -1), 'LEFT': (-1, 0), 'RIGHT': (1, 0)}

    def movement(self, name, scope):
        loc = self.resolve(name, scope)
        if loc is None:
            return (0, 0)
        key = loc
        cache = self.__dict__.setdefault('_mv', {})
        if key in cache:
            return cache[key]
        lines = self.files[loc[0]][0]
        dx = dy = 0
        for line in lines[loc[1]:loc[1] + 80]:
            s = line.strip()
            m = re.match(r'(?:\.?\w+::?\s*)?(\w+)\s*(.*)$', s)
            if not m or not s:
                continue
            c, a = m.group(1), split_args(m.group(2)) if m.group(2) else []
            if c in ('step_end', 'step_wait_end', 'step_loop', 'step_stop', 'remove_object'):
                break
            if c in self.STEP_LEN and a and a[0] in self.VEC:
                v = self.VEC[a[0]]
                dx += v[0] * self.STEP_LEN[c]
                dy += v[1] * self.STEP_LEN[c]
            elif c == 'diag_step' and len(a) == 3:
                for d in a[1:]:
                    if d in self.VEC:
                        dx += self.VEC[d][0]
                        dy += self.VEC[d][1]
        cache[key] = (dx, dy)
        return (dx, dy)

    def elevator(self, label, mapconst):
        loc = self.labels.get(label)
        out = []
        if not loc:
            return out
        lines = self.files[loc[0]][0]
        for line in lines[loc[1]:loc[1] + 40]:
            m = re.match(r'\s*elevfloor\s+(.+)$', line)
            if m:
                a = split_args(m.group(1))
                out.append(('warpidx', a[2], parse_num(a[1])))
            elif re.match(r'\s*db\s+-1', line):
                break
        return out


def setup_consts(world):
    """Numeric constants scripts compare against (scenes, small numbers)."""
    world.const_all = {}
    world.scene_values = {}
    for mp in world.maps.values():
        for i, (scr, sc) in enumerate(mp['scene_scripts']):
            if sc:
                world.scene_values[sc] = i
    for f in ('constants/script_constants.asm', 'constants/phone_constants.asm'):
        world.const_all.update(const_list(world.p(f)))
    world.const_all.update(world.scene_values)

    def scene_value(name):
        if name in world.scene_values:
            return world.scene_values[name]
        return parse_num(name, world.const_all)
    world.scene_value = scene_value
    # fruit trees: FRUITTREE_* (script_constants.asm, from 1) -> item
    trees = sorted((v, k) for k, v in const_list(world.p('constants/script_constants.asm'), 'FRUITTREE_').items()
                   if not k.startswith('NUM_'))
    items = [m.group(1) for m in (re.match(r'\s*dw\s+(\w+)', l)
                                 for l in logical_lines(world.p('data/items/fruit_trees.asm'))) if m]
    world.fruit_items = {}
    for (v, k) in trees:
        if 1 <= v <= len(items):
            world.fruit_items[k] = items[v - 1]


# ---------------------------------------------------------------------------
# Solver
# ---------------------------------------------------------------------------

BADGE_FLAGS = None
STATIONARY = ('STANDING', 'STILL', 'SPIN', 'POKEMON', 'BIGDOLL', 'SUDOWOODO')
START_MAPS = {'PLAYERS_HOUSE_1F', 'PLAYERS_HOUSE_2F'}

# Field abilities: any one of the items works (the field code checks the item)
ABILITIES = {
    'surf': ('FLIPPERS', 'HM_SURF'),
    'cut': ('HATCHET', 'HM_CUT'),
    'rocksmash': ('PICKAXE', 'TM_ROCK_SMASH'),
    'strength': ('HM_STRENGTH',),
    'whirlpool': ('HM_WHIRLPOOL',),
    'waterfall': ('HM_WATERFALL',),
    'fly': ('BIRD_WHISTLE', 'HM_FLY'),
}


class Trigger:
    """Something that runs a script: an object, bg event, coord event, map entry."""
    __slots__ = ('kind', 'map', 'name', 'paths', 'applied', 'obj', 'pos', 'scene', 'cond',
                 'first')

    def __init__(self, kind, mapc, name, paths, obj=None, pos=None, scene=None, cond=None):
        self.kind, self.map, self.name, self.paths = kind, mapc, name, paths
        self.applied = [False] * len(paths)
        self.obj, self.pos, self.scene, self.cond = obj, pos, scene, cond
        self.first = None


class Solver:
    def __init__(self, world, scripts, start, grant=(), no_npcs=False, forbid=()):
        self.w, self.s, self.start = world, scripts, start
        self.forbid = set(forbid)
        self.grant = tuple(grant)
        self.no_npcs = no_npcs
        w = world
        self.region = start
        self.flags = defaultdict(lambda: {False})
        self.items = set()
        self.calls = set()
        self.poke = False
        self.scenes = defaultdict(lambda: {0})
        self.temp_hidden = set()     # (map, obj index) objects a script can move or hide
        self.overrides = defaultdict(lambda: defaultdict(list))
        self.reached = {}            # map -> bytearray of reached tiles
        self.first = {}              # fact -> sphere it first became true
        self.cause = {}              # fact -> (trigger, path) or the map it was entered from
        self.cur_cause = None
        self.sphere = 0
        self.dropped_exits = set()   # exits into other regions
        self.badge_flags = [f for f in w.engine_flags if f.endswith('BADGE')]
        self.queue = deque()
        self.failed = []             # (map, x, y) tiles whose expansion may improve later
        self.cond_tiles = set()      # reached conditional warp tiles
        self.coord_fail = {}         # map -> condition sets that would let a coord event pass
        self.triggers = defaultdict(list)
        self.map_reached_order = []
        self.coord_at = {}
        self.build_triggers()
        self.init_state()

    # -- state ---------------------------------------------------------------
    def note(self, fact, src=None):
        if fact not in self.first:
            self.first[fact] = self.sphere
            self.cause[fact] = src if src is not None else self.cur_cause
            return True
        return False

    def can(self, ability):
        return any(i in self.items for i in ABILITIES[ability])

    def badge_count(self):
        return sum(1 for b in self.badge_flags if True in self.flags[b])

    def holds(self, c):
        k = c[0]
        if k in ('ev', 'fl'):
            return c[2] in self.flags[c[1]]
        if k == 'item':
            return c[1] in self.items
        if k == 'poke':
            return self.poke
        if k == 'badges_gt':
            return self.badge_count() > c[1]
        if k == 'badges_ge':
            return self.badge_count() >= c[1]
        if k == 'scene':
            return c[2] in self.scenes[c[1]]
        if k == 'call':
            return c[1] in self.calls
        if k == 'did':
            return c[1] not in self.forbid
        return True

    def apply(self, effects, src):
        changed = False
        for e in effects:
            k = e[0]
            if k in ('ev', 'fl'):
                if e[2] and e[1] in self.forbid:
                    continue
                if e[2] not in self.flags[e[1]]:
                    self.flags[e[1]].add(e[2])
                    changed = True
                    if e[2]:
                        self.note(('flag', e[1]))
                    elif ('clear', e[1]) not in self.first:
                        self.note(('clear', e[1]))
            elif k == 'item':
                if e[1] not in self.items:
                    self.items.add(e[1])
                    self.note(('item', e[1]))
                    changed = True
            elif k == 'poke':
                if not self.poke:
                    self.poke = True
                    self.note(('poke',))
                    changed = True
            elif k == 'call':
                if e[1] not in self.calls:
                    self.calls.add(e[1])
                    changed = True
            elif k == 'scene':
                if e[1] in self.w.maps and e[2] not in self.scenes[e[1]]:
                    self.scenes[e[1]].add(e[2])
                    changed = True
            elif k == 'warp':
                changed |= self.arrive(e[1], e[2], e[3], src)
            elif k == 'warpidx':
                mp = self.w.maps.get(e[1])
                if mp and e[2] and e[2] <= len(mp['warps']):
                    wp = mp['warps'][e[2] - 1]
                    changed |= self.arrive(e[1], wp['x'], wp['y'], src)
            elif k == 'obj':
                mp = self.w.maps.get(e[1])
                if mp is None:
                    continue
                idx = mp['obj_consts'].get(e[2])
                if idx is None or idx >= len(mp['objects']):
                    continue
                obj = mp['objects'][idx]
                if obj['flag'] != '-1':
                    v = not e[3]
                    if v not in self.flags[obj['flag']]:
                        self.flags[obj['flag']].add(v)
                        changed = True
                elif not e[3] and (e[1], idx) not in self.temp_hidden:
                    self.temp_hidden.add((e[1], idx))
                    changed = True
            elif k == 'objmove':
                mp = self.w.maps.get(e[1])
                idx = mp['obj_consts'].get(e[2]) if mp else None
                if idx is not None and (e[1], idx) not in self.temp_hidden:
                    self.temp_hidden.add((e[1], idx))
                    changed = True
            elif k == 'block':
                lst = self.overrides[e[1]][(e[2], e[3])]
                if e[4] not in lst:
                    lst.append(e[4])
                    changed = True
        return changed

    def init_state(self):
        for st in ('JOHTO', 'KANTO', 'HOENN'):
            self.flags['EVENT_START_' + st] = {st.lower() == self.start}
        for p in self.s.entry('InitializeEventsScript', 'PLAYERS_HOUSE_2F'):
            for e in p.effects:
                if e[0] in ('ev', 'fl'):
                    self.flags[e[1]] = {e[2]}
        # flags the engine sets or clears outside scripts can take either value
        for f in self.s.engine_managed:
            self.flags[f] |= {False, True}
        # engine flags (daily timers, radio shows...) that no script sets
        set_by_script = set()
        for ts in self.triggers.values():
            for t in ts:
                for p in t.paths:
                    for e in p.effects:
                        if e[0] == 'fl' and e[2]:
                            set_by_script.add(e[1])
        for f in self.w.engine_flags:
            if 'BADGE' in f or 'FLYPOINT' in f or f in set_by_script:
                continue
            self.flags[f] |= {False, True}
        for i in self.grant:
            self.items.add(i)
        sp = self.w.spawn_by_name['SPAWN_HOME']
        self.arrive(sp[0], sp[1], sp[2], 'start')

    # -- triggers ------------------------------------------------------------
    def build_triggers(self):
        w, s = self.w, self.s
        # phone calls: scripts that can run wherever the player is
        phone = set()
        for f in ('data/phone/phone_contacts.asm', 'data/phone/special_calls.asm'):
            for line in logical_lines(w.p(f)):
                m = re.match(r'\s*(phone|specialcall)\s+(.+)$', line)
                if m:
                    a = split_args(m.group(2))
                    for lab in ((a[4], a[6]) if m.group(1) == 'phone' else (a[2],)):
                        if lab != 'UnusedPhoneScript':
                            phone.add(lab)
        for lab in sorted(phone):
            self.triggers['PLAYERS_HOUSE_2F'].append(
                Trigger('phone', 'PLAYERS_HOUSE_2F', lab, s.entry(lab, 'PLAYERS_HOUSE_2F')))
        for mc, mp in w.maps.items():
            T = self.triggers[mc]
            for cb, lab in mp['callbacks']:
                T.append(Trigger('callback', mc, lab, s.entry(lab, mc)))
            for i, (lab, sc) in enumerate(mp['scene_scripts']):
                if lab:
                    T.append(Trigger('scene', mc, lab, s.entry(lab, mc), scene=i))
            for o in mp['objects']:
                lab = o['script']
                if o['type'] == 'OBJECTTYPE_ITEMBALL':
                    paths = self.itemball(lab, o, mc)
                elif o['type'] == 'OBJECTTYPE_TRAINER':
                    paths = self.trainer(lab, mc)
                else:
                    paths = s.entry(lab, mc) if lab not in ('0', 'ObjectEvent') else []
                    paths = self.add_conditional(lab, paths, mc)
                T.append(Trigger('object', mc, lab, paths, obj=o))
            for b in mp['bgs']:
                lab = b['script']
                if b['kind'] == 'BGEVENT_ITEM':
                    paths = self.hiddenitem(lab)
                else:
                    paths = self.add_conditional(lab, s.entry(lab, mc), mc, b['kind'])
                T.append(Trigger('bg', mc, lab, paths, pos=(b['x'], b['y'])))
            # boulders pushed onto a hole (stone tables): need Strength
            if mp['file'] in s.files:
                lines, scopes = s.files[mp['file']]
                for li, line in enumerate(lines):
                    m = re.match(r'\s*stonetable\s+(.+)$', line)
                    if not m:
                        continue
                    a = split_args(m.group(1))
                    name = a[2]
                    loc = s.resolve(name, scopes[li])
                    if loc is None:
                        continue
                    paths = s.run(loc[0], loc[1], mc, name)
                    paths = [Path(p.conds | {('item', 'HM_STRENGTH')}, p.effects, p.kind) for p in paths]
                    T.append(Trigger('stone', mc, name, paths))
            for c in mp['coords']:
                lab = c['script']
                sc = None if c['scene'] == '-1' else w.scene_value(c['scene'])
                t = Trigger('coord', mc, lab, s.entry(lab, mc), pos=(c['x'], c['y']), scene=sc)
                T.append(t)
                self.coord_at.setdefault((mc, c['x'], c['y']), []).append(t)

    def data_line(self, lab, macro):
        loc = self.s.labels.get(lab)
        if not loc:
            return None
        lines = self.s.files[loc[0]][0]
        for line in lines[loc[1]:loc[1] + 3]:
            m = re.search(r'\b%s\s+(.+)$' % macro, line)
            if m:
                return split_args(m.group(1))
        return None

    def add_conditional(self, lab, paths, mc, kind=None):
        a = self.data_line(lab, 'conditional_event')
        if a:
            name = a[1] if not a[1].startswith('.') else lab + a[1]
            sub = self.s.entry(name, mc)
            if kind == 'BGEVENT_IFNOTSET':
                want = {('ev', a[0], False)}
            elif kind == 'BGEVENT_IFSET':
                want = {('ev', a[0], True)}
            else:
                want = set()
            return [Path(p.conds | want, p.effects, p.kind) for p in sub]
        return paths

    def itemball(self, lab, o, mc):
        a = self.data_line(lab, 'itemball')
        eff = set()
        if a:
            eff.add(('item', a[0]))
        if o['flag'] != '-1':
            eff.add(('ev', o['flag'], True))
        return [Path(frozenset(), frozenset(eff))]

    def hiddenitem(self, lab):
        a = self.data_line(lab, 'hiddenitem')
        if not a:
            return []
        return [Path(frozenset([('ev', a[1], False)]),
                     frozenset([('item', a[0]), ('ev', a[1], True)]))]

    def trainer(self, lab, mc):
        a = self.data_line(lab, 'trainer')
        if not a:
            return []
        out = [Path(frozenset(), frozenset([('ev', a[2], True), ('battle',)]))]
        if len(a) >= 7 and a[6] not in ('0',):
            name = lab + a[6] if a[6].startswith('.') else a[6]
            for p in self.s.entry(name, mc):
                out.append(Path(p.conds | {('ev', a[2], True)}, p.effects, p.kind))
        return out

    # -- movement ------------------------------------------------------------
    def allowed_map(self, mc):
        mp = self.w.maps.get(mc)
        if mp is None:
            return False
        return mc in START_MAPS or mp['region'] in (None, self.region)

    def grid(self, mc):
        g = self.reached.get(mc)
        if g is None:
            mp = self.w.maps[mc]
            g = bytearray(4 * mp['w'] * mp['h'])
            self.reached[mc] = g
            self.map_reached_order.append(mc)
            self.note(('map', mc), self._arrive_src)
        return g

    def arrive(self, mc, x, y, src):
        if mc not in self.w.maps:
            return False
        if not self.allowed_map(mc):
            self.dropped_exits.add((src, mc))
            return False
        mp = self.w.maps[mc]
        if x is None or y is None or not (0 <= x < 2 * mp['w'] and 0 <= y < 2 * mp['h']):
            return False
        self._arrive_src = self.cur_cause or src
        g = self.grid(mc)
        i = y * 2 * mp['w'] + x
        if g[i]:
            return False
        g[i] = 1
        self.queue.append((mc, x, y))
        return True

    def object_blockers(self, mc):
        """Tiles a visible standing object always occupies."""
        mp = self.w.maps[mc]
        out = set()
        if self.no_npcs:
            return out
        for o in mp['objects']:
            if not any(t in o['move'] for t in STATIONARY) and 'ROCK' not in o['move'] \
                    and 'BOULDER' not in o['move']:
                continue
            if o['h1'] != '-1' or o['h2'] != '-1':
                continue
            if 'SMASHABLE_ROCK' in o['move'] and self.can('rocksmash'):
                continue
            if 'STRENGTH_BOULDER' in o['move'] and self.can('strength'):
                continue
            if o['flag'] != '-1':
                if True in self.flags[o['flag']]:
                    continue
            if (mc, o['index']) in self.temp_hidden:
                continue
            out.add((o['x'], o['y']))
        return out

    def coll_at(self, mc, x, y):
        mp = self.w.maps[mc]
        ov = self.overrides.get(mc)
        return self.w.tile_coll(mp, x, y, ov)

    def can_enter(self, colls, d):
        """Can the player step onto a tile with these possible collisions."""
        w = self.w
        for c in colls:
            p = w.permission(c)
            if c == w.coll.get('COLL_CUT_TREE') or c == w.coll.get('COLL_CUT_TREE_1A'):
                if self.can('cut'):
                    return True
                continue
            if p == LAND:
                return True
            if p == WATER:
                if not self.can('surf'):
                    continue
                if c in (w.coll['COLL_WHIRLPOOL'], 0x2c, 0x22, 0x2a):
                    if self.can('whirlpool'):
                        return True
                    continue
                if 0x30 <= c <= 0x33:
                    if self.can('waterfall'):
                        return True
                    continue
                return True
        return False

    @staticmethod
    def side_blocks_leaving(c, d):
        if (c & 0xf0) not in (0xb0, 0xc0):
            return False
        # by the constants' names (the engine's direction masks are named off by one
        # convention: COLL_UP_WALL blocks leaving upward, as the game does)
        mask = ['right', 'left', 'up', 'down', 'down right', 'down left', 'up right', 'up left'][c & 7]
        return d in mask.split()

    @staticmethod
    def side_blocks_entering(c, d):
        if (c & 0xf0) not in (0xb0, 0xc0):
            return False
        k = c & 7
        return {'down': k in (2, 6, 7), 'up': k in (3, 4, 5),
                'right': k in (1, 5, 7), 'left': k in (0, 4, 6)}[d]

    def expand(self, mc, x, y, blockers):
        """Neighbours of a reached tile. Returns True if some move failed (may work later)."""
        mp = self.w.maps[mc]
        here = self.coll_at(mc, x, y) or [0]
        failed = False
        for d, (dx, dy) in DIRS.items():
            # ledge jump
            jumped = False
            for c in here:
                if (c & 0xf0) == 0xa0:
                    dirs = ['right', 'left', 'up', 'down', 'right down', 'down left',
                            'up right', 'up left'][c & 7].split()
                    if d in dirs:
                        tx, ty = x + 2 * dx, y + 2 * dy
                        tc = self.coll_at(mc, tx, ty)
                        if tc and self.can_enter(tc, d):
                            self.step_to(mc, tx, ty, blockers)
                        jumped = True
            if jumped and all((c & 0xf0) == 0xa0 for c in here):
                continue
            if all(self.side_blocks_leaving(c, d) for c in here):
                continue
            nx, ny = x + dx, y + dy
            if 0 <= nx < 2 * mp['w'] and 0 <= ny < 2 * mp['h']:
                tc = self.coll_at(mc, nx, ny)
                if all(self.side_blocks_entering(c, d) for c in tc):
                    continue
                if (nx, ny) in blockers:
                    failed = True
                    continue
                if not self.can_enter(tc, d):
                    failed = True
                    continue
                nx, ny = self.slide(mc, nx, ny, d, blockers)
                self.step_to(mc, nx, ny, blockers)
            else:
                failed |= self.cross(mc, nx, ny, d)
        return failed

    def slide(self, mc, x, y, d, blockers=()):
        """Where the player stops after stepping onto (x, y) going d: on ice
        the player keeps sliding until the next tile can't be entered."""
        ice = self.w.coll['COLL_ICE']
        mp = self.w.maps[mc]
        dx, dy = DIRS[d]
        for _ in range(64):
            here = self.coll_at(mc, x, y) or [0]
            if ice not in here:
                break
            nx, ny = x + dx, y + dy
            if not (0 <= nx < 2 * mp['w'] and 0 <= ny < 2 * mp['h']) or (nx, ny) in blockers:
                break
            tc = self.coll_at(mc, nx, ny)
            if self.side_blocks_leaving(here[0], d) or all(self.side_blocks_entering(c, d) for c in tc) \
                    or not self.can_enter(tc, d):
                break
            x, y = nx, ny
        return x, y

    def cross(self, mc, nx, ny, d):
        mp = self.w.maps[mc]
        for cd, tgt, off in mp.get('conns', []):
            if cd != {'up': 'north', 'down': 'south', 'left': 'west', 'right': 'east'}[d]:
                continue
            tm = self.w.maps.get(tgt)
            if tm is None:
                continue
            if cd == 'north':
                tx, ty = nx - 2 * off, 2 * tm['h'] - 1
            elif cd == 'south':
                tx, ty = nx - 2 * off, 0
            elif cd == 'west':
                tx, ty = 2 * tm['w'] - 1, ny - 2 * off
            else:
                tx, ty = 0, ny - 2 * off
            if not (0 <= tx < 2 * tm['w'] and 0 <= ty < 2 * tm['h']):
                continue
            if not self.allowed_map(tgt):
                self.dropped_exits.add((mc, tgt))
                return False
            tc = self.w.tile_coll(tm, tx, ty, self.overrides.get(tgt))
            if tc and self.can_enter(tc, d):
                self.arrive(tgt, tx, ty, mc)
                return False
            return True
        return False

    def step_to(self, mc, x, y, blockers):
        self.arrive(mc, x, y, mc)

    def coord_redirects(self, mc, x, y):
        """Run the coord events on this tile. True if the player can't stay on it
        (every script that can run warps or moves the player); moved players land
        where the script leaves them."""
        ts = self.coord_at.get((mc, x, y))
        if not ts:
            return False
        stays = False
        anyrun = False
        for t in ts:
            if t.scene is not None and t.scene not in self.scenes[mc]:
                continue
            if t.scene is not None and self.scenes[mc] != {t.scene}:
                stays = True  # in another scene the event doesn't run
            ends = [p for p in t.paths if p.kind == 'end']
            feasible = [p for p in ends if all(self.holds(c) for c in p.conds)]
            # remember branches that would let the player stay but never run
            for p in ends:
                if p in feasible:
                    continue
                if not any(e[0] in ('warped', 'disp') for e in p.effects):
                    bad = frozenset(c for c in p.conds if not self.holds(c))
                    self.coord_fail.setdefault(mc, set()).add(bad)
            if not feasible:
                stays = True
                continue
            anyrun = True
            for p in feasible:
                warp = any(e[0] == 'warped' for e in p.effects)
                disp = [e for e in p.effects if e[0] == 'disp']
                if warp:
                    continue
                if disp:
                    self.arrive(mc, x + disp[0][1], y + disp[0][2], mc)
                    continue
                stays = True
        return anyrun and not stays

    def walk(self):
        blockers = {}
        q = self.queue
        while q:
            mc, x, y = q.popleft()
            if mc not in blockers:
                blockers[mc] = self.object_blockers(mc)
            if self.coord_redirects(mc, x, y):
                self.failed.append((mc, x, y))
                continue
            mp = self.w.maps[mc]
            # warps on this tile
            for wp in mp['warps']:
                if wp['x'] == x and wp['y'] == y and wp.get('cond'):
                    self.cond_tiles.add((mc, x, y))
                    self.cond_warp(mc, wp)
                elif wp['x'] == x and wp['y'] == y:
                    tm = self.w.maps.get(wp['map'])
                    if tm and wp['dest'] and 0 < wp['dest'] <= len(tm['warps']):
                        dw = tm['warps'][wp['dest'] - 1]
                        self.arrive(wp['map'], dw['x'], dw['y'], mc)
            if self.expand(mc, x, y, blockers[mc]):
                self.failed.append((mc, x, y))

    def cond_warp(self, mc, wp):
        """Follow every entry of a conditional warp that can be the first to hold."""
        changed = False
        for flag, want, m, dest in self.w.cond_warps.get(wp['cond'], []):
            if flag is None:
                ok = True
            else:
                ok = want in self.flags[flag]
            if ok and m:
                tm = self.w.maps.get(m)
                if tm and dest and 0 < dest <= len(tm['warps']):
                    dw = tm['warps'][dest - 1]
                    changed |= self.arrive(m, dw['x'], dw['y'], mc)
            if flag is None or (not want) not in self.flags[flag]:
                break  # later entries need this one to fail
        return changed

    def recheck_cond_warps(self):
        changed = False
        for (mc, x, y) in list(self.cond_tiles):
            for wp in self.w.maps[mc]['warps']:
                if wp['x'] == x and wp['y'] == y and wp.get('cond'):
                    changed |= self.cond_warp(mc, wp)
        return changed

    def fly(self):
        if not self.can('fly'):
            return
        for f, v in list(self.flags.items()):
            if f.startswith('ENGINE_FLYPOINT_') and True in v:
                sp = self.w.spawn_by_name.get('SPAWN_' + f[len('ENGINE_FLYPOINT_'):])
                if sp:
                    self.arrive(sp[0], sp[1], sp[2], 'fly:' + f)

    # -- triggers firing -------------------------------------------------------
    def near(self, mc, pts):
        """Is a reached tile next to one of these points (or across a counter)."""
        mp = self.w.maps[mc]
        g = self.reached.get(mc)
        if g is None:
            return False
        W, H = 2 * mp['w'], 2 * mp['h']
        for (px, py) in pts:
            for dx, dy in DIRS.values():
                for dist in (1, 2):
                    tx, ty = px + dx * dist, py + dy * dist
                    if not (0 <= tx < W and 0 <= ty < H):
                        break
                    if dist == 2:
                        mid = self.coll_at(mc, px + dx, py + dy) or []
                        if not any(self.w.is_talk(c) or c == self.w.coll.get('COLL_COUNTER') for c in mid):
                            break
                    if g[ty * W + tx]:
                        return True
        return False

    def trigger_active(self, t):
        mc = t.map
        if mc not in self.reached:
            return False
        if t.kind in ('callback', 'stone', 'phone'):
            return True
        if t.kind == 'scene':
            return t.scene in self.scenes[mc]
        if t.kind == 'coord':
            mp = self.w.maps[mc]
            x, y = t.pos
            if not (0 <= x < 2 * mp['w'] and 0 <= y < 2 * mp['h']):
                return False
            if not self.reached[mc][y * 2 * mp['w'] + x]:
                return False
            return t.scene is None or t.scene in self.scenes[mc]
        if t.kind == 'bg':
            return self.near(mc, [t.pos])
        if t.kind == 'object':
            o = t.obj
            if o['flag'] != '-1' and False not in self.flags[o['flag']]:
                return False
            pts = [(o['x'] + dx, o['y'] + dy) for dx in range(-o['rx'], o['rx'] + 1)
                   for dy in range(-o['ry'], o['ry'] + 1)]
            if self.near(mc, pts):
                return True
            sight = parse_num(o['sight']) or 0
            if o['type'] == 'OBJECTTYPE_TRAINER' and sight:
                mp = self.w.maps[mc]
                g = self.reached[mc]
                W, H = 2 * mp['w'], 2 * mp['h']
                for dx, dy in DIRS.values():
                    for dist in range(1, sight + 1):
                        tx, ty = o['x'] + dx * dist, o['y'] + dy * dist
                        if 0 <= tx < W and 0 <= ty < H and g[ty * W + tx]:
                            return True
            return False
        return False

    def fire(self):
        changed = False
        for mc in list(self.reached):
            for t in self.triggers[mc]:
                if all(t.applied) or not self.trigger_active(t):
                    continue
                if t.first is None:
                    t.first = self.sphere
                for i, p in enumerate(t.paths):
                    if t.applied[i]:
                        continue
                    if all(self.holds(c) for c in p.conds):
                        t.applied[i] = True
                        self.cur_cause = (t, p)
                        changed |= self.apply(p.effects, mc)
                        self.cur_cause = None
        return changed

    def solve(self, max_spheres=400):
        while self.sphere < max_spheres:
            self.walk()
            self.fly()
            self.walk()
            changed = self.fire()
            changed |= self.recheck_cond_warps()
            # retry tiles whose expansion failed (capabilities may have grown)
            if changed or self.queue:
                retry, self.failed = self.failed, []
                for (mc, x, y) in retry:
                    self.queue.append((mc, x, y))
                self.sphere += 1
                continue
            break
        return self


# ---------------------------------------------------------------------------
# Report
# ---------------------------------------------------------------------------

def key_items(world):
    names = []
    on = False
    for line in logical_lines(world.p('constants/item_constants.asm')):
        s = line.strip()
        if s.startswith('DEF FIRST_KEY_ITEM'):
            on = True
            continue
        if s.startswith('DEF NUM_KEY_ITEM_POCKET'):
            break
        m = re.match(r'const\s+(\w+)', s)
        if on and m:
            names.append(m.group(1))
    return set(names)


EXPECTED_FLAGS = re.compile(r'^EVENT_(START_|ORIGIN_|HARDMODE|LEVELCAPS)')


class Report:
    def __init__(self, world, scripts, solvers, whatif=None):
        self.w, self.s, self.solvers = world, scripts, solvers
        self.whatif = whatif or {}
        self.keys = key_items(world)
        # where each flag/item can be set by any script, anywhere
        self.setters = defaultdict(set)
        for mc, ts in next(iter(solvers.values())).triggers.items():
            for t in ts:
                for p in t.paths:
                    for e in p.effects:
                        if e[0] in ('ev', 'fl') and e[2]:
                            self.setters[e[1]].add(mc)
                        elif e[0] == 'item':
                            self.setters['item:' + e[1]].add(mc)
                        elif e[0] == 'obj':
                            mp = world.maps.get(e[1])
                            if mp:
                                idx = mp['obj_consts'].get(e[2])
                                if idx is not None and idx < len(mp['objects']):
                                    f = mp['objects'][idx]['flag']
                                    if f != '-1' and not e[3]:
                                        self.setters[f].add(mc)

    def producers(self, S):
        idx = getattr(S, '_producers', None)
        if idx is not None:
            return idx
        idx = defaultdict(list)
        for mc, ts in S.triggers.items():
            for t in ts:
                for p in t.paths:
                    for e in p.effects:
                        k = e[0]
                        if k in ('ev', 'fl'):
                            idx[('ev' if e[2] else 'evclear', e[1])].append((t, p))
                        elif k == 'item':
                            idx[('item', e[1])].append((t, p))
                        elif k == 'call':
                            idx[('call', e[1])].append((t, p))
                        elif k == 'scene':
                            idx[('scene', e[1], e[2])].append((t, p))
                        elif k == 'obj':
                            f = self.obj_flag(e)
                            if f and f != '-1':
                                idx[('evclear' if e[3] else 'ev', f)].append((t, p))
        S._producers = idx
        return idx

    def cond_fact(self, c):
        k = c[0]
        if k in ('ev', 'fl'):
            return ('ev' if c[2] else 'evclear', c[1])
        if k == 'item':
            return ('item', c[1])
        if k == 'call':
            return ('call', c[1])
        if k == 'scene':
            return ('scene', c[1], c[2])
        return None

    def fact_class(self, S, fact, depth=0):
        """Why a fact never becomes true: 'other regions', 'expected', 'never set',
        'ability:<name>' or 'gap'."""
        memo = S.__dict__.setdefault('_fclass', {})
        if fact in memo:
            return memo[fact]
        if fact[0] in ('ev', 'evclear') and EXPECTED_FLAGS.match(fact[1]):
            return 'expected'
        memo[fact] = None  # cycle guard: ignored by worst()
        prods = self.producers(S).get(fact, [])
        if not prods:
            res = 'never set'
        else:
            classes = set()
            for t, p in prods:
                classes.add(self.path_class(S, t, p, depth + 1))
            res = self.worst(classes)
        memo[fact] = res
        return res

    @staticmethod
    def worst(classes):
        classes = {c for c in classes if c is not None}
        if not classes:
            return None
        for c in ('gap', 'never set', 'npc'):
            if c in classes:
                return c
        ab = sorted(c for c in classes if c.startswith('ability:'))
        if ab:
            return ab[0]
        if 'other regions' in classes:
            return 'other regions'
        return 'expected' if classes else 'gap'

    def path_class(self, S, t, p, depth=0):
        mp = self.w.maps.get(t.map)
        if mp and mp['region'] not in (None, S.start) and t.map not in START_MAPS:
            return 'other regions'
        if depth > 12:
            return 'gap'
        if t.first is None:
            if t.kind == 'scene' and t.map in S.reached:
                return self.fact_class(S, ('scene', t.map, t.scene), depth)
            kind, info = self.inactive_reason(S, t)
            if kind == 'hidden':
                return self.fact_class(S, ('evclear', info[0]), depth)
            if t.map not in S.reached:
                return self.map_class(S, t.map, depth)
            ab = self.ability_for(S, t)
            if ab == 'npc':
                return self.npc_class(S, t.map)
            return 'ability:' + ab if ab else 'gap'
        classes = set()
        for c in p.conds:
            if S.holds(c):
                continue
            classes.add(self.cond_class(S, c, depth))
        # one condition that needs another region explains the whole branch
        for benign in ('other regions', 'expected'):
            if benign in classes:
                return benign
        return self.worst(classes) if classes else 'gap'

    def map_class(self, S, m, depth=0):
        """Why a map is never reached."""
        memo = S.__dict__.setdefault('_mclass', {})
        busy = S.__dict__.setdefault('_mbusy', set())
        if m in memo:
            return memo[m]
        if m in busy:
            return None
        mp = self.w.maps[m]
        if mp['region'] not in (None, S.start) and m not in START_MAPS:
            return 'other regions'
        busy.add(m)
        classes = set()
        for mc, src in self.w.maps.items():
            if any(m in self.w.warp_maps(wp) for wp in src['warps']) or any(c[1] == m for c in src.get('conns', [])):
                if mc == m:
                    continue
                if mc in S.reached:
                    if m in self.whatif.get(S.start, {}).get('npc_maps', ()):
                        classes.add(self.npc_class(S, mc))
                    elif S.coord_fail.get(mc):
                        cl = set()
                        for bad in S.coord_fail[mc]:
                            cc = {self.cond_class(S, c, depth + 1) for c in bad}
                            cl.add('other regions' if cc & {'other regions', 'expected'} else self.worst(cc))
                        classes.add('other regions' if 'other regions' in cl else self.worst(cl) or 'gap')
                    else:
                        classes.add('gap')
                else:
                    classes.add(self.map_class(S, mc, depth + 1))
        for mc, ts in S.triggers.items():
            for t in ts:
                for p in t.paths:
                    if any(e[0] == 'warp' and e[1] == m for e in p.effects):
                        classes.add(self.path_class(S, t, p, depth + 1))
        classes = {c for c in classes if c is not None}
        # one entrance that only opens through another region explains it
        if classes and classes <= {'other regions', 'expected', 'gap', 'npc'} and 'other regions' in classes \
                and 'gap' not in classes:
            res = 'other regions'
        else:
            res = self.worst(classes)  # None: only reached through itself
        busy.discard(m)
        if res is not None:
            memo[m] = res
        return res if (res is not None or depth > 0) else 'gap'

    def npc_class(self, S, mc):
        """Why the standing NPCs on a map never move: the class of their flags."""
        mp = self.w.maps[mc]
        blockers = S.object_blockers(mc)
        classes = set()
        for o in mp['objects']:
            if (o['x'], o['y']) not in blockers:
                continue
            if o['flag'] == '-1':
                continue
            classes.add(self.fact_class(S, ('ev', o['flag'])))
        classes = {c for c in classes if c}
        if classes and classes <= {'other regions', 'expected'}:
            return 'other regions'
        return 'npc'

    def cond_class(self, S, c, depth=0):
        k = c[0]
        if k in ('badges_gt', 'badges_ge'):
            n = c[1] + (1 if k == 'badges_gt' else 0)
            region_badges = len([b for b in S.badge_flags if self.badge_region(b) == S.start])
            return 'other regions' if n > region_badges else 'gap'
        f = self.cond_fact(c)
        if f is None:
            return 'gap'
        return self.fact_class(S, f, depth)

    def ability_for(self, S, t):
        key = (t.map, t.kind, t.name, self.where(t))
        wi = self.whatif.get(S.start, {})
        for ab, active in sorted(wi.items()):
            if ab not in ('npc', 'npc_maps') and key in active:
                return ab
        if key in wi.get('npc', ()):
            return 'npc'
        return None

    def progression_item(self, i):
        return i in self.keys or i.startswith('HM_') or i == 'TM_ROCK_SMASH'

    def cond_text(self, c):
        k = c[0]
        if k in ('ev', 'fl'):
            return '%s %s' % (c[1], 'set' if c[2] else 'clear')
        if k == 'item':
            return 'has %s' % c[1]
        if k == 'poke':
            return 'has a Pokémon'
        if k == 'badges_gt':
            return 'more than %d badges' % c[1]
        if k == 'badges_ge':
            return 'at least %d badges' % c[1]
        if k == 'scene':
            return '%s scene %d' % (c[1], c[2])
        if k == 'call':
            return 'phone call %s' % c[1]
        return str(c)

    def classify(self, S, c):
        return self.cond_class(S, c)

    BADGE_REGION = {
        'johto': ['ZEPHYR', 'HIVE', 'PLAIN', 'FOG', 'STORM', 'MINERAL', 'GLACIER', 'RISING'],
        'kanto': ['BOULDER', 'CASCADE', 'THUNDER', 'RAINBOW', 'SOUL', 'MARSH', 'VOLCANO', 'EARTH'],
        'hoenn': ['STONE', 'KNUCKLE', 'DYNAMO', 'HEAT', 'BALANCE', 'FEATHER', 'MIND', 'RAIN'],
    }

    def badge_region(self, b):
        for r, names in self.BADGE_REGION.items():
            if b[len('ENGINE_'):-len('BADGE')] in names:
                return r
        return None

    def significant(self, effects):
        out = []
        for e in effects:
            if e[0] == 'item':
                out.append('gives %s' % e[1])
            elif e[0] in ('ev', 'fl') and e[2]:
                out.append('sets %s' % e[1])
            elif e[0] in ('warp',):
                out.append('warps to %s' % e[1])
            elif e[0] == 'poke':
                out.append('gives a Pokémon')
        return sorted(out)

    def start_section(self, st):
        S = self.solvers[st]
        w = self.w
        L = []
        reg = [m for m in w.maps if w.maps[m]['region'] == st]
        unreached = [m for m in reg if m not in S.reached]
        L.append('## %s start\n' % st.capitalize())
        L.append('- Reached %d of %d %s maps; %d badges; %d logic steps.' % (
            len(reg) - len(unreached), len(reg), st.capitalize(), S.badge_count(), S.sphere))
        caps = ', '.join('%s (step %d)' % (a, min(S.first.get(('item', i), 999) for i in ABILITIES[a]))
                         for a in ABILITIES if S.can(a))
        L.append('- Field abilities: %s.' % (caps or 'none'))
        missing = [a for a in ABILITIES if not S.can(a)]
        if missing:
            L.append('- **Never available:** %s.' % ', '.join(missing))
        L.append('')
        # timeline
        L.append('### Progression order\n')
        L.append('Logic step = how many rounds of "walk everywhere reachable, then run every script reached" it takes. Things in the same step open together.\n')
        steps = defaultdict(list)
        for fact, sp in S.first.items():
            if fact[0] == 'flag' and fact[1] in S.badge_flags:
                steps[sp].append('**%s**' % fact[1][len('ENGINE_'):].title())
            elif fact[0] == 'item' and self.progression_item(fact[1]):
                steps[sp].append(fact[1])
            elif fact[0] == 'poke':
                steps[sp].append('first Pokémon')
        mapsteps = defaultdict(int)
        for fact, sp in S.first.items():
            if fact[0] == 'map':
                mapsteps[sp] += 1
        L.append('| Step | Badges and key items | New maps |')
        L.append('|---|---|---|')
        for sp in sorted(set(steps) | set(mapsteps)):
            L.append('| %d | %s | %d |' % (sp, ', '.join(sorted(steps.get(sp, []))) or '—',
                                           mapsteps.get(sp, 0)))
        L.append('')
        needs = getattr(self, 'needs', {}).get(st)
        if needs:
            L.append('### What each badge needs\n')
            L.append('Badges that must come first (found by running the check again with one badge forbidden). An empty row means the badge can be earned before every other one.\n')
            L.append('| Badge | Needs first |')
            L.append('|---|---|')
            for n in [b for b in needs]:
                L.append('| %s | %s |' % (n[7:-5].title(), ', '.join(x[7:-5].title() for x in needs[n]) or '—'))
            L.append('')
        if unreached:
            L.append('### Maps not reached\n')
            for m in unreached:
                cl = self.map_class(S, m)
                L.append('- `%s` (%s)%s' % (m, self.why_map(S, m),
                                            '' if cl in ('gap', None) else ' [%s]' % cl))
            L.append('')
        # effects that never happen, with the scripts that would cause them
        lost = defaultdict(list)    # fact -> [(trigger, path)]
        for mc, ts in S.triggers.items():
            mp = w.maps[mc]
            if mc not in S.reached:
                continue
            if mp['region'] not in (st,) and mc not in START_MAPS:
                continue
            for t in ts:
                for i, p in enumerate(t.paths):
                    if t.applied[i]:
                        continue
                    for e in p.effects:
                        f = self.lost_fact(S, e)
                        if f is not None:
                            lost[f].append((t, p))
        buckets = defaultdict(list)
        for fact, srcs in sorted(lost.items()):
            cls = self.fact_class(S, fact) or 'gap'
            per = defaultdict(set)
            for t, p in srcs:
                per[(t.map, t.kind, t.name, self.where(t))].add(self.source_text(S, t, p))
            lines = []
            for key, rs in sorted(per.items()):
                rs = sorted(rs, key=len)
                lines.append('  - `%s` %s `%s`%s: %s' % (key[0], key[1], key[2], key[3],
                                                          '; or '.join(rs[:2]) + (' …' if len(rs) > 2 else '')))
            if cls in ('other regions', 'expected'):
                b = 'other'
            elif cls == 'npc':
                b = 'npc'
            elif cls.startswith('ability:'):
                b = 'ability'
            else:
                b = 'real'
            buckets[b].append((self.fact_text(fact), cls, lines))
        if buckets['real']:
            L.append('### Never happens on a reached map\n')
            L.append('Items never received and flags never set, although a script on a reached map would do it. Each source says why it never runs.\n')
            for txt, cls, lines in buckets['real']:
                L.append('- %s%s' % (txt, ' (nothing ever sets what it needs)' if cls == 'never set' else ''))
                L.extend(lines[:6])
                if len(lines) > 6:
                    L.append('  - … %d more' % (len(lines) - 6))
            L.append('')
        if buckets['npc']:
            L.append('### Behind an NPC who never moves\n')
            L.append('Reachable only if a standing NPC were out of the way. Often the NPC leaves after an event in another region (the Hall of Fame, say); check each.\n')
            for txt, cls, lines in buckets['npc']:
                L.append('- %s' % txt)
                L.extend(lines[:3])
            L.append('')
        if buckets['ability']:
            L.append('<details><summary>Never happens because this start never gets a field ability (%d)</summary>\n' % len(buckets['ability']))
            for txt, cls, lines in buckets['ability']:
                L.append('- %s: needs %s' % (txt, cls.split(':')[1]))
                L.extend(lines[:3])
            L.append('\n</details>\n')
        if buckets['other']:
            L.append('<details><summary>Never happens because it needs another region (%d)</summary>\n' % len(buckets['other']))
            for txt, cls, lines in buckets['other']:
                L.append('- %s' % txt)
                L.extend(lines[:3])
            L.append('\n</details>\n')
        exits = sorted({(a, b) for a, b in S.dropped_exits if not str(a).startswith('fly')})
        if exits:
            L.append('<details><summary>Exits into other regions, not followed (%d)</summary>\n' % len(exits))
            for a, b in exits:
                L.append('- `%s` → `%s` (%s)' % (a, b, w.maps[b]['region']))
            L.append('\n</details>\n')
        return '\n'.join(L)

    def inactive_reason(self, S, t):
        o = t.obj
        if t.kind == 'object' and o['flag'] != '-1' and False not in S.flags[o['flag']]:
            flag = o['flag']
            # what would clear it, and why that never runs
            reasons = []
            cl = set()
            for mc, ts in S.triggers.items():
                for t2 in ts:
                    for i, p in enumerate(t2.paths):
                        clears = any((e[0] == 'ev' and e[1] == flag and not e[2]) or
                                     (e[0] == 'obj' and e[3] and self.obj_flag(e) == flag)
                                     for e in p.effects)
                        if not clears:
                            continue
                        if t2.first is None:
                            reasons.append('%s `%s` never runs' % (mc, t2.name))
                            cl.add('other regions' if self.w.maps[mc]['region'] not in (None, S.start) else 'gap')
                        else:
                            bad = [c for c in p.conds if not S.holds(c)]
                            reasons.append('%s `%s` needs %s' % (mc, t2.name, ' and '.join(self.cond_text(c) for c in bad)))
                            cl |= {self.classify(S, c) for c in bad}
            reasons = sorted(set(reasons))
            if not reasons:
                cl.add('never set' if flag not in self.setters else 'gap')
                why = ' (nothing clears it)'
            else:
                why = ': ' + '; '.join(reasons[:2]) + (' …' if len(reasons) > 2 else '')
            return ('hidden', (flag, why, frozenset(cl)))
        return ('unreachable', ())

    def obj_flag(self, e):
        mp = self.w.maps.get(e[1])
        if not mp:
            return None
        idx = mp['obj_consts'].get(e[2])
        if idx is None or idx >= len(mp['objects']):
            return None
        return mp['objects'][idx]['flag']

    def lost_fact(self, S, e):
        if e[0] == 'item' and e[1] not in S.items:
            return ('item', e[1])
        if e[0] in ('ev', 'fl') and e[2] and True not in S.flags[e[1]]:
            return ('ev', e[1])
        return None

    def fact_text(self, f):
        if f[0] == 'item':
            return 'item `%s`' % f[1]
        if f[0] == 'ev':
            return '`%s` set' % f[1]
        if f[0] == 'evclear':
            return '`%s` cleared' % f[1]
        if f[0] == 'call':
            return 'phone call %s' % f[1]
        return str(f)

    def source_text(self, S, t, p):
        if t.first is None:
            kind, info = self.inactive_reason(S, t)
            if kind == 'hidden':
                return 'the object never appears (`%s` is never clear%s)' % (info[0], info[1])
            ab = self.ability_for(S, t)
            if ab == 'npc':
                return 'the player never gets next to it: a standing NPC is in the way'
            if ab:
                return 'the player never gets next to it (needs %s)' % ab
            return 'the player never gets next to it'
        bad = sorted(c for c in p.conds if not S.holds(c))
        parts = []
        for c in bad:
            cl = self.cond_class(S, c) or 'gap'
            parts.append(self.cond_text(c) + ('' if cl == 'gap' else ' [%s]' % cl))
        return 'needs ' + ' and '.join(parts)

    def lost_effect(self, S, e):
        if e[0] == 'item' and e[1] not in S.items:
            return 'item `%s`' % e[1]
        if e[0] in ('ev', 'fl') and e[2] and True not in S.flags[e[1]]:
            return '`%s` set' % e[1]
        return None

    def where(self, t):
        if t.obj is not None:
            return ' at (%d, %d)' % (t.obj['x'], t.obj['y'])
        if t.pos is not None:
            return ' at (%d, %d)' % t.pos
        return ''

    def why_map(self, S, m):
        w = self.w
        srcs = []
        for mc, mp in w.maps.items():
            for wp in mp['warps']:
                if m in w.warp_maps(wp):
                    srcs.append(mc)
            for c in mp.get('conns', []):
                if c[1] == m:
                    srcs.append(mc)
        for mc, ts in S.triggers.items():
            for t in ts:
                for p in t.paths:
                    if any(e[0] == 'warp' and e[1] == m for e in p.effects):
                        srcs.append(mc + ' script')
        srcs = sorted(set(srcs))
        if not srcs:
            return 'nothing warps or connects to it'
        reached = [s_ for s_ in srcs if s_.split()[0] in S.reached]
        if reached:
            return 'entrances from reached maps are blocked: ' + ', '.join(reached[:5])
        return 'only entered from ' + ', '.join(srcs[:5])

    def text(self):
        L = ['# Progression check\n']
        L.append('Static check of each start region (`tools/progression_check.py`): it walks the maps tile by tile, runs every script it reaches and repeats until nothing new opens. Travel to other regions is left out. Conditions are tracked loosely (a flag that can be set at some point counts as set from then on, and as clear too), so the check finds things that can never happen; it does not prove the intended order.\n')
        for st in self.solvers:
            L.append(self.start_section(st))
        if self.s.truncated:
            L.append('## Scripts with too many branches\n')
            L.append('Read with every condition dropped (an over-approximation):\n')
            for lab, mc in sorted(self.s.truncated):
                L.append('- `%s` (`%s`)' % (lab, mc))
            L.append('')
        unres = {k: v for k, v in self.s.unresolved.items()}
        if unres:
            L.append('## Labels the checker could not find\n')
            for k, v in sorted(unres.items()):
                L.append('- `%s` (from %s)' % (k, ', '.join(sorted(v)[:4])))
            L.append('')
        return '\n'.join(L)

    def data(self):
        out = {}
        for st, S in self.solvers.items():
            out[st] = {
                'maps': sorted(S.reached),
                'items': sorted(S.items),
                'flags_set': sorted(f for f, v in S.flags.items() if True in v),
                'first': {'%s:%s' % (f[0], f[1] if len(f) > 1 else ''): sp for f, sp in S.first.items()},
            }
        return out


def explain(S, fact, depth=0, seen=None, out=None):
    """How a fact first became true: its cause and, recursively, the causes of
    the conditions that cause needed."""
    seen = set() if seen is None else seen
    out = [] if out is None else out
    if fact in seen or depth > 25:
        return out
    seen.add(fact)
    pad = '  ' * depth
    if fact not in S.first:
        out.append('%s%s: never' % (pad, fact))
        return out
    c = S.cause.get(fact)
    if isinstance(c, tuple) and len(c) == 2 and isinstance(c[0], Trigger):
        t, p = c
        where = (' at (%d, %d)' % (t.obj['x'], t.obj['y'])) if t.obj else (' at (%d, %d)' % t.pos if t.pos else '')
        out.append('%s%s (step %d): %s `%s` in %s%s' % (pad, fact, S.first[fact], t.kind, t.name, t.map, where))
        explain(S, ('map', t.map), depth + 1, seen, out)
        for cond in sorted(p.conds):
            k = cond[0]
            if k in ('ev', 'fl') and cond[2]:
                explain(S, ('flag', cond[1]), depth + 1, seen, out)
            elif k in ('ev', 'fl'):
                if ('clear', cond[1]) in S.first:
                    explain(S, ('clear', cond[1]), depth + 1, seen, out)
            elif k == 'item':
                explain(S, ('item', cond[1]), depth + 1, seen, out)
    else:
        out.append('%s%s (step %d): from %s' % (pad, fact, S.first[fact], c))
        if isinstance(c, str) and c in S.w.maps:
            explain(S, ('map', c), depth + 1, seen, out)
        elif isinstance(c, str) and c.startswith('fly:'):
            explain(S, ('flag', c[4:]), depth + 1, seen, out)
    return out


def badge_battle(S, badge):
    """The badge plus the EVENT_BEAT_* flags set by the scripts that give it
    (forbidding the badge alone leaves the leader's after-battle branch)."""
    out = {badge}
    for ts in S.triggers.values():
        for t in ts:
            if any(('fl', badge, True) in p.effects for p in t.paths):
                for p in t.paths:
                    for e in p.effects:
                        if e[0] == 'ev' and e[2] and e[1].startswith('EVENT_BEAT_'):
                            out.add(e[1])
    return out


def main(argv):
    import argparse
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('repo', nargs='?', default='.')
    ap.add_argument('--start', action='append', choices=['johto', 'kanto', 'hoenn'])
    ap.add_argument('--out', help='write the Markdown report here (default: stdout)')
    ap.add_argument('--json', help='also write reached maps/items/flags as JSON (for diffs)')
    ap.add_argument('--order', action='store_true',
                    help='also work out which badges each badge needs (one extra run per badge; slow)')
    ap.add_argument('--why', action='append', metavar='FACT',
                    help='explain how a flag (EVENT_X / ENGINE_X), item or map (MAP:NAME) is first reached')
    a = ap.parse_args(argv)
    w = World(a.repo)
    setup_consts(w)
    s = Scripts(w)
    solvers = {}
    for st in a.start or ['johto', 'kanto', 'hoenn']:
        solvers[st] = Solver(w, s, st).solve()
    if a.why:
        for st, S in solvers.items():
            print('## %s start' % st.capitalize())
            for f in a.why:
                if f.startswith('MAP:'):
                    fact = ('map', f[4:])
                elif f.startswith(('EVENT_', 'ENGINE_')):
                    fact = ('flag', f)
                else:
                    fact = ('item', f)
                print('\n'.join(explain(S, fact)))
        return
    whatif = {}
    for st, S in solvers.items():
        whatif[st] = {}
        for ab in ABILITIES:
            if S.can(ab):
                continue
            W = Solver(w, s, st, grant=ABILITIES[ab][:1]).solve()
            whatif[st][ab] = {(t.map, t.kind, t.name, Report.where(None, t))
                              for ts in W.triggers.values() for t in ts if t.first is not None}
        W = Solver(w, s, st, no_npcs=True).solve()
        whatif[st]['npc'] = {(t.map, t.kind, t.name, Report.where(None, t))
                             for ts in W.triggers.values() for t in ts if t.first is not None}
        whatif[st]['npc_maps'] = set(W.reached)
    r = Report(w, s, solvers, whatif)
    if a.order:
        r.needs = {}
        for st, S in solvers.items():
            names = ['ENGINE_%sBADGE' % b for b in Report.BADGE_REGION[st]]
            needs = {n: [] for n in names}
            for b in names:
                F = Solver(w, s, st, forbid=badge_battle(S, b)).solve()
                for n in names:
                    if n != b and True in S.flags[n] and True not in F.flags[n]:
                        needs[n].append(b)
            r.needs[st] = needs
    txt = r.text()
    if a.out:
        with open(a.out, 'w', encoding='utf-8') as f:
            f.write(txt)
    else:
        print(txt)
    if a.json:
        with open(a.json, 'w') as f:
            json.dump(r.data(), f, indent=1, sort_keys=True)


if __name__ == '__main__':
    main(sys.argv[1:])
