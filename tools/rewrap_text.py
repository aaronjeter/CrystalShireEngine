#!/usr/bin/env python3
"""Rewraps text blocks (text ... done/prompt) whose lines are wider than the
18-character text box. "#" counts as 4 (POKé). Paragraph breaks are kept;
blocks with text_ram or other commands are reported, not changed.

usage: rewrap_text.py FILE...   (--check: only report)
"""
import re
import sys

WIDTH = 18


def width(s):
    return len(s.replace('#', 'POKé').replace('<PLAYER>', 'PLAYERNAME'))


def wrap(words):
    lines, cur = [], ''
    for w in words:
        t = w if not cur else cur + ' ' + w
        if width(t) <= WIDTH:
            cur = t
        else:
            lines.append(cur)
            cur = w
    lines.append(cur)
    return lines


def process(path, check):
    src = open(path, encoding='utf-8').read().split('\n')
    out, i, bad = [], 0, 0
    while i < len(src):
        m = re.match(r'(\s*)text "', src[i])
        if not m:
            out.append(src[i]); i += 1; continue
        j = i
        while not re.match(r'\s*(done|prompt|text_end)\b', src[j]):
            j += 1
        block = src[i:j]
        lines = [re.match(r'\s*(text|line|cont|para|next)\s+"(.*)"\s*$', l) for l in block]
        too_wide = any(m_ and width(m_[2]) > WIDTH for m_ in lines)
        simple = all(m_ or not l.strip() for m_, l in zip(lines, block))
        if too_wide:
            bad += 1
            print(f'{path}:{i + 1}: too wide' + ('' if simple else ' (not rewrapped: has other commands)'))
        if not too_wide or not simple or check:
            out += src[i:j + 1]; i = j + 1; continue
        paras, cur = [], []
        for m_ in lines:
            if not m_:
                continue
            if m_[1] == 'para' and cur:
                paras.append(cur); cur = []
            cur += m_[2].split()
        paras.append(cur)
        # a paragraph that ends mid-sentence runs on into the next one
        merged = []
        for p in paras:
            if merged and merged[-1] and not re.search(r'[.!?:…]["\']?$', merged[-1][-1]):
                merged[-1] += p
            else:
                merged.append(p)
        paras = merged
        ind = m[1]
        new = []
        for k, p in enumerate(paras):
            if k:
                new.append('')
            for n, l in enumerate(wrap(p)):
                kw = ('text' if k == 0 else 'para') if n == 0 else 'line' if n == 1 else 'cont'
                new.append(f'{ind}{kw} "{l}"')
        out += new + [src[j]]
        i = j + 1
    if not check:
        open(path, 'w', encoding='utf-8').write('\n'.join(out))
    return bad


if __name__ == '__main__':
    check = '--check' in sys.argv
    n = sum(process(f, check) for f in sys.argv[1:] if not f.startswith('--'))
    print(f'{n} blocks too wide')
