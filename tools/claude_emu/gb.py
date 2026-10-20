import ctypes as C, os, re
from PIL import Image

LIB = C.CDLL(os.path.expanduser("~/SameBoy/build/lib/libsameboy.so"))
BOOT = os.path.expanduser("~/SameBoy/build/bin/BootROMs/cgb_boot.bin")
KEYS = {"R": 0, "L": 1, "U": 2, "D": 3, "A": 4, "B": 5, "SEL": 6, "START": 7}

LIB.GB_alloc.restype = C.c_void_p
LIB.GB_init.restype = C.c_void_p
LIB.GB_init.argtypes = [C.c_void_p, C.c_int]
for f in ["GB_load_rom", "GB_load_boot_rom", "GB_load_battery", "GB_save_state", "GB_load_state"]:
    getattr(LIB, f).argtypes = [C.c_void_p, C.c_char_p]
LIB.GB_run_frame.argtypes = [C.c_void_p]
LIB.GB_run_frame.restype = C.c_uint64
LIB.GB_read_memory.argtypes = [C.c_void_p, C.c_uint16]
LIB.GB_read_memory.restype = C.c_uint8
LIB.GB_safe_read_memory.argtypes = [C.c_void_p, C.c_uint16]
LIB.GB_safe_read_memory.restype = C.c_uint8
LIB.GB_write_memory.argtypes = [C.c_void_p, C.c_uint16, C.c_uint8]
LIB.GB_set_key_state.argtypes = [C.c_void_p, C.c_int, C.c_bool]
LIB.GB_set_pixels_output.argtypes = [C.c_void_p, C.c_void_p]
LIB.GB_get_direct_access.argtypes = [C.c_void_p, C.c_int, C.POINTER(C.c_size_t), C.POINTER(C.c_uint16)]
LIB.GB_get_direct_access.restype = C.c_void_p
LIB.GB_get_registers.argtypes = [C.c_void_p]
LIB.GB_get_registers.restype = C.POINTER(C.c_uint16 * 6)
LIB.GB_set_rendering_disabled.argtypes = [C.c_void_p, C.c_bool]
LIB.GB_set_rgb_encode_callback.argtypes = [C.c_void_p, C.c_void_p]
LIB.GB_set_log_callback.argtypes = [C.c_void_p, C.c_void_p]

RGBCB = C.CFUNCTYPE(C.c_uint32, C.c_void_p, C.c_uint8, C.c_uint8, C.c_uint8)
_rgb = RGBCB(lambda gb, r, g, b: (r << 16) | (g << 8) | b)
LOGCB = C.CFUNCTYPE(None, C.c_void_p, C.c_char_p, C.c_int)
_log = LOGCB(lambda *a: None)

GB_DIRECT_ACCESS_RAM = 1  # check enum below at runtime


class Sym:
    def __init__(self, path):
        self.d = {}
        for line in open(path, encoding="latin1"):
            m = re.match(r"([0-9a-f]+):([0-9a-f]{4}) (\S+)", line.strip())
            if m:
                self.d[m.group(3)] = (int(m.group(1), 16), int(m.group(2), 16))

    def __getitem__(self, k):
        return self.d[k]


class GB:
    def __init__(self, rom, sav=None, sym=None):
        self.gb = LIB.GB_init(LIB.GB_alloc(), 0x205)
        LIB.GB_set_log_callback(self.gb, C.cast(_log, C.c_void_p))
        LIB.GB_load_boot_rom(self.gb, BOOT.encode())
        LIB.GB_load_rom(self.gb, rom.encode())
        if sav:
            LIB.GB_load_battery(self.gb, sav.encode())
        self.buf = (C.c_uint32 * (160 * 144))()
        LIB.GB_set_rgb_encode_callback(self.gb, C.cast(_rgb, C.c_void_p))
        LIB.GB_set_pixels_output(self.gb, self.buf)
        self.sym = Sym(sym) if sym else None
        self.held = set()

    # --- timing / input
    def frames(self, n=1):
        for _ in range(n):
            LIB.GB_run_frame(self.gb)

    def press(self, key, hold=4, after=8):
        LIB.GB_set_key_state(self.gb, KEYS[key], True)
        self.frames(hold)
        LIB.GB_set_key_state(self.gb, KEYS[key], False)
        self.frames(after)

    def hold(self, key, on):
        LIB.GB_set_key_state(self.gb, KEYS[key], on)

    # --- memory
    def wram_full(self):
        size = C.c_size_t(); bank = C.c_uint16()
        p = LIB.GB_get_direct_access(self.gb, GB_DIRECT_ACCESS_RAM, C.byref(size), C.byref(bank))
        return (C.c_uint8 * size.value).from_address(p)

    def _addr(self, name_or_addr):
        if isinstance(name_or_addr, str):
            name, off = (name_or_addr.split("+") + ["0"])[:2]
            bank, addr = self.sym[name.strip()]
            return bank, addr + int(off, 0)
        return None, name_or_addr

    def rd(self, a, n=1):
        bank, addr = self._addr(a)
        out = []
        for i in range(n):
            x = addr + i
            if 0xD000 <= x < 0xE000 and bank is not None:
                out.append(self.wram_full()[bank * 0x1000 + (x - 0xD000)])
            elif 0xC000 <= x < 0xD000:
                out.append(self.wram_full()[x - 0xC000])
            else:
                out.append(LIB.GB_safe_read_memory(self.gb, x))
        return out[0] if n == 1 else out

    def rd16(self, a):  # big-endian
        h, l = self.rd(a, 2)
        return (h << 8) | l

    def wr(self, a, vals):
        if isinstance(vals, int):
            vals = [vals]
        bank, addr = self._addr(a)
        for i, v in enumerate(vals):
            x = addr + i
            if 0xD000 <= x < 0xE000 and bank is not None:
                self.wram_full()[bank * 0x1000 + (x - 0xD000)] = v & 0xFF
            elif 0xC000 <= x < 0xD000:
                self.wram_full()[x - 0xC000] = v & 0xFF
            else:
                LIB.GB_write_memory(self.gb, x, v & 0xFF)

    def wr16(self, a, v):
        self.wr(a, [(v >> 8) & 0xFF, v & 0xFF])

    def pc(self):
        return LIB.GB_get_registers(self.gb).contents[5]

    # --- state / screen
    def save(self, path):
        assert LIB.GB_save_state(self.gb, path.encode()) == 0

    def load(self, path):
        assert LIB.GB_load_state(self.gb, path.encode()) == 0

    def shot(self, path, scale=2):
        img = Image.new("RGB", (160, 144))
        img.putdata([((p >> 16) & 255, (p >> 8) & 255, p & 255) for p in self.buf])
        img.resize((160 * scale, 144 * scale), Image.NEAREST).save(path)
