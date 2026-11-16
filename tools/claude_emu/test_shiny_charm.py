"""Shiny Charm (held_items_far.asm: ShinyCharmBattleDVs, ShinyCharmSpawnDV) and the Battle
Resort Tower receptionist who gives it.

The re-rolls' random call is patched to return $FF (the shiny Speed/Special byte), so a
re-roll shows up as a shiny byte: with the charm a wild battle's mon is shiny, without it the
first roll stands. Then the receptionist: nothing before the first 49-win medal, the charm
once with it (EVENT_GOT_SHINY_CHARM), not again.

usage: test_shiny_charm.py ROM SYM STATE
"""
import sys
from battle_test import Game
import test_battle_tower as TB
from test_facility import check, RESULTS

ROM, SYM, STATE = sys.argv[1:4]


def patched(g, label='ShinyCharmBattleDVs.loop', rnd='BattleRandom'):
    # the re-roll's "call BattleRandom" (or Random) -> "ld a, $ff; nop"
    base = g.rom_addr(label)
    r = g.rom()
    lo, hi = g.sym[rnd][1] & 0xFF, g.sym[rnd][1] >> 8
    for i in range(base, base + 16):
        if r[i] == 0xCD and r[i + 1] == lo and r[i + 2] == hi:
            g.poke_rom(i, [0x3E, 0xFF, 0x00])
            return True
    return False


def has_key_item(g, name):
    g.script(f'\tcheckitem {name}', 10)
    return g.rd('wScriptVar')


def wild_spd_dv(charm):
    g = Game(ROM, SYM, STATE)
    ok = patched(g)
    if charm:
        g.run_script('TestScript:\n\tgiveitem SHINY_CHARM\n\tend\n')
        g.frames(30)
    g.start_wild('PIDGEY', 10)
    for _ in range(60):
        g.frames(10)
        if g.rd('wBattleMode'):
            break
    return ok, g.rd('wEnemyMonDVs', 2)


def main():
    ok, dv = wild_spd_dv(False)
    check('patch found', ok)
    check('no charm: the first roll stands (not shiny)', dv[1] != 0xFF, f'DVs {dv}')
    ok, dv = wild_spd_dv(True)
    check('with the charm: re-rolled (shiny with the patched roll)', dv[1] == 0xFF, f'DVs {dv}')

    # overworld spawns (Route 29): all shiny with the charm and the patched re-roll
    import test_spawns as TS
    for charm in (False, True):
        g = Game(ROM, SYM, STATE)
        ok = patched(g, 'ShinyCharmSpawnDV.loop', 'Random')
        if charm:
            g.run_script('TestScript:\n\tgiveitem SHINY_CHARM\n\tend\n')
            g.frames(30)
        g.run_script('TestScript:\n\twarp ROUTE_29, 20, 10\n\tend\n')
        g.frames(300)
        dvs = [t['dvs'][1] for t in TS.spawns(g)]
        if charm:
            check('spawns with the charm: re-rolled (all shiny with the patched roll)', ok and dvs and all(d == 0xFF for d in dvs), str(dvs))
        else:
            check('spawns without the charm: first rolls stand', ok and dvs and not all(d == 0xFF for d in dvs), str(dvs))

    # the receptionist
    def talk(g):
        g.press('A', after=60)
        for _ in range(40):
            g.press('B', after=40)
    g = TB.setup()
    talk(g)
    check('before the 49-win medal: no charm', not has_key_item(g, 'SHINY_CHARM'))
    g = TB.setup()
    g.wr('wTowerState', g.rd('wTowerState') | 1 << g.const('TOWER_PRIZE49_F'))
    talk(g)
    got = has_key_item(g, 'SHINY_CHARM')
    flag = TB.I.flag(g, 'EVENT_GOT_SHINY_CHARM')
    check('with the medal: the Shiny Charm and its flag', got and flag, f'item {got} flag {flag}')
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
