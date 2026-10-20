import ctypes as C, re, os
from gb import GB, LIB
from scripts import assemble, party_script, battle_script, BASE

GB_DIRECT_ACCESS_ROM = 0
PLAYEREVENT_MAPSCRIPT = None

# ---- charmap for reading the screen
CHARS = {}
for line in open(os.environ.get("CSE", "/root/cse") + "/constants/charmap.asm", encoding="latin1"):
    m = re.match(r'\s*charmap\s+"(.+?)",\s*\$([0-9a-fA-F]{2})\b', line)
    if m and len(m.group(1)) == 1:
        CHARS.setdefault(int(m.group(2), 16), m.group(1))


class H(GB):
    def rom(self):
        size = C.c_size_t(); bank = C.c_uint16()
        p = LIB.GB_get_direct_access(self.gb, GB_DIRECT_ACCESS_ROM, C.byref(size), C.byref(bank))
        return (C.c_uint8 * size.value).from_address(p)

    def poke_rom(self, addr, data):
        r = self.rom()
        for i, b in enumerate(data):
            r[addr + i] = b

    def screen_text(self):
        t = self.rd(0xC4A0, 360)
        rows = []
        for y in range(18):
            rows.append("".join(CHARS.get(c, " ") for c in t[y * 20:(y + 1) * 20]))
        return "\n".join(rows)

    def run_script(self, body, org=BASE):
        data = assemble(body, org)
        self.poke_rom(org, data)
        self.wr("wMapReentryScriptBank", 1)
        self.wr("wMapReentryScriptAddress", [org & 0xFF, org >> 8])
        self.wr("wMapReentryScriptQueueFlag", 1)

    def in_battle(self):
        return self.rd("wBattleMode") != 0

PSN, BRN, FRZ, PAR = 1 << 3, 1 << 4, 1 << 5, 1 << 6


def at_menu(g):
    t = g.screen_text().split("\n")
    return "Fight" in t[14] and "Run" in t[16]


class Driver:
    def __init__(self, g):
        self.g = g
        self.log = []
        self.cursor = 0

    def _scan(self):
        t = self.g.screen_text().split("\n")
        msg = " ".join(x.strip() for x in t[12:18] if x.strip())
        if msg and (not self.log or self.log[-1] != msg):
            self.log.append(msg)

    def turn(self, slot=0, pre=None, max_steps=200):
        """Choose move `slot` from the battle menu and run the turn until the menu returns.
        Returns 'menu' or 'ended'."""
        g = self.g
        assert at_menu(g), g.screen_text()
        if pre:
            pre(g)
        g.wr("wCurMoveNum", slot)
        g.press("A", after=10)  # Fight
        self.log = []
        for _ in range(40):  # wait for the move menu to open
            g.frames(2)
            if not at_menu(g):
                break
        g.frames(12)
        g.press("A", after=10)
        for _ in range(3):  # retry if the move menu is still open
            t = g.screen_text()
            if "used" in t or not any(k in t for k in ("Special/", "Physical/", "Status/")):
                break
            g.press("A", after=10)
        for _ in range(max_steps):
            for _ in range(6):
                g.frames(5)
                self._scan()
            if not g.in_battle():
                return "ended"
            if at_menu(g):
                return "menu"
            g.press("B", hold=3, after=3)
            self._scan()
        raise RuntimeError("turn stuck:\n" + g.screen_text())

GB_DIRECT_ACCESS_VRAM = 3

def vram(g):
    size = C.c_size_t(); bank = C.c_uint16()
    p = LIB.GB_get_direct_access(g.gb, GB_DIRECT_ACCESS_VRAM, C.byref(size), C.byref(bank))
    return bytes((C.c_uint8 * size.value).from_address(p))

def oam(g):
    return [g.rd(0xFE00 + i * 4, 4) for i in range(40)]

def warp_script(mapc, x, y):
    return f"\twarp {mapc}, {x}, {y}\n\tend"
