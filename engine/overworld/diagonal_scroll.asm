SECTION "Diagonal Scroll", ROMX

DiagonalColumnAndCorner::
; After a diagonal step's horizontal map scroll (the vertical one was done
; on the step's first frame), draw the new column. While the
; step is under way the old rows on the other side are still on screen, so
; the column needs 2 more tiles there: a corner taken straight from the
; metatiles. 18 + 2 pointers fill the BG map buffer.
	ld a, [wPlayerStepDiagonal]
	cp RIGHT
	jr z, .right
	hlcoord 0, 0
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	hlcoord 0, 0, wAttrmap
	ld de, wBGMapPalBuffer
	call BackupBGMapColumn
	ld a, [wBGMapAnchor]
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	jr .got_column

.right
	hlcoord SCREEN_WIDTH - 2, 0
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	hlcoord SCREEN_WIDTH - 2, 0, wAttrmap
	ld de, wBGMapPalBuffer
	call BackupBGMapColumn
	ld a, [wBGMapAnchor]
	ld e, a
	and %11100000
	ld b, a
	ld a, e
	add SCREEN_WIDTH - 2
	and %00011111
	or b
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a

.got_column
	push de
	call UpdateBGMapColumn ; pointers 0-17
	pop de
; The corner's BG map rows: 2 above the column when moving down, else 2 below.
	ld a, [wPlayerStepDirection]
	and a ; DOWN
	ld hl, -2 * BG_MAP_WIDTH
	jr z, .got_corner_row
	ld hl, SCREEN_HEIGHT * BG_MAP_WIDTH
.got_corner_row
	add hl, de
	ld a, h
	and %11
	or HIGH(vBGMap0)
	ld h, a
	ld a, l
	ld [wBGMapBufferPointers + 18 * 2], a
	ld a, h
	ld [wBGMapBufferPointers + 18 * 2 + 1], a
	ld de, BG_MAP_WIDTH
	add hl, de
	ld a, h
	and %11
	or HIGH(vBGMap0)
	ld [wBGMapBufferPointers + 19 * 2 + 1], a
	ld a, l
	ld [wBGMapBufferPointers + 19 * 2], a

; The corner's half-block coordinates from the screen's top left block:
; x: 9 half-blocks right for the right column; y: 1 up or 9 down.
	ld a, [wPlayerStepDiagonal]
	cp RIGHT
	ld a, [wPlayerMetatileX]
	jr nz, .got_x
	add 9
.got_x
	ld b, a
	ld a, [wPlayerStepDirection]
	and a ; DOWN
	ld a, [wPlayerMetatileY]
	jr nz, .below
	dec a ; -1 or 0
	jr .got_y
.below
	add 9
.got_y
	ld c, a
; block address
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	srl a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wMapWidth]
	add 3 * 2
	ld e, a ; d = 0
	ld a, c
	sra a
	jr z, .got_block
	bit 7, a
	jr z, .down_rows
	ld a, l ; one row up
	sub e
	ld l, a
	jr nc, .got_block
	dec h
	jr .got_block
.down_rows
	add hl, de
	dec a
	jr nz, .down_rows
.got_block
	ld a, [hl]
	and a
	jr nz, .not_border
	ld a, [wMapBorderBlock]
.not_border
; offset in the metatile: 8 for the bottom half, 2 for the right half
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, c
	and 1
	add a
	add a
	ld e, a
	ld a, b
	and 1
	add e
	add a
	ld e, a
	ld d, 0
	add hl, de
	push hl
	ld de, wDecompressedMetatiles
	add hl, de
	ld de, wBGMapBuffer + 18 * 2
	ld a, BANK(wDecompressedMetatiles)
	call .CopyCorner
	pop hl
	ld de, wDecompressedAttributes
	add hl, de
	ld de, wBGMapPalBuffer + 18 * 2
	ld a, BANK(wDecompressedAttributes)
	call .CopyCorner

	ld a, 20
	ldh [hBGMapTileCount], a
	ld a, 1
	ldh [hBGMapUpdate], a
	ret

.CopyCorner:
; Copy 2x2 tiles at hl (rows of 4) in WRAM bank a to de.
	ld b, a
	ldh a, [rSVBK]
	push af
	ld a, b
	ldh [rSVBK], a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	inc hl
	inc hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop af
	ldh [rSVBK], a
	ret
