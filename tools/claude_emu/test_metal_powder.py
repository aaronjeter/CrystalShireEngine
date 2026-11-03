"""Metal Powder (Nov 2, 2026 fix): a Ditto holding it takes Def/Sp.Def x1.5 when hit, both sides;
no effect on other species; fixed damage unchanged. Run from a folder with ROM, .sym, .map and a boot.py state:
    python3 test_metal_powder.py mp.gbc mp.sym ow_mp.state
Expected: enemy Ditto Vicegrip x~0.67, player Ditto x~0.70, Tauros x1.00, Seismic Toss 55.
(Before the fix: x0.02 and x0.10, Ditto nearly immune.)"""
import os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
src = open(os.path.join(HERE, 'test_held_items.py')).read()
sys_argv = sys.argv[:]
src = src.split("\nif want(")[0].replace("os.path.dirname(os.path.abspath(__file__))", "HERE")
src = src.replace("ITEMS = ['FLAME_ORB', 'TOXIC_ORB', 'EVIOLITE', 'WIDE_LENS', 'BLACK_SLUDGE', 'LIFE_ORB', 'FOCUS_SASH']", "ITEMS = ['METAL_POWDER', 'EVIOLITE']")
exec(src)
tag = os.path.basename(sys_argv[1]).split('.')[0]
# enemy Ditto holds the powder; player Machamp attacks
for wild in ['DITTO', 'TAUROS']:
    st = f'mp_{tag}_{wild.lower()}.state'
    if not os.path.exists(st): setup2(st, wild=wild)
    ids(st)
    _, a = turn2(st, VICE, SPLASH, extra=soft, fixed=True)
    _, b = turn2(st, VICE, SPLASH, extra=both(soft, items(e='METAL_POWDER')), fixed=True)
    _, c = turn2(st, TOSS, SPLASH, extra=items(e='METAL_POWDER'), fixed=True)
    print(f'{tag} enemy {wild}: Vicegrip {a["dmg"]} -> {b["dmg"]} with powder (x{b["dmg"]/max(1,a["dmg"]):.2f}); Seismic Toss {c["dmg"]}')
# player Ditto holds the powder; wild Machamp uses Vicegrip
st = f'mp_{tag}_pditto.state'
if not os.path.exists(st): setup2(st, wild='MACHAMP', player='DITTO')
ids(st)
_, a = turn2(st, SPLASH, VICE, fixed=True)
_, b = turn2(st, SPLASH, VICE, extra=items(p='METAL_POWDER'), fixed=True)
print(f'{tag} player DITTO hit by Vicegrip: {a["pdmg"]} -> {b["pdmg"]} with powder (x{b["pdmg"]/max(1,a["pdmg"]):.2f})')
