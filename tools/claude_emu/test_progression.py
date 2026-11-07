#!/usr/bin/env python3
"""Progression gate probes: checks the static progression checker's rules in the game.

Each probe sets up a state (event and engine flags, items, map scenes), warps
next to a gate, walks a path planned on the static checker's tile model and
checks where the player ends up (or a flag a script should set). Most gates run
twice: with their prerequisite (the gate must open) and without it (it must
stay shut).

Field-move sites are found in the map data, not hard-coded: the first map with a
Cut tree, water edge, whirlpool, waterfall, smashable rock or Strength boulder
the walker can stand next to.

Usage: python3 test_progression.py ROM.gbc ROM.sym STATE [probe ...]
       (needs CSE=<repo>; `list` prints the probe names)
"""

import os
import sys
from collections import deque

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(HERE)))

from harness import H, warp_script  # noqa: E402
import progression_check as pc  # noqa: E402

REPO = os.environ.get('CSE', os.path.dirname(os.path.dirname(HERE)))
DIRKEY = {'up': 'U', 'down': 'D', 'left': 'L', 'right': 'R'}
ALL_FIELD_ITEMS = ('HATCHET', 'FLIPPERS', 'PICKAXE', 'HM_STRENGTH', 'HM_WHIRLPOOL', 'HM_WATERFALL')


# ---------------------------------------------------------------------------
# Static model: map ids, paths
# ---------------------------------------------------------------------------

class Model:
    def __init__(self, repo):
        self.w = pc.World(repo)
        pc.setup_consts(self.w)
        self.s = pc.Scripts(self.w)
        self.ids = {}
        group = num = 0
        for line in pc.logical_lines(os.path.join(repo, 'constants/map_constants.asm')):
            st = line.strip()
            if st.startswith('newgroup'):
                group += 1
                num = 0
            elif st.startswith('map_const'):
                num += 1
                self.ids[st.split()[1].rstrip(',')] = (group, num)
        self.byid = {v: k for k, v in self.ids.items()}
        # a solver used only for its tile rules
        self.S = pc.Solver(self.w, self.s, 'johto', no_npcs=True)

    def rules(self, items):
        self.S.items = set(items)
        return self.S

    def kind_at(self, mc, x, y):
        cs = self.S.coll_at(mc, x, y)
        return cs[0] if cs else None

    def path(self, mc, start, goal, items, avoid=()):
        """Moves from start to goal on one map (ledges included), or None."""
        S = self.rules(items)
        mp = self.w.maps[mc]
        W, Hh = 2 * mp['w'], 2 * mp['h']
        avoid = set(avoid) | (self.blockers(mc) - {goal})
        prev = {start: None}
        q = deque([start])
        while q:
            x, y = q.popleft()
            if (x, y) == goal:
                break
            here = S.coll_at(mc, x, y) or [0]
            for d, (dx, dy) in pc.DIRS.items():
                c = here[0]
                if (c & 0xf0) == 0xa0:
                    dirs = ['right', 'left', 'up', 'down', 'right down', 'down left',
                            'up right', 'up left'][c & 7].split()
                    if d in dirs:
                        t = (x + 2 * dx, y + 2 * dy)
                        tc = S.coll_at(mc, *t)
                        if tc and S.can_enter(tc, d) and t not in prev:
                            prev[t] = ((x, y), d)
                            q.append(t)
                        continue
                if S.side_blocks_leaving(c, d):
                    continue
                t = (x + dx, y + dy)
                if not (0 <= t[0] < W and 0 <= t[1] < Hh) or t in prev or t in avoid:
                    continue
                tc = S.coll_at(mc, *t)
                if S.side_blocks_entering(tc[0], d) or not S.can_enter(tc, d):
                    continue
                t = S.slide(mc, t[0], t[1], d, self.blockers(mc))
                if t in prev:
                    continue
                prev[t] = ((x, y), d)
                q.append(t)
        if goal not in prev:
            return None
        out = []
        p = goal
        while prev[p] is not None:
            p, d = prev[p]
            out.append(d)
        return out[::-1]

    def trainer_flags(self, mc):
        """The EVENT_BEAT_* flags of a map's trainers (set them so trainers don't stop the walk)."""
        out = []
        for o in self.w.maps[mc]['objects']:
            if o['type'] == 'OBJECTTYPE_TRAINER':
                a = self.S.data_line(o['script'], 'trainer')
                if a:
                    out.append(a[2])
        return out

    def blockers(self, mc):
        """Tiles of standing objects (they stop a slide on ice)."""
        return {(o['x'], o['y']) for o in self.w.maps[mc]['objects']
                if any(k in o['move'] for k in pc.STATIONARY)}

    def objects_at(self, mc):
        return {(o['x'], o['y']): o for o in self.w.maps[mc]['objects']}

    def warp_tiles(self, mc):
        mp = self.w.maps[mc]
        return {(wp['x'], wp['y']) for wp in mp['warps']} | {(c['x'], c['y']) for c in mp['coords']}

    def find_site(self, kind, skip=0):
        """(map, stand tile, facing direction, target tile, extra moves) for a field obstacle."""
        w = self.w
        found = 0
        coll = w.coll
        for mc, mp in w.maps.items():
            if mp['blocks'] is None or mp['tileset'] not in w.tileset_coll or not mp['file']:
                continue
            if mp['region'] not in ('johto', 'kanto', 'hoenn'):
                continue
            W, Hh = 2 * mp['w'], 2 * mp['h']
            objs = self.objects_at(mc)
            bad = self.warp_tiles(mc) | set(objs)
            for y in range(1, Hh - 1):
                for x in range(1, W - 1):
                    c = self.kind_at(mc, x, y)
                    o = objs.get((x, y))
                    is_kind = {
                        'cut': c == coll['COLL_CUT_TREE'],
                        'surf': c == coll['COLL_WATER'],
                        'whirlpool': c == coll['COLL_WHIRLPOOL'],
                        'waterfall': c == coll['COLL_WATERFALL'],
                        'rocksmash': o is not None and 'SMASHABLE_ROCK' in o['move'] and o['flag'] == '-1'
                                     and o['h1'] == '-1',
                        'strength': o is not None and 'STRENGTH_BOULDER' in o['move'] and o['flag'] == '-1'
                                    and o['h1'] == '-1',
                    }[kind]
                    if not is_kind:
                        continue
                    for d, (dx, dy) in pc.DIRS.items():
                        # stand at (sx, sy), facing d toward the obstacle
                        sx, sy = x - dx, y - dy
                        if (sx, sy) in bad:
                            continue
                        sc = self.kind_at(mc, sx, sy)
                        if sc is None:
                            continue
                        if kind == 'waterfall' and d != 'up':
                            continue
                        if kind in ('whirlpool', 'waterfall'):
                            # stand on water next to land: surf onto it first
                            if sc != coll['COLL_WATER']:
                                continue
                            land = None
                            for r in range(1, 7):
                                cands = [(lx, ly) for lx in range(sx - r, sx + r + 1) for ly in range(sy - r, sy + r + 1)
                                         if max(abs(lx - sx), abs(ly - sy)) == r]
                                for (lx, ly) in cands:
                                    lc = self.kind_at(mc, lx, ly)
                                    if lc != coll['COLL_FLOOR'] or (lx, ly) in bad:
                                        continue
                                    p = self.path(mc, (lx, ly), (sx, sy), ('FLIPPERS',), avoid={(x, y)})
                                    if p and len(p) <= 12:
                                        land = ((lx, ly), p)
                                        break
                                if land:
                                    break
                            if not land:
                                continue
                            if found < skip:
                                found += 1
                                continue
                            return mc, land[0], d, (x, y), land[1]
                        if sc != coll['COLL_FLOOR']:
                            continue
                        if kind == 'strength':
                            bc = self.kind_at(mc, x + dx, y + dy)
                            if bc != coll['COLL_FLOOR'] or (x + dx, y + dy) in bad:
                                continue
                        if found < skip:
                            found += 1
                            continue
                        return mc, (sx, sy), d, (x, y), []
        return None


# ---------------------------------------------------------------------------
# Game driving
# ---------------------------------------------------------------------------

class Game(H):
    def __init__(self, rom, sym, state, model):
        H.__init__(self, rom, None, sym)
        self.load(state)
        self.m = model
        self.sym = {}
        for line in open(sym):
            p = line.split()
            if len(p) == 2 and ':' in p[0]:
                b, a = p[0].split(':')
                self.sym[p[1]] = (int(b, 16), int(a, 16))

    def where(self):
        return (self.rd('wMapGroup'), self.rd('wMapNumber'), self.rd('wXCoord'), self.rd('wYCoord'))

    def map_name(self):
        return self.m.byid.get(self.where()[:2], '?')

    def text_rows(self):
        return [r.strip() for r in self.screen_text().split('\n')[12:18] if r.strip()]

    def script(self, body, wait=40):
        self.run_script(body + '\n\tend')
        self.frames(wait)
        self.settle()

    def settle(self, limit=40):
        """Press A/B through text until the text box is gone."""
        for _ in range(limit):
            self.frames(20)
            if not self.text_rows():
                self.frames(10)
                if not self.text_rows():
                    return
            self.press('A', after=30)

    def setup(self, items=(), set_ev=(), clear_ev=(), set_fl=(), clear_fl=(), scenes=()):
        """Flags, items and scenes, in chunks that fit the script area."""
        cmds = ['\tsetevent %s' % e for e in set_ev] + ['\tclearevent %s' % e for e in clear_ev]
        cmds += ['\tsetflag %s' % e for e in set_fl] + ['\tclearflag %s' % e for e in clear_fl]
        cmds += ['\tsetmapscene %s, %d' % (m, self.m.w.scene_value(sc)) for m, sc in scenes]
        cmds += ['\tgiveitem %s' % i for i in items]
        for i in range(0, len(cmds), 6):
            self.script('\n'.join(cmds[i:i + 6]), wait=20)

    def take_field_items(self):
        """Empty the TM/HM, item and key item pockets (the boot save has the field items)."""
        n = self.sym['wNumItems'][1] - self.sym['wTMsHMs'][1]
        self.wr('wTMsHMs', [0] * n)
        self.wr('wNumItems', 0)
        self.wr('wItems', [0xFF, 0xFF, 0xFF])
        self.wr('wNumKeyItems', 0)
        self.wr('wKeyItems', [0xFF])

    def warp(self, mc, x, y):
        self.run_script(warp_script(mc, x, y))
        self.frames(220)
        self.settle()
        return self.where()[2:] == (x, y) and self.map_name() == mc

    def face(self, d):
        self.press(DIRKEY[d], hold=2, after=20)

    def step(self, d):
        """One step: a short tap turns the player, an 8-frame hold makes one step."""
        p = self.where()
        self.press(DIRKEY[d], hold=2, after=10)
        for _ in range(2):
            self.press(DIRKEY[d], hold=8, after=4)
            for _ in range(90):
                self.frames(1)
                if self.where() != p:
                    break
            self.frames(30)
            while self.where() != p:
                # still sliding on ice or warping: wait until it settles
                q = self.where()
                self.frames(16)
                if self.where() == q:
                    break
            if self.where() != p:
                return True
        return False

    def walk(self, moves):
        """Walk a planned path; a step that fails gets one try with A first
        (to start surfing onto water)."""
        for d in moves:
            if not self.step(d):
                self.settle()
                self.interact(d)
                if not self.step(d):
                    self.settle()
                    return False
        return True

    def walk_to(self, mc, goal, items, limit=200):
        """Walk to a tile of mc (or through it, for a warp or a map edge), planning
        again from wherever each step ends. True once on goal or off mc."""
        for _ in range(limit):
            if self.map_name() != mc:
                return True
            here = self.where()[2:]
            if here == goal:
                return True
            moves = self.m.path(mc, here, goal, items)
            if not moves:
                return False
            d = moves[0]
            if not self.step(d):
                self.settle()
                self.interact(d)
                if not self.step(d):
                    self.settle()
                    return False
        return False

    def interact(self, d):
        self.face(d)
        self.press('A', after=40)
        self.settle()

    def flag(self, name, engine=True):
        """Read an event or engine flag through a script."""
        self.script('\tsetval 0\n\t%s %s' % ('checkflag' if engine else 'checkevent', name), wait=10)
        return self.rd('wScriptVar') != 0


# ---------------------------------------------------------------------------
# Probes
# ---------------------------------------------------------------------------

FIELD = {
    # kind: (items that should open it, items always given)
    'cut': ([('HATCHET',), ('HM_CUT',)], ()),
    'surf': ([('FLIPPERS',), ('HM_SURF',)], ()),
    'rocksmash': ([('PICKAXE',), ('TM_ROCK_SMASH',)], ()),
    'strength': ([('HM_STRENGTH',)], ()),
    'whirlpool': ([('HM_WHIRLPOOL',)], ('FLIPPERS',)),
    'waterfall': ([('HM_WATERFALL',)], ('FLIPPERS',)),
}


def field_probe(rom, sym, state, model, kind):
    site = model.find_site(kind)
    if site is None:
        return [(kind, 'SKIP', 'no site found')]
    mc, (sx, sy), d, (tx, ty), pre = site
    opens, always = FIELD[kind]
    beaten = model.trainer_flags(mc)
    out = []
    for items in opens + [()]:
        g = Game(rom, sym, state, model)
        g.take_field_items()
        g.setup(items=tuple(always) + tuple(items), set_ev=beaten)
        if not g.warp(mc, sx, sy):
            out.append(('%s %s' % (kind, '+'.join(items) or 'none'), 'FAIL', 'warp to %s (%d, %d) failed: at %s %s'
                        % (mc, sx, sy, g.map_name(), g.where()[2:])))
            continue
        ok = g.walk(pre)
        if pre:
            cur = g.where()[2:]
        else:
            cur = (sx, sy)
        dx, dy = pc.DIRS[d]
        beyond = (tx + dx, ty + dy)
        # past the obstacle if that tile is open (a whirlpool bounce can't fake it)
        need_beyond = kind in ('cut', 'rocksmash', 'whirlpool', 'surf') and \
            model.path(mc, (tx, ty), beyond, ALL_FIELD_ITEMS + ('FLIPPERS',)) == [d]
        goal = beyond if need_beyond else (tx, ty)
        if kind == 'waterfall':
            goal = (cur[0], cur[1] - 1)  # anywhere above the start counts
        for attempt in range(2):
            if kind == 'surf':
                if not g.step(d):
                    g.interact(d)
                    g.step(d)
            else:
                g.interact(d)
                g.frames(60)
                g.step(d)
            if need_beyond and g.where()[2:] == (tx, ty):
                g.step(d)
            g.frames(90)
            if g.where()[2:] == goal or (kind == 'waterfall' and g.where()[3] < cur[1]):
                break
        end = g.where()
        reached = end[2:] == goal and g.map_name() == mc
        if kind == 'waterfall':
            reached = end[3] < cur[1] and g.map_name() == mc
        want = bool(items)
        status = 'PASS' if reached == want else 'FAIL'
        out.append(('%s %s' % (kind, '+'.join(items) or 'none'), status,
                    '%s from (%d, %d) %s toward (%d, %d): %s at (%d, %d)%s' % (
                        mc, cur[0], cur[1], d, goal[0], goal[1], 'passed' if reached else 'blocked', end[2], end[3],
                        '' if status == 'PASS' else ' (expected %s)' % ('to pass' if want else 'to be blocked'))))
    return out


def path_probe(g, mc, start, goal_map, goal=None, moves=None, items=ALL_FIELD_ITEMS):
    """Warp to start and walk toward goal (a tile on mc, then one more step
    into goal_map if it differs). True if the player ends on goal_map
    (and the goal tile, for the same map)."""
    if not g.warp(mc, *start):
        return None, 'warp failed (at %s %s)' % (g.map_name(), g.where()[2:])
    if moves is None:
        moves = g.m.path(mc, start, goal, items)
        if moves is None:
            return None, 'no path in the static model'
    g.walk(moves)
    end = g.where()
    ok = g.map_name() == goal_map and (goal_map != mc or goal is None or end[2:] == goal)
    return ok, '%s (%d, %d)' % (g.map_name(), end[2], end[3])


STARTS = {'johto': 'NEW_BARK_TOWN', 'kanto': 'PALLET_TOWN', 'hoenn': 'LITTLEROOT_TOWN'}


def story_probes(rom, sym, state, model):
    out = []

    def game():
        return Game(rom, sym, state, model)

    # 1. The house door leads to the start region's town
    for st, town in STARTS.items():
        g = game()
        others = ['EVENT_START_' + o.upper() for o in STARTS if o != st]
        g.setup(set_ev=['EVENT_START_' + st.upper()], clear_ev=others)
        ok, where = path_probe(g, 'PLAYERS_HOUSE_1F', (6, 6), town, moves=['down', 'down'])
        out.append(('house exit %s' % st, 'PASS' if ok else 'FAIL', 'ends in %s (expected %s)' % (where, town)))

    # 2. Sudowoodo blocks Route 36 from Violet's side unless it's gone
    for gone in (False, True):
        g = game()
        g.setup(**({'set_ev': ['EVENT_ROUTE_36_SUDOWOODO']} if gone else {'clear_ev': ['EVENT_ROUTE_36_SUDOWOODO']}))
        ok, where = path_probe(g, 'ROUTE_36', (38, 9), 'ROUTE_36', moves=['left'] * 4)
        end = g.where()[2:]
        passed = end[0] <= 35
        out.append(('sudowoodo %s' % ('gone' if gone else 'there'), 'PASS' if passed == gone else 'FAIL',
                    'from (38, 9) left: at %s' % (end,)))

    # 3. Route 36 west of Sudowoodo leads north to Route 37 (no SquirtBottle needed)
    g = game()
    g.setup(clear_ev=['EVENT_ROUTE_36_SUDOWOODO'])
    moves = model.path('ROUTE_36', (33, 12), (28, 0), ())
    ok, where = path_probe(g, 'ROUTE_36', (33, 12), 'ROUTE_37', moves=(moves or []) + ['up'])
    out.append(('route 36 west to route 37', 'PASS' if ok else 'FAIL',
                'ends in %s; the static checker says Route 37 is open from here' % where))

    # 4. Route 32's guard pushes the player back in his scene
    for scene in ('SCENE_ROUTE32_COOLTRAINER_M_BLOCKS', 'SCENE_ROUTE32_NOOP'):
        g = game()
        g.setup(scenes=[('ROUTE_32', scene)], set_ev=['EVENT_START_JOHTO'],
                clear_ev=['EVENT_START_KANTO', 'EVENT_START_HOENN'])
        ok, where = path_probe(g, 'ROUTE_32', (18, 6), 'ROUTE_32', moves=['down'] * 4)
        y = g.where()[3]
        blocks = scene.endswith('BLOCKS')
        passed = y >= 10
        out.append(('route 32 guard %s' % ('scene on' if blocks else 'scene off'),
                    'PASS' if passed != blocks else 'FAIL', 'from (18, 6) down: at %s' % where))

    # 5. Mahogany Gym: the fisher at the door
    for flag_set in (False, True):
        g = game()
        g.setup(**({'set_ev': ['EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM']} if flag_set else
                   {'clear_ev': ['EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM']}))
        moves = model.path('MAHOGANY_TOWN', (15, 14), (6, 14), ())
        ok, where = path_probe(g, 'MAHOGANY_TOWN', (15, 14), 'MAHOGANY_GYM', moves=(moves or []) + ['up'])
        out.append(('mahogany gym door %s' % ('open' if flag_set else 'blocked'),
                    'PASS' if bool(ok) == flag_set else 'FAIL', 'ends in %s' % where))

    # 6. Rain Badge: from Sootopolis's fly landing into the gym and up to Wallace
    spawn = model.w.spawn_by_name['SPAWN_SOOTOPOLIS']
    door = next(wp for wp in model.w.maps['SOOTOPOLIS_CITY']['warps'] if wp['map'] == 'SOOTOPOLIS_GYM')
    wallace = next(o for o in model.w.maps['SOOTOPOLIS_GYM']['objects'] if o['script'] == 'SootopolisGymWallaceScript')
    below = (wallace['x'], wallace['y'] + 1)
    for items in (('FLIPPERS',), ()):
        g = game()
        g.take_field_items()
        g.setup(items=items, set_ev=model.trainer_flags('SOOTOPOLIS_GYM'))
        expect = model.path('SOOTOPOLIS_CITY', spawn[1:], (door['x'], door['y']), items) is not None
        g.warp('SOOTOPOLIS_CITY', *spawn[1:])
        g.walk_to('SOOTOPOLIS_CITY', (door['x'], door['y']), ('FLIPPERS',))
        g.frames(60)
        ok = g.map_name() == 'SOOTOPOLIS_GYM'
        where = '%s %s' % (g.map_name(), g.where()[2:])
        fought = False
        if ok:
            g.walk_to('SOOTOPOLIS_GYM', below, ())
            g.face('up')
            g.press('A', after=60)
            for _ in range(40):
                g.press('A', after=30)
                if g.in_battle():
                    fought = True
                    break
            where = '%s %s' % (g.map_name(), g.where()[2:])
        name = 'rain badge %s' % ('+'.join(items) or 'no items')
        out.append((name, 'PASS' if fought == expect else 'FAIL',
                    'from the fly landing %s: %s; ends at %s (the static checker says %s)' % (
                        spawn[1:], 'battle with Wallace started' if fought else 'no battle', where,
                        'reachable' if expect else 'Surf is needed')))

    # 7. Lilycove roof binoculars give the Sootopolis fly point
    g = game()
    g.setup(clear_fl=['ENGINE_FLYPOINT_SOOTOPOLIS'])
    before = g.flag('ENGINE_FLYPOINT_SOOTOPOLIS')
    if g.warp('LILYCOVE_DEPT_STORE_ROOF', 14, 5):
        g.interact('right')
        after = g.flag('ENGINE_FLYPOINT_SOOTOPOLIS')
        out.append(('lilycove binoculars', 'PASS' if (not before and after) else 'FAIL',
                    'Sootopolis fly point before %s, after %s (the static checker says the binoculars set it)'
                    % (before, after)))
    else:
        out.append(('lilycove binoculars', 'FAIL', 'warp failed'))
    return out


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    rom, sym, state = argv[:3]
    only = argv[3:]
    model = Model(REPO)
    names = ['field:' + k for k in FIELD] + ['story']
    if only == ['list']:
        print('\n'.join(names))
        return 0
    results = []
    for k in FIELD:
        if not only or 'field:' + k in only or k in only:
            results += field_probe(rom, sym, state, model, k)
            for r in results[-len(FIELD[k][0]) - 1:]:
                print('%-28s %s  %s' % r, flush=True)
    if not only or 'story' in only:
        for r in story_probes(rom, sym, state, model):
            results.append(r)
            print('%-28s %s  %s' % r, flush=True)
    fails = [r for r in results if r[1] == 'FAIL']
    print('FAILS: %d of %d' % (len(fails), len(results)))
    return 1 if fails else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
