DEF TITLE_HORIZON_TILE EQU $20 ; the horizon's side columns: vTiles2, VRAM bank 0, 24 tiles

_TitleScreen:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wTitleScreenSelectedOption
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

; Turn LCD off
	call DisableLCD

; VRAM bank 1
	ld a, 1
	ldh [rVBK], a

; Decompress running Suicune gfx
	ld hl, TitleSuicuneGFX
	ld de, vTiles1
	call Decompress

; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, 20 * BG_MAP_WIDTH
	xor a
	rst ByteFill

; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, vBGMap1
	ld bc, BG_MAP_WIDTH
	ld a, 7 ; palette
	rst ByteFill

; BG Map 0:

; Apply logo gradient (an evening sky: the stripes are each palette's color 0):

; lines 0-2: the darkest stripe up to the top of the screen
	hlbgcoord 0, 0
	ld bc, 3 * BG_MAP_WIDTH
	ld a, 2
	rst ByteFill

; lines 3-4
	hlbgcoord 0, 3
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 2
	rst ByteFill
; line 5
	hlbgcoord 0, 5
	ld bc, BG_MAP_WIDTH
	ld a, 3
	rst ByteFill
; line 6
	hlbgcoord 0, 6
	ld bc, BG_MAP_WIDTH
	ld a, 4
	rst ByteFill
; line 7
	hlbgcoord 0, 7
	ld bc, BG_MAP_WIDTH
	ld a, 5
	rst ByteFill
; lines 8-9
	hlbgcoord 0, 8
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 6
	rst ByteFill

; 'CRYSTAL VERSION'
	hlbgcoord 5, 9
	ld bc, 11 ; length of version text
	ld a, 1
	rst ByteFill

; Delibird (left, mirrored to face right) and Iron Bundle (right, palette 7) gfx
	hlbgcoord 0, 12
	ld bc, 6 * BG_MAP_WIDTH ; the rest of the screen
	ld a, 0 | VRAM_BANK_1 | X_FLIP
	rst ByteFill
	hlbgcoord 10, 12
	ld b, 6
.iron_bundle_attrs
	push bc
	push hl
	ld bc, SCREEN_WIDTH - 10
	ld a, 7 | VRAM_BANK_1
	rst ByteFill
	pop hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .iron_bundle_attrs
; the horizon's side columns (0-1 and 18-19): palette 7 (color 1 is black), VRAM bank 0
	hlbgcoord 0, 12
	ld b, 6
.horizon_attrs
	ld a, 7
	ld [hli], a
	ld [hli], a
	ld de, SCREEN_WIDTH - 4
	add hl, de
	ld [hli], a
	ld [hli], a
	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .horizon_attrs

; Back to VRAM bank 0
	xor a
	ldh [rVBK], a

; Decompress logo
	ld hl, TitleLogoGFX
	ld de, vTiles1
	call Decompress

; The horizon's side columns
	ld hl, TitleHorizonGFX
	ld de, vTiles2 tile TITLE_HORIZON_TILE
	ld bc, TitleHorizonGFX.End - TitleHorizonGFX
	rst CopyBytes

; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 * BG_MAP_WIDTH
	ld a, " "
	rst ByteFill

; Draw Pokemon logo
	hlcoord 0, 3
	lb bc, 7, 20
	lb de, $80, 20
	call DrawTitleGraphic

; The ground (the window's line): solid tile $19 from the logo gfx, then the date and name
	hlbgcoord 0, 0, vBGMap1
	ld bc, SCREEN_WIDTH
	ld a, $19
	rst ByteFill

; Draw copyright text
	hlbgcoord 3, 0, vBGMap1
	lb bc, 1, 13
	lb de, $c, 16
	call DrawTitleGraphic

; Draw Delibird and Iron Bundle
	ld e, 0
	call LoadSuicuneFrame

; Draw the horizon's side columns
	hlcoord 0, 12
	ld a, TITLE_HORIZON_TILE
	ld b, 6
.horizon_tiles
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH - 4
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	dec b
	jr nz, .horizon_tiles

; Update palette colors
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	rst CopyBytes

	ld hl, TitleScreenPalettes
	ld de, wBGPals2
	ld bc, 16 palettes
	rst CopyBytes

	pop af
	ldh [rSVBK], a

; LY/SCX trickery starts here

	; a = [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

; Make sure the LYOverrides buffer is empty
	ld hl, wLYOverrides
	xor a
	ld bc, wLYOverridesEnd - wLYOverrides
	rst ByteFill

; Let LCD Stat know we're messing around with SCX
	ld hl, rIE
	set LCD_STAT, [hl]
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a

	pop af
	ldh [rSVBK], a

; Reset audio
	call ChannelsOff
	call EnableLCD

; Set sprite size to 8x16
	ldh a, [rLCDC]
	set rLCDC_SPRITE_SIZE, a
	ldh [rLCDC], a

	ld a, +112
	ldh [hSCX], a
	ld a, 8
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, -112
	ldh [hWY], a

	ld a, TRUE
	ldh [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ldh [hBGMapMode], a

	xor a
	ld [wSuicuneFrame], a

; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	jmp PlaySFX

SuicuneFrameIterator:
	ld hl, wSuicuneFrame
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every sixteen frames
	and %1111
	ret nz

	ld a, c
	swap a
	and %11
	ld e, a ; animation step 0-3
	xor a
	ldh [hBGMapMode], a
	call LoadSuicuneFrame
	ld a, $1
	ldh [hBGMapMode], a
	ld a, $3
	ldh [hBGMapThird], a
	ret

LoadSuicuneFrame:
; Delibird on the left, mirrored to face right (drawn right to left; its cells have
; X_FLIP), and Iron Bundle on the right, facing left. e = animation step (0-3).
	ld d, 0
	ld hl, .DelibirdFrames
	add hl, de
	ld a, [hl]
	push de
	ld d, a
	hlcoord 9, 12
	call .DrawMirrored
	pop de
	ld d, 0
	ld hl, .IronBundleFrames
	add hl, de
	ld d, [hl]
	hlcoord 10, 12
; fallthrough
.Draw:
	ld b, 6
.bgrows
	ld c, 8
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	ld a, SCREEN_WIDTH - 8
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

.DrawMirrored:
	ld b, 6
.mirrored_rows
	ld c, 8
.mirrored_col
	ld a, d
	ld [hld], a
	inc d
	dec c
	jr nz, .mirrored_col
	ld a, SCREEN_WIDTH + 8
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .mirrored_rows
	ret

; first tile of each frame (gfx/title/suicune.png): the top half is Delibird ($80, $88),
; the bottom half Iron Bundle ($00, $08)
.DelibirdFrames:
	db $80, $88, $80, $80
.IronBundleFrames:
	db $00, $00, $00, $08

DrawTitleGraphic:
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

TitleSuicuneGFX:
INCBIN "gfx/title/suicune.2bpp.lz"

TitleLogoGFX:
INCBIN "gfx/title/logo.2bpp.lz"

TitleHorizonGFX:
INCBIN "gfx/title/horizon.2bpp"
.End

TitleScreenPalettes:
INCLUDE "gfx/title/title.pal"
