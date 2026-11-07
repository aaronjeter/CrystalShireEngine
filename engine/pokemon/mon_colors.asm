; Hidden Power's type, and a Pokémon's colors (MON_COLOR, the byte right before
; the DVs in the party, box and save structs; 0 keeps the species' colors).
; The colors themselves are MonColorPalettes (engine/gfx/color.asm).

GetHiddenPowerType::
; a = Hidden Power's type for the DVs at hl. Preserves bc, de, hl.
	ld a, [hl]
	call GetHiddenPowerNumber
	push hl
	ld hl, HiddenPowerTypes
	jr _MonColorsTableByte

GetHiddenPowerNumber::
; a = the atk/def DV byte -> a = Hidden Power's type number (0-16: Fighting ...
; Dark, Fairy) = v * 17 / 32, with v = (Atk & 7) << 2 | (Def & 3).
; Preserves bc, de, hl.
	push hl
	push de
	ld d, a
	swap a
	and %0111
	add a
	add a
	ld e, a
	ld a, d
	and %0011
	or e
	pop de
	ld hl, HiddenPowerNumbers
	; fallthrough

_MonColorsTableByte:
; a = [hl + a]; pops hl
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	pop hl
	ret

HiddenPowerNumbers:
	for v, 32
		db v * NUM_HIDDEN_POWER_TYPES / 32
	endr

HiddenPowerTypes:
; type number -> type
	table_width 1
	db FIGHTING
	db FLYING
	db POISON
	db GROUND
	db ROCK
	db BUG
	db GHOST
	db STEEL
	db FIRE
	db WATER
	db GRASS
	db ELECTRIC
	db PSYCHIC_TYPE
	db ICE
	db DRAGON
	db DARK
	db FAIRY
	assert_table_length NUM_HIDDEN_POWER_TYPES

HiddenPowerBlessings:
; type number -> the shrine blessing for that type (MONPAL_SHINY), or 0 (plain shiny)
	table_width 1
	db 0                 ; Fighting
	db MONCOLOR_LUGIA    ; Flying
	db 0                 ; Poison
	db MONCOLOR_GROUDON  ; Ground
	db 0                 ; Rock
	db 0                 ; Bug
	db MONCOLOR_MEW      ; Ghost
	db MONCOLOR_JIRACHI  ; Steel
	db MONCOLOR_HO_OH    ; Fire
	db MONCOLOR_KYOGRE   ; Water
	db MONCOLOR_CELEBI   ; Grass
	db 0                 ; Electric
	db MONCOLOR_MEWTWO   ; Psychic
	db 0                 ; Ice
	db MONCOLOR_RAYQUAZA ; Dragon
	db 0                 ; Dark
	db 0                 ; Fairy
	assert_table_length NUM_HIDDEN_POWER_TYPES

GetServiceMonColor::
; The colors a palette service option gives: b = its atk/def DV byte, c = its
; spd/spc option (MONPAL_*). Returns a = the new MON_COLOR, or carry to keep
; the Pokémon's colors (MONPAL_ALIGN).
	ld a, b
	call GetHiddenPowerNumber
	ld b, a
	ld a, c
	cp MONPAL_TYPE_COLORS
	jr z, .type
	cp MONPAL_SHINY
	scf
	ret nz
	push hl
	ld a, b
	ld hl, HiddenPowerBlessings
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	pop hl
	and a
	ret
.type
	ld a, b
	inc a ; MONCOLOR_FIGHTING + type number
	and a
	ret

SetTrainerMonColor::
; A trainer Pokémon whose spd/spc DV byte is HP_SPDSPC_DV gets its Hidden Power
; type's colors. de = its spd/spc DV byte.
	ld a, [de]
	cp HP_SPDSPC_DV
	ret nz
	dec de
	ld a, [de]
	call GetHiddenPowerNumber
	inc a ; MONCOLOR_FIGHTING + type number
	dec de
	ld [de], a ; MON_COLOR
	inc de
	inc de
	ret

SetWildMonColor::
; wWildMonColor for a wild Pokémon with DVs bc (copied to wWildMonDVs): a shiny
; one gets a random blessing with a 1 in WILD_BLESSING_ODDS chance, others keep
; their species' colors.
	ld hl, wWildMonDVs
	ld a, b
	ld [hli], a
	ld [hl], c
	ld a, c
	cp SHINY_SPDSPC_DV
	ld a, 0
	jr nz, .got_color
	call BattleRandom
	cp 256 / WILD_BLESSING_ODDS
	ld a, 0
	jr nc, .got_color
	call BattleRandom
.mod
	cp NUM_BLESSINGS
	jr c, .got_blessing
	sub NUM_BLESSINGS
	jr .mod
.got_blessing
	add MONCOLOR_FIRST_BLESSING
.got_color
	ld [wWildMonColor], a
	ret

GetMonColorIconColors::
; a = MON_COLOR (1 to NUM_MONCOLORS) -> bc, de = its light and dark colors
; (menu icons and followers). Preserves hl.
	push hl
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl ; * PAL_COLOR_SIZE * 2
	ld bc, MonColorPalettes
	add hl, bc
	push hl
	ld a, BANK(MonColorPalettes)
	call GetFarWord
	ld b, h
	ld c, l
	pop hl
	inc hl
	inc hl
	ld a, BANK(MonColorPalettes)
	call GetFarWord
	ld d, h
	ld e, l
	pop hl
	ret

LoadMonColorFollowerColors::
; wFollowerColors = the 2 colors of MON_COLOR a.
	call GetMonColorIconColors
	ldh a, [rSVBK]
	push af
	ld a, BANK(wFollowerColors)
	ldh [rSVBK], a
	ld hl, wFollowerColors
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	pop af
	ldh [rSVBK], a
	ret
