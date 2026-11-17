"""Trainer bosses (boss_mon in a trainer party; engine/battle/boss.asm).

Test parties are assembled with the repo's macros (Game.set_trainer) with a boss_mon
line on one Pokémon; the real parties are loaded as the game does. Checks: the boss's
record, party slot and bars from the party; the aura each time the boss comes in
(not for the others); a KO on the boss takes a bar (singles and doubles) with the
trainer's phase, and the bars stay when it's switched out; the pips on the HUD.

usage: test_trainer_boss.py ROM SYM STATE [--shots DIR]
"""
import os
import sys
from battle_test import Game, Battle, SCENE_OFF, LIB
from harness import at_menu

ROM, SYM, STATE = sys.argv[1:4]
SHOTS = sys.argv[sys.argv.index('--shots') + 1] if '--shots' in sys.argv else None
HARD, NORMAL = 0, 1  # wHardMode
RESULTS = []
STANDING = 'is still standing!'
AURA = 'aura flared!'
BOLT = [('JOLTEON', 60, None, ['THUNDERBOLT', 'HARDEN', 'WHIRLWIND'])]
LANCE_LINE = 'Dragonite,'


def check(name, ok, info=''):
    RESULTS.append((name, bool(ok)))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def setup(hard=NORMAL, party=BOLT):
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.clear_bag()
    g.set_party(party, ())
    g.wr('wHardMode', hard)
    g.wr('wOptions', 0x01 | SCENE_OFF | 1 << g.const('BATTLE_SHIFT'))
    g.seed()
    return g


def boss_ram(g):
    return g.rd('wBossID'), g.rd('wBossSlot'), g.rd('wBossBarsLeft'), g.rd('wBossBarsTotal')


def start(g, cls, pid):
    g.run_script(f'''TestScript:
	winlosstext .win, .loss
	loadtrainer {cls}, {pid}
	startbattle
	reloadmapafterbattle
	end
.win
	text "WIN"
	done
.loss
	text "LOSS"
	done''')


def to_menu(g):
    b = Battle(g, [])
    for _ in range(3000):
        g.frames(2)
        if g.in_battle():
            b.note(b.text())
        if g.in_battle() and at_menu(g):
            g.frames(60)
            return b.log
        if g.in_battle():
            g.press('B', hold=2, after=2)
    raise RuntimeError('no battle menu:\n' + g.screen_text())


def test_trainer(g, mons, boss_index, boss, doubles=False):
    extra = {boss_index: [f'boss_mon {boss}']}
    g.set_trainer('COOLTRAINERM', 'Test', mons, doubles=doubles, extra=extra)
    g.seed()
    g.wr('wBaseLevel', 0)
    start(g, 'COOLTRAINERM', 1)


class HookBattle(Battle):
    def __init__(self, g, actions, hook=None, **kw):
        super().__init__(g, actions, **kw)
        self.hook, self.menus = hook, []

    def at_menu(self):
        g = self.g
        self.menus.append({'ram': boss_ram(g), 'cur': g.rd('wCurOTMon'), 'hp': g.rd16('wEnemyMonHP'),
                           'max': g.rd16('wEnemyMonMaxHP'), 'log': list(self.log),
                           'levels': list(g.rd('wEnemyAtkLevel', 7)), 'pips': list(g.rd('wTilemap+22', 2))})
        if SHOTS and len(self.menus) <= 3 and getattr(self, 'shot_name', None):
            LIB.GB_set_rendering_disabled(g.gb, False)
            g.frames(3)
            g.shot(os.path.join(SHOTS, f'{self.shot_name}_{len(self.menus)}.png'), 3)
            LIB.GB_set_rendering_disabled(g.gb, True)
        if self.hook:
            self.hook(g, len(self.menus) - 1)
        super().at_menu()


def count(log, s):
    return sum(s in x for x in log)


def joined(log):
    return ' '.join(' '.join(x.split()) for x in log)


def case_setup():
    g = setup()
    test_trainer(g, [(5, 'RATTATA', None, ['TACKLE']), (5, 'DRAGONITE', None, ['TACKLE'])], 1, 'BOSS_LANCE')
    log = to_menu(g)
    boss = g.const('BOSS_LANCE')
    check('the party sets the boss: record, slot 1, 1 bar', boss_ram(g) == (boss, 1, 1, 1), str(boss_ram(g)))
    check('no aura while the lead (not the boss) is out, no pips', count(log, AURA) == 0 and
          g.rd('wTilemap+22', 2) != [g.const('BOSS_PIP_TILE')] * 2, str(log[-3:]))
    g = setup(HARD)
    test_trainer(g, [(5, 'RATTATA', None, ['TACKLE']), (5, 'DRAGONITE', None, ['TACKLE'])], 1, 'BOSS_LANCE')
    to_menu(g)
    check('Hard mode: 2 bars', boss_ram(g)[2:] == (2, 2), str(boss_ram(g)))
    g = setup()
    test_trainer(g, [(5, 'RATTATA', None, ['TACKLE']), (5, 'PIDGEY', None, ['TACKLE'])], 0, 'BOSS_LANCE')
    g.set_trainer('YOUNGSTER', 'Joey', [(5, 'RATTATA', None, ['TACKLE'])])
    g.seed()
    g.wr('wBaseLevel', 0)
    start(g, 'YOUNGSTER', 1)
    to_menu(g)
    check('a trainer without a boss: no boss', g.rd('wBossID') == 0, str(boss_ram(g)))


def case_fight():
    g = setup()
    test_trainer(g, [(5, 'RATTATA', None, ['TACKLE']), (5, 'DRAGONITE', None, ['TACKLE'])], 1, 'BOSS_LANCE')
    intro = to_menu(g)
    b = HookBattle(g, [('move', 0)] * 6)
    b.shot_name = 'singles'
    r = b.run()
    log = intro + [m for rec in r for m in rec.get('log', [])]
    m = b.menus
    j = joined(log)
    check('the boss comes in second: its aura (+1 Attack)', count(log, AURA) == 1 and len(m) >= 2 and
          m[1]['cur'] == 1 and m[1]['levels'][0] == g.const('BASE_STAT_LEVEL') + 1,
          f'aura={count(log, AURA)} menus={[(x["cur"], x["levels"][:3]) for x in m]}')
    check('its pip on the HUD while it is out', len(m) >= 2 and m[1]['pips'][0] == g.const('BOSS_PIP_TILE'),
          str([x['pips'] for x in m]))
    check('a KO takes its bar: "still standing", HP refilled, 0 bars left',
          len(m) >= 3 and m[2]['ram'][2] == 0 and m[2]['hp'] == m[2]['max'] and count(log, STANDING) == 1,
          f'{[(x["ram"], x["hp"]) for x in m]}')
    check("the phase: Lance's line, +1 Speed and Defense", 'Lance: Dragonite' in j and len(m) >= 3 and
          m[2]['levels'][2] >= g.const('BASE_STAT_LEVEL') + 1 and m[2]['levels'][1] == g.const('BASE_STAT_LEVEL') + 1,
          f'{m[2]["levels"] if len(m) > 2 else None}')
    check('then it faints and the battle is won', r[-1].get('result') == 0 and len(m) == 3, f'{r[-1].get("result")} {len(m)}')


def case_switch():
    # the boss leads; Whirlwind blows it out and back in: the aura again, the bar it lost stays lost
    g = setup()
    test_trainer(g, [(5, 'DRAGONITE', None, ['TACKLE']), (5, 'RATTATA', None, ['TACKLE'])], 0, 'BOSS_LANCE')

    def hook(g, turn):
        if turn == 0:
            g.wr('wEnemyMonHP', [0, 1])
    intro = to_menu(g)
    b = HookBattle(g, [('move', 0), ('move', 2), ('move', 2), ('move', 2), ('move', 0), ('move', 0), ('move', 0)],
                   hook)
    r = b.run()
    log = intro + [m for rec in r for m in rec.get('log', [])]
    m = b.menus
    back = [i for i, x in enumerate(m) if i > 1 and x['cur'] == 0]
    check('the lead boss: its aura at the start', count(intro, AURA) == 1, str(intro[-4:]))
    check('switched out and back: the aura again, still 0 bars', back and m[back[0]]['ram'][2] == 0 and
          count(log, AURA) >= 2, f'{[(x["cur"], x["ram"][2]) for x in m]} aura={count(log, AURA)}')
    check('no second bar after coming back; the battle is won', count(log, STANDING) == 1 and r[-1].get('result') == 0,
          f'standing={count(log, STANDING)} result={r[-1].get("result")}')


def case_doubles():
    party = [('JOLTEON', 60, None, ['DISCHARGE', 'HARDEN']), ('JOLTEON', 60, None, ['DISCHARGE', 'HARDEN'])]
    g = setup(party=party)
    test_trainer(g, [(5, 'RATTATA', None, ['TACKLE']), (5, 'DRAGONITE', None, ['TACKLE']),
                     (5, 'PIDGEY', None, ['TACKLE'])], 1, 'BOSS_LANCE', doubles=True)
    intro = to_menu(g)
    b = HookBattle(g, [('move', 0)] * 8)
    b.shot_name = 'doubles'
    r = b.run()
    log = intro + [m for rec in r for m in rec.get('log', [])]
    check('doubles: the boss lead shows its aura', count(log, AURA) == 1, str(count(log, AURA)))
    check('doubles: a KO takes its bar ("still standing"), then the battle is won',
          count(log, STANDING) == 1 and r[-1].get('result') == 0, f'standing={count(log, STANDING)} res={r[-1].get("result")}')
    check("doubles: Lance's line at the bar break", 'Lance: Dragonite' in joined(log))


def case_real():
    for cls, pid, boss, slot, bars in [('RED', 'RED1', 'BOSS_RED', 0, 2), ('CHAMPION', 'LANCE2', 'BOSS_LANCE', 5, 1),
                                       ('AGATHA', 'AGATHA2', 'BOSS_AGATHA', 4, 1), ('STEVEN', 'STEVEN2', 'BOSS_STEVEN', 5, 1),
                                       ('RIVAL2', 'RIVAL2_TD', 'BOSS_TD_SILVER', 5, 1), ('RIVAL2', 'RIVAL2_WC', 'BOSS_NONE', 0, 0),
                                       ('TATELIZA', 'TATELIZA_TD', 'BOSS_TD_TATE_LIZA', 5, 1),
                                       ('TATELIZA', 'TATELIZA3', 'BOSS_NONE', 0, 0),
                                       ('EXECUTIVEM', 'EXECUTIVEM_5', 'BOSS_ARCHER', 0, 1),
                                       ('EXECUTIVEF', 'DESERT_JANE', 'BOSS_JANE', 5, 1),
                                       ('KIMONO_GIRL', 'NAOKOANDZUKI', 'BOSS_TD_KIMONO', 5, 1)]:
        g = setup()
        start(g, cls, pid)
        log = to_menu(g)
        want = g.const(boss)
        ram = boss_ram(g)
        ok = ram[0] == want and (not want or (ram[1] == slot and ram[2] == bars))
        check(f'{pid}: {boss}' + (f', slot {slot}, {bars} bars' if want else ''), ok, str(ram))
        if pid == 'RED1':
            check('RED1: Pikachu leads, so its aura shows at once', count(log, AURA) == 1, str(log[-4:]))


def main():
    if SHOTS:
        os.makedirs(SHOTS, exist_ok=True)
    for c in (case_setup, case_fight, case_switch, case_doubles, case_real):
        try:
            c()
        except Exception as e:
            check(f'{c.__name__} ran', False, repr(e))
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
