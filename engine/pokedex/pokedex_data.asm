; The Pokédex Data page: name, number, type icons and catch rate; the base
; stats with bars and EV yield marks; the total and growth rate; the three
; abilities; the Egg groups; the gender ratio and Egg cycles. A opens a box
; with an ability's description (Up/Down switch abilities, A/B close it) and
; Select plays the cry.

DEF DEXDATA_BAR_TILE   EQU $20 ; VRAM bank 1 BG tiles $20-$28: bars filled 0-8 pixels
DEF DEXDATA_BAR_PAL    EQU 4   ; BG palette of the bars
DEF DEXDATA_BAR_COL    EQU 9
DEF DEXDATA_BAR_TILES  EQU 8
DEF DEXDATA_STATS_ROW  EQU 4
DEF DEXDATA_ABILITY_ROW EQU 12

Pokedex_DrawDataPage:
; The text of the page (the bars, icons and their colors come after the
; palettes, in Pokedex_DataAfterLayout).
	call Pokedex_DrawPageFrame
	call Pokedex_GetSelectedMon
	ld [wCurSpecies], a
	call GetBaseData
	; name and number
	call GetPokemonName
	hlcoord 1, 1
	rst PlaceString
	hlcoord 13, 1
	ld a, $5c ; No
	ld [hli], a
	ld a, $5d ; .
	ld [hli], a
	push hl
	ld a, [wCurSpecies]
	call GetPokemonIndexFromID
	ld a, h
	ld [wDexMovesNumber], a ; big-endian for PrintNum
	ld a, l
	ld [wDexMovesNumber + 1], a
	pop hl
	ld de, wDexMovesNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 3
	call PrintNum
	; catch rate
	hlcoord 10, 2
	ld de, .CatchStr
	rst PlaceString
	hlcoord 16, 2
	ld de, wBaseCatchRate
	lb bc, 1, 3
	call PrintNum
	; the rules
	hlcoord 1, 3
	ld bc, SCREEN_WIDTH - 1
	ld a, $61
	rst ByteFill
	hlcoord 1, 11
	ld bc, SCREEN_WIDTH - 1
	ld a, $61
	rst ByteFill
	; stats, with the EV yield
	call .Stats
	; growth rate
	hlcoord 11, 10
	ld a, [wBaseGrowthRate]
	ld de, .GrowthRates
	call .PlaceNth
	; abilities
	call .Abilities
	; Egg groups
	hlcoord 1, 15
	ld de, .EggStr
	rst PlaceString
	hlcoord 5, 15
	ld a, [wBaseEggGroups]
	swap a
	and $f
	ld de, .EggGroups
	call .PlaceNth
	ld a, [wBaseEggGroups]
	and $f
	ld e, a
	ld a, [wBaseEggGroups]
	swap a
	and $f
	cp e
	jr z, .one_group
	ld h, b
	ld l, c
	ld [hl], "/"
	inc hl
	ld a, e
	ld de, .EggGroups
	call .PlaceNth
.one_group
	; gender ratio and Egg cycles
	hlcoord 1, 16
	ld a, [wBaseGender]
	call .Gender
	hlcoord 12, 16
	ld de, .HatchStr
	rst PlaceString
	hlcoord 17, 16
	ld de, wBaseEggSteps
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	jmp PrintNum

.PlaceNth:
; Place string a (from 0) of the "@"-separated list de at hl; bc = after it.
	and a
	jr z, .place
.skip
	ld b, a
.skip_loop
	ld a, [de]
	inc de
	cp "@"
	jr nz, .skip_loop
	ld a, b
	dec a
	jr nz, .skip
.place
	rst PlaceString
	ret

.Stats:
; label, value and EV yield of each stat, in .StatOrder
	ld b, 0 ; row
.stat_loop
	ld hl, .StatOrder
	ld a, b
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	cp -1
	ret z
	ld c, a ; offset from wBaseStats
	push bc
	ld a, DEXDATA_STATS_ROW
	add b
	hlcoord 1, 0
	push bc
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	pop bc
	push hl
	ld a, b
	ld de, .StatNames
	call .PlaceNth
	pop hl
	pop bc
	push bc
	push hl
	; the value in columns 5-7
	ld de, 4
	add hl, de
	push hl
	ld hl, wBaseStats
	ld e, c
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
	lb bc, 1, 3
	call PrintNum
	pop hl
	pop bc
	push bc
	; the EV yield: "×n" in columns 18-19
	ld de, 17
	add hl, de
	ld a, c
	call .EVYield
	and a
	jr z, .no_ev
	ld [hl], "×"
	inc hl
	add "0"
	ld [hl], a
.no_ev
	pop bc
	inc b
	jr .stat_loop

.EVYield:
; a = the EV yield of the stat at wBaseStats + a
	ld e, a
	cp 4
	ld a, [wBaseHPAtkDefSpdEVs]
	jr c, .shift ; HP, Atk, Def, Spd
	ld a, e
	sub 4
	ld e, a
	ld a, [wBaseSpAtkSpDefEVs] ; SpA, SpD
.shift
	; stat 0 is in bits 7-6, stat 1 in bits 5-4, ...
	inc e
.shift_loop
	rlca
	rlca
	dec e
	jr nz, .shift_loop
	and %11
	ret

.Abilities:
; one row per filled ability slot, the hidden one marked "(H)"
	hlcoord 1, DEXDATA_ABILITY_ROW
	ld e, ABILITY_SLOT_1
.ability_loop
	push hl
	push de
	call Pokedex_GetSelectedMon
	ld b, h
	ld c, l
	pop de
	push de
	ld a, e
	farcall GetSpeciesAbility
	pop de
	pop hl
	jr c, .next_ability ; empty slot
	push hl
	push de
	farcall GetAbilityName
	pop de
	pop hl
	push hl
	push de
	ld de, wStringBuffer2
	rst PlaceString
	pop de
	push de
	ld a, e
	cp ABILITY_SLOT_HIDDEN
	jr nz, .not_hidden
	ld h, b
	ld l, c
	inc hl
	ld de, .HiddenStr
	rst PlaceString
.not_hidden
	pop de
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
.next_ability
	inc e
	ld a, e
	cp NUM_ABILITY_SLOTS
	jr c, .ability_loop
	ret

.Gender:
	ld de, .GenderUnknown
	cp GENDER_UNKNOWN
	jr z, .place_gender
	ld de, .Gender0
	and a ; GENDER_F0
	jr z, .place_gender
	ld de, .Gender12
	cp GENDER_F12_5
	jr z, .place_gender
	ld de, .Gender25
	cp GENDER_F25
	jr z, .place_gender
	ld de, .Gender50
	cp GENDER_F50
	jr z, .place_gender
	ld de, .Gender75
	cp GENDER_F75
	jr z, .place_gender
	ld de, .Gender100
.place_gender
	rst PlaceString
	ret

.StatOrder:
	db BASE_HP - BASE_STATS
	db BASE_ATK - BASE_STATS
	db BASE_DEF - BASE_STATS
	db BASE_SAT - BASE_STATS
	db BASE_SDF - BASE_STATS
	db BASE_SPD - BASE_STATS
	db -1

.StatNames:
	db "HP@"
	db "Atk@"
	db "Def@"
	db "SpA@"
	db "SpD@"
	db "Spe@"

.GrowthRates:
	db "Med.Fast@"
	db "Sl.Fast@"
	db "Sl.Slow@"
	db "Med.Slow@"
	db "Fast@"
	db "Slow@"

.EggGroups:
	db "?@"
	db "Monster@"
	db "Water1@"
	db "Bug@"
	db "Flying@"
	db "Field@"
	db "Fairy@"
	db "Grass@"
	db "Human@"
	db "Water3@"
	db "Mineral@"
	db "Amorph.@"
	db "Water2@"
	db "Ditto@"
	db "Dragon@"
	db "None@"

.CatchStr:  db "Catch@"
.EggStr:    db "Egg@"
.HatchStr:  db "Hatch@"
.HiddenStr: db "(H)@"

.GenderUnknown: db "No gender@"
.Gender0:   db "♂100@"
.Gender12:  db "♂87.5♀12.5@"
.Gender25:  db "♂75♀25@"
.Gender50:  db "♂50♀50@"
.Gender75:  db "♂25♀75@"
.Gender100: db "♀100@"

Pokedex_DataAfterLayout:
; The type icons, the stat bars (tiles, colors and attributes) and the total.
	farcall LoadTypeIconGFX
	; no picture on this page: palette 0 where the picture box was
	hlcoord 1, 1, wAttrmap
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 1
	xor a
	call FillBoxWithByte
	call Pokedex_GetSelectedMon
	ld [wCurSpecies], a
	call GetBaseData
	; type icons on row 2: slots and OBJ palettes 0-1
	ld a, [wBaseType1]
	farcall GetTypeIcon
	lb bc, 2, 1 * TILE_WIDTH - POKEDEX_SCX
	lb de, 0, 0
	farcall PlaceTypeIconAtX
	ld a, [wBaseType2]
	ld hl, wBaseType1
	cp [hl]
	jr z, .one_type
	farcall GetTypeIcon
	lb bc, 2, 5 * TILE_WIDTH - POKEDEX_SCX
	lb de, 1, 1
	farcall PlaceTypeIconAtX
.one_type
	; bar tiles and colors
	ld a, 1
	ldh [rVBK], a
	ld de, PokedexBarsGFX
	ld hl, vTiles5 tile DEXDATA_BAR_TILE
	lb bc, BANK(PokedexBarsGFX), DEXDATA_BAR_TILES + 1
	call Get2bppViaHDMA
	xor a
	ldh [rVBK], a
	ld hl, Pokedex_DataAfterLayout.BarPal
	ld a, DEXDATA_BAR_PAL
	call Pokedex_SetBGPal
	; fallthrough

Pokedex_DataBars:
; The stat bars and the total, then the screen is updated.
	ld hl, Pokedex_DrawDataPage.StatOrder
	ld b, 0 ; row
	ld de, 0 ; total
.bar_loop
	ld a, [hli]
	cp -1
	jr z, .total
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, wBaseStats
	add hl, de
	ld a, [hl]
	pop de
	; total += value
	push af
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	pop af
	push de
	push bc
	call .Bar
	pop bc
	pop de
	pop hl
	inc b
	jr .bar_loop

.total
	ld a, d
	ld [wDexMovesNumber], a
	ld a, e
	ld [wDexMovesNumber + 1], a
	hlcoord 1, 10
	ld de, .TotalStr
	rst PlaceString
	hlcoord 7, 10
	ld de, wDexMovesNumber
	lb bc, PRINTNUM_LEFTALIGN | 2, 3
	call PrintNum
	call CopyTilemapAtOnce
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.Bar:
; The bar for base stat a on stats row b: 8 tiles, full at 200.
	; pixels = a * 41 / 128 (64 pixels at 200), at most 64
	ld l, a
	ld h, 0
	ld d, h
	ld e, l
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	add hl, hl
	add hl, hl ; * 32
	pop de
	add hl, de ; * 40
	ld e, a
	ld d, 0
	add hl, de ; * 41
	add hl, hl ; / 128 = high byte after * 2
	ld a, h
	cp DEXDATA_BAR_TILES * TILE_WIDTH + 1
	jr c, .got_pixels
	ld a, DEXDATA_BAR_TILES * TILE_WIDTH
.got_pixels
	ld c, a
	push bc
	ld a, DEXDATA_STATS_ROW
	add b
	push af
	hlcoord DEXDATA_BAR_COL, 0
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	pop af
	push hl
	hlcoord DEXDATA_BAR_COL, 0, wAttrmap
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl
	pop bc
	ld b, DEXDATA_BAR_TILES
.tile_loop
	ld a, c
	sub TILE_WIDTH
	jr c, .partial
	ld c, a
	ld a, DEXDATA_BAR_TILE + TILE_WIDTH
	jr .got_tile
.partial
	ld a, c
	add DEXDATA_BAR_TILE
	ld c, 0
.got_tile
	ld [hli], a
	ld a, DEXDATA_BAR_PAL | VRAM_BANK_1
	ld [de], a
	inc de
	dec b
	jr nz, .tile_loop
	ret

.TotalStr: db "Total@"

Pokedex_DataAfterLayout.BarPal:
	RGB 31, 31, 31
	RGB 31, 20, 10
	RGB 07, 04, 03
	RGB 00, 00, 00

Pokedex_SetBGPal:
; BG palette a = the 4 colors at hl, in wBGPals1 and wBGPals2.
	ld e, a
	ld d, 0
rept 3
	sla e
endr
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	push hl
	push de
	ld hl, wBGPals1
	add hl, de
	ld d, h
	ld e, l
	pop bc
	pop hl
	push hl
	push bc
	ld bc, 1 palettes
	rst CopyBytes
	pop de
	pop hl
	push hl
	ld hl, wBGPals2
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, 1 palettes
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	ret

Pokedex_DataAbilityBox:
; A box over rows 10-16 with an ability's name and description: Up/Down
; switch between the selected mon's abilities, A/B close it.
	ld a, ABILITY_SLOT_1
	ld [wDexMovesCursor], a
.redraw
	hlcoord 0, 10
	lb bc, 5, 18
	call Pokedex_PlaceBorder
	call Pokedex_GetSelectedMon
	ld b, h
	ld c, l
	ld a, [wDexMovesCursor]
	farcall GetSpeciesAbility
	push af
	farcall GetAbilityName
	hlcoord 1, 11
	ld de, wStringBuffer2
	rst PlaceString
	ld a, [wDexMovesCursor]
	cp ABILITY_SLOT_HIDDEN
	jr nz, .not_hidden
	hlcoord 15, 11
	ld de, Pokedex_DrawDataPage.HiddenStr
	rst PlaceString
.not_hidden
	pop af
	hlcoord 1, 13
	farcall PlaceAbilityDescription
	call CopyTilemapAtOnce
.loop
	call DelayFrame
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .close
	ld a, [hl]
	and D_UP
	jr nz, .prev
	ld a, [hl]
	and D_DOWN
	jr z, .loop
	; next filled slot, wrapping
	ld a, [wDexMovesCursor]
.next_loop
	inc a
	cp NUM_ABILITY_SLOTS
	jr c, .check
	xor a
.check
	call .Filled
	jr c, .next_loop
	jr .moved

.prev
	ld a, [wDexMovesCursor]
.prev_loop
	and a
	jr nz, .dec
	ld a, NUM_ABILITY_SLOTS
.dec
	dec a
	call .Filled
	jr c, .prev_loop
.moved
	ld hl, wDexMovesCursor
	cp [hl]
	jr z, .loop
	ld [hl], a
	jr .redraw

.close
	call Pokedex_DrawDataPage
	call Pokedex_PlaceTabs
	jmp Pokedex_DataBars

.Filled:
; carry if ability slot a is empty for the selected mon. Keeps a.
	push af
	push hl
	call Pokedex_GetSelectedMon
	ld b, h
	ld c, l
	pop hl
	pop af
	push af
	farcall GetSpeciesAbility
	jr c, .empty
	pop af
	and a
	ret
.empty
	pop af
	scf
	ret
