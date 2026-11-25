"""World Cup title defense (engine/events/title_defense.asm), played from the
Challenger Lobby's title clerk.

The list holds the unlocked challengers (the three rivals, the
Champions after their League rematch, the doubles pairs, Red after
Red once Lance, Agatha and Steven are beaten here) and marks those beaten. A match in the Finals arena:
the challenger (and partner) on the variable sprites, a CANLOSE battle with
their party; a win adds a defense, and the first win against a challenger
also gives its item and BP (the beaten flag is set with them); a loss costs nothing. Either way the player is back in
front of the clerk with no match pending.

usage: test_title_defense.py ROM SYM STATE [--shots DIR]
"""
import os
import sys
from harness import warp_script
import test_facility as T
from test_facility_intros import Win, Lose
from battle_test import fill_pocket


class Over(Exception):
    pass


def ending_at_exit(cls):
    """The battle driver, stopping as soon as the battle is over (so the texts after it are seen)."""
    class C(cls):
        def settle(self, limit=12000):
            t = super().settle(limit)
            if t is None:
                raise Over
            return t
    return C


TDWin, TDLose = ending_at_exit(Win), ending_at_exit(Lose)

ROM, SYM, STATE = sys.argv[1:4]
SHOTS = sys.argv[sys.argv.index('--shots') + 1] if '--shots' in sys.argv else None
check = T.check
CLERK_POS = (34, 17)
MARK_TILE = 0x72
LIST_ROWS = (2, 4, 6, 8)   # the names' rows in the menu box
MARK_COL = 15              # the mark's column


def flag(g, name):
    n = g.const16(name)
    return g.rd(f'wEventFlags+{n // 8}') >> (n % 8) & 1


def set_flag(g, name, on=True):
    n = g.const16(name)
    a = f'wEventFlags+{n // 8}'
    v = g.rd(a)
    g.wr(a, v | 1 << (n % 8) if on else v & ~(1 << (n % 8)))


def item_count(g, name):
    g.script(f'\tcheckitem {name}', 20)
    if not g.rd('wScriptVar'):
        return 0
    n = 0
    while True:
        g.script(f'\ttakeitem {name}, 1', 10)
        if not g.rd('wScriptVar'):
            break
        n += 1
    if n:
        g.script(f'\tgiveitem {name}, {n}', 20)
    return n


def rd16be(g, name):
    hi, lo = g.rd(name, 2)
    return hi << 8 | lo


def shot(g, name):
    if SHOTS:
        from battle_test import LIB
        LIB.GB_set_rendering_disabled(g.gb, False)
        g.frames(4)
        g.shot(os.path.join(SHOTS, name), 3)


def setup(flags=(), defenses=0, bp=0, full=False, champion=True):
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    set_flag(g, 'EVENT_BEAT_SAFARI_ROCKETS', False)  # the test save is past the Safari Zone
    set_flag(g, 'EVENT_WORLD_CUP_CHAMPION', champion)
    for f in ('EVENT_WORLD_CUP_QUALIFIED',) + tuple(flags):
        set_flag(g, f)
    g.wr('wTitleDefenses', [defenses >> 8, defenses & 0xff])
    g.wr('wBattlePoints', [bp >> 8, bp & 0xff])
    g.wr('wOptions', g.rd('wOptions') | 1 << g.const('BATTLE_SHIFT'))  # Set: no "Will you switch?"
    if full:  # the Held Items pocket full of Quick Claws: no room for a prize
        fill_pocket(g, 'QUICK_CLAW', g.const('MAX_HELD'))
    g.run_script(warp_script('WC_CHALLENGER_LOBBY', *CLERK_POS))
    g.frames(200)
    g.press('U', hold=2, after=20)  # face the clerk
    return g


def open_list(g):
    """Talk to the clerk, Yes, up to the challenger list. Returns the list (TD_* indexes)."""
    g.press('A', after=60)
    for _ in range(20):
        t = g.screen_text()
        if 'Which challenger' in t:
            break
        if 'challenge?' in t and 'Yes' in t:
            g.press('A', after=60)
            continue
        g.press('A', after=40)
    g.frames(40)
    n = g.rd('wStringBuffer4')
    return [i - 1 for i in g.rd('wStringBuffer4+1', n)] if n else []


def core(g, lst):
    """The list without the playtester challengers (they come last)."""
    return [x for x in lst if x < td(g, 'TD_MARINA')]


def list_end(g):
    """The byte after the menu list (its -1 end mark)."""
    return g.rd(f'wStringBuffer4+{1 + g.rd("wStringBuffer4")}')


def marks(g):
    """The challengers shown on the menu's first page with their mark (TD_* index -> bool)."""
    tm = g.sym['wTilemap'][1]
    shown = g.rd('wStringBuffer4+1', min(4, g.rd('wStringBuffer4')))
    return {i - 1: g.rd(tm + r * 20 + MARK_COL) == MARK_TILE for i, r in zip(shown, LIST_ROWS)}


def fight(g, pos, win, shot_name=None):
    """Pick list position `pos`, accept, play the match. Returns what was seen."""
    for _ in range(pos):
        g.press('D', after=12)
    g.press('A', after=60)
    seen = {'texts': []}
    for _ in range(40):  # "X it is!", ready? Yes, healed, good luck, warp, walk, announcer, intro
        if g.rd('wBattleMode'):
            break
        t = g.screen_text()
        seen['texts'].append(t)
        if 'arena?' in t and 'Yes' in t:
            g.press('A', after=60)
            continue
        if shot_name and 'Announcer' in t and 'arena' not in seen:
            seen['arena'] = True
            shot(g, shot_name)
            from battle_test import LIB
            LIB.GB_set_rendering_disabled(g.gb, True)
        if g.rd('wMapGroup') == g.const('GROUP_WC_FINALS') and g.rd('wMapNumber') == g.const('MAP_WC_FINALS'):
            seen['opp_sprite'] = g.rd(f'wVariableSprites+{g.const("SPRITE_BATTLE_TOWER_OPPONENT - SPRITE_VARS")}')
            seen['partner_sprite'] = g.rd(f'wVariableSprites+{g.const("SPRITE_TITLE_PARTNER - SPRITE_VARS")}')
            seen['objects'] = (not flag(g, 'EVENT_WC_FINALS_CHALLENGER'), not flag(g, 'EVENT_WC_FINALS_PARTNER'),
                               not flag(g, 'EVENT_WC_FINALS_OAK'))
        g.press('A', after=40)
    seen['battle'] = bool(g.rd('wBattleMode'))
    seen['class'] = g.rd('wOtherTrainerClass')
    seen['id'] = g.rd('wOtherTrainerID')
    seen['type'] = g.rd('wBattleType')
    if seen['battle']:
        b = (TDWin if win else TDLose)(g, [])
        b.round = 9  # no extra hurting of the party
        try:
            b.run()
        except Over:
            pass
        seen['result'] = g.rd('wBattleResult') & 0xf
        seen['log'] = ' '.join(b.log) if hasattr(b, 'log') else ''
    for _ in range(60):  # the announcer, BP, the prize, back to the lobby
        here = (g.rd('wMapGroup'), g.rd('wMapNumber'), g.rd('wXCoord'), g.rd('wYCoord'))
        if here == (g.const('GROUP_WC_CHALLENGER_LOBBY'), g.const('MAP_WC_CHALLENGER_LOBBY')) + CLERK_POS:
            g.frames(60)
            break
        for _ in range(8):
            g.frames(5)
            seen['texts'].append(g.screen_text())
        g.press('A', after=5)
    seen['back'] = (g.rd('wMapNumber'), g.rd('wXCoord'), g.rd('wYCoord'))
    return seen


def brief(seen):
    return str({k: v for k, v in seen.items() if k not in ('texts', 'log')})


def said(seen, s):
    return any(s in ' '.join(t.split()) for t in seen['texts'])


def td(g, name):
    return g.const(name)


ALL_UNLOCKS = ('EVENT_BEAT_JOHTO_LEAGUE_REMATCH', 'EVENT_BEAT_INDIGO_LEAGUE_REMATCH',
               'EVENT_BEAT_HOENN_LEAGUE_REMATCH', 'EVENT_CLEARED_RADIO_TOWER', 'EVENT_BEAT_SHRINE_JANE',
               'EVENT_BEAT_SAFARI_ROCKETS', 'EVENT_TITLE_DEFENSE_BEAT_LANCE', 'EVENT_TITLE_DEFENSE_BEAT_AGATHA',
               'EVENT_TITLE_DEFENSE_BEAT_STEVEN', 'EVENT_TITLE_DEFENSE_BEAT_ARCHER',
               'EVENT_TITLE_DEFENSE_BEAT_JANE', 'EVENT_TITLE_DEFENSE_BEAT_PETRA')
ORDER = ('TD_SILVER', 'TD_GREEN', 'TD_WALLY', 'TD_LANCE', 'TD_AGATHA', 'TD_STEVEN', 'TD_TATE_LIZA',
         'TD_KIMONO_GIRLS', 'TD_TWINS', 'TD_ACE_DUO', 'TD_RED', 'TD_ARCHER', 'TD_JANE', 'TD_PETRA', 'TD_GIOVANNI')
NAMES = ('Silver', 'Green', 'Wally', 'Lance', 'Agatha', 'Steven', 'Tate & Liza', 'Kimono Girls', 'Amy & May',
         'Kai & Rin', 'Red', 'Archer', 'Jane', 'Petra', 'Giovanni')
BEATEN = ('SILVER', 'GREEN', 'WALLY', 'LANCE', 'AGATHA', 'STEVEN', 'TATE_LIZA', 'KIMONO_GIRLS', 'TWINS',
          'ACE_DUO', 'RED', 'ARCHER', 'JANE', 'PETRA', 'GIOVANNI')
# the playtester challengers (key, list name, class, party, prize, first move of the ace)
PLAYTESTERS = (
    ('MARINA', 'Marina', 'COOLTRAINERF', 'MARINA_TD', 'WISE_GLASSES'),
    ('JESS', 'Jess', 'TEACHER', 'JESS_TD', 'ROCKY_HELMET'),
    ('RONALD', 'Ronald', 'YOUNGSTER', 'RONALD_TD', 'LIGHT_CLAY'),
    ('KLUTCH', 'Klutch', 'TEACHER', 'KLUTCH3', 'DRAGON_FANG'),
    ('AMAYA', 'Amaya', 'GRUNTF', 'AMAYA3', 'TWISTEDSPOON'),
    ('DALORIC', 'Daloric', 'COOLTRAINERM', 'DALORIC2', 'MUSCLE_BAND'),
    ('CRYSTAL', 'Crystal', 'COOLTRAINERM', 'CONTEST_CRYSTAL2', 'TOXIC_ORB'),
    ('ROSSOLON', 'Rossolon', 'COOLTRAINERM', 'ROSSOLON_TD', 'SCOPE_LENS'),
    ('BARTO', 'Barto', 'COOLTRAINERM', 'BARTO_TD', 'KINGS_ROCK'),
    ('CHAOS', 'Chaos', 'COOLTRAINERM', 'CHAOS_TD', 'AIR_BALLOON'),
    ('EMMY', 'Emmy', 'COOLTRAINERF', 'EMMY_TD', 'SHELL_BELL'),
    ('DAVE', 'Dave', 'PSYCHIC_T', 'DAVE_TD', 'FOCUS_BAND'),
    ('ACCAD', 'Accad', 'SAILOR', 'ACCAD_TD', 'LUM_BERRY'),
    ('JEFF', 'Jeff', 'BOARDER', 'JEFF_TD', 'QUICK_CLAW'),
    ('KYLE', 'Kyle', 'COOLTRAINERM', 'KYLE_TD', 'LEFTOVERS'),
    ('AARON', 'Aaron', 'RANGERM', 'AARON3', 'BRIGHTPOWDER'),
)
ORDER = ORDER + tuple(f'TD_{k}' for k, *_ in PLAYTESTERS)
NAMES = NAMES + tuple(n for _, n, *_ in PLAYTESTERS)
BEATEN = BEATEN + tuple(k for k, *_ in PLAYTESTERS)


def case_playtesters():
    """Every playtester challenger: unlocked by the World Cup, after Giovanni in the list, a real
    match (class, party, its line, the boss ace), +5 BP, the prize, the beaten flag."""
    g = setup()
    lst = open_list(g)
    want = [td(g, f'TD_{k}') for k, *_ in PLAYTESTERS]
    check('World Champion only: the playtesters are all on the list, in order, at the end',
          lst[-len(want):] == want, str(lst))
    g.press('B', after=60)
    for i, (key, name, cls, party, prize) in enumerate(PLAYTESTERS):
        g = setup(bp=100)
        before = item_count(g, prize)
        g.press('U', hold=2, after=20)
        lst = open_list(g)
        s = fight(g, lst.index(td(g, f'TD_{key}')), win=True, shot_name=f'arena_{key.lower()}.png' if i < 3 else None)
        j = ' '.join(' '.join(t.split()) for t in s['texts'])
        check(f'{name}: a battle with {cls} {party}, won',
              s['battle'] and s['class'] == g.const(cls) and s['id'] == g.const(party) and s.get('result') == 0, brief(s))
        check(f'{name}: the intro names them ("{name}:")', f'{name}:' in j, str(s['texts'][-12:]))
        check(f'{name}: +5 BP, the prize ({prize}), the beaten flag',
              rd16be(g, 'wBattlePoints') == 105 and item_count(g, prize) == before + 1 and
              flag(g, f'EVENT_TITLE_DEFENSE_BEAT_{key}'), f"BP {rd16be(g, 'wBattlePoints')} item {item_count(g, prize) - before}")



def case_full_list():
    """Every challenger unlocked: more than the old 14-entry list held."""
    g = setup(flags=ALL_UNLOCKS)
    after = g.rd('wStringBuffer5+18')  # the last byte the list may use
    lst = open_list(g)
    want = [td(g, n) for n in ORDER]
    check(f'every challenger unlocked: all {len(want)} in TitleDefenseOrder, then the end mark',
          lst == want and list_end(g) == 0xff, f'{lst} end={list_end(g):#x}')
    check('the list stays inside wStringBuffer4/5', 1 + len(lst) + 1 <= 38, str(len(lst)))
    for _ in range(len(lst) - 1):
        g.press('D', after=12)
    t = ' '.join(g.screen_text().split())
    check(f'the menu scrolls to the last challenger ({NAMES[-1]})', NAMES[-1] in t, t)
    shot(g, 'td_list_end.png')
    g.press('B', after=60)


def passport_rows(g):
    tm = g.sym['wTilemap'][1]
    rows = g.screen_text().split('\n')
    names = [rows[r][2:16].strip() for r in range(10, 17)]
    count = rows[9][11:16].strip()
    up = g.rd(tm + 10 * 20 + 18) == 0xd8
    down = g.rd(tm + 16 * 20 + 18) == 0xee
    return names, count, up, down


def open_passport(g):
    """Start menu, down to the Passport ("Leagues & records"), A, then right to the Title Defense page."""
    g.press('START', hold=4, after=60)
    for _ in range(12):
        if 'records' in g.screen_text():
            break
        g.press('D', hold=4, after=30)
    g.press('A', hold=4, after=120)
    for _ in range(3):  # Leagues, Facilities, Resort, Title Defense
        g.press('R', hold=4, after=40)


def case_not_champion():
    """Challengers unlocked (Agatha, Petra) but the World Cup not won: no title defense."""
    g = setup(flags=ALL_UNLOCKS, champion=False)
    texts = []
    g.press('A', after=60)
    for _ in range(8):
        t = ' '.join(g.screen_text().split())
        if t and (not texts or texts[-1] != t):
            texts.append(t)
        g.press('A', after=40)
    joined = ' '.join(texts)
    check('not the World Champion: the clerk refuses ("Only the current World Champion")',
          'World Champion' in joined and 'Which challenger' not in joined, str(texts))
    # the challenger list itself is empty without the title, even when the menu is reached
    bank, addr = g.sym['TitleDefenseBuildList']
    g.run_script(f'\tdb callasm_command\n\tdb {bank}\n\tdw {addr}\n\tend')
    g.frames(10)
    check('the challenger list is empty without the title', g.rd('wStringBuffer4') == 0, str(g.rd('wStringBuffer4')))


def case_passport():
    """The Passport's Title Defense page: the beaten challengers, a scrolling list."""
    g = setup(flags=tuple(f'EVENT_TITLE_DEFENSE_BEAT_{n}' for n in ('SILVER', 'RED', 'PETRA')))
    open_passport(g)
    names, count, up, down = passport_rows(g)
    check('Passport, 3 beaten: their full names in order, count 3, no arrows',
          names[:4] == ['Silver', 'Red', 'Petra', ''] and count == '3' and not up and not down,
          f'{names} {count} {up} {down}')
    shot(g, 'passport_td_3.png')
    g.press('D', hold=4, after=40)
    check('Down does nothing when the list fits', passport_rows(g)[0][0] == 'Silver' and g.rd('wPassportListTop') == 0)

    g = setup(flags=tuple(f'EVENT_TITLE_DEFENSE_BEAT_{n}' for n in BEATEN))
    open_passport(g)
    names, count, up, down = passport_rows(g)
    check(f'Passport, {len(NAMES)} beaten: the first 7, the count, a down arrow only',
          names == list(NAMES[:7]) and count == str(len(NAMES)) and not up and down, f'{names} {count} {up} {down}')
    shot(g, 'passport_td_top.png')
    g.press('D', hold=4, after=40)
    names, count, up, down = passport_rows(g)
    check('Down scrolls one row: Green first, both arrows', names == list(NAMES[1:8]) and up and down, str(names))
    for _ in range(len(NAMES) - 7 - 1 + 2):
        g.press('D', hold=4, after=40)
    names, count, up, down = passport_rows(g)
    check('scrolled to the end: the last 7, an up arrow only',
          names == list(NAMES[-7:]) and up and not down and g.rd('wPassportListTop') == len(NAMES) - 7,
          f'{names} {up} {down}')
    shot(g, 'passport_td_end.png')
    g.press('U', hold=4, after=40)
    check('Up scrolls back one row', passport_rows(g)[0] == list(NAMES[-8:-1]), str(passport_rows(g)[0]))
    g.press('R', hold=4, after=40)
    g.press('L', hold=4, after=40)
    names, count, up, down = passport_rows(g)
    check('turning pages starts the list at the top again', names == list(NAMES[:7]) and not up, str(names))
    g.press('B', hold=4, after=60)


def main():
    if SHOTS:
        os.makedirs(SHOTS, exist_ok=True)
    lobby = lambda g: (g.const('MAP_WC_CHALLENGER_LOBBY'),) + CLERK_POS

    # the World Cup win alone (a Johto start): the three rivals and the pairs, no Champions, no Red
    g = setup()
    lst = open_list(g)
    want = [td(g, n) for n in ('TD_SILVER', 'TD_GREEN', 'TD_WALLY', 'TD_TATE_LIZA', 'TD_KIMONO_GIRLS', 'TD_TWINS', 'TD_ACE_DUO')]
    check('the World Cup win: Silver, Green, Wally and the four pairs (then the playtesters)',
          core(g, lst) == want, str(lst))
    check('nothing marked yet', not any(marks(g).values()), str(marks(g)))
    shot(g, 'list.png')

    # a Kanto start with every rematch: the rivals, the Champions, the pairs; Red once the three
    # Champions were beaten in title defenses
    rematches = ('EVENT_START_KANTO', 'EVENT_BEAT_JOHTO_LEAGUE_REMATCH', 'EVENT_BEAT_INDIGO_LEAGUE_REMATCH',
                 'EVENT_BEAT_HOENN_LEAGUE_REMATCH')
    champs = ('EVENT_TITLE_DEFENSE_BEAT_LANCE', 'EVENT_TITLE_DEFENSE_BEAT_AGATHA', 'EVENT_TITLE_DEFENSE_BEAT_STEVEN')
    g = setup(flags=rematches + champs)
    lst = open_list(g)
    want = [td(g, n) for n in ('TD_SILVER', 'TD_GREEN', 'TD_WALLY', 'TD_LANCE', 'TD_AGATHA', 'TD_STEVEN', 'TD_TATE_LIZA',
                               'TD_KIMONO_GIRLS', 'TD_TWINS', 'TD_ACE_DUO', 'TD_RED')]
    check('Kanto start, rematches, the three Champions beaten: rivals, Champions, pairs, Red',
          core(g, lst) == want, str(lst))
    g = setup(flags=rematches + champs[:2], defenses=50)
    lst = open_list(g)
    check('Steven not beaten (50 defenses): no Red yet', td(g, 'TD_RED') not in lst, str(lst))

    # the Rocket challengers: Archer after the Radio Tower, Jane after the Desert Shrine,
    # Petra after the Safari Zone, Giovanni once all three were beaten in title defenses
    rockets = ('EVENT_CLEARED_RADIO_TOWER', 'EVENT_BEAT_SHRINE_JANE', 'EVENT_BEAT_SAFARI_ROCKETS')
    g = setup(flags=rockets[:2])
    lst = open_list(g)
    check('Radio Tower and Desert Shrine: Archer and Jane, no Petra, no Giovanni',
          td(g, 'TD_ARCHER') in lst and td(g, 'TD_JANE') in lst and td(g, 'TD_PETRA') not in lst and
          td(g, 'TD_GIOVANNI') not in lst, str(lst))
    g = setup(flags=rockets + ('EVENT_TITLE_DEFENSE_BEAT_ARCHER', 'EVENT_TITLE_DEFENSE_BEAT_JANE'))
    lst = open_list(g)
    check('Safari Zone: Petra after Jane; Archer and Jane beaten, Petra not: no Giovanni yet',
          core(g, lst)[-3:] == [td(g, 'TD_ARCHER'), td(g, 'TD_JANE'), td(g, 'TD_PETRA')] and td(g, 'TD_GIOVANNI') not in lst,
          str(lst))
    g = setup(flags=rockets + ('EVENT_TITLE_DEFENSE_BEAT_ARCHER', 'EVENT_TITLE_DEFENSE_BEAT_JANE'), bp=100)
    policies = item_count(g, 'WEAKNESS_POLICY')
    g.press('U', hold=2, after=20)
    lst = open_list(g)
    s = fight(g, lst.index(td(g, 'TD_PETRA')), win=True, shot_name='arena_petra.png')
    check('Petra: a CANLOSE battle with PETRA_TD, won',
          s['battle'] and s['class'] == g.const('EXECUTIVEF') and s['id'] == g.const('PETRA_TD') and
          s.get('result') == 0, brief(s))
    check('Petra: her opening line', said(s, 'Petra: Kanto was'), str(s['texts'][-15:]))
    check('Petra: +5 BP, a Weakness Policy, flag set',
          rd16be(g, 'wBattlePoints') == 105 and item_count(g, 'WEAKNESS_POLICY') == policies + 1 and
          flag(g, 'EVENT_TITLE_DEFENSE_BEAT_PETRA'), f"{rd16be(g, 'wBattlePoints')}")
    g = setup(flags=rockets + ('EVENT_TITLE_DEFENSE_BEAT_ARCHER', 'EVENT_TITLE_DEFENSE_BEAT_JANE',
                               'EVENT_TITLE_DEFENSE_BEAT_PETRA'), bp=100)
    bands = item_count(g, 'CHOICE_BAND')
    g.press('U', hold=2, after=20)
    lst = open_list(g)
    check('Archer, Jane and Petra beaten: Giovanni after Petra', core(g, lst)[-2:] == [td(g, 'TD_PETRA'), td(g, 'TD_GIOVANNI')],
          str(lst))
    s = fight(g, lst.index(td(g, 'TD_GIOVANNI')), win=True, shot_name='arena_giovanni.png')
    check('Giovanni: a CANLOSE battle with GIOVANNI_TD, won',
          s['battle'] and s['class'] == g.const('GIOVANNI') and s['id'] == g.const('GIOVANNI_TD') and
          s.get('result') == 0, brief(s))
    check('Giovanni: +10 BP, a Choice Band, flag set',
          rd16be(g, 'wBattlePoints') == 110 and item_count(g, 'CHOICE_BAND') == bands + 1 and
          flag(g, 'EVENT_TITLE_DEFENSE_BEAT_GIOVANNI'), f"{rd16be(g, 'wBattlePoints')}")

    # a first win against Green (singles): defense, Expert Belt, BP, beaten flag, back at the clerk
    g = setup(bp=100)
    belts = item_count(g, 'EXPERT_BELT')
    g.press('U', hold=2, after=20)
    open_list(g)
    s = fight(g, 1, win=True, shot_name='arena_green.png')
    check('Green: the arena shows Green alone, Oak hidden',
          s.get('opp_sprite') == g.const('SPRITE_GREEN') and s.get('objects') == (True, False, False),
          f"{s.get('opp_sprite')} {s.get('objects')}")
    check('Green: announced, then his opening line', said(s, 'the title against Green!') and
          said(s, 'Green: Hey,'))
    check('Green: a CANLOSE battle with GREEN_TD',
          s['battle'] and s['class'] == g.const('GREEN') and s['id'] == g.const('GREEN_TD') and
          s['type'] == g.const('BATTLETYPE_CANLOSE'), brief(s))
    check('Green: won, back at the clerk', s.get('result') == 0 and s['back'] == lobby(g), str(s['back']))
    check('Green: 1 defense, +5 BP', rd16be(g, 'wTitleDefenses') == 1 and rd16be(g, 'wBattlePoints') == 105,
          f"{rd16be(g, 'wTitleDefenses')} {rd16be(g, 'wBattlePoints')}")
    check('Green: received 5 BP and the Expert Belt', said(s, 'received 5 BP!') and said(s, 'Expert Belt'))
    check('Green: beaten flag set, no match pending, Finals scene done',
          flag(g, 'EVENT_TITLE_DEFENSE_BEAT_GREEN') and g.rd('wTitleDefenseChallenger') == 0 and
          g.rd('wWCFinalsSceneID') == 2, f"{g.rd('wTitleDefenseChallenger')} {g.rd('wWCFinalsSceneID')}")
    check('Green: one Expert Belt more', item_count(g, 'EXPERT_BELT') == belts + 1)
    g.press('U', hold=2, after=20)
    open_list(g)
    m = marks(g)
    check('the list marks Green now, not Wally', m.get(td(g, 'TD_GREEN')) and not m.get(td(g, 'TD_WALLY')), str(m))
    shot(g, 'list_marked.png')
    # again: a defense only, no BP, no second belt
    s = fight(g, 1, win=True)
    check('Green again: 2 defenses, no BP, no second Expert Belt',
          s.get('result') == 0 and rd16be(g, 'wTitleDefenses') == 2 and rd16be(g, 'wBattlePoints') == 105 and
          item_count(g, 'EXPERT_BELT') == belts + 1 and not said(s, 'Expert Belt') and not said(s, 'BP!'),
          f"{rd16be(g, 'wTitleDefenses')} {rd16be(g, 'wBattlePoints')}")

    # a doubles pair: Kai & Rin, both on the field, 3 Exp. Candy XL
    g = setup()
    xl = item_count(g, 'EXP_CANDY_XL')
    g.press('U', hold=2, after=20)
    open_list(g)
    s = fight(g, 6, win=True, shot_name='arena_aceduo.png')
    check('Kai & Rin: both sprites in the arena',
          s.get('opp_sprite') == g.const('SPRITE_COOLTRAINER_M') and
          s.get('partner_sprite') == g.const('SPRITE_COOLTRAINER_F') and s.get('objects') == (True, True, False),
          f"{s.get('opp_sprite')} {s.get('partner_sprite')} {s.get('objects')}")
    check('Kai & Rin: a double battle with KAIANDRIN, won',
          s['class'] == g.const('ACE_DUO') and s['id'] == g.const('KAIANDRIN') and s.get('result') == 0, brief(s))
    check('Kai & Rin: 3 Exp. Candy XL, flag set', item_count(g, 'EXP_CANDY_XL') == xl + 3 and
          flag(g, 'EVENT_TITLE_DEFENSE_BEAT_ACE_DUO'))

    # a loss: nothing counted, nothing lost, party healed, back at the clerk
    g = setup(bp=50)
    money = g.rd('wMoney', 3)
    g.press('U', hold=2, after=20)
    open_list(g)
    s = fight(g, 2, win=False)
    psize = g.const('PARTYMON_STRUCT_LENGTH')
    healed = all(g.rd16(f'wPartyMon1HP+{i * psize}') == g.rd16(f'wPartyMon1MaxHP+{i * psize}')
                 for i in range(g.rd('wPartyCount')))
    check('Wally, lost: no defense, no BP, no flag', s.get('result') == 1 and rd16be(g, 'wTitleDefenses') == 0 and
          rd16be(g, 'wBattlePoints') == 50 and not flag(g, 'EVENT_TITLE_DEFENSE_BEAT_WALLY'), str(s.get('result')))
    check('Wally, lost: no money lost, party healed, back at the clerk, nothing pending',
          g.rd('wMoney', 3) == money and healed and s['back'] == lobby(g) and
          g.rd('wTitleDefenseChallenger') == 0, f"{s['back']} healed={healed}")
    check('Wally, lost: the announcer says so', said(s, 'challenger takes'))

    # Pack full: the defense counts; the item, BP and flag wait for the next win
    g = setup(full=True)
    g.press('U', hold=2, after=20)
    open_list(g)
    s = fight(g, 1, win=True)
    check('Pack full: a defense, no BP, no flag (item and BP come with a later win)',
          s.get('result') == 0 and rd16be(g, 'wTitleDefenses') == 1 and rd16be(g, 'wBattlePoints') == 0 and
          not flag(g, 'EVENT_TITLE_DEFENSE_BEAT_GREEN'))

    # declining at "ready?" leaves nothing pending
    g = setup()
    open_list(g)
    g.press('A', after=60)
    for _ in range(10):
        t = g.screen_text()
        if 'arena?' in t and 'Yes' in t:
            g.press('D', after=10)
            g.press('A', after=60)
            break
        g.press('A', after=40)
    for _ in range(5):
        g.press('B', after=30)
    check('declined: nothing pending, still in the lobby',
          g.rd('wTitleDefenseChallenger') == 0 and g.rd('wMapNumber') == g.const('MAP_WC_CHALLENGER_LOBBY'))
    case_full_list()
    case_passport()
    case_not_champion()
    case_playtesters()

    bad = [n for n, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
