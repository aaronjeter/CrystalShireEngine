"""Facility levels with level caps off (GetWorldLevelCap, engine/events/facility.asm).

With caps on, a facility run is at wLevelCap. With caps off (wLevelCap 100), it is
at the cap the game would set: wBaseLevel + 11, plus 2 per League beaten, at
most 100. A Cup battle outside a facility level (wFacilityLevel 0) uses the same
value. wLevelCap itself stays 100 with caps off.

usage: test_world_level_cap.py ROM SYM STATE
"""
import sys
from harness import warp_script
from battle_test import Battle
from test_facility import G, check, RESULTS, party_block

ROM, SYM, STATE = sys.argv[1:4]
LEAGUES = ['EVENT_BEAT_INDIGO_LEAGUE', 'EVENT_BEAT_JOHTO_LEAGUE', 'EVENT_BEAT_HOENN_LEAGUE']


def main():
    g = G(ROM, None, SYM)
    g.load(STATE)
    g.run_script(warp_script('TESTROOM', 15, 20))
    g.frames(200)
    g.wr('wPartyCount', 0)
    g.wr('wPartySpecies', 0xff)
    for s_, lv in [('BULBASAUR', 10), ('PIKACHU', 15), ('MACHOP', 12), ('TREECKO', 8)]:
        g.script(f'\tgivepoke {s_}, {lv}', 60)
        for _ in range(6):
            g.press('B', after=20)
    check('setup: a party of 4', g.rd('wPartyCount') == 4)
    psize = g.const('PARTYMON_STRUCT_LENGTH')
    lvl_off = g.const('MON_LEVEL')

    def state(caps, cap, base, leagues):
        ev = ('\tsetevent' if caps else '\tclearevent') + ' EVENT_LEVELCAPS_ENABLED\n'
        for i, e in enumerate(LEAGUES):
            ev += ('\tsetevent ' if i < leagues else '\tclearevent ') + e + '\n'
        g.script(ev, 10)
        g.wr('wLevelCap', cap)
        g.wr('wBaseLevel', base)

    def run_level():
        g.script('\tsetval FACILITY_TEST\n' + g.call('FacilitySetup'), 30)
        g.wr('wFacilityPicks', [0, 1, 2, 3])
        g.wr('wFacilityPickCount', 4)
        g.special('FacilityStartRun', 60)
        lv = [g.rd(f'wPartyMon1+{i * psize + lvl_off}') for i in range(4)]
        return g.rd('wFacilityLevel'), lv

    def end_run():
        g.special('FacilityEndRun', 60)

    before = party_block(g)
    cases = [
        ('caps on: the run is at wLevelCap', (True, 37, 20, 0), 37),
        ('caps on: League flags don\'t add to wLevelCap', (True, 37, 20, 3), 37),
        ('caps off: wBaseLevel + 11', (False, 100, 20, 0), 31),
        ('caps off: +2 for one League', (False, 100, 20, 1), 33),
        ('caps off: +6 for three Leagues', (False, 100, 45, 3), 62),
        ('caps off: at most 100', (False, 100, 95, 3), 100),
    ]
    for name, st, want in cases:
        state(*st)
        lvl, lv = run_level()
        check(name, lvl == want and lv == [want] * 4, f'facility {lvl}, party {lv}, want {want}')
        check(name + ' (wLevelCap unchanged)', g.rd('wLevelCap') == st[1], str(g.rd('wLevelCap')))
        end_run()
    check('end: the party is back byte for byte', party_block(g) == before)

    # a battle in a caps-off run: the foes at the facility level
    state(False, 100, 20, 1)
    lvl, _ = run_level()
    g.special('FacilityLoadTrainer')

    def battle_levels():
        g.script('\twinlosstext 0, 0\n\tstartbattle\n\treloadmap', 10)
        for _ in range(600):
            g.frames(10)
            if g.rd('wBattleMode') and g.rd('wOTPartyCount'):
                return [g.rd(f'wOTPartyMon1+{i * psize + lvl_off}') for i in range(g.rd('wOTPartyCount'))]

    def lose():
        for i in range(g.rd('wPartyCount')):
            g.wr(f'wPartyMon1HP+{i * psize}', [0, 1])
        g.wr('wBattleMonHP', [0, 1])
        Battle(g, []).run()
        g.frames(120)

    lv_ot = battle_levels()
    check('battle, caps off: the foes at the would-be cap (33)', lv_ot and all(x == 33 for x in lv_ot), str(lv_ot))
    lose()
    end_run()
    # a Cup battle with no facility level (CupBattleLevel's fallback)
    state(False, 100, 30, 0)
    g.special('FacilityLoadTrainer')
    g.wr('wFacilityLevel', 0)
    lv_ot = battle_levels()
    check('Cup battle without a facility level, caps off: the would-be cap (41)',
          lv_ot and all(x == 41 for x in lv_ot), str(lv_ot))
    check('wLevelCap still 100 with caps off', g.rd('wLevelCap') == 100)

    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
