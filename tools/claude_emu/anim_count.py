"""Count battle animations in double battles (needs a build with -D ANIM_LOG).

PlayBattleAnim logs each wFXAnimID into wAnimLog (a 16-entry ring; wAnimLogCount counts calls).
This driver reads the ring after every screen the battle driver settles on.

    python3 anim_count.py ROM.gbc ROM.sym STATE [case ...]

A spread move must animate once per use ("used <MOVE>" in the text), however many foes it hits;
an each-foe entrance ability's animation must play once per battler entering with it.
"""
import re, sys
import battle_test as bt
import test_doubles as td

ANIMS = {}


def load_names():
    n = 0
    for line in open(f'{bt.CSE}/constants/move_constants.asm', encoding='latin-1'):
        m = re.match(r'\s*const_def\s*(-?\d+)?', line)
        if m:
            n = int(m.group(1)) if m.group(1) else 0
            step = -1 if m.group(1) else 1
            continue
        m = re.match(r'\s*const (\w+)', line)
        if m:
            ANIMS[n & 0xFFFF] = m.group(1)
            n += step
            if m.group(1) == 'ANIM_IN_HAIL':
                break


class CountingBattle(td.DoublesBattle):
    def settle(self, *a, **k):
        t = super().settle(*a, **k)
        g = self.g
        if not hasattr(self, 'events'):
            self.events, self.seen = [], 0
        cnt = g.rd('wAnimLogCount')
        new = (cnt - self.seen) & 0xFF
        if new > 16:
            self.events.append('OVERFLOW')
        elif new:
            raw = g.rd('wAnimLog', 32)
            for i in range(self.seen, self.seen + new):
                j = (i & 15) * 2
                self.events.append(ANIMS.get(raw[j] | raw[j + 1] << 8, f'${raw[j] | raw[j + 1] << 8:04x}'))
        self.seen = cnt
        return t


MOVES_DMG = ['SURF', 'BLIZZARD', 'EARTHQUAKE', 'SWIFT', 'ROCK_SLIDE', 'POWDER_SNOW', 'ICY_WIND',
             'MAGNITUDE', 'TWISTER', 'HEAT_WAVE', 'ERUPTION', 'HYPER_VOICE', 'AIR_CUTTER',
             'WATER_SPOUT', 'MUDDY_WATER', 'FAERIEGLEAM', 'SLUDGE_WAVE', 'SNARL']
NOAB = {'MEW': 'NO_ABILITY', 'CHANSEY': 'NO_ABILITY', 'GYARADOS': 'NO_ABILITY', 'RATTATA': 'NO_ABILITY',
        'PIDGEY': 'NO_ABILITY'}


def case(moves, uses, foes, lead='MEW', abilities=None, expect=None):
    ab = dict(NOAB)
    ab.update(abilities or {})
    acts = []
    for u in uses:
        acts += [('move', u), ('move', 0)]
    return dict(cls='COOLTRAINERM', party=[(lead, 100, None, moves), ('MEW', 100, None, ['SPLASH'])],
                trainer=foes, abilities=ab, actions=acts, options=0x01, result=td.WIN,
                expect=None, expect_anims=expect or {})


CHANSEYS = [(40, 'CHANSEY', None, ['SPLASH']), (40, 'CHANSEY', None, ['SPLASH'])]
RATTATAS = [(5, 'RATTATA', None, ['SPLASH']), (5, 'RATTATA', None, ['SPLASH'])]
CASES = {}
for i in range(0, len(MOVES_DMG), 4):
    mv = MOVES_DMG[i:i + 4]
    CASES['spread_' + mv[0].lower()] = case(mv, list(range(len(mv))) * 2, CHANSEYS)
CASES['spread_status'] = case(['SURF', 'TAIL_WHIP', 'LEER', 'GROWL'], [1, 2, 3], CHANSEYS)
CASES['spread_status2'] = case(['SURF', 'STRING_SHOT', 'SWEET_SCENT', 'RAZOR_WIND'], [1, 2, 3], CHANSEYS)
TOUGH = [(70, 'CHANSEY', None, ['SPLASH']), (70, 'CHANSEY', None, ['SPLASH'])]
CASES['spread_more'] = case(['SWIFT', 'POWDER_SNOW', 'ICY_WIND', 'MAGNITUDE'], [0, 1, 2, 3], TOUGH)
CASES['spread_more2'] = case(['HYPER_VOICE', 'FAERIEGLEAM'], [0, 1], TOUGH)
# the first target (E1) is immune: the animation plays once, on the pass that hits
CASES['spread_immune_first'] = case(['SURF', 'EARTHQUAKE'], [1],
                                    [(20, 'PIDGEY', None, ['SPLASH']), (20, 'RATTATA', None, ['SPLASH'])])
# the enemy's spread move on both player mons
CASES['spread_enemy'] = case(['SPLASH', 'SURF'], [0, 1],
                             [(30, 'RATTATA', None, ['SURF']), (30, 'RATTATA', None, ['GROWL'])])
CASES['spread_explosion'] = case(['EXPLOSION'], [0], RATTATAS)
CASES['entrance_intimidate'] = case(['SURF'], [], RATTATAS, lead='GYARADOS',
                                    abilities={'GYARADOS': 'ABILITY_INTIMIDATE'}, expect={'LEER': 1})
CASES['entrance_leech'] = case(['SURF'], [], RATTATAS, abilities={'MEW': 'ABILITY_LEECH'},
                               expect={'LEECH_SEED': 1})

# weather: one animation per end-of-turn message, however many battlers it hurts (Oct 27, 2026)
WEATHER_TEXT = {'ANIM_IN_SANDSTORM': r'SANDSTORM\s*RAGES', 'ANIM_IN_HAIL': r'HAIL\s*CONTINUES'}
for w, mv in (('sandstorm', 'SANDSTORM'), ('hail', 'HAIL')):
    CASES[f'weather_{w}'] = case([mv, 'SURF'], [0, 1, 1], CHANSEYS)
    CASES[f'weather_{w}_singles'] = dict(case([mv, 'SURF'], [0, 1, 1], CHANSEYS[:1]), singles=True,
                                         actions=[('move', 0), ('move', 1), ('move', 1)])


def run(rom, sym, state, name):
    c = CASES[name]
    td.CASES[name] = c
    battles = []
    orig = td.DoublesBattle

    class B(CountingBattle):
        def __init__(self, *a, **k):
            super().__init__(*a, **k)
            battles.append(self)
    td.DoublesBattle = B
    try:
        problems, recs = td.run_case(rom, sym, state, name)
    finally:
        td.DoublesBattle = orig
    b = battles[0]
    ev = getattr(b, 'events', [])
    text = ' '.join(' '.join(r.get('log') or []) for r in recs).replace('\n', ' ')
    if 'OVERFLOW' in ev:
        problems.append('animation log overflowed')
    for mv in {m for (_, _, _, ms) in c['party'][:1] + c['trainer'] for m in ms} - {'SPLASH'}:
        uses = len(re.findall(r'used\s+' + mv.replace('_', r'\s*'), text.upper()))
        if uses and ev.count(mv) != uses:
            problems.append(f'{mv}: {ev.count(mv)} animations for {uses} uses')
    for anim, pat in WEATHER_TEXT.items():
        n = len(re.findall(pat, text.upper()))
        if (n or ev.count(anim)) and ev.count(anim) != n:
            problems.append(f'{anim}: {ev.count(anim)} animations for {n} weather messages')
    for mv, n in c['expect_anims'].items():
        if ev.count(mv) != n:
            problems.append(f'{mv}: {ev.count(mv)} animations (expected {n})')
    return problems, ev


def main():
    rom, sym, state = sys.argv[1:4]
    load_names()
    bad = 0
    for n in sys.argv[4:] or list(CASES):
        try:
            problems, ev = run(rom, sym, state, n)
        except Exception as e:
            problems, ev = [f'{type(e).__name__}: {e}'], []
        print(('PASS ' if not problems else 'FAIL ') + n, flush=True)
        for p in problems:
            print('   ', p)
        print('    anims:', ' '.join(ev), flush=True)
        bad += bool(problems)
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
