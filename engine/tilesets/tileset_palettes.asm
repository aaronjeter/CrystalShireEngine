LoadSpecialMapPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr z, .darkness

.not_dark
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER_INSIDE
	jr z, .battle_tower_inside
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_SILVER
	jr z, .silver
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_HOUSE_HOENN
	jr z, .house_hoenn
	cp TILESET_CENTER
	jr z, .center
	cp TILESET_CENTER_KANTO
	jr z, .center_kanto
	cp TILESET_CENTER_JOHTO
	jr z, .center_johto
	cp TILESET_MART_PC
	jr z, .mart
	cp TILESET_MART_JOHTO
	jr z, .mart_johto
	cp TILESET_MART_KANTO
	jr z, .mart_kanto
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	jr .do_nothing

.darkness
	call LoadDarknessPalette
	scf
	ret

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower_inside
	call LoadBattleTowerInsidePalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.silver
	call LoadSilverPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.house_hoenn
	call LoadHoennHousePalette
	scf
	ret

.center
	call LoadCenterPalette
	scf
	ret

.center_kanto
	call LoadKantoCenterPalette
	scf
	ret

.center_johto
	call LoadJohtoCenterPalette
	scf
	ret

.mart
	call LoadMartPalette
	scf
	ret

.mart_johto
	call LoadJohtoMartPalette
	scf
	ret

.mart_kanto
	call LoadKantoMartPalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadDarknessPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, DarknessPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

DarknessPalette:
INCLUDE "gfx/tilesets/darkness.pal"

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

LoadBattleTowerInsidePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerInsidePalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

BattleTowerInsidePalette:
INCLUDE "gfx/tilesets/battle_tower_inside.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadSilverPalette:
; the snow palettes for the current time of day
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, SilverPalette
	add hl, de
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld bc, 8 palettes
	jmp FarCopyWRAM

SilverPalette:
INCLUDE "gfx/tilesets/silver.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadHoennHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HoennHousePalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

HoennHousePalette:
INCLUDE "gfx/tilesets/house_hoenn.pal"

LoadCenterPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, CenterPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

CenterPalette:
INCLUDE "gfx/tilesets/center.pal"

LoadKantoCenterPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, KantoCenterPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

KantoCenterPalette:
INCLUDE "gfx/tilesets/center_kanto.pal"

LoadJohtoCenterPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, JohtoCenterPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

JohtoCenterPalette:
INCLUDE "gfx/tilesets/center_johto.pal"

LoadMartPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MartPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

MartPalette:
INCLUDE "gfx/tilesets/mart_pc.pal"

LoadJohtoMartPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, JohtoMartPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

JohtoMartPalette:
INCLUDE "gfx/tilesets/mart_johto.pal"

LoadKantoMartPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, KantoMartPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

KantoMartPalette:
INCLUDE "gfx/tilesets/mart_kanto.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	jmp FarCopyWRAM

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	jmp FarCopyWRAM

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"
