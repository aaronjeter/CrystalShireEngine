; Colored type and move category icons, shown as sprites in menus instead of
; the type / category names (GBA-style).
;
; Each icon is 4x1 tiles (32x8). They're sprites so that each icon can have its
; own colors (OBJ palette) without using up the screen's BG palettes, and so
; that their rounded corners show whatever is behind them.
;
; Using them on a screen:
; 1. LoadTypeIconGFX once (all icons go to VRAM bank 1, vTiles3 tiles 0-$57).
; 2. PlaceTypeIcon / PlaceMoveIcons for each icon, with an icon slot (which
;    OAM entries) and an OBJ palette that's free on that screen.
; 3. HideTypeIcons when the icons should go away (it also puts back the OBJ
;    palettes they borrowed, saved in wTypeIconOBPalsBackup). It's safe to
;    call when no icons are shown.
; While icons are shown (wTypeIconPalsSaved), the sprite anim engine leaves
; their OAM slots alone (DoNextFrameForAllSprites, engine/sprite_anims/core.asm).
; farcall doesn't keep the flags on the way in, so callers that need their
; flags kept around HideTypeIcons have to push af themselves.

LoadTypeIconGFX::
	ld a, BANK(vTiles3)
	ldh [rVBK], a
	ld hl, vTiles3
	ld de, TypeIconGFX
	lb bc, BANK(TypeIconGFX), NUM_TYPE_ICONS * TYPE_ICON_WIDTH
	call Get2bpp ; GDMA (TypeIconGFX is aligned), so VRAM bank 1 is safe
	xor a
	ldh [rVBK], a
	ret

HideTypeIcons::
; Hide all the icon slots and give back the OBJ palettes they borrowed.
; Does nothing if no icons are shown. Preserves everything.
	push af
	push bc
	push de
	push hl
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTypeIconPalsSaved)
	ldh [rSVBK], a
	ld a, [wTypeIconPalsSaved]
	and a
	jr z, .done
	xor a
	ld [wTypeIconPalsSaved], a
	ld hl, wShadowOAMSprite00 + TYPE_ICON_FIRST_OAM * SPRITEOAMSTRUCT_LENGTH
	ld bc, NUM_TYPE_ICON_SLOTS * TYPE_ICON_WIDTH * SPRITEOAMSTRUCT_LENGTH
	xor a
	rst ByteFill
	ld hl, wTypeIconOBPalsBackup
	ld de, wOBPals1
	ld bc, 8 palettes
	rst CopyBytes
	ld hl, wTypeIconOBPalsBackup
	ld de, wOBPals2
	ld bc, 8 palettes
	rst CopyBytes
	ld a, TRUE
	ldh [hCGBPalUpdate], a
.done
	pop af
	ldh [rSVBK], a
	jmp PopAFBCDEHL_TypeIcons

PlaceTypeIconForType::
; Place the icon for type a: b = tile row, c = tile column, d = icon slot,
; e = OBJ palette.
	push hl
	call GetTypeIcon
	pop hl
	; fallthrough

PlaceTypeIcon::
; Place icon a (TYPEICON_*): b = tile row, c = tile column, d = icon slot,
; e = OBJ palette. Preserves bc, de, hl.
	push bc
	push af
	ld a, c
	add a
	add a
	add a ; * TILE_WIDTH
	ld c, a
	pop af
	call PlaceTypeIconAtX
	pop bc
	ret

PlaceTypeIconAtX::
; Like PlaceTypeIcon, but c = the screen x in pixels (for spacing that isn't a
; whole number of tiles).
; The icon's colors go into OBJ palette e in both wOBPals1 and wOBPals2, so
; screens that reapply their palettes keep them; the first icon placed saves
; the OBJ palettes in wTypeIconOBPalsBackup for HideTypeIcons.
	push af
	push bc
	push de
	push hl
	push af

	push bc
	push de
	; bc = the icon's colors
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl ; * 1 palettes
	ld bc, TypeIconPalettes
	add hl, bc
	ld b, h
	ld c, l
	; de = offset of OBJ palette e
	ld a, e
	add a
	add a
	add a ; * 1 palettes
	ld e, a
	ld d, 0
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld a, [wTypeIconPalsSaved]
	and a
	jr nz, .saved
	push bc
	push de
	ld hl, wOBPals1
	ld de, wTypeIconOBPalsBackup
	ld bc, 8 palettes
	rst CopyBytes
	pop de
	pop bc
	ld a, TRUE
	ld [wTypeIconPalsSaved], a
.saved
	ld hl, wOBPals1
	add hl, de
	call .CopyPalette
	ld hl, wOBPals2
	add hl, de
	call .CopyPalette
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	pop de
	pop bc

	; hl = the slot's first OAM entry
	ld a, d
	add a
	add a ; * TYPE_ICON_WIDTH
	add TYPE_ICON_FIRST_OAM
	add a
	add a ; * SPRITEOAMSTRUCT_LENGTH
	ld l, a
	ld h, 0
	push de
	ld de, wShadowOAMSprite00
	add hl, de
	pop de

	; y, x in pixels
	ld a, b
	add a
	add a
	add a
	add 16 ; OAM y is screen y + 16
	ld b, a
	ld a, c
	add 8 ; OAM x is screen x + 8
	ld c, a
	; d = first tile
	pop af
	add a
	add a ; * TYPE_ICON_WIDTH
	ld d, a
	; e = attributes
	ld a, e
	or VRAM_BANK_1
	ld e, a

	ld a, TYPE_ICON_WIDTH
.loop
	push af
	ld a, b
	ld [hli], a ; y
	ld a, c
	ld [hli], a ; x
	add TILE_WIDTH
	ld c, a
	ld a, d
	ld [hli], a ; tile
	inc d
	ld a, e
	ld [hli], a ; attributes
	pop af
	dec a
	jr nz, .loop
	jmp PopAFBCDEHL_TypeIcons

.CopyPalette:
; copy 1 palette from bc to hl
	push bc
	push de
	ld e, 1 palettes
.copy
	ld a, [bc]
	inc bc
	ld [hli], a
	dec e
	jr nz, .copy
	pop de
	pop bc
	ret

PlaceMoveIcons::
; Place the category and type icons of move a.
; b, c = row, column of the category icon; d, e = row, column of the type icon.
; h = icon slot of the category (the type uses h + 1); l = OBJ palette of the
; category (the type uses l + 1). Preserves everything.
	push bc
	push de
	push af
	ld a, c
	add a
	add a
	add a ; * TILE_WIDTH
	ld c, a
	ld a, e
	add a
	add a
	add a ; * TILE_WIDTH
	ld e, a
	pop af
	call PlaceMoveIconsAtX
	pop de
	pop bc
	ret

PlaceMoveIconsAtX::
; Like PlaceMoveIcons, but c and e are screen x positions in pixels.
	push af
	push bc
	push de
	push hl
	push de ; the type icon's row, x
	push hl
	push af
	call GetMoveCategoryIcon
	ld d, h
	ld e, l
	call PlaceTypeIconAtX
	pop af
	call GetMoveTypeIcon
	pop hl
	pop bc
	ld d, h
	inc d
	ld e, l
	inc e
	call PlaceTypeIconAtX
	jmp PopAFBCDEHL_TypeIcons

PlaceMonTypeIcons::
; Place the type icons of [wCurSpecies]: the first type at row b, column c
; (icon slot 0, OBJ palette 0), a second type one row below (slot 1, palette 1).
	push af
	push bc
	push de
	push hl
	push bc
	call GetBaseData
	pop bc
	ld a, [wBaseType1]
	lb de, 0, 0
	call PlaceTypeIconForType
	ld a, [wBaseType2]
	ld hl, wBaseType1
	cp [hl]
	jr z, .done ; single-typed mons have two of the same type
	inc b
	lb de, 1, 1
	call PlaceTypeIconForType
.done
	jr PopAFBCDEHL_TypeIcons

PlaceStatsMoveIcons::
; The stats screen's moves page: each move of wTempMonMoves gets its category
; icon at x 24 and its type icon at x 60 of its PP row (rows 11, 13, 15 and
; 17), with 4 pixels between the icons and before "PP" (column 12). Type icons use slots and OBJ palettes 0-3; category icons use
; slots 4-7 and share OBJ palettes 4-6 (one per category).
	push af
	push bc
	push de
	push hl
	ld hl, wTempMonMoves
	ld b, 11 ; row
	ld d, 0 ; move number (slot)
.loop
	ld a, [hli]
	and a
	jr z, .next
	push hl
	push af
	call GetMoveTypeIcon
	ld c, 60 ; x in pixels: 4 pixels before "PP" (column 12)
	ld e, d
	call PlaceTypeIconAtX
	pop af
	call GetMoveCategoryIcon
	push de
	ld c, a
	sub TYPEICON_PHYSICAL - 4
	ld e, a ; OBJ palette 4 + category
	ld a, d
	add 4
	ld d, a ; slot 4 + move number
	ld a, c
	ld c, 24 ; x in pixels: 4 pixels before the type icon
	call PlaceTypeIconAtX
	pop de
	pop hl
.next
	inc b
	inc b
	inc d
	ld a, d
	cp NUM_MOVES
	jr nz, .loop
	jr PopAFBCDEHL_TypeIcons

GetMoveTypeIcon::
; a = move -> a = TYPEICON_* of its type
	push hl
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	pop hl
	and TYPE_MASK
	; fallthrough

GetTypeIcon::
; a = type -> a = TYPEICON_*
	cp TYPES_END
	jr nc, .unknown
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, TypeIconsByType
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ret

.unknown
	ld a, TYPEICON_UNKNOWN
	ret

GetMoveCategoryIcon::
; a = move -> a = TYPEICON_PHYSICAL, _SPECIAL or _STATUS
	push hl
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	pop hl
	and ~TYPE_MASK
	; PHYSICAL ($40) -> 0, SPECIAL ($80) -> 1, STATUS ($c0) -> 2
	rlca
	rlca
	dec a
	add TYPEICON_PHYSICAL
	ret

PopAFBCDEHL_TypeIcons:
	pop hl
	pop de
	pop bc
	pop af
	ret

TypeIconsByType:
; entries correspond to type constants (constants/type_constants.asm)
	table_width 1
	db TYPEICON_NORMAL   ; NORMAL
	db TYPEICON_FIGHTING ; FIGHTING
	db TYPEICON_FLYING   ; FLYING
	db TYPEICON_POISON   ; POISON
	db TYPEICON_GROUND   ; GROUND
	db TYPEICON_ROCK     ; ROCK
	db TYPEICON_UNKNOWN  ; BIRD
	db TYPEICON_BUG      ; BUG
	db TYPEICON_GHOST    ; GHOST
	db TYPEICON_STEEL    ; STEEL
	rept UNUSED_TYPES_END - UNUSED_TYPES
	db TYPEICON_UNKNOWN  ; unused types and CURSE_TYPE
	endr
	db TYPEICON_FIRE     ; FIRE
	db TYPEICON_WATER    ; WATER
	db TYPEICON_GRASS    ; GRASS
	db TYPEICON_ELECTRIC ; ELECTRIC
	db TYPEICON_PSYCHIC  ; PSYCHIC_TYPE
	db TYPEICON_ICE      ; ICE
	db TYPEICON_DRAGON   ; DRAGON
	db TYPEICON_DARK     ; DARK
	db TYPEICON_FAIRY    ; FAIRY
	assert_table_length TYPES_END

INCLUDE "data/types/type_icon_palettes.asm"


SECTION "Type Icon Graphics", ROMX, ALIGN[4]

TypeIconGFX:
INCBIN "gfx/type_icons/type_icons.2bpp"
