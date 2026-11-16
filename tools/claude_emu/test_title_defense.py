"""World Cup title defense (engine/events/title_defense.asm), played from the
Challenger Lobby's title clerk.

The list holds the unlocked challengers (the other start regions' rivals, the
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
CLERK_POS = (33, 17)
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


def setup(flags=(), defenses=0, bp=0, full=False):
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    for f in ('EVENT_WORLD_CUP_QUALIFIED', 'EVENT_WORLD_CUP_CHAMPION') + tuple(flags):
        set_flag(g, f)
    g.wr('wTitleDefenses', [defenses >> 8, defenses & 0xff])
    g.wr('wBattlePoints', [bp >> 8, bp & 0xff])
    g.wr('wOptions', g.rd('wOptions') | 1 << g.const('BATTLE_SHIFT'))  # Set: no "Will you switch?"
    if full:  # the item pocket full of Potions: no room for a prize
        pot = g.const16('POTION')
        n = g.const('MAX_ITEMS')
        g.wr('wNumItems', n)
        g.wr('wItems', [pot >> 8, pot & 0xff, 1] * n + [0xff])
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
    n = g.rd('wCurMartCount')
    return [i - 1 for i in g.rd('wCurMartItems', n)] if n else []


def marks(g):
    """The challengers shown on the menu's first page with their mark (TD_* index -> bool)."""
    tm = g.sym['wTilemap'][1]
    shown = g.rd('wCurMartItems', min(4, g.rd('wCurMartCount')))
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


def main():
    if SHOTS:
        os.makedirs(SHOTS, exist_ok=True)
    lobby = lambda g: (g.const('MAP_WC_CHALLENGER_LOBBY'),) + CLERK_POS

    # the list for a Johto start (the boot save): no Silver, no Champions, no Red
    g = setup()
    lst = open_list(g)
    want = [td(g, n) for n in ('TD_GREEN', 'TD_WALLY', 'TD_TATE_LIZA', 'TD_KIMONO_GIRLS', 'TD_TWINS', 'TD_ACE_DUO')]
    check('Johto start: Green, Wally and the four pairs', lst == want, str(lst))
    check('nothing marked yet', not any(marks(g).values()), str(marks(g)))
    shot(g, 'list.png')

    # Kanto start with every rematch: Silver, Wally, the Champions, the pairs; Red once the three
    # Champions were beaten in title defenses
    rematches = ('EVENT_START_KANTO', 'EVENT_BEAT_JOHTO_LEAGUE_REMATCH', 'EVENT_BEAT_INDIGO_LEAGUE_REMATCH',
                 'EVENT_BEAT_HOENN_LEAGUE_REMATCH')
    champs = ('EVENT_TITLE_DEFENSE_BEAT_LANCE', 'EVENT_TITLE_DEFENSE_BEAT_AGATHA', 'EVENT_TITLE_DEFENSE_BEAT_STEVEN')
    g = setup(flags=rematches + champs)
    lst = open_list(g)
    want = [td(g, n) for n in ('TD_SILVER', 'TD_WALLY', 'TD_LANCE', 'TD_AGATHA', 'TD_STEVEN', 'TD_TATE_LIZA',
                               'TD_KIMONO_GIRLS', 'TD_TWINS', 'TD_ACE_DUO', 'TD_RED')]
    check('Kanto start, rematches, the three Champions beaten: Silver, Wally, Champions, pairs, Red',
          lst == want, str(lst))
    g = setup(flags=rematches + champs[:2], defenses=50)
    lst = open_list(g)
    check('Steven not beaten (50 defenses): no Red yet', td(g, 'TD_RED') not in lst, str(lst))

    # a first win against Green (singles): defense, Expert Belt, BP, beaten flag, back at the clerk
    g = setup(bp=100)
    belts = item_count(g, 'EXPERT_BELT')
    g.press('U', hold=2, after=20)
    open_list(g)
    s = fight(g, 0, win=True, shot_name='arena_green.png')
    check('Green: the arena shows Green alone, Oak hidden',
          s.get('opp_sprite') == g.const('SPRITE_GREEN') and s.get('objects') == (True, False, False),
          f"{s.get('opp_sprite')} {s.get('objects')}")
    check('Green: announced, then his opening line', said(s, 'the title against Green!') and
          said(s, 'Green: Hey,'))
    check('Green: a CANLOSE battle with WC_GREEN',
          s['battle'] and s['class'] == g.const('GREEN') and s['id'] == g.const('WC_GREEN') and
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
    s = fight(g, 0, win=True)
    check('Green again: 2 defenses, no BP, no second Expert Belt',
          s.get('result') == 0 and rd16be(g, 'wTitleDefenses') == 2 and rd16be(g, 'wBattlePoints') == 105 and
          item_count(g, 'EXPERT_BELT') == belts + 1 and not said(s, 'Expert Belt') and not said(s, 'BP!'),
          f"{rd16be(g, 'wTitleDefenses')} {rd16be(g, 'wBattlePoints')}")

    # a doubles pair: Kai & Rin, both on the field, 3 Exp. Candy XL
    g = setup()
    xl = item_count(g, 'EXP_CANDY_XL')
    g.press('U', hold=2, after=20)
    open_list(g)
    s = fight(g, 5, win=True, shot_name='arena_aceduo.png')
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
    s = fight(g, 1, win=False)
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
    s = fight(g, 0, win=True)
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

    bad = [n for n, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
