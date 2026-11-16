"""Wild AI (engine/battle/ai/wild_ai.asm): wild Pokémon score their moves with a profile's layers.

Score cases start a wild battle, stop at AIChooseMove (the AI chooses before the battle menu),
give the wild Pokémon chosen moves, then read wEnemyAIMoveScores at AIPickLowestScore (lower
is better). The species picks the profile (its first overworld behavior): Bulbasaur Wanderer
-> Basic, Charmander Aggressive -> Feral, Pidgey Curious -> Cunning, Squirtle Lazy -> Random,
Spearow Skittish -> Skittish. The play case runs a battle and reads the moves it used.

usage: test_wild_ai.py ROM SYM STATE [case ...]
"""
import sys
from battle_test import Game, Battle, SCENE_OFF

ROM, SYM, STATE = sys.argv[1:4]
RESULTS = []
SEEDS = [1, 77, 150, 203, 251]


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def run_to(g, label, hold='B', limit=60_000_000):
    """Step instructions until `label` (pulsing a button to get through the intro text)."""
    from gb import LIB
    bank, addr = g.sym[label]
    for i in range(limit):
        if i % 50_000 == 0:
            g.hold(hold, i % 100_000 == 0)
        LIB.GB_run(g.gb)
        if g.pc() == addr and (addr < 0x4000 or g.rd(0xff9e) == bank):
            g.hold(hold, False)
            return
    raise RuntimeError(f'{label} not reached')


def start(species, level, moves, player, seed=1, items=(), boss=None):
    """A wild battle stopped at the first AIChooseMove, with the wild Pokémon knowing `moves`
    (their IDs come from a helper party Pokémon that knows them)."""
    g = Game(ROM, SYM, STATE)
    g.seed(seed)
    g.clear_bag()
    g.set_party(player + [('SMEARGLE', 5, None, moves)], items)
    g.wr('wOptions', 0x01 | SCENE_OFF)
    g.wr('wWildLevel', 0)
    size = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    ids = list(g.rd(f'wPartyMon1Moves+{len(player) * size}', 4))
    g.seed(seed)
    lb = f"\tloadmem ${g.sym['wBossID'][1]:04x}, {g.const(boss)}\n" if boss else ''
    g.run_script(f'TestScript:\n{lb}\tloadwildmon {species}, {level}\n\tstartbattle\n\treloadmapafterbattle\n\tend')
    run_to(g, 'AIChooseMove')
    g.wr('wEnemyMonMoves', ids)
    g.wr('wEnemyMonPP', [10 if m else 0 for m in ids])
    g.wr('wEnemyDisabledMove', 0)
    return g


def scores(species, level, moves, player, setup=None, seed=1, boss=None, game=False):
    g = start(species, level, moves, player, seed, boss=boss)
    if setup:
        setup(g)
    run_to(g, 'AIPickLowestScore')
    s = list(g.rd('wEnemyAIMoveScores', len(moves)))
    return (s, g) if game else s


GENGAR = [('GENGAR', 30, None, ['HARDEN'])]
SNORLAX = [('SNORLAX', 30, None, ['HARDEN'])]


def half_hp(g):
    g.wr16('wEnemyMonHP', g.rd16('wEnemyMonMaxHP') // 2)


def case_random():
    s = scores('SQUIRTLE', 20, ['TACKLE', 'WATER_GUN'], GENGAR)
    check('Random (Lazy Squirtle): no layers, the moves tie (Tackle into a Ghost too)', s[0] == s[1], f'{s}')


def case_basic_immune():
    worst = [scores('BULBASAUR', 20, ['TACKLE', 'VINE_WHIP'], GENGAR, seed=sd) for sd in SEEDS]
    check('Basic (Wanderer Bulbasaur): Tackle into a Ghost scores worse than Vine Whip',
          all(s[0] > s[1] for s in worst), f'{worst}')


def case_feral():
    # Machamp: no ability against Fire (Snorlax's Thick Fat makes Scratch the stronger hit)
    machamp = [('MACHAMP', 30, None, ['HARDEN'])]
    got = [scores('CHARMANDER', 30, ['SCRATCH', 'FLAMETHROWER'], machamp, seed=sd) for sd in SEEDS]
    check('Feral (Aggressive Charmander): its strongest hit scores best', all(s[1] < s[0] for s in got), f'{got}')


def case_cunning_status():
    # the Smart layer favors paralysis against a faster player
    # (not an Electric type: those can't be paralyzed here, and the AI knows it)
    crobat = [('CROBAT', 30, None, ['HARDEN'])]
    basic = [scores('BULBASAUR', 20, ['TACKLE', 'THUNDER_WAVE'], crobat, seed=sd)[1] for sd in SEEDS]
    cunning = [scores('PIDGEY', 20, ['TACKLE', 'THUNDER_WAVE'], crobat, seed=sd)[1] for sd in SEEDS]
    check('Cunning (Curious Pidgey) favors Thunder Wave on a faster Crobat more than Basic',
          sum(cunning) < sum(basic), f'Thunder Wave: cunning {cunning}, basic {basic}')


def case_escape():
    weak = [('MAGIKARP', 10, None, ['SPLASH'])]  # no one-hit threat to a level 20 Spearow
    full = scores('SPEAROW', 20, ['PECK', 'TELEPORT'], weak)
    hurt = scores('SPEAROW', 20, ['PECK', 'TELEPORT'], weak, half_hp)
    feral = scores('CHARMANDER', 20, ['SCRATCH', 'ROAR'], SNORLAX, half_hp)
    rand = scores('SQUIRTLE', 20, ['TACKLE', 'WHIRLWIND'], SNORLAX, half_hp)
    check('Skittish: Teleport avoided at full HP (80), picked at half HP (1)', full[1] == 80 and hurt[1] == 1,
          f'full {full} half {hurt}')
    check('other profiles never pick Roar/Whirlwind (Feral, Random at half HP: 80)', feral[1] == 80 and rand[1] == 80,
          f'feral {feral} random {rand}')


def case_escape_threat():
    strong = [('MACHAMP', 80, None, ['CROSS_CHOP'])]
    s = scores('SPEAROW', 10, ['PECK', 'TELEPORT'], strong)
    check('Skittish at full HP escapes when the player\'s best hit knocks it out', s[1] == 1, f'{s}')


def case_heal_bell():
    clean = scores('BULBASAUR', 20, ['TACKLE', 'HEAL_BELL'], SNORLAX)
    sick = scores('BULBASAUR', 20, ['TACKLE', 'HEAL_BELL'], SNORLAX,
                  lambda g: g.wr('wEnemyMonStatus', 1 << g.const('PSN')))
    check('Heal Bell: useless without a status (80), usable with one', clean[1] == 80 and sick[1] < 80,
          f'clean {clean} poisoned {sick}')


def case_play():
    """A whole battle: the Basic Bulbasaur never uses Tackle on Gengar while Vine Whip has PP (10)."""
    g = start('BULBASAUR', 20, ['TACKLE', 'VINE_WHIP'], [('GENGAR', 40, None, ['HARDEN'])])
    r = Battle(g, [('move', 0)] * 5).run()
    log = [m for rec in r for m in rec.get('log', [])]
    used = [m for m in log if 'Bulbasaur used' in m]
    check('in battle: the Basic Bulbasaur uses Vine Whip (10 PP) before ever using Tackle on Gengar',
          len(used) >= 10 and all('Vine Whip' in m for m in used[:10]), f'{len(used)} uses: {used[:11]}')


def case_boss_profile():
    """The record's profile: Red Gyarados is Feral (no AI_PLAN: scores near 20), Mewtwo is Boss
    (AI_PLAN raises every score by PLAN_OFFSET first)."""
    feral = scores('GYARADOS', 20, ['TACKLE', 'BITE'], SNORLAX, boss='BOSS_RED_GYARADOS')
    boss = scores('MEWTWO', 20, ['CONFUSION', 'DISABLE'], SNORLAX, boss='BOSS_MEWTWO')
    check('boss AI from its record: Red Gyarados Feral (no plan), Mewtwo Boss (plan offset)',
          max(feral) < 30 and min(boss) >= 30, f'feral {feral} boss {boss}')


def case_boss_learnset():
    """A wild boss assumes the player's level-up moves (wSAILearnset), like a trainer boss."""
    s, g = scores('MEWTWO', 20, ['CONFUSION', 'DISABLE'], [('MACHAMP', 30, None, ['HARDEN'])],
                  boss='BOSS_MEWTWO', game=True)
    learn = list(g.rd('wSAILearnset', 8))
    check('a wild boss knows the player\'s level-up moves (wSAILearnset filled)', any(learn), f'{learn}')


def case_boss_ko():
    """A Boss-profile boss takes the knockout: Psychic on a 1-HP Machamp beats Growl by the KO bonus."""
    got = [scores('MEWTWO', 40, ['GROWL', 'PSYCHIC_M'], [('MACHAMP', 30, None, ['HARDEN'])],
                  lambda g: g.wr16('wBattleMonHP', 1), seed=sd, boss='BOSS_MEWTWO') for sd in SEEDS[:3]]
    check('a Boss-profile boss takes the knockout (Psychic far below Growl)', all(s[1] + 15 <= s[0] for s in got), f'{got}')


CASES = [case_random, case_basic_immune, case_feral, case_cunning_status, case_escape, case_escape_threat,
         case_heal_bell, case_play, case_boss_profile, case_boss_learnset, case_boss_ko]


def main():
    names = sys.argv[4:]
    for c in CASES:
        if not names or c.__name__ in names:
            c()
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed' + (f'; failed: {bad}' if bad else ''))


if __name__ == '__main__':
    main()
