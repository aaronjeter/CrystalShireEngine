"""Follower Pickup: after a battle the following Pokemon may pick up an item, holds it
(wFollowerPickupItem, save extension), shows an item emote on the next step / after a
map load / every 128 steps, and gives it when talked to.

usage: test_follower_pickup.py ROM SYM STATE

The 10% chance is patched in the ROM image (the `cp FOLLOWER_PICKUP_CHANCE` operand in
FollowerPickupRoll) to 100% or 0%; the roll itself is called by a script (callasm).
"""
import sys
from battle_test import Game, Battle, pocket_entries, item_pocket, item_count, POCKET_LISTS
from harness import oam

ROM, SYM, STATE = sys.argv[1:4]
RESULTS = []
LOSE, DRAW = 1, 2
EMOTE_TILE = 0xf8  # the emote's first tile (vTiles0 tile $f8)


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def chance_addr(g):
    """ROM offset of the cp operand after FollowerPickupRoll's first Random."""
    start = g.rom_addr('FollowerPickupRoll')
    rom = g.rom()
    call_random = [0xcd, g.sym['Random'][1] & 0xff, g.sym['Random'][1] >> 8]
    for i in range(start, start + 120):
        if list(rom[i:i + 3]) == call_random and rom[i + 3] == 0xfe:
            return i + 4
    raise RuntimeError('chance byte not found')


def new(chance=0xff, held=0, badges=None):
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.wr('wRepelEffect', 250)  # no wild encounters while stepping
    g.run_script('\tsetevent EVENT_TRAVEL_PROF_CALLED\n\tend')  # no professor's call on a step
    g.frames(10)
    g.poke_rom(chance_addr(g), [chance])
    g.wr('wFollowerPickupItem', [held & 0xff, held >> 8])
    if badges is not None:
        bits = (1 << badges) - 1
        g.wr('wBadges', [bits & 0xff, bits >> 8 & 0xff, bits >> 16 & 0xff])
    return g


def held(g):
    lo, hi = g.rd('wFollowerPickupItem', 2)
    return lo | hi << 8


def roll(g, result=0, battletype='BATTLETYPE_NORMAL', tower=False):
    """Call FollowerPickupRoll as it runs after a battle with wBattleResult = result."""
    g.wr('wBattleResult', result)
    g.wr('wBattleType', g.const(battletype))
    g.wr('wInBattleTowerBattle', 1 if tower else 0)
    b, a = g.sym['FollowerPickupRoll']
    g.run_script(f'\tdb callasm_command\n\tdb {b}\n\tdw {a}\n\tend')
    g.frames(4)


def step(g, key='L'):
    """One step (trying other directions if that one is blocked); True if the item emote
    showed within 90 frames of the step."""
    for k in [key] + [d for d in 'DULR' if d != key]:
        s0 = g.rd('wStepCount')
        seen = False
        g.hold(k, True)
        for f in range(90):
            g.frames(1)
            if f == 8:
                g.hold(k, False)
            if any(e[2] in range(EMOTE_TILE, EMOTE_TILE + 4) for e in oam(g)):
                seen = True
        if g.rd('wStepCount') != s0:
            return seen
    raise RuntimeError('no direction to step in')


def tables(g):
    """{name: [item indices]} of the pickup tables, read from the ROM."""
    rom = g.rom()
    out = {}
    for name in ('FollowerPickup0Badges', 'FollowerPickup4Badges', 'FollowerPickup8Badges',
                 'FollowerPickup16Badges', 'FollowerPickupRare', 'FollowerPickupStones'):
        a = g.rom_addr(name)
        n = rom[a]
        out[name] = [rom[a + 1 + 2 * i] | rom[a + 2 + 2 * i] << 8 for i in range(n)]
    return out


def case_roll_conditions():
    potion = 0
    g = new(); roll(g)
    check('roll at 100%: a won battle gives an item', held(g) != 0, hex(held(g)))
    first = held(g); roll(g)
    check('no roll while holding one', held(g) == first, hex(held(g)))
    g = new(); roll(g, DRAW)
    check('a fled battle (DRAW) rolls too', held(g) != 0)
    g = new(); roll(g, LOSE)
    check('a lost battle: no roll', held(g) == 0)
    g = new(chance=0); roll(g)
    check('roll at 0%: nothing', held(g) == 0)
    g = new(); roll(g, tower=True)
    check('Battle Tower battle: no roll', held(g) == 0)
    g = new(); roll(g, battletype='BATTLETYPE_CONTEST')
    check('Bug-Catching Contest: no roll', held(g) == 0)
    g = new(); g.wr('wOptions2', g.rd('wOptions2') | 2); roll(g)
    check('follower turned off: no roll', held(g) == 0)
    g = new(); hp = g.sym['wPartyMon1HP']
    marks = g.rd('wPartyMon1Marks')
    g.wr('wPartyMon1Marks', marks | 1)  # favorite (the follower) fainted: no follower
    g.wr('wPartyMon1HP', [0, 0]); roll(g)
    check('the follower fainted: no roll', held(g) == 0)


def case_tiers():
    g = new()
    t = tables(g)
    ok_tables = all(len(v) > 0 and all(0 < i < 0x8000 for i in v) for k, v in t.items() if k != 'FollowerPickupRare')
    check('tables read from the ROM look valid', ok_tables, {k: len(v) for k, v in t.items()})
    extra = set(t['FollowerPickupRare']) | set(t['FollowerPickupStones'])
    for badges, name in ((0, 'FollowerPickup0Badges'), (3, 'FollowerPickup0Badges'), (4, 'FollowerPickup4Badges'),
                         (8, 'FollowerPickup8Badges'), (15, 'FollowerPickup8Badges'), (16, 'FollowerPickup16Badges'),
                         (24, 'FollowerPickup16Badges')):
        g = new(badges=badges)
        got = []
        for i in range(30):
            g.wr('wFollowerPickupItem', [0, 0])
            roll(g)
            got.append(held(g))
        inside = [x for x in got if x in t[name]]
        stray = [hex(x) for x in got if x not in t[name] and x not in extra]
        check(f'{badges} badges: items come from {name} (or rare)', not stray and len(inside) >= 24,
              f'{len(inside)}/30 tier, stray {stray}')


def case_emote():
    g = new(held=g_const16('POTION'))
    g.wr('wFollowerFlags', g.rd('wFollowerFlags') & ~2)
    g.wr('wFollowerPickupSteps', 0)
    a = step(g, 'L')
    check('no emote without the pending bit (step count 1)', not a)
    g.wr('wFollowerFlags', g.rd('wFollowerFlags') | 2)
    b = step(g, 'R')
    check('pending bit: the emote shows on the next step, then the bit clears',
          b and not g.rd('wFollowerFlags') & 2, f'{b} flags={g.rd("wFollowerFlags")}')
    c = step(g, 'L')
    check('no emote on the following step', not c)
    g.wr('wFollowerPickupSteps', 127)
    d = step(g, 'R')
    check('reminder after 128 steps', d and g.rd('wFollowerPickupSteps') == 0, g.rd('wFollowerPickupSteps'))
    g.run_script('\twarp NEW_BARK_TOWN, 13, 6\n\tend'); g.frames(200)
    e = step(g, 'D')
    check('after a map load: the emote on the first step', e)
    g = new()
    g.wr('wFollowerFlags', g.rd('wFollowerFlags') | 2)
    f = step(g, 'L')
    check('nothing held: no emote even with the bit set', not f)


def talk(g):
    """Run the follower's talk script and press through it."""
    g.wr('hLastTalked', g.const('FOLLOWER_OBJECT'))
    b, a = g.sym['_FollowerScript']
    g.run_script(f'\tdb farsjump_command\n\tdb {b}\n\tdw {a}\n')
    text = []
    for _ in range(40):
        g.frames(20)
        text.append(' '.join(g.screen_text().split()))
        g.press('A', after=10)
    return ' | '.join(dict.fromkeys(text))


def case_collect():
    nugget = g_const16('NUGGET')
    g = new(held=nugget)
    before = item_count(g, 'NUGGET')
    t = talk(g)
    check('talking gives the held item and clears it', item_count(g, 'NUGGET') == before + 1 and held(g) == 0,
          f'{item_count(g, "NUGGET")} held={hex(held(g))} {t[-160:]}')
    # Pack full: fill the Treasures pocket with other items
    g = new(held=nugget)
    p, lo = item_pocket(g, 'NUGGET')
    num, lst = POCKET_LISTS[p]
    others = [x for x in range(1, 60) if x != lo][:20]
    g.wr(num, 20)
    g.wr(lst, sum(([x, 1] for x in others), []) + [0xff])
    t = talk(g)
    check('Pack full: the item stays held', held(g) == nugget and 'Pack is full' in t, t[-160:])


def case_real_battle():
    g = new()
    g.set_party([('JOLTEON', 60, None, ['THUNDERSHOCK'])])
    g.start_wild('RATTATA', 3)
    b = Battle(g, [('move', 0)] * 3)
    b.run()
    for _ in range(100):
        g.frames(10)
        if not g.in_battle():
            break
    g.frames(100)
    check('a real wild battle won: the follower picked something up', held(g) != 0, hex(held(g)))


def case_save():
    g = new(held=g_const16('PP_UP'))
    lo, hi = g.rd('wFollowerPickupItem', 2)
    ext = g.sym['wFollowerPickupItem'][1] - g.sym['wSaveExtension'][1]
    check('the held item sits in the saved extension block', 0 <= ext < 256 and (lo | hi << 8) == g_const16('PP_UP'), ext)


_g = None


def g_const16(name):
    global _g
    if _g is None:
        _g = Game(ROM, SYM, STATE)
    return _g.const16(name)


def main():
    case_roll_conditions()
    case_tiers()
    case_emote()
    case_collect()
    case_real_battle()
    case_save()
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
