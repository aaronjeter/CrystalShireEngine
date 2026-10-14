DEF wHOFTeamTile    EQUS "wStringBuffer2"
DEF wHOFTeamAttr    EQUS "(wStringBuffer2 + 1)"
DEF wHOFTeamColumns EQUS "(wStringBuffer2 + 2)"
DEF wHOFTeamRows    EQUS "(wStringBuffer2 + 3)"
DEF wHOFTeamSpecies EQUS "(wStringBuffer2 + 4)" ; 16-bit species index

DEF HOF_TEAM_PLAYER_PAL EQU PARTY_LENGTH + 1 ; BG palette 7

HOF_FadeOutMusicAndScreen:
; The end of AnimateHallOfFame (moved here for space).
	ld a, $4
	ld [wMusicFade], a
	farcall FadeOutToWhite
	ld c, 8
	jmp DelayFrames

HOF_ShowTeam:
; After the last new Hall of Famer: show the player and the whole team at once,
; and wait for A or B.
;   - the player's 5x7 trainer card pic in the middle (x 7-12, y 7-13, moved
;     4 pixels right to be centered in those 6 columns)
;   - the six mons around them: 3 rows of 7x6 tiles on each side (x 0-6 and
;     x 13-19), left to right, top to bottom
;   - a title above the player (x 7-12, y 3-6): the league from the
;     halloffame command (wHallOfFameLeague) and "CHAMPIONS", one 6x4-tile
;     graphic per league in gfx/hall_of_fame/. Together the title and the
;     player are centered on the screen.
; Each mon's front pic is 7x7 tiles (56 pixel rows), so it loses 8 pixel rows:
; by default its blank pixel rows at the top (up to 8) and the rest from the
; bottom (feet, tails, ground), so heads are never cut off. Pokémon whose heads
; are near the bottom of the pic are listed in data/pokemon/hof_crop_rows.asm
; with how many rows to drop from the top instead.
; Each crop gets a 1-pixel black frame drawn into its edge pixels.
; Each pic is loaded into a scratch area (VRAM bank 0, vTiles0) first, then
; its 42 tiles are copied from the padded pic in SRAM to:
;   slots 0-1: VRAM bank 0, vTiles2 (tiles $00 and $2a)
;   slots 2-3: VRAM bank 1, vTiles2 (tiles $00 and $2a)
;   player:    VRAM bank 1, vTiles2 (tiles $54-$7d)
;   slots 4-5: VRAM bank 1, vTiles1 (tiles $80 and $aa)
;   title:     VRAM bank 1, vTiles1 (tiles $d4-$eb)
; (VRAM bank 0 tiles $60-$7f are left alone: they hold the extra font tiles and
; " ", which the screens after this one use.)
; Each mon gets its own BG palette (slot + 1), the player BG palette 7.

	call ClearBGPalettes
	xor a
	ldh [hBGMapMode], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld [wBoxAlignment], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	rst ByteFill

; Pass 1: palettes. GetSGBLayout puts each one in BG palette 0 (and resets
; the other BG palettes and wipes the attrmap, so this is done before drawing
; anything). Each one is kept in the OBJ palette with its BG palette's number
; meanwhile (no sprites are shown), then they all go to BG palettes 1-7.
	xor a
	ld [wHallOfFameMonCounter], a
.palette_loop
	call .GetSlotMon
	jr c, .player_palette
	ld a, [wHallOfFameMonCounter]
	inc a
	call .KeepPalette
	ld hl, wHallOfFameMonCounter
	inc [hl]
	jr .palette_loop

.player_palette
	xor a
	ld [wCurPartySpecies], a ; 0 = the player
	ld a, HOF_TEAM_PLAYER_PAL
	call .KeepPalette
	ld hl, wOBPals1 palette 1
	ld de, wBGPals1 palette 1
	ld bc, HOF_TEAM_PLAYER_PAL palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	; the screen is still blank, so applying the palettes shows nothing yet
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	rst ByteFill

; Pass 2: load the pics with the LCD off, and lay out the tilemap and attrmap.
	call DelayFrame
	call DisableLCD

	; the player
	call .LoadCenteredPlayerPic
	ld a, $54
	ld [wHOFTeamTile], a
	ld a, HOF_TEAM_PLAYER_PAL | VRAM_BANK_1
	ld [wHOFTeamAttr], a
	ld a, 6
	ld [wHOFTeamColumns], a
	ld a, 7
	ld [wHOFTeamRows], a
	lb bc, 7, 7 ; y, x
	call .PlacePic

	; the title above the player: the league from the halloffame command
	; (wHallOfFameLeague) and "CHAMPIONS", 6x4 tiles stored by columns
	ld a, [wHallOfFameLeague]
	cp NUM_LEAGUES
	jr c, .got_league
	xor a
.got_league
	add a
	ld l, a
	ld h, 0
	ld de, HOFLeagueTitles
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, 1
	ldh [rVBK], a
	ld de, vTiles1 tile $54 ; tile $d4
	ld bc, 6 * 4 tiles
	rst CopyBytes
	xor a
	ldh [rVBK], a
	ld a, 6
	ld [wHOFTeamColumns], a
	ld a, 4
	ld [wHOFTeamRows], a
	ld a, HOF_TEAM_PLAYER_PAL | VRAM_BANK_1
	ld [wHOFTeamAttr], a
	ld a, $d4
	ld [wHOFTeamTile], a
	lb bc, 3, 7 ; y, x
	call .PlacePic

	; the team
	ld a, 7
	ld [wHOFTeamColumns], a
	ld a, 6
	ld [wHOFTeamRows], a
	xor a
	ld [wHallOfFameMonCounter], a
.pic_loop
	call .GetSlotMon
	jr c, .pics_done
	xor a
	ldh [rVBK], a
	ld de, vTiles0
	predef GetMonFrontpic ; also leaves the padded pic in SRAM
	ld a, [wHallOfFameMonCounter]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl ; * 8
	ld de, .Slots
	add hl, de
	ld a, [hli] ; VRAM bank
	ldh [rVBK], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	call .CopyCroppedPic
	xor a
	ldh [rVBK], a
	pop hl
	ld a, [hli] ; first tile
	ld [wHOFTeamTile], a
	ld a, [wHallOfFameMonCounter]
	inc a ; palette = slot + 1
	or [hl] ; VRAM bank attribute
	inc hl
	ld [wHOFTeamAttr], a
	ld a, [hli]
	ld c, a ; x
	ld b, [hl] ; y
	call .PlacePic
	ld hl, wHallOfFameMonCounter
	inc [hl]
	jr .pic_loop

.pics_done
	call EnableLCD
	call WaitBGMap2 ; attrmap first, then tilemap
	jmp WaitButton

.LoadCenteredPlayerPic:
; The player's 5x7 card pic, moved 4 pixels right into 6x7 tiles so it's
; centered between the two columns of mons, to VRAM bank 1 vTiles2 tile $54.
; In wDecompressScratch the card pic gets a blank column on each side
; (columns are 7 tiles = 112 bytes, one byte per bitplane per pixel row), so
; each output byte = the right half of a column's byte, then the left half of
; the same byte in the next column.
	; (LoadPlayerCardPic reads wPlayerCharacter, so it can't run with the
	; scratch WRAM bank switched in: load it into the scratch VRAM first)
	xor a
	ldh [rVBK], a
	ld de, vTiles0
	farcall LoadPlayerCardPic
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	ld hl, wDecompressScratch
	ld bc, 7 * 7 tiles
	xor a
	rst ByteFill
	ld hl, vTiles0
	ld de, wDecompressScratch + 7 tiles
	ld bc, 5 * 7 tiles
	rst CopyBytes
	ld a, 1
	ldh [rVBK], a
	ld hl, wDecompressScratch
	ld de, vTiles2 tile $54
	ld bc, 6 * 7 tiles
.shift_byte
	push bc
	ld a, [hl]
	swap a
	and $f0
	ld b, a
	push hl
	ld a, l
	add LOW(7 tiles) ; the same byte in the next column
	ld l, a
	ld a, h
	adc HIGH(7 tiles)
	ld h, a
	ld a, [hl]
	swap a
	and $0f
	or b
	ld [de], a
	inc de
	pop hl
	inc hl
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .shift_byte
	xor a
	ldh [rVBK], a
	pop af
	ldh [rSVBK], a
	ret

.KeepPalette:
; Load the palette for wCurPartySpecies/wTempMonDVs and keep it in OBJ
; palette a.
	push af
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	pop af
	add a
	add a
	add a ; * 1 palettes
	ld e, a
	ld d, 0
	ld hl, wOBPals1
	add hl, de
	ld d, h
	ld e, l
	ld hl, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jmp FarCopyWRAM

.GetSlotMon:
; Set up wCurPartySpecies and wTempMonDVs for slot [wHallOfFameMonCounter].
; Returns carry if there's no mon in that slot.
	ld a, [wHallOfFameMonCounter]
	cp PARTY_LENGTH
	jr nc, .no_mon
	ld hl, wHallOfFameTempMon1
	ld bc, wHallOfFameTempMon1End - wHallOfFameTempMon1
	rst AddNTimes
	ld a, [hli]
	ld e, a
	ld [wHOFTeamSpecies], a
	ld a, [hli]
	ld d, a
	ld [wHOFTeamSpecies + 1], a
	and e
	inc a
	jr z, .no_mon ; species $ffff: end of the team
	push hl
	ld h, d
	ld l, e
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld [wTempMonSpecies], a
	pop hl
	inc hl ; skip the ID
	inc hl
	ld a, [hli]
	ld [wTempMonDVs], a
	ld a, [hl]
	ld [wTempMonDVs + 1], a
	ld hl, wTempMonDVs
	predef GetUnownLetter
	and a
	ret

.no_mon
	scf
	ret

.CopyCroppedPic:
; Copy the padded 7x7 pic in SRAM to VRAM at de as 7 columns of 6 tiles.
; The pic is stored by columns, and each column's 7 tiles are 56 pixel rows of
; 2 bytes in a row, so the crop can start at any pixel row: it's 96 bytes from
; each column, starting 2 bytes per dropped top row in.
; The LCD is off, so this is a plain copy.
	ld a, BANK(sPaddedEnemyFrontPic)
	call OpenSRAM
	push de
	call .GetCropTopRows
	pop de
	add a ; 2 bytes per pixel row
	ld c, a
	ld b, 0
	ld hl, sPaddedEnemyFrontPic
	add hl, bc
	push de
	push hl
	call .DrawFrame
	pop hl
	pop de
	ld a, 7 ; columns
.copy_column
	push af
	ld bc, 6 tiles
	rst CopyBytes ; hl and de advance
	ld bc, 1 tiles ; to the same pixel row in the next column
	add hl, bc
	pop af
	dec a
	jr nz, .copy_column
	jmp CloseSRAM

.GetCropTopRows:
; a = how many pixel rows (0-8) to drop from the top of the pic in SRAM:
; the species' entry in HOFCropTopRows, or else its blank rows (up to 8).
	ld a, [wHOFTeamSpecies]
	ld e, a
	ld a, [wHOFTeamSpecies + 1]
	ld d, a
	ld hl, HOFCropTopRows
.find_species
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	and c
	inc a
	jr z, .count_blank_rows ; -1: end of the list
	ld a, c
	cp e
	jr nz, .next_species
	ld a, b
	cp d
	jr nz, .next_species
	ld a, [hl]
	ret

.next_species
	inc hl
	jr .find_species

.count_blank_rows
	ld hl, sPaddedEnemyFrontPic
	ld b, 0
.check_pixel_row
	ld a, b
	cp 8
	ret z
	push hl
	ld c, 7 ; columns
.check_pixel_row_column
	ld a, [hli]
	or [hl]
	jr nz, .found_pixels
	ld de, 7 tiles - 1 ; same pixel row in the next column
	add hl, de
	dec c
	jr nz, .check_pixel_row_column
	pop hl
	inc hl ; next pixel row
	inc hl
	inc b
	jr .check_pixel_row

.found_pixels
	pop hl
	ld a, b
	ret

.DrawFrame:
; Draw a 1-pixel black line into the edge pixels of the 7x6 crop, like the
; trainer portraits' frame (DrawPortraitFrame in engine/events/pokepic.asm).
; hl = the crop's first byte in its first column (columns are 7 tiles apart)
	push hl
; Top and bottom edges: the crop's first and last pixel rows in each column.
	ld c, 7 ; columns
.frame_top_bottom
	push hl
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ld de, 6 tiles - 3 ; to the crop's last pixel row
	add hl, de
	ld [hli], a
	ld [hl], a
	pop hl
	ld de, 7 tiles ; next column
	add hl, de
	dec c
	jr nz, .frame_top_bottom
; Left and right edges: the leftmost pixel of the first column and the
; rightmost pixel of the last column, in every pixel row.
	pop hl
	push hl
	ld d, %10000000
	call .FrameSide
	pop hl
	ld de, 6 * 7 tiles ; the last column
	add hl, de
	ld d, %00000001
	; fallthrough
.FrameSide:
; OR d into both bitplanes of the crop's 48 pixel rows at hl
	ld c, 6 tiles
.frame_side
	ld a, [hl]
	or d
	ld [hli], a
	dec c
	jr nz, .frame_side
	ret

.PlacePic:
; Draw a pic stored by columns: wHOFTeamColumns x wHOFTeamRows tiles starting
; at tile wHOFTeamTile, with attribute wHOFTeamAttr, at screen x c, y b.
	; hl = wTilemap + y * SCREEN_WIDTH + x
	ld hl, wTilemap
	ld de, SCREEN_WIDTH
	inc b
.find_row
	dec b
	jr z, .got_row
	add hl, de
	jr .find_row
.got_row
	ld b, 0
	add hl, bc
	push hl

	; tiles, column by column
	ld a, [wHOFTeamTile]
	ld c, a
	ld a, [wHOFTeamColumns]
	ld e, a
.tile_column
	push hl
	ld a, [wHOFTeamRows]
	ld b, a
.tile_row
	ld [hl], c
	inc c
	push de
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	dec b
	jr nz, .tile_row
	pop hl
	inc hl
	dec e
	jr nz, .tile_column

	; attributes: the same box in wAttrmap
	pop hl
	ld de, wAttrmap - wTilemap
	add hl, de
	ld a, [wHOFTeamRows]
	ld b, a
.attr_row
	push hl
	ld a, [wHOFTeamColumns]
	ld c, a
	ld a, [wHOFTeamAttr]
.attr_column
	ld [hli], a
	dec c
	jr nz, .attr_column
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .attr_row
	ret

.Slots:
; VRAM bank, destination, first tile, attribute bank bit, x, y, padding
	db 0
	dw vTiles2 tile $00
	db $00, 0, 0, 0, 0
	db 0
	dw vTiles2 tile $2a
	db $2a, 0, 13, 0, 0
	db 1
	dw vTiles2 tile $00
	db $00, VRAM_BANK_1, 0, 6, 0
	db 1
	dw vTiles2 tile $2a
	db $2a, VRAM_BANK_1, 13, 6, 0
	db 1
	dw vTiles1 tile $00
	db $80, VRAM_BANK_1, 0, 12, 0
	db 1
	dw vTiles1 tile $2a
	db $aa, VRAM_BANK_1, 13, 12, 0

INCLUDE "data/pokemon/hof_crop_rows.asm"

HOFLeagueTitles:
; entries correspond to LEAGUE_* constants
	table_width 2
	dw HOFKantoLeagueGFX
	dw HOFJohtoLeagueGFX
	dw HOFHoennLeagueGFX
	dw HOFWorldCupGFX
	assert_table_length NUM_LEAGUES

HOFKantoLeagueGFX: INCBIN "gfx/hall_of_fame/kanto.2bpp"
HOFJohtoLeagueGFX: INCBIN "gfx/hall_of_fame/johto.2bpp"
HOFHoennLeagueGFX: INCBIN "gfx/hall_of_fame/hoenn.2bpp"
HOFWorldCupGFX:    INCBIN "gfx/hall_of_fame/world_cup.2bpp"
