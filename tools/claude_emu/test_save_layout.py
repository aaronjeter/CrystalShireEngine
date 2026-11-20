"""The save layout (engine/menus/save.asm, ram/sram.asm).

Saving writes the bank-2 block (wPlayerData2) and the character bytes
(wCrystalData, now part of wPlayerData) into both copies; loading brings them
back from the main copy, or from the backup when the main copy is bad; a
save from an older layout is refused with a message on the main menu; a
Hall of Fame entry stays inside the 20-team block.

usage: test_save_layout.py ROM SYM STATE
"""
import os
import sys
import tempfile
import test_facility as T
from harness import H

ROM, SYM, STATE = sys.argv[1:4]
check = T.check


def call(g, name, frames=60):
    g.script(g.call(name), frames)


def main():
    g = T.G(ROM, None, SYM)
    g.load(STATE)
    g.frames(60)
    n2 = g.sym['wPlayerData2End'][1] - g.sym['wPlayerData2'][1]
    marker = [(i * 29 + 3) & 0xff for i in range(n2)]
    g.wr('wPlayerData2', marker)
    g.wr('wPlayerCharacter', [3])
    g.wr('wd474', [0x5a])
    call(g, 'SaveGameData', 240)
    check('save: the bank-2 block is in the main copy', g.rd('sPlayerData2', n2) == marker)
    check('save: the bank-2 block is in the backup copy', g.rd('sBackupPlayerData2', n2) == marker)
    a, b = g.sym['sSaveData'][1], g.sym['sSaveDataEnd'][1]
    total = sum(g.rd('sSaveData', b - a)) & 0xffff
    ck = g.rd('sChecksum', 2)
    check('save: the main checksum covers it', ck[0] | ck[1] << 8 == total)
    check('save: check values are the new ones',
          g.rd('sCheckValue1') == g.const('SAVE_CHECK_VALUE_1') and g.rd('sCheckValue2') == g.const('SAVE_CHECK_VALUE_2'))

    # load from the main copy
    g.wr('wPlayerData2', [0] * n2)
    g.wr('wPlayerCharacter', [0])
    g.wr('wd474', [0])
    call(g, 'TryLoadSaveFile', 240)
    check('load: the bank-2 block comes back', g.rd('wPlayerData2', n2) == marker)
    check('load: the character bytes come back', g.rd('wPlayerCharacter') == 3 and g.rd('wd474') == 0x5a)

    # load from the backup when the main copy is bad
    c = g.rd('sChecksum', 2)
    g.wr('sChecksum', [c[0] ^ 0xff, c[1]])
    g.wr('wPlayerData2', [0] * n2)
    g.wr('wPlayerCharacter', [0])
    call(g, 'TryLoadSaveFile', 400)
    check('backup: the bank-2 block comes back', g.rd('wPlayerData2', n2) == marker)
    check('backup: the character bytes come back', g.rd('wPlayerCharacter') == 3)
    total = sum(g.rd('sSaveData', b - a)) & 0xffff
    ck = g.rd('sChecksum', 2)
    check('backup: the main copy is rewritten', ck[0] | ck[1] << 8 == total)

    # Hall of Fame: a new entry shifts the 20 teams and writes nothing past them
    after = g.sym['sHallOfFameEnd'][1]
    bank = g.sym['sHallOfFame'][0]
    ram = g.cart_ram()
    tail = [ram[bank * 0x2000 + after - 0xa000 + i] for i in range(64)]
    call(g, 'AddHallOfFameEntry', 120)
    ram = g.cart_ram()
    tail2 = [ram[bank * 0x2000 + after - 0xa000 + i] for i in range(64)]
    check('Hall of Fame: nothing written past the 20 teams', tail == tail2)

    # an older save (old check value at sCheckValue1) is refused with a message
    path = os.path.join(tempfile.mkdtemp(), 'old.sav')
    g.wr('sCheckValue1', [g.const('OLD_SAVE_CHECK_VALUE_1')])
    g.wr('sBackupCheckValue1', [0])
    open(path, 'wb').write(bytes(g.cart_ram()) + bytes(48))
    o = H(ROM, path, SYM)
    o.frames(400)
    seen = ''
    for _ in range(8):
        o.press('A', after=60)
        seen += o.screen_text()
        if 'older' in seen:
            break
    check('old save: the main menu says it can\'t be loaded', 'older' in seen, seen[-120:])
    text = ''
    for _ in range(6):
        o.press('A', after=60)
        text = o.screen_text()
        if 'New Game' in text:
            break
    check('old save: no Continue on the menu', 'Continue' not in text and 'New Game' in text, text)

    bad = [x for x, ok in T.RESULTS if not ok]
    print(f'{len(T.RESULTS) - len(bad)}/{len(T.RESULTS)} passed')
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
