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

TrainerpicMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 3, 14, 11
	dw NULL
	db 1 ; default option

Trainerpic::
	ld hl, TrainerpicMenuHeader
	call LoadMenuHeader
	call MenuBox
	call UpdateSprites
	call ApplyTilemap

	ld de, wBGPals1 palette PAL_BG_TEXT color 1
	farcall LoadTrainerPalette
	call UpdateTimePals
	
	xor a
	ldh [hBGMapMode], a

	ld a, 1
	ldh [rVBK], a                  ; select VRAM bank 1
	ld de, vTiles4                 ; was vTiles1
	predef GetTrainerPicNoWait
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