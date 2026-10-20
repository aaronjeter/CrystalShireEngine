# Save in-game on a map, reboot from that save, Continue, and compare.
# Usage: python3 continue_test.py MAP_CONST x y tag   (writes tag_before.png, tag_after.png, tag.png)
import ctypes as C, sys
from harness import H, warp_script, LIB
from PIL import Image
mp, x, y, tag = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), sys.argv[4]
g = H('fol.gbc', None, 'fol.sym'); g.load('ow_fol.state')
g.run_script(warp_script(mp, x, y)); g.frames(200)
g.shot(tag + '_before.png', 2)
g.press('START', after=40)
for i in range(5): g.press('D', after=8)  # SAVE
g.press('A', after=60)
for i in range(12): g.press('A', after=60)
g.frames(200)
size = C.c_size_t(); bank = C.c_uint16()
p = LIB.GB_get_direct_access(g.gb, 2, C.byref(size), C.byref(bank))
open(tag + '.sav', 'wb').write(bytes((C.c_uint8 * size.value).from_address(p)))
g2 = H('fol.gbc', tag + '.sav', 'fol.sym')
g2.frames(400)
for i in range(14): g2.press('A', after=50)
g2.frames(200)
g2.shot(tag + '_after.png', 2)
a, b = Image.open(tag + '_before.png'), Image.open(tag + '_after.png')
c = Image.new('RGB', (660, 288), 'white'); c.paste(a, (0, 0)); c.paste(b, (340, 0)); c.save(tag + '.png')
