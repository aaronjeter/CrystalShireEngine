"""Wonder Trade: the pool, evolve-to-fit, the rolls (DVs, ability, item, OT), the trade
itself (through DoNPCTrade) and the refusals.

usage: test_wonder_trade.py ROM SYM STATE

Full trades run the real script (farsjump WonderTradeScript) and press A through it.
The species is forced by patching WonderTradePool in the ROM image to one entry.
The roll rates call WonderTradeExecute with its farcall to WonderTradeDoTrade
patched out, many times.
"""
import os, re, sys
from battle_test import Game, item_count

ROM, SYM, STATE = sys.argv[1:4]
CSE = os.environ.get('CSE', '.')
RESULTS = []
EGG = 0xfd
LEGENDS_ETC = ['ARTICUNO', 'ZAPDOS', 'MOLTRES', 'MEWTWO', 'MEW', 'RAIKOU', 'ENTEI', 'SUICUNE', 'LUGIA',
               'HO_OH', 'CELEBI', 'REGIROCK', 'REGICE', 'REGISTEEL', 'LATIAS', 'LATIOS', 'KYOGRE', 'GROUDON',
               'RAYQUAZA', 'JIRACHI', 'MERCURY', 'VENUS', 'MARS', 'JUPITER', 'IRONBUNDLE']
OT_NAMES = ['Kenta', 'Marco', 'Tobias', 'Yusuf', 'Liam', 'Hiro', 'Dmitri', 'Felipe',
            'Aiko', 'Sofia', 'Nadia', 'Emma', 'Mei', 'Lucia', 'Hana', 'Ingrid']


def check(name, ok, info=''):
    RESULTS.append((name, ok))
    print(('PASS ' if ok else 'FAIL ') + name + (f'  [{info}]' if info else ''), flush=True)


def new(party, pool=None, nuzlocke=False):
    g = Game(ROM, SYM, STATE)
    g.seed()
    g.clear_bag()
    g.set_party(party)
    if pool:
        a = g.rom_addr('WonderTradePool')
        idx = g.const16(pool)
        g.poke_rom(a, [1, 0, idx & 0xff, idx >> 8])
    g.wr('wOptions2', (g.rd('wOptions2') | 0x10) if nuzlocke else (g.rd('wOptions2') & ~0x10))
    return g


def run_trade(g, presses=None):
    """Talk to the Wonder Trade script; A through everything (pick the first party slot)."""
    b, a = g.sym['WonderTradeScript']
    g.run_script(f'\tdb farsjump_command\n\tdb {b}\n\tdw {a}\n')
    seen = []
    for i in range(160):
        g.frames(25)
        t = ' '.join(g.screen_text().split())
        if t and (not seen or seen[-1] != t):
            seen.append(t)
        if presses and i < len(presses):
            g.press(presses[i], after=5)
        else:
            g.press('A', after=5)
        if i > 20 and g.rd('wScriptRunning') == 0 and g.rd('wScriptMode') == 0:
            break
    g.frames(30)
    return ' | '.join(seen)


def received(g):
    """(species index, level, OT name, DVs, item ID, ability slot, caught gender bit) of the last party slot."""
    n = g.rd('wPartyCount') - 1
    size = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    base = g.sym['wPartyMon1'][1] + n * size
    sp = g.rd('wPartySpecies', 6)[n]
    ot = g.rd(g.sym['wPartyMonOTs'][1] + n * 11, 11)
    return dict(slot=n, species8=sp, level=g.rd(base + g.const('MON_LEVEL')),
                ot=decode(ot), dvs=list(g.rd(base + g.const('MON_DVS'), 2)),
                item=g.rd(base + g.const('MON_ITEM')),
                ability=g.rd(base + g.const('MON_ABILITY_SLOT')) & 3,
                hp=g.rd(base + g.const('MON_HP'), 2), maxhp=g.rd(base + g.const('MON_MAXHP'), 2),
                caught=list(g.rd(base + g.const('MON_CAUGHTDATA'), 2)),
                id=list(g.rd(base + g.const('MON_OT_ID'), 2)))


def decode(bs):
    from harness import CHARS as C
    out = ''
    for b in bs:
        if b == 0x50:
            break
        out += C.get(b, '?')
    return out


def party_index(g, slot):
    """16-bit species index of party slot (through the 8-bit ID allocation table)."""
    sid = g.rd('wPartySpecies', 6)[slot]
    lo, hi = g.rd(f'wPokemonIndexTableEntries+{2 * (sid - 1)}', 2)
    return lo | hi << 8


def case_pool():
    g = Game(ROM, SYM, STATE)
    rom = g.rom()
    a = g.rom_addr('WonderTradePool')
    n = rom[a] | rom[a + 1] << 8
    idx = [rom[a + 2 + 2 * i] | rom[a + 3 + 2 * i] << 8 for i in range(n)]
    bad = [c for c in LEGENDS_ETC if g.const16(c) in idx]
    check('the pool has no legendary, mythical, Djinn or event species', not bad and 150 < n < 256, f'{n} species, bad {bad}')
    r = os.system(f'python3 {CSE}/tools/wonder_trade_table.py {CSE} --check > /dev/null')
    check('the generated pool table is up to date', r == 0)


def case_evolve():
    for lvl, want in ((10, 'ODDISH'), (21, 'GLOOM'), (30, 'GLOOM'), (40, 'VILEPLUME')):
        g = new([('RATTATA', lvl, None, ['TACKLE']), ('PIDGEY', 5, None, ['TACKLE'])], pool='ODDISH')
        t = run_trade(g)
        r = received(g)
        got = party_index(g, r['slot'])
        check(f'level {lvl}: ODDISH evolves to {want}', got == g.const16(want) and r['level'] == lvl and g.rd('wPartyCount') == 2,
              f'got {got:#x} lv {r["level"]} count {g.rd("wPartyCount")} {t[-100:]}')
    # a level branch: KADABRA's row patched to come from ODDISH (ODDISH -> GLOOM 21 or -> ALAKAZAM 40)
    got = set()
    for i in range(8):
        g = new([('RATTATA', 45, None, ['TACKLE']), ('PIDGEY', 5, None, ['TACKLE'])], pool='ODDISH')
        g.seed(0x1234 + 977 * i)
        rom = g.rom(); a = g.rom_addr('WonderTradeLevelEvos')
        kad = g.const16('KADABRA'); odd = g.const16('ODDISH')
        while True:
            frm = rom[a] | rom[a + 1] << 8
            if frm == 0:
                raise RuntimeError('KADABRA row not found')
            if frm == kad:
                g.poke_rom(a, [odd & 0xff, odd >> 8]); break
            a += 5
        run_trade(g)
        got.add(party_index(g, received(g)['slot']))
    check('a level branch: both branches come up', got == {g.const16('VILEPLUME'), g.const16('ALAKAZAM')}, [hex(x) for x in got])


def case_trade_details():
    g = new([('RATTATA', 20, 'LEFTOVERS', ['TACKLE']), ('PIDGEY', 5, None, ['TACKLE'])], pool='ABRA')
    leftovers_before = item_count(g, 'LEFTOVERS')
    t = run_trade(g)
    r = received(g)
    check('the confirmation names the held item', 'and its' in t and 'Leftovers' in t, t[:200])
    check('the sent Pokémon (and its item) is gone; the new one is last', g.rd('wPartyCount') == 2 and
          party_index(g, 0) == g.const16('PIDGEY') and item_count(g, 'LEFTOVERS') == leftovers_before)
    girl = OT_NAMES.index(r['ot']) >= 8 if r['ot'] in OT_NAMES else None
    caught_girl = bool(r['caught'][0] & 0x80)
    check('OT name from the list; caught data gender matches it', r['ot'] in OT_NAMES and girl == caught_girl,
          f'{r["ot"]} caught {r["caught"]}')
    check('stats computed (HP = max HP > 0), DVs not shiny, an OT ID', r['hp'] == r['maxhp'] and r['maxhp'] != [0, 0]
          and r['dvs'][1] != 0xff, r)
    check('trade text shown, then the OT line', 'traded' in t.lower() and 'It came from' in t, t[-200:])


def case_full_party():
    party = [('RATTATA', 20, None, ['TACKLE']), ('PIDGEY', 5, None, ['TACKLE']), ('SPEAROW', 5, None, ['PECK']),
             ('EKANS', 5, None, ['WRAP']), ('SANDSHREW', 5, None, ['SCRATCH']), ('ZUBAT', 5, None, ['LEECH_LIFE'])]
    g = new(party, pool='SKARMORY')
    run_trade(g)
    got = [party_index(g, i) for i in range(6)]
    check('full party of distinct species: the new 8-bit ID allocates', g.rd('wPartyCount') == 6 and
          got[5] == g.const16('SKARMORY') and g.const16('RATTATA') not in got, [hex(x) for x in got])


def case_refusals():
    g = new([('RATTATA', 20, None, ['TACKLE'])])
    t = run_trade(g)
    check('the last Pokémon is refused', 'last' in t and g.rd('wPartyCount') == 1, t[-120:])
    g = new([('RATTATA', 20, None, ['TACKLE']), ('PIDGEY', 5, None, ['TACKLE'])])
    g.wr('wPartySpecies', EGG)  # slot 1 shows as an Egg in the menu
    t = run_trade(g)
    check('an Egg is refused', 'Egg' in t and g.rd('wPartyCount') == 2, t[-120:])
    g = new([('RATTATA', 20, None, ['TACKLE']), ('PIDGEY', 5, None, ['TACKLE'])], nuzlocke=True)
    t = run_trade(g)
    check('Nuzlocke mode: refused', 'Nuzlocke' in t and g.rd('wPartyCount') == 2 and party_index(g, 0) == g.const16('RATTATA'), t[-120:])
    g = new([('RATTATA', 20, None, ['TACKLE']), ('PIDGEY', 5, None, ['TACKLE'])])
    t = run_trade(g, presses=['B'] * 12)  # B through the text: No at the first question
    check('answering No: nothing happens', g.rd('wPartyCount') == 2 and party_index(g, 0) == g.const16('RATTATA'), t[-120:])


def case_rates():
    g = new([('RATTATA', 20, None, ['TACKLE']), ('PIDGEY', 5, None, ['TACKLE'])])
    # patch out the farcall to WonderTradeDoTrade inside WonderTradeExecute
    start = g.rom_addr('WonderTradeExecute')
    b, a = g.sym['WonderTradeDoTrade']
    rom = g.rom()
    pat = [b, a & 0xff, a >> 8]
    for i in range(start, start + 300):
        if list(rom[i + 1:i + 4]) == pat:
            g.poke_rom(i, [0] * 4)  # rst FarCall / db BANK / dw addr
            break
    else:
        raise RuntimeError('farcall not found')
    g.wr('wCurPartyMon', 0)
    eb, ea = g.sym['WonderTradeExecute']
    n, hidden, items, shiny, dvsum, girls = 200, 0, 0, 0, 0, 0
    for i in range(n):
        g.run_script(f'\tdb callasm_command\n\tdb {eb}\n\tdw {ea}\n\tend')
        g.frames(3)
        d = g.rd('wWonderTradeDVs', 2)
        shiny += d[1] == 0xff
        dvsum += sum((x >> 4) + (x & 15) for x in d)
        hidden += g.rd('wWonderTradeAbility') == 3
        items += g.rd('wWonderTradeItem', 2) != [0, 0] and list(g.rd('wWonderTradeItem', 2)) != [0, 0]
        girls += g.rd('wWonderTradeDialog') != 0
    avg = dvsum / (4 * n)
    check('DVs: never shiny, above average (mean > 8.5; one roll is 7.5)', shiny == 0 and avg > 8.5, f'mean {avg:.2f}')
    check('hidden ability about 1 in 10', 8 <= hidden <= 36, f'{hidden}/{n}')
    check('held item about 1 in 4', 25 <= items <= 75, f'{items}/{n}')
    check('girl OT about half', 60 <= girls <= 140, f'{girls}/{n}')


def case_npc_talk():
    """Each Center's NPC starts the Wonder Trade (warp next to it, face it, press A)."""
    for mapc, x, y in (('GOLDENROD_POKECENTER_1F', 2, 6), ('CELADON_POKECENTER_1F', 2, 6), ('SLATEPORT_POKECENTER', 2, 5)):
        g = new([('RATTATA', 20, None, ['TACKLE']), ('PIDGEY', 5, None, ['TACKLE'])])
        g.run_script(f'\tsetevent EVENT_TRAVEL_PROF_CALLED\n\twarp {mapc}, {x}, {y}\n\tend')
        g.frames(300)
        g.press('L', hold=3, after=30)
        g.press('A', after=90)
        t = ' '.join(g.screen_text().split())
        check(f'{mapc}: talking to the NPC starts the Wonder Trade', 'Wonder Trade' in t, t[-80:])


def main():
    case_pool()
    case_rates()
    case_refusals()
    case_evolve()
    case_trade_details()
    case_full_party()
    case_npc_talk()
    bad = [n for n, ok in RESULTS if not ok]
    print(f'{len(RESULTS) - len(bad)}/{len(RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
