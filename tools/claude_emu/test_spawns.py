"""Overworld wild spawns (engine/overworld/wild_spawns.asm).

Warps to maps with wild Pokémon and reads the spawned map objects
(OBJECTTYPE_WILDSPAWN). For the battle cases, the player steps once and one
spawn is moved onto the tile just left (known to be walkable), standing still,
and its object struct is made (InitializeVisibleSprites); the player then turns
and walks into it, or presses A. The battle must have the spawn's level and
DVs, and the spawn must be gone after the player runs. The behavior cases put a
spawn with a given temperament 1-2 steps away in a straight line, facing the
player, and watch it.

usage: test_spawns.py ROM SYM STATE
"""
import sys
import ctypes as C
from gb import LIB
from harness import H, warp_script, at_menu
from battle_test import assemble_block, SCRIPT_ORG

ROM, SYM, STATE = sys.argv[1:4]
MOLEN = 16
OLEN = 0x28
FOLLOWER_OFF = 1 << 1
NUZLOCKE_ON = 1 << 4
OPP = {'U': 'D', 'D': 'U', 'L': 'R', 'R': 'L'}
RESULTS = []


class G(H):
    def const(self, expr):
        return assemble_block(f'\tdb {expr}', 0, SCRIPT_ORG)[0]


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def addr(g, name):
    return g.sym[name][1]


def spawns(g):
    """The spawn map objects: dicts with obj, struct, sprite, x, y, dvs, lvl, species index."""
    mo = addr(g, 'wMapObjects')
    wild = g.const('OBJECTTYPE_WILDSPAWN')
    out = []
    for i in range(1, 16):
        m = g.rd(mo + i * MOLEN, MOLEN)
        if m[1] and m[8] == wild:
            slot = m[1] - g.const('SPRITE_MON_1')
            sp = g.rd(f'wMonSpriteSpecies+{slot * 2}', 2)
            out.append(dict(obj=i, struct=m[0], sprite=m[1], y=m[2] - 4, x=m[3] - 4, dvs=(m[10], m[11]),
                            lvl=m[14], species=sp[0] | sp[1] << 8))
    return out


def setup(mapc, x, y, follower=True, state=STATE):
    g = G(ROM, None, SYM)
    g.load(state)
    o = g.rd('wOptions2') & ~FOLLOWER_OFF
    g.wr('wOptions2', o if follower else o | FOLLOWER_OFF)
    g.run_script(warp_script(mapc, x, y))
    g.frames(200)
    for _ in range(4):
        g.press('B', after=10)
    g.wr('wRepelEffect', 250)  # no grass encounters while testing
    return g


def free_spawn(g):
    """A spawn without an object struct, to be moved: an off-screen one, or one whose
    struct is deleted first (spawns are placed near the player, often on screen)."""
    off = [s for s in spawns(g) if s['struct'] == 255]
    if off:
        return off[0]
    t = spawns(g)[0]
    bk, ad = g.sym['DeleteObjectStruct']
    g.run_script(f'TestScript:\n\tcallasm TestCode\n\tend\nTestCode:\n\tld a, {t["obj"]}\n'
                 f'\trst $08\n\tdb ${bk:02x}\n\tdw ${ad:04x}\n\tret\n')
    g.frames(20)
    g.wr(addr(g, 'wObjectMasks') + t['obj'], 0)
    t['struct'] = 255
    return t


def place_next(g, shiny=False):
    """Step once; move an off-screen spawn onto the tile left behind, standing still, and
    make its object struct. Returns (spawn, the direction to face it)."""
    for d in 'DURL':
        p = (g.rd('wXCoord'), g.rd('wYCoord'))
        g.press(d, hold=10, after=24)
        if (g.rd('wXCoord'), g.rd('wYCoord')) != p:
            break
    t = free_spawn(g)
    b = addr(g, 'wMapObjects') + t['obj'] * MOLEN
    g.wr(b + 2, p[1] + 4)
    g.wr(b + 3, p[0] + 4)
    g.wr(b + 4, g.const('SPRITEMOVEDATA_STANDING_DOWN'))
    if shiny:
        slot = t['sprite'] - g.const('SPRITE_MON_1')
        a = f'wMonSpriteSpecies+{slot * 2 + 1}'
        g.wr(a, g.rd(a) | 0x80)
        g.wr(b + 11, 0xff)
        t['dvs'] = (t['dvs'][0], 0xff)
    bk, ad = g.sym['InitializeVisibleSprites']
    g.run_script(f'TestScript:\n\tdb callasm_command\n\tdb ${bk:02x}\n\tdw ${ad:04x}\n\tend')
    g.frames(60)
    return t, OPP[d]


def to_battle_menu(g):
    for _ in range(300):
        g.frames(5)
        if g.rd('wBattleMode') and at_menu(g):
            g.frames(40)
            return True
        g.press('B', hold=2, after=3)
    return False


def run_away(g):
    g.press('R', hold=2, after=10)
    g.press('D', hold=2, after=10)
    g.press('A', hold=2, after=10)
    for _ in range(200):
        g.frames(5)
        if not g.rd('wBattleMode'):
            break
        g.press('B', hold=2, after=3)
    g.frames(120)


def case_battle(mapc, x, y, how, shiny=False):
    g = setup(mapc, x, y, follower=False)
    t, d = place_next(g, shiny)
    if how == 'A':
        g.press(d, hold=2, after=16)
        g.press('A', hold=2, after=10)
    else:
        g.press(d, hold=10, after=10)
    label = f'{mapc} {how}' + (' shiny' if shiny else '')
    if not to_battle_menu(g):
        check(f'{label}: battle starts', False)
        return
    dv = tuple(g.rd('wEnemyMonDVs', 2))
    lvl = g.rd('wEnemyMonLevel')
    # a non-shiny may get type colors in battle (its spd/spc DV becomes HP_SPDSPC_DV)
    check(f'{label}: battle has the spawn\'s DVs and level', (dv == t['dvs'] or dv[1] == 0xfe) and lvl == t['lvl'],
          f'spawn {t["dvs"]} L{t["lvl"]}, battle {dv} L{lvl}')
    run_away(g)
    m = g.rd(addr(g, 'wMapObjects') + t['obj'] * MOLEN, 2)
    check(f'{label}: spawn removed after the battle', m[1] == 0 and g.rd('wWildSpawnBattle') == 0,
          f'slot {list(m)}, {len(spawns(g))} left')


def case_counts():
    # Union Cave 1F: 9 objects near the entrance, so 3 spawns fill the object structs
    for mapc, x, y, want in (('ROUTE_29', 20, 10, 3), ('UNION_CAVE_1F', 5, 19, 3), ('ICE_PATH_1F', 4, 18, 5),
                             ('ROUTE_101', 10, 10, 3), ('ILEX_FOREST', 3, 40, 1), ('ROUTE_30', 7, 30, 0),
                             ('NEW_BARK_TOWN', 10, 10, 0)):
        g = setup(mapc, x, y)
        s = spawns(g)
        check(f'{mapc}: {want} spawn(s)', len(s) == want, str([(d['x'], d['y'], d['species']) for d in s]))
        # spawns sharing a sprite slot look alike: a shiny slot only holds shinies
        same = all((d['species'] >> 15) == (d['dvs'][1] == 0xff) for d in s)
        check(f'{mapc}: every spawn matches its sprite slot (shiny or not)', same)


def case_nuzlocke():
    g = setup('ROUTE_29', 20, 10, follower=False)
    g.wr('wOptions2', g.rd('wOptions2') | NUZLOCKE_ON)
    a0 = list(g.rd('wNuzlockeAreaFlags', 12))
    t, d = place_next(g)
    g.press(d, hold=10, after=10)
    to_battle_menu(g)
    enc = g.rd('wNuzlockeEncounter')
    check('Nuzlocke: a spawn is the area\'s catchable encounter', enc == g.const('NUZLOCKE_CATCHABLE') and
          list(g.rd('wNuzlockeAreaFlags', 12)) != a0, f'enc={enc}')


def case_topup():
    """Until a map has been full, a spawn comes in every WILD_SPAWN_TOPUP_STEPS steps."""
    g = setup('ROUTE_29', 20, 10, follower=False)
    t, d = place_next(g)
    g.press(d, hold=10, after=10)
    to_battle_menu(g)
    run_away(g)
    left = [x['obj'] for x in spawns(g)]
    g.wr('wWildSpawnSteps', 15)  # not filled yet, WILD_SPAWN_TOPUP_STEPS - 1
    for dd in 'LRUD':
        p = (g.rd('wXCoord'), g.rd('wYCoord'))
        g.press(dd, hold=10, after=24)
        if (g.rd('wXCoord'), g.rd('wYCoord')) != p:
            break
    for _ in range(12):
        new = [x for x in spawns(g) if x['obj'] not in left]
        if new:
            break
        g.frames(10)
    check('top-up: a map not yet full gets a spawn after the shorter step count', len(new) == 1,
          f'{len(spawns(g))} spawns, filled bit {g.rd("wWildSpawnSteps") >> 7}')


def case_continue():
    g = setup('ROUTE_29', 20, 10)
    n = len(spawns(g))
    g.press('START', after=40)
    for _ in range(10):
        if g.rd('wMenuCursorY') == 6:  # Save
            break
        g.press('D', after=12)
    g.press('A', after=60)
    for _ in range(12):
        g.press('A', after=60)
    g.frames(200)
    size = C.c_size_t()
    bank = C.c_uint16()
    p = LIB.GB_get_direct_access(g.gb, 2, C.byref(size), C.byref(bank))
    sav = '/tmp/test_spawns.sav'
    open(sav, 'wb').write(bytes((C.c_uint8 * size.value).from_address(p)))
    g2 = G(ROM, sav, SYM)
    g2.frames(400)
    for _ in range(14):
        g2.press('A', after=50)
    g2.frames(200)
    same_map = (g2.rd('wMapGroup'), g2.rd('wMapNumber')) == (g.rd('wMapGroup'), g.rd('wMapNumber'))
    check('Continue: saved spawns are removed', n > 0 and same_map and spawns(g2) == [], f'{n} before saving')


DIRV = {'D': 0, 'U': 1, 'L': 2, 'R': 3}
WANDERER, SKITTISH, AGGRESSIVE, SLEEPY = range(4)


def place_line(g, temper, dist=2):
    """Walk `dist` steps in a line; put a spawn with temperament `temper` on the start
    tile, facing the player. Returns (spawn, the direction walked)."""
    for d in 'LRUD':
        p = (g.rd('wXCoord'), g.rd('wYCoord'))
        n = 0
        for _ in range(dist):
            q = (g.rd('wXCoord'), g.rd('wYCoord'))
            g.press(d, hold=10, after=24)
            if (g.rd('wXCoord'), g.rd('wYCoord')) != q:
                n += 1
        if n == dist:
            break
        for _ in range(n):
            g.press(OPP[d], hold=10, after=24)
    t = free_spawn(g)
    b = addr(g, 'wMapObjects') + t['obj'] * MOLEN
    g.wr(b + 2, p[1] + 4)
    g.wr(b + 3, p[0] + 4)
    g.wr(b + 15, temper)  # MAPOBJECT_SPAWN_STATE
    bk, ad = g.sym['InitializeVisibleSprites']
    g.run_script(f'TestScript:\n\tdb callasm_command\n\tdb ${bk:02x}\n\tdw ${ad:04x}\n\tend')
    for _ in range(120):  # turn it toward the player as soon as its struct exists
        g.frames(1)
        if 0 < g.rd(b) < 13:
            break
    t['st'] = addr(g, 'wObjectStructs') + g.rd(b) * OLEN
    t['b'] = b
    g.wr(t['st'] + 8, DIRV[d] << 2)  # OBJECT_DIRECTION
    g.frames(30)
    return t, d


def pos(g, t):
    return g.rd(t['st'] + 0x10) - 4, g.rd(t['st'] + 0x11) - 4


def manhattan(g, t):
    x, y = pos(g, t)
    return abs(x - g.rd('wXCoord')) + abs(y - g.rd('wYCoord'))


def watch(g, frames):
    """Run up to `frames` frames; True if a battle started."""
    for _ in range(frames // 10):
        g.frames(10)
        if g.rd('wBattleMode'):
            return True
    return False


def case_behaviors():
    # it may wander out of line before it sees the player: up to 3 tries
    for i in range(3):
        g = setup('ROUTE_29', 20, 10, follower=False)
        g.frames(i * 37)
        g.wr('wRepelEffect', 0)
        t, d = place_line(g, AGGRESSIVE)
        charged = watch(g, 1500)
        if charged:
            break
    check('aggressive: sees the player in line and charges into a battle', charged)
    g = setup('ROUTE_29', 20, 10, follower=False)
    t, d = place_line(g, AGGRESSIVE)
    charging = False
    for _ in range(60):  # it may still wander into the player: only charging counts
        g.frames(10)
        if g.rd('wBattleMode'):
            break
        charging |= bool(g.rd(t['b'] + 15) & 8) or g.rd('wWildSpawnSpotted') != 0
    check('aggressive weaker than the lead, with a Repel: never charges', not charging)
    g = setup('ROUTE_29', 20, 10, follower=False)
    t, d = place_line(g, SLEEPY)
    p0 = pos(g, t)
    check('sleepy: still while the player is 2 steps away', not watch(g, 400) and pos(g, t) == p0)
    g.press(OPP[d], hold=10, after=24)
    woke = False
    for _ in range(30):  # once awake it may walk into the player at once
        g.frames(10)
        if g.rd('wBattleMode'):
            break
        woke |= g.rd(t['b'] + 15) & 4 != 0
    check('sleepy: wakes up when the player is next to it', woke)
    g = setup('ROUTE_29', 20, 10, follower=False)
    t, d = place_line(g, SKITTISH)
    m0 = manhattan(g, t)
    check('skittish: moves away from the player', not watch(g, 800) and manhattan(g, t) > m0,
          f'{m0} -> {manhattan(g, t)}')
    g = setup('ROUTE_29', 20, 10, follower=False)
    t, d = place_line(g, WANDERER, dist=1)
    check('wanderer next to the player: walks into them (a battle)', watch(g, 4000))


def case_respawn():
    """Every WILD_SPAWN_RESPAWN_STEPS steps a map below the cap gets a new spawn, off
    screen, in the freed sprite slot."""
    g = setup('ROUTE_29', 20, 10, follower=False)
    t, d = place_next(g)
    g.press(d, hold=10, after=10)
    to_battle_menu(g)
    run_away(g)
    left = [x['obj'] for x in spawns(g)]
    steps = g.rd('wWildSpawnSteps')
    # full since arrival (WILD_SPAWN_FILLED_F): no top-up after WILD_SPAWN_TOPUP_STEPS
    g.wr('wWildSpawnSteps', 0x80 | 15)
    for dd in 'LRUD':
        p = (g.rd('wXCoord'), g.rd('wYCoord'))
        g.press(dd, hold=10, after=60)
        if (g.rd('wXCoord'), g.rd('wYCoord')) != p:
            break
    check('respawn: a map that was full waits the full step count', steps & 0x80 and
          len(spawns(g)) == len(left), f'steps {steps:02x}, {len(spawns(g))} spawns')
    left = [x['obj'] for x in spawns(g)]
    g.wr('wWildSpawnSteps', 0x80 | 63)  # WILD_SPAWN_RESPAWN_STEPS - 1
    for dd in 'LRUD':
        p = (g.rd('wXCoord'), g.rd('wYCoord'))
        g.press(dd, hold=10, after=24)
        if (g.rd('wXCoord'), g.rd('wYCoord')) != p:
            break
    for _ in range(12):  # the respawn comes in when the step's done
        now = spawns(g)
        new = [x for x in now if x['obj'] not in left]
        if new:
            break
        g.frames(10)
    px, py = g.rd('wXCoord'), g.rd('wYCoord')
    check('respawn: a new spawn after the step count, off screen, in the freed sprite slot',
          len(now) == 3 and len(new) == 1 and new[0]['sprite'] == t['sprite'] and
          max(abs(new[0]['x'] - px), abs(new[0]['y'] - py)) >= 6, str(new))


def main():
    case_counts()
    for mapc, x, y in (('ROUTE_29', 20, 10), ('UNION_CAVE_1F', 5, 19), ('ROUTE_101', 10, 10)):
        case_battle(mapc, x, y, 'bump')
        case_battle(mapc, x, y, 'A')
    case_battle('ROUTE_29', 20, 10, 'bump', shiny=True)
    case_behaviors()
    case_respawn()
    case_topup()
    case_nuzlocke()
    case_continue()
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
