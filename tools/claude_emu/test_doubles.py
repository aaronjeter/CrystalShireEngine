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
    def __init__(self, g, actions, on_first=None, force_switch=None, force_target=None):
        super().__init__(g, actions)
        self.on_first, self.force_switch, self.patched = on_first, force_switch, None
        self.force_target = force_target or {}

    text_rows = slice(13, 18)  # the 5-row text box (row 12 has P2's HP numbers)

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
        if self.force_switch and len(self.records) == 0:
            self.patch_ai_switch(self.force_switch)
        elif self.patched and len(self.records) == 2:  # turn 2: the AI decides on its own again
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

    b = DoublesBattle(g, list(c['actions']), first, c.get('force_switch'), c.get('force_target'))
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
