"""Boss battles (engine/battle/boss.asm): one case per rule.

Each case boots the overworld state, gives a party, sets wHardMode and starts a battle
with a script (loadmem wBossID, as loadboss does, then loadwildmon and startbattle).
The setup cases read the boss RAM at the first battle menu, then run away. The bar
cases fight: a hook at each battle menu sets up the enemy (status, HP, moves), and the
checks read the boss RAM, the enemy and the message log at the next menu.

usage: test_boss.py ROM SYM STATE
"""
import sys
from battle_test import Game, Battle, SCENE_OFF, assemble_block, SCRIPT_ORG
from harness import at_menu

ROM, SYM, STATE = sys.argv[1:4]
PARTY = [('JOLTEON', 60, None, ['THUNDERSHOCK'])]
HARD, NORMAL = 0, 1  # wHardMode
RESULTS = []


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def setup(hard=NORMAL):
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.clear_bag()
    g.set_party(PARTY, ())
    g.wr('wHardMode', hard)
    g.wr('wOptions', 0x01 | SCENE_OFF)
    g.wr('wWildLevel', 0)
    g.seed()
    return g


def loadboss(g, boss):
    return f"\tloadmem ${g.sym['wBossID'][1]:04x}, {boss}\n" if boss is not None else ''


def boss_ram(g):
    return g.rd('wBossID'), g.rd('wBossBarsLeft'), g.rd('wBossBarsTotal')


def to_menu(g):
    """Run to the first battle menu; the messages on the way go to g.intro_log."""
    b = Battle(g, [])
    for _ in range(3000):
        g.frames(2)
        if g.in_battle():
            b.note(b.text())
        if g.in_battle() and at_menu(g):
            g.frames(60)
            g.intro_log = b.log
            return
        if g.in_battle():
            g.press('B', hold=2, after=2)
    raise RuntimeError('no battle menu:\n' + g.screen_text())


def wild(g, boss, species='GYARADOS', level=10):
    g.run_script(f'TestScript:\n{loadboss(g, boss)}\tloadwildmon {species}, {level}\n'
                 '\tstartbattle\n\treloadmapafterbattle\n\tend')
    to_menu(g)


def run_away(g):
    Battle(g, [('run',)] * 3).run()
    for _ in range(300):
        if not g.in_battle():
            break
        g.frames(2)
    return not g.in_battle()


def set_flags(g, boss, flags):
    """ROM-patch a boss record's flags."""
    g.poke_rom(g.rom_addr('BossRecords') + (boss - 1) * g.const('BOSS_RECORD_SIZE') + 1, [flags])


def case_wild(name, boss_const, hard, bars):
    g = setup(hard)
    boss = g.const(boss_const)
    set_flags(g, boss, g.const('BOSS_CAN_FLEE'))  # BOSS_CAN_FLEE: these cases end by running
    wild(g, boss)
    ram = boss_ram(g)
    check(f'{name}: boss {boss}, {bars} extra bars', ram == (boss, bars, bars), f'ram={ram}')
    left = run_away(g)
    check(f'{name}: wBossID cleared after the battle', left and g.rd('wBossID') == 0,
          f'left={left} id={g.rd("wBossID")}')


def case_no_boss():
    g = setup()
    wild(g, None)
    check('no loadboss: a normal battle', g.rd('wBossID') == 0, f'ram={boss_ram(g)}')


def case_bad_id():
    g = setup()
    wild(g, g.const('NUM_BOSSES'))
    check('an unknown ID is cleared', g.rd('wBossID') == 0, f'ram={boss_ram(g)}')


def case_trainer():
    g = setup()
    g.set_trainer('YOUNGSTER', 'Joey', [(5, 'RATTATA', None, ['TACKLE'])])
    g.seed()
    g.wr('wBaseLevel', 0)
    g.run_script(f'''TestScript:
	winlosstext .win, .loss
{loadboss(g, g.const('BOSS_MEWTWO'))}	loadtrainer YOUNGSTER, 1
	startbattle
	reloadmapafterbattle
	end
.win
	text "WIN"
	done
.loss
	text "LOSS"
	done''')
    to_menu(g)
    check('a trainer battle clears wBossID', g.rd('wBossID') == 0, f'ram={boss_ram(g)}')


ENEMY_SUB1 = 0  # offsets from wEnemySubStatus1


class HookBattle(Battle):
    """Battle with hook(g, turn) called at each battle menu before the action is chosen,
    and the boss RAM and enemy HP/status kept per menu."""
    def __init__(self, g, actions, replace=(), hook=None, shift=()):
        super().__init__(g, actions, replace, shift)
        self.hook, self.menus = hook, []

    def at_menu(self):
        g = self.g
        self.menus.append({'ram': boss_ram(g), 'hp': g.rd16('wEnemyMonHP'), 'max': g.rd16('wEnemyMonMaxHP'),
                           'status': g.rd('wEnemyMonStatus'), 'sub': list(g.rd('wEnemySubStatus1', 5)),
                           'atk': g.rd16('wEnemyMonAttack'), 'atk_level': g.rd('wEnemyAtkLevel'),
                           'stats_atk': g.rd16('wEnemyStats'), 'log': list(self.log),
                           'levels': list(g.rd('wEnemyAtkLevel', 7)), 'weather': (g.rd('wBattleWeather'), g.rd('wWeatherCount'))})
        if self.hook:
            self.hook(g, len(self.menus) - 1)
        super().at_menu()


def fight(g, boss, actions, hook=None, species='GYARADOS', level=10, replace=(), shift=()):
    """A boss battle to the end; returns (menus, full log, result)."""
    wild(g, boss, species, level)
    b = HookBattle(g, actions, replace, hook, shift)
    b.intro = g.intro_log
    r = b.run()
    log = [m for rec in r for m in rec.get('log', [])]
    return b.menus, log, r[-1].get('result')


def party_exp(g, i=0):
    size = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    e = g.rd(f'wPartyMon1Exp+{i * size}', 3)
    return e[0] << 16 | e[1] << 8 | e[2]


def party_move_id(g, i, slot):
    """The 8-bit ID of party mon i's move in a slot (to give the enemy that move)."""
    size = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    return g.rd(f'wPartyMon1Moves+{i * size + slot}')


def set_enemy_move(g, move_id):
    """The enemy's only move; also its choice for this turn (the AI chose before the menu)."""
    g.wr('wEnemyMonMoves', [move_id, 0, 0, 0])
    g.wr('wEnemyMonPP', [10, 0, 0, 0])
    g.wr('wCurEnemyMove', move_id)
    g.wr('wCurEnemyMoveNum', 0)


def idx(log, text, start=0):
    return next((i for i in range(start, len(log)) if text in log[i]), -1)


STANDING = 'is still standing!'
BOLT = [('JOLTEON', 60, None, ['THUNDERBOLT', 'HARDEN', 'HORN_DRILL', 'DOUBLE_EDGE'])]  # Harden: no damage


def case_bars_and_exp():
    # a normal battle's EXP for the same KO
    g = setup()
    g.set_party(BOLT, ())
    e0 = party_exp(g)
    menus, log, res = fight(g, None, [('move', 0)] * 3)
    normal = party_exp(g) - e0

    g = setup()
    g.set_party(BOLT, ())
    e0 = party_exp(g)
    boss = g.const('BOSS_RED_GYARADOS')
    menus, log, res = fight(g, boss, [('move', 0)] * 4)
    m1 = menus[1] if len(menus) > 1 else {}
    s = idx(log, STANDING)
    check('a KO takes a bar: still in battle, HP refilled, 0 bars left',
          len(menus) >= 2 and m1['ram'] == (boss, 0, 1) and m1['hp'] == m1['max'], f'menus={[m["ram"] for m in menus]}')
    check('the boss acts in the turn its bar breaks', s >= 0 and idx(log, 'Wild Gyarados used', s) > s
          or s >= 0 and idx(log, 'used', s) > s, f'log={log[:8]}')
    check('the last bar: the battle is won', len(menus) == 2 and res == 0 and not g.rd('wBossID'),
          f'menus={len(menus)} res={res}')
    gained = party_exp(g) - e0
    check('EXP once, as for a normal KO', gained == normal and normal > 0, f'boss={gained} normal={normal}')


def case_hard_bars():
    g = setup(HARD)
    g.set_party(BOLT, ())
    boss = g.const('BOSS_RED_GYARADOS')
    menus, log, res = fight(g, boss, [('move', 0)] * 5)
    check('Hard mode: two new bars, then the win', [m['ram'][1] for m in menus] == [2, 1, 0] and res == 0
          and sum(STANDING in m for m in log) == 2, f'bars={[m["ram"] for m in menus]} res={res}')


def case_status():
    g = setup()
    g.set_party(BOLT, ())
    boss = g.const('BOSS_RED_GYARADOS')

    def hook(g, turn):
        if turn == 0:
            g.wr('wEnemyMonStatus', 1 << g.const('BRN'))
            sub = g.rd('wEnemySubStatus1', 5)
            sub[0] |= 1 << g.const('SUBSTATUS_CURSE') | 1 << g.const('SUBSTATUS_PERISH')
            sub[2] |= 1 << g.const('SUBSTATUS_CONFUSED')
            sub[3] |= 1 << g.const('SUBSTATUS_LEECH_SEED')
            sub[4] |= 1 << g.const('SUBSTATUS_TOXIC')
            g.wr('wEnemySubStatus1', sub)
            g.wr('wEnemyConfuseCount', 3); g.wr('wEnemyPerishCount', 3); g.wr('wEnemyToxicCount', 2)
            g.wr('wEnemyAtkLevel', g.const('BASE_STAT_LEVEL') + 2)
            g.wr16('wEnemyMonAttack', 1)
    menus, log, res = fight(g, boss, [('move', 0)] * 4, hook)
    m = menus[1] if len(menus) > 1 else None
    check('a new bar clears status and volatile effects', m and m['status'] == 0
          and m['sub'][0] & (1 << g.const('SUBSTATUS_CURSE') | 1 << g.const('SUBSTATUS_PERISH')) == 0
          and m['sub'][2] & 1 << g.const('SUBSTATUS_CONFUSED') == 0
          and m['sub'][3] & 1 << g.const('SUBSTATUS_LEECH_SEED') == 0
          and m['sub'][4] & 1 << g.const('SUBSTATUS_TOXIC') == 0, f'menu={m and (m["status"], m["sub"])}')
    check('it keeps its stat stages; Attack recalculated (+2 = x2)', m and m['atk_level'] == g.const('BASE_STAT_LEVEL') + 2
          and m['atk'] == m['stats_atk'] * 2 and m['hp'] == m['max'], f'menu={m and (m["atk_level"], m["atk"], m["stats_atk"], m["hp"])}')


def case_keep_status():
    g = setup()
    rec = g.rom_addr('BossRecords')
    g.poke_rom(rec + 1, [g.const('BOSS_KEEP_STATUS')])  # the Red Gyarados record's flags
    g.set_party(BOLT, ())
    boss = g.const('BOSS_RED_GYARADOS')

    def hook(g, turn):
        if turn == 0:
            g.wr('wEnemyMonStatus', 1 << g.const('PAR'))
    menus, log, res = fight(g, boss, [('move', 0)] * 4, hook)
    m = menus[1] if len(menus) > 1 else None
    check('BOSS_KEEP_STATUS: the status stays on a new bar', m and m['status'] == 1 << g.const('PAR') and m['ram'][1] == 0,
          f'menu={m and (m["status"], m["ram"])}')


def case_ohko():
    g = setup()
    g.set_party(BOLT, ())
    boss = g.const('BOSS_RED_GYARADOS')

    def hook(g, turn):
        if turn == 0:   # Lock-On: the OHKO move can't miss
            g.wr('wEnemySubStatus5', g.rd('wEnemySubStatus5') | 1 << g.const('SUBSTATUS_LOCK_ON'))
    menus, log, res = fight(g, boss, [('move', 2), ('move', 0), ('move', 0)], hook)
    check('an OHKO move takes one bar', len(menus) >= 2 and menus[1]['ram'][1] == 0 and menus[1]['hp'] == menus[1]['max']
          and any('one-hit KO' in x or 'one-hit' in x.lower() for x in log), f'menus={[m["ram"] for m in menus]} log={log[:6]}')


def case_selfdestruct():
    g = setup()
    g.set_party(BOLT + [('GOLEM', 5, None, ['SELFDESTRUCT'])], ())
    sd = party_move_id(g, 1, 0)
    boss = g.const('BOSS_RED_GYARADOS')

    def hook(g, turn):
        if turn == 0:
            set_enemy_move(g, sd)
    menus, log, res = fight(g, boss, [('move', 1), ('move', 0), ('move', 0)], hook)
    check('its own Selfdestruct takes a bar', len(menus) >= 2 and menus[1]['ram'][1] == 0
          and menus[1]['hp'] == menus[1]['max'] and STANDING in ' '.join(log), f'menus={[m["ram"] for m in menus]} log={log[:6]}')


def case_residual(slow_player):
    g = setup()
    party = [('SHUCKLE', 60, None, ['HARDEN', 'SLAM'])] if slow_player else BOLT
    g.set_party(party, ())
    boss = g.const('BOSS_RED_GYARADOS')

    def hook(g, turn):
        if turn == 0:
            g.wr16('wEnemyMonHP', 1)
            g.wr('wEnemyMonStatus', 1 << g.const('PSN'))
    menus, log, res = fight(g, boss, [('move', 1 if not slow_player else 0)] + [('move', 0 if not slow_player else 1)] * 4,
                            hook, level=60 if slow_player else 10)
    s = idx(log, STANDING)
    name = 'poison KOs it after its move' + (' (it moves first: the player still acts)' if slow_player else '')
    ok = len(menus) >= 2 and menus[1]['ram'][1] == 0 and menus[1]['hp'] == menus[1]['max'] and s >= 0
    if slow_player:
        ok = ok and idx(log, 'Shuckle used Harden', s) > s
    check(name, ok, f'menus={[(m["ram"], m["hp"]) for m in menus]} log={log[:8]}')


def case_sandstorm():
    g = setup()
    g.set_party(BOLT, ())
    boss = g.const('BOSS_RED_GYARADOS')

    def hook(g, turn):
        if turn == 0:
            g.wr16('wEnemyMonHP', 1)
            g.wr('wBattleWeather', g.const('WEATHER_SANDSTORM')); g.wr('wWeatherCount', 5)
    menus, log, res = fight(g, boss, [('move', 1)] + [('move', 0)] * 4, hook)
    check('end-of-turn sandstorm takes a bar', len(menus) >= 2 and menus[1]['ram'][1] == 0
          and menus[1]['hp'] == menus[1]['max'], f'menus={[(m["ram"], m["hp"]) for m in menus]} log={log[:8]}')


def case_double_ko():
    g = setup()
    g.set_party(BOLT + [('SNORLAX', 60, None, ['BODY_SLAM'])], ())
    boss = g.const('BOSS_RED_GYARADOS')
    size = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]

    def hook(g, turn):
        if turn == 0:
            g.wr16('wBattleMonHP', 1); g.wr16('wPartyMon1HP', 1)
    menus, log, res = fight(g, boss, [('move', 3)] + [('move', 0)] * 4, hook, replace=[1], shift=[True])
    m = menus[1] if len(menus) > 1 else None
    check('a double KO (recoil): a new bar, and the player sends in the next mon',
          m and m['ram'][1] == 0 and m['hp'] == m['max'] and g.rd16('wPartyMon1HP') == 0 and res == 0,
          f'menus={[(x["ram"], x["hp"]) for x in menus]} res={res} log={log[:8]}')


def pip_tiles(g):
    return list(g.rd('wTilemap+22', 2))  # row 1, columns 2-3


def case_pips():
    g = setup(HARD)
    g.set_party(BOLT, ())
    boss = g.const('BOSS_MEWTWO')
    one, two, blank = g.const('BOSS_PIP_TILE'), g.const('BOSS_PIP_TILE + 1'), 0x7f
    seen = []
    menus, log, res = fight(g, boss, [('move', 0)] * 8, lambda g, t: seen.append(pip_tiles(g)),
                            species='MEWTWO', level=20)
    want = [[two, one], [two, blank], [one, blank], [blank, blank]]
    steps = [p for i, p in enumerate(seen) if i == 0 or p != seen[i - 1]]  # a bar can take several turns
    check('pips: one per extra bar left, redrawn on each new bar', steps == want, f'seen={seen}')


BASE = 7  # BASE_STAT_LEVEL
ATK, DEF, SPE, SPA, SPD = range(5)  # wEnemyStatLevels order


def lv(m, *pairs):
    """True if menu m's stat levels match BASE + stages for each (stat, stages)."""
    return all(m['levels'][st] == BASE + n for st, n in pairs)


def case_aura():
    g = setup()
    g.set_party(BOLT, ())
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 0)] * 3)
    m0, intro = menus[0], g.intro_log
    a = idx(intro, 'aura flared')
    check('aura: "aura flared!", then Attack +1 before the first turn', a >= 0 and idx(intro, 'Attack went up', a) > a
          and lv(m0, (ATK, 1), (SPE, 0)), f'levels={m0["levels"]} intro={intro}')
    m1 = menus[1] if len(menus) > 1 else None
    ok = m1 and m1['weather'][0] == g.const('WEATHER_RAIN') and lv(m1, (ATK, 1), (DEF, 1), (SPE, 0))
    check('phase on the new bar: rain, Defense +1, the aura\'s Attack kept', ok and STANDING in ' '.join(m1['log'])
          and idx(m1['log'], 'downpour', idx(m1['log'], STANDING)) > 0,
          f'm1={m1 and (m1["levels"], m1["weather"], m1["log"])}')


def case_aura_two_stages():
    g = setup()
    g.set_party(BOLT, ())
    menus, log, res = fight(g, g.const('BOSS_REGIROCK'), [('move', 0)] * 4, species='REGIROCK', level=10)
    m0 = menus[0]
    check('a 2-stage aura: "went way up", Defense +2', lv(m0, (DEF, 2)) and any('way up' in x for x in g.intro_log),
          f'levels={m0["levels"]} intro={g.intro_log}')


def case_hard_phases():
    g = setup(HARD)
    g.set_party(BOLT, ())
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 0)] * 5)
    w = [m['weather'][0] for m in menus]
    dfn = [m['levels'][DEF] - BASE for m in menus]
    check('Hard: the added bar breaks first with no phase, then the phase', w[:3] == [0, 0, g.const('WEATHER_RAIN')]
          and dfn[:3] == [0, 0, 1] and res == 0, f'weather={w} defense={dfn}')


def case_two_phases():
    g = setup()
    g.set_party(BOLT, ())
    menus, log, res = fight(g, g.const('BOSS_MEWTWO'), [('move', 0)] * 6, species='MEWTWO', level=20)
    lvls = [[m['levels'][i] - BASE for i in (DEF, SPA, SPD)] for m in menus]
    check('two phases in order (Mewtwo: Sp.Atk/Sp.Def each bar, Defense on the last)',
          lvls[:3] == [[0, 1, 1], [0, 2, 2], [1, 3, 3]] and res == 0, f'levels={lvls}')


def case_weather_aura():
    g = setup()
    g.set_party(BOLT, ())
    menus, log, res = fight(g, g.const('BOSS_KYOGRE'), [('move', 0)] * 6, species='KYOGRE', level=20)
    check('an aura weather lasting until replaced (Kyogre: rain, 255 turns)',
          menus[0]['weather'] == (g.const('WEATHER_RAIN'), 255) and lv(menus[0], (SPA, 1)),
          f'weather={menus[0]["weather"]} levels={menus[0]["levels"]}')


def case_clear_weather():
    g = setup()
    # the Red Gyarados phase becomes Rayquaza's aura (clear the weather)
    sym = g.sym['RayquazaAura'][1]
    g.poke_rom(g.rom_addr('RedGyaradosPhases'), [sym & 0xFF, sym >> 8])
    g.set_party(BOLT, ())

    def hook(g, turn):
        if turn == 0:
            g.wr('wBattleWeather', g.const('WEATHER_SANDSTORM')); g.wr('wWeatherCount', 5)
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 0)] * 4, hook)
    m1 = menus[1] if len(menus) > 1 else None
    check('WEATHER_NONE clears the weather, with a message', m1 and m1['weather'][0] == 0
          and any('cleared up' in x for x in m1['log']), f'm1={m1 and (m1["weather"], m1["log"])}')


def case_air_lock():
    g = setup()
    g.set_party([('PSYDUCK', 60, None, ['THUNDERBOLT', 'HARDEN'])], ())  # Cloud Nine (Air Lock's twin)
    menus, log, res = fight(g, g.const('BOSS_KYOGRE'), [('move', 0)] * 6, species='KYOGRE', level=10)
    check('Cloud Nine: a boss aura sets no weather (Kyogre), its stat stage still applies',
          menus[0]['weather'][0] == 0 and lv(menus[0], (SPA, 1)),
          f'weather={menus[0]["weather"]} levels={menus[0]["levels"]} intro={g.intro_log}')
    g = setup()
    g.set_party([('PSYDUCK', 60, None, ['THUNDERBOLT', 'HARDEN'])], ())
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 0)] * 4)
    m1 = menus[1] if len(menus) > 1 else None
    check('Cloud Nine: a boss phase sets no weather (Red Gyarados), Defense +1 still',
          m1 and m1['weather'][0] == 0 and lv(m1, (DEF, 1)),
          f'm1={m1 and (m1["weather"], m1["levels"], m1["log"])}')


def case_stat_cap():
    g = setup()
    g.set_party(BOLT, ())

    def hook(g, turn):
        if turn == 0:
            g.wr(f'wEnemyAtkLevel+{SPA}', BASE + 6)
    menus, log, res = fight(g, g.const('BOSS_MEWTWO'), [('move', 0)] * 6, hook, species='MEWTWO', level=20)
    m1 = menus[1] if len(menus) > 1 else None
    check('a phase at +6: the stat stays at +6 with "won\'t rise anymore!"',
          m1 and m1['levels'][SPA] == BASE + 6 and any('rise anymore' in x for x in m1['log']),
          f'm1={m1 and (m1["levels"], m1["log"])}')


def case_auto_catch_no_room():
    g = setup()
    g.poke_rom(g.rom_addr('NewStorageBoxPointer'), [0x37, 0xC9])  # scf / ret: the storage system is full
    six = BOLT + [('RATTATA', 5, None, ['TACKLE'])] * 5
    g.set_party(six, ())
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 0)] * 4)
    check('auto-catch with party and boxes full: a normal faint, nothing caught',
          not any('caught' in x for x in log) and not any('exhausted' in x for x in log)
          and any('fainted' in x for x in log) and g.rd('wPartyCount') == 6 and res == 0,
          f'party={g.rd("wPartyCount")} res={res} log={log[-6:]}')


GHOST = [('MISDREAVUS', 60, None, ['PERISH_SONG', 'HARDEN', 'DESTINY_BOND', 'THUNDERBOLT']),
         ('JOLTEON', 60, None, ['THUNDERBOLT', 'HARDEN'])]


def case_perish_song():
    g = setup()
    g.set_party(GHOST, ())
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 0)] + [('move', 1)] * 6,
                            replace=[1], shift=[True])
    s = idx(log, STANDING)
    after = [m for m in menus if m['ram'][1] == 0]
    check('Perish Song takes a bar (and the perish count is cleared)',
          s >= 0 and after and after[0]['hp'] == after[0]['max'] and not after[0]['sub'][0] & 0x10,
          f'menus={[(m["ram"], m["hp"], m["sub"]) for m in menus]} log={log[-10:]}')


def case_destiny_bond():
    g = setup()
    g.set_party(GHOST, ())

    def hook(g, turn):
        if turn == 0:  # the boss (slower) knocks out the 1-HP Misdreavus with Thunderbolt after Destiny Bond
            g.wr16('wBattleMonHP', 1); g.wr16('wPartyMon1HP', 1)
            set_enemy_move(g, party_move_id(g, 0, 3))
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 2)] + [('move', 0)] * 4, hook,
                            replace=[1], shift=[True])
    m = menus[1] if len(menus) > 1 else None
    check('Destiny Bond takes a bar', m and m['ram'][1] == 0 and m['hp'] == m['max']
          and any('took it' in x or 'with it' in x for x in log) and g.rd16('wPartyMon1HP') == 0,
          f'menus={[(x["ram"], x["hp"]) for x in menus]} log={log[:10]}')


def bag_count(g):
    """The ball pocket as {ID: quantity} (2-byte entries)."""
    n = g.rd('wNumBalls')
    data = list(g.rd('wBalls', 2 * n)) if n > 1 else (list(g.rd('wBalls', 2)) if n else [])
    return {data[i]: data[i + 1] for i in range(0, len(data), 2)}


def party_species_hp(g):
    size = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    return [(g.rd(f'wPartySpecies+{i}'), g.rd16(f'wPartyMon1HP+{i * size}')) for i in range(g.rd('wPartyCount'))]


def case_ball_bounces():
    g = setup()
    g.set_party(BOLT, [('POKE_BALL', 5)])
    before = bag_count(g)
    menus, log, res = fight(g, g.const('BOSS_ARTICUNO'), [('ball',), ('move', 0), ('move', 0), ('move', 0)])
    after = bag_count(g)
    check('a ball with bars left bounces off (not used up), no turn lost', any('bounced' in x for x in log)
          and before == after and menus[1]['ram'][1] == 1 and not any('used' in x for x in menus[1]['log']),
          f'balls {before}->{after} menus={[m["ram"] for m in menus]} log={log[:5]}')


def case_ball_last_bar():
    g = setup()
    g.set_party(BOLT, [('MASTER_BALL', 1)])
    n0 = g.rd('wPartyCount')
    menus, log, res = fight(g, g.const('BOSS_ARTICUNO'), [('move', 0), ('ball',), ('move', 0)])
    check('on the last bar a ball catches as usual (Master Ball)', g.rd('wPartyCount') == n0 + 1
          and any('caught' in x for x in log) and menus[1]['ram'][1] == 0, f'party={g.rd("wPartyCount")} log={log[-6:]}')


def case_auto_catch():
    g = setup()
    g.set_party(BOLT, [('POKE_BALL', 5)])
    before = bag_count(g)
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 0)] * 4)
    party = party_species_hp(g)
    check('auto-catch: last bar out -> "exhausted", caught at 1 HP, no ball used, battle won',
          any('exhausted' in x for x in log) and any('caught' in x for x in log) and len(party) == 2
          and party[1][1] == 1 and bag_count(g) == before and res == 0,
          f'party={party} balls {before}->{bag_count(g)} res={res} log={log[-6:]}')


def case_auto_catch_box():
    g = setup()
    six = BOLT + [('RATTATA', 5, None, ['TACKLE'])] * 5
    g.set_party(six, ())
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 0)] * 4)
    check('auto-catch with a full party: sent to the box', any('caught' in x for x in log)
          and any('sent to' in x.lower() or 'transferred' in x.lower() or 'box' in x.lower() for x in log)
          and g.rd('wPartyCount') == 6 and res == 0, f'party={g.rd("wPartyCount")} res={res} log={log[-6:]}')


def case_no_run():
    g = setup()
    g.set_party(BOLT, ())
    menus, log, res = fight(g, g.const('BOSS_ARTICUNO'), [('run',), ('move', 0), ('move', 0), ('move', 0)])
    check('no running from a boss', any('n  escape!' in x or "n't escape!" in x for x in menus[1]['log']) and len(menus) >= 3,
          f'menus={len(menus)} log={menus[1]["log"] if len(menus) > 1 else log}')


def case_no_teleport():
    g = setup()
    g.set_party([('ABRA', 60, None, ['TELEPORT', 'PSYCHIC_M'])], ())
    menus, log, res = fight(g, g.const('BOSS_ARTICUNO'), [('move', 0), ('move', 1), ('move', 1), ('move', 1)])
    check('Teleport fails against a boss', len(menus) >= 2 and any('failed' in x.lower() for x in menus[1]['log']),
          f'menus={len(menus)} log={menus[1]["log"] if len(menus) > 1 else log}')


def case_boss_never_flees():
    g = setup()
    g.set_party(BOLT, ())
    wild(g, None, 'RAIKOU', 10)
    b = HookBattle(g, [('move', 1)] * 3)
    r = b.run()
    plain = [m for rec in r for m in rec.get('log', [])]
    g = setup()
    g.set_party(BOLT, ())
    menus, log, res = fight(g, g.const('BOSS_ARTICUNO'), [('move', 1), ('move', 1), ('move', 0), ('move', 0), ('move', 0)],
                            species='RAIKOU', level=10)
    check('a boss never flees (Raikou, which always flees otherwise)', any('fled' in x for x in plain)
          and not any('fled' in x for x in log) and len(menus) >= 3, f'plain={plain[-3:]} boss={log[-4:]}')


def case_use_next_no():
    g = setup()
    g.set_party(BOLT + [('SNORLAX', 60, None, ['BODY_SLAM'])], ())

    def hook(g, turn):
        if turn == 0:
            g.wr16('wBattleMonHP', 1); g.wr16('wPartyMon1HP', 1)
    menus, log, res = fight(g, g.const('BOSS_ARTICUNO'), [('move', 3)] + [('move', 0)] * 5, hook, replace=[1], shift=[False])
    check('"Use next Pokémon?" No: can\'t escape, the next mon is sent in', any('n  escape!' in x or "n't escape!" in x for x in log)
          and any('Go! Snorlax' in x for x in log) and res == 0, f'res={res} log={log[:10]}')


def case_poke_doll():
    g = setup()
    g.set_party(BOLT, [('POKE_DOLL', 1)])
    menus, log, res = fight(g, g.const('BOSS_ARTICUNO'), [('item', 'POKE_DOLL'), ('move', 0), ('move', 0), ('move', 0)])
    check('a Poké Doll doesn\'t end a boss battle', len(menus) >= 2 and res == 0, f'menus={len(menus)} res={res} log={log[:6]}')


def case_nuzlocke():
    g = setup()
    g.set_party(BOLT, [('POKE_BALL', 5)])
    g.wr('wOptions2', g.rd('wOptions2') | 1 << 4)
    a0 = list(g.rd('wNuzlockeAreaFlags', 12))
    wild(g, g.const('BOSS_ARTICUNO'))
    check('Nuzlocke: a boss is catchable and doesn\'t use the area', g.rd('wNuzlockeEncounter') == 3
          and list(g.rd('wNuzlockeAreaFlags', 12)) == a0, f'enc={g.rd("wNuzlockeEncounter")}')


# (map, x, y, script label, BOSS_*, battle type at the first menu, events to set first)
ENCOUNTERS = [
    ('REGIROCK_LAIR', 12, 7, 'RegirockScript', 'BOSS_REGIROCK', 'BATTLETYPE_TRAP', []),
    ('REGICE_LAIR', 10, 8, 'RegiceScript', 'BOSS_REGICE', 'BATTLETYPE_TRAP', []),
    ('REGISTEEL_LAIR', 11, 6, 'RegisteelScript', 'BOSS_REGISTEEL', 'BATTLETYPE_TRAP', []),
    ('METEOR_PEAK', 42, 19, 'RayquazaScript', 'BOSS_RAYQUAZA', 'BATTLETYPE_TRAP', []),
    ('DESERT_SHRINE', 13, 3, 'DesertShrineUnown', 'BOSS_UNOWN_X', 'BATTLETYPE_FORCESHINY', []),
    ('LAKE_OF_RAGE', 18, 23, 'RedGyarados', 'BOSS_RED_GYARADOS', 'BATTLETYPE_FORCESHINY', []),
    ('TIN_TOWER_ROOF', 9, 6, 'TinTowerHoOh', 'BOSS_HO_OH', 'BATTLETYPE_TRAP', []),
    ('WHIRL_ISLAND_LUGIA_CHAMBER', 9, 6, 'Lugia', 'BOSS_LUGIA', 'BATTLETYPE_TRAP', []),
    ('ZAPDOS_ROOST', 13, 7, 'ZapdosRoostZapdosScript', 'BOSS_ZAPDOS', 'BATTLETYPE_TRAP', []),
    ('SEAFOAM_ISLANDS_B1F', 5, 6, 'SeafoamIslandsB1FArticunoScript', 'BOSS_ARTICUNO', 'BATTLETYPE_TRAP', []),
    ('CINNABAR_VOLCANO_CRATER', 11, 7, 'CinnabarVolcanoCraterMoltresScript', 'BOSS_MOLTRES', 'BATTLETYPE_TRAP', []),
    ('CERULEAN_CAVE_B1F', 17, 5, 'CeruleanCaveB1FMewtwoScript', 'BOSS_MEWTWO', 'BATTLETYPE_TRAP', []),
    ('CAVE_OF_ORIGIN_DEPTHS', 13, 14, 'KyogreScript', 'BOSS_KYOGRE', 'BATTLETYPE_TRAP', []),
    ('MT_CHIMNEY_CHAMBER', 9, 8, 'GroudonScript', 'BOSS_GROUDON', 'BATTLETYPE_TRAP', []),
    ('MOLTRES_LAIR', 20, 1, 'MoltresLair_Entei', 'BOSS_ENTEI', 'BATTLETYPE_TRAP', ['EVENT_RELEASED_THE_BEASTS']),
]


def case_encounter(i, hard=NORMAL):
    """The map's own script (warp there, then jump into the script) starts a boss battle."""
    mapc, x, y, label, boss_c, btype, events = ENCOUNTERS[i]
    g = setup(hard)
    g.set_party(BOLT, ())
    g.run_script(f'\twarp {mapc}, {x}, {y}\n\tend')
    g.frames(240)
    bank, addr = g.sym[label]
    ev = ''.join(f'\tsetevent {e}\n' for e in events)
    g.run_script(f'TestScript:\n{ev}\tdb farsjump_command\n\tdb {bank}\n\tdw ${addr:04x}')
    for _ in range(400):   # the script's text before the battle
        if g.in_battle():
            break
        g.frames(6)
        g.press('B', hold=2, after=2)
    try:
        to_menu(g)
    except RuntimeError as e:
        check(f'{label}: a boss battle', False, str(e)[:200])
        return
    boss = g.const(boss_c)
    rec = g.rom_addr('BossRecords') + (boss - 1) * g.const('BOSS_RECORD_SIZE')
    bars = g.rom()[rec] + (1 if hard == HARD else 0)
    ram, bt = boss_ram(g), g.rd('wBattleType')
    check(f'{label} ({"Hard" if hard == HARD else "Normal"}): {boss_c}, {bars} extra bars, {btype}, aura shown',
          ram == (boss, bars, bars) and bt == g.const(btype) and any('aura' in x for x in g.intro_log),
          f'ram={ram} type={bt} intro={g.intro_log[-3:]}')


def case_map_rain_kept():
    """Lake of Rage's permanent rain isn't shortened by the Red Gyarados phase's rain."""
    g = setup()
    g.set_party(BOLT, ())
    def hook(g, turn):
        if turn == 0:
            g.wr('wBattleWeather', g.const('WEATHER_RAIN')); g.wr('wWeatherCount', 255)
    menus, log, res = fight(g, g.const('BOSS_RED_GYARADOS'), [('move', 0)] * 4, hook)
    m1 = menus[1] if len(menus) > 1 else None
    check('permanent map rain stays permanent after a rain phase', m1 and m1['weather'] == (g.const('WEATHER_RAIN'), 255)
          and not any('downpour' in x for x in m1['log']), f'm1={m1 and (m1["weather"], m1["log"])}')


def event_set(g, name):
    lo, hi = assemble_block(f'\tdw {name}', 0, SCRIPT_ORG)[:2]
    ev = lo | hi << 8
    return bool(g.rd(f'wEventFlags+{ev // 8}') >> (ev % 8) & 1)


def case_red_gyarados_script():
    """Lake of Rage end to end: the boss is beaten, caught automatically, and the script hides it."""
    mapc, x, y, label, boss_c, btype, events = ENCOUNTERS[5]
    g = setup()
    g.set_party(BOLT, [('POKE_BALL', 5)])
    g.run_script(f'\twarp {mapc}, {x}, {y}\n\tend')
    g.frames(240)
    flag0 = event_set(g, 'EVENT_LAKE_OF_RAGE_RED_GYARADOS')
    bank, addr = g.sym[label]
    g.run_script(f'TestScript:\n\tdb farsjump_command\n\tdb {bank}\n\tdw ${addr:04x}')
    for _ in range(400):
        if g.in_battle():
            break
        g.frames(6)
        g.press('B', hold=2, after=2)
    to_menu(g)
    r = HookBattle(g, [('move', 0)] * 6).run()
    log = [m for rec in r for m in rec.get('log', [])]
    for _ in range(60):
        g.frames(10); g.press('B', hold=2, after=4)
    check('Lake of Rage: beaten, caught automatically (party +1), the script hides the Gyarados',
          not flag0 and event_set(g, 'EVENT_LAKE_OF_RAGE_RED_GYARADOS') and g.rd('wPartyCount') == 2
          and any('exhausted' in x for x in log), f'flag {flag0}->{event_set(g, "EVENT_LAKE_OF_RAGE_RED_GYARADOS")} '
          f'party={g.rd("wPartyCount")} log={log[-5:]}')


def case_encounters():
    for i in range(len(ENCOUNTERS)):
        case_encounter(i)
    case_encounter(0, HARD)
    case_encounter(5, HARD)


def main():
    only = sys.argv[4:]
    if only:
        for n in only:
            globals()[n]() if '(' not in n else eval(n)
        bad = [n for n, ok in RESULTS if not ok]
        print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
        return
    case_wild('Red Gyarados, Normal', 'BOSS_RED_GYARADOS', NORMAL, 1)
    case_wild('Red Gyarados, Hard', 'BOSS_RED_GYARADOS', HARD, 2)
    case_wild('Mewtwo, Normal', 'BOSS_MEWTWO', NORMAL, 2)
    case_wild('Mewtwo, Hard', 'BOSS_MEWTWO', HARD, 3)
    case_no_boss()
    case_bad_id()
    case_trainer()
    case_bars_and_exp()
    case_hard_bars()
    case_status()
    case_keep_status()
    case_ohko()
    case_selfdestruct()
    case_residual(False)
    case_residual(True)
    case_sandstorm()
    case_double_ko()
    case_pips()
    case_aura()
    case_aura_two_stages()
    case_hard_phases()
    case_two_phases()
    case_weather_aura()
    case_clear_weather()
    case_air_lock()
    case_stat_cap()
    case_perish_song()
    case_destiny_bond()
    case_ball_bounces()
    case_ball_last_bar()
    case_auto_catch()
    case_auto_catch_box()
    case_auto_catch_no_room()
    case_no_run()
    case_no_teleport()
    case_boss_never_flees()
    case_use_next_no()
    case_poke_doll()
    case_nuzlocke()
    case_map_rain_kept()
    case_encounters()
    case_red_gyarados_script()
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed' + (f'; failed: {bad}' if bad else ''))


if __name__ == '__main__':
    main()
