"""The Day-Care Egg Move tutor (special EggMoveTutor).

    python3 test_egg_move_tutor.py ROM SYM STATE

Runs the special in the Johto Day-Care with ¥10000 and presses A through it:
a first stage (Feebas) and its evolution (Milotic) learn the line's first egg
move (Hypnosis) for ¥5000; a Pokemon whose line has no egg moves (Mew) learns
nothing and pays nothing.
"""
import sys
from battle_test import Game
from harness import warp_script

ROM, SYM, STATE = sys.argv[1:4]
results = []


def run(species, level):
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.set_party([(species, level, None, ['TACKLE'])], ())
    g.wr('wMoney', [0x00, 0x27, 0x10])  # 10000
    g.run_script(warp_script('DAY_CARE', 4, 6))
    g.frames(150)
    b, a = g.sym['EggMoveTutorSpecial']
    _, base = g.sym['SpecialsPointers']
    g.run_script(f'\topentext\n\tdb special_command\n\tdw {(a - base) // 3}\n\twaitbutton\n\tclosetext\n\tend')
    for _ in range(14):
        g.frames(40)
        g.press('A', after=20)
    g.frames(120)
    out = []
    for i in g.rd('wPartyMon1Moves', 4):
        v = g.rd16(f'wMoveIndexTableEntries+{(i - 1) * 2}') if i else 0
        out.append(((v & 0xff) << 8 | v >> 8) if i else 0)
    m = g.rd('wMoney', 3)
    return g, out, m[0] * 65536 + m[1] * 256 + m[2]


def check(name, ok, info=''):
    results.append(ok)
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


for sp, lv in (('FEEBAS', 20), ('MILOTIC', 40)):
    g, mv, money = run(sp, lv)
    check(f'{sp} learns Hypnosis for 5000', mv == [g.const16('TACKLE'), g.const16('HYPNOSIS'), 0, 0] and money == 5000,
          f'{mv} {money}')
g, mv, money = run('MEW', 30)
check('MEW: no egg moves, nothing learned or paid', mv == [g.const16('TACKLE'), 0, 0, 0] and money == 10000,
      f'{mv} {money}')
print(f'{sum(results)}/{len(results)} passed')
