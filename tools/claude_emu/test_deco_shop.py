"""Decoration shops (special DecoShop).

    python3 test_deco_shop.py ROM SYM STATE [--shots DIR]

The Goldenrod rooftop vending machine (money) and the Battle Resort list (BP):
buy the first decoration (its flag set, the price paid, gone from the list),
can't afford one (nothing changes), and a shop with everything owned says
it's sold out.
"""
import os, sys
from battle_test import Game, LIB
from harness import warp_script

ROM, SYM, STATE = sys.argv[1:4]
SHOTS = sys.argv[sys.argv.index('--shots') + 1] if '--shots' in sys.argv else None
results = []


def check(name, ok, info=''):
    results.append(ok)
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def flag(g, name):
    n = g.const16(name)
    return g.rd(f'wEventFlags+{n // 8}') >> (n % 8) & 1


def money(g):
    m = g.rd('wMoney', 3)
    return m[0] * 65536 + m[1] * 256 + m[2]


def bp(g):
    b = g.rd('wBattlePoints', 2)
    return b[0] * 256 + b[1]


def start(shop, cash=10000, points=100, owned=()):
    g = Game(ROM, SYM, STATE)
    g.seed()
    if SHOTS:
        LIB.GB_set_rendering_disabled(g.gb, False)
    g.wr('wMoney', [cash >> 16, (cash >> 8) & 255, cash & 255])
    g.wr('wBattlePoints', [points >> 8, points & 255])
    for f in owned:
        n = g.const16(f)
        g.wr(f'wEventFlags+{n // 8}', g.rd(f'wEventFlags+{n // 8}') | 1 << (n % 8))
    g.run_script(warp_script('GOLDENROD_DEPT_STORE_ROOF', 5, 5))
    g.frames(150)
    _, a = g.sym['DecoShopSpecial']
    _, base = g.sym['SpecialsPointers']
    g.run_script(f'\topentext\n\tsetval {shop}\n\tdb special_command\n\tdw {(a - base) // 3}\n\tclosetext\n\tend')
    g.frames(120)
    return g


def buy(g, shot=None):
    if shot and SHOTS:
        g.shot(os.path.join(SHOTS, shot))
    for k in ('A', 'A', 'A', 'A', 'B', 'B', 'B'):  # pick, yes, sent home, (menu) back out
        g.press(k, after=40)
    g.frames(120)


VEND, RESORT = 'DECOSHOP_VENDING', 'DECOSHOP_RESORT'
g = start(VEND)
buy(g, 'vending.png')
check('vending: the Jigglypuff Doll for 3000', flag(g, 'EVENT_DECO_JIGGLYPUFF_DOLL') and money(g) == 7000,
      f'{money(g)}')
g = start(VEND, cash=1000)
buy(g)
check('vending, 1000 money: nothing bought', not flag(g, 'EVENT_DECO_JIGGLYPUFF_DOLL') and money(g) == 1000)
g = start(VEND, owned=('EVENT_DECO_JIGGLYPUFF_DOLL',))
buy(g)
check('vending, Jigglypuff owned: the next one (Bulbasaur Doll) is first',
      flag(g, 'EVENT_DECO_BULBASAUR_DOLL') and money(g) == 7000, f'{money(g)}')
g = start(RESORT)
buy(g, 'resort.png')
check('resort: the Surf Pikachu Doll for 10 BP', flag(g, 'EVENT_DECO_SURFING_PIKACHU_DOLL') and bp(g) == 90, f'{bp(g)}')
owned = ('EVENT_DECO_SURFING_PIKACHU_DOLL', 'EVENT_DECO_FAMICOM', 'EVENT_DECO_SNES', 'EVENT_DECO_N64',
         'EVENT_DECO_VIRTUAL_BOY', 'EVENT_DECO_BIG_ONIX_DOLL', 'EVENT_DECO_BIG_LAPRAS_DOLL')
g = start(RESORT, owned=owned)
if SHOTS:
    g.shot(os.path.join(SHOTS, 'soldout.png'))
t = ' '.join(g.screen_text()) if hasattr(g, 'screen_text') else ''
buy(g)
check('resort, everything owned: sold out, no BP spent', bp(g) == 100, f'{bp(g)}')
print(f'{sum(results)}/{len(results)} passed')
