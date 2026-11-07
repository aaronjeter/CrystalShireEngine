"""The AI's switching and move choice (engine/battle/ai/switch_score.asm, move_plan.asm).
Usage: python3 test_switch_ai.py ROM.gbc ROM.sym STATE [case ...]
Records the enemy party index on the field at each battle menu (`mons`) and the voluntary
switch count, then checks them.
- Send-ins: the enemy lead is knocked out (or U-turns); `expect` = the index at
  the second menu.
- Voluntary switches: `check(mons, g)`."""
import sys
import battle_test as bt

ROM, SYM, STATE = sys.argv[1:4]
PIKA = [('PIKACHU', 100, None, ['THUNDERBOLT', 'GROWL'])]
CHAMP = [('MACHAMP', 100, None, ['CROSS_CHOP'])]
LEAD = (5, 'RATTATA', None, ['TACKLE'])
DRAGONITE = (50, 'DRAGONITE', None, ['DRAGON_CLAW'])
# Machamp only uses Leer, so the AI sees no move and assumes a Fighting STAB move
LEERCHAMP = [('MACHAMP', 60, None, ['LEER'])]
TTAR = (50, 'TYRANITAR', None, ['CRUNCH'])
GENGAR = (50, 'GENGAR', None, ['SHADOW_BALL'])
SNORLAX = (50, 'SNORLAX', None, ['BODY_SLAM'])
ARCANINE = (50, 'ARCANINE', None, ['FLAMETHROWER'])
LEER = [('move', 0)] * 3


def perish1(g):
    g.wr('wEnemySubStatus1', g.rd('wEnemySubStatus1') | 1 << 4)  # SUBSTATUS_PERISH
    g.wr('wEnemyPerishCount', 1)


def residual(g):
    g.wr('wEnemySubStatus5', g.rd('wEnemySubStatus5') | 1 << 0)  # SUBSTATUS_TOXIC
    g.wr('wEnemySubStatus4', g.rd('wEnemySubStatus4') | 1 << 7)  # SUBSTATUS_LEECH_SEED
    g.wr('wEnemySubStatus1', g.rd('wEnemySubStatus1') | 1 << 1)  # SUBSTATUS_CURSE


def est(g, power, stab, eff, atk='wBattleMonAttack', dfn='wEnemyMonDefense', lvl='wBattleMonLevel'):
    """switch_score.asm's damage formula (no weather, screens or abilities)."""
    a, d = g.rd16(atk), g.rd16(dfn)
    while a > 255 or d > 255:
        a >>= 1; d >>= 1
    n = ((g.rd(lvl) * 2 // 5 + 2) * power * a // max(d, 1)) // 50 + 2
    return (n * 3 // 2 if stab else n) * eff // 10


def pursuit_hp(g, seen):
    """Alakazam's HP between the assumed Dark hit (70) and a doubled Pursuit (120)."""
    lo, hi = est(g, 70, True, 20), est(g, 120, True, 20)
    assert lo < hi, (lo, hi)
    g.wr('wEnemyMonHP', [(lo + hi) // 2 >> 8, (lo + hi) // 2 & 0xFF])
    if seen:
        g.wr('wPlayerUsedMoves', g.rd('wBattleMonMoves'))  # Pursuit, the first move


CASES = {
    # ---- send-ins
    # Thunderbolt seen: Golem (immune, Earthquake) over Gyarados (4x weak) and Starmie
    'immune': dict(party=PIKA, trainer=[LEAD, (50, 'GYARADOS', None, ['SURF']), (50, 'GOLEM', None, ['EARTHQUAKE']),
                                        (50, 'STARMIE', None, ['SURF']), DRAGONITE], expect=2),
    # Cross Chop: Gengar (immune) over Snorlax and Tyranitar (weak)
    'fighting': dict(party=CHAMP, trainer=[LEAD, (50, 'SNORLAX', None, ['BODY_SLAM']), TTAR, GENGAR, DRAGONITE], expect=3),
    # the ace comes last: Gyarados, though Golem (last) is better
    'ace_last': dict(party=PIKA, trainer=[LEAD, (50, 'GYARADOS', None, ['SURF']), (50, 'GOLEM', None, ['EARTHQUAKE'])], expect=1),
    # only the ace is left: it comes in (not the fainted lead)
    'only_ace': dict(party=PIKA, trainer=[LEAD, (50, 'GOLEM', None, ['EARTHQUAKE'])], expect=1),
    # Spikes would knock Golem (5 HP) out on entry: Starmie instead
    'spikes': dict(party=PIKA, trainer=[LEAD, (50, 'GYARADOS', None, ['SURF']), (50, 'GOLEM', None, ['EARTHQUAKE']),
                                        (50, 'STARMIE', None, ['SURF']), DRAGONITE], expect=3,
                   setup=lambda g: (g.wr('wEnemyScreens', g.rd('wEnemyScreens') | 1),
                                    g.wr(f'wOTPartyMon1HP+{2 * PSIZE}', [0, 5]))),
    # U-turn: the lead survives and switches out to Golem
    'u_turn': dict(party=[('PIKACHU', 100, None, ['GROWL'])],
                   trainer=[(50, 'SCYTHER', None, ['U_TURN']), (50, 'GYARADOS', None, ['SURF']), (50, 'GOLEM', None, ['EARTHQUAKE']),
                            DRAGONITE], expect=2, actions=[('move', 0)]),

    # ---- voluntary switches (Cool Trainer = Often, Youngster = Rarely)
    # Snorlax (weak to the assumed Fighting move) leaves for Gengar on turn 1, once
    'leave': dict(party=LEERCHAMP, trainer=[SNORLAX, GENGAR, DRAGONITE], menus=3, actions=LEER,
                  check=lambda m, g: m == [0, 1, 1] and g.rd('wEnemySwitchCount') == 1),
    # Gengar (immune) stays in against Machamp
    'stay': dict(party=LEERCHAMP, trainer=[GENGAR, TTAR, DRAGONITE], menus=3, actions=LEER,
                 check=lambda m, g: m == [0, 0, 0]),
    # a Rarely class leaves only clear cases: Snorlax can't touch Gengar -> Tyranitar
    'leave_rarely': dict(party=[('GENGAR', 60, None, ['LEER'])], trainer=[SNORLAX, TTAR, DRAGONITE], cls='YOUNGSTER',
                         menus=2, actions=LEER, check=lambda m, g: m == [0, 1]),
    # a middling case (Arcanine vs Machamp, Gengar on the bench): Often leaves, Sometimes stays
    'often_mid': dict(party=LEERCHAMP, trainer=[ARCANINE, GENGAR, DRAGONITE], menus=2, actions=LEER,
                      check=lambda m, g: m == [0, 1]),
    'sometimes_mid': dict(party=LEERCHAMP, trainer=[ARCANINE, GENGAR, DRAGONITE], cls='RANGERM', menus=2, actions=LEER,
                          check=lambda m, g: m == [0, 0]),
    # ... but Toxic, Leech Seed and Curse on Arcanine tip the Sometimes class into leaving
    'residual': dict(party=LEERCHAMP, trainer=[ARCANINE, GENGAR, DRAGONITE], cls='RANGERM', menus=2, actions=LEER,
                     setup=residual, check=lambda m, g: m == [0, 1]),
    # the cap: a Rarely class that has switched once doesn't switch again
    'cap': dict(party=LEERCHAMP, trainer=[SNORLAX, GENGAR, DRAGONITE], cls='YOUNGSTER', menus=2, actions=LEER,
                setup=lambda g: g.wr('wEnemySwitchCount', 1), check=lambda m, g: m == [0, 0]),
    # never to the ace: Snorlax's only bench mon is the ace, so it stays
    'not_to_ace': dict(party=LEERCHAMP, trainer=[SNORLAX, GENGAR], menus=2, actions=LEER,
                       check=lambda m, g: m == [0, 0]),
    # each switch already made raises the margin: after two, the same case stays
    'margin_step': dict(party=LEERCHAMP, trainer=[ARCANINE, GENGAR, DRAGONITE], menus=2, actions=LEER,
                        setup=lambda g: g.wr('wEnemySwitchCount', 2), check=lambda m, g: m == [0, 0]),
    # raised stages are lost by leaving: Arcanine at +3 evasion stays
    'boosted_stays': dict(party=LEERCHAMP, trainer=[ARCANINE, GENGAR, DRAGONITE], menus=2, actions=LEER,
                          setup=lambda g: g.wr('wEnemyEvaLevel', 10), check=lambda m, g: m == [0, 0]),
    # Perish count 1: Gengar (well placed) leaves anyway, even to the ace, past the cap
    'perish': dict(party=LEERCHAMP, trainer=[GENGAR, TTAR], cls='YOUNGSTER', menus=2, actions=LEER,
                   setup=lambda g: (perish1(g), g.wr('wEnemySwitchCount', 5)), check=lambda m, g: m == [0, 1]),
    # Pursuit seen: Alakazam would leave (Dark STAB assumed) but Pursuit would KO it, so it stays
    'pursuit': dict(party=[('TYRANITAR', 100, None, ['PURSUIT', 'LEER'])],
                    trainer=[(50, 'ALAKAZAM', None, ['PSYCHIC_M']), (50, 'MACHAMP', None, ['CROSS_CHOP']), DRAGONITE],
                    menus=2, actions=[('move', 1)] * 2, setup=lambda g: pursuit_hp(g, True), check=lambda m, g: m == [0, 0]),
    # the control: the same without Pursuit seen leaves for Machamp
    'pursuit_control': dict(party=[('TYRANITAR', 100, None, ['PURSUIT', 'LEER'])],
                            trainer=[(50, 'ALAKAZAM', None, ['PSYCHIC_M']), (50, 'MACHAMP', None, ['CROSS_CHOP']), DRAGONITE],
                            menus=2, actions=[('move', 1)] * 2, setup=lambda g: pursuit_hp(g, False),
                            check=lambda m, g: m == [0, 1]),
}


class Battle(bt.Battle):
    def __init__(self, *a, setup=None, menus=2, **k):
        super().__init__(*a, **k)
        self.setup, self.menus, self.mons = setup, menus, []

    def at_menu(self):
        self.mons.append(self.g.rd('wCurOTMon'))
        if len(self.mons) == 1 and self.setup:
            self.setup(self.g)
        if len(self.mons) >= self.menus:
            raise StopIteration
        super().at_menu()


def run(name):
    global PSIZE
    c = CASES[name]
    cls = c.get('cls', 'COOLTRAINERM')
    g = bt.Game(ROM, SYM, STATE)
    PSIZE = g.sym['wOTPartyMon2'][1] - g.sym['wOTPartyMon1'][1]
    g.seed()
    g.clear_bag()
    g.set_party(c['party'])
    g.seed()
    g.set_trainer(cls, 'Test', c['trainer'], doubles=c.get('doubles', False))
    g.seed()
    g.start_battle(cls, 0x01 | bt.SCENE_OFF)
    b = Battle(g, c.get('actions', [('move', 0)]), setup=c.get('setup'), menus=c.get('menus', 2))
    try:
        b.run()
    except StopIteration:
        pass
    info = f'mons {b.mons}, switches {g.rd("wEnemySwitchCount")}, best score/index {g.rd("wSAIBestScore"), g.rd("wSAIBestIndex")}'
    if 'check' in c:
        ok = c['check'](b.mons, g)
    else:
        got = b.mons[1] if len(b.mons) > 1 else None
        ok = got == c['expect']
        info = f'sent in {got}, expected {c["expect"]}; ' + info
    print(('ok   ' if ok else 'FAIL ') + f'{name}: {info}', flush=True)
    return ok


class TierBattle(bt.Battle):
    """Stops at AIShouldSwitch and reads the tier passed in a."""
    def at_menu(self):
        from gb import LIB
        g = self.g
        g.wr('wCurMoveNum', 0); self.menu_pick(1, 1); self.settle()
        bank, addr = g.sym['AIShouldSwitch']
        g.hold('A', True)
        for _ in range(20_000_000):
            LIB.GB_run(g.gb)
            if g.pc() == addr and g.rd(0xff9e) == bank:
                self.tier = LIB.GB_get_registers(g.gb).contents[0] >> 8
                raise StopIteration
        raise RuntimeError('AIShouldSwitch not reached')


def tiers():
    """The class's SWITCH_* tier, one up on Hard (wHardMode 0)."""
    ok = True
    for cls, want in (('YOUNGSTER', (1, 2)), ('RANGERM', (2, 3)), ('COOLTRAINERM', (3, 3))):
        for hard, w in zip((1, 0), want):
            g = bt.Game(ROM, SYM, STATE); g.seed(); g.clear_bag()
            g.set_party(LEERCHAMP); g.wr('wHardMode', hard)
            g.set_trainer(cls, 'Test', [SNORLAX, GENGAR])
            g.start_battle(cls, 0x01 | bt.SCENE_OFF)
            b = TierBattle(g, [])
            try:
                b.run()
            except StopIteration:
                pass
            got = getattr(b, 'tier', None)
            ok &= got == w
            print(('ok   ' if got == w else 'FAIL ') + f'tiers: {cls} {"Hard" if hard == 0 else "Normal"}: {got}, expected {w}', flush=True)
    return ok


def stay_score(party, trainer, cls='RANGERM', abilities=None, setup=None):
    """wSAIStayScore after the first decision (the lead must get that far)."""
    g = bt.Game(ROM, SYM, STATE); g.seed()
    if abilities:
        bt.set_abilities(g, abilities)
    g.clear_bag(); g.set_party(party); g.seed()
    g.set_trainer(cls, 'Test', trainer); g.seed()
    g.start_battle(cls, 0x01 | bt.SCENE_OFF)
    b = Battle(g, LEER, setup=setup, menus=2)
    try:
        b.run()
    except StopIteration:
        pass
    return g.rd('wSAIStayScore')


def half_hp(g):
    hp = g.rd16('wEnemyMonMaxHP') // 2
    g.wr('wEnemyMonHP', [hp >> 8, hp & 0xFF])


def poisoned(g):
    g.wr('wEnemyMonStatus', 1 << 3)  # PSN


PAIRS = {
    # (lower, higher): the first setup must give the lower stay score
    # Intimidate cuts the physical Machamp's Attack: it needs more hits
    'pair_intimidate': (dict(abilities={'ARBOK': 'ABILITY_INTIMIDATE'}), dict(abilities={'ARBOK': 'ABILITY_SHED_SKIN'}),
                        [('ARBOK', 60, None, ['LEER'])], [(50, 'MACHAMP', None, ['CROSS_CHOP']), GENGAR, DRAGONITE]),
    # Mystify cuts the special Lapras's Sp. Atk
    'pair_mystify': (dict(abilities={'ARBOK': 'ABILITY_MYSTIFY'}), dict(abilities={'ARBOK': 'ABILITY_SHED_SKIN'}),
                     [('ARBOK', 60, None, ['LEER'])], [(50, 'LAPRAS', None, ['SURF']), GENGAR, DRAGONITE]),
    # Regenerator below 2/3 HP: a reason to leave
    'pair_regenerator': (dict(abilities={'SLOWBRO': 'ABILITY_REGENERATOR'}, setup=half_hp),
                         dict(abilities={'SLOWBRO': 'ABILITY_OWN_TEMPO'}, setup=half_hp),
                         LEERCHAMP, [(50, 'SLOWBRO', None, ['SURF']), GENGAR, DRAGONITE]),
    # raised evasion: a reason to stay (not in the stats the score uses)
    'pair_evasion': (dict(), dict(setup=lambda g: g.wr('wEnemyEvaLevel', 9)),
                     LEERCHAMP, [(50, 'SLOWBRO', None, ['SURF']), GENGAR, DRAGONITE]),
    # lowered accuracy: a reason to leave
    'pair_accuracy': (dict(setup=lambda g: g.wr('wEnemyAccLevel', 5)), dict(),
                      LEERCHAMP, [(50, 'SLOWBRO', None, ['SURF']), GENGAR, DRAGONITE]),
    # Natural Cure with a status
    'pair_natural_cure': (dict(abilities={'CHANSEY': 'ABILITY_NATURAL_CURE'}, setup=poisoned),
                          dict(abilities={'CHANSEY': 'ABILITY_SERENE_GRACE'}, setup=poisoned),
                          [('ARBOK', 50, None, ['LEER'])], [(50, 'CHANSEY', None, ['EGG_BOMB']), GENGAR, DRAGONITE]),
}


def sendin_score(status, trainer):
    """wSAIBestScore of the send-in after Pikachu KOs the lead, with party mon 2's status set."""
    g = bt.Game(ROM, SYM, STATE); g.seed()
    g.clear_bag(); g.set_party(PIKA); g.seed()
    g.set_trainer('COOLTRAINERM', 'Test', trainer); g.seed()
    g.start_battle('COOLTRAINERM', 0x01 | bt.SCENE_OFF)
    psize = g.sym['wOTPartyMon2'][1] - g.sym['wOTPartyMon1'][1]
    b = Battle(g, [('move', 0)], setup=lambda g: g.wr(f'wOTPartyMon1Status+{psize}', status), menus=2)
    try:
        b.run()
    except StopIteration:
        pass
    return g.rd('wSAIBestScore')


SENDIN_PAIRS = {
    # (lower status, higher status, trainer): this hack's frostbite only halves Sp. Atk, so a
    # frostbitten Golem (Earthquake) scores as a healthy one (checked below) and above a
    # sleeping one (lost turns); it lowers Starmie (Surf); a burn halves Golem's Earthquake
    'pair_sleep_vs_frostbite': (2, 1 << 5, [LEAD, (50, 'GOLEM', None, ['EARTHQUAKE']), DRAGONITE]),  # SLP 2 turns, FRZ
    'pair_frostbite': (1 << 5, 0, [LEAD, (50, 'STARMIE', None, ['SURF']), DRAGONITE]),
    'pair_burn': (1 << 4, 0, [LEAD, (50, 'GOLEM', None, ['EARTHQUAKE']), DRAGONITE]),  # BRN
}


def sendin_pair(name):
    lo, hi, trainer = SENDIN_PAIRS[name]
    a, b = sendin_score(lo, trainer), sendin_score(hi, trainer)
    ok = 0 < a < b
    print(('ok   ' if ok else 'FAIL ') + f'{name}: send-in score {a} < {b}', flush=True)
    return ok


def frostbite_physical():
    trainer = [LEAD, (50, 'GOLEM', None, ['EARTHQUAKE']), DRAGONITE]
    a, b = sendin_score(1 << 5, trainer), sendin_score(0, trainer)
    ok = a == b
    print(('ok   ' if ok else 'FAIL ') + f'frostbite_physical: send-in score {a} == {b}', flush=True)
    return ok


def pair(name):
    lo, hi, party, trainer = PAIRS[name]
    a, b = stay_score(party, trainer, **lo), stay_score(party, trainer, **hi)
    ok = 0 < a < b
    print(('ok   ' if ok else 'FAIL ') + f'{name}: stay {a} < {b}', flush=True)
    return ok


# ---- move choice (the AI_PLAN layer, engine/battle/ai/move_plan.asm)
# Each case runs over PLAN_SEEDS; `used` = the enemy's first move each time. A planning class
# (Cool Trainer) must always make the call; the vanilla class (Youngster) is run for contrast.
PLAN_SEEDS = (0x1234, 0x2345, 0x3456, 0x4567, 0x5678)


def set_hp(field, frac):
    def f(g):
        hp = max(1, g.rd16(field.replace('HP', 'MaxHP')) * frac[0] // frac[1])
        g.wr(field, [hp >> 8, hp & 0xFF])
    return f


def ability(field, name):
    def f(g):
        g.wr(field, g.const(f'ABILITY_{name}'))
    return f


def both(*fs):
    def f(g):
        for x in fs:
            x(g)
    return f


PLAN = {
    # Machamp at 1/8 HP: Body Slam knocks it out, so no Swords Dance
    'plan_ko': dict(party=LEERCHAMP, trainer=[(50, 'SNORLAX', None, ['SWORDS_DANCE', 'BODY_SLAM']), GENGAR],
                    setup=set_hp('wBattleMonHP', (1, 8)), want='Body Slam'),
    # a level 80 Machamp knocks Snorlax out in 2 hits: no Swords Dance
    'plan_unsafe_setup': dict(party=[('MACHAMP', 80, None, ['LEER'])],
                              trainer=[(50, 'SNORLAX', None, ['SWORDS_DANCE', 'BODY_SLAM']), GENGAR], want='Body Slam'),
    # a level 40 Steelix can't hurt Snorlax much (nor be knocked out): Swords Dance is safe
    'plan_safe_setup': dict(party=[('STEELIX', 40, None, ['LEER'])],
                            trainer=[(50, 'SNORLAX', None, ['SWORDS_DANCE', 'BODY_SLAM']), GENGAR], want='Swords Dance'),
    # Chansey at 2/5 HP against a weak hitter it can't knock out: Softboiled
    'plan_heal': dict(party=[('STEELIX', 40, None, ['LEER'])],
                      trainer=[(50, 'CHANSEY', None, ['SOFTBOILED', 'BODY_SLAM']), GENGAR],
                      setup=set_hp('wEnemyMonHP', (2, 5)), want='Softboiled'),
    # Chansey at 1/16 HP, slower than a level 80 Machamp that knocks it out first: healing
    # can't save it, so it attacks
    'plan_no_heal': dict(party=[('MACHAMP', 80, None, ['LEER'])],
                         trainer=[(50, 'CHANSEY', None, ['SOFTBOILED', 'BODY_SLAM']), GENGAR],
                         setup=set_hp('wEnemyMonHP', (1, 16)), want='Body Slam'),
    # a slower Snorlax at 1/16 HP that Machamp knocks out first: attack, don't Toxic
    'plan_last_act': dict(party=[('MACHAMP', 70, None, ['LEER'])],
                          trainer=[(50, 'SNORLAX', None, ['TOXIC', 'BODY_SLAM']), GENGAR],
                          setup=set_hp('wEnemyMonHP', (1, 16)), want='Body Slam'),
    # ---- abilities and items
    # Flamethrower would knock Machamp out, but Flash Fire absorbs it: Tackle
    'plan_flash_fire': dict(party=LEERCHAMP, trainer=[(50, 'ARCANINE', None, ['FLAMETHROWER', 'TACKLE']), GENGAR],
                            setup=both(set_hp('wBattleMonHP', (1, 4)), ability('wBattleMonAbility', 'FLASH_FIRE')),
                            want='Tackle'),
    'plan_flash_fire_control': dict(party=LEERCHAMP, trainer=[(50, 'ARCANINE', None, ['FLAMETHROWER', 'TACKLE']), GENGAR],
                                    setup=set_hp('wBattleMonHP', (1, 4)), want='Flamethrower'),
    # Mold Breaker ignores Flash Fire
    'plan_mold_breaker': dict(party=LEERCHAMP, trainer=[(50, 'ARCANINE', None, ['FLAMETHROWER', 'TACKLE']), GENGAR],
                              setup=both(set_hp('wBattleMonHP', (1, 4)), ability('wBattleMonAbility', 'FLASH_FIRE'),
                                         ability('wEnemyMonAbility', 'MOLD_BREAKER')), want='Flamethrower'),
    'plan_levitate': dict(party=LEERCHAMP, trainer=[(50, 'GOLEM', None, ['EARTHQUAKE', 'TACKLE']), GENGAR],
                          setup=both(set_hp('wBattleMonHP', (1, 4)), ability('wBattleMonAbility', 'LEVITATE')),
                          want='Tackle'),
    # Arcanine at 1/10 HP: Crunch (contact) into Rough Skin would knock it out
    'plan_rough_skin': dict(party=[('SLOWBRO', 60, None, ['LEER'])],
                            trainer=[(50, 'ARCANINE', None, ['CRUNCH', 'FLAMETHROWER']), GENGAR],
                            setup=both(set_hp('wEnemyMonHP', (1, 10)), ability('wBattleMonAbility', 'ROUGH_SKIN')),
                            want='Flamethrower'),
    'plan_rocky_helmet': dict(party=[('SLOWBRO', 60, 'ROCKY_HELMET', ['LEER'])],
                              trainer=[(50, 'ARCANINE', None, ['CRUNCH', 'FLAMETHROWER']), GENGAR],
                              setup=both(set_hp('wEnemyMonHP', (1, 7)), ability('wBattleMonAbility', 'OWN_TEMPO')),
                              want='Flamethrower'),
    'plan_contact_control': dict(party=[('SLOWBRO', 60, None, ['LEER'])],
                                 trainer=[(50, 'ARCANINE', None, ['CRUNCH', 'FLAMETHROWER']), GENGAR],
                                 setup=both(set_hp('wEnemyMonHP', (1, 10)), ability('wBattleMonAbility', 'OWN_TEMPO')),
                                 want='Crunch'),
    # one-hit KO moves fail against Sturdy (every class)
    'plan_ohko_sturdy': dict(party=[('MACHAMP', 40, None, ['LEER'])],
                             trainer=[(50, 'RHYDON', None, ['HORN_DRILL', 'TACKLE']), GENGAR],
                             setup=ability('wBattleMonAbility', 'STURDY'), want='Tackle', want_vanilla='Tackle'),
    # Toxic does nothing to a Magic Guard Pokemon (every class)
    'plan_magic_guard': dict(party=[('MACHAMP', 60, None, ['LEER'])],
                             trainer=[(50, 'SNORLAX', None, ['TOXIC', 'TACKLE']), GENGAR],
                             setup=ability('wBattleMonAbility', 'MAGIC_GUARD'), want='Tackle', want_vanilla='Tackle'),
}


def run_to(g, label, hold='B', limit=60_000_000):
    """Step instructions until `label` (pulsing a button to get through the intro text)."""
    from gb import LIB
    bank, addr = g.sym[label]
    for i in range(limit):
        if i % 50_000 == 0:
            g.hold(hold, i % 100_000 == 0)  # press and release: text waits for a new press
        LIB.GB_run(g.gb)
        if g.pc() == addr and (addr < 0x4000 or g.rd(0xff9e) == bank):
            g.hold(hold, False)
            return
    raise RuntimeError(f'{label} not reached')


def first_move(c, cls, seed):
    """The AI chooses its move before the battle menu (AIChooseMove in BattleTurn), so the
    setup runs at that breakpoint."""
    g = bt.Game(ROM, SYM, STATE); g.seed(seed)
    g.clear_bag(); g.set_party(c['party']); g.seed(seed)
    g.set_trainer(cls, 'Test', c['trainer']); g.seed(seed)
    g.start_battle(cls, 0x01 | bt.SCENE_OFF)
    if c.get('setup'):
        run_to(g, 'AIChooseMove')
        c['setup'](g)
    b = Battle(g, LEER, menus=2)
    try:
        b.run()
    except StopIteration:
        pass
    text = ' '.join(b.log)
    for _, _, _, moves in c['trainer'][:1]:
        for m in moves:
            name = m.replace('_', ' ').title().replace('Softboiled', 'Softboiled')
            if f'used {name}' in text:
                return name
    return text[-60:]


def plan(name):
    c = PLAN[name]
    got = {cls: [first_move(c, cls, s) for s in PLAN_SEEDS] for cls in ('COOLTRAINERM', 'YOUNGSTER')}
    ok = all(m == c['want'] for m in got['COOLTRAINERM'])
    if c.get('want_vanilla'):  # the AI_ABILITY layer: every class
        ok = ok and all(m == c['want_vanilla'] for m in got['YOUNGSTER'])
    print(('ok   ' if ok else 'FAIL ') + f"{name}: plan {got['COOLTRAINERM']}; vanilla {got['YOUNGSTER']}", flush=True)
    return ok


CASES.update(dict.fromkeys(PLAN))
# Sturdy and a Focus Sash leave the player at 1 HP from full: Body Slam (slot 2) loses its
# PLAN_KO_BONUS (20) against them, and gets it back once the player is down 1 HP.
STURDY_PARTY = [('MACHAMP', 20, None, ['LEER'])]
STURDY_TRAINER = [(50, 'SNORLAX', None, ['SWORDS_DANCE', 'BODY_SLAM']), GENGAR]


def one_down(g):
    hp = g.rd16('wBattleMonMaxHP') - 1
    g.wr('wBattleMonHP', [hp >> 8, hp & 0xFF])


def plan_scores(party, setup, trainer=STURDY_TRAINER):
    """The enemy's move scores after AI_PLAN (with its best-hit bonus) on the first turn."""
    g = bt.Game(ROM, SYM, STATE); g.seed(PLAN_SEEDS[0])
    g.clear_bag(); g.set_party(party); g.seed(PLAN_SEEDS[0])
    g.set_trainer('COOLTRAINERM', 'Test', trainer); g.seed(PLAN_SEEDS[0])
    g.start_battle('COOLTRAINERM', 0x01 | bt.SCENE_OFF)
    run_to(g, 'AIChooseMove')
    setup(g)
    run_to(g, 'AIPickLowestScore')
    return list(g.rd('wEnemyAIMoveScores', 2))


def plan_sturdy():
    guts = ability('wBattleMonAbility', 'GUTS')
    sturdy = ability('wBattleMonAbility', 'STURDY')
    got = dict(control=plan_scores(STURDY_PARTY, guts), sturdy=plan_scores(STURDY_PARTY, sturdy),
               sash=plan_scores([('MACHAMP', 20, 'FOCUS_SASH', ['LEER'])], guts),
               sturdy_hurt=plan_scores(STURDY_PARTY, both(sturdy, one_down)))
    base = got['control'][1]
    ok = got['sturdy'][1] == base + 20 and got['sash'][1] == base + 20 and got['sturdy_hurt'][1] == base
    print(('ok   ' if ok else 'FAIL ') + f'plan_sturdy: Body Slam scores {got}', flush=True)
    return ok


def plan_static():
    """Rock Slide and Zen Headbutt (contact) both have 80 power: on a tie the later move gets
    the best-hit bonus (2). Static may paralyze Snorlax, so Zen Headbutt counts 3/4 and the
    bonus goes to Rock Slide."""
    trainer = [(50, 'SNORLAX', None, ['ROCK_SLIDE', 'ZEN_HEADBUTT']), GENGAR]
    party = [('SNORLAX', 60, None, ['LEER'])]
    control = plan_scores(party, ability('wBattleMonAbility', 'GUTS'), trainer)
    static = plan_scores(party, ability('wBattleMonAbility', 'STATIC'), trainer)
    ok = static == [control[0] - 2, control[1] + 2]
    print(('ok   ' if ok else 'FAIL ') + f'plan_static: scores {static} (Guts {control})', flush=True)
    return ok



# ---- bosses assume the player's level-up moves (AI_KNOWS_LEARNSETS)
def learnset_case(flag):
    """Koga (a boss class) KOs-lead send-in against a level 62 Machamp that has only shown
    Vicegrip (Muk resists Fighting; Zen Headbutt is its threat); flag False patches AI_KNOWS_LEARNSETS off. -> (wSAILearnset, send-in score)."""
    g = bt.Game(ROM, SYM, STATE); g.seed()
    if not flag:
        cls = g.const('KOGA') - 1
        nattr = g.const('NUM_TRAINER_ATTRIBUTES')
        at = g.rom_addr('TrainerClassAttributes') + cls * nattr + g.const('TRNATTR_AI_MOVE_WEIGHTS') + 1
        bit = g.const('AI_KNOWS_LEARNSETS_F') - 8
        g.poke_rom(at, [g.rom()[at] & ~(1 << bit)])
    g.clear_bag(); g.set_party([('MACHAMP', 62, None, ['VICEGRIP'])]); g.seed()
    g.set_trainer('KOGA', 'Test', [LEAD, (50, 'MUK', None, ['SLUDGE_BOMB']), DRAGONITE]); g.seed()
    g.start_battle('KOGA', 0x01 | bt.SCENE_OFF)
    b = Battle(g, [('move', 0)], menus=2)
    try:
        b.run()
    except StopIteration:
        pass
    raw = g.rd('wSAILearnset', 8)
    return [raw[i] << 8 | raw[i + 1] for i in range(0, 8, 2)], g.rd('wSAIBestScore')


def learnset():
    want = [g_const for g_const in ('COUNTER', 'HEAVY_SLAM', 'SUBMISSION', 'ZEN_HEADBUTT')]
    on, off = learnset_case(True), learnset_case(False)
    g = bt.Game(ROM, SYM, STATE)
    want = [g.const(f'HIGH({m})') << 8 | g.const(f'LOW({m})') for m in want]
    ok = on[0] == want and off[0] == [0] * 4 and 0 < on[1] < off[1]
    print(('ok   ' if ok else 'FAIL ') + f'learnset: moveset {on[0]} (want {want}), off {off[0]}; '
          f'Muk send-in score {on[1]} (boss) < {off[1]} (flag off)', flush=True)
    return ok


CASES['learnset'] = None
CASES['plan_sturdy'] = None
CASES['plan_static'] = None
CASES['tiers'] = None
CASES.update(dict.fromkeys(PAIRS))
CASES.update(dict.fromkeys(SENDIN_PAIRS))
CASES['frostbite_physical'] = None
fails = [n for n in (sys.argv[4:] or CASES)
         if not (tiers() if n == 'tiers' else pair(n) if n in PAIRS else sendin_pair(n) if n in SENDIN_PAIRS
                 else frostbite_physical() if n == 'frostbite_physical' else plan(n) if n in PLAN
                 else learnset() if n == 'learnset' else plan_sturdy() if n == 'plan_sturdy' else plan_static() if n == 'plan_static'
                 else run(n))]
print('FAILS:', fails)
