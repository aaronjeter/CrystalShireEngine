"""The save extension (engine/menus/save_extension.asm).

Saving writes wSaveExtension to SRAM with its magic bytes and checksum, and
the main save stays valid; loading brings it back; a bad checksum or missing
magic (a save from before the extension) loads as all zeros; a new game's
WRAM reset clears it.

usage: test_save_extension.py ROM SYM STATE
"""
import sys
import test_facility as T

ROM, SYM, STATE = sys.argv[1:4]
check = T.check


def call(g, name, frames=60):
    g.script(g.call(name), frames)


def main():
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.frames(60)
    n = g.const('SAVE_EXTENSION_LENGTH')
    data = [(i * 37 + 5) & 0xff for i in range(n)]
    g.wr('wSaveExtension', data)
    call(g, 'SaveGameData', 240)
    check('save: the extension is in SRAM with its magic bytes',
          g.rd('sSaveExtension', n) == data and g.rd('sSaveExtensionMagic', 2) == [g.const('SAVE_EXTENSION_MAGIC_1'), g.const('SAVE_EXTENSION_MAGIC_2')])
    a, b = g.sym['sSaveData'][1], g.sym['sSaveDataEnd'][1]
    total = sum(g.rd('sSaveData', b - a)) & 0xffff
    ck = g.rd('sChecksum', 2)
    check('save: the main save\'s checksum still matches', ck[0] | ck[1] << 8 == total, f'{ck} vs {total:04x}')
    g.wr('wSaveExtension', [0] * n)
    call(g, 'LoadSaveExtension', 60)
    check('load: the extension comes back', g.rd('wSaveExtension', n) == data)
    g.wr('wBattlePoints', [0x12, 0x34])
    check('BP: wBattlePoints is the extension\'s first word', g.rd('wSaveExtension', 2) == [0x12, 0x34])
    # a bad checksum loads as zeros
    c = g.rd('sSaveExtensionChecksum', 2)
    g.wr('sSaveExtensionChecksum', [c[0] ^ 1, c[1]])
    call(g, 'LoadSaveExtension', 60)
    check('load: a bad checksum gives zeros', g.rd('wSaveExtension', n) == [0] * n)
    # no magic (a save from before the extension) loads as zeros
    g.wr('wSaveExtension', data)
    call(g, 'SaveGameData', 240)
    g.wr('sSaveExtensionMagic', [0, 0])
    call(g, 'LoadSaveExtension', 60)
    check('load: no magic bytes (an older save) gives zeros', g.rd('wSaveExtension', n) == [0] * n)
    # BP: added, capped at 9999
    g.wr('wBattlePoints', [0, 0])
    g.script('\tsetval 25\n' + g.call('GiveBattlePoints'), 30)
    g.script('\tsetval 200\n' + g.call('GiveBattlePoints'), 30)
    check('BP: 25 + 200 = 225', g.rd('wBattlePoints', 2) == [0, 225], str(g.rd('wBattlePoints', 2)))
    g.wr('wBattlePoints', [0x27, 0x00])  # 9984
    g.script('\tsetval 50\n' + g.call('GiveBattlePoints'), 30)
    check('BP: capped at 9999', g.rd('wBattlePoints', 2) == [0x27, 0x0f], str(g.rd('wBattlePoints', 2)))
    # new game
    g.wr('wSaveExtension', data)
    call(g, 'ClearSaveExtension', 30)
    check('new game: cleared', g.rd('wSaveExtension', n) == [0] * n)
    bad = [x for x, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
