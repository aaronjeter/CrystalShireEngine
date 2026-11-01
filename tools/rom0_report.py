#!/usr/bin/env python3
"""ROM0 (Home) analysis for CrystalShireEngine.

Usage: rom0_report.py REPO [SYM] [MAP] [--all]

For every global label in the Home section it reports:
  size, references by bank and kind, and flags that pin it to Home.
Then it computes groups of Home routines that can move together into one
ROMX bank without changing any call site ("move into bank B"), plus
routines with no references at all (dead-code candidates, verify by hand).

Reference kinds:
  call  - call/jp/jr/jmp (direct control transfer; needs Home or same bank)
  rst   - via an rst vector (pins to Home)
  far   - dba/callasm/farcall/farjp/homecall/predef (bank-aware; any bank OK)
  ptr   - dw / ld r16,X / anything else (16-bit pointer; needs Home or same bank)

Pins (must stay in Home):
  bankswitch - contains rst Bankswitch / homecall / writes hROMBank or MBC bank
  vector     - referenced from the header/rst/interrupt vectors
  fallthru   - falls into the next label (moves only together with it; grouped)
"""
import os, re, sys, collections

repo = sys.argv[1]
sym = sys.argv[2] if len(sys.argv) > 2 and not sys.argv[2].startswith('--') else os.path.join(repo, 'pokecrystal.sym')
mapf = sys.argv[3] if len(sys.argv) > 3 and not sys.argv[3].startswith('--') else os.path.join(repo, 'pokecrystal.map')
SHOW_ALL = '--all' in sys.argv

# ---- symbols ----
labels = {}  # name -> (bank, addr)
for line in open(sym, encoding='latin-1'):
    m = re.match(r'([0-9a-f]{2,3}):([0-9a-f]{4}) (\S+)', line)
    if m:
        labels[m.group(3)] = (int(m.group(1), 16), int(m.group(2), 16))

HOME_START, HOME_END = None, None
for line in open(mapf, encoding='latin-1'):
    m = re.search(r'SECTION: \$([0-9a-f]+)-\$([0-9a-f]+) \(\$[0-9a-f]+ bytes\) \["Home"\]', line)
    if m:
        HOME_START, HOME_END = int(m.group(1), 16), int(m.group(2), 16)
assert HOME_START is not None

# bank free space
bank_free = {}
cur = None
for line in open(mapf, encoding='latin-1'):
    m = re.match(r'ROMX bank #(\d+):', line)
    if m: cur = int(m.group(1))
    m = re.search(r'TOTAL EMPTY: \$([0-9a-f]+) bytes?', line)
    if m and cur is not None:
        bank_free[cur] = int(m.group(1), 16); cur = None

home = {n: a for n, (b, a) in labels.items()
        if b == 0 and HOME_START <= a <= HOME_END and '.' not in n}
home_sorted = sorted(home.items(), key=lambda x: (x[1], x[0]))
# size: distance to the next distinct address
addrs = sorted(set(home.values())) + [HOME_END + 1]
nxt = {a: addrs[i + 1] for i, a in enumerate(addrs[:-1])}
size = {n: nxt[a] - a for n, a in home.items()}

# ---- source scan ----
LABEL_RE = re.compile(r'^([A-Za-z_][\w]*)(::?)')
TOKEN_RE = re.compile(r'[A-Za-z_][\w.]*')
FAR_OPS = {'farcall', 'farjp', 'callfar', 'homecall', 'dba', 'callasm', 'memcallasm',
           'predef', 'predef_jump', 'lda_predef', 'add_predef', 'xcall', 'dbw', 'dab'}
CALL_OPS = {'call', 'jp', 'jr', 'jmp'}
BANKSWITCH_RE = re.compile(r'rst\s+Bankswitch|homecall|call\s+Bankswitch|ldh?\s+\[hROMBank\]\s*,\s*a|\[MBC3RomBank\]|\[rROMB', re.I)
TERMINAL_RE = re.compile(r'^\s*(ret|reti|jp|jr|jmp|farjp|predef_jump)\b(?!\s+(n?z|n?c)\s*,)(?!\s+(n?z|n?c)\s*$)', re.I)

def strip(line):
    out, q = [], False
    for ch in line:
        if ch == '"': q = not q; continue
        if ch == ';' and not q: break
        if not q: out.append(ch)
    return ''.join(out)

refs = collections.defaultdict(list)  # target -> [(caller_global, caller_bank, kind, file, lineno)]
home_body = collections.defaultdict(list)  # home label -> lines (stripped)
home_order = []  # labels in source order within home files

asm_files = []
for root, dirs, files in os.walk(repo):
    if '.git' in root or '/tools' in root: continue
    for f in files:
        if f.endswith('.asm') or f.endswith('.inc'):
            asm_files.append(os.path.join(root, f))

home_names = set(home)
for path in asm_files:
    rel = os.path.relpath(path, repo)
    is_home_file = rel.startswith('home/') or rel in ('home.asm',)
    cur = None
    with open(path, encoding='latin-1') as fh:
        lines = fh.readlines()
    for i, raw in enumerate(lines, 1):
        s = strip(raw)
        m = LABEL_RE.match(s)
        if m:
            cur = m.group(1)
            if is_home_file and cur in home_names:
                home_order.append(cur)
            s = s[m.end():]
        if is_home_file and cur in home_names and s.strip():
            home_body[cur].append(s.strip())
        st = s.strip()
        if not st: continue
        toks = TOKEN_RE.findall(st)
        if not toks: continue
        op = toks[0].lower()
        if op in ('macro', 'endm', 'def', 'if', 'elif', 'assert', 'static_assert', 'export', 'redef', 'section', 'include', 'incbin', 'charmap', 'newcharmap', 'setcharmap', 'opt', 'pusho', 'popo'):
            continue
        for t in toks[1:]:
            base = t.split('.')[0] if t.split('.')[0] in home_names and '.' in t else t
            if base not in home_names: continue
            if op in CALL_OPS: kind = 'call'
            elif op == 'rst': kind = 'rst'
            elif op in FAR_OPS: kind = 'far'
            else: kind = 'ptr'
            cb = labels.get(cur, (None,))[0] if cur else None
            if rel == 'home/header.asm' or (cur in ('NULL',) ): cb = 'vec'
            refs[base].append((cur, cb, kind, rel, i))

# ---- per-label analysis ----
def falls_through(name):
    body = [l for l in home_body.get(name, []) if not l.startswith('.') or ' ' in l]
    if not body: return False  # data-only / alias label
    last = body[-1]
    if last.startswith('db') or last.startswith('dw') or last.startswith('dn') or last.startswith('dt'):
        return False
    return not TERMINAL_RE.match(last)

info = {}
for n, a in home_sorted:
    rs = refs.get(n, [])
    banks = collections.Counter()
    kinds = collections.Counter()
    for (c, cb, k, f, l) in rs:
        if c == n: continue  # self references
        banks[cb] += 1; kinds[k] += 1
    body = home_body.get(n, [])
    pins = []
    if any(BANKSWITCH_RE.search(l) for l in body): pins.append('bankswitch')
    if banks.get('vec'): pins.append('vector')
    if kinds.get('rst'): pins.append('rst')
    info[n] = dict(addr=a, size=size[n], banks=banks, kinds=kinds, pins=pins,
                   fall=falls_through(n), refs=rs)

# fallthrough chains in source order (a label that falls into the next one)
order = [n for n in home_order if n in info]
seen = set(); chains = []
idx = {n: i for i, n in enumerate(order)}
for n in order:
    if n in seen: continue
    chain = [n]; seen.add(n)
    j = idx[n]
    while info[order[j]]['fall'] and j + 1 < len(order):
        j += 1; chain.append(order[j]); seen.add(order[j])
    chains.append(chain)
chain_of = {n: tuple(c) for c in chains for n in c}
# labels at the same address (aliases) belong together too
by_addr = collections.defaultdict(list)
for n, a in home.items(): by_addr[a].append(n)

# ---- movable groups: fixed point per target bank ----
def chain_refs(ch):
    out = []
    for n in ch:
        out += [(c, cb, k) for (c, cb, k, f, l) in info[n]['refs'] if c not in ch]
    return out

def chain_pins(ch):
    return sorted(set(p for n in ch for p in info[n]['pins']))

chain_list = sorted(set(chain_of.values()), key=lambda c: info[c[0]]['addr'])
movable = {}  # chain -> bank
changed = True
while changed:
    changed = False
    for ch in chain_list:
        if ch in movable or chain_pins(ch): continue
        rs = chain_refs(ch)
        if not rs: continue
        target = set()
        ok = True
        for (c, cb, k) in rs:
            if k == 'far': continue  # bank-aware reference, fine anywhere
            if cb == 0:
                cch = chain_of.get(c)
                if cch is None or cch not in movable: ok = False; break
                target.add(movable[cch])
            elif isinstance(cb, int):
                target.add(cb)
            else:
                ok = False; break
        if ok and len(target) == 1:
            movable[ch] = target.pop(); changed = True

dead = [ch for ch in chain_list if not chain_refs(ch) and not chain_pins(ch)]

# ---- output ----
def chsize(ch): return sum(info[n]['size'] for n in ch)
print(f"Home: ${HOME_START:04x}-${HOME_END:04x}, {len(home)} global labels\n")

print("== Movable into one ROMX bank (no call-site changes) ==")
tot = 0
per_bank = collections.Counter()
for ch, b in sorted(movable.items(), key=lambda x: (-chsize(x[0]))):
    s = chsize(ch); tot += s; per_bank[b] += s
    fr = bank_free.get(b, '?')
    print(f"  {s:5d} B  -> bank ${b:02x} (free {fr})  {' + '.join(ch)}")
print(f"  total {tot} bytes; per bank: " + ', '.join(f'${b:02x}:{v}' for b, v in per_bank.most_common()))

print("\n== Of those, groups that fit in their target bank right now (free >= group size) ==")
fit = collections.Counter(); fitn = []
for ch, b in sorted(movable.items(), key=lambda x: (x[1], -chsize(x[0]))):
    s = chsize(ch)
    if bank_free.get(b, 0) - fit[b] >= s:
        fit[b] += s; fitn.append((b, s, ch))
for b, s, ch in fitn:
    print(f"  {s:5d} B  -> bank ${b:02x} (free {bank_free.get(b)})  {' + '.join(ch)}")
print(f"  total {sum(fit.values())} bytes")

print("\n== No references found (dead-code candidates; verify: macros, computed jumps, debug-only) ==")
for ch in dead:
    print(f"  {chsize(ch):5d} B  {' + '.join(ch)}")

# Rarely referenced, not pinned: farcall candidates
print("\n== Not pinned, only ROMX callers in 2+ banks, <=6 call sites: farcall candidates (check hot paths) ==")
cands = []
for ch in chain_list:
    if ch in movable or ch in dead or chain_pins(ch): continue
    rs = chain_refs(ch)
    if any(k in ('ptr',) and cb not in (None,) for (c, cb, k) in rs): continue
    sites = [r for r in rs if r[2] == 'call']
    if any(cb == 0 or not isinstance(cb, int) for (c, cb, k) in sites): continue  # Home calls it: can't leave
    if 0 < len(sites) <= 6:
        cands.append((chsize(ch), ch, collections.Counter(cb for (c, cb, k) in sites)))
for s, ch, bc in sorted(cands, key=lambda x: -x[0])[:40]:
    bs = ', '.join(f"{('$%02x' % b) if isinstance(b, int) else b}x{v}" for b, v in bc.items())
    print(f"  {s:5d} B  {' + '.join(ch)}  [{bs}]")

if SHOW_ALL:
    print("\n== All Home labels ==")
    for n, a in home_sorted:
        d = info[n]
        bs = ', '.join(f"{('$%02x' % b) if isinstance(b, int) else b}x{v}" for b, v in d['banks'].most_common())
        ks = ', '.join(f"{k}{v}" for k, v in d['kinds'].items())
        print(f"  ${a:04x} {d['size']:5d} {n:32s} pins={','.join(d['pins']) or '-':16s} fall={'Y' if d['fall'] else '-'} [{ks}] {bs}")
