"""Contact sheets of battle animations in double battles (double battles phase 5).

Plays double battles with animations on, against a harness-written doubles_trainer party
that knows the same moves as the player's two mons. Each player turn, P1 and P2 use the
same move, on E1/E2 and then on E2/E1, so every move is seen as P1->E1, P1->E2, P2->E1 and
P2->E2; the enemies use the moves the AI picks. HP and PP are refilled at every menu.
Every battle animation is captured (while hVBlank is in cutscene mode) and each move gets
one sheet: a row per attacker/target combination, MOVE_FRAMES of its distinct frames
evenly spread (the field only).

    python3 anim_sheets.py ROM.gbc ROM.sym STATE OUTDIR [MOVE ...]
    (needs ROM.map next to the .sym; without moves it plays DEFAULT_MOVES; with ANIM_ONE=1 each
    move gets its own battle, which the enemies' AI then has to use too)
"""
import os
import sys
from PIL import Image, ImageDraw
import battle_test as bt
import test_doubles as td

DEFAULT_MOVES = [
    'TACKLE', 'EMBER', 'THUNDERBOLT', 'SURF',
    'WATER_GUN', 'PSYCHIC_M', 'ROCK_SLIDE', 'QUICK_ATTACK',
    'SWIFT', 'FLAMETHROWER', 'ICE_BEAM', 'HYPER_BEAM',
    'DOUBLE_TEAM', 'GROWL', 'RAZOR_LEAF', 'SLUDGE_BOMB',
    'EARTHQUAKE', 'BITE', 'THUNDER_WAVE', 'CONFUSE_RAY',
]
MOVE_FRAMES = 8
FIELD_H = 104
TAIL = 30  # frames kept after each animation
SLOT = ['P1', 'P2', 'E1', 'E2']


class Capture:
    def __init__(self, g):
        self.g, self.seqs, self.cur, self.n = g, [], None, 0
        self.vblank = g.sym['hVBlank'][1]
        self.screen = g.sym['hDoublesScreen'][1]

    def frame(self):
        g = self.g
        on = (bt.LIB.GB_safe_read_memory(g.gb, self.vblank) in (1, 3)  # VBLANK_CUTSCENE(_CGB)
              and bt.LIB.GB_safe_read_memory(g.gb, self.screen) & 1)  # the double battle screen
        if on and self.cur is not None and self.cur.get('tail'):  # the next animation started
            self.seqs.append(self.cur)
            self.cur = None
        if on and self.cur is None:
            bt.LIB.GB_set_rendering_disabled(g.gb, False)
            fx = g.rd('wFXAnimID', 2)
            areas = g.rd('wAreaSlots', 2)
            turn = bt.LIB.GB_safe_read_memory(g.gb, g.sym['hBattleTurn'][1])
            spread = g.rd('wDoublesSpread') & 1
            user, target = (areas[0], areas[1]) if turn == 0 else (areas[1], areas[0])
            self.cur = dict(fx=fx[0] | fx[1] << 8, user=user, target=target, spread=spread, frames=[])
        elif on:
            self.n += 1
            data = bytes(g.buf)[:160 * FIELD_H * 4]  # the field (rows 0-12), not the text box
            fr = self.cur['frames']
            self.cur['n'] = self.cur.get('n', 0) + 1
            if not fr or data != self.last:  # only frames that differ from the one before
                fr.append(Image.frombuffer('RGB', (160, FIELD_H), data, 'raw', 'BGRX'))
                self.last = data
        elif self.cur is not None:
            # a few frames after the animation too (what the screen goes back to)
            self.cur['tail'] = self.cur.get('tail', 0) + 1
            if self.cur['tail'] <= TAIL:
                data = bytes(g.buf)[:160 * FIELD_H * 4]
                if data != self.last:
                    self.cur['frames'].append(Image.frombuffer('RGB', (160, FIELD_H), data, 'raw', 'BGRX'))
                    self.cur.setdefault('reps', []).append(1)
                    self.last = data
                else:
                    self.cur.setdefault('reps', [1])[-1] += 1
                return
            if self.cur['frames']:
                self.seqs.append(self.cur)
            self.cur = None
            bt.LIB.GB_set_rendering_disabled(g.gb, True)


def hook_frames(g, cap):
    raw = g.frames

    def frames(n=1):
        for _ in range(n):
            raw(1)
            cap.frame()
    g.frames = frames


class Done(Exception):
    pass


class AnimBattle(td.DoublesBattle):
    def __init__(self, g, actions, refill):
        super().__init__(g, actions)
        self.refill = refill

    def at_menu(self):
        if not self.actions:
            raise Done
        self.refill()
        super().at_menu()


def refiller(g):
    by, size = bt.swap_layout(g.rom_path, g.sym)
    base, bank = g.sym['wBattlerSlots'][1], g.sym['wBattlerSlots'][0]
    psize = g.sym['wPartyMon2'][1] - g.sym['wPartyMon1'][1]
    A = lambda s: g.sym[s][1]

    def slot_i(slot, label):
        k = max(k for k in by if k <= A(label))
        return bank * 0x1000 + base - 0xD000 + slot * size + by[k] + A(label) - k

    def slot_wr(slot, label, vals):
        w, i = g.wram_full(), slot_i(slot, label)
        for j, v in enumerate(vals):
            w[i + j] = v

    def slot_rd(slot, label, n):
        w, i = g.wram_full(), slot_i(slot, label)
        return list(w[i:i + n])

    def refill():
        for side, (mon, pp, cnt, pmon) in enumerate((('wBattleMon', 'wBattleMonPP', 'wPartyCount', 'wPartyMon1'),
                                                     ('wEnemyMon', 'wEnemyMonPP', 'wOTPartyCount', 'wOTPartyMon1'))):
            hp_off = A(mon + 'HP') - A(mon)
            mx = g.rd(mon + 'MaxHP', 2)
            g.wr(mon + 'HP', mx)
            g.wr(pp, [0x10] * 4)
            for slot in (side * 2, side * 2 + 1):
                slot_wr(slot, mon + 'HP', slot_rd(slot, mon + 'MaxHP', 2))
                slot_wr(slot, pp, [0x10] * 4)
            for i in range(g.rd(cnt)):
                g.wr16(f'{pmon}HP+{i * psize}', g.rd16(f'{pmon}MaxHP+{i * psize}'))
    return refill


def play(rom, sym, state, moves):
    g = bt.Game(rom, sym, state)
    g.rom_path = rom
    g.seed()
    g.clear_bag()
    party = [('SNORLAX', 60, None, moves)] * 3
    g.set_party(party)
    g.seed()
    g.set_trainer('COOLTRAINERM', 'Anims', [(60, 'SNORLAX', None, moves)] * 3, doubles=True)
    g.seed()
    for f in ('BattleCommand_DamageVariation', 'BattleCommand_Critical'):
        g.poke_rom(g.rom_addr(f), [0xC9])
    if os.environ.get('ANIM_ABILITY'):  # every Snorlax gets this ability (entrance abilities)
        names = [bt.re.match(r'\tabilities (\w+),', l).group(1)
                 for l in open(f'{bt.CSE}/data/abilities/species_abilities.asm') if l.startswith('\tabilities ')]
        g.poke_rom(g.rom_addr('SpeciesAbilities1') + 3 * names.index('SNORLAX'), [g.const(os.environ['ANIM_ABILITY'])] * 3)
    cap = Capture(g)
    hook_frames(g, cap)
    g.start_battle('COOLTRAINERM', 0x01)  # animations on
    acts = []
    for k in range(len(moves)):
        acts += [('move', k, 0), ('move', k, 1), ('move', k, 1), ('move', k, 0)] * (2 if len(moves) == 1 else 1)
    b = AnimBattle(g, acts, refiller(g))
    if os.environ.get('ANIM_SHOTS'):  # a screenshot at every battle menu too
        b.shots = os.path.join(os.environ['ANIM_SHOTS'], '_'.join(moves))
        os.makedirs(b.shots, exist_ok=True)
    try:
        b.run()
    except Done:
        pass
    except Exception as e:  # keep what was captured
        print('  battle stopped:', type(e).__name__, str(e).splitlines()[0] if str(e) else '', flush=True)
    if cap.cur and cap.cur['frames']:
        cap.seqs.append(cap.cur)
    ids = {g.const(f'LOW({m})') | g.const(f'HIGH({m})') << 8: m for m in moves}
    return cap.seqs, ids


def sheet(seqs, title, path):
    rows = []
    seen = set()
    for s in seqs:
        key = (s['fx'], s['user'], s['target'], s['spread'])
        if key in seen:
            continue
        seen.add(key)
        fr = s['frames']
        pick = [fr[round(i * (len(fr) - 1) / (MOVE_FRAMES - 1))] for i in range(MOVE_FRAMES)] if len(fr) >= MOVE_FRAMES else fr
        rows.append((f"{s['fx']:03x} {SLOT[s['user']]}->{'both' if s['spread'] else SLOT[s['target']]} ({s.get('n', 0)} frames, {len(fr)} distinct)", pick))
    rows.sort(key=lambda r: r[0])
    W, H = 160 * MOVE_FRAMES, (FIELD_H + 12) * len(rows) + 14
    img = Image.new('RGB', (W, H), 'white')
    d = ImageDraw.Draw(img)
    d.text((2, 1), title, fill='black')
    y = 14
    for label, pick in rows:
        d.text((2, y), label, fill='black')
        for i, f in enumerate(pick):
            img.paste(f, (160 * i, y + 12))
        y += FIELD_H + 12
    img.save(path)


def main():
    rom, sym, state, out = sys.argv[1:5]
    moves = sys.argv[5:] or DEFAULT_MOVES
    os.makedirs(out, exist_ok=True)
    step = 1 if os.environ.get('ANIM_ONE') else 4  # ANIM_ONE=1: one move per battle (the enemies use it too)
    for i in range(0, len(moves), step):
        batch = moves[i:i + step]
        seqs, ids = play(rom, sym, state, batch)
        for m in batch:
            mine = [s for s in seqs if ids.get(s['fx']) == m]
            if mine:
                sheet(mine, m, os.path.join(out, f'{m}.png'))
        others = [s for s in seqs if s['fx'] not in ids]
        if others:
            sheet(others, 'other animations ' + ' '.join(batch), os.path.join(out, f'other_{i // 4}.png'))
        print(batch, len(seqs), 'animations', flush=True)


if __name__ == '__main__':
    main()
