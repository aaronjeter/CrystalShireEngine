SECTION "Scratch", SRAM

UNION
sScratch:: ds $60 tiles

NEXTU
sEnemyFrontPicTileCount:: db
sPaddedEnemyFrontPic:: ds 7 * 7 tiles

ENDU

SECTION "SRAM Bank 0", SRAM

sRTCStatusFlags:: db
	ds 7
sLuckyNumberDay:: db
sLuckyIDNumber::  dw

SECTION "Saved 16-bit conversion tables", SRAM
; the Pokémon index table isn't stored here to improve save data packing
sMoveIndexTable:: ds wMoveIndexTableEnd - wMoveIndexTable
sBackupMoveIndexTable:: ds wMoveIndexTableEnd - wMoveIndexTable
sItemIndexTable:: ds wItemIndexTableEnd - wItemIndexTable
sBackupItemIndexTable:: ds wItemIndexTableEnd - wItemIndexTable

SECTION "Backup Save", SRAM

sBackupOptions:: ds wOptionsEnd - wOptions

sBackupCheckValue1:: db ; loaded with SAVE_CHECK_VALUE_1, used to check save corruption

sBackupSaveData::

sBackupGameData::
sBackupPlayerData::  ds wPlayerDataEnd - wPlayerData
sBackupCurMapData::  ds wCurMapDataEnd - wCurMapData
sBackupPokemonData:: ds wPokemonDataEnd - wPokemonData
sBackupPlayerData2:: ds wPlayerData2End - wPlayerData2
sBackupGameDataEnd::

sBackupPokemonIndexTable:: ds wPokemonIndexTableEnd - wPokemonIndexTable

sBackupConversionTableChecksum:: dw

sBackupSaveDataEnd::

sBackupChecksum:: dw

sBackupCheckValue2:: db ; loaded with SAVE_CHECK_VALUE_2, used to check save corruption

sStackTop:: dw

if DEF(_DEBUG)
sDebugTimeCyclesSinceLastCall:: db
endc


SECTION "Save", SRAM

sOptions:: ds wOptionsEnd - wOptions

sCheckValue1:: db ; loaded with SAVE_CHECK_VALUE_1, used to check save corruption

sSaveData::

sGameData::
sPlayerData::  ds wPlayerDataEnd - wPlayerData
sCurMapData::  ds wCurMapDataEnd - wCurMapData
sPokemonData:: ds wPokemonDataEnd - wPokemonData
sPlayerData2:: ds wPlayerData2End - wPlayerData2
sGameDataEnd::

sPokemonIndexTable:: ds wPokemonIndexTableEnd - wPokemonIndexTable

sConversionTableChecksum:: dw

sSaveDataEnd::

sChecksum:: dw

sCheckValue2:: db ; loaded with SAVE_CHECK_VALUE_2, used to check save corruption


SECTION "Box Metadata", SRAM

for n, 1, NUM_BOXES + 1
sNewBox{d:n}:: newbox sNewBox{d:n}
endr
sNewBoxEnd::

for n, 1, NUM_BOXES + 1
sBackupNewBox{d:n}:: newbox sBackupNewBox{d:n}
endr
sBackupNewBoxEnd::

sWritingBackup:: db ; 1 if we're saving, anything else if not.

	ds $ff


SECTION "SRAM Hall of Fame", SRAM

sHallOfFame::
; sHallOfFame1 - sHallOfFame30
for n, 1, NUM_HOF_TEAMS + 1
sHallOfFame{d:n}:: hall_of_fame sHallOfFame{d:n}
endr
sHallOfFameEnd::


SECTION "PokeDB Bank 1", SRAM

sNewBoxMons1:: pokedb sNewBoxMons1, MONDB_ENTRIES


SECTION "PokeDB Bank 2", SRAM

sNewBoxMons2:: pokedb sNewBoxMons2, MONDB_ENTRIES



SECTION "SRAM Facility", SRAM, BANK[1]

sFacilityRunning:: db ; TRUE while sFacilityParty holds the party during a challenge
sFacilityParty:: ds wPartyMonNicknamesEnd - wPartyCount ; wPartyCount to wPartyMonNicknamesEnd
; the 16-bit indexes of each kept Pokémon's species, item and moves (their 8-bit IDs can be
; reassigned while the party is out of WRAM)
sFacilityIndexes:: ds PARTY_LENGTH * (MON_MOVES + NUM_MOVES) * 2


SECTION "SRAM Save Extension", SRAM, BANK[0]

sSaveExtensionMagic:: ds 2 ; SAVE_EXTENSION_MAGIC_1, SAVE_EXTENSION_MAGIC_2 when sSaveExtension is valid
sSaveExtension:: ds SAVE_EXTENSION_LENGTH ; wSaveExtension
sSaveExtensionChecksum:: dw
