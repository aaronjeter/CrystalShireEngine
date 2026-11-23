"""The Kanto Rocket arc: Petra (the Safari Zone executive), the Silph Co. 1F crisis (a Porygon-Z boss)
and the journal's "Petra's Plan" mission (MISSION_KANTO_ROCKETS, saved in
wJournalSeen2).

usage: test_kanto_rockets.py ROM SYM STATE [case_...]
"""
import os
import re
import sys
from battle_test import Battle, Game
import test_vs_seeker as V

ROM, SYM, STATE = sys.argv[1:4]
V.ROM, V.SYM, V.STATE = ROM, SYM, STATE
CSE = os.environ.get('CSE', '/root/cse_pc')
RESULTS = []

KANTO_FLAGS = ['EVENT_BEAT_MOON_GRUNT1', 'EVENT_BEAT_MOON_GRUNT2', 'EVENT_BEAT_GRUNTS_MT_MOON',
               'EVENT_MET_MANAGER_AT_POWER_PLANT', 'EVENT_RETURNED_MACHINE_PART', 'EVENT_SAFFRON_CITY_OPEN',
               'EVENT_BEAT_SAFARI_ROCKETS', 'EVENT_FOUND_SILPH_GREEN']
STEPS = ['EVENT_BEAT_GRUNTS_MT_MOON', 'EVENT_RETURNED_MACHINE_PART', 'EVENT_SAFFRON_CITY_OPEN',
         'EVENT_BEAT_SAFARI_ROCKETS', 'EVENT_FOUND_SILPH_GREEN']


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def farcall_code(g, routine, a=None, store='wScriptVar'):
    """A script that farcalls `routine` (with a = `a`) and stores a in `store`."""
    bank, addr = g.sym[routine]
    rst = g.sym['FarCall'][1]
    out = g.sym[store][1]
    seta = f'\tld a, {a}\n' if a is not None else ''
    return f'''\tdb callasm_command
\tdb 0
\tdw KRTestCode
\tend
KRTestCode:
{seta}\trst ${rst:02X}
\tdb {bank}
\tdw ${addr:04X}
\tld [${out:04X}], a
\tret'''


def mission_state(g):
    g.run_script(farcall_code(g, 'Journal_EvalMission', g.const('MISSION_KANTO_ROCKETS')))
    g.frames(4)
    s = g.rd('wScriptVar')
    return bool(s & 0x80), bool(s & 0x40), s & 0x0f


def set_flags(g, on, off=()):
    lines = [f'\tsetevent {f}' for f in on] + [f'\tclearevent {f}' for f in off] + ['\tend']
    g.run_script('\n'.join(lines))
    g.frames(4)


def case_journal():
    g = V.new('SAFFRON_CITY', 18, 24, beaten=[], give=False)
    set_flags(g, [], KANTO_FLAGS)
    st = mission_state(g)
    check('journal: hidden before any Kanto Rocket sighting', st == (False, False, 0), st)
    set_flags(g, ['EVENT_MET_MANAGER_AT_POWER_PLANT'])
    st = mission_state(g)
    check('journal: starts at the Power Plant (players who skipped Mt. Moon)', st == (True, False, 0), st)
    set_flags(g, [], ['EVENT_MET_MANAGER_AT_POWER_PLANT'])
    set_flags(g, ['EVENT_BEAT_MOON_GRUNT1'])
    st = mission_state(g)
    check('journal: starts at the first Mt. Moon grunt', st == (True, False, 0), st)
    for i, f in enumerate(STEPS):
        set_flags(g, [f])
        st = mission_state(g)
        want = (True, i == len(STEPS) - 1, i + 1)
        check(f'journal: step {i + 1} ({f})', st == want, st)

    # saved progress goes to wJournalSeen2, the other saved bytes stay put
    sizes = {'wStartMenuOrderSaved': 5, 'wFollowerPickupItem': 2, 'wVsSeekerCharge': 2}
    before = {k: list(g.rd(k, v)) for k, v in sizes.items()}
    g.run_script(farcall_code(g, 'Journal_CheckUpdates', store='wStringBuffer5'))
    g.frames(4)
    seen2 = g.rd('wJournalSeen2')
    check('journal: its progress saved in wJournalSeen2 (1 + 5 steps)', seen2 & 0x0f == 6, hex(seen2))
    after = {k: list(g.rd(k, v)) for k, v in sizes.items()}
    after['wVsSeekerCharge'] = after['wVsSeekerCharge'][:1]
    before['wVsSeekerCharge'] = before['wVsSeekerCharge'][:1]
    check('journal: start menu order, Pickup item and Vs Seeker charge untouched',
          all(after[n] == before[n] for n in after), (before, after))
    unread = g.rd('wJournalUnread', 4)
    m = g.const('MISSION_KANTO_ROCKETS')
    check('journal: marked NEW (wJournalUnread bit 28)', unread[m // 8] >> (m % 8) & 1, unread)
    sym = {k: g.sym[k][1] for k in ('wVsSeekerCharge', 'wJournalSeen2', 'wSaveExtension')}
    check('wJournalSeen2 is the byte after wVsSeekerCharge, in the save extension',
          sym['wJournalSeen2'] == sym['wVsSeekerCharge'] + 1, sym)

    # the list order: right after Rocket's Signal
    rom = g.rom()
    a = g.rom_addr('JournalOrder')
    order = []
    while rom[a] != 0xff:
        order.append(rom[a])
        a += 1
    n = g.const('NUM_MISSIONS')
    check('JournalOrder lists every mission once', sorted(order) == list(range(n)), order)
    i = order.index(g.const('MISSION_ROCKETS_SIGNAL'))
    check('the Kanto mission shows after Rocket\'s Signal', order[i + 1] == m, order)


def open_journal_kanto(g):
    texts = []
    g.press('START', after=60)
    for _ in range(10):
        if 'Missions' in g.screen_text():
            break
        g.press('D', after=24)
    g.press('A', after=120)
    for _ in range(5):
        t = g.screen_text()
        texts.append(t)
        if "Petra" in t:
            break
        g.press('R', after=40)
    return g.screen_text()


def case_journal_screen():
    g = V.new('SAFFRON_CITY', 18, 24, beaten=['EVENT_BEAT_MOON_GRUNT1', 'EVENT_BEAT_GRUNTS_MT_MOON'], give=False)
    t = open_journal_kanto(g)
    check('journal screen: "Petra\'s Plan" listed (Kanto)', "Petra" in t, t)
    if V.SHOTS:
        V.shot(g, 'journal_kanto.png')


def dialog_until_battle(g, limit=120):
    """Page through a script's text with A until a battle starts; the pages seen."""
    texts = []
    for _ in range(limit):
        g.frames(30)
        s = ' '.join(g.screen_text().split())
        if s and (not texts or texts[-1] != s):
            texts.append(s)
        if g.in_battle() and g.rd('wOTPartyCount'):
            break
        g.press('A', after=10)
    return texts


def case_petra():
    # the real fight: Safari Zone secret house, Petra sees the player
    # (built by hand: V.new's idle() would page through her lines)
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.run_script('\tsetevent EVENT_TRAVEL_PROF_CALLED\n\tclearevent EVENT_BEAT_SAFARI_ROCKETS\n\tend')
    g.frames(10)
    g.run_script(V.warp_script('SAFARI_HOUSE_SECRET', 4, 6))
    g.frames(200)
    texts = dialog_until_battle(g)
    check('Petra introduces herself ("I\'m Petra")', any("Petra" in t for t in texts), texts[-4:])
    if not g.in_battle():
        check('Petra battle started', False)
        return
    for _ in range(60):
        g.frames(4)
        s = ' '.join(g.screen_text().split())
        if s and texts[-1] != s:
            texts.append(s)
        if 'Fight' in s:
            break
    check('the battle opens with "Rocket Petra wants to battle!"', any('Petra' in s and 'battle' in s for s in texts),
          texts[-3:])
    check('her boss: BOSS_PETRA on the last slot (Mega Absol)',
          g.rd('wBossID') == g.const('BOSS_PETRA') and g.rd('wBossSlot') == g.rd('wOTPartyCount') - 1,
          (g.rd('wBossID'), g.rd('wBossSlot')))
    g.wr('wBattleMonLevel', 100)
    texts = []
    Battle(g, [('move', 0)] * 40).run(end_presses=0)
    for _ in range(80):
        g.frames(30)
        t = ' '.join(g.screen_text().split())
        if t and (not texts or texts[-1] != t):
            texts.append(t)
        if not g.rd('wScriptRunning'):
            break
        g.press('A', after=10)
    check('after the win: the Power Plant / Silph Co. reveal', any('Power Plant' in t for t in texts)
          and any('Porygon' in t for t in texts), texts)
    check('EVENT_BEAT_SAFARI_ROCKETS set', V.flag(g, 'EVENT_BEAT_SAFARI_ROCKETS'))


def map_object_visible(g, n):
    mlen, osid = g.const('MAPOBJECT_LENGTH'), g.const('MAPOBJECT_OBJECT_STRUCT_ID')
    return g.rd(g.sym['wMapObjects'][1] + n * mlen + osid) != 0xff


def talk_script(g, label, obj):
    """Run an object's script as if talked to (hLastTalked = its map object)."""
    bank, addr = g.sym[label]
    g.wr('hLastTalked', obj)
    g.run_script(f'\tdb farsjump_command\n\tdb {bank}\n\tdw {addr}')


def read_texts(g, limit=60):
    texts = []
    for _ in range(limit):
        g.frames(20)
        t = ' '.join(g.screen_text().split())
        if t and (not texts or texts[-1] != t):
            texts.append(t)
        if not g.rd('wScriptRunning'):
            break
        g.press('A', after=20)
    return texts


def case_silph():
    g = V.new('SILPH_CO_1F', 12, 2, beaten=['EVENT_BEAT_SAFARI_ROCKETS'], give=False,
              setup='\tclearevent EVENT_FOUND_SILPH_GREEN')
    # map objects: 1 receptionist, 2 officer, 3 Green, 4 Porygon-Z, 5 scientist
    vis = [map_object_visible(g, n) for n in (3, 4, 5)]
    check('Silph Co. 1F in crisis: Porygon-Z and the scientist, no Green yet', vis == [False, True, True], vis)
    talk_script(g, 'SilphCoReceptionistScript', 1)
    t = read_texts(g)
    check('receptionist: "stay calm", a Porygon gone haywire', any('calm' in x for x in t)
          and any('haywire' in x for x in t), t)
    talk_script(g, 'SilphCoScientistScript', 5)
    t = read_texts(g)
    check('scientist: the locks were opened on purpose', any('purpose' in x for x in t), t)
    party = g.rd('wPartyCount')
    talk_script(g, 'SilphCoPorygonZScript', 4)
    intro = []
    for _ in range(60):
        g.frames(30)
        if g.in_battle() and g.rd('wBattleMode'):
            break
        t = ' '.join(g.screen_text().split())
        if t and (not intro or intro[-1] != t):
            intro.append(t)
        g.press('A', after=10)
    check('Porygon-Z: "its code is scrambled"', any('scrambled' in t for t in intro), intro)
    check('Porygon-Z: a wild boss battle', g.in_battle() and g.rd('wBattleMode') == 1
          and g.rd('wBossID') == g.const('BOSS_SILPH_PORYGONZ'), (g.rd('wBattleMode'), g.rd('wBossID')))
    g.frames(240)
    t = ' '.join(g.screen_text().split())
    check('the boss is Porygon-Z', 'Porygon Z' in t, t)
    if V.SHOTS:
        V.shot(g, 'silph_porygonz.png')
    texts = []
    if g.in_battle():
        g.wr('wBattleMonLevel', 100)
        b = Battle(g, [('move', 0)] * 40)
        b.run(end_presses=0)
        texts = [' '.join(str(x) for x in b.log)]
        # the automatic catch (nickname: no), then Green comes down the stairs
        for _ in range(200):
            g.frames(30)
            s = ' '.join(g.screen_text().split())
            if s and (not texts or texts[-1] != s):
                texts.append(s)
            if g.in_battle() and g.rd('wOTPartyCount'):
                break
            g.press('B' if 'nickname' in s.lower() else 'A', after=10)
            if V.SHOTS and 'slipped' in s:
                V.shot(g, 'silph_green_out.png')
    caught = any('was caught' in t for t in texts)
    to_box = any('was sent to' in t or 'transferred' in t.lower() for t in texts)
    check('Porygon-Z caught automatically (party, or the box when the party is full)',
          caught and (g.rd('wPartyCount') == party + 1 or (party == 6 and to_box)),
          (party, g.rd('wPartyCount'), [t for t in texts if 'caught' in t or 'sent' in t][:3]))
    check('Green: "that one slipped right past me"', any('slipped' in t for t in texts), texts[-12:])
    check('Green: "A Rocket named Petra opened the Porygon labs"', any('Petra' in t for t in texts))
    check('then Green\'s battle', g.in_battle() and g.rd('wOTPartyCount') > 0)
    if g.in_battle():
        g.wr('wBattleMonLevel', 100)
        Battle(g, [('move', 0)] * 40).run()
        read_texts(g, 80)
    check('after Green: Saffron safe', V.flag(g, 'EVENT_FOUND_SILPH_GREEN') and V.flag(g, 'EVENT_SAFFRON_CITY_SAFE'))
    check('Green gone, officer back in front of the stairs', not map_object_visible(g, 3)
          and officer_pos(g) == (13, 1), officer_pos(g))
    g.run_script(V.warp_script('SILPH_CO_1F', 12, 2))
    g.frames(200)
    V.idle(g)
    vis = [map_object_visible(g, n) for n in (3, 4, 5)]
    check('reloaded: Green, Porygon-Z and the scientist gone', not any(vis), vis)
    talk_script(g, 'SilphCoReceptionistScript', 1)
    t = read_texts(g)
    check('receptionist back to normal', any('Head' in x for x in t), t)


def officer_pos(g):
    """The officer's map coordinates, from his object struct."""
    mlen, osid = g.const('MAPOBJECT_LENGTH'), g.const('MAPOBJECT_OBJECT_STRUCT_ID')
    sid = g.rd(g.sym['wMapObjects'][1] + 2 * mlen + osid)
    if sid == 0xff:
        return None
    base = g.sym['wObjectStructs'][1] + sid * g.const('OBJECT_LENGTH')
    return (g.rd(base + g.const('OBJECT_MAP_X')) - 4, g.rd(base + g.const('OBJECT_MAP_Y')) - 4)


def case_texts():
    def text(path):
        return open(os.path.join(CSE, path), encoding='utf-8').read()
    r24 = text('maps/kanto/routes/Route24.asm')
    check('Route 24 grunt: no Johto reference, names Petra', 'Johto' not in r24 and 'Petra' in r24)
    gate = text('maps/kanto/saffron/SaffronEastGate.asm')
    check('Green\'s gate text: "Fuchsia", "at Silph Co."', 'Fuscia' not in gate and 'Fuchsia' in gate
          and 'at Silph Co.' in gate)
    secret = text('maps/kanto/safari/SafariHouseSecret.asm')
    check('Warden names Petra', 'That Petra woman' in secret)
    for p in ('maps/kanto/dungeons/MtMoonB2F.asm', 'maps/kanto/safari/SafariZoneNorth.asm',
              'maps/kanto/safari/SafariZoneSouth.asm', 'maps/kanto/safari/SafariZoneEast.asm',
              'maps/kanto/safari/SafariZoneWest.asm'):
        check(f'{os.path.basename(p)} mentions Petra', 'Petra' in text(p))
    parties = text('data/trainers/parties.asm')
    check('party SAFARI_EXECUTIVEF is named Petra', 'party SAFARI_EXECUTIVEF, "Petra"' in parties)


CASES = [case_texts, case_journal, case_journal_screen, case_petra, case_silph]

if __name__ == '__main__':
    names = [a for a in sys.argv[4:] if a.startswith('case_')]
    if '--shots' in sys.argv:
        V.SHOTS = sys.argv[sys.argv.index('--shots') + 1]
        os.makedirs(V.SHOTS, exist_ok=True)
    for c in CASES:
        if not names or c.__name__ in names:
            try:
                c()
            except Exception as e:
                import traceback
                traceback.print_exc()
                check(c.__name__ + ' ran', False, repr(e))
    fails = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(fails)}/{len(RESULTS)} passed')
    sys.exit(1 if fails else 0)
