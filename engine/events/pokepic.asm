; Trainer portrait (opendialog): a 5x4 crop of the 7x7 trainer pic (head and
; upper body) in the bottom-left corner, sitting on the text box. Its frame is
; a 1-pixel line drawn into the edge pixels of the pic itself, so it takes no
; extra tiles: the portrait ends at column 4, which keeps the player (columns
; 8-9) and anyone standing next to them visible. Which 5 columns to show is
; set per trainer class in data/trainers/portrait_columns.asm.
; Overworld sprites disappear wherever a window covers them.
DEF PORTRAIT_X EQU 0 ; portrait's top-left tile
DEF PORTRAIT_Y EQU 8
DEF PORTRAIT_COLS EQU 5 ; how many of the pic's 7 columns to show
DEF PORTRAIT_ROWS EQU 4 ; how many of the pic's 7 rows to show (from the top)

Pokepic::
	ld hl, PokepicMenuHeader
	call LoadMenuHeader
	call MenuBox
	call UpdateSprites
	call ApplyTilemap
	ld de, wBGPals1 palette PAL_BG_TEXT color 1
	farcall LoadPokemonPalette
	call UpdateTimePals
	xor a
	ldh [hBGMapMode], a
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData

	ld a, 1
	ldh [rVBK], a                  ; select VRAM bank 1
	ld de, vTiles4                 ; was vTiles1
	predef GetMonFrontpic
	xor a
	ldh [rVBK], a

	ld a, [wMenuBorderTopCoord]
	inc a
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld c, a
	push bc                ; Coord2Tile clobbers bc, so save the coords
	call Coord2Tile
	ld a, $80
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic

	pop bc
	call Coord2Attr
	ld b, 7
.row
	push hl
	ld c, 7
.col
	ld a, [hl]
	or 1 << OAM_TILE_BANK
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .row
	jmp CopyTilemapAtOnce

ClosePokepic::
	call ExitMenu
	call GetMemSGBLayout
	call CopyTilemapAtOnce     ; attrs + tiles in one go
	call UpdateSprites
	farjp EnableDynPalUpdates

PokepicMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 3, 14, 11
	dw NULL
	db 1 ; default option

Trainerpic::
	ld hl, TrainerpicMenuHeader
	call LoadMenuHeader
	xor a
	ldh [hBGMapMode], a
	; blank the portrait area while the pic loads
	hlcoord PORTRAIT_X, PORTRAIT_Y
	lb bc, PORTRAIT_ROWS, PORTRAIT_COLS
	call ClearBox
	hlcoord PORTRAIT_X, PORTRAIT_Y, wAttrmap
	lb bc, PORTRAIT_ROWS, PORTRAIT_COLS
	ld a, PAL_BG_TEXT
	call FillBoxWithByte
	call UpdateSprites ; hides any NPC now covered by the portrait
	call ApplyTilemap

	ld de, wBGPals1 palette PAL_BG_TEXT color 1
	farcall LoadTrainerPalette
	call UpdateTimePals
	xor a
	ldh [hBGMapMode], a

	call LoadFramedTrainerPortrait

; Place the crop. The pic's tiles are stored column by column
; (7 per column), starting at tile $80.
	call GetPortraitFirstColumn
	ld b, a
	add a
	add a
	add a
	sub b ; * 7
	add $80
	hlcoord PORTRAIT_X, PORTRAIT_Y
	ld de, SCREEN_WIDTH
	ld c, PORTRAIT_COLS
.column
	push af
	push hl
	ld b, PORTRAIT_ROWS
.row
	ld [hl], a
	inc a
	add hl, de
	dec b
	jr nz, .row
	pop hl
	inc hl
	pop af
	add 7 ; first tile of the next column
	dec c
	jr nz, .column

	; the pic's tiles are in VRAM bank 1 and use the text palette
	hlcoord PORTRAIT_X, PORTRAIT_Y, wAttrmap
	lb bc, PORTRAIT_ROWS, PORTRAIT_COLS
	ld a, PAL_BG_TEXT | 1 << OAM_TILE_BANK
	call FillBoxWithByte
	jmp CopyTilemapAtOnce

GetPortraitFirstColumn:
; a = first of the pic's columns to show, from TrainerPortraitColumns
	ld a, [wTrainerClass]
	dec a
	ld e, a
	ld d, 0
	ld hl, TrainerPortraitColumns
	add hl, de
	ld a, [hl]
	ret

LoadFramedTrainerPortrait:
; Like GetTrainerPicNoWait, but draws a 1-pixel frame around the crop
; before copying the pic to VRAM bank 1 (vTiles4).
	ld a, [wTrainerClass]
	and a
	ret z
	cp NUM_TRAINER_CLASSES + 1
	ret nc
	call GetPortraitFirstColumn ; (wTrainerClass is in WRAM bank 1, so read it first)
	push af
	ld a, [wTrainerClass]
	dec a
	ld hl, TrainerPicPointers
	ld bc, 3
	rst AddNTimes
	ldh a, [rSVBK]
	ld c, a
	pop af
	push bc ; c = old WRAM bank
	push af ; first column
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarWord
	pop af
	ld de, wDecompressScratch
	call FarDecompress

	pop af ; first column
	call DrawPortraitFrame

	ld a, 1
	ldh [rVBK], a
	ld hl, vTiles4
	ld de, wDecompressScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	xor a
	ldh [rVBK], a
	pop bc
	ld a, c
	ldh [rSVBK], a
	ret

DrawPortraitFrame:
; Draw a 1-pixel black line around the crop's edge pixels in wDecompressScratch.
; a = first column of the crop
	ld b, a
	add a
	add a
	add a
	sub b ; * 7 = first tile of that column
	push af

; Top and bottom edges: the first/last pixel row of the top/bottom tiles.
	ld c, PORTRAIT_COLS
.top_bottom
	push af
	push bc
	call .GetTile ; top tile of this column
	ld a, $ff
	ld [hli], a
	ld [hl], a
	pop bc
	pop af
	push af
	push bc
	add PORTRAIT_ROWS - 1
	call .GetTile ; bottom tile of the crop in this column
	ld de, LEN_2BPP_TILE - 2
	add hl, de
	ld a, $ff
	ld [hli], a
	ld [hl], a
	pop bc
	pop af
	add 7 ; next column
	dec c
	jr nz, .top_bottom

; Left and right edges: the leftmost/rightmost pixel of every row.
	pop af
	push af
	ld d, %10000000
	call .Side
	pop af
	add (PORTRAIT_COLS - 1) * 7
	ld d, %00000001
	; fallthrough
.Side:
; OR d into every byte of the PORTRAIT_ROWS tiles starting at tile a
	push de
	call .GetTile
	pop de
	ld c, PORTRAIT_ROWS * LEN_2BPP_TILE
.side_loop
	ld a, [hl]
	or d
	ld [hli], a
	dec c
	jr nz, .side_loop
	ret

.GetTile:
; hl = wDecompressScratch + a * LEN_2BPP_TILE
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wDecompressScratch
	add hl, de
	ret

TrainerpicMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords PORTRAIT_X, PORTRAIT_Y, PORTRAIT_X + PORTRAIT_COLS - 1, PORTRAIT_Y + PORTRAIT_ROWS - 1
	dw NULL
	db 1 ; default option

INCLUDE "data/trainers/portrait_columns.asm"
