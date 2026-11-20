#!/usr/bin/env python3
"""Convert a save file between two save layouts of this game.

    python3 tools/convert_save.py OLD.sav OLD.sym OLD.map NEW.sym NEW.map OUT.sav \
        [OLD_item_constants.asm NEW_item_constants.asm]

OLD.sym/OLD.map come from the build that wrote OLD.sav; NEW.sym/NEW.map from
the build that will load OUT.sav. Saved variables are copied by label name
(a variable that grew is zero-padded, one that shrank is cut); the per-layout
changes that can't be copied by name are in TRANSFORMS. Only the main copy
is written: the backup copy is marked invalid, and the game rebuilds it from
the main copy when the save is loaded. With the item constants given, the
map_constants.asm beside each is read too, and saved map IDs are renumbered.
"""

import os
import re
import sys

BANK_SIZE = 0x2000
SRAM_BASE = 0xa000

# Saved WRAM blocks and the SRAM copy that holds each one.
WRAM_BLOCKS = [
    ('wPlayerData', 'wPlayerDataEnd', 'sPlayerData'),
    ('wCurMapData', 'wCurMapDataEnd', 'sCurMapData'),
    ('wPokemonData', 'wPokemonDataEnd', 'sPokemonData'),
    ('wPlayerData2', 'wPlayerData2End', 'sPlayerData2'),
]
# SRAM labels filled from the WRAM blocks, or rebuilt here.
SKIP_SRAM = {
    'sPlayerData', 'sCurMapData', 'sPokemonData', 'sPlayerData2',
    'sGameData', 'sSaveData', 'sGameDataEnd', 'sSaveDataEnd',
    'sChecksum', 'sConversionTableChecksum', 'sCheckValue1', 'sCheckValue2',
}


class Layout:
    def __init__(self, sym_path, map_path):
        self.sym = {}
        self.by_addr = {}
        for line in open(sym_path, encoding='utf-8', errors='replace'):
            m = re.match(r'([0-9a-fA-F]{2}):([0-9a-fA-F]{4}) (\S+)', line)
            if not m:
                continue
            bank, addr, name = int(m[1], 16), int(m[2], 16), m[3]
            self.sym[name] = (bank, addr)
        # SRAM/WRAMX section bounds from the .map file
        self.sections = []  # (kind, bank, start, end)
        kind = bank = None
        for line in open(map_path, encoding='utf-8', errors='replace'):
            m = re.match(r'(SRAM|WRAMX|WRAM0) bank #(\d+):', line)
            if m:
                kind, bank = m[1], int(m[2])
                continue
            if re.match(r'\S', line):
                kind = None
            m = re.match(r'\s+SECTION: \$([0-9a-f]{4})(?:-\$([0-9a-f]{4}))? \(\$([0-9a-f]+) bytes?\)', line)
            if m and kind:
                start = int(m[1], 16)
                size = int(m[3], 16)
                self.sections.append((kind, bank, start, start + size))

    def addr(self, name):
        return self.sym[name]

    def sram_sizes(self):
        """Size of each SRAM label: to the next label or its section's end."""
        if hasattr(self, '_sram_sizes'):
            return self._sram_sizes
        per_bank = {}
        for n, (b, a) in self.sym.items():
            if self.kind_of(n) == 'SRAM' and 0xa000 <= a < 0xc000:
                per_bank.setdefault(b, []).append((a, n))
        sizes = {}
        for b, lst in per_bank.items():
            addrs = sorted({a for a, _ in lst})
            for a, n in lst:
                end = self.section_end('SRAM', b, a)
                if end is None:
                    continue
                nxt = [x for x in addrs if x > a]
                lim = min([end] + nxt[:1])
                sizes[n] = lim - a
        self._sram_sizes = sizes
        return sizes

    def section_end(self, kind, bank, addr):
        for k, b, s, e in self.sections:
            if k == kind and b == bank and s <= addr < e:
                return e
        return None

    def fields(self, kind, bank, start, end):
        """Labels in [start, end) of one bank, with sizes (to the next address)."""
        names = [(a, n) for n, (b, a) in self.sym.items()
                 if b == bank and start <= a < end and self.kind_of(n) == kind]
        addrs = sorted({a for a, _ in names} | {end})
        size = {a: addrs[i + 1] - a for i, a in enumerate(addrs[:-1])}
        return [(n, a, size[a]) for a, n in sorted(names)]

    @staticmethod
    def kind_of(name):
        if name.startswith('s'):
            return 'SRAM'
        if name.startswith('w'):
            return 'WRAM'
        return None


class Sram:
    def __init__(self, data):
        self.data = bytearray(data)

    def off(self, bank, addr):
        return bank * BANK_SIZE + addr - SRAM_BASE

    def read(self, bank, addr, n):
        o = self.off(bank, addr)
        return bytes(self.data[o:o + n])

    def write(self, bank, addr, b):
        o = self.off(bank, addr)
        self.data[o:o + len(b)] = b


def checksum(b):
    return sum(b) & 0xffff


# Stage-specific changes (each takes old, new layouts and the WRAM images).
OLD_PHONE_TO_NEW = {0: 0, 1: 1, 3: 2, 4: 3, 8: 4, 9: 5, 37: 6}


def t_phone_list(old, new, owram, nwram, notes):
    if 'wPhoneList' not in nwram:
        return
    lst = bytearray(nwram['wPhoneList'])
    out = [OLD_PHONE_TO_NEW[c] for c in lst if c in OLD_PHONE_TO_NEW and c]
    dropped = [c for c in lst if c and c not in OLD_PHONE_TO_NEW]
    lst[:] = bytes(len(lst))
    lst[:len(out)] = bytes(out)
    nwram['wPhoneList'] = bytes(lst)
    if dropped:
        notes.append(f'phone list: dropped old contacts {dropped}')


# Before the batch, the Nuzlocke "used" bits of landmarks 96 and up were the
# 62 event flags from EVENT_NUZLOCKE_AREA_96 (536); now they're all in
# wNuzlockeAreaFlags and those event flags are unused.
OLD_EVENT_NUZLOCKE_AREA_96 = 536
OLD_NUZLOCKE_AREA_BITS = 96


def t_nuzlocke_areas(old, new, owram, nwram, notes):
    if 'wNuzlockeAreaFlags' not in nwram or old.sym.get('wMap16Object'):
        return
    if 'wEventFlags' not in owram:
        return
    ev = bytearray(nwram['wEventFlags'])
    areas = bytearray(nwram['wNuzlockeAreaFlags'])
    moved = 0
    for i in range(62):
        n = OLD_EVENT_NUZLOCKE_AREA_96 + i
        if ev[n // 8] >> (n % 8) & 1:
            a = OLD_NUZLOCKE_AREA_BITS + i
            areas[a // 8] |= 1 << (a % 8)
            moved += 1
        ev[n // 8] &= ~(1 << (n % 8)) & 0xff
    nwram['wEventFlags'] = bytes(ev)
    nwram['wNuzlockeAreaFlags'] = bytes(areas)
    if moved:
        notes.append(f'Nuzlocke: moved {moved} area flags from event flags')


# NUM_OBJECTS 16 -> 20: the follower moves from map object 15 to 19.
EMPTY_MAP_OBJECT = bytes([0, 0, 0xff] + [0] * 13)


def t_follower_object(old, new, owram, nwram, notes):
    if 'wMap16Object' in old.sym or 'wMap19Object' not in new.sym:
        return
    size = new.addr('wMap1Object')[1] - new.addr('wPlayerObject')[1]
    b, base = new.addr('wMapObjects')
    def obj_fields(i):
        start = new.addr(f'wMap{i}Object')[1]
        return [(n, a - start, s) for n, a, s in new.fields('WRAM', b, start, start + size)]
    old_follower = owram.get('wMap15Object', b'')  # first field only; rebuild from fields
    # gather old object 15's bytes from its fields
    ob, ostart = old.addr('wMap15Object')
    oimg = bytearray(size)
    for n, a, s in old.fields('WRAM', ob, ostart, ostart + size):
        if n in owram:
            oimg[a - ostart:a - ostart + s] = owram[n][:s]
    def put(i, img):
        for n, off, s in obj_fields(i):
            nwram[n] = bytes(img[off:off + s])
    put(19, oimg)
    for i in range(15, 19):
        put(i, EMPTY_MAP_OBJECT[:size])
    masks = bytearray(nwram['wObjectMasks'])
    om = owram['wObjectMasks']
    masks[15:19] = b'\xff' * 4
    masks[19] = om[15]
    nwram['wObjectMasks'] = bytes(masks)
    notes.append('map objects: the follower moved from object 15 to 19')


# Caught data before the batch: byte 0 = level (6 bits) | time + 1 (bits 6-7,
# evening lost), byte 1 = location (7 bits) | the OT's gender (bit 7), with
# LANDMARK_GIFT/EVENT at $7e/$7f. Now: byte 0 = level (7 bits) | gender, byte 1 =
# the whole landmark (GIFT/EVENT at $fe/$ff), the time in its own byte (the
# struct's old padding byte, 10 bytes before the level byte).
def recode_caught(level_b, loc_b):
    level = level_b & 0x3f
    time = level_b >> 6
    gender = loc_b >> 7
    loc = loc_b & 0x7f
    if level == 0 and loc in (0x7e, 0x7f):
        loc |= 0x80
    return level | gender << 7, loc, time


def caught_layout_changed(old, new):
    return 'wPartyMon1Padding' in old.sym and 'wPartyMon1CaughtTime' in new.sym \
        and new.addr('wPartyMon1CaughtTime') != new.addr('wPartyMon1CaughtLevel')


def t_caught_data(old, new, owram, nwram, notes):
    if not caught_layout_changed(old, new):
        return
    n = 0
    for name in list(nwram):
        if not name.endswith('CaughtLocation'):
            continue
        p = name[:-len('CaughtLocation')]
        if p + 'CaughtLevel' not in owram:
            continue
        lv, loc, time = recode_caught(owram[p + 'CaughtLevel'][0], owram[p + 'CaughtLocation'][0])
        for alias in ('CaughtData', 'CaughtLevel', 'CaughtGender'):
            if p + alias in nwram or p + alias in new.sym:
                nwram[p + alias] = bytes([lv])
        nwram[p + 'CaughtLocation'] = bytes([loc])
        nwram[p + 'CaughtTime'] = bytes([time])
        n += 1
    notes.append(f'caught data: re-encoded {n} saved Pokémon in WRAM')


# TMs and HMs: one count byte each (75 TMs, then 7 HMs) became one bit each, TMs
# from bit 0 and HMs from bit MAX_TMS (100).
OLD_NUM_TMS, OLD_NUM_HMS, MAX_TMS = 75, 7, 100


def t_tmhm_bits(old, new, owram, nwram, notes):
    if 'wTMsHMs' not in owram or 'wTMHMPocketList' not in new.sym:
        return
    counts = owram['wTMsHMs']
    if len(counts) != OLD_NUM_TMS + OLD_NUM_HMS:
        return
    bits = bytearray(len(nwram['wTMsHMs']))
    for i, n in enumerate(counts):
        if n:
            b = i if i < OLD_NUM_TMS else MAX_TMS + i - OLD_NUM_TMS
            bits[b // 8] |= 1 << (b % 8)
    nwram['wTMsHMs'] = bytes(bits)
    notes.append(f'TMs/HMs: {sum(1 for n in counts if n)} owned, now bits')


TRANSFORMS = [t_phone_list, t_nuzlocke_areas, t_follower_object, t_caught_data, t_tmhm_bits]


def savemon_checksum(m, nick):
    """The box Pokémon checksum (ChecksumBufferMon): kept in the high bits of
    the nickname and OT characters."""
    hl = 127
    e = 0
    for i in range(nick):
        e += 1
        hl += m[i] * e
    e += 1
    for i in range(nick, len(m)):
        e += 1
        hl += (m[i] & 0x7f) * e
    hl &= 0xffff
    out = bytearray(m)
    for i in range(nick, len(m)):
        out[i] = (m[i] & 0x7f) | ((hl >> 15) & 1) << 7
        hl = (hl << 1) & 0xffff
    return bytes(out)


def s_caught_data(old, new, osr, nsr, notes):
    if not caught_layout_changed(old, new):
        return
    ob, obase = old.addr('sNewBoxMons1Mon1')
    olen = old.addr('sNewBoxMons1Mon2')[1] - obase
    onick = old.addr('sNewBoxMons1Mon1Nickname')[1] - obase
    olv = old.addr('sNewBoxMons1Mon1CaughtLevel')[1] - obase
    nb, nbase = new.addr('sNewBoxMons1Mon1')
    nlen = new.addr('sNewBoxMons1Mon2')[1] - nbase
    nnick = new.addr('sNewBoxMons1Mon1Nickname')[1] - nbase
    nlv = new.addr('sNewBoxMons1Mon1CaughtLevel')[1] - nbase
    ntime = new.addr('sNewBoxMons1Mon1CaughtTime')[1] - nbase
    assert (olen, onick, olv) == (nlen, nnick, nlv)
    count = 0
    for db in ('sNewBoxMons1', 'sNewBoxMons2'):
        n = 1
        while f'{db}Mon{n}' in new.sym:
            ob, oa = old.addr(f'{db}Mon{n}')
            m = osr.read(ob, oa, olen)
            n += 1
            if not any(m) or savemon_checksum(m, onick) != m:
                continue  # an unused slot
            m = bytearray(m)
            lv, loc, time = recode_caught(m[olv], m[olv + 1])
            m[olv], m[olv + 1], m[ntime] = lv, loc, time
            bb, ba = new.addr(f'{db}Mon{n - 1}')
            nsr.write(bb, ba, savemon_checksum(bytes(m), nnick))
            count += 1
    notes.append(f'caught data: re-encoded {count} boxed Pokémon')


# ---- items: the Pack's new pockets (item indexes renumbered by ID block)
def item_indexes(constants_path):
    """{item constant: 16-bit index} from constants/item_constants.asm."""
    v = 0
    out = {}
    for line in open(constants_path, encoding='utf-8', errors='replace'):
        line = line.split(';')[0].strip()
        if not line:
            continue
        t = line.split()
        if t[0] == 'const_def':
            v = int(t[1], 0) if len(t) > 1 and not t[1].startswith(',') else 0
        elif t[0] == 'const_align':
            n = 1 << int(t[1])
            v = (v + n - 1) // n * n
        elif t[0] == 'const_skip':
            v += int(t[1]) if len(t) > 1 else 1
        elif t[0] == 'const':
            out[t[1]] = v
            v += 1
        elif t[0] == 'add_tm':
            out['TM_' + t[1]] = v
            v += 1
        elif t[0] == 'add_hm':
            out['HM_' + t[1]] = v
            v += 1
    return out


class ItemMap:
    def __init__(self, old_consts, new_consts):
        o = item_indexes(old_consts)
        n = item_indexes(new_consts)
        self.map = {}
        for name, i in o.items():
            self.map[i] = n.get(name)  # None: removed (Mail)
        self.dropped = set()

    def __call__(self, i):
        if i == 0:
            return 0
        j = self.map.get(i)
        if j is None:
            self.dropped.add(i)
            return 0
        return j


ITEMS = None  # set in main()

# the new Pack lists by the high byte of the item index
NEW_LISTS = {0: ('wNumItems', 'wItems', 2), 1: ('wNumMedicine', 'wMedicine', 2), 2: ('wNumBerries', 'wBerries', 2),
             3: ('wNumHeldItems', 'wHeldItems', 2), 4: ('wNumTrainingItems', 'wTrainingItems', 2),
             5: ('wNumTreasures', 'wTreasures', 2), 6: ('wNumKeyItems', 'wKeyItems', 1), 7: ('wNumBalls', 'wBalls', 2)}


def t_items(old, new, owram, nwram, notes):
    if ITEMS is None or 'wNumMedicine' not in new.sym:
        return
    entries = []  # (new index, quantity)
    old_items = owram['wItems'] if 'wItems' in owram else b''
    n = owram['wNumItems'][0]
    for k in range(n):
        hi, lo, q = old_items[3 * k:3 * k + 3]
        entries.append((ITEMS(hi << 8 | lo), q))
    n = owram['wNumBalls'][0]
    for k in range(n):
        lo, q = owram['wBalls'][2 * k:2 * k + 2]
        entries.append((ITEMS(old.ball_high << 8 | lo), q))
    n = owram['wNumKeyItems'][0]
    for k in range(n):
        lo = owram['wKeyItems'][k]
        entries.append((ITEMS(old.key_high << 8 | lo), 1))
    for h, (num, lst, size) in NEW_LISTS.items():
        nwram.setdefault(num, bytes(1))
        nwram.setdefault(lst, bytes(new.wsizes[lst]))
    lists = {h: [] for h in NEW_LISTS}
    for idx, q in entries:
        if not idx:
            continue
        lists[idx >> 8].append((idx & 0xff, q))
    overflow = []
    for h, (num, lst, size) in NEW_LISTS.items():
        cap = len(nwram[lst]) // size
        items = lists[h][:cap]
        overflow += [((h << 8) | lo, q) for lo, q in lists[h][cap:]]
        buf = bytearray([0xff] * len(nwram[lst]))
        for k, (lo, q) in enumerate(items):
            if size == 2:
                buf[2 * k:2 * k + 2] = bytes([lo, q])
            else:
                buf[k] = lo
        buf[size * len(items)] = 0xff
        nwram[num] = bytes([len(items)])
        nwram[lst] = bytes(buf)
    # the PC's list: 16-bit indexes; a full pocket's overflow goes there
    pc = owram['wPCItems']
    n = owram['wNumPCItems'][0]
    pcl = []
    for k in range(n):
        hi, lo, q = pc[3 * k:3 * k + 3]
        j = ITEMS(hi << 8 | lo)
        if j:
            pcl.append((j, q))
    pcl += overflow
    cap = (len(nwram['wPCItems']) - 1) // 3
    if len(pcl) > cap:
        notes.append(f'items: {len(pcl) - cap} PC entries lost (PC full)')
        pcl = pcl[:cap]
    buf = bytearray([0xff] * len(nwram['wPCItems']))
    for k, (j, q) in enumerate(pcl):
        buf[3 * k:3 * k + 3] = bytes([j >> 8, j & 0xff, q])
    nwram['wNumPCItems'] = bytes([len(pcl)])
    nwram['wPCItems'] = bytes(buf)
    notes.append(f'items: Pack entries {len(entries)} -> ' +
                 ', '.join(f'{NEW_LISTS[h][1]} {min(len(lists[h]), len(nwram[NEW_LISTS[h][1]]) // NEW_LISTS[h][2])}' for h in NEW_LISTS) +
                 f'; {len(overflow)} to the PC')


TRANSFORMS.append(t_items)


def s_items(old, new, osr, nsr, notes):
    if ITEMS is None or 'wNumMedicine' not in new.sym:
        return
    # the saved 8-bit item ID table: entry n (1-100) at offset 2n, little-endian
    for name in ('sItemIndexTable', 'sBackupItemIndexTable'):
        b, a = new.addr(name)
        for n in range(1, 101):
            lo, hi = nsr.read(b, a + 2 * n, 2)
            j = ITEMS(hi << 8 | lo)
            nsr.write(b, a + 2 * n, bytes([j & 0xff, j >> 8]))
    # boxed Pokémon's held items (16-bit: ITEM_LOW, ITEM_HIGH), then their checksums
    nb, nbase = new.addr('sNewBoxMons1Mon1')
    ln = new.addr('sNewBoxMons1Mon2')[1] - nbase
    nick = new.addr('sNewBoxMons1Mon1Nickname')[1] - nbase
    ilo = new.addr('sNewBoxMons1Mon1ItemLow')[1] - nbase
    ihi = new.addr('sNewBoxMons1Mon1ItemHigh')[1] - nbase
    count = 0
    for db in ('sNewBoxMons1', 'sNewBoxMons2'):
        n = 1
        while f'{db}Mon{n}' in new.sym:
            b, a = new.addr(f'{db}Mon{n}')
            n += 1
            m = nsr.read(b, a, ln)
            if not any(m) or savemon_checksum(m, nick) != m:
                continue
            i = m[ihi] << 8 | m[ilo]
            j = ITEMS(i)
            if j == i:
                continue
            m = bytearray(m)
            m[ilo], m[ihi] = j & 0xff, j >> 8
            nsr.write(b, a, savemon_checksum(bytes(m), nick))
            count += 1
    notes.append(f'items: index table remapped; {count} boxed Pokémon held items renumbered')
    if ITEMS.dropped:
        notes.append(f'items: dropped (removed items) {sorted(ITEMS.dropped)}')


SRAM_TRANSFORMS = [s_caught_data, s_items]


def map_ids(constants_path):
    """Map name -> (group, number) from constants/map_constants.asm."""
    ids, group, number = {}, 0, 0
    for line in open(constants_path, encoding='utf-8', errors='replace'):
        parts = line.split(';')[0].split()
        if not parts:
            continue
        if parts[0] == 'newgroup':
            group, number = group + 1, 1
        elif parts[0] == 'map_const':
            ids[parts[1].rstrip(',')] = (group, number)
            number += 1
    return ids


MAPS = None  # (old -> new) map ID dict, set when both trees' constants are given
SAVED_MAP_IDS = ['wYanmaMap', 'wDigMap', 'wBackupMap', 'wLastSpawnMap', 'wMap',
                 'wDunsparceMap', 'wRoamMon1Map', 'wRoamMon2Map', 'wRoamMon3Map',
                 'wRoamMons_CurMap', 'wRoamMons_LastMap']


def t_map_ids(old, new, owram, nwram, notes):
    """Renumber saved map IDs after maps were removed or reordered."""
    if not MAPS:
        return
    for f in SAVED_MAP_IDS:
        g, n = f + 'Group', f + 'Number'
        if g not in nwram or n not in nwram:
            continue
        key = (nwram[g][0], nwram[n][0])
        if key[0] in (0, 0xff) or key not in MAPS:
            if key[0] not in (0, 0xff):
                notes.append(f'{f}: map {key} no longer exists; left as is')
            continue
        ng, nn = MAPS[key]
        if (ng, nn) != key:
            nwram[g], nwram[n] = bytes([ng]), bytes([nn])
            notes.append(f'{f}: map {key} -> {(ng, nn)}')


TRANSFORMS.append(t_map_ids)


def main(old_sav, old_sym, old_map, new_sym, new_map, out_sav, old_items=None, new_items=None):
    global ITEMS
    old = Layout(old_sym, old_map)
    new = Layout(new_sym, new_map)
    if old_items and new_items:
        ITEMS = ItemMap(old_items, new_items)
        o = item_indexes(old_items)
        old.ball_high = o['MASTER_BALL'] >> 8
        old.key_high = o['BICYCLE'] >> 8
        global MAPS
        om = map_ids(os.path.join(os.path.dirname(old_items), 'map_constants.asm'))
        nm = map_ids(os.path.join(os.path.dirname(new_items), 'map_constants.asm'))
        MAPS = {om[k]: nm[k] for k in om if k in nm}
    raw = open(old_sav, 'rb').read()
    osr = Sram(raw[:4 * BANK_SIZE])
    trailer = raw[4 * BANK_SIZE:]
    nsr = Sram(bytes(4 * BANK_SIZE))
    notes = []

    # 1. Read the old saved WRAM blocks, field by field.
    owram = {}
    for start_l, end_l, s_l in WRAM_BLOCKS:
        if start_l not in old.sym:
            continue
        wbank, ws = old.addr(start_l)
        _, we = old.addr(end_l)
        sbank, sa = old.addr(s_l)
        for name, a, size in old.fields('WRAM', wbank, ws, we):
            owram[name] = osr.read(sbank, sa + (a - ws), size)
    # The player's character bytes were saved apart from wPlayerData before.
    if 'sCrystalData' in old.sym and 'wCrystalData' in old.sym:
        wbank, ws = old.addr('wCrystalData')
        _, we = old.addr('wCrystalDataEnd')
        sbank, sa = old.addr('sCrystalData')
        for name, a, size in old.fields('WRAM', wbank, ws, we):
            owram[name] = osr.read(sbank, sa + (a - ws), size)

    # 2. Build the new WRAM blocks by name.
    nwram = {}
    nfields = {}
    for start_l, end_l, s_l in WRAM_BLOCKS:
        wbank, ws = new.addr(start_l)
        _, we = new.addr(end_l)
        nfields[start_l] = new.fields('WRAM', wbank, ws, we)
        for name, a, size in nfields[start_l]:
            if name in owram:
                b = owram[name][:size]
                nwram[name] = b + bytes(size - len(b))
    missing = [n for blk in nfields.values() for n, a, s in blk
               if n not in owram]
    new.wsizes = {name: size for blk in nfields.values() for name, a, size in blk}
    for t in TRANSFORMS:
        t(old, new, owram, nwram, notes)

    for start_l, end_l, s_l in WRAM_BLOCKS:
        wbank, ws = new.addr(start_l)
        _, we = new.addr(end_l)
        sbank, sa = new.addr(s_l)
        img = bytearray(we - ws)
        written = set()
        for name, a, size in nfields[start_l]:
            if name in nwram and a not in written:
                img[a - ws:a - ws + size] = nwram[name]
                written.add(a)
        nsr.write(sbank, sa, bytes(img))

    # 3. Copy the other SRAM labels by name (sizes capped at section ends).
    for name, (bank, a) in new.sym.items():
        if Layout.kind_of(name) != 'SRAM' or name in SKIP_SRAM:
            continue
        if name not in old.sym or not (0xa000 <= a < 0xc000):
            continue
        obank, oa = old.addr(name)
        ns = new.sram_sizes().get(name)
        os_ = old.sram_sizes().get(name)
        if ns is None or os_ is None:
            continue
        size = min(ns, os_)
        nsr.write(bank, a, osr.read(obank, oa, size))

    # Copy SRAM labels again from the WRAM blocks' copies, which step 3 may
    # have overlapped (e.g. labels of the Save section).
    for start_l, end_l, s_l in WRAM_BLOCKS:
        wbank, ws = new.addr(start_l)
        _, we = new.addr(end_l)
        sbank, sa = new.addr(s_l)
        img = bytearray(we - ws)
        written = set()
        for name, a, size in nfields[start_l]:
            if name in nwram and a not in written:
                img[a - ws:a - ws + size] = nwram[name]
                written.add(a)
        nsr.write(sbank, sa, bytes(img))

    for t in SRAM_TRANSFORMS:
        t(old, new, osr, nsr, notes)

    # 4. Check values and checksums of the main copy; the backup is invalid.
    b1, a1 = new.addr('sCheckValue1')
    b2, a2 = new.addr('sCheckValue2')
    nsr.write(b1, a1, bytes([NEW_CHECK_1]))
    nsr.write(b2, a2, bytes([NEW_CHECK_2]))
    bb1, ab1 = new.addr('sBackupCheckValue1')
    bb2, ab2 = new.addr('sBackupCheckValue2')
    nsr.write(bb1, ab1, b'\0')
    nsr.write(bb2, ab2, b'\0')
    mb, ma = new.addr('sMoveIndexTable')
    _, me = new.addr('sBackupMoveIndexTable')
    cs = checksum(nsr.read(mb, ma, me - ma))
    cb, ca = new.addr('sConversionTableChecksum')
    nsr.write(cb, ca, cs.to_bytes(2, 'little'))
    sb, sa = new.addr('sSaveData')
    _, se = new.addr('sSaveDataEnd')
    cs = checksum(nsr.read(sb, sa, se - sa))
    kb, ka = new.addr('sChecksum')
    nsr.write(kb, ka, cs.to_bytes(2, 'little'))
    # not mid-save
    wb, wa = new.addr('sWritingBackup')
    nsr.write(wb, wa, b'\0')

    open(out_sav, 'wb').write(bytes(nsr.data) + trailer)
    for n in notes:
        print('note:', n)
    if missing:
        print('new saved variables (zeroed):', ', '.join(missing))
    lost = sorted(set(owram) - {n for blk in nfields.values() for n, a, s in blk})
    if lost:
        print('old saved variables dropped:', ', '.join(lost))


NEW_CHECK_1 = 102  # SAVE_CHECK_VALUE_1 (100 + SAVE_VERSION)
NEW_CHECK_2 = 202  # SAVE_CHECK_VALUE_2 (200 + SAVE_VERSION)

if __name__ == '__main__':
    if len(sys.argv) not in (7, 9):
        sys.exit(__doc__)
    main(*sys.argv[1:])
