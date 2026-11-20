"""TMs and HMs as one bit each (engine/items/items.asm: ReceiveTMHM, TossTMHM,
CheckTMHM; wTMsHMs with TMs from bit 0 and HMs from bit MAX_TMS).

Giving, checking and taking TMs and HMs through scripts, the bit each one
uses, the TM pocket's list, and marts leaving out TMs the player owns.

usage: test_tmhm_bits.py ROM SYM STATE
"""
import sys
import test_facility as T

ROM, SYM, STATE = sys.argv[1:4]
check = T.check


def owned(g, item):
    g.script(f'\tcheckitem {item}', 30)
    return g.rd('wScriptVar') == 1


def bit(g, n):
    return g.rd(f'wTMsHMs+{n // 8}') >> (n % 8) & 1


def main():
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.frames(30)
    max_tms = g.const('MAX_TMS')
    num_tms = g.const('NUM_TMS')

    g.script('\ttakeitem TM_THUNDERPUNCH', 30)
    check('take: a TM is no longer owned', not owned(g, 'TM_THUNDERPUNCH'))
    n = g.const('THUNDERPUNCH_TMNUM') - 1
    check('take: its bit is clear', bit(g, n) == 0)
    g.script('\tgiveitem TM_THUNDERPUNCH', 30)
    check('give: owned again, its bit set', owned(g, 'TM_THUNDERPUNCH') and bit(g, n) == 1)
    g.script('\tgiveitem TM_THUNDERPUNCH', 30)
    check('give twice: still owned, giveitem succeeds', owned(g, 'TM_THUNDERPUNCH') and g.rd('wScriptVar') == 1)

    # HMs sit from bit MAX_TMS
    surf = g.const('SURF_TMNUM') - num_tms - 1
    g.script('\ttakeitem HM_SURF', 30)
    check('HM: taken', not owned(g, 'HM_SURF') and bit(g, max_tms + surf) == 0)
    g.script('\tgiveitem HM_SURF', 30)
    check('HM: its bit is MAX_TMS + its number - 1', owned(g, 'HM_SURF') and bit(g, max_tms + surf) == 1)
    check('HM: no bit between the last TM and MAX_TMS is set',
          all(bit(g, b) == 0 for b in range(num_tms, max_tms)))

    # marts: an owned TM isn't listed
    for tm, want in ((['TM_THUNDERPUNCH'], 1), (['TM_THUNDERPUNCH', 'TM_FIRE_PUNCH', 'TM_ICE_PUNCH'], 3), ([], 0)):
        for t in ('TM_THUNDERPUNCH', 'TM_FIRE_PUNCH', 'TM_ICE_PUNCH'):
            g.script(f'\t{"takeitem" if t in tm else "giveitem"} {t}', 20)
        g.script('\topentext\n\tpokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_1\n\tclosetext', 200)
        g.press('A', after=80)  # Buy: the list is read now
        count = g.rd('wCurMartCount')
        check(f'mart: {want} of the 3 TMs listed when {3 - want} are owned', count == want, str(count))
        for _ in range(6):
            g.press('B', after=40)

    # the TM pocket's list matches the bits
    g.script(g.call('BuildTMHMPocketList'), 30)
    lst = g.rd('wTMHMPocketList', num_tms + g.const('NUM_HMS'))
    want = [bit(g, i if i < num_tms else max_tms + i - num_tms) for i in range(len(lst))]
    check('pocket list: one entry per TM/HM owned', [1 if x else 0 for x in lst] == want)

    bad = [x for x, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
