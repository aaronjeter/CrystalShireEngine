#!/usr/bin/env python3
"""Pick the text compression dictionary and write the files that use it.

Dialogue strings (the `text`, `line`, `next`, `page`, `para` and `cont` macros)
are assembled with the "dialog" charmap. That charmap adds one-byte codes for
common substrings, and the text engine expands them again when printing
(CheckDict in home/text.asm -> TextDictionary).

This script reads every dialogue string in the source, picks the substrings
that save the most bytes, and writes:
  constants/text_dict_charmap.asm  (the "dialog" charmap entries)
  data/text/text_dictionary.asm    (the strings the decoder prints)

New or edited text is compressed automatically with the existing dictionary;
rerun this only to re-tune it:  python3 tools/make_text_dict.py
"""

import collections
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Codes for dictionary entries; all are below $80, where the decoder looks
# them up. Keep in sync with constants/charmap.asm.
# Unused in the main charmap:
FREE_CODES = [
	0x01, 0x02, 0x03, 0x04, 0x17, 0x20, 0x21, 0x4d,
	0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
	0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6f, 0x76,
	0x77, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d, 0x7e,
]
# Japanese kana only (the English font has no kana tiles, and no English text
# uses them); a dialogue byte with one of these values prints its dictionary
# string instead.
KANA_CODES = [
	0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c,
	0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x19,
	0x1a, 0x1b, 0x1c, 0x26, 0x27, 0x28, 0x29, 0x2a,
	0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31, 0x32,
	0x33, 0x34, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x40,
	0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48,
	0x72,
]
DICT_CODES = FREE_CODES + KANA_CODES

KANA_RE = re.compile(r"^[\u3000-\u30ff\u309b\u309c]+$")

# Characters a dictionary entry may contain (plain printable text only).
ALLOWED = set("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 .,!?'-é…:;&()/")

DIALOG_MACROS = ("text", "line", "next", "page", "para", "cont")
LINE_RE = re.compile(r'^\s*(?:[\w.]+:{0,2}\s+)?(' + "|".join(DIALOG_MACROS) + r')\s+(".*)$')
STRING_RE = re.compile(r'"((?:[^"\\]|\\.)*)"')


def main_charmap(entries=None):
	"""Return {string: byte} for the main charmap.
	If entries is a dict, also fill it with {byte: [strings]}."""
	cmap = {}
	depth = 0
	for line in open(os.path.join(ROOT, "constants/charmap.asm"), encoding="utf-8"):
		s = line.split(";")[0].strip()
		if s.startswith("pushc"):
			depth += 1
		elif s.startswith("popc"):
			depth -= 1
		elif s.startswith("INCLUDE"):
			continue
		m = re.match(r'charmap\s+"((?:[^"\\]|\\.)*)",\s*\$([0-9a-fA-F]+)', s)
		if m and depth == 0:
			cmap.setdefault(m.group(1), int(m.group(2), 16))
			if entries is not None:
				entries.setdefault(int(m.group(2), 16), []).append(m.group(1))
	return cmap


def dialog_strings():
	out = []
	for root, dirs, files in os.walk(ROOT):
		dirs[:] = [d for d in dirs if not d.startswith(".")]
		for f in files:
			if not f.endswith(".asm"):
				continue
			for line in open(os.path.join(root, f), encoding="utf-8", errors="replace"):
				m = LINE_RE.match(line)
				if not m:
					continue
				for s in STRING_RE.findall(m.group(2)):
					if "{" in s or "\\" in s:
						continue
					out.append(s)
	return out


def parse(s, keys, maxlen):
	"""Longest-match parse like rgbasm's charmap; returns a list of units."""
	units = []
	i = 0
	while i < len(s):
		for n in range(min(maxlen, len(s) - i), 0, -1):
			if s[i:i + n] in keys:
				units.append(s[i:i + n])
				i += n
				break
		else:
			units.append(s[i])  # not in the charmap; counted as one byte
			i += 1
	return units


def encoded_size(strings, keys, maxlen):
	return sum(len(parse(s, keys, maxlen)) for s in strings)


def pick(strings, cmap, count):
	base_keys = set(cmap)
	base_max = max(map(len, base_keys))
	seqs = [parse(s, base_keys, base_max) for s in strings]
	chosen = []
	marker = object()
	for _ in range(count):
		counts = collections.Counter()
		for seq in seqs:
			n = len(seq)
			for i in range(n):
				if seq[i] is marker or not all(c in ALLOWED for c in seq[i]):
					continue
				text = seq[i]
				for j in range(i + 1, min(n, i + 12)):
					u = seq[j]
					if u is marker or not all(c in ALLOWED for c in u):
						break
					text += u
					counts[text] += 1
		def value(item):
			text, c = item
			units = len(parse(text, base_keys, base_max))
			return c * (units - 1) - (units + 1)
		best, _ = max(counts.items(), key=value)
		chosen.append(best)
		# replace non-overlapping occurrences with a marker
		blen = len(parse(best, base_keys, base_max))
		target = parse(best, base_keys, base_max)
		new = []
		for seq in seqs:
			out = []
			i = 0
			while i < len(seq):
				if seq[i:i + blen] == target:
					out.append(marker)
					i += blen
				else:
					out.append(seq[i])
					i += 1
			new.append(out)
		seqs = new
	return chosen


def asm_string(s):
	return s.replace("\\", "\\\\").replace('"', '\\"')


def main():
	entries = {}
	cmap = main_charmap(entries)
	clash = [c for c in FREE_CODES if c in entries]
	clash += [c for c in KANA_CODES if not all(KANA_RE.match(e) for e in entries.get(c, []))]
	if clash:
		sys.exit("codes used by the main charmap: " + ", ".join(f"${c:02x}" for c in clash))
	strings = dialog_strings()
	keys = set(cmap)
	maxlen = max(map(len, keys))
	before = encoded_size(strings, keys, maxlen)
	words = pick(strings, cmap, len(DICT_CODES))
	words.sort(key=lambda w: (-len(w), w))
	allkeys = keys | set(words)
	after = encoded_size(strings, allkeys, max(maxlen, max(map(len, words))))
	dict_bytes = 2 * 0x80 + sum(len(parse(w, keys, maxlen)) + 1 for w in words)
	print(f"{len(strings)} dialogue strings: {before} -> {after} bytes "
		f"(saves {before - after}, dictionary {dict_bytes}, net {before - after - dict_bytes})")

	codes = dict(zip(words, DICT_CODES))
	with open(os.path.join(ROOT, "constants/text_dict_charmap.asm"), "w") as f:
		f.write("; Generated by tools/make_text_dict.py; do not edit by hand.\n")
		f.write("; The \"dialog\" charmap: the main charmap plus one-byte codes for common\n")
		f.write("; substrings (letter pairs, short words). Used by the dialogue text macros (macros/scripts/text.asm);\n")
		f.write("; expanded by CheckDict (home/text.asm) from TextDictionary.\n\n")
		f.write("pushc\n\tnewcharmap dialog, main\n")
		for w in words:
			f.write(f'\tcharmap "{asm_string(w)}", ${codes[w]:02x}\n')
		f.write("popc\n\n")
		f.write("DEF TEXT_DICT_LIMIT EQU $80 ; codes below this are looked up in TextDictionary\n")
	with open(os.path.join(ROOT, "data/text/text_dictionary.asm"), "w") as f:
		f.write("; Generated by tools/make_text_dict.py; do not edit by hand.\n")
		f.write("; Strings for the one-byte codes of the \"dialog\" charmap\n")
		f.write("; (constants/text_dict_charmap.asm). Index = code; 0 = not a code.\n\n")
		f.write("TextDictionary::\n")
		by_code = {c: w for w, c in codes.items()}
		for c in range(0x80):
			if c in by_code:
				f.write(f"\tdw .w{c:02x}\n")
			else:
				f.write("\tdw 0\n")
		f.write("\n")
		for c in sorted(by_code):
			f.write(f'.w{c:02x}: db "{asm_string(by_code[c])}@"\n')


if __name__ == "__main__":
	main()
