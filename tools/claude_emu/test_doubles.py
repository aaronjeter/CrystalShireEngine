"""Double battle tests (phase 2).

Each case starts a double battle against a doubles_trainer party (written by the harness, as
battle_test.py does for its singles corpus) and plays it to the end with the battle test's
driver: P1's and P2's battle menus each take an action, ('move', n, target) picks the target
in the placeholder target menu (0 = E1, 1 = E2), ('back',) presses B on P2's menu. It checks
the four slots at the first battle menu (when the case lists `expect`), the party/slot check
at every menu, the result, and text that must appear.

    python3 test_doubles.py ROM.gbc ROM.sym STATE [case ...] [--shot DIR] [--records OUT.json]
    (needs ROM.map next to the .sym; BT_TRACE=1 prints every screen)
"""
import json
import os
import sys
import battle_test as bt

P1, P2, E1, E2 = range(4)
WIN, LOSE = 0, 1


class DoublesBattle(bt.Battle):
    def __init__(self, g, actions, on_first=None, force_switch=None):
        super().__init__(g, actions)
        self.on_first, self.force_switch, self.patched = on_first, force_switch, None

    def at_menu(self):
        if not self.records and self.on_first:
            self.on_first()
        if self.force_switch and len(self.records) == 0:
            self.patch_ai_switch(self.force_switch)
        elif self.patched and len(self.records) == 2:  # turn 2: the AI decides on its own again
            self.g.poke_rom(*self.patched)
            self.patched = None
        super().at_menu()

    def patch_ai_switch(self, mon):
        """AI_SwitchOrTryItem (in memory): E1 switches to party mon `mon` (1-based), E2 does nothing."""
        g = self.g
        addr = g.rom_addr('AI_SwitchOrTryItem')
        lohi = lambda n: [g.sym[n][1] & 0xFF, g.sym[n][1] >> 8]
        code = ([0xFA] + lohi('wAreaSlots') [:0] + [(g.sym['wAreaSlots'][1] + 1) & 0xFF, (g.sym['wAreaSlots'][1] + 1) >> 8]
                + [0xFE, E1, 0x20, 0x08, 0x3E, mon, 0xEA] + lohi('wEnemySwitchMonIndex')
                + [0xC3] + lohi('AI_TrySwitch') + [0xA7, 0xC9])
        assert g.sym['AI_TrySwitch'][0] == g.sym['AI_SwitchOrTryItem'][0]
        self.patched = (addr, list(g.rom()[addr:addr + len(code)]))
        g.poke_rom(addr, code)


def slot_reader(g):
    by, size = bt.swap_layout(g.rom_path, g.sym)
    base = g.sym['wBattlerSlots'][1]
    bank = g.sym['wBattlerSlots'][0]
    A = lambda s: g.sym[s][1]

    def rd(slot, label, n=1):
        w = g.wram_full()
        i = bank * 0x1000 + base - 0xD000 + slot * size + by[A(label)]
        return list(w[i:i + n])
    return rd


CASES = {
    # 2v2 with a bench on both sides, played to a win: an enemy slot is refilled from the
    # bench (Onix), then the battle goes on 2v1; targets alternate
    'doubles_win': dict(
        cls='COOLTRAINERM',
        party=[('MACHAMP', 60, None, ['KARATE_CHOP', 'ROCK_SLIDE']), ('PIKACHU', 60, None, ['THUNDERBOLT']),
               ('GOLEM', 60, None, ['ROCK_THROW'])],
        trainer=[(30, 'SNORLAX', None, ['TACKLE']), (30, 'GYARADOS', None, ['BITE']),
                 (30, 'ONIX', None, ['TACKLE'])],
        actions=[('move', 0, 0), ('move', 0, 1)] * 20,
        expect=dict(empty=0, field=(0b011, 0b011), p2=1, e2=1),
        result=WIN, log=['sent out', 'Onix']),
    # 1v2: the player's second mon has fainted, so P2 stays empty; one mon beats two
    'doubles_1v2': dict(
        cls='COOLTRAINERM',
        party=[('MACHAMP', 70, None, ['KARATE_CHOP']), ('PIKACHU', 50, None, ['THUNDERBOLT'])], faint=[1],
        trainer=[(30, 'SNORLAX', None, ['TACKLE']), (30, 'GYARADOS', None, ['BITE'])],
        actions=[('move', 0, 0)] * 20,
        expect=dict(empty=1 << P2, field=(0b001, 0b011), p2=None, e2=1),
        result=WIN),
    # the player loses: both player slots are refilled from the bench first
    'doubles_lose': dict(
        cls='COOLTRAINERM',
        party=[('RATTATA', 10, None, ['TACKLE']), ('PIDGEY', 10, None, ['GUST']),
               ('CATERPIE', 10, None, ['TACKLE']), ('WEEDLE', 10, None, ['POISON_STING'])],
        trainer=[(60, 'ARCANINE', None, ['FLAMETHROWER']), (60, 'GYARADOS', None, ['SURF'])],
        actions=[('move', 0, 1)] * 20,
        result=LOSE),
    # the battle menu: a Potion on P2's mon from P1's menu, B on P2's menu back to P1,
    # P2 switching to the bench, a target change, end-of-turn effects (Leftovers, poison, sand)
    'doubles_menu': dict(
        cls='COOLTRAINERM',
        party=[('TYRANITAR', 55, 'LEFTOVERS', ['SANDSTORM', 'CRUNCH']), ('PIKACHU', 50, None, ['THUNDERBOLT']),
               ('GOLEM', 50, None, ['ROCK_THROW'])],
        items=[('POTION', 3)],
        trainer=[(40, 'MUK', 'LEFTOVERS', ['TOXIC', 'SLUDGE_BOMB']), (40, 'GYARADOS', None, ['BITE']),
                 (40, 'ONIX', None, ['TACKLE'])],
        actions=[('move', 0, 0), ('move', 0, 1),            # Sandstorm; Thunderbolt on Gyarados
                 ('item', 'POTION', 1), ('move', 0, 0),     # Potion on Pikachu (P2) from P1's menu
                 ('move', 1, 0), ('back',), ('move', 1, 1),  # P1 Crunch on E1, B on P2: P1 again (E2)
                 ('switch', 2)]                              # P2 switches to Golem
                + [('move', 1, 0), ('move', 0, 1)] * 20,
        result=WIN, log=['Sandstorm', 'recovered 20', 'Golem']),
    # the AI switching (SCHOOLBOY: SWITCH_OFTEN) against bad matchups, with a bench to switch to;
    # Quick Attack moves before faster mons (priority)
    'doubles_ai_switch': dict(
        cls='SCHOOLBOY',
        party=[('SNORLAX', 100, None, ['DEFENSE_CURL', 'BODY_SLAM']), ('RAICHU', 100, None, ['THUNDERBOLT', 'QUICK_ATTACK'])],
        trainer=[(45, 'MAGNETON', None, ['THUNDERBOLT']), (45, 'CHARIZARD', None, ['FLAMETHROWER']),
                 (45, 'GYARADOS', None, ['SURF']), (45, 'STARMIE', None, ['SURF'])],
        actions=[('move', 0, 0), ('move', 1, 1)] * 4 + [('move', 1, 0), ('move', 0, 1)] * 30,
        force_switch=3,  # turn 1: E1's AI switches to party mon 3 (Gyarados)
        result=WIN, log=['withdrew', 'Gyarados']),
    # the leads' entrance abilities run in Speed order: the fast E1's Drought, then the slow
    # P1's Drizzle, so it rains at the first menu (whatever the overworld weather)
    'doubles_entrance': dict(
        cls='COOLTRAINERM',
        party=[('NINETALES', 30, None, ['EMBER']), ('MACHAMP', 70, None, ['KARATE_CHOP'])],
        trainer=[(60, 'JOLTEON', None, ['TACKLE']), (30, 'SNORLAX', None, ['TACKLE'])],
        abilities={'NINETALES': 'ABILITY_DRIZZLE', 'JOLTEON': 'ABILITY_DROUGHT', 'MACHAMP': 'NO_ABILITY',
                   'SNORLAX': 'NO_ABILITY'},
        actions=[('move', 0, 0)] * 30,
        weather='WEATHER_RAIN', result=WIN, log=['sunlight', 'to rain']),
    # trainer items (BLAINE: Full Heal, Max Potion...): one item per side per turn
    'doubles_ai_items': dict(
        cls='BLAINE',
        party=[('MACHAMP', 60, None, ['KARATE_CHOP']), ('BLASTOISE', 60, None, ['SURF'])],
        trainer=[(45, 'MAGMAR', None, ['FIRE_PUNCH']), (48, 'RAPIDASH', None, ['STOMP']),
                 (50, 'ARCANINE', None, ['FLAMETHROWER'])],
        actions=[('move', 0, 1), ('move', 0, 1)] * 30,
        result=WIN),
}


def run_case(rom, sym, state, name, shot_dir=None):
    c = CASES[name]
    g = bt.Game(rom, sym, state)
    g.rom_path = rom
    g.seed()
    if c.get('abilities'):  # all three ability slots (a trainer mon's slot can be any of them)
        names = [bt.re.match(r'\tabilities (\w+),', l).group(1)
                 for l in open(f'{bt.CSE}/data/abilities/species_abilities.asm') if l.startswith('\tabilities ')]
        base = g.rom_addr('SpeciesAbilities1')
        for sp, ab in c['abilities'].items():
            g.poke_rom(base + 3 * names.index(sp), [g.const(ab)] * 3)
    g.clear_bag()
    g.set_party(c['party'], c.get('items', ()))
    psize = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    for i in c.get('faint', ()):
        g.wr16(f'wPartyMon1HP+{i * psize}', 0)
    g.seed()
    g.set_trainer(c['cls'], 'Doubles', c['trainer'], doubles=True)
    g.seed()
    g.start_battle(c['cls'], 0x01 | bt.SCENE_OFF)
    problems = []
    rd = slot_reader(g)
    ex = c.get('expect')

    def first():
        def want(what, got, exp):
            if got != exp:
                problems.append(f'{what}: {got} (expected {exp})')
        want('wDoubleBattle', bool(g.rd('wDoubleBattle')), True)
        if 'weather' in c:
            want('wBattleWeather', g.rd('wBattleWeather'), g.const(c['weather']))
        if shot_dir:  # the battle test runs with rendering off
            bt.LIB.GB_set_rendering_disabled(g.gb, False)
            g.frames(2)
            bt.LIB.GB_set_rendering_disabled(g.gb, True)
            g.shot(os.path.join(shot_dir, f'{name}.png'))
        if not ex:
            return
        want('wAreaSlots', g.rd('wAreaSlots', 2), [P1, E1])
        want('wEmptyBattlerSlots', g.rd('wEmptyBattlerSlots'), ex['empty'])
        want('wFieldMons', tuple(g.rd('wFieldMons', 2)), ex['field'])
        want('P1 party index', g.rd('wCurBattleMon'), 0)
        want('E1 party index', g.rd('wCurOTMon'), 0)
        want('P1 species', g.rd('wBattleMonSpecies'), g.rd('wPartySpecies'))
        want('E1 species', g.rd('wEnemyMonSpecies'), g.rd('wOTPartySpecies'))
        want('E1 participants', g.rd('wBattleParticipantsNotFainted'), ex['field'][0])
        if ex['p2'] is not None:
            want('P2 party index', rd(P2, 'wCurBattleMon')[0], ex['p2'])
            want('P2 species', rd(P2, 'wBattleMon')[0], g.rd(f'wPartySpecies+{ex["p2"]}'))
            hp_off = g.sym['wBattleMonHP'][1] - g.sym['wBattleMon'][1]
            want('P2 HP', rd(P2, 'wBattleMon', hp_off + 2)[hp_off:], g.rd(f'wPartyMon1HP+{ex["p2"] * psize}', 2))
        want('E2 party index', rd(E2, 'wCurOTMon')[0], ex['e2'])
        want('E2 species', rd(E2, 'wEnemyMon')[0], g.rd(f'wOTPartySpecies+{ex["e2"]}'))
        want('E2 participants', rd(E2, 'wBattleParticipantsNotFainted', 2), [ex['field'][0]] * 2)
        want('E2 switching', rd(E2, 'wEnemyIsSwitching')[0], 0)
        want('E2 item state', rd(E2, 'wEnemyItemState')[0], 0xFF)

    b = DoublesBattle(g, list(c['actions']), first, c.get('force_switch'))
    recs = b.run()
    end = recs[-1]
    if (end.get('result', 0xFF) & 0xF) != c['result']:
        problems.append(f'result {end.get("result")} (expected {c["result"]})')
    text = ' '.join(' '.join(r.get('log') or []) for r in recs)
    for w in c.get('log', ()):
        if w not in text:
            problems.append(f'text "{w}" never appeared')
    if c['result'] == WIN:
        hp = [g.rd16(f'wOTPartyMon1HP+{i * psize}') for i in range(g.rd('wOTPartyCount'))]
        if any(hp):
            problems.append(f'enemy party HP after a win: {hp}')
    problems += bt.check_slots(recs, rom, g.sym)
    return problems, recs


def main():
    args = sys.argv[1:]
    opts = {}
    for k in ('--shot', '--records'):
        if k in args:
            i = args.index(k)
            opts[k] = args[i + 1]
            del args[i:i + 2]
    rom, sym, state = args[:3]
    names = args[3:] or list(CASES)
    bad, out = 0, {}
    for n in names:
        try:
            problems, recs = run_case(rom, sym, state, n, opts.get('--shot'))
            out[n] = recs
        except Exception as e:
            problems = [f'{type(e).__name__}: {e}']
        print(('PASS ' if not problems else 'FAIL ') + n, flush=True)
        for p in problems:
            print('   ', p)
        bad += bool(problems)
    if '--records' in opts:
        json.dump(out, open(opts['--records'], 'w'))
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
