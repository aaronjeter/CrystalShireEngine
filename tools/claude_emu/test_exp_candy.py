"""Exp. Candies (engine/items/exp_candy.asm) and Rare Candy, used from the Pack.

A Machop (Medium Slow; a move every 3 levels, evolves at 28) is the only party
Pokémon. Each case sets its level, EXP and moves, sets wLevelCap, gives one
candy and uses it through START > Pack > Use.

usage: test_exp_candy.py ROM SYM STATE
"""
import sys
from test_facility import G, check, RESULTS

ROM, SYM, STATE = sys.argv[1:4]


def ms(n):
    """Medium Slow EXP at level n (the game's formula)."""
    return 0 if n == 1 else (6 * n ** 3) // 5 - 15 * n * n + 100 * n - 140


def main():
    g = G(ROM, None, SYM)
    g.load(STATE)
    g.frames(30)
    g.wr('wPartyCount', 0)
    g.wr('wPartySpecies', 0xff)
    g.script('\tgivepoke MACHOP, 13', 60)
    for _ in range(6):
        g.press('B', after=20)
    check('setup: one Machop', g.rd('wPartyCount') == 1)
    base = '/tmp/candy_base.state'
    g.save(base)
    off = {k: g.const(k) for k in ('MON_LEVEL', 'MON_MOVES', 'MON_EXP', 'MON_SPECIES')}

    def mon(k, n=1):
        return g.rd(f'wPartyMon1+{off[k]}', n)

    def move_index(i):
        return g.rd16(f'wMoveIndexTableEntries+{(i - 1) * 2}') if i else 0

    def moves():
        # wMoveIndexTableEntries holds little-endian words; rd16 reads big-endian
        out = []
        for i in mon('MON_MOVES', 4):
            v = move_index(i)
            out.append(((v & 0xff) << 8 | v >> 8) if i else 0)
        return out

    def M(name):
        return g.const16(name)

    def species_index():
        i = mon('MON_SPECIES')
        v = g.rd16(f'wPokemonIndexTableEntries+{(i - 1) * 2}')
        return (v & 0xff) << 8 | v >> 8

    def setup(level, cap, item, exp=None):
        g.load(base)
        g.wr(f'wPartyMon1+{off["MON_LEVEL"]}', level)
        e = ms(level) if exp is None else exp
        g.wr(f'wPartyMon1+{off["MON_EXP"]}', [e >> 16, e >> 8 & 0xff, e & 0xff])
        first = mon('MON_MOVES')
        g.wr(f'wPartyMon1+{off["MON_MOVES"]}', [first, 0, 0, 0])
        g.wr('wLevelCap', cap)
        g.wr('wNumItems', [0, 0xff])
        g.script(f'\tgiveitem {item}, 2', 30)

    def use():
        """START > Pack > first item > Use > first Pokémon, then A through the texts."""
        g.press('START', after=40)
        for _ in range(8):
            if 'Contains' in g.screen_text():
                break
            g.press('D', after=15)
        g.press('A', after=90)   # the Pack, Items pocket
        g.press('A', after=30)   # the item: Use/Give/Toss/Quit
        g.press('A', after=120)  # Use: the party menu
        g.press('A', after=60)   # the first Pokémon
        for _ in range(60):
            t = g.screen_text()
            if 'Cancel' in t and 'Use' not in t and 'Give' not in t:
                break
            g.press('A', after=50)
        g.press('B', after=40)
        g.press('B', after=40)

    def count(item):
        g.script(f'\tcheckitem {item}', 10)
        if not g.rd('wScriptVar'):
            return 0
        g.script(f'\ttakeitem {item}, 2', 10)
        if g.rd('wScriptVar'):
            return 2
        return 1

    # A: within one level (30 -> 31 needs 2,534)
    setup(30, 100, 'EXP_CANDY_S')
    use()
    exp = int.from_bytes(bytes(mon('MON_EXP', 3)), 'big')
    check('S at level 30: +800 EXP, still level 30, one candy used',
          mon('MON_LEVEL') == 30 and exp == ms(30) + 800 and count('EXP_CANDY_S') == 1,
          f'level {mon("MON_LEVEL")}, exp {exp} (want {ms(30) + 800})')

    # B: several levels, the moves of every level passed
    setup(13, 100, 'EXP_CANDY_L')
    use()
    exp = int.from_bytes(bytes(mon('MON_EXP', 3)), 'big')
    mv = moves()
    want = [M('KNOCK_OFF'), M('MACH_PUNCH'), M('SCARY_FACE')]
    check('L at level 13: level 24, progress kept', mon('MON_LEVEL') == 24 and exp == ms(13) + 10000,
          f'level {mon("MON_LEVEL")}, exp {exp}')
    check('L at level 13: learned the level 16, 19 and 22 moves', mv[1:] == want, f'{mv} want {want}')

    # C: the cap reached mid-candy
    setup(13, 26, 'EXP_CANDY_XL')
    use()
    exp = int.from_bytes(bytes(mon('MON_EXP', 3)), 'big')
    check('XL with cap 26: stops at level 26 with its EXP', mon('MON_LEVEL') == 26 and exp == ms(26),
          f'level {mon("MON_LEVEL")}, exp {exp} (want {ms(26)})')

    # D: already at the cap
    setup(26, 26, 'EXP_CANDY_M')
    use()
    exp = int.from_bytes(bytes(mon('MON_EXP', 3)), 'big')
    check('M at the cap: refused, candy kept', mon('MON_LEVEL') == 26 and exp == ms(26) and count('EXP_CANDY_M') == 2,
          f'level {mon("MON_LEVEL")}, exp {exp}')

    # E: evolution at the end
    setup(27, 100, 'EXP_CANDY_M')
    use()
    check('M at level 27: level 28, learns Bullet Punch, evolves into Machoke',
          mon('MON_LEVEL') == 28 and M('BULLET_PUNCH') in moves() and species_index() == M('MACHOKE'),
          f'level {mon("MON_LEVEL")}, moves {moves()}, species {species_index()}')

    # F: Rare Candy still gives one level and that level's move
    setup(15, 100, 'RARE_CANDY', exp=ms(15) + 100)
    use()
    exp = int.from_bytes(bytes(mon('MON_EXP', 3)), 'big')
    check('Rare Candy at level 15: level 16, EXP of level 16, learns Knock Off',
          mon('MON_LEVEL') == 16 and exp == ms(16) and moves()[1] == M('KNOCK_OFF'),
          f'level {mon("MON_LEVEL")}, exp {exp}, moves {moves()}')

    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
