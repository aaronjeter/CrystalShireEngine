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

--seed-palettes writes data/pokemon/follower_palettes.asm. Species with their
own sprite get the sheet's colors (normal and shiny cells), and species with
only a menu icon keep their old menu icon colors. Species that use
another's sprite (variants, megas) get their battle palette
(data/pokemon/palettes.asm), with the two colors in the order that best matches
the sheet's. It overwrites hand edits, so only use it to start over.
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
		if name in dex or name in SHEET_EXTRAS:
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

# Sprites outside the dex-ordered rows: species -> (x, y) of its first cell.
# They have no shiny cells; their shiny colors are their old menu icon ones.
SHEET_EXTRAS = {"SYLVEON": (40, 4799)}  # first of the "EXTRA" row

def frames(sheet, entry, shiny=False):
	"""entry: a sheet entry number, or the (x, y) of an extra sprite."""
	if isinstance(entry, tuple):
		assert not shiny, "extra sprites have no shiny cells"
		x, y = entry
	else:
		x, y = slot_xy(2 * entry + shiny)
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

# --- Follower palettes ----------------------------------------------------
def battle_palettes(species):
	"""[(normal [c1, c2], shiny [c1, c2])] per species, colors as 5-bit RGB."""
	text = open(os.path.join(ROOT, "data/pokemon/palettes.asm")).read()
	body = text.split("PokemonPalettes:")[1]
	body = body[body.index("INCBIN"):]
	pals = []
	for m in re.finditer(r'INCBIN "([^"]+)", middle_colors\s*\nINCLUDE "([^"]+)"', body):
		b = open(os.path.join(ROOT, m.group(1)), "rb").read()
		normal = [[w & 31, (w >> 5) & 31, (w >> 10) & 31]
			for w in (int.from_bytes(b[k:k + 2], "little") for k in (2, 4))]
		shiny = [list(map(int, v)) for v in re.findall(r"RGB\s+(\d+),\s*(\d+),\s*(\d+)",
			open(os.path.join(ROOT, m.group(2))).read())[:2]]
		pals.append((normal, shiny))
	assert len(pals) == len(species), "palettes.asm doesn't match the species list"
	return pals

def sheet_colors(sheet, dex_number):
	"""The sheet sprite's light and dark colors (8-bit RGB)."""
	colors = set()
	for f in frames(sheet, sheet_entry(dex_number)):
		out = outside(f)
		px = f.load()
		for j in range(16):
			for i in range(16):
				c = px[i, j]
				if (i, j) not in out and 40 < max(c) and min(c) < 230:
					colors.add(c)
	lum = lambda c: 299 * c[0] + 587 * c[1] + 114 * c[2]
	mid = sorted(colors, key=lum, reverse=True)
	return (mid + mid)[:2] if mid else None

def shade_colors(sheet, dex_number, shiny=False):
	"""dex_number may also be the (x, y) of an extra sprite."""
	"""The sheet colors behind shades 1 and 2 of the converted sprite (the most
	common sheet color at the pixels that became each shade), as 5-bit RGB."""
	entry = dex_number if isinstance(dex_number, tuple) else sheet_entry(dex_number)
	gray, _ = to_gray(frames(sheet, entry))
	gpx = gray.load()
	counts = {1: {}, 2: {}}
	for n, f in enumerate(frames(sheet, entry, shiny)):
		px = f.load()
		for j in range(16):
			for i in range(16):
				s = GRAYS.index(gpx[i, 16 * n + j])
				if s in counts:
					c = px[i, j]
					counts[s][c] = counts[s].get(c, 0) + 1
	best = {s: max(cs, key=cs.get) for s, cs in counts.items() if cs}
	if not best:
		return None
	light = best.get(1, best.get(2))
	dark = best.get(2, light)
	return [[round(v * 31 / 255) for v in c] for c in (light, dark)]

def icon_palettes(species):
	"""[(normal [c1, c2], shiny [c1, c2])] per species from the old menu icon
	colors (MonMenuIconPals and the party menu's OBJ palettes), 5-bit RGB."""
	obpals = [[list(map(int, c)) for c in re.findall(r"(\d+),\s*(\d+),\s*(\d+)", line)][1:3]
		for line in open(os.path.join(ROOT, "gfx/stats/party_menu_ob.pal"))
		if line.strip().startswith("RGB")]
	names = ["RED", "BLUE", "GREEN", "BROWN", "PINK", "GRAY", "TEAL", "PURPLE"]  # PAL_ICON_*
	text = open(os.path.join(ROOT, "data/pokemon/menu_icon_pals.asm")).read()
	body = text.split("MonMenuIconPals:")[1]
	pals = [(obpals[names.index(n)], obpals[names.index(s)])
		for n, s in re.findall(r"icon_pals\s+(\w+),\s*(\w+)", body)]
	assert len(pals) == len(species), "menu_icon_pals.asm doesn't match the species list"
	return pals

def seed_palettes(sheet, species, dex):
	src = sprite_sources(species, dex)
	pals = battle_palettes(species)
	icon_pals = icon_palettes(species)
	to8 = lambda c: [v * 255 // 31 for v in c]
	dist = lambda a, b: sum((x - y) ** 2 for x, y in zip(a, b))
	rgb = lambda c: "%02d,%02d,%02d" % tuple(c)
	lines = [
		"; Overworld colors of each following Pokémon: light, dark, then the shiny",
		"; light, dark. Seeded by tools/make_follower_sprites.py --seed-palettes",
		"; from the sprite sheet's colors (battle colors for species that use another",
		"; species' sprite, old menu icon colors for species with only an icon),",
		"; then edited by hand.",
		"; The sprite's light parts use the first color and its dark parts the second;",
		"; black stays black. Species without a follower sprite are listed too, so the",
		"; table can be indexed by species.",
		"",
		"FollowerPalettes::",
		"\ttable_width PAL_COLOR_SIZE * 4",
		"\tRGB 31,31,31, 00,00,00, 31,31,31, 00,00,00 ; (no species)",
	]
	swapped = from_sheet = 0
	for k, name in enumerate(species):
		normal, shiny = pals[k]
		base = src.get(name)
		if name in SHEET_EXTRAS:
			normal = shade_colors(sheet, SHEET_EXTRAS[name])
			shiny = icon_pals[k][1]
			from_sheet += 1
		elif base == name and shade_colors(sheet, dex[base]):
			normal = shade_colors(sheet, dex[base])
			shiny = shade_colors(sheet, dex[base], shiny=True)
			from_sheet += 1
		elif not base:
			# only a menu icon: the colors it had in menus
			normal, shiny = icon_pals[k]
		else:
			light, dark = sheet_colors(sheet, dex[base])
			n8 = [to8(c) for c in normal]
			if dist(light, n8[1]) + dist(dark, n8[0]) < dist(light, n8[0]) + dist(dark, n8[1]):
				normal, shiny = normal[::-1], shiny[::-1]
				swapped += 1
		note = "" if base == name else f" (uses {base.title()}'s sprite)" if base else " (menu icon only)"
		lines.append(f"\tRGB {rgb(normal[0])}, {rgb(normal[1])}, {rgb(shiny[0])}, {rgb(shiny[1])} ; {name}{note}")
	lines.append("\tassert_table_length NUM_POKEMON + 1")
	open(os.path.join(ROOT, "data/pokemon/follower_palettes.asm"), "w").write("\n".join(lines) + "\n")
	print(f"follower_palettes.asm: {len(species)} species, {from_sheet} from the sheet, {swapped} battle palettes swapped")

def main():
	args = [a for a in sys.argv[1:] if not a.startswith("--")]
	if len(args) != 1:
		sys.exit(__doc__)
	sheet = Image.open(args[0]).convert("RGB")
	species = species_list()
	dex = dex_numbers(species)
	labels = icon_pointer_labels()[3:]

	os.makedirs(os.path.join(ROOT, "gfx/followers"), exist_ok=True)
	base = [name for name in species if name in dex or name in SHEET_EXTRAS]
	notes = {}
	for name in base:
		img, note = to_gray(frames(sheet, SHEET_EXTRAS.get(name) or sheet_entry(dex[name])))
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

	if "--seed-palettes" in sys.argv:
		seed_palettes(sheet, species, dex)

	print(f"{len(base)} sprites written")
	for name, note in notes.items():
		print(f"  {name}: {', '.join(note)}")

if __name__ == "__main__":
	main()
