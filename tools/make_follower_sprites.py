#!/usr/bin/env python3
"""Import follower Pokémon sprites from the Megaman-Omega overworld sheet.

Usage:  python3 tools/make_follower_sprites.py path/to/sheet.png

Sprites by Megaman-Omega (Pokémon Prism), with additions by FrenchOrange and
LuigiTKO. See following-pokemon-plan.md in the project docs for the sheet layout.

Writes:
  gfx/followers/<species>.png  16x96, 4 grays, frames in this order:
                               down stand, down step, up stand, up step,
                               side stand, side step (side faces left).
                               The first two frames are also the menu icon.
  gfx/followers.asm            INCBINs of the compressed sprites

Species whose sprite comes from another species (variants, megas, species
that borrowed another's menu icon) are listed in data/pokemon/icon_pointers.asm;
run with --pointers to rewrite those entries from this script's mapping.
"""

import os
import re
import sys
from collections import deque

from PIL import Image

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# --- Sheet layout ---------------------------------------------------------
# 20 columns; each sheet entry takes two grid slots (normal, shiny).
# Slot s is at column s % 20, row s // 20. Rows 0-53 hold the 540 base entries.
SHEET_COLS = 20
def slot_xy(slot):
	return 40 + 58 * (slot % SHEET_COLS), 2 + 77 * (slot // SHEET_COLS)

# Extra forms that follow their species on the sheet (dex number: count).
SHEET_EXTRA_FORMS = {201: 27, 351: 3, 386: 3, 412: 2, 413: 2, 421: 1, 422: 1,
	423: 1, 479: 5, 487: 1, 492: 1}
# Entries out of dex order on the sheet (dex number: entry index).
SHEET_ENTRY_OVERRIDES = {461: 494}  # Weavile sits after Toxicroak

def sheet_entry(dex):
	if dex in SHEET_ENTRY_OVERRIDES:
		return SHEET_ENTRY_OVERRIDES[dex]
	entry = dex - 1 + sum(n for d, n in SHEET_EXTRA_FORMS.items() if d < dex)
	# Weavile was pulled out of 455-460, so those shift up by one.
	if 455 <= dex <= 460:
		entry += 1
	return entry

# --- Species -> dex number ------------------------------------------------
# The hack's species list is in dex order for 1-251 and in runs for Hoenn.
HOENN_RUNS = [("TREECKO", "BRELOOM", 252), ("MAKUHITA", "MILOTIC", 296),
	("KECLEON", "JIRACHI", 352)]
GEN4 = {"MUNCHLAX": 446, "TOGEKISS": 468, "MAMOSWINE": 473, "LEAFEON": 470,
	"GLACEON": 471, "GLISCOR": 472, "GALLADE": 475, "FROSLASS": 478,
	"HONCHKROW": 430, "WEAVILE": 461, "MAGNEZONE": 462, "TANGROWTH": 465,
	"ELECTIVIRE": 466, "MAGMORTAR": 467, "PORYGONZ": 474, "ROSERADE": 407,
	"AMBIPOM": 424, "MISMAGIUS": 429, "LICKILICKY": 463, "RHYPERIOR": 464,
	"YANMEGA": 469, "PROBOPASS": 476, "DUSKNOIR": 477}

def species_list():
	names = []
	for line in open(os.path.join(ROOT, "constants/pokemon_constants.asm")):
		m = re.match(r"\tconst (\w+)", line)
		if m:
			names.append(m.group(1))
	return names[:names.index("UNOWN_A")]

def dex_numbers(species):
	dex = {species[i]: i + 1 for i in range(251)}
	for first, last, start in HOENN_RUNS:
		a, b = species.index(first), species.index(last)
		for k in range(a, b + 1):
			dex[species[k]] = start + k - a
	dex.update(GEN4)
	return dex

# --- Icon pointers --------------------------------------------------------
def icon_pointer_labels():
	"""Labels in IconPointers, from index -3 (EGG) up."""
	labels = []
	for line in open(os.path.join(ROOT, "data/pokemon/icon_pointers.asm")):
		m = re.match(r"\s*(dba|dba_lz)\s+(\w+)", line)
		if m:
			labels.append(m.group(2))
	return labels

def follower_label(name):
	"""MR__MIME -> MrMimeFollower"""
	return "".join(part.capitalize() for part in name.split("_")) + "Follower"

def sprite_sources(species, dex):
	"""species -> base species whose sprite it uses (None = keep its icon)."""
	labels = icon_pointer_labels()[3:]  # skip -3..-1
	own_icon = {}  # base species' icon label
	for i, name in enumerate(species, start=1):
		if name in dex:
			own_icon.setdefault(re.sub(r"(Icon|Follower)$", "", labels[i]), name)
	src = {}
	for i, name in enumerate(species, start=1):
		if name in dex:
			src[name] = name
		elif name[:-1] in dex and name[-1] in "2XY":
			src[name] = name[:-1]  # "2" variants, megas
		elif name[0] in "AHG" and name[1:] in dex:
			src[name] = name[1:]  # Alolan, Hisuian, Galarian forms
		else:
			# Borrow the sprite of the species whose icon it already used.
			src[name] = own_icon.get(re.sub(r"(Icon|Follower)$", "", labels[i]))
	return src

# --- Sprite conversion ----------------------------------------------------
BORDER = (139, 62, 93)

def frames(sheet, entry):
	x, y = slot_xy(2 * entry)
	assert all(abs(a - b) <= 8 for a, b in zip(sheet.getpixel((x, y)), BORDER)), \
		f"no cell at entry {entry}"
	cells = [(x, y + 38), (x, y + 57),       # front (facing down) x2
		(x, y), (x, y + 19),                 # back (facing up) x2
		(x - 38, y + 19), (x - 19, y + 19)]  # left x2
	return [sheet.crop((cx + 1, cy + 1, cx + 17, cy + 17)) for cx, cy in cells]

def outside(frame):
	"""Pixels of the white background connected to the frame's edge."""
	px = frame.load()
	seen = set()
	todo = deque((i, j) for i in range(16) for j in (0, 15))
	todo.extend((j, i) for i in range(16) for j in (0, 15))
	while todo:
		p = todo.popleft()
		if p in seen or min(px[p]) < 230:
			continue
		seen.add(p)
		for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
			q = (p[0] + dx, p[1] + dy)
			if 0 <= q[0] < 16 and 0 <= q[1] < 16:
				todo.append(q)
	return seen

GRAYS = [255, 170, 85, 0]  # shade 0 (white/transparent) .. 3 (black)

def to_gray(frs):
	"""Map black to shade 3 and the two colors to 1 (lighter) and 2 (darker).
	White inside the outline becomes shade 0. Returns (image, notes)."""
	colors = set()
	bg = [outside(f) for f in frs]
	for f, out in zip(frs, bg):
		px = f.load()
		colors |= {px[i, j] for i in range(16) for j in range(16) if (i, j) not in out}
	def lum(c):
		return 299 * c[0] + 587 * c[1] + 114 * c[2]
	white = {c for c in colors if min(c) >= 230}
	black = {c for c in colors if max(c) <= 40}
	mid = sorted(colors - white - black, key=lum, reverse=True)
	notes = []
	if white:
		notes.append("white inside")
	if len(mid) > 2:
		notes.append(f"{len(mid)} colors")
	shade = {c: 0 for c in white}
	shade.update({c: 3 for c in black})
	for k, c in enumerate(mid):
		shade[c] = 1 if k == 0 and len(mid) > 1 else 2 if len(mid) > 1 else (1 if lum(c) > 150000 else 2)
	out = Image.new("L", (16, 16 * len(frs)), 255)
	for n, (f, o) in enumerate(zip(frs, bg)):
		px = f.load()
		for j in range(16):
			for i in range(16):
				s = 0 if (i, j) in o else shade[px[i, j]]
				out.putpixel((i, 16 * n + j), GRAYS[s])
	return out, notes

def main():
	args = [a for a in sys.argv[1:] if not a.startswith("--")]
	if len(args) != 1:
		sys.exit(__doc__)
	sheet = Image.open(args[0]).convert("RGB")
	species = species_list()
	dex = dex_numbers(species)
	labels = icon_pointer_labels()[3:]

	os.makedirs(os.path.join(ROOT, "gfx/followers"), exist_ok=True)
	base = [name for name in species if name in dex]
	notes = {}
	for name in base:
		img, note = to_gray(frames(sheet, sheet_entry(dex[name])))
		img.save(os.path.join(ROOT, "gfx/followers", name.lower() + ".png"))
		if note:
			notes[name] = note

	# gfx/followers.asm: 40 sprites per section (each <= ~400 bytes compressed).
	with open(os.path.join(ROOT, "gfx/followers.asm"), "w") as f:
		f.write("; Generated by tools/make_follower_sprites.py.\n")
		f.write("; Follower Pokémon sprites by Megaman-Omega (Pokémon Prism),\n")
		f.write("; with additions by FrenchOrange and LuigiTKO.\n")
		f.write("; The first two frames of each sprite are also its menu icon\n")
		f.write("; (see data/pokemon/icon_pointers.asm).\n")
		for k, name in enumerate(base):
			if k % 40 == 0:
				f.write(f'\nSECTION "Follower Sprites {k // 40 + 1}", ROMX\n\n')
			label = follower_label(name)
			f.write(f'{label}:: INCBIN "gfx/followers/{name.lower()}.2bpp.lz"\n')

	if "--pointers" in sys.argv:
		src = sprite_sources(species, dex)
		path = os.path.join(ROOT, "data/pokemon/icon_pointers.asm")
		lines = open(path).read().split("\n")
		idx = -3
		for n, line in enumerate(lines):
			m = re.match(r"(\s*)(dba|dba_lz)\s+(\w+)", line)
			if not m:
				continue
			if idx >= 1 and src.get(species[idx - 1]):
				name = species[idx - 1]
				target = follower_label(src[name])
				comment = "" if src[name] == name else f" ; {name.title().replace('_', '')}"
				lines[n] = f"{m.group(1)}dba_lz {target}{comment}"
			idx += 1
		open(path, "w").write("\n".join(lines))

	print(f"{len(base)} sprites written")
	for name, note in notes.items():
		print(f"  {name}: {', '.join(note)}")

if __name__ == "__main__":
	main()
