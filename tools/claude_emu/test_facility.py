"""Challenge facility engine (engine/events/facility.asm).

In the Test Room: FacilitySetup counts the eligible party Pokémon for each
category (the FACILITY_TEST record is patched in the ROM image per case);
FacilityStartRun leaves the 4 picks in order at the facility level with
recalculated stats and the party kept in SRAM; FacilityLoadTrainer sets up a
Cup battle at that level (singles even with the Doubles option); a won battle
heals; FacilityEndRun brings the party back byte for byte.

usage: test_facility.py ROM SYM STATE
"""
import re
import sys
from harness import H, warp_script
from battle_test import assemble_block, SCRIPT_ORG, Battle, Game

ROM, SYM, STATE = sys.argv[1:4]
CSE = __import__('os').environ.get('CSE', '/root/cse')
RESULTS = []
PARTYMON = None


def check(name, ok, info=''):
    RESULTS.append((name, bool(ok)))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''))


class G(H):
    slot_size = Game.slot_size

    def const(self, expr):
        return assemble_block(f'\tdb {expr}', 0, SCRIPT_ORG)[0]

    def const16(self, expr):
        b = assemble_block(f'\tdw {expr}', 0, SCRIPT_ORG)
        return b[0] | b[1] << 8

    def script(self, body, frames=60):
        self.run_script('TestScript:\n' + body + '\n\tend\n')
        self.frames(frames)

    def call(self, name):
        bk, ad = self.sym[name]
        return f'\tdb callasm_command\n\tdb ${bk:02x}\n\tdw ${ad:04x}'

    def special(self, name, frames=30):
        self.script(self.call(name), frames)


def eligibility():
    """species name -> (little, middle, region bits) from the generated table."""
    out = {}
    for l in open(f'{CSE}/data/pokemon/facility_eligibility.asm', encoding='utf-8'):
        m = re.match(r'\s*db (.*) ; (\w+)', l)
        if m and m[2] != '(no':
            f = m[1]
            out[m[2]] = ('LITTLE' in f, 'MIDDLE' in f, 'KANTO' if 'KANTO' in f else 'HOENN' if 'HOENN' in f else 'JOHTO')
    return out


def species_names():
    names = [None]
    for l in open(f'{CSE}/data/pokemon/follower_palettes.asm', encoding='utf-8'):
        m = re.match(r'\s*RGB .*;\s*([A-Z0-9_]+)', l)
        if m and '(no species)' not in l:
            names.append(m[1])
    return names


def party_block(g):
    a = g.sym['wPartyCount'][1]
    b = g.sym['wPartyMonNicknamesEnd'][1]
    return g.rd('wPartyCount', b - a)


def main():
    g = G(ROM, None, SYM)
    g.load(STATE)
    g.run_script(warp_script('TESTROOM', 15, 20))
    g.frames(200)
    # a party of 6 known Pokémon (Little/Middle/types/regions mixed)
    team = [('BULBASAUR', 10), ('IVYSAUR', 20), ('PIKACHU', 15), ('MACHOP', 12), ('TREECKO', 8), ('GROVYLE', 22)]
    g.wr('wPartyCount', 0)
    g.wr('wPartySpecies', 0xff)
    for s_, lv in team:
        g.script(f'\tgivepoke {s_}, {lv}', 60)
        for _ in range(6):
            g.press('B', after=20)
    count = g.rd('wPartyCount')
    check('setup: a party of 6', count == 6, str(count))
    psize = g.const('PARTYMON_STRUCT_LENGTH')
    lvl_off = g.const('MON_LEVEL')
    rec = g.sym['FacilityRecords']
    rec_addr = rec[0] * 0x4000 + rec[1] - 0x4000 if rec[0] else rec[1]
    elig = eligibility()
    names = species_names()
    cats = {'ANY': 0, 'LITTLE': 1, 'MIDDLE': 2, 'TYPE': 3, 'REGION': 4}

    def setup(cat, param=0):
        g.poke_rom(rec_addr, [cats[cat], param])
        g.script('\tsetval FACILITY_TEST\n' + g.call('FacilitySetup'), 30)
        return g.rd('wScriptVar')

    want = {
        'ANY': 6,
        'LITTLE': sum(elig[s][0] for s, _ in team),
        'MIDDLE': sum(elig[s][1] for s, _ in team),
    }
    for cat, n in want.items():
        got = setup(cat)
        check(f'eligibility: {cat} counts {n}', got == n, str(got))
    got = setup('TYPE', g.const('GRASS'))
    check('eligibility: Grass type cup counts the 4 Grass Pokémon', got == 4, str(got))
    got = setup('REGION', g.const('FACILITY_HOENN'))
    check('eligibility: Hoenn cup counts Treecko and Grovyle', got == 2, str(got))
    setup('ANY')

    before = party_block(g)
    cap = g.rd('wLevelCap')
    g.wr('wOptions2', g.rd('wOptions2') | 1 << g.const('TRAINER_DOUBLES'))
    picks = [5, 2, 0, 3]
    g.wr('wFacilityPicks', picks)
    g.wr('wFacilityPickCount', 4)
    old_max = [g.rd16(f'wPartyMon1MaxHP+{p * psize}') for p in picks]
    g.special('FacilityStartRun', 60)
    sp = g.rd('wPartySpecies', 5)
    lv = [g.rd(f'wPartyMon1+{i * psize + lvl_off}') for i in range(4)]
    check('start: only the 4 picks, in pick order', g.rd('wPartyCount') == 4 and sp[:4] == [before[1 + p] for p in picks]
          and sp[4] == 0xff, str(sp))
    check('start: every pick at the level cap', all(x == cap for x in lv) and g.rd('wFacilityLevel') == cap,
          f'{lv} cap {cap}')
    hp = [g.rd16(f'wPartyMon1HP+{i * psize}') for i in range(4)]
    mx = [g.rd16(f'wPartyMon1MaxHP+{i * psize}') for i in range(4)]
    check('start: stats recalculated, fully healed', all(h == m and m > 0 for h, m in zip(hp, mx)) and
          mx != old_max, f'hp {hp} max {mx}, before {old_max}')

    g.special('FacilityLoadTrainer')
    check('trainer: a Cup battle against round 1\'s trainer',
          g.rd('wBattleType') == g.const('BATTLETYPE_CUP') and g.rd('wOtherTrainerClass') == g.const('COOLTRAINERM'))
    g.script('\twinlosstext 0, 0\n\tstartbattle\n\treloadmap', 10)
    lv_ot = None
    for _ in range(600):
        g.frames(10)
        if g.rd('wBattleMode') and g.rd('wOTPartyCount'):
            lv_ot = [g.rd(f'wOTPartyMon1+{i * psize + lvl_off}') for i in range(g.rd('wOTPartyCount'))]
            break
    check('battle: the trainer\'s Pokémon at the level cap, singles despite the Doubles option',
          lv_ot and all(x == cap for x in lv_ot) and g.rd('wDoubleBattle') == 0, f'{lv_ot}, double {g.rd("wDoubleBattle")}')
    # lose it: every party Pokémon at 1 HP. A Cup loss doesn't black out.
    money = g.rd('wMoney', 3)
    for i in range(4):
        g.wr(f'wPartyMon1HP+{i * psize}', [0, 1])
    g.wr('wBattleMonHP', [0, 1])
    Battle(g, []).run()
    g.frames(120)
    check('battle: a loss keeps the player in place with their money',
          not g.rd('wBattleMode') and g.rd('wBattleResult') & 0xf == 1 and g.rd('wMoney', 3) == money and
          g.rd('wMapNumber') == g.const('MAP_TESTROOM'), f'result {g.rd("wBattleResult")}')
    check('battle: no EXP or levels gained', [g.rd(f'wPartyMon1+{i * psize + lvl_off}') for i in range(4)] == [cap] * 4)
    g.special('FacilityNextRound')
    check('rounds: round 2 follows', g.rd('wScriptVar') == 1 and g.rd('wFacilityRound') == 1)
    g.special('FacilityEndRun', 60)
    check('end: the party is back byte for byte', party_block(g) == before)
    check('end: no facility level after the run', g.rd('wFacilityLevel') == 0)
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
