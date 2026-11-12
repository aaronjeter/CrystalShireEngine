DEF SHINY_ATK_MASK EQU %0010
DEF SHINY_DEF_DV EQU 10
DEF SHINY_SPD_DV EQU 10
DEF SHINY_SPC_DV EQU 15

CheckShininess:
; Check if a mon is shiny by DVs at bc.
; Return carry if shiny.

	ld l, c
	ld h, b

; Special
	ld a, [hli] ; skip to the second iv byte
	ld a, [hl]
	cp SHINY_SPDSPC_DV
	jr nz, .not_shiny

; shiny
	scf
	ret

.not_shiny
	and a
	ret

InitPartyMenuPalettes:
	ld hl, PalPacket_PartyMenu
	call CopyFourPalettes
	call InitPartyMenuOBPals
	jmp WipeAttrmap

ApplyMonOrTrainerPals:
	call CheckCGB
	ret z
	ld a, e
	and a
	jr z, .get_trainer
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	jr .load_palettes

.get_trainer
	ld a, [wTrainerClass]
	call GetTrainerPalettePointer

.load_palettes
	ld de, wBGPals1
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	call ApplyAttrmap
	jmp ApplyPals

ApplyHPBarPals:
	ld a, [wWhichHPBar]
	and a
	jr z, .Enemy
	cp $1
	jr z, .Player
	cp $2
	jr z, .PartyMenu
	ret

.Enemy:
	ld de, wBGPals2 palette PAL_BATTLE_BG_ENEMY_HP color 1
	jr .okay

.Player:
	ld de, wBGPals2 palette PAL_BATTLE_BG_PLAYER_HP color 1

.okay
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	ld bc, 4
	ld a, BANK(wBGPals2)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.PartyMenu:
	ld e, c
	inc e
	hlcoord 11, 1, wAttrmap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wCurPartyMon]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop

.done
	lb bc, 2, 8
	ld a, e
	jmp FillBoxCGB

LoadStatsScreenPals:
	call CheckCGB
	ret z
	ld hl, StatsScreenPals
	ld b, 0
	add hl, bc
	add hl, bc
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld a, [hli]
	ld [wBGPals1 palette 0], a
	ld [wBGPals1 palette 2], a
	ld a, [hl]
	ld [wBGPals1 palette 0 + 1], a
	ld [wBGPals1 palette 2 + 1], a
	pop af
	ldh [rSVBK], a
	call ApplyPals
	ld a, $1
	ret

LoadMailPalettes:
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .MailPals
	add hl, de
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrmap
	jmp ApplyAttrmap

.MailPals:
INCLUDE "gfx/mail/mail.pal"

INCLUDE "engine/gfx/cgb_layouts.asm"

CopyFourPalettes:
	ld de, wBGPals1
	ld c, 4

CopyPalettes:
.loop
	push bc
	ld a, [hli]
	push hl
	call GetPredefPal
	call LoadHLPaletteIntoDE
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

GetPredefPal:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PredefPals
	add hl, bc
	ret

LoadHLPaletteIntoDE:
	ld c, 1 palettes
LoadHLBytesIntoDE:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret

LoadPalette_White_Col1_Col2_Black:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld a, LOW(PALRGB_WHITE)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_WHITE)
	ld [de], a
	inc de

	ld c, 2 * PAL_COLOR_SIZE
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop

	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de

	pop af
	ldh [rSVBK], a
	ret

FillBoxCGB:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

ResetBGPals:
	push af
	push bc
	push de
	push hl

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, wBGPals1
	ld c, 1 palettes
.loop
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop

	pop af
	ldh [rSVBK], a

	pop hl
	pop de
	pop bc
	pop af
	ret

WipeAttrmap:
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	jmp ByteFill

ApplyPals:
	ld hl, wBGPals1
	ld de, wBGPals2
	ld bc, 16 palettes
	ld a, BANK(wGBCPalettes)
	jmp FarCopyWRAM

ApplyAttrmap:
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr z, .UpdateVBank1
	ldh a, [hBGMapMode]
	push af
	ld a, $2
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	ret

.UpdateVBank1:
	hlcoord 0, 0, wAttrmap
	debgcoord 0, 0
	ld b, SCREEN_HEIGHT
	ld a, $1
	ldh [rVBK], a
.row
	ld c, SCREEN_WIDTH
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add e
	jr nc, .okay
	inc d
.okay
	ld e, a
	dec b
	jr nz, .row
	xor a
	ldh [rVBK], a
	ret

; CGB layout for SCGB_PARTY_MENU_HP_BARS
CGB_ApplyPartyMenuHPPals:
	ld hl, wHPPals
	ld a, [wSGBPals]
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	hlcoord 11, 2, wAttrmap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wSGBPals]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop
.done
	lb bc, 2, 8
	ld a, e
	jmp FillBoxCGB

InitPartyMenuOBPals:
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	jmp FarCopyWRAM

GetBattlemonBackpicPalettePointer:
	push de
	farcall GetPartyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempBattleMonSpecies]
	call GetPlayerOrMonPalettePointer
	pop de
	ret

GetEnemyFrontpicPalettePointer:
	push de
	farcall GetEnemyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempEnemyMonSpecies]
	call GetFrontpicPalettePointer
	pop de
	ret

GetPlayerColor:
; hl = the front pic palette (2 colors) for the outfit color wPlayerColor
	ld a, [wPlayerColor]
	cp NUM_PLAYER_COLORS
	jr c, .ok
	xor a ; PLAYER_COLOR_RED
.ok
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl ; * PAL_COLOR_SIZE * 2
	push bc
	ld bc, PlayerColorPalettes
	add hl, bc
	pop bc
	ret

GetPlayerOrMonPalettePointer:
	and a
	jr nz, GetMonNormalOrShinyPalettePointer
	ld a, [wPlayerSpriteSetupFlags]
	call GetPlayerColor
	ret

GetFrontpicPalettePointer:
	and a
	jr nz, GetMonNormalOrShinyPalettePointer
	ld a, [wTrainerClass]

GetTrainerPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, TrainerPalettes
	add hl, bc
	ret

BattleObjectPals:
INCLUDE "gfx/battle_anims/battle_anims.pal"

GetMonPalettePointer:
	call GetPokemonIndexFromID
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
	ret

GetMonNormalOrShinyPalettePointer:
; hl = the palette of species a with the DVs at bc: MON_COLOR (the byte before the
; DVs) if it's set, else the species' normal or shiny colors.
	push bc
	call GetMonPalettePointer
	pop bc
	push hl
	call CheckShininess
	pop hl
	jr nc, .got_species_colors
rept 4
	inc hl
endr
.got_species_colors
	dec bc
	ld a, [bc] ; MON_COLOR
	inc bc
	and a
	ret z
	cp NUM_MONCOLORS + 1
	ret nc
	jp GetMonColorPalettePointer

InitCGBPals::
	call CheckCGB
	ret z

; CGB only
	ld a, BANK(vTiles3)
	ldh [rVBK], a
	ld hl, vTiles3
	ld bc, $200 tiles
	xor a
	rst ByteFill
	ld a, BANK(vTiles0)
	ldh [rVBK], a
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld c, 4 * TILE_WIDTH
.bgpals_loop
	ld a, LOW(PALRGB_WHITE)
	ldh [rBGPD], a
	ld a, HIGH(PALRGB_WHITE)
	ldh [rBGPD], a
	dec c
	jr nz, .bgpals_loop
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld c, 4 * TILE_WIDTH
.obpals_loop
	ld a, LOW(PALRGB_WHITE)
	ldh [rOBPD], a
	ld a, HIGH(PALRGB_WHITE)
	ldh [rOBPD], a
	dec c
	jr nz, .obpals_loop
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, wBGPals1
	call .LoadWhitePals
	ld hl, wBGPals2
	call .LoadWhitePals
	pop af
	ldh [rSVBK], a
	ret

.LoadWhitePals:
	ld c, 4 * 16
.loop
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	dec c
	jr nz, .loop
	ret

INCLUDE "gfx/sgb/pal_packets.asm"

PredefPals:
	table_width PALETTE_SIZE
INCLUDE "gfx/sgb/predef.pal"
	assert_table_length NUM_PREDEF_PALS

HPBarPals:
INCLUDE "gfx/battle/hp_bar.pal"

ExpBarPalette:
INCLUDE "gfx/battle/exp_bar.pal"

INCLUDE "data/pokemon/palettes.asm"

INCLUDE "data/trainers/palettes.asm"

INCLUDE "data/player/color_palettes.asm"

LoadSootopolisStonePalette:
; Sootopolis is built from cream-white stone: on TILESET_SOOTOPOLIS, replace the
; gray palette (paving, rock, houses) with warm stone colors for the time of day.
	ld a, [wMapTileset]
	cp TILESET_SOOTOPOLIS
	ret nz
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	add a
	add a
	add a ; * 1 palettes
	ld e, a
	ld d, 0
	ld hl, SootopolisStonePalettes
	add hl, de
	ld de, wBGPals1 palette PAL_BG_GRAY
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jmp FarCopyWRAM

SootopolisStonePalettes:
	RGB 31,30,22, 23,22,16, 15,14,10, 07,06,05 ; morn
	RGB 31,30,26, 24,22,18, 15,14,11, 06,05,05 ; day
	RGB 16,15,22, 12,11,17, 07,07,12, 00,00,03 ; nite
	RGB 31,24,17, 22,18,14, 14,11,09, 06,05,05 ; eve

LoadMapPals:
	farcall RecordMapPalsWeather
	call .Load
	; maps with overworld weather get tinted colors (not the text palette)
	ld hl, wBGPals1
	ld c, PAL_BG_TEXT
	farjp ApplyWeatherTint

.Load:
	farcall LoadSpecialMapPalette
	jr c, .got_pals

	; Which palette group is based on whether we're outside or inside
	ld a, [wEnvironment]
	maskbits NUM_ENVIRONMENTS + 1
	ld e, a
	ld d, 0
	ld hl, EnvironmentColorsPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Futher refine by time of day
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	add a
	add a
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, wBGPals1
	ld b, 8
.outer_loop
	ld a, [de] ; lookup index for TilesetBGPalette
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, TilesetBGPalette
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, 1 palettes
.inner_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop de
	inc de
	dec b
	jr nz, .outer_loop
	pop af
	ldh [rSVBK], a
	call LoadSootopolisStonePalette

.got_pals
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld hl, wOBPals1
	ld bc, 8 palettes
	ld a, $ff
	rst ByteFill
	ld hl, wOBPals2
	ld bc, 8 palettes
	ld a, $ff
	rst ByteFill
	pop af
	ldh [rSVBK], a
	farcall ClearSavedObjPals

	ld a, [wEnvironment]
	cp TOWN
	jr z, .outside
	cp ROUTE
	ret nz
.outside
	call GetRoofPalettes
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	cp NITE_F
	ld de, 4
	jr z, .nite
	jr c, .morn_day
; eve
	add hl, de
.nite
	add hl, de
.morn_day
	ld de, wBGPals1 palette PAL_BG_ROOF color 1
	ld bc, 4
	ld a, BANK(wBGPals1)
	jmp FarCopyWRAM

INCLUDE "data/maps/environment_colors.asm"

PartyMenuBGPalette:
INCLUDE "gfx/stats/party_menu_bg.pal"

BillsPC_ThemePals:
	table_width PAL_COLOR_SIZE * 4
INCLUDE "gfx/pc/themes.pal"
	assert_table_length NUM_BILLS_PC_THEMES

BillsPC_CursorPalette:
	; middle colors are set dynamically
	RGB 31,31,31, 31,31,31, 00,00,00, 00,00,00
BillsPC_PackPalette:
	RGB 31,31,31, 31,31,31, 07,19,07, 00,00,00
BillsPC_WhitePalette:
	RGB 31,31,31, 31,31,31, 31,31,31, 31,31,31
BillsPC_ItemPalette:
	RGB 31,31,31, 31,19,10, 31,07,01, 00,00,00

TilesetBGPalette:
INCLUDE "gfx/tilesets/bg_tiles.pal"

RoofPals:
	table_width PAL_COLOR_SIZE * 3 * 2
INCLUDE "gfx/tilesets/roofs.pal"
	assert_table_length NUM_MAP_GROUPS + 1

GetRoofPalettes:
; Return hl = the morn/day, nite and eve roof colors for the current map.
; Most map groups share one RoofPals entry, but Hoenn is a single map group,
; so its maps look up their own colors in HoennRoofMaps.
	ld a, [wMapGroup]
	cp GROUP_LITTLEROOT_TOWN ; Hoenn
	jr nz, .by_group
	ld a, [wMapNumber]
	ld hl, HoennRoofMaps
	ld de, 2
	call IsInArray
	ld a, HOENN_ROOF_ROUTE ; maps without an entry
	jr nc, .got_hoenn_roof
	inc hl
	ld a, [hl]
.got_hoenn_roof
	; hl = HoennRoofPals + a * 12
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, h
	ld e, l
	add hl, hl
	add hl, de
	ld de, HoennRoofPals
	add hl, de
	ret

.by_group
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, RoofPals
	add hl, de
	add hl, de
	add hl, de
	ret

INCLUDE "data/maps/hoenn_roofs.asm"

HoennRoofPals:
	table_width PAL_COLOR_SIZE * 3 * 2
INCLUDE "gfx/tilesets/hoenn_roofs.pal"
	assert_table_length NUM_HOENN_ROOFS

DiplomaPalettes:
INCLUDE "gfx/diploma/diploma.pal"

PartyMenuOBPals:
INCLUDE "gfx/stats/party_menu_ob.pal"

;UnusedGSTitleBGPals:
;INCLUDE "gfx/title/unused_gs_bg.pal"

;UnusedGSTitleOBPals:
;INCLUDE "gfx/title/unused_gs_fg.pal"

MalePokegearPals:
INCLUDE "gfx/pokegear/pokegear.pal"

FemalePokegearPals:
INCLUDE "gfx/pokegear/pokegear_f.pal"

;BetaPokerPals:
;INCLUDE "gfx/beta_poker/beta_poker.pal"

SlotMachinePals:
INCLUDE "gfx/slots/slots.pal"


LoadPokemonPalette:
	ld a, [wCurPartySpecies]
	; hl = palette
	call GetMonPalettePointer
	; load palette into de (set by caller)
	ld bc, PAL_COLOR_SIZE * 2
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

;helper function for setting Hidden Power colors
LoadTrainerPalette:
	ld a, [wTrainerClass]
	; hl = palette
	call GetTrainerPalettePointer
	; load palette into de (set by caller)
	ld bc, PAL_COLOR_SIZE * 2
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM


MonColorPalettes:
; MON_COLOR's 2-color sets (light, dark), in MONCOLOR_* order
	table_width PAL_COLOR_SIZE * 2
	RGB 29,16,10, 20,07,05 ; MONCOLOR_FIGHTING
	RGB 22,26,31, 12,16,28 ; MONCOLOR_FLYING
	RGB 27,16,29, 19,08,22 ; MONCOLOR_POISON
	RGB 29,24,13, 21,14,07 ; MONCOLOR_GROUND
	RGB 25,22,14, 17,14,09 ; MONCOLOR_ROCK
	RGB 23,27,06, 13,19,04 ; MONCOLOR_BUG
	RGB 22,18,30, 13,09,21 ; MONCOLOR_GHOST
	RGB 23,24,27, 15,16,21 ; MONCOLOR_STEEL
	RGB 31,23,07, 28,10,04 ; MONCOLOR_FIRE
	RGB 15,23,31, 07,13,28 ; MONCOLOR_WATER
	RGB 20,29,11, 08,20,07 ; MONCOLOR_GRASS
	RGB 31,28,07, 28,18,03 ; MONCOLOR_ELECTRIC
	RGB 31,20,17, 19,11,24 ; MONCOLOR_PSYCHIC
	RGB 23,30,31, 11,21,28 ; MONCOLOR_ICE
	RGB 20,16,31, 12,08,26 ; MONCOLOR_DRAGON
	RGB 19,17,16, 11,10,12 ; MONCOLOR_DARK
	RGB 31,18,24, 25,09,18 ; MONCOLOR_FAIRY
	RGB 30,27,09, 07,20,10 ; MONCOLOR_RAYQUAZA
	RGB 14,21,31, 26,07,09 ; MONCOLOR_KYOGRE
	RGB 30,12,08, 13,12,14 ; MONCOLOR_GROUDON
	RGB 31,30,15, 09,21,27 ; MONCOLOR_JIRACHI
	RGB 31,25,07, 28,08,07 ; MONCOLOR_HO_OH
	RGB 27,28,31, 11,16,28 ; MONCOLOR_LUGIA
	RGB 24,31,16, 08,20,24 ; MONCOLOR_CELEBI
	RGB 28,26,31, 20,12,26 ; MONCOLOR_MEWTWO
	RGB 31,23,28, 14,20,31 ; MONCOLOR_MEW
	assert_table_length NUM_MONCOLORS

GetMonColorPalettePointer::
; a = MON_COLOR (1 to NUM_MONCOLORS) -> hl = its 2 colors (BANK(MonColorPalettes))
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl ; * PAL_COLOR_SIZE * 2
	push bc
	ld bc, MonColorPalettes
	add hl, bc
	pop bc
	ret
