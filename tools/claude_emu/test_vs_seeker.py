"""The Vs Seeker (engine/events/vs_seeker.asm): readies every beaten map trainer
on screen (clears their beaten flags), shows an emote over each, and then needs
100 steps to recharge (wVsSeekerCharge, save extension). The start region's
professor gives it with the parcels; a save already past that errand gets it
the next time the player talks to them.

usage: test_vs_seeker.py ROM SYM STATE [--shots DIR]
"""
import os
import subprocess
import sys
from battle_test import Game, Battle
from harness import warp_script, oam
import gb

ROM, SYM, STATE = sys.argv[1:4]
SHOTS = sys.argv[sys.argv.index('--shots') + 1] if '--shots' in sys.argv else None
CSE = os.environ.get('CSE', '.')
RESULTS = []
EMOTE_TILE = 0xf8
R30_TRAINERS = ['EVENT_BEAT_YOUNGSTER_JOEY', 'EVENT_BEAT_YOUNGSTER_MIKEY', 'EVENT_BEAT_BUG_CATCHER_DON']


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def flag(g, name):
    n = g.const16(name)
    return g.rd(f'wEventFlags+{n // 8}') >> (n % 8) & 1


def charge(g):
    return g.rd('wVsSeekerCharge')


def idle(g, limit=60, texts=None):
    """Press A until no script is running; the text boxes seen go to `texts`."""
    for _ in range(limit):
        g.frames(20)
        if texts is not None:
            texts.append(' '.join(g.screen_text().split()))
        if not g.rd('wScriptRunning'):
            g.frames(20)
            if not g.rd('wScriptRunning'):
                return True
        g.press('A', after=30)
    return False


def said(texts, s):
    return any(s in t for t in texts)


def new(mapname='ROUTE_30', x=5, y=27, beaten=R30_TRAINERS, setup='', give=True):
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.wr('wRepelEffect', 250)
    g.wr('wNewBarkTownSceneID', 1)  # past the intro scenes
    g.wr('wElmsLabSceneID', 2)
    lines = ['\tsetevent EVENT_TRAVEL_PROF_CALLED',
             '\tsetevent EVENT_ROUTE_30_BATTLE', '\tclearevent EVENT_ROUTE_30_YOUNGSTER_JOEY']
    lines += [f'\tsetevent {f}' for f in beaten]
    if give:
        lines.append('\tgiveitem VS_SEEKER')
    g.run_script('\n'.join(lines + [setup, '\tend']))
    g.frames(10)
    g.run_script(warp_script(mapname, x, y))
    g.frames(240)
    idle(g)
    return g


def mark_only(g):
    """Run VsSeekerItem's checks without the script: the marked objects (a bit each)."""
    b, a = g.sym['VsSeekerItem']
    g.run_script(f'\tdb callasm_command\n\tdb {b}\n\tdw {a}\n\tend')
    g.frames(6)
    lo, hi = g.rd('wStringBuffer5', 2)
    return lo | hi << 8


def use(g, watch=240):
    """Use the Vs Seeker as the Pack/Select does (VsSeekerItem, then its queued
    script). Returns (texts, emote frames seen)."""
    b, a = g.sym['VsSeekerItem']
    q = g.sym['wQueuedScriptBank'][1]
    g.run_script(f'\tdb callasm_command\n\tdb {b}\n\tdw {a}\n\tmemjump ${q:04X}\n\tend')
    texts, emotes = [], 0
    for f in range(watch):
        g.frames(2)
        if any(e[2] in range(EMOTE_TILE, EMOTE_TILE + 4) for e in oam(g)):
            emotes += 1
        t = ' '.join(g.screen_text().split())
        if t and (not texts or texts[-1] != t):
            texts.append(t)
        if f % 15 == 14 and any(s in t for s in ('Vs Seeker!', 'Steps left', 'rematch.')):
            g.press('A', after=10)
    idle(g, texts=texts)
    return texts, emotes


def object_index(g, x, y):
    """The map object standing at map (x, y) (object struct coordinates are + 4)."""
    mlen, osid = g.const('MAPOBJECT_LENGTH'), g.const('MAPOBJECT_OBJECT_STRUCT_ID')
    olen, ox, oy = g.const('OBJECT_LENGTH'), g.const('OBJECT_MAP_X'), g.const('OBJECT_MAP_Y')
    for i in range(1, 16):
        sid = g.rd(g.sym['wMapObjects'][1] + i * mlen + osid)
        if sid == 0xff:
            continue
        st = g.sym['wObjectStructs'][1] + sid * olen
        if g.rd(st + ox) == x + 4 and g.rd(st + oy) == y + 4:
            return i
    return None


def step(g, d):
    s0 = g.rd('wStepCount')
    g.press(d, hold=8, after=24)
    return g.rd('wStepCount') != s0


def shot(g, name):
    if SHOTS:
        gb.LIB.GB_set_rendering_disabled(g.gb, False)
        g.frames(2)
        g.shot(os.path.join(SHOTS, name), 2)
        gb.LIB.GB_set_rendering_disabled(g.gb, True)


def case_ready_and_rematch():
    g = new()
    joey, mikey = object_index(g, 2, 28), object_index(g, 5, 23)
    check('Route 30: Joey and Mikey are map objects on screen', joey and mikey, (joey, mikey))
    mask = mark_only(g)
    check('on-screen beaten trainers marked (Joey, Mikey; not Don, off screen)',
          mask == (1 << joey | 1 << mikey), bin(mask))
    check('their beaten flags cleared, Don\'s kept',
          not flag(g, R30_TRAINERS[0]) and not flag(g, R30_TRAINERS[1]) and flag(g, R30_TRAINERS[2]))
    check('recharge starts at 100', charge(g) == 100, charge(g))

    g = new()
    texts, emotes = use(g)
    check('use: "used the Vs Seeker!" text', said(texts, 'Vs Seeker!'), texts[:4])
    check('use: emotes shown (two trainers)', emotes >= 20, emotes)
    check('use: the readied list is used up', g.rd('wStringBuffer5', 2) == [0, 0])
    shot(g, 'readied.png')
    # walking into Joey's sight (row 28, 3 tiles to his right): he challenges
    step(g, 'D')
    for _ in range(300):
        g.frames(2)
        if g.in_battle():
            break
        if g.rd('wScriptRunning'):
            g.press('A', after=6)
    check('a readied trainer challenges on sight', g.in_battle())
    if g.in_battle():
        cls = g.rd('wOtherTrainerClass')
        check('the rematch is Joey (Youngster)', cls == g.const('YOUNGSTER'), cls)
        g.wr('wBattleMonLevel', 100)
        Battle(g, [('move', 0)] * 30).run()
        idle(g)
        check('won: Joey\'s beaten flag is set again', flag(g, R30_TRAINERS[0]))
        check('Mikey stays ready (not battled yet)', not flag(g, R30_TRAINERS[1]))


def case_charging():
    g = new(setup='')
    g.wr('wVsSeekerCharge', 37)
    texts, emotes = use(g)
    check('charging: "isn\'t charged yet" with the steps left',
          said(texts, 'charged yet') and said(texts, 'Steps left: 37.'), texts[-3:])
    check('charging: nothing readied, charge unchanged, no emotes',
          all(flag(g, f) for f in R30_TRAINERS) and charge(g) == 37 and emotes == 0, (charge(g), emotes))


def case_recharge():
    g = new()
    g.wr('wVsSeekerCharge', 100)
    n = sum(step(g, d) for d in 'DUDU')
    check('each step takes one off the recharge', charge(g) == 100 - n and n > 0, (n, charge(g)))
    g.wr('wVsSeekerCharge', 1)
    step(g, 'D'); step(g, 'U')
    check('stops at 0', charge(g) == 0, charge(g))
    texts, emotes = use(g)
    check('charged again: it works', not flag(g, R30_TRAINERS[1]) and charge(g) == 100, charge(g))


def case_none():
    g = new(beaten=[])
    texts, emotes = use(g)
    check('nobody beaten: "No trainers nearby want a rematch."', said(texts, 'No trainers nearby'), texts[-3:])
    check('nobody beaten: no charge used, no emotes', charge(g) == 0 and emotes == 0, (charge(g), emotes))
    g = new(beaten=['EVENT_BEAT_BUG_CATCHER_DON'])
    mask = mark_only(g)
    check('only an off-screen trainer beaten: nothing readied', mask == 0 and flag(g, 'EVENT_BEAT_BUG_CATCHER_DON')
          and charge(g) == 0, bin(mask))


def case_excluded():
    g = new()
    joey, mikey = object_index(g, 2, 28), object_index(g, 5, 23)
    n = g.const16('EVENT_BEAT_YOUNGSTER_JOEY')
    g.poke_rom(g.rom_addr('VsSeekerExcludedFlags'), [n & 0xff, n >> 8])
    mask = mark_only(g)
    check('an excluded trainer (Joey patched into the table) isn\'t readied',
          mask == 1 << mikey and flag(g, R30_TRAINERS[0]) and not flag(g, R30_TRAINERS[1]), bin(mask))
    r = subprocess.run([sys.executable, os.path.join(CSE, 'tools/vs_seeker_table.py'), CSE, '--check'],
                       capture_output=True, text=True)
    check('the exclusion table is up to date', r.returncode == 0, r.stdout.strip())
    g = new()
    for name in ('EVENT_BEAT_SAILOR_GARRETT', 'EVENT_BEAT_KIMONO_GIRL_NAOKO', 'EVENT_BEAT_ASH_ROUND1',
                 'EVENT_BEAT_GRUNTS_MAUVILLE', 'EVENT_BEAT_YOUNGSTER_JOEY'):
        try:
            n = g.const16(name)
        except Exception:
            continue
        rom = g.rom()
        a = g.rom_addr('VsSeekerExcludedFlags')
        found = False
        while True:
            v = rom[a] | rom[a + 1] << 8
            if v == 0xffff:
                break
            found |= v == n
            a += 2
        want = name != 'EVENT_BEAT_YOUNGSTER_JOEY'
        check(f'table: {name} {"excluded" if want else "included"}', found == want)


def case_shared_flag():
    # Route 104's twins: two objects, one beaten flag
    g = new('ROUTE_104', 20, 15, beaten=['EVENT_BEAT_ROUTE104_GINAMIA'])
    a, b = object_index(g, 20, 12), object_index(g, 21, 12)
    mask = mark_only(g)
    check('two objects sharing a flag are both readied', a and b and mask == (1 << a | 1 << b)
          and not flag(g, 'EVENT_BEAT_ROUTE104_GINAMIA'), (a, b, bin(mask)))


def case_select():
    g = new()
    conv, reg = g.sym['GetItemIDFromIndex'][1], g.sym['wRegisteredItem'][1]
    g.run_script(f'''\tdb callasm_command\n\tdb 0\n\tdw VsTestCode\n\tend
VsTestCode:
\tld hl, VS_SEEKER
\tcall ${conv:04X}
\tld [${reg:04X}], a
\tret''')
    g.frames(6)
    g.press('SEL', after=10)
    texts = []
    for _ in range(200):
        g.frames(2)
        t = ' '.join(g.screen_text().split())
        if t and (not texts or texts[-1] != t):
            texts.append(t)
    idle(g, texts=texts)
    check('registered: Select uses it', said(texts, 'Vs Seeker!') and not flag(g, R30_TRAINERS[1])
          and charge(g) == 100, texts[:3])


def case_professor():
    # the errand (Johto start): the Vs Seeker comes after the ticket
    g = new('ELMS_LAB', 5, 3, beaten=[], give=False,
            setup='\tclearevent EVENT_GOT_TRAVEL_PARCELS')
    g.wr('wNewBarkTownSceneID', 1)
    g.press('U', hold=2, after=20)
    texts = []
    g.press('A', after=60)
    idle(g, limit=80, texts=texts)
    g.run_script('\tcheckitem VS_SEEKER\n\tend'); g.frames(20)
    got = g.rd('wScriptVar')
    check('Elm\'s errand: parcels, ticket and the Vs Seeker',
          got and flag(g, 'EVENT_GOT_TRAVEL_PARCELS') and said(texts, '100 steps') and said(texts, 'outdoors'),
          texts[-6:])
    # a save past the errand without one: Elm hands it over
    g = new('ELMS_LAB', 5, 3, beaten=[], give=False,
            setup='\tsetevent EVENT_GOT_TRAVEL_PARCELS')
    g.press('U', hold=2, after=20)
    texts = []
    g.press('A', after=60)
    idle(g, limit=80, texts=texts)
    g.run_script('\tcheckitem VS_SEEKER\n\tend'); g.frames(20)
    check('past the errand: Elm gives it ("nearly forgot")', g.rd('wScriptVar') and said(texts, 'nearly'),
          texts[-5:])
    texts = []
    g.press('A', after=60)
    idle(g, limit=80, texts=texts)
    check('…and only once', not said(texts, 'nearly'), texts[-3:])
    # Oak and Birch (Kanto / Hoenn starts) past the errand
    for st, lab, x in (('KANTO', 'OAKS_LAB', 4), ('HOENN', 'BIRCHS_LAB', 5)):
        g = new(lab, x, 3, beaten=[], give=False,
                setup=f'\tsetevent EVENT_START_{st}\n\tsetevent EVENT_GOT_TRAVEL_PARCELS')
        g.press('U', hold=2, after=20)
        texts = []
        g.press('A', after=60)
        idle(g, limit=80, texts=texts)
        g.run_script('\tcheckitem VS_SEEKER\n\tend'); g.frames(20)
        check(f'{st.capitalize()} start, past the errand: the professor gives it', g.rd('wScriptVar'),
              texts[-4:])


def case_indoors():
    # a gym (INDOOR) and a cave (CAVE) with a beaten trainer on screen: refused
    for mapname, x, y, beaten, tx, ty in (('RUSTBORO_GYM', 5, 16, 'EVENT_BEAT_RUSTBORO_JOSH', 7, 13),
                                          ('UNION_CAVE_1F', 10, 12, 'EVENT_BEAT_HIKERS_DAN_RUSS', 10, 9)):
        g = new(mapname, x, y, beaten=[beaten])
        on_screen = object_index(g, tx, ty)
        texts, emotes = use(g)
        check(f'{mapname}: "only works outdoors", nothing readied, no charge used',
              on_screen and said(texts, 'only works') and flag(g, beaten) and charge(g) == 0 and emotes == 0,
              (on_screen, texts[-2:], charge(g), emotes))


CASES = [case_indoors, case_ready_and_rematch, case_charging, case_recharge, case_none, case_excluded,
         case_shared_flag, case_select, case_professor]

if __name__ == '__main__':
    if SHOTS:
        os.makedirs(SHOTS, exist_ok=True)
    names = [a for a in sys.argv[4:] if a.startswith('case_')]
    for c in CASES:
        if not names or c.__name__ in names:
            try:
                c()
            except Exception as e:
                check(c.__name__ + ' ran', False, repr(e))
    fails = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(fails)}/{len(RESULTS)} passed')
    sys.exit(1 if fails else 0)
