LoadOverworldMonIcon:
; Output: b:de = icon graphics, c = 8 tiles.
; A follower sprite is decompressed into wFollowerGFXBuffer and de points
; there; copy it with rSVBK = BANK(wFollowerGFXBuffer).
	ld a, e
	ld [wCurIcon], a
	call _LoadOverworldMonIcon
	bit 7, d
	ret z
	jr DecompressFollowerGFX

LoadFollowerSprite::
; The lead Pokémon's overworld sprite, for SPRITE_FOLLOWER (see GetMonSprite).
; Output: b:de = graphics, c = tiles per set (12 for a follower sprite,
; 8 for a species that only has a menu icon), or c = 0 if there's no follower.
	farcall GetFollowerPartyMon
	jr c, .none
	ld [wCurIcon], a
	call _LoadOverworldMonIcon
	bit 7, d
	ret z ; a menu icon
	call DecompressFollowerGFX
	call ReorderFollowerGFX
	ld c, 12
	ret

.none
	ld c, 0
	ret

ReorderFollowerGFX:
; Follower sprites are stored down, down, up, up, side, side, so that the first
; two frames are the menu icon. Walking sprites want the standing frames first:
; down, up, side, then the stepping frames down, up, side.
	push bc
	push de
	ldh a, [rSVBK]
	push af
	ld a, BANK(wFollowerGFXBuffer)
	ldh [rSVBK], a
	ld hl, wFollowerGFXBuffer + 4 tiles ; down step -> scratch
	ld de, wFollowerGFXBuffer + 24 tiles
	call .CopyFrame
	ld hl, wFollowerGFXBuffer + 8 tiles ; up stand -> frame 1
	ld de, wFollowerGFXBuffer + 4 tiles
	call .CopyFrame
	ld hl, wFollowerGFXBuffer + 16 tiles ; side stand -> frame 2
	ld de, wFollowerGFXBuffer + 8 tiles
	call .CopyFrame
	ld hl, wFollowerGFXBuffer + 12 tiles ; up step -> frame 4
	ld de, wFollowerGFXBuffer + 16 tiles
	call .CopyFrame
	ld hl, wFollowerGFXBuffer + 24 tiles ; down step -> frame 3
	ld de, wFollowerGFXBuffer + 12 tiles
	call .CopyFrame
	pop af
	ldh [rSVBK], a
	pop de
	pop bc
	ret

.CopyFrame:
	ld bc, 4 tiles
	rst CopyBytes
	ret

_LoadOverworldMonIcon:
	call GetPokemonIndexFromID
	; fallthrough
GetIconPointer:
; Input: hl = species index
; Output: b = icon bank, c = 8 tiles, de = icon address
	ld d, h
	ld e, l
	add hl, hl
	add hl, de
	ld de, IconPointers
	add hl, de
	; fallthrough
ReadIconPointer:
; Input: hl = IconPointers entry (dba, or dba_lz for a follower sprite)
; Output: b = bank, c = 8 tiles, de = address (bit 15 set = compressed)
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld c, 8
	ret

DecompressFollowerGFX:
; Decompress the follower sprite at b:de (bit 15 of de set) into
; wFollowerGFXBuffer, and point de at the buffer. Preserves b, c and hl.
; Its first 8 tiles are the menu icon.
	res 7, d
	push hl
	push bc
	ldh a, [rSVBK]
	push af
	ld a, BANK(wFollowerGFXBuffer)
	ldh [rSVBK], a
	ld h, d
	ld l, e
	ld de, wFollowerGFXBuffer
	ld a, b
	call FarDecompress
	pop af
	ldh [rSVBK], a
	pop bc
	pop hl
	ld de, wFollowerGFXBuffer
	ret

SetMenuMonIconColor:
; Color a lone menu icon (naming screen, move list) with its species' own
; colors in OBJ palette MENU_ICON_OBPAL. hl = DVs.
	push hl
	push de
	push bc
	push af

	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	call GetMenuMonIconColors
	jr _SetMenuMonIconColor

SetMenuMonIconColor_NoShiny:
	push hl
	push de
	push bc
	push af

	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	ld c, a
	ld b, 0 ; not shiny
	call GetMonPalInBCDE
_SetMenuMonIconColor:
	ld a, MENU_ICON_OBPAL
	call LoadMonIconOBPal
	call UpdateOBPals
	ld a, MENU_ICON_OBPAL
	ld hl, wShadowOAMSprite00Attributes
	jr _ApplyMenuMonIconColor

LoadPartyMenuMonIconColors:
	push hl
	push de
	push bc
	push af

	ld a, [wPartyCount]
	sub c
	ld [wCurPartyMon], a
	ld e, a
	ld d, 0

	ld hl, wPartyMon1Item
	call GetPartyLocation
	ld a, [hl]
	ld [wCurIconMonHasItemOrMail], a

	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	; each party slot has its own OBJ palette (1-6) with the mon's colors
	ld a, MON_DVS
	call GetPartyParamLocation
	call GetMenuMonIconColors
	ld a, [wCurPartyMon]
	inc a
	call LoadMonIconOBPal
	call UpdateOBPals
	ld hl, wShadowOAMSprite00Attributes
	ld a, [wCurPartyMon]
	swap a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [wCurPartyMon]
	inc a

	ld de, 4
	ld [hl], a ; top left
	add hl, de
	ld [hl], a ; top right
	add hl, de
	push hl
	add hl, de
	ld [hl], a ; bottom right
	pop hl
	ld d, a
	ld a, [wCurIconMonHasItemOrMail]
	and a
	ld a, PAL_OW_RED ; item or mail color
	jr nz, .ok
	ld a, d
.ok
	ld [hl], a ; bottom left
	jr _FinishMenuMonIconColor

_ApplyMenuMonIconColor:
	ld c, 4
	ld de, 4
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	; fallthrough
_FinishMenuMonIconColor:
	jmp PopAFBCDEHL

GetMonPalInBCDE:
; Sets bc and de to the light and dark colors of a menu icon: the species'
; own colors from FollowerPalettes (see data/pokemon/follower_palettes.asm).
; Input: c = species, b = shininess (1=true, 0=false)
	ld a, c
	push bc
	call GetPokemonIndexFromID
	pop bc
	bit 7, h
	jr nz, .icon_pal ; Egg (negative index)
	add hl, hl ; 8 bytes per species
	add hl, hl
	add hl, hl
	dec b
	jr nz, .got_shininess
	ld de, 2 * PAL_COLOR_SIZE ; shiny colors
	add hl, de
.got_shininess
	ld de, FollowerPalettes
	add hl, de
	push hl
	ld a, BANK(FollowerPalettes)
	call GetFarWord
	ld b, h
	ld c, l
	pop hl
	inc hl
	inc hl
	ld a, BANK(FollowerPalettes)
	call GetFarWord
	ld d, h
	ld e, l
	ret

.icon_pal
	; Egg: its color from MonMenuIconPals (in PartyMenuOBPals)
	dec hl
	ld d, h
	ld e, l

	ld hl, MonMenuIconPals

	; This sets z if mon is shiny.
	dec b
	ld b, 0
	add hl, de
	ld a, [hl]
	jr z, .shiny
	swap a
.shiny
	and $f

	; Now we have the target color. Get the palette (+ 2 to avoid white).
	ld hl, PartyMenuOBPals + 2
	ld bc, 1 palettes
	rst AddNTimes

	push hl
	ld a, BANK(PartyMenuOBPals)
	call GetFarWord
	ld b, h
	ld c, l
	pop hl
	inc hl
	inc hl
	ld a, BANK(PartyMenuOBPals)
	call GetFarWord
	ld d, h
	ld e, l
	ret

GetMenuMonIconColors:
; bc, de = the icon colors of [wCurPartySpecies] with the DVs at hl.
	ld b, h
	ld c, l
	farcall CheckShininess
	ld b, 0
	jr nc, .not_shiny
	inc b
.not_shiny
	ld a, [wCurPartySpecies]
	ld c, a
	jr GetMonPalInBCDE

LoadMonIconOBPal:
; OBJ palette a (in wOBPals1) = white, bc, de, black.
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	ld de, wOBPals1
	add hl, de
	pop de
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld a, LOW(palred 27 + palgreen 31 + palblue 27)
	ld [hli], a
	ld a, HIGH(palred 27 + palgreen 31 + palblue 27)
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], a
	pop af
	ldh [rSVBK], a
	pop hl
	ret

UpdateOBPals:
; Copy wOBPals1 to wOBPals2 and update the hardware palettes.
	push hl
	push de
	push bc
	ld hl, wOBPals1
	ld de, wOBPals2
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	jmp PopBCDEHL

LoadPartyMonIconOBPals::
; For the party menu's CGB layout: OBJ palettes 1-6 = the party's icon colors.
	ld a, [wCurPartyMon]
	push af
	ld a, [wCurPartySpecies]
	push af
	ld a, [wPartyCount]
	and a
	jr z, .done
	ld c, a
	xor a
.loop
	push bc
	push af
	ld [wCurPartyMon], a
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld a, MON_DVS
	call GetPartyParamLocation
	call GetMenuMonIconColors
	pop af
	push af
	inc a
	call LoadMonIconOBPal
	pop af
	pop bc
	inc a
	dec c
	jr nz, .loop
.done
	pop af
	ld [wCurPartySpecies], a
	pop af
	ld [wCurPartyMon], a
	ret

LoadMenuMonIcon:
	push hl
	push de
	push bc
	call .LoadIcon
	jmp PopBCDEHL

.LoadIcon:
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to MONICON_* constants
	dw PartyMenu_InitAnimatedMonIcon    ; MONICON_PARTYMENU
	dw NamingScreen_InitAnimatedMonIcon ; MONICON_NAMINGSCREEN
	dw MoveList_InitAnimatedMonIcon     ; MONICON_MOVES
	dw Trade_LoadMonIconGFX             ; MONICON_TRADE
	dw Mobile_InitAnimatedMonIcon       ; MONICON_MOBILE1
	dw Mobile_InitPartyMenuBGPal71      ; MONICON_MOBILE2
	dw Unused_GetPartyMenuMonIcon       ; MONICON_UNUSED

Unused_GetPartyMenuMonIcon:
	call InitPartyMenuIcon
	call .GetPartyMonItemGFX
	jmp SetPartyMonIconAnimSpeed

.GetPartyMonItemGFX:
	push bc
	ldh a, [hObjectStructIndex]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop bc
	ld a, [hl]
	and a
	jr z, .no_item
	push hl
	push bc
	ld d, a
	farcall ItemIsMail
	pop bc
	pop hl
	jr c, .not_mail
	ld a, $06
	jr .got_tile
.not_mail
	ld a, $05
	; fallthrough

.no_item
	ld a, $04
.got_tile
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ret

Mobile_InitAnimatedMonIcon:
	call PartyMenu_InitAnimatedMonIcon
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 9 * TILE_WIDTH
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], 9 * TILE_WIDTH
	ret

Mobile_InitPartyMenuBGPal71:
	call InitPartyMenuIcon
	call SetPartyMonIconAnimSpeed
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 3 * TILE_WIDTH
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], 12 * TILE_WIDTH
	ld a, c
	ld [wc608], a
	ld a, b
	ld [wc608 + 1], a
	ret

PartyMenu_InitAnimatedMonIcon:
	call InitPartyMenuIcon
	call .SpawnItemIcon
	jr SetPartyMonIconAnimSpeed

.SpawnItemIcon:
	push bc
	ldh a, [hObjectStructIndex]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop bc
	ld a, [hl]
	and a
	ret z
	push hl
	push bc
	ld d, a
	farcall ItemIsMail
	pop bc
	pop hl
	; a = carry ? SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_MAIL : SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM
	assert SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_MAIL + 1 == SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM
	sbc a
	add SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ret

InitPartyMenuIcon:
	call LoadPartyMenuMonIconColors
	ld a, [wCurIconTile]
	push af
	ldh a, [hObjectStructIndex]
	ld hl, wPartySpecies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wCurIcon], a
	call GetMemIconGFX
	ldh a, [hObjectStructIndex]
; y coord
	add a
	add a
	add a
	add a
	add $1c
	ld d, a
; x coord
	ld e, $10
; type is partymon icon
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	pop af
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], a
	ret

SetPartyMonIconAnimSpeed:
	push bc
	ldh a, [hObjectStructIndex]
	ld b, a
	call .getspeed
	ld a, b
	pop bc
	ld hl, SPRITEANIMSTRUCT_DURATIONOFFSET
	add hl, bc
	ld [hl], a
	rlca
	rlca
	ld hl, SPRITEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ret

.getspeed
	farcall PlacePartymonHPBar
	call GetHPPal
	ld e, d
	ld d, 0
	ld hl, .speeds
	add hl, de
	ld b, [hl]
	ret

.speeds
	db $00 ; HP_GREEN
	db $40 ; HP_YELLOW
	db $80 ; HP_RED

NamingScreen_InitAnimatedMonIcon:
	ld hl, wTempMonDVs
	call SetMenuMonIconColor
	ld a, [wTempIconSpecies]
	ld [wCurIcon], a
	xor a
	call GetIconGFX
	depixel 4, 4, 4, 0
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL
	ret

MoveList_InitAnimatedMonIcon:
	ld a, MON_DVS
	call GetPartyParamLocation
	call SetMenuMonIconColor
	ld a, [wTempIconSpecies]
	ld [wCurIcon], a
	xor a
	call GetIconGFX
	lb de, 3 * TILE_WIDTH + 2, 4 * TILE_WIDTH + 4
	ld a, SPRITE_ANIM_OBJ_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_NULL
	ret

Trade_LoadMonIconGFX:
	; hl = wPlayerTrademonDVs or wOTTrademonDVs
	ld h, b
	ld l, c
	ld a, [wTempIconSpecies]
	ld [wCurPartySpecies], a
	ld [wCurIcon], a
	call GetMenuMonIconColors
	ld a, 1
	call LoadMonIconOBPal
	call UpdateOBPals
	ld a, $62
	ld [wCurIconTile], a
	jr GetMemIconGFX

GetSpeciesIcon:
; Load species icon into VRAM at tile a
	push de
	ld a, MON_DVS
	call GetPartyParamLocation
	call SetMenuMonIconColor
	ld a, [wFlyingWithHMItem]
	and a
	jr z, .flying_with_mon
	ld hl, DELIBIRD
	call GetPokemonIDFromIndex
	jr .finish
.flying_with_mon
	ld a, [wTempIconSpecies]
.finish
	ld [wCurIcon], a
	pop de
	ld a, e
	jr GetIconGFX

FlyFunction_GetMonIcon:
	push de
	ld a, [wFlyingWithHMItem]
	and a
	jr z, .flying_with_mon
	ld hl, DELIBIRD
	call GetPokemonIDFromIndex
	jr .finish
.flying_with_mon
	ld a, [wTempIconSpecies]
.finish
	ld [wCurIcon], a
	pop de
	ld a, e
	call GetIcon_a
; todo: made up this label location... fix this!
; fallthrough
SetOWFlyMonColor:
	; OBJ palette 0 = the Fly mon's (or Delibird's) own colors.
	ld a, [wFlyingWithHMItem]
	and a
	jr nz, .delibird
	ld a, MON_DVS
	call GetPartyParamLocation
	call GetMenuMonIconColors
	jr .got_colors

.delibird
	; Bird Whistle: use Delibird's (non-shiny) colors, not the party mon's
	ld hl, DELIBIRD
	call GetPokemonIDFromIndex
	ld c, a
	ld b, 0 ; not shiny
	call GetMonPalInBCDE
.got_colors
	xor a
	call LoadMonIconOBPal
	jmp UpdateOBPals

GetMemIconGFX:
	ld a, [wCurIconTile]
GetIconGFX:
	call GetIcon_a
	ld de, 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	call GetGFXUnlessMobile
	ld a, [wCurIconTile]
	add 10
	ld [wCurIconTile], a
	ret

HeldItemIcons:
INCBIN "gfx/stats/mail.2bpp"
INCBIN "gfx/stats/item.2bpp"

GetIcon_de:
; Load icon graphics into VRAM starting from tile de.
	ld l, e
	ld h, d
	jr GetIcon

GetIcon_a:
; Load icon graphics into VRAM starting from tile a.
	ld l, a
	ld h, 0

GetIcon:
; Load icon graphics into VRAM starting from tile hl.

; One tile is 16 bytes long.
rept 4
	add hl, hl
endr

	ld de, vTiles0
	add hl, de
	push hl

	ld a, [wCurIcon]
	cp EGG
	jr z, .is_egg
	call GetPokemonIndexFromID
	call GetIconPointer
	jr .got_pointer
.is_egg
	ld hl, IconPointers - (3 * 3)
	call ReadIconPointer
.got_pointer
	pop hl
	push hl

	bit 7, d
	jr nz, .follower
	call GetGFXUnlessMobile
	pop hl
	ret

.follower
	call DecompressFollowerGFX
	call GetFollowerBufferGFX
	pop hl
	ret

GetFollowerBufferGFX:
; Copy c tiles from wFollowerGFXBuffer (de) to hl.
	ld a, BANK(wFollowerGFXBuffer)
	call StackCallInWRAMBankA
	; fallthrough

GetGFXUnlessMobile:
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jmp nz, Request2bpp
	jmp Get2bppViaHDMA


GetStorageIcon_a:
; Load frame 1 icon graphics into VRAM starting from tile a
	ld l, a ; no-optimize hl|bc|de = a * 16 (rept)
	ld h, 0
rept 4
	add hl, hl
endr
	ld de, vTiles0
	add hl, de
	; fallthrough
GetStorageIcon:
	push hl
	ld a, [wCurIcon]
	call _LoadOverworldMonIcon
	ld c, 4
	pop hl
	bit 7, d
	jr nz, .follower
	farjp BillsPC_SafeGet2bpp

.follower
	call DecompressFollowerGFX
	ld a, BANK(wFollowerGFXBuffer)
	call StackCallInWRAMBankA
	farjp BillsPC_SafeGet2bpp

FreezeMonIcons:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wMenuCursorY]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	ld a, SPRITE_ANIM_FUNC_NULL
	jr nz, .ok
	ld a, SPRITE_ANIM_FUNC_PARTY_MON_SWITCH
.ok
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

UnfreezeMonIcons:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
.loop
	ld a, [hl]
	and a
	jr z, .next
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_PARTY_MON
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

HoldSwitchmonIcon:
	ld hl, wSpriteAnimationStructs
	ld e, PARTY_LENGTH
	ld a, [wSwitchMon]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	ld a, SPRITE_ANIM_FUNC_PARTY_MON_SELECTED
	jr nz, .join_back
	ld a, SPRITE_ANIM_FUNC_PARTY_MON_SWITCH
.join_back
	push hl
	ld c, l
	ld b, h
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], a
	pop hl
.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret

INCLUDE "data/pokemon/menu_icon_pals.asm"

INCLUDE "data/pokemon/icon_pointers.asm"
