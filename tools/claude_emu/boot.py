import sys, os
from harness import H
rom, sym, out = sys.argv[1:4]
g = H(rom, os.path.join(os.path.dirname(os.path.abspath(__file__)), 'start_save.bin'), sym)
g.frames(400)
for i in range(6): g.press('A', after=40)
g.press('A', after=200)
assert g.rd('wMapGroup') == 24, g.screen_text()
g.save(out)
