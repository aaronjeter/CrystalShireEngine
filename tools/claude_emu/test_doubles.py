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
    def __init__(self, g, actions, on_first=None, force_switch=None, force_target=None, singles=False):
        super().__init__(g, actions)
        self.on_first, self.force_switch, self.patched = on_first, force_switch, None
        self.singles = singles
        self.force_target = force_target or {}

    text_rows = slice(13, 18)  # the 5-row text box (row 12 is part of the field)

    shots = None  # --shots DIR: a screenshot at every battle menu (rendering on for 2 frames)

    def snap(self, tag):
        if not self.shots:
            return
        g = self.g
        bt.LIB.GB_set_rendering_disabled(g.gb, False)
        g.frames(2)
        bt.LIB.GB_set_rendering_disabled(g.gb, True)
        g.shot(os.path.join(self.shots, f'{len(os.listdir(self.shots)):03d}_{tag}.png'), scale=1)

    snapped = ()

    def note(self, t):
        super().note(t)
        msg = ' '.join(x.strip() for x in t[13:18] if x.strip())
        for key in ('defeated', 'fainted', 'come back', 'Go!', 'sent out', 'out of useable', 'out of usable'):
            if (self.shots and key in msg and msg.endswith(('!', '.')) and len(msg) > 8
                    and (key, msg) not in self.snapped):
                self.snapped = self.snapped + ((key, msg),)
                self.snap(key.replace(' ', '_').replace('!', ''))

    def at_menu(self):
        self.snap(f'menu{len(self.records)}')
        if not self.records and self.on_first:
            self.on_first()
        mon, at = self.force_switch if isinstance(self.force_switch, tuple) else (self.force_switch, 0)
        if self.force_switch and len(self.records) == at:  # (mon, record index): switch on that turn
            self.patch_ai_switch(mon)
        elif self.patched and len(self.records) == at + (1 if self.singles else 2):  # next turn: the AI decides on its own again
            self.g.poke_rom(*self.patched)
            self.patched = None
        if len(self.records) in self.force_target:  # pin an enemy's target (it's loaded opposite the chooser)
            eslot, pslot = self.force_target[len(self.records)]
            assert self.g.rd('wAreaSlots', 2)[1] == eslot, 'force_target: that enemy is not loaded'
            self.g.wr('wEnemyBattlerLinks', 1 << pslot)
        super().at_menu()

    def patch_ai_switch(self, mon):
        """AI_SwitchOrTryItem (in memory): E1 switches to party mon `mon` (1-based), E2 does nothing."""
        g = self.g
        addr = g.rom_addr('AI_SwitchOrTryItem')
        lohi = lambda n: [g.sym[n][1] & 0xFF, g.sym[n][1] >> 8]
        code = ([0xFA] + lohi('wAreaSlots') [:0] + [(g.sym['wAreaSlots'][1] + 1) & 0xFF, (g.sym['wAreaSlots'][1] + 1) >> 8]
                + [0xFE, E1, 0x20, 0x08, 0x3E, mon, 0xEA] + lohi('wEnemySwitchMonIndex')
                + [0xC3] + lohi('AI_TrySwitch') + [0xA7, 0xC9])
        if self.singles:  # a singles battle: the enemy always switches
            code = [0x3E, mon, 0xEA] + lohi('wEnemySwitchMonIndex') + [0xC3] + lohi('AI_TrySwitch')
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


class View:
    """Reads battler variables from a doubles record: the live variables for a loaded slot,
    wBattlerSlots for a stored one."""
    def __init__(self, g):
        self.sym = g.sym
        self.g = g  # the game after the battle (party structs, wKnockedOffMons in singles)
        self.by, self.size = bt.swap_layout(g.rom_path, g.sym)
        self.keys = sorted(self.by)

    def A(self, label):
        return self.sym[label][1]

    def live(self, rec, label, n=1):
        a = self.A(label)
        for lo, hi in bt.REGIONS + bt.DOUBLES_REGIONS:
            if self.A(lo) <= a < self.A(hi):
                return rec[lo][a - self.A(lo):][:n]
        raise KeyError(label)

    def areas(self, rec):
        return self.live(rec, 'wAreaSlots', 2)

    def empty(self, rec, slot):
        return bool(self.live(rec, 'wEmptyBattlerSlots')[0] >> slot & 1)

    def get(self, rec, slot, plabel, elabel=None, n=1):
        """Slot's variable: plabel for the player's slots, elabel (default: plabel with
        Player/Battle swapped for Enemy) for the enemy's."""
        side = slot >> 1
        label = plabel if side == 0 else (elabel or plabel.replace('wPlayer', 'wEnemy').replace('wBattleMon', 'wEnemyMon'))
        if self.areas(rec)[side] == slot:
            return self.live(rec, label, n)
        a = self.A(label)
        k = max(k for k in self.keys if k <= a)
        o = slot * self.size + self.by[k] + a - k
        return rec['wBattlerSlots'][o:o + n]

    def hp(self, rec, slot):
        h = self.get(rec, slot, 'wBattleMonHP', n=2)
        return h[0] << 8 | h[1]

    def party_index(self, rec, slot):
        if slot >> 1 == 0 and self.areas(rec)[0] == slot:
            return rec['wCurBattleMon']
        return self.get(rec, slot, 'wCurBattleMon', 'wCurOTMon')[0]

    def stat_levels(self, rec, slot):  # attack, defense, speed, sp.atk, sp.def, acc, eva (7 = normal)
        return self.get(rec, slot, 'wPlayerStatLevels', n=7)


def turns(recs, view):
    """Group the menu records by turn: a new turn starts when the slot choosing is not after
    the previous record's (P1, P2 | P1, P2...). Returns [(first record index, text of the
    turn)]: a turn's text is the logs after its first menu up to the next turn's first menu."""
    starts, prev = [], None
    for i, r in enumerate(recs):
        if 'end' in r:
            break
        cur = view.areas(r)[0]
        if prev is None or cur <= prev:
            starts.append(i)
        prev = cur
    out = []
    for n, i in enumerate(starts):
        j = starts[n + 1] if n + 1 < len(starts) else len(recs) - 1
        out.append((i, ' | '.join(' | '.join(recs[k].get('log') or []) for k in range(i + 1, j + 1))))
    return out


def ratio_check(what, a, b, lo, hi):
    if not b or not lo <= a / b <= hi:
        return [f'{what}: {a}/{b} not within {lo}..{hi}']
    return []


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
    # Oct 27, 2026: a Potion on the partner reaches its battle copy from either menu (P2's menu on
    # P1, then P1's menu on P2). SwapInPlayerPartyMon returned a clobbered party index, so the heal
    # went to the party struct only and the next party update undid it; the slot check can't see it
    'doubles_potion_partner': dict(
        cls='COOLTRAINERM',
        party=[('MACHAMP', 60, None, ['SPLASH', 'KARATE_CHOP']), ('PIKACHU', 50, None, ['SPLASH', 'THUNDERSHOCK'])],
        items=[('POTION', 3)],
        trainer=[(5, 'MAGIKARP', None, ['SPLASH']), (5, 'MAGIKARP', None, ['SPLASH'])],
        abilities={'MACHAMP': 'NO_ABILITY', 'PIKACHU': 'NO_ABILITY', 'MAGIKARP': 'NO_ABILITY'},
        hp={0: 40, 1: 40},
        actions=[('move', 0, 0), ('item', 'POTION', 0),     # P2's menu: Potion on Machamp (P1)
                 ('item', 'POTION', 1), ('move', 0, 0)]     # P1's menu: Potion on Pikachu (P2)
                + [('move', 1, 0), ('move', 1, 1)] * 10,
        check=lambda recs, v: [x for x in (
            v.hp(recs[2], P1) != 60 and f'P1 HP after the Potion from P2\'s menu: {v.hp(recs[2], P1)} (expected 60)',
            v.hp(recs[4], P2) != 60 and f'P2 HP after the Potion from P1\'s menu: {v.hp(recs[4], P2)} (expected 60)') if x],
        result=WIN),
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
    # phase 3: Surf hits both foes at x0.75, then the one left at full damage (no damage rolls,
    # no crits); "used Surf" and the PP once per turn
    'doubles_spread': dict(
        cls='COOLTRAINERM',
        party=[('LAPRAS', 60, None, ['SURF', 'ICE_BEAM']), ('MAGIKARP', 60, None, ['SPLASH'])],
        trainer=[(8, 'SNORLAX', None, ['SPLASH']), (50, 'CHANSEY', None, ['SPLASH'])],
        abilities={'LAPRAS': 'NO_ABILITY', 'MAGIKARP': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'CHANSEY': 'NO_ABILITY'},
        fixed_damage=True,
        actions=[('move', 0), ('move', 0)] * 2 + [('move', 1), ('move', 0)] * 40,
        check=lambda recs, v: check_spread(recs, v),
        result=WIN),
    # phase 3: Earthquake and Magnitude against a Flying foe (the first pass misses, the second
    # hits; Magnitude rolls once), Growl on both foes twice, Explosion knocking out both
    'doubles_spread_misc': dict(
        cls='COOLTRAINERM',
        party=[('GOLEM', 50, None, ['EARTHQUAKE', 'MAGNITUDE', 'ROCK_SLIDE']),
               ('NIDOKING', 50, None, ['GROWL', 'EXPLOSION'])],
        trainer=[(40, 'PIDGEOT', None, ['SPLASH']), (45, 'SNORLAX', None, ['SPLASH'])],
        abilities={'GOLEM': 'NO_ABILITY', 'NIDOKING': 'NO_ABILITY', 'PIDGEOT': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY'},
        actions=[('move', 0), ('move', 0), ('move', 1), ('move', 0), ('move', 2), ('move', 1)] + [('move', 2)] * 40,
        check=lambda recs, v: check_spread_misc(recs, v),
        result=WIN),
    # phase 3B: Leech Seed heals the seeder's slot (also after the seeder left); Wrap ends when
    # the trapper leaves
    'doubles_leech_wrap': dict(
        cls='COOLTRAINERM',
        party=[('VENUSAUR', 50, None, ['LEECH_SEED', 'GROWTH', 'RAZOR_LEAF']), ('ARBOK', 50, None, ['WRAP', 'BITE']),
               ('SNORLAX', 50, None, ['BODY_SLAM'])],
        hp={0: 60},
        trainer=[(45, 'SNORLAX', None, ['SPLASH']), (45, 'SNORLAX', None, ['SPLASH'])],
        abilities={'VENUSAUR': 'NO_ABILITY', 'ARBOK': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY'},
        actions=[('move', 0, 1), ('move', 0, 0),   # P1 seeds E2, P2 wraps E1
                 ('move', 1), ('switch', 2),       # P2 (the trapper) leaves
                 ('switch', 1), ('move', 0, 1)]    # P1 (the seeder) leaves
                + [('move', 1, 0), ('move', 0, 0)] * 40,
        check=lambda recs, v: check_leech_wrap(recs, v),
        result=WIN),
    # phase 3B: in a 1v2, Counter and Bide hit the foe that last hit the user (not the one
    # opposite it)
    'doubles_counter_bide': dict(
        cls='COOLTRAINERM',
        party=[('MACHAMP', 50, None, ['COUNTER', 'BIDE', 'KARATE_CHOP']), ('PIKACHU', 20, None, ['THUNDERSHOCK'])],
        faint=[1],
        trainer=[(30, 'RATTATA', None, ['SPLASH']), (45, 'SNORLAX', None, ['TACKLE'])],
        abilities={'MACHAMP': 'NO_ABILITY', 'RATTATA': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY'},
        actions=[('move', 0), ('move', 1)] + [('move', 2, 0)] * 40,  # Bide goes on by itself (whatever is chosen)
        check=lambda recs, v: check_counter_bide(recs, v),
        result=WIN),
    # phase 3B: Lock-On helps only its user (the faster partner hits the target first and
    # doesn't use it up); Mean Look ends when its user leaves
    'doubles_lockon_meanlook': dict(
        cls='COOLTRAINERM',
        party=[('MAGNETON', 50, None, ['LOCK_ON', 'ZAP_CANNON']), ('PERSIAN', 50, None, ['MEAN_LOOK', 'SCRATCH']),
               ('RATTATA', 30, None, ['TACKLE'])],
        trainer=[(50, 'SNORLAX', None, ['SPLASH']), (50, 'SNORLAX', None, ['SPLASH'])],
        abilities={'MAGNETON': 'NO_ABILITY', 'PERSIAN': 'NO_ABILITY', 'RATTATA': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY'},
        actions=[('move', 0, 1), ('move', 0, 0),   # Lock-On on E2, Mean Look on E1
                 ('move', 1, 1), ('move', 1, 1),   # Persian scratches E2 first, then Zap Cannon
                 ('move', 1, 0), ('switch', 2)]    # Persian leaves
                + [('move', 1, 0), ('move', 0, 0)] * 40,
        check=lambda recs, v: check_lockon_meanlook(recs, v),
        result=WIN),
    # phase 3B: Future Sight hits the slot it was aimed at (E2), not the foe opposite (E1)
    'doubles_future_sight': dict(
        cls='COOLTRAINERM',
        party=[('ALAKAZAM', 50, None, ['FUTURE_SIGHT', 'SPLASH', 'PSYCHIC_M']), ('MAGIKARP', 30, None, ['SPLASH'])],
        trainer=[(45, 'SNORLAX', None, ['SPLASH']), (45, 'SNORLAX', None, ['SPLASH'])],
        abilities={'ALAKAZAM': 'NO_ABILITY', 'MAGIKARP': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY'},
        actions=[('move', 0, 1), ('move', 0)] + [('move', 1), ('move', 0)] * 3 + [('move', 2, 0), ('move', 0)] * 40,
        check=lambda recs, v: check_future_sight(recs, v),
        result=WIN),
    # phase 3C: Haze resets all four battlers' stat levels, Perish Song counts down on all four
    # (all four faint together; both sides send in their bench)
    'doubles_haze_perish': dict(
        cls='COOLTRAINERM',
        party=[('WEEZING', 50, None, ['HAZE', 'GROWL']), ('MISDREAVUS', 50, None, ['GROWTH', 'PERISH_SONG']),
               ('SNORLAX', 60, None, ['BODY_SLAM'])],
        trainer=[(45, 'SNORLAX', None, ['SPLASH']), (45, 'SNORLAX', None, ['SPLASH']), (20, 'RATTATA', None, ['SPLASH'])],
        abilities={'WEEZING': 'NO_ABILITY', 'MISDREAVUS': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'RATTATA': 'NO_ABILITY'},
        actions=[('move', 1), ('move', 0), ('move', 0), ('move', 1)] + [('move', 1), ('move', 0)] * 3 + [('move', 0, 0)] * 40,
        check=lambda recs, v: check_haze_perish(recs, v),
        result=WIN),
    # phase 3C: Roar drags E1 out for the bench mon (not E2's), Baton Pass passes Agility to
    # the bench mon in P2's slot, Pursuit (E2, aimed at P2) hits P2 as it switches out
    'doubles_roar_baton_pursuit': dict(
        cls='COOLTRAINERM',
        party=[('ARCANINE', 50, None, ['ROAR', 'FLAMETHROWER']), ('JOLTEON', 50, None, ['AGILITY', 'BATON_PASS', 'THUNDERBOLT']),
               ('SNORLAX', 50, None, ['BODY_SLAM']), ('RAICHU', 50, None, ['THUNDERBOLT'])],
        trainer=[(50, 'SNORLAX', None, ['SPLASH']), (50, 'TYRANITAR', None, ['PURSUIT']), (30, 'RATTATA', None, ['SPLASH'])],
        abilities={'ARCANINE': 'NO_ABILITY', 'JOLTEON': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'RAICHU': 'NO_ABILITY',
                   'TYRANITAR': 'NO_ABILITY', 'RATTATA': 'NO_ABILITY'},
        actions=[('move', 0, 0), ('move', 0),        # Roar on E1, Agility
                 ('move', 1, 1), ('move', 1),        # Flamethrower on E2, Baton Pass (to Snorlax)
                 ('move', 1, 1), ('switch', 3)]      # P2 (Snorlax) switches to Raichu: Pursuit
                + [('move', 1, 1), ('move', 0, 1)] * 40,
        force_target={5: (E2, P2)},  # turn 3, P2's menu: Tyranitar's Pursuit aims at P2 (phase 6's AI chooses freely)
        check=lambda recs, v: check_roar_baton_pursuit(recs, v),
        result=WIN),
    # phase 3C: Thief, Destiny Bond (E2 knocks P2 out and faints), Encore, Mirror Move, Beat Up
    'doubles_misc_moves': dict(
        cls='COOLTRAINERM',
        party=[('SNEASEL', 50, None, ['THIEF', 'ENCORE', 'MIRROR_MOVE', 'BEAT_UP']),
               ('ELECTRODE', 30, None, ['DESTINY_BOND']), ('MACHAMP', 60, None, ['KARATE_CHOP', 'LEER'])],
        trainer=[(55, 'SNORLAX', 'LEFTOVERS', ['TACKLE']), (50, 'MACHAMP', None, ['KARATE_CHOP'])],
        abilities={'SNEASEL': 'NO_ABILITY', 'ELECTRODE': 'NO_ABILITY', 'MACHAMP': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY'},
        actions=[('move', 0, 0), ('move', 0),        # Thief on E1, Destiny Bond
                 ('move', 1, 0), ('move', 1),        # Encore on E1 (Machamp, sent in for P2: Leer)
                 ('move', 2, 0), ('move', 1),        # Mirror Move (E1's Tackle)
                 ('move', 3, 0), ('move', 0, 0)] + [('move', 0, 0)] * 40,
        check=lambda recs, v: check_misc_moves(recs, v),
        result=WIN),
    # phase 3D: Intimidate (each foe) lowers both player battlers' Attack, at the start and
    # when a bench mon with it comes in
    'doubles_intimidate': dict(
        cls='COOLTRAINERM',
        party=[('MACHAMP', 60, None, ['KARATE_CHOP', 'LEER']), ('PIKACHU', 60, None, ['THUNDERBOLT'])],
        trainer=[(40, 'GYARADOS', None, ['SPLASH']), (5, 'RATTATA', None, ['SPLASH']), (40, 'ARCANINE', None, ['SPLASH'])],
        abilities={'GYARADOS': 'ABILITY_INTIMIDATE', 'ARCANINE': 'ABILITY_INTIMIDATE', 'MACHAMP': 'NO_ABILITY',
                   'PIKACHU': 'NO_ABILITY', 'RATTATA': 'NO_ABILITY'},
        actions=[('move', 1), ('move', 0, 1)] + [('move', 0, 0), ('move', 0, 0)] * 40,
        check=lambda recs, v: check_intimidate(recs, v),
        result=WIN),
    # phase 6 (doubles AI): a Ground move is never aimed at the Flying foe
    'doubles_ai_immune': dict(
        cls='COOLTRAINERM',
        party=[('PIDGEOT', 100, None, ['SPLASH', 'DRILL_PECK']), ('SNORLAX', 100, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(30, 'MAROWAK', None, ['BONE_CLUB']), (30, 'MAROWAK', None, ['BONE_CLUB'])],
        abilities={'PIDGEOT': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'MAROWAK': 'NO_ABILITY'},
        actions=[('move', 0), ('move', 0)] * 3 + [('move', 1, 0), ('move', 1, 0)] * 30,
        check=lambda recs, v: check_ai(recs, v, 3, e1=(0, P2), e2=(0, P2)),
        result=WIN),
    # phase 6: E1 goes for the foe it can knock out (P2, 1 HP); E2 then leaves P2 be (no overkill)
    'doubles_ai_ko': dict(
        cls='COOLTRAINERM',
        party=[('SNORLAX', 100, None, ['SPLASH', 'BODY_SLAM']), ('SNORLAX', 60, None, ['SPLASH'])],
        trainer=[(30, 'RATICATE', None, ['TACKLE']), (30, 'RATICATE', None, ['TACKLE'])],
        abilities={'SNORLAX': 'NO_ABILITY', 'RATICATE': 'NO_ABILITY'},
        hp={1: 1},
        fixed_damage=True,
        actions=[('move', 0), ('move', 0)] + [('move', 1, 0)] * 30,
        check=lambda recs, v: check_ai(recs, v, 1, e1=(0, P2), e2=(0, P1)),
        result=WIN),
    # phase 6: spread moves: Surf over Water Gun (both foes take damage); Rock Throw over
    # Earthquake, which can't hit the Flying foe
    'doubles_ai_spread': dict(
        cls='COOLTRAINERM',
        party=[('SNORLAX', 100, None, ['SPLASH', 'BODY_SLAM']), ('PIDGEOT', 100, None, ['SPLASH', 'DRILL_PECK'])],
        trainer=[(30, 'LAPRAS', None, ['WATER_GUN', 'SURF']), (30, 'GOLEM', None, ['EARTHQUAKE', 'ROCK_THROW'])],
        abilities={'PIDGEOT': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'LAPRAS': 'NO_ABILITY', 'GOLEM': 'NO_ABILITY'},
        actions=[('move', 0), ('move', 0)] * 3 + [('move', 1, 0), ('move', 1, 0)] * 30,
        check=lambda recs, v: check_ai(recs, v, 3, e1=(1, None), e2=(1, None)),
        result=WIN),
    # phase 6: a battler locked into a move keeps its target: Dig aimed at P2 (P1 is Flying)
    # comes up at P2
    'doubles_ai_locked': dict(
        cls='COOLTRAINERM',
        party=[('PIDGEOT', 100, None, ['SPLASH', 'DRILL_PECK']), ('SNORLAX', 100, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(30, 'MAROWAK', None, ['DIG']), (30, 'MAGIKARP', None, ['SPLASH'])],
        abilities={'PIDGEOT': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'MAROWAK': 'NO_ABILITY', 'MAGIKARP': 'NO_ABILITY'},
        actions=[('move', 0), ('move', 0)] * 4 + [('move', 1, 0), ('move', 1, 0)] * 30,
        check=lambda recs, v: check_ai_locked(recs, v),
        result=WIN),
}

LINK = dict(TARGET=0, SEEDED_BY=1, TRAPPED_BY=2, MEAN_LOOK_BY=3, ATTRACTED_TO=4, LOCKED_ON_TO=5, LAST_ATTACKER=6)


def link(v, r, slot, name):
    return v.get(r, slot, 'wPlayerBattlerLinks', n=7)[LINK[name]]


def want(p, what, got, exp):
    if got != exp:
        p.append(f'{what}: {got} (expected {exp})')


def ai_choice(v, r, slot):
    """(move slot, target slot) an enemy battler chose this turn (read at P1's menu)."""
    num = v.get(r, slot, 'wCurMoveNum', 'wCurEnemyMoveNum')[0]
    mask = link(v, r, slot, 'TARGET')
    return num, (mask.bit_length() - 1 if mask else None)


def check_ai(recs, v, n, e1=None, e2=None):
    """For the first n turns, each enemy's (move slot, target slot or None for any) choice."""
    p = []
    t = turns(recs, v)
    if len(t) < n:
        return [f'only {len(t)} turns']
    for k, (i, _) in enumerate(t[:n]):
        r = recs[i]
        for slot, exp in ((E1, e1), (E2, e2)):
            if exp is None or v.empty(r, slot):
                continue
            num, tgt = ai_choice(v, r, slot)
            if num != exp[0] or (exp[1] is not None and tgt != exp[1]):
                p.append(f'turn {k + 1}: {"E1" if slot == E1 else "E2"} chose move {num} at slot {tgt} (expected {exp})')
    return p


def check_ai_locked(recs, v):
    p = check_ai(recs, v, 4, e1=(0, P2))
    t = turns(recs, v)
    r0, r4 = recs[t[0][0]], recs[t[4][0]]
    want(p, 'P1 HP after 4 turns', v.hp(r4, P1), v.hp(r0, P1))
    if not v.hp(r4, P2) < v.hp(r0, P2):
        p.append(f'Dig never hit P2: {v.hp(r0, P2)} -> {v.hp(r4, P2)}')
    txt = ' '.join(x for _, x in t[:4])
    if "doesn't affect" in txt:
        p.append('a move had no effect in turns 1-4')
    return p


def check_leech_wrap(recs, v):
    t = turns(recs, v)
    p = []
    (i1, _), (i2, _), (i3, txt3) = t[:3]
    r1, r2, r3 = recs[i1], recs[i2], recs[i3]
    want(p, 'E2 seeded (turn 1)', v.get(r2, E2, 'wPlayerSubStatus4')[0] >> 7 & 1, 1)
    want(p, 'E2 seeded by', link(v, r2, E2, 'SEEDED_BY'), 1 << P1)
    if not v.get(r2, E1, 'wPlayerWrapCount')[0]:
        p.append('E1 not wrapped after turn 1')
    want(p, 'E1 trapped by', link(v, r2, E1, 'TRAPPED_BY'), 1 << P2)
    if not v.hp(r2, P1) > v.hp(r1, P1):
        p.append(f'Leech Seed did not heal P1: {v.hp(r1, P1)} -> {v.hp(r2, P1)}')
    want(p, 'E1 wrap count after the trapper left', v.get(r3, E1, 'wPlayerWrapCount')[0], 0)
    want(p, 'E1 trapped by after the trapper left', link(v, r3, E1, 'TRAPPED_BY'), 0)
    want(p, 'E2 still seeded', v.get(r3, E2, 'wPlayerSubStatus4')[0] >> 7 & 1, 1)
    if 'Leech Seed saps' not in txt3:
        p.append(f'turn 3 (the seeder left): no Leech Seed: {txt3}')
    return p


def check_counter_bide(recs, v):
    t = turns(recs, v)
    p = []
    (i1, txt1), (i2, txt2), (i3, _) = t[:3]
    r1, r2, r3 = recs[i1], recs[i2], recs[i3]
    took = v.hp(r1, P1) - v.hp(r2, P1)
    want(p, 'Counter damage to E2 (2x the hit P1 took)', v.hp(r1, E2) - v.hp(r2, E2), 2 * took)
    want(p, 'E1 HP after Counter', v.hp(r2, E1), v.hp(r1, E1))
    hit = [n for n, (_, txt) in enumerate(t) if 'unleashed energy' in txt]
    if not hit:
        return p + ['Bide never unleashed']
    rb, ra = recs[t[hit[0]][0]], recs[t[hit[0] + 1][0]]
    want(p, 'E1 HP after Bide', v.hp(ra, E1), v.hp(r1, E1))
    if not v.hp(ra, E2) < v.hp(rb, E2):
        p.append(f'Bide missed E2: {v.hp(rb, E2)} -> {v.hp(ra, E2)}')
    return p


def check_lockon_meanlook(recs, v):
    t = turns(recs, v)
    p = []
    (i1, _), (i2, _), (i3, _), (i4, _) = t[:4]
    r2, r3, r4 = recs[i2], recs[i3], recs[i4]
    want(p, 'P1 locked on to', link(v, r2, P1, 'LOCKED_ON_TO'), 1 << E2)
    want(p, 'E2 Lock-On bit', v.get(r2, E2, 'wPlayerSubStatus5')[0] >> 5 & 1, 1)
    want(p, 'E1 Mean Look by', link(v, r2, E1, 'MEAN_LOOK_BY'), 1 << P2)
    want(p, 'E2 Lock-On bit after Zap Cannon', v.get(r3, E2, 'wPlayerSubStatus5')[0] >> 5 & 1, 0)
    want(p, 'P1 locked on to after Zap Cannon', link(v, r3, P1, 'LOCKED_ON_TO'), 0)
    want(p, 'E2 paralyzed by Zap Cannon', v.get(r3, E2, 'wBattleMonStatus')[0] >> 6 & 1, 1)
    want(p, 'E1 Mean Look by after Persian left', link(v, r4, E1, 'MEAN_LOOK_BY'), 0)
    return p


def check_future_sight(recs, v):
    t = turns(recs, v)
    p = []
    hit = [n for n, (_, txt) in enumerate(t) if 'hit by Future' in txt]
    if not hit:
        return ['Future Sight never hit']
    n = hit[0]
    r0, rb, ra = recs[t[0][0]], recs[t[n][0]], recs[t[n + 1][0]]
    want(p, 'E1 HP until Future Sight hit', v.hp(ra, E1), v.hp(r0, E1))
    if not v.hp(ra, E2) < v.hp(rb, E2):
        p.append(f'Future Sight did not hit E2: {v.hp(rb, E2)} -> {v.hp(ra, E2)}')
    return p


def check_haze_perish(recs, v):
    t = turns(recs, v)
    p = []
    (i1, _), (i2, _), (i3, txt3) = t[:3]
    r2, r3 = recs[i2], recs[i3]
    want(p, 'E1 attack after Growl', v.stat_levels(r2, E1)[0], 5)
    want(p, 'E2 attack after Growl', v.stat_levels(r2, E2)[0], 5)
    want(p, 'P2 Sp. Atk after Growth', v.stat_levels(r2, P2)[3], 8)
    for slot in (P1, P2, E1, E2):
        want(p, f'slot {slot} stat levels after Haze', v.stat_levels(r3, slot), [7] * 7)
        want(p, f'slot {slot} Perish Song', v.get(r3, slot, 'wPlayerSubStatus1')[0] >> 4 & 1, 1)
        want(p, f'slot {slot} perish count', v.get(r3, slot, 'wPlayerPerishCount')[0], 3)
    return p


def check_roar_baton_pursuit(recs, v):
    import re
    t = turns(recs, v)
    p = []
    (i1, txt1), (i2, txt2), (i3, txt3), (i4, _) = t[:4]
    r2, r3 = recs[i2], recs[i3]
    if 'dragged out' not in txt1:
        p.append(f'turn 1: no Roar: {txt1}')
    want(p, 'enemy field mons after Roar', v.live(r2, 'wFieldMons', 2)[1], 0b110)
    want(p, 'E1 party mon after Roar', v.party_index(r2, E1), 2)
    want(p, 'P2 party mon after Baton Pass', v.party_index(r3, P2), 2)
    want(p, 'P2 Speed level after Baton Pass', v.stat_levels(r3, P2)[2], 9)
    n = txt3.count('used Pursuit')
    if n != 1 or not txt3.index('used Pursuit') < txt3.index('Raichu'):
        p.append(f'turn 3: Pursuit before the switch once ({n}): {txt3}')
    return p


def check_misc_moves(recs, v):
    t = turns(recs, v)
    p = []
    (i1, txt1), (i2, txt2), (i3, txt3) = t[:3]
    r2, r3 = recs[i2], recs[i3]
    if 'stole' not in txt1:
        p.append(f'turn 1: no Thief: {txt1}')
    want(p, 'E1 item after Thief', v.get(r2, E1, 'wBattleMonItem')[0], 0)
    if 'took down with it' not in txt1 or not v.empty(r2, E2):
        p.append(f'turn 1: Destiny Bond did not take E2 down: {txt1}')
    want(p, 'E1 encored', v.get(r3, E1, 'wPlayerSubStatus5')[0] >> 4 & 1, 1)
    if 'Sneasel used Tackle' not in t[2][1]:
        p.append(f'turn 3: Mirror Move did not use Tackle: {t[2][1]}')
    return p


def check_intimidate(recs, v):
    t = turns(recs, v)
    p = []
    (i1, _), (i2, txt2) = t[:2]
    for slot in (P1, P2):
        want(p, f'P{slot + 1} attack at the start', v.stat_levels(recs[i1], slot)[0], 6)
        want(p, f'P{slot + 1} attack after Arcanine came in', v.stat_levels(recs[i2], slot)[0], 5)
    return p


def check_spread(recs, v):
    t = turns(recs, v)
    p = []
    (i1, txt1), (i2, txt2), (i3, _) = t[:3]
    d1 = v.hp(recs[i1], E2) - v.hp(recs[i2], E2)
    d2 = v.hp(recs[i2], E2) - v.hp(recs[i3], E2)
    p += ratio_check('Chansey: Surf with two targets / one', d1, d2, 0.70, 0.80)
    if not v.empty(recs[i2], E1):
        p.append('Snorlax (E1) did not faint on turn 1')
    for n, txt in ((1, txt1), (2, txt2)):
        if txt.count('used Surf') != 1:
            p.append(f'turn {n}: "used Surf" {txt.count("used Surf")} times: {txt}')
    pp = lambda r: v.get(r, P1, 'wBattleMonPP')[0] & 0x3F
    if pp(recs[i1]) - pp(recs[i2]) != 1:
        p.append(f'Surf PP {pp(recs[i1])} -> {pp(recs[i2])} on turn 1')
    return p


def check_spread_misc(recs, v):
    import re
    t = turns(recs, v)
    p = []
    (i1, txt1), (i2, txt2), (i3, txt3) = t[:3]
    if v.hp(recs[i1], E1) != v.hp(recs[i2], E1):
        p.append('Earthquake hit Pidgeot')
    if not v.hp(recs[i1], E2) > v.hp(recs[i2], E2):
        p.append('Earthquake missed Snorlax')
    if 'affect Enemy Pidgeot' not in txt1:  # "It doesn't affect" (the apostrophe isn't in the charmap)
        p.append(f'turn 1: no "doesn\'t affect": {txt1}')
    for n, txt, words in ((1, txt1, ['used Earthquake', 'used Growl']), (2, txt2, ['used Magnitude', 'used Growl']),
                          (3, txt3, ['used Explosion', 'Pidgeot fainted', 'Snorlax fainted'])):
        for w in words:
            if txt.count(w) != 1:
                p.append(f'turn {n}: "{w}" {txt.count(w)} times: {txt}')
    if len(re.findall(r'Magnitude \d', txt2)) != 1:
        p.append(f'turn 2: Magnitude rolled {len(re.findall(r"Magnitude \\d", txt2))} times: {txt2}')
    for r, want in ((recs[i2], 5), (recs[i3], 3)):  # Growl is -2 in this hack
        for slot in (E1, E2):
            got = v.stat_levels(r, slot)[0]
            if got != want:
                p.append(f'E{slot - 1} attack level {got} (expected {want}) at menu {recs.index(r)}')
    return p


# phase 7: the AI's own mid-turn switch gets Spikes and its entrance ability (singles and
# doubles); a switch-in that Spikes knocks out gets no ability and faints at once
def ai_switch_in_setup(g, gyarados_hp=None):
    g.wr('wEnemyScreens', g.rd('wEnemyScreens') | 1)  # SCREENS_SPIKES on the enemy's side
    if gyarados_hp is not None:
        psize = g.sym['wOTPartyMon2'][1] - g.sym['wOTPartyMon1'][1]
        g.wr16(f'wOTPartyMon1HP+{2 * psize}', gyarados_hp)


def check_switch_in(recs, v, singles, want_level, at):
    """The player battlers' Attack levels at record `at` (after turn 1)."""
    r = recs[at]
    if singles:
        got = [v.live(r, 'wPlayerStatLevels')[0]]
    else:
        got = [v.stat_levels(r, s)[0] for s in (P1, P2)]
    p = [] if all(x == want_level for x in got) else [f'player Attack levels {got} at menu {at} (expected {want_level})']
    turn1 = ' '.join(' '.join(x.get('log') or []) for x in recs[1:at + 1])
    if 'hurt by Spikes' not in turn1:
        p.append('no Spikes damage on turn 1')
    return p


AI_SWITCH_IN = dict(
    cls='SCHOOLBOY',
    party=[('SNORLAX', 100, None, ['DEFENSE_CURL', 'BODY_SLAM']), ('RAICHU', 100, None, ['THUNDERBOLT', 'QUICK_ATTACK'])],
    trainer=[(45, 'MAGNETON', None, ['THUNDERBOLT']), (45, 'CHARIZARD', None, ['FLAMETHROWER']),
             (45, 'GYARADOS', None, ['SURF']), (45, 'STARMIE', None, ['SURF'])],
    abilities={'SNORLAX': 'NO_ABILITY', 'RAICHU': 'NO_ABILITY', 'MAGNETON': 'NO_ABILITY',
               'CHARIZARD': 'NO_ABILITY', 'GYARADOS': 'ABILITY_INTIMIDATE', 'STARMIE': 'NO_ABILITY'},
    force_switch=3,  # turn 1: the AI switches to Gyarados (Intimidate)
    result=WIN)
CASES.update({
    'ai_switch_in_singles': dict(AI_SWITCH_IN, singles=True,
        actions=[('move', 0)] * 2 + [('move', 1)] * 40,  # Defense Curl (Attack stays), then Body Slam
        setup=lambda g: ai_switch_in_setup(g),
        check=lambda recs, v: check_switch_in(recs, v, True, 6, 1),
        log=['withdrew', 'hurt by Spikes']),
    'ai_switch_in_singles_ko': dict(AI_SWITCH_IN, singles=True,
        actions=[('move', 0)] * 2 + [('move', 1)] * 40,
        setup=lambda g: ai_switch_in_setup(g, 1),
        check=lambda recs, v: check_switch_in(recs, v, True, 7, 1),
        log=['withdrew', 'hurt by Spikes', 'fainted']),
    'doubles_ai_switch_in': dict(AI_SWITCH_IN,
        actions=[('move', 0), ('move', 0, 1)] * 2 + [('move', 1, 0), ('move', 0, 1)] * 30,
        setup=lambda g: ai_switch_in_setup(g),
        check=lambda recs, v: check_switch_in(recs, v, False, 6, 2),
        log=['withdrew', 'hurt by Spikes']),
    'doubles_ai_switch_in_ko': dict(AI_SWITCH_IN,
        actions=[('move', 0), ('move', 0, 1)] * 2 + [('move', 1, 0), ('move', 0, 1)] * 30,
        setup=lambda g: ai_switch_in_setup(g, 1),
        check=lambda recs, v: check_switch_in(recs, v, False, 7, 2),
        log=['withdrew', 'hurt by Spikes', 'fainted']),
})


# phase 7: Pursuit on the AI's own switch. Singles: a knockout gives EXP; last turn's Pursuit
# doesn't fire when the player used an item. Doubles: the player battler aiming Pursuit at the
# switcher hits it (not the one loaded opposite it), with EXP on a knockout.
def turn_text(recs, a, b):
    return ' '.join(' '.join(x.get('log') or []) for x in recs[a:b + 1])


def party_exp(v, rec, i):
    o = v.A('wPartyMon1Exp') - v.A('wPartyMon1')
    size = v.A('wPartyMon2') - v.A('wPartyMon1')
    e = rec['wPartyMons'][i * size + o:][:3]
    return e[0] << 16 | e[1] << 8 | e[2]


def check_pursuit(recs, v, at, mon=None, before=True, ko=False):
    """Turn 1 (records 1..at): Pursuit before the withdrawal (or not used at all with
    before=None); on a knockout, party mon `mon` gained EXP and the first OT mon has 0 HP."""
    p, t = [], turn_text(recs, 1, at)
    i, w = t.find('used Pursuit'), t.find('withdrew')
    if before is None:
        if i >= 0:
            p.append('Pursuit was used')
    elif i < 0 or (not ko and (w < 0 or i > w)):
        p.append(f'Pursuit at {i}, withdrew at {w} (Pursuit should come first)')
    if ko:
        if party_exp(v, recs[at], mon) <= party_exp(v, recs[0], mon):
            p.append(f'party mon {mon} gained no EXP')
        size = v.A('wOTPartyMon2') - v.A('wOTPartyMon1')
        o = v.A('wOTPartyMon1HP') - v.A('wOTPartyMon1')
        if recs[at]['wOTPartyMons'][o:o + 2] != [0, 0]:
            p.append('the switcher still has HP')
    return p


def ot_hp(mon, hp):
    def f(g):
        psize = g.sym['wOTPartyMon2'][1] - g.sym['wOTPartyMon1'][1]
        g.wr16(f'wOTPartyMon1HP+{mon * psize}', hp)
    return f


PURSUIT = dict(
    cls='SCHOOLBOY',
    party=[('SNORLAX', 50, None, ['PURSUIT', 'DEFENSE_CURL', 'BODY_SLAM']),
           ('RAICHU', 50, None, ['PURSUIT', 'THUNDERBOLT'])],
    trainer=[(45, 'STARMIE', None, ['SPLASH']), (45, 'CHARIZARD', None, ['SPLASH']),
             (45, 'GYARADOS', None, ['SPLASH']), (45, 'SLOWBRO', None, ['SPLASH'])],
    abilities={'SNORLAX': 'NO_ABILITY', 'RAICHU': 'NO_ABILITY', 'STARMIE': 'NO_ABILITY',
               'CHARIZARD': 'NO_ABILITY', 'GYARADOS': 'NO_ABILITY', 'SLOWBRO': 'NO_ABILITY'},
    force_switch=3, result=WIN)
CASES.update({
    'pursuit_ai_switch_singles_ko': dict(PURSUIT, singles=True,
        actions=[('move', 0)] + [('move', 2)] * 40,
        setup=lambda g: g.wr16('wEnemyMonHP', 1),  # the lead, on the field
        check=lambda recs, v: check_pursuit(recs, v, 1, mon=0, ko=True)),
    'pursuit_stale_singles': dict(PURSUIT, singles=True, items=[('POTION', 5)], hp={0: 60},
        force_switch=(3, 1),  # turn 2: the player uses a Potion, the AI switches
        actions=[('move', 0), ('item', 'POTION', 0)] + [('move', 2)] * 40,
        check=lambda recs, v: check_pursuit(recs[1:], v, 1, before=None)),
    'doubles_pursuit_ai_switch': dict(PURSUIT,
        actions=[('move', 1), ('move', 0, 0)] + [('move', 2, 0), ('move', 1, 1)] * 30,
        check=lambda recs, v: check_pursuit(recs, v, 2)),
    'doubles_pursuit_ai_switch_ko': dict(PURSUIT,
        actions=[('move', 1), ('move', 0, 0)] + [('move', 2, 0), ('move', 1, 1)] * 30,
        setup=lambda g: g.wr16('wEnemyMonHP', 1),  # E1, loaded at the first menu
        check=lambda recs, v: check_pursuit(recs, v, 2, mon=1, ko=True)),
    # the end-of-turn Berry of a battler with no foe opposite it (P2 empty: nothing used to check E2's)
    'doubles_berry_empty_slot': dict(
        cls='COOLTRAINERM',
        party=[('SNORLAX', 80, None, ['TACKLE']), ('PIKACHU', 5, None, ['SPLASH'])], faint=[1],
        trainer=[(40, 'CHANSEY', None, ['SPLASH']), (40, 'SNORLAX', 'BERRY', ['SPLASH'])],
        abilities={'SNORLAX': 'NO_ABILITY', 'PIKACHU': 'NO_ABILITY', 'CHANSEY': 'NO_ABILITY'},
        actions=[('move', 0, 1)] * 40,
        result=WIN, log=['Berry']),
})


def check_lightning_rod(recs, v):
    t = turns(recs, v)
    p = []
    (i1, txt1), (i2, _) = t[:2]
    r1, r2 = recs[i1], recs[i2]
    want(p, 'E1 HP after Thunderbolt was drawn away', v.hp(r2, E1), v.hp(r1, E1))
    want(p, 'E2 HP (Lightning Rod)', v.hp(r2, E2), v.hp(r1, E2))
    want(p, 'E2 Sp. Atk level', v.stat_levels(r2, E2)[3], 8)
    if 'Lightning Rod' not in txt1:
        p.append(f'turn 1: no Lightning Rod text: {txt1}')
    return p


def check_storm_drain(recs, v):
    t = turns(recs, v)
    p = []
    (i1, txt1), (i2, _) = t[:2]
    r1, r2 = recs[i1], recs[i2]
    if not v.hp(r2, E1) < v.hp(r1, E1):
        p.append(f'E1 not hit by Surf: {v.hp(r1, E1)} -> {v.hp(r2, E1)}')
    want(p, 'E2 HP (Storm Drain)', v.hp(r2, E2), v.hp(r1, E2))
    want(p, 'E2 Sp. Atk level (Water Gun drawn in, Surf absorbed)', v.stat_levels(r2, E2)[3], 9)
    return p


def check_plus_minus(recs, v):
    t = turns(recs, v)
    p = []
    (i1, _), (i2, txt2), (i3, txt3), (i4, _) = t[:4]
    d1 = v.hp(recs[i1], E1) - v.hp(recs[i2], E1)  # Pikachu (Plus) with Electrode (Minus)
    d2 = v.hp(recs[i2], E2) - v.hp(recs[i3], E2)  # Pikachu with Machamp
    p += ratio_check('Plus with a Minus ally vs alone', d1, d2, 1.4, 1.6)
    want(p, 'Machamp Speed level after the turn it came in (no boost)', v.stat_levels(recs[i3], P2)[2], 7)
    want(p, 'Machamp Speed level a turn later', v.stat_levels(recs[i4], P2)[2], 8)
    if 'Speed Boost' in txt2 or 'Speed Boost' not in txt3:
        p.append(f'Speed Boost text: turn 2 {txt2} / turn 3 {txt3}')
    return p


def check_singles_speed_boost(recs, v):
    p = []
    lv = [v.live(r, 'wPlayerStatLevels', 3)[2] for r in recs[:4]]
    # menus: turn 1 (Machamp +0), turn 2 (Machamp +1), turn 3 (Jolteon, in since turn 2: +0),
    # turn 4 (Jolteon +1)
    want(p, 'Speed levels at the first four menus', lv, [7, 8, 7, 8])
    return p


def check_air_lock(recs, v):
    t = turns(recs, v)
    p = []
    (i1, txt1), (i2, txt2), (i3, _) = t[:3]
    w = lambda i: v.live(recs[i], 'wBattleWeather')[0]
    want(p, 'weather at the first menu (Drizzle vs Air Lock)', w(i1), 0)
    want(p, 'weather after turn 1 (Rain Dance with Air Lock out)', w(i2), 0)
    if 'Rain Dance' not in txt1 or 'failed' not in txt1:
        p.append(f'turn 1: Rain Dance did not fail: {txt1}')
    want(p, 'weather after turn 2 (Air Lock switched out, Rain Dance)', w(i3), 1)  # WEATHER_RAIN
    return p


def check_friend_guard(recs, v):
    t = turns(recs, v)
    p = []
    (i1, _), (i2, _), (i3, _), (i4, _) = t[:4]
    d1 = v.hp(recs[i1], E1) - v.hp(recs[i2], E1)  # Horn Attack on E1 with Friend Guard (E2) out
    d3 = v.hp(recs[i3], E1) - v.hp(recs[i4], E1)  # the same after E2 fainted
    if not v.empty(recs[i3], E2):
        p.append('E2 still out on turn 3')
    p += ratio_check('Friend Guard ally vs alone', d1, d3, 0.7, 0.8)
    return p


CASES.update({
    # Air Lock (P1) vs Drizzle (E1): no rain at the start; E2's Rain Dance fails while Golduck is
    # out and works once it has switched out (turn 2)
    'doubles_air_lock': dict(
        cls='COOLTRAINERM',
        party=[('GOLDUCK', 50, None, ['SPLASH']), ('SNORLAX', 60, None, ['SPLASH', 'BODY_SLAM']),
               ('MACHAMP', 60, None, ['SPLASH', 'KARATE_CHOP'])],
        trainer=[(20, 'POLIWRATH', None, ['SPLASH']), (20, 'LAPRAS', None, ['RAIN_DANCE'])],
        abilities={'GOLDUCK': 'ABILITY_AIR_LOCK', 'SNORLAX': 'NO_ABILITY', 'MACHAMP': 'NO_ABILITY',
                   'POLIWRATH': 'ABILITY_DRIZZLE', 'LAPRAS': 'NO_ABILITY'},
        actions=[('move', 0), ('move', 0), ('switch', 2), ('move', 0)] + [('move', 1, 0), ('move', 1, 1)] * 30,
        check=check_air_lock,
        result=WIN, log=['weather was kept away']),
    # Friend Guard on E2 (Clefable): Horn Attack on E1 does 3/4 of what it does once E2 has fainted
    'doubles_friend_guard': dict(
        cls='COOLTRAINERM',
        party=[('MACHAMP', 60, None, ['HORN_ATTACK', 'SPLASH']), ('MACHAMP', 60, None, ['SPLASH', 'HORN_ATTACK'])],
        trainer=[(50, 'SNORLAX', None, ['SPLASH']), (5, 'CLEFABLE', None, ['SPLASH'])],
        abilities={'MACHAMP': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'CLEFABLE': 'ABILITY_FRIEND_GUARD'},
        fixed_damage=True,
        actions=[('move', 0, 0), ('move', 0), ('move', 1), ('move', 1, 1), ('move', 0, 0), ('move', 0)]
                + [('move', 0, 0), ('move', 1, 0)] * 30,
        check=check_friend_guard,
        result=WIN),
})


def check_volt_absorb(recs, v):
    t = turns(recs, v)
    p = []
    (i1, _), (i2, txt2), (i3, _) = t[:3]
    h1, h2, h3 = (v.hp(recs[i], E2) for i in (i1, i2, i3))
    mx = v.get(recs[i2], E2, 'wBattleMonMaxHP', n=2)
    mx = mx[0] << 8 | mx[1]
    if not h2 < h1:
        p.append(f'turn 1: Tackle did no damage to E2: {h1} -> {h2}')
    want(p, 'E2 HP after Thunderbolt (Volt Absorb heals 1/4)', h3, min(mx, h2 + mx // 4))
    if 'restored its HP' not in txt2:
        p.append(f'turn 2: no heal text: {txt2}')
    return p


CASES.update({
    # Volt Absorb on E2 (Lanturn): Tackle on turn 1, then Thunderbolt heals it by 1/4 of its max HP
    'doubles_volt_absorb': dict(
        cls='COOLTRAINERM',
        party=[('PIKACHU', 50, None, ['TACKLE', 'THUNDERBOLT', 'BODY_SLAM']), ('SNORLAX', 60, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(30, 'SNORLAX', None, ['SPLASH']), (40, 'LANTURN', None, ['SPLASH'])],
        abilities={'PIKACHU': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'LANTURN': 'ABILITY_VOLT_ABSORB'},
        actions=[('move', 0, 1), ('move', 0), ('move', 1, 1), ('move', 0)] + [('move', 2, 0), ('move', 1, 1)] * 30,
        check=check_volt_absorb,
        result=WIN, log=['Volt Absorb']),
})


def check_sturdy(recs, v):
    # singles: one record per turn (its menu); the log is what happened before that menu
    p = []
    ehp = lambda r: v.live(r, 'wEnemyMonHP', 2)
    log = lambda r: ' | '.join(r.get('log') or [])
    want(p, 'Geodude HP after Horn Attack from full (Sturdy)', ehp(recs[1]), [0, 1])
    if 'endured' not in log(recs[1]).lower():
        p.append(f'turn 1: no "endured" text: {log(recs[1])}')
    if 'Horn Drill' not in log(recs[3]) or 'unaffected' not in log(recs[3]) or ehp(recs[3]) != ehp(recs[2]):
        p.append(f'turn 3: Horn Drill on Sturdy: {ehp(recs[2])} -> {ehp(recs[3])} | {log(recs[3])}')
    return p


def check_natural_cure(recs, v):
    p = []
    # menus: turn 1 (Starmie, paralyzed by setup), turn 2 (Snorlax), turn 3 (Starmie back)
    want(p, 'Starmie status after switching out and back (Natural Cure)', v.live(recs[2], 'wBattleMonStatus')[0], 0)
    want(p, 'Starmie is back', v.live(recs[2], 'wBattleMonSpecies')[0], v.live(recs[0], 'wBattleMonSpecies')[0])
    return p


def start_rain(g):
    g.wr('wBattleWeather', 1)  # WEATHER_RAIN
    g.wr('wWeatherCount', 5)


def check_cloud_nine(recs, v):
    p = []
    want(p, 'weather after Golduck (Cloud Nine) switched in', v.live(recs[1], 'wBattleWeather')[0], 0)
    log = ' '.join(recs[1].get('log') or [])
    if 'Cloud Nine' not in log or 'ended the weather' not in log:
        p.append(f'turn 1: no Cloud Nine text: {log}')
    return p


def hurt_lead(g):
    g.wr('wBattleMonHP', [0, 20])
    g.wr('wPartyMon1HP', [0, 20])


def check_regenerator(recs, v):
    p = []
    mx = v.live(recs[0], 'wBattleMonMaxHP', 2)
    mx = mx[0] << 8 | mx[1]
    hp = v.live(recs[2], 'wBattleMonHP', 2)
    want(p, 'Slowbro HP after switching out and back (Regenerator)', hp[0] << 8 | hp[1], min(mx, 20 + mx // 3))
    return p


def check_mold_breaker_rod(recs, v):
    t = turns(recs, v)
    p = []
    (i1, _), (i2, _) = t[:2]
    if not v.hp(recs[i2], E1) < v.hp(recs[i1], E1):
        p.append(f'E1 not hit by Thunderbolt (Mold Breaker vs Lightning Rod): {v.hp(recs[i1], E1)} -> {v.hp(recs[i2], E1)}')
    want(p, 'E2 Sp. Atk level', v.stat_levels(recs[i2], E2)[3], 7)
    return p


def check_trap(escapes):
    # singles: the lead tries to switch on turn 1, the mon now out tries to switch back on turn 2.
    # escapes: whether the lead gets out; the second switch is always refused (trapped).
    def check(recs, v):
        p = []
        sp = [v.live(r, 'wBattleMonSpecies')[0] for r in recs[:3]]
        log = ' '.join(' '.join(r.get('log') or []) for r in recs[:4])
        if escapes:
            if not (sp[1] != sp[0] and sp[2] == sp[1]):
                p.append(f'species at the first menus: {sp} (expected the lead to switch out, then stay)')
        elif sp[1] != sp[0]:
            p.append(f'species at the first menus: {sp} (expected the lead to stay)')
        if 'recalled' not in log:
            p.append(f'no "can\'t be recalled" text: {log[-200:]}')
        return p
    return check


def paralyze_lead(g):
    g.wr('wBattleMonStatus', 1 << 6)  # PAR
    g.wr('wPartyMon1Status', 1 << 6)


CASES.update({
    # singles: Sturdy: Horn Attack from full HP leaves Geodude at 1 HP ("endured"), the next one
    # knocks it out; Horn Drill fails on the second Geodude (at full HP)
    'singles_sturdy': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('MACHAMP', 60, None, ['HORN_ATTACK', 'HORN_DRILL'])],
        trainer=[(10, 'GEODUDE', None, ['SPLASH']), (10, 'GEODUDE', None, ['SPLASH'])],
        abilities={'MACHAMP': 'NO_ABILITY', 'GEODUDE': 'ABILITY_STURDY'},
        actions=[('move', 0), ('move', 0), ('move', 1)] + [('move', 0)] * 10,
        check=check_sturdy,
        result=WIN),
    # singles: Cloud Nine switching into rain ends it ("<MON>'s Cloud Nine ended the weather!")
    'singles_cloud_nine': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM']), ('GOLDUCK', 50, None, ['SPLASH', 'SURF'])],
        trainer=[(20, 'RATTATA', None, ['SPLASH']), (20, 'RATTATA', None, ['SPLASH'])],
        abilities={'SNORLAX': 'NO_ABILITY', 'GOLDUCK': 'ABILITY_CLOUD_NINE', 'RATTATA': 'NO_ABILITY'},
        setup=start_rain,
        actions=[('switch', 1)] + [('move', 1)] * 20,
        check=check_cloud_nine,
        result=WIN),
    # singles: Regenerator: Slowbro at 20 HP switches out and back: +1/3 of its max HP. The enemy
    # lead has Mold Breaker ("breaks the mold!" on entry)
    'singles_regenerator': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('SLOWBRO', 50, None, ['SPLASH', 'SURF']), ('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(20, 'PINSIR', None, ['SPLASH']), (20, 'RATTATA', None, ['SPLASH'])],
        abilities={'SLOWBRO': 'ABILITY_REGENERATOR', 'SNORLAX': 'NO_ABILITY', 'PINSIR': 'ABILITY_MOLD_BREAKER',
                   'RATTATA': 'NO_ABILITY'},
        setup=hurt_lead,
        actions=[('switch', 1), ('switch', 0)] + [('move', 1)] * 20,
        check=check_regenerator,
        result=WIN, log=['breaks']),
    # singles: Arena Trap (Dugtrio): the Flying lead (Pidgeot) switches out; Snorlax can't
    'singles_arena_trap': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('PIDGEOT', 50, None, ['SPLASH', 'WING_ATTACK']), ('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(20, 'DUGTRIO', None, ['SPLASH']), (20, 'DUGTRIO', None, ['SPLASH'])],
        abilities={'PIDGEOT': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'DUGTRIO': 'ABILITY_ARENA_TRAP'},
        actions=[('switch', 1), ('switch', 0)] + [('move', 1)] * 20,
        check=check_trap(True),
        result=WIN),
    # singles: Shadow Tag (Wobbuffet): the Ghost lead (Gengar) switches out; Snorlax can't
    'singles_shadow_tag': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('GENGAR', 50, None, ['SPLASH', 'SHADOW_BALL']), ('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(20, 'WOBBUFFET', None, ['SPLASH']), (20, 'WOBBUFFET', None, ['SPLASH'])],
        abilities={'GENGAR': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'WOBBUFFET': 'ABILITY_SHADOW_TAG'},
        actions=[('switch', 1), ('switch', 0)] + [('move', 1)] * 20,
        check=check_trap(True),
        result=WIN),
    # singles: Magnet Pull (Magneton): the Steel lead (Skarmory, Flying too) can't switch out
    'singles_magnet_pull': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('SKARMORY', 50, None, ['SPLASH', 'WING_ATTACK']), ('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(20, 'MAGNETON', None, ['SPLASH']), (20, 'MAGNETON', None, ['SPLASH'])],
        abilities={'SKARMORY': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'MAGNETON': 'ABILITY_MAGNET_PULL'},
        actions=[('switch', 1)] + [('move', 1)] * 40,
        check=check_trap(False),
        result=WIN),
    # singles: Natural Cure: the paralyzed lead (Starmie) switches out and back: cured
    'singles_natural_cure': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('STARMIE', 50, None, ['SPLASH', 'SURF']), ('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(20, 'RATTATA', None, ['SPLASH']), (20, 'RATTATA', None, ['SPLASH'])],
        abilities={'STARMIE': 'ABILITY_NATURAL_CURE', 'SNORLAX': 'NO_ABILITY', 'RATTATA': 'NO_ABILITY'},
        setup=paralyze_lead,
        actions=[('switch', 1), ('switch', 0)] + [('move', 1)] * 20,
        check=check_natural_cure,
        result=WIN),
})


CASES.update({
    # Oct 28, 2026 abilities: Lightning Rod on E2 draws in Thunderbolt aimed at E1
    'doubles_lightning_rod': dict(
        cls='COOLTRAINERM',
        party=[('PIKACHU', 60, None, ['THUNDERBOLT', 'BODY_SLAM']), ('SNORLAX', 60, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(30, 'SNORLAX', None, ['SPLASH']), (30, 'RAICHU', None, ['SPLASH'])],
        abilities={'PIKACHU': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'RAICHU': 'ABILITY_LIGHTNING_ROD'},
        actions=[('move', 0, 0), ('move', 0)] + [('move', 1, 0), ('move', 1, 1)] * 30,
        check=check_lightning_rod,
        result=WIN, log=['Lightning Rod']),
    # Mold Breaker (P1): Thunderbolt at E1 isn't drawn to E2's Lightning Rod
    'doubles_mold_breaker_rod': dict(
        cls='COOLTRAINERM',
        party=[('PIKACHU', 60, None, ['THUNDERBOLT', 'BODY_SLAM']), ('SNORLAX', 60, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(30, 'SNORLAX', None, ['SPLASH']), (30, 'RAICHU', None, ['SPLASH'])],
        abilities={'PIKACHU': 'ABILITY_MOLD_BREAKER', 'SNORLAX': 'NO_ABILITY', 'RAICHU': 'ABILITY_LIGHTNING_ROD'},
        actions=[('move', 0, 0), ('move', 0)] + [('move', 1, 0), ('move', 1, 1)] * 30,
        check=check_mold_breaker_rod,
        result=WIN),
    # Storm Drain on E2: Water Gun at E1 is drawn in; Surf hits E1 and is absorbed by E2
    'doubles_storm_drain': dict(
        cls='COOLTRAINERM',
        party=[('LAPRAS', 60, None, ['WATER_GUN', 'BODY_SLAM']), ('LAPRAS', 60, None, ['SURF', 'BODY_SLAM'])],
        trainer=[(30, 'SNORLAX', None, ['SPLASH']), (30, 'VAPOREON', None, ['SPLASH'])],
        abilities={'LAPRAS': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'VAPOREON': 'ABILITY_STORM_DRAIN'},
        actions=[('move', 0, 0), ('move', 0)] + [('move', 1, 0), ('move', 1, 1)] * 30,
        check=check_storm_drain,
        result=WIN, log=['Storm Drain']),
    # Plus with a Minus ally (turn 1) vs alone (turn 2, Electrode switched for Machamp);
    # Machamp's Speed Boost: not at the end of turn 2 (it switched in), then at the end of turn 3
    'doubles_plus_minus': dict(
        cls='COOLTRAINERM',
        party=[('PIKACHU', 50, None, ['THUNDERBOLT', 'SPLASH']), ('ELECTRODE', 50, None, ['SPLASH']),
               ('MACHAMP', 60, None, ['SPLASH', 'KARATE_CHOP'])],
        trainer=[(60, 'SNORLAX', None, ['SPLASH']), (60, 'SNORLAX', None, ['SPLASH'])],
        abilities={'PIKACHU': 'ABILITY_PLUS', 'ELECTRODE': 'ABILITY_MINUS', 'MACHAMP': 'ABILITY_SPEED_BOOST',
                   'SNORLAX': 'NO_ABILITY'},
        fixed_damage=True,
        actions=[('move', 0, 0), ('move', 0), ('move', 0, 1), ('switch', 2), ('move', 1), ('move', 0)]
                + [('move', 0, 0), ('move', 1, 0)] * 40,
        check=check_plus_minus,
        result=WIN),
    # singles: Speed Boost on the lead boosts at the end of turn 1; a Speed Boost mon switched in
    # (turn 2) doesn't boost that turn, then does at the end of turn 3
    'singles_speed_boost': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('MACHAMP', 60, None, ['SPLASH', 'KARATE_CHOP']), ('JOLTEON', 60, None, ['SPLASH', 'THUNDERBOLT'])],
        trainer=[(30, 'SNORLAX', None, ['SPLASH']), (30, 'SNORLAX', None, ['SPLASH'])],
        abilities={'MACHAMP': 'ABILITY_SPEED_BOOST', 'JOLTEON': 'ABILITY_SPEED_BOOST', 'SNORLAX': 'NO_ABILITY'},
        actions=[('move', 0), ('switch', 1), ('move', 0)] + [('move', 1)] * 60,
        check=check_singles_speed_boost,
        result=WIN),
    # the AI doesn't feed Lightning Rod: Thunderbolt at P1 would be drawn to P2 (Raichu), and P2
    # is immune, so both foes Tackle
    'doubles_ai_lightning_rod': dict(
        cls='COOLTRAINERM',
        party=[('SNORLAX', 100, None, ['SPLASH', 'BODY_SLAM']), ('RAICHU', 100, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(30, 'JOLTEON', None, ['THUNDERBOLT', 'TACKLE']), (30, 'JOLTEON', None, ['THUNDERBOLT', 'TACKLE'])],
        abilities={'SNORLAX': 'NO_ABILITY', 'RAICHU': 'ABILITY_LIGHTNING_ROD', 'JOLTEON': 'NO_ABILITY'},
        actions=[('move', 0), ('move', 0)] * 3 + [('move', 1, 0), ('move', 1, 0)] * 30,
        check=lambda recs, v: check_ai(recs, v, 3, e1=(1, None), e2=(1, None)),
        result=WIN),
})



# Knock Off (Oct 29, 2026): the target's battle copy of its item is cleared (x1.5 damage
# while it has one), the party struct keeps it, and wKnockedOffMons keeps it suppressed when
# the mon comes back in. Singles: both sides knock off, the player's mon leaves and comes
# back, an enemy bench mon flagged at the first menu is sent in without its item.
# Doubles: P1 knocks off E2's item only.
def check_knock_off_singles(recs, v):
    p, g = [], v.g
    item = lambda r, who: v.live(r, f'w{who}MonItem')[0]
    lo = item(recs[0], 'Battle')  # Leftovers' 8-bit item ID
    if not lo:
        p.append('Machamp has no item at the first menu')
    r1, r3 = recs[1], recs[3]
    want(p, "Machamp's item after turn 1", item(r1, 'Battle'), 0)
    want(p, "Sneasel's item after turn 1", item(r1, 'Enemy'), 0)
    want(p, 'the mon back in after two switches', r3['wCurBattleMon'], 0)
    want(p, "Machamp's item after coming back", item(r3, 'Battle'), 0)
    tauros = [r for r in recs if 'end' not in r and v.live(r, 'wEnemyMonSpecies')[0] not in (0, v.live(recs[0], 'wEnemyMonSpecies')[0])]  # not Sneasel
    if not tauros:
        p.append('Tauros never came in')
    else:
        want(p, "flagged Tauros's item", item(tauros[0], 'Enemy'), 0)
    psize = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    want(p, 'party items after the battle', [g.rd(f'wPartyMon1Item+{i * psize}') for i in range(2)], [lo, lo])
    return p


def check_knock_off_doubles(recs, v):
    t = turns(recs, v)
    p = []
    lo = v.get(recs[0], P1, 'wBattleMonItem')[0]  # Leftovers' 8-bit item ID
    r = recs[t[1][0]]
    got = [v.get(r, s, 'wBattleMonItem')[0] for s in (P1, P2, E1, E2)]
    want(p, 'items P1, P2, E1, E2 after turn 1', got, [lo, lo, lo, 0])
    want(p, 'wKnockedOffMons after turn 1', v.live(r, 'wKnockedOffMons', 2), [0, 1 << 1])
    if 'was knocked off' not in t[0][1]:
        p.append(f'turn 1: no knock-off text: {t[0][1]}')
    return p


CASES.update({
    'knock_off_singles': dict(
        cls='COOLTRAINERM', singles=True,
        party=[('MACHAMP', 50, 'LEFTOVERS', ['KNOCK_OFF', 'KARATE_CHOP']), ('SNORLAX', 50, 'LEFTOVERS', ['SPLASH'])],
        trainer=[(40, 'SNEASEL', 'LEFTOVERS', ['KNOCK_OFF']), (40, 'TAUROS', 'LEFTOVERS', ['SPLASH'])],
        abilities={'MACHAMP': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'SNEASEL': 'NO_ABILITY', 'TAUROS': 'NO_ABILITY'},
        setup=lambda g: g.wr('wKnockedOffMons', [0, 1 << 1]),  # Tauros (enemy mon 2)
        actions=[('move', 0), ('switch', 1), ('switch', 0)] + [('move', 1)] * 30,
        check=lambda recs, v: check_knock_off_singles(recs, v),
        log=['was knocked off'],
        result=WIN),
    'knock_off_doubles': dict(
        cls='COOLTRAINERM',
        party=[('MACHAMP', 50, 'LEFTOVERS', ['KNOCK_OFF', 'KARATE_CHOP']), ('PIKACHU', 50, 'LEFTOVERS', ['SPLASH', 'THUNDERBOLT'])],
        trainer=[(40, 'SNORLAX', 'LEFTOVERS', ['SPLASH']), (40, 'GYARADOS', 'LEFTOVERS', ['SPLASH'])],
        abilities={'MACHAMP': 'NO_ABILITY', 'PIKACHU': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'GYARADOS': 'NO_ABILITY'},
        actions=[('move', 0, 1), ('move', 0)] + [('move', 1, 0), ('move', 1, 1)] * 30,
        check=lambda recs, v: check_knock_off_doubles(recs, v),
        result=WIN),
})


# Sucker Punch (Oct 29, 2026): +1 priority; fails ("But it failed!") unless the target chose a
# damaging move this turn and hasn't used it yet.
def sp_turn_text(recs, n):  # singles: the text of turn n (0-based)
    return ' | '.join(recs[n + 1].get('log') or [])


def sp_before(p, what, text, a, b):
    i, j = text.find(a), text.find(b)
    if i < 0 or j < 0 or i > j:
        p.append(f'{what}: "{a}" not before "{b}": {text[-300:]}')


def check_sucker_punch_singles(recs, v, turn, fails, before=None):
    p, t = [], sp_turn_text(recs, turn)
    if ('But it failed' in t) != fails:
        p.append(f'turn {turn + 1}: failed={not fails}, expected {fails}: {t[-300:]}')
    if before:
        sp_before(p, f'turn {turn + 1}', t, *before)
    return p


def check_sucker_punch_doubles(recs, v):
    t, p = turns(recs, v), []
    if 'But it failed' not in t[0][1]:
        p.append(f'turn 1 (aimed at the Splash user): no failure: {t[0][1][-300:]}')
    if 'But it failed' in t[1][1]:
        p.append(f'turn 2 (aimed at the Tackle user) failed: {t[1][1][-300:]}')
    sp_before(p, 'turn 2', t[1][1], 'used Sucker Punch', 'Snorlax used Tackle')
    return p


SP_AB = {'MACHAMP': 'NO_ABILITY', 'JOLTEON': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'SLOWBRO': 'NO_ABILITY',
         'PIKACHU': 'NO_ABILITY'}
CASES.update({
    'sucker_punch_hits': dict(  # a faster foe's Tackle: Sucker Punch goes first
        cls='COOLTRAINERM', singles=True, abilities=SP_AB,
        party=[('MACHAMP', 50, None, ['SUCKER_PUNCH'])], trainer=[(50, 'JOLTEON', None, ['TACKLE'])],
        actions=[('move', 0)] * 30,
        check=lambda recs, v: check_sucker_punch_singles(recs, v, 0, False, ('used Sucker Punch', 'used Tackle')),
        result=WIN),
    'sucker_punch_fails': dict(  # a status move
        cls='COOLTRAINERM', singles=True, abilities=SP_AB,
        party=[('MACHAMP', 50, None, ['SUCKER_PUNCH', 'KARATE_CHOP'])], trainer=[(30, 'SNORLAX', None, ['SPLASH'])],
        actions=[('move', 0)] + [('move', 1)] * 30,
        check=lambda recs, v: check_sucker_punch_singles(recs, v, 0, True),
        result=WIN),
    'sucker_punch_outsped': dict(  # a faster foe's Quick Attack (same priority) has already hit
        cls='COOLTRAINERM', singles=True, abilities=SP_AB,
        party=[('MACHAMP', 50, None, ['SUCKER_PUNCH', 'KARATE_CHOP'])], trainer=[(50, 'JOLTEON', None, ['QUICK_ATTACK'])],
        actions=[('move', 0)] + [('move', 1)] * 30,
        check=lambda recs, v: check_sucker_punch_singles(recs, v, 0, True, ('used Quick Attack', 'used Sucker Punch')),
        result=WIN),
    'sucker_punch_enemy': dict(  # the AI's Sucker Punch: fails against Splash, then beats Karate Chop
        cls='COOLTRAINERM', singles=True, abilities=SP_AB,
        party=[('MACHAMP', 50, None, ['SPLASH', 'KARATE_CHOP'])], trainer=[(45, 'SNORLAX', None, ['SUCKER_PUNCH'])],
        actions=[('move', 0)] + [('move', 1)] * 30,
        check=lambda recs, v: check_sucker_punch_singles(recs, v, 0, True)
            + check_sucker_punch_singles(recs, v, 1, False, ('used Sucker Punch', 'used Karate Chop')),
        result=WIN),
    'sucker_punch_doubles': dict(  # turn 1 at the Splash user (fails), turn 2 at the Tackle user (first)
        cls='COOLTRAINERM', abilities=SP_AB,
        party=[('MACHAMP', 50, None, ['SUCKER_PUNCH', 'KARATE_CHOP']), ('PIKACHU', 50, None, ['SPLASH', 'THUNDERBOLT'])],
        trainer=[(45, 'SNORLAX', None, ['TACKLE']), (45, 'SLOWBRO', None, ['SPLASH'])],
        actions=[('move', 0, 1), ('move', 0), ('move', 0, 0), ('move', 0)] + [('move', 1, 0), ('move', 1, 1)] * 30,
        check=lambda recs, v: check_sucker_punch_doubles(recs, v),
        result=WIN),
})


# Taunt (Oct 29, 2026; Gen 5+): 3 turns (4 if the target already moved); status moves are
# blocked in the menu, by the AI and when the move runs; Struggle when nothing else is left.
def check_taunt_singles(recs, v):
    p, t = [], [sp_turn_text(recs, n) for n in range(5)]
    for w in ('fell for the', 'after'):
        if w not in t[0]:
            p.append(f'turn 1: no "{w}": {t[0][-300:]}')
    for n in (1, 2):
        if 'used Struggle' not in t[n]:
            p.append(f'turn {n + 1}: no Struggle: {t[n][-300:]}')
    if 'shook off the' not in t[2]:
        p.append(f'turn 3: the taunt did not end: {t[2][-300:]}')
    if 'used Struggle' in t[3] or not ('used Splash' in t[3] or 'used Growl' in t[3]):
        p.append(f'turn 4: no status move after the taunt: {t[3][-300:]}')
    return p


def check_taunt_player(recs, v):
    p, t = [], [sp_turn_text(recs, n) for n in range(3)]
    for w in ('fell for the', 'after'):
        if w not in t[0]:
            p.append(f'turn 1: no "{w}": {t[0][-300:]}')
    if 'Snorlax used Struggle' not in t[1]:
        p.append(f'turn 2: no Struggle: {t[1][-300:]}')
    return p


def check_taunt_doubles(recs, v):
    t, p = turns(recs, v), []
    if 'fell for the' not in t[0][1]:
        p.append(f'turn 1: no taunt: {t[0][1][-300:]}')
    r = recs[t[1][0]]
    want(p, 'E2 taunt turns after turn 1', v.get(r, E2, 'wPlayerSubStatus2')[0] >> 1 & 7, 2)
    want(p, 'E1 taunt turns after turn 1', v.get(r, E1, 'wPlayerSubStatus2')[0] >> 1 & 7, 0)
    if 'Slowbro used Struggle' not in t[1][1]:
        p.append(f'turn 2: E2 did not Struggle: {t[1][1][-300:]}')
    if 'Enemy Snorlax used Splash' not in t[1][1]:
        p.append(f'turn 2: E1 (not taunted) did not use Splash: {t[1][1][-300:]}')
    return p


TAUNT_AB = {'JOLTEON': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'SLOWBRO': 'NO_ABILITY'}
CASES.update({
    'taunt_singles': dict(  # Jolteon taunts first: Snorlax (status moves only) Struggles, then shakes it off
        cls='COOLTRAINERM', singles=True, abilities=TAUNT_AB,
        party=[('JOLTEON', 50, None, ['TAUNT', 'THUNDERBOLT', 'SPLASH'])],
        trainer=[(50, 'SNORLAX', None, ['SPLASH', 'GROWL'])],
        actions=[('move', 0)] + [('move', 2)] * 3 + [('move', 1)] * 30,
        check=lambda recs, v: check_taunt_singles(recs, v),
        result=WIN),
    'taunt_player': dict(  # the faster AI taunts the player: Splash is blocked, then Struggle
        cls='COOLTRAINERM', singles=True, abilities=TAUNT_AB,
        party=[('SNORLAX', 50, None, ['SPLASH', 'GROWL'])],
        trainer=[(30, 'JOLTEON', None, ['TAUNT'])],
        actions=[('move', 0)] * 40,
        check=lambda recs, v: check_taunt_player(recs, v),
        result=WIN),
    'taunt_doubles': dict(  # P1 taunts E2 only
        cls='COOLTRAINERM', abilities=TAUNT_AB,
        party=[('JOLTEON', 50, None, ['TAUNT', 'THUNDERBOLT', 'SPLASH']), ('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(45, 'SNORLAX', None, ['SPLASH']), (45, 'SLOWBRO', None, ['SPLASH', 'GROWL'])],
        actions=[('move', 0, 1), ('move', 0)] + [('move', 2), ('move', 0)] * 2 + [('move', 1, 0), ('move', 1, 0)] * 30,
        check=lambda recs, v: check_taunt_doubles(recs, v),
        result=WIN),
})


# The AI's damage estimate for Electro Ball and Weather Ball (Oct 29, 2026): AIDamageCalc
# works out their in-battle power (and Weather Ball's type). Before, it saw Electro Ball's
# placeholder power 1 and Weather Ball as a 50-power Normal move. (Controls with AIDamageCalc.SetPower
# patched to ret pick the other move on most turns.)
def check_ai_first_moves(recs, want_move, other, turns_n=2, start=0):
    p = []
    n_turns = min(turns_n, len(recs) - 1)
    if n_turns <= start:
        return ['too few turns were played']
    for n in range(start, n_turns):
        t = sp_turn_text(recs, n)
        if f'used {want_move}' not in t or f'used {other}' in t:
            p.append(f'turn {n + 1}: expected {want_move}, not {other}: {t[-250:]}')
    return p


CASES.update({
    'ai_electro_ball': dict(  # a far faster Jolteon: Electro Ball (150) over Thundershock (35)
        cls='COOLTRAINERM', singles=True, abilities={'JOLTEON': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY'},
        party=[('SNORLAX', 50, None, ['SPLASH'])], trainer=[(50, 'JOLTEON', None, ['THUNDERSHOCK', 'ELECTRO_BALL'])],
        actions=[('move', 0)] * 30,
        check=lambda recs, v: check_ai_first_moves(recs, 'Electro Ball', 'Thundershock', 3),
        result=LOSE),
    'ai_weather_ball': dict(  # rain: Weather Ball (Water, 100) on Arcanine over Body Slam (85)
        cls='COOLTRAINERM', singles=True, abilities={'ARCANINE': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY'},
        party=[('ARCANINE', 50, None, ['SPLASH'])], trainer=[(35, 'SNORLAX', None, ['BODY_SLAM', 'WEATHER_BALL'])],
        setup=lambda g: (g.wr('wBattleWeather', 1), g.wr('wWeatherCount', 255)),  # WEATHER_RAIN
        actions=[('move', 0)] * 30,
        check=lambda recs, v: check_ai_first_moves(recs, 'Weather Ball', 'Body Slam', 3, 1),  # from turn 2: the harness sets the rain after the AI's turn-1 choice
        result=LOSE),
})


# Yawn (Oct 29, 2026; Gen 5+): "grew drowsy", then asleep at the end of the next turn;
# fails on a drowsy or statused target; switching out cures the drowsiness.
SLP_MASK_ = 7


def check_yawn_singles(recs, v):
    p, t = [], [sp_turn_text(recs, n) for n in range(2)]
    if 'grew drowsy' not in t[0] or 'fell asleep' in t[0]:
        p.append(f'turn 1: {t[0][-250:]}')
    if 'But it failed' not in t[1]:
        p.append(f'turn 2: a second Yawn on the drowsy foe did not fail: {t[1][-250:]}')
    if 'fell asleep' not in t[1]:
        p.append(f'turn 2: no sleep at the end of the turn: {t[1][-250:]}')
    want(p, 'enemy asleep after turn 2', bool(v.live(recs[2], 'wEnemyMonStatus')[0] & SLP_MASK_), True)
    return p


def check_yawn_player(recs, v):
    p, t = [], [sp_turn_text(recs, n) for n in range(2)]
    if 'grew drowsy' not in t[0]:
        p.append(f'turn 1: {t[0][-250:]}')
    if 'Snorlax' not in t[1] or 'fell asleep' not in t[1]:
        p.append(f'turn 2: the player did not fall asleep: {t[1][-250:]}')
    want(p, 'player asleep after turn 2', bool(v.live(recs[2], 'wBattleMonStatus')[0] & SLP_MASK_), True)
    return p


def check_yawn_switch(recs, v):
    p, t = [], [sp_turn_text(recs, n) for n in range(3)]
    if 'grew drowsy' not in t[0]:
        p.append(f'turn 1: {t[0][-250:]}')
    if 'Snorlax' in t[1] and 'fell asleep' in t[1]:
        p.append(f'turn 2: Snorlax fell asleep after switching out: {t[1][-250:]}')
    r = recs[3]  # Snorlax back in (turn 3), before the end of turn 4
    want(p, 'Snorlax back in', r['wCurBattleMon'], 0)
    want(p, 'Snorlax status after coming back', v.live(r, 'wBattleMonStatus')[0] & SLP_MASK_, 0)
    return p


def check_yawn_doubles(recs, v):
    t, p = turns(recs, v), []
    r = recs[t[2][0]]  # after turn 2
    want(p, 'E2 asleep after turn 2', bool(v.get(r, E2, 'wBattleMonStatus')[0] & SLP_MASK_), True)
    want(p, 'E1 status after turn 2', v.get(r, E1, 'wBattleMonStatus')[0], 0)
    if 'grew drowsy' not in t[0][1]:
        p.append(f'turn 1: {t[0][1][-250:]}')
    return p


YAWN_AB = {'JOLTEON': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'SLOWBRO': 'NO_ABILITY', 'PIKACHU': 'NO_ABILITY'}
CASES.update({
    'yawn_singles': dict(
        cls='COOLTRAINERM', singles=True, abilities=YAWN_AB,
        party=[('JOLTEON', 50, None, ['YAWN', 'THUNDERBOLT', 'SPLASH'])],
        trainer=[(50, 'SNORLAX', None, ['SPLASH'])],
        actions=[('move', 0), ('move', 0)] + [('move', 1)] * 30,
        check=lambda recs, v: check_yawn_singles(recs, v),
        result=WIN),
    'yawn_player': dict(  # the AI's Yawn; the party struct gets the sleep (the slot check)
        cls='COOLTRAINERM', singles=True, abilities=YAWN_AB,
        party=[('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(35, 'SLOWBRO', None, ['YAWN'])],
        actions=[('move', 0), ('move', 0)] + [('move', 1)] * 30,
        check=lambda recs, v: check_yawn_player(recs, v),
        result=WIN),
    'yawn_switch': dict(  # yawned Snorlax switches out (turn 2) and back (turn 3): not asleep
        cls='COOLTRAINERM', singles=True, abilities=YAWN_AB,
        party=[('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM']), ('PIKACHU', 50, None, ['SPLASH', 'THUNDERBOLT'])],
        trainer=[(35, 'SLOWBRO', None, ['YAWN'])],
        actions=[('move', 0), ('switch', 1), ('switch', 0)] + [('move', 1)] * 30,
        check=lambda recs, v: check_yawn_switch(recs, v),
        result=WIN),
    'yawn_doubles': dict(  # P1 yawns E2 only
        cls='COOLTRAINERM', abilities=YAWN_AB,
        party=[('JOLTEON', 50, None, ['YAWN', 'THUNDERBOLT', 'SPLASH']), ('SNORLAX', 50, None, ['SPLASH', 'BODY_SLAM'])],
        trainer=[(45, 'SNORLAX', None, ['SPLASH']), (45, 'SLOWBRO', None, ['SPLASH'])],
        actions=[('move', 0, 1), ('move', 0)] + [('move', 2), ('move', 0)] * 2 + [('move', 1, 0), ('move', 1, 0)] * 30,
        check=lambda recs, v: check_yawn_doubles(recs, v),
        result=WIN),
})


# Grass Knot and Low Kick (Oct 29, 2026): power from the target's weight. The AI knows it
# (AIDamageCalc): Grass Knot (120) on heavy Snorlax, Razor Leaf over Grass Knot (20) on Pikachu.
# (Only the heavy case fails with AIDamageCalc.SetPower patched out; the old AI also chose Razor Leaf on Pikachu.)
CASES.update({
    'ai_grass_knot_heavy': dict(
        cls='COOLTRAINERM', singles=True, abilities={'VENUSAUR': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY'},
        party=[('SNORLAX', 50, None, ['SPLASH'])], trainer=[(40, 'VENUSAUR', None, ['RAZOR_LEAF', 'GRASS_KNOT'])],
        actions=[('move', 0)] * 40,
        check=lambda recs, v: check_ai_first_moves(recs, 'Grass Knot', 'Razor Leaf', 3),
        result=LOSE),
    'ai_grass_knot_light': dict(
        cls='COOLTRAINERM', singles=True, abilities={'VENUSAUR': 'NO_ABILITY', 'PIKACHU': 'NO_ABILITY'},
        party=[('PIKACHU', 60, None, ['SPLASH'])], trainer=[(40, 'VENUSAUR', None, ['RAZOR_LEAF', 'GRASS_KNOT'])],
        actions=[('move', 0)] * 40,
        check=lambda recs, v: check_ai_first_moves(recs, 'Razor Leaf', 'Grass Knot', 3),
        result=LOSE),
})


# Ingrain and Aqua Ring (Oct 29, 2026): each heals 1/8 of max HP at the end of every turn
# (this hack; mainline 1/16); Ingrain traps its user and blocks Roar; a second use fails.
def eighth(m):
    e = (m // 4) // 2
    return e or 1


def check_ingrain_singles(recs, v):
    p = []
    m = v.live(recs[0], 'wBattleMonMaxHP', 2); m = m[0] << 8 | m[1]
    hp = [(lambda h: h[0] << 8 | h[1])(v.live(r, 'wBattleMonHP', 2)) for r in recs[:3]]
    t = [sp_turn_text(recs, n) for n in range(2)]
    for w in ('planted its roots', 'anchored itself', 'absorbed nutrients'):
        if w not in t[0]:
            p.append(f'turn 1: no "{w}": {t[0][-300:]}')
    for w in ('surrounded itself', 'absorbed nutrients', 'with Aqua Ring'):
        if w not in t[1]:
            p.append(f'turn 2: no "{w}": {t[1][-300:]}')
    want(p, 'HP after turn 1 (Ingrain)', hp[1], min(m, hp[0] + eighth(m)))
    want(p, 'HP after turn 2 (both)', hp[2], min(m, hp[1] + 2 * eighth(m)))
    text = ' '.join(' '.join(r.get('log') or []) for r in recs)
    if 'recalled' not in text:
        p.append('the switch attempt was not refused')
    if 'But it failed' not in text:
        p.append('a second Ingrain did not fail')
    if any(r.get('wCurBattleMon', 0) != 0 for r in recs if 'end' not in r):
        p.append('Venusaur left the field')
    return p


def check_aqua_ring_doubles(recs, v):
    t, p = turns(recs, v), []
    r0, r1, r2 = recs[t[0][0]], recs[t[1][0]], recs[t[2][0]]
    m = v.get(r0, P2, 'wBattleMonMaxHP', n=2); m = m[0] << 8 | m[1]
    want(p, 'P2 HP after turn 1', v.hp(r1, P2), min(m, v.hp(r0, P2) + eighth(m)))
    want(p, 'P2 HP after turn 2', v.hp(r2, P2), min(m, v.hp(r1, P2) + eighth(m)))
    want(p, 'P1 HP (no Aqua Ring)', v.hp(r2, P1), v.hp(r0, P1))
    want(p, 'Aqua Ring bit on P2', v.get(r1, P2, 'wPlayerSubStatus2')[0] >> 7 & 1, 1)
    return p


ROOT_AB = {'VENUSAUR': 'NO_ABILITY', 'PIKACHU': 'NO_ABILITY', 'SNORLAX': 'NO_ABILITY', 'VAPOREON': 'NO_ABILITY'}
CASES.update({
    'ingrain_singles': dict(
        cls='COOLTRAINERM', singles=True, abilities=ROOT_AB,
        party=[('VENUSAUR', 50, None, ['INGRAIN', 'AQUA_RING', 'RAZOR_LEAF']), ('PIKACHU', 50, None, ['SPLASH'])],
        hp={0: 40},
        trainer=[(40, 'SNORLAX', None, ['ROAR'])],
        actions=[('move', 0), ('move', 1), ('switch', 1), ('move', 0)] + [('move', 2)] * 60,
        check=lambda recs, v: check_ingrain_singles(recs, v),
        result=WIN),
    'aqua_ring_doubles': dict(  # P2 uses Aqua Ring; only P2 heals
        cls='COOLTRAINERM', abilities=ROOT_AB,
        party=[('PIKACHU', 50, None, ['SPLASH', 'THUNDERBOLT']), ('VAPOREON', 50, None, ['AQUA_RING', 'SPLASH', 'SURF'])],
        hp={0: 30, 1: 40},
        trainer=[(30, 'SNORLAX', None, ['SPLASH']), (30, 'SNORLAX', None, ['SPLASH'])],
        actions=[('move', 0), ('move', 0), ('move', 0), ('move', 1)] + [('move', 1, 0), ('move', 2)] * 30,
        check=lambda recs, v: check_aqua_ring_doubles(recs, v),
        result=WIN),
})

def run_case(rom, sym, state, name, shot_dir=None, shots_dir=None):
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
    if c.get('fixed_damage'):  # no damage rolls, no crits
        for f in ('BattleCommand_DamageVariation', 'BattleCommand_Critical'):
            g.poke_rom(g.rom_addr(f), [0xC9])
    g.clear_bag()
    g.set_party(c['party'], c.get('items', ()))
    psize = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    for i in c.get('faint', ()):
        g.wr16(f'wPartyMon1HP+{i * psize}', 0)
    for i, hp in c.get('hp', {}).items():
        g.wr16(f'wPartyMon1HP+{i * psize}', hp)
    g.seed()
    g.set_trainer(c['cls'], 'Doubles', c['trainer'], doubles=not c.get('singles'))
    g.seed()
    g.start_battle(c['cls'], c.get('options', 0x01 | bt.SCENE_OFF))
    problems = []
    rd = slot_reader(g)
    ex = c.get('expect')

    def first():
        def want(what, got, exp):
            if got != exp:
                problems.append(f'{what}: {got} (expected {exp})')
        want('wDoubleBattle', bool(g.rd('wDoubleBattle')), not c.get('singles'))
        if c.get('setup'):
            c['setup'](g)
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

    b = DoublesBattle(g, list(c['actions']), first, c.get('force_switch'), c.get('force_target'),
                      c.get('singles', False))
    if shots_dir:
        b.shots = os.path.join(shots_dir, name)
        os.makedirs(b.shots, exist_ok=True)
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
    if c.get('check'):
        try:
            problems += c['check'](recs, View(g))
        except Exception as e:
            problems.append(f'check: {type(e).__name__}: {e}')
    return problems, recs


def main():
    args = sys.argv[1:]
    opts = {}
    for k in ('--shot', '--shots', '--records'):
        if k in args:
            i = args.index(k)
            opts[k] = args[i + 1]
            del args[i:i + 2]
    rom, sym, state = args[:3]
    names = args[3:] or list(CASES)
    bad, out = 0, {}
    for n in names:
        try:
            problems, recs = run_case(rom, sym, state, n, opts.get('--shot'), opts.get('--shots'))
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
