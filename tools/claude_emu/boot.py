import sys, os
from harness import H
rom, sym, out = sys.argv[1:4]
g = H(rom, os.path.join(os.path.dirname(os.path.abspath(__file__)), 'start_save.bin'), sym)
g.frames(400)
for i in range(6): g.press('A', after=40)
g.press('A', after=200)
# the start save is in the player's room
root = os.environ.get('CSE', os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..'))
sys.path.insert(0, os.path.join(root, 'tools'))
from convert_save import map_ids
assert (g.rd('wMapGroup'), g.rd('wMapNumber')) == map_ids(os.path.join(root, 'constants', 'map_constants.asm'))['PLAYERS_HOUSE_2F'], g.screen_text()
g.save(out)
