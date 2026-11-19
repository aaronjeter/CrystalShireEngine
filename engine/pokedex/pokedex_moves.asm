; The Pokédex Moves page: one list of the moves the selected mon learns, under
; the headers Level-up, TM/HM, Tutor and Egg moves (a header is left out when
; its part is empty). Each line has a number (level, TM or HM), a type icon
; and the move's name. Up/Down move the highlight, Select jumps to the next
; header and A shows the highlighted move's details.

; wDexMoveList kinds
	const_def
	const DEXMOVE_HEADER ; number = DEXHEADER_*
	const DEXMOVE_LEVEL  ; number = level
	const DEXMOVE_TM     ; number = TM number
	const DEXMOVE_HM     ; number = HM number
	const DEXMOVE_TUTOR
	const DEXMOVE_EGG

	const_def
	const DEXHEADER_LEVEL
	const DEXHEADER_TMHM
	const DEXHEADER_TUTOR
	const DEXHEADER_EGG

DEF DEXMOVES_LINES     EQU 8 ; lines shown, one type icon slot and OBJ palette each
DEF DEXMOVES_FIRST_ROW EQU 2 ; lines are on every other row from here
DEF DEXMOVES_ICON_X    EQU 4 * TILE_WIDTH - POKEDEX_SCX ; screen x of the icons (column 4)
DEF DEXMOVES_NAME_COL  EQU 8
DEF DEXMOVES_HIGHLIGHT_PAL EQU 2 ; BG palette of the highlighted line
DEF DEXMOVES_MAX       EQU 255

Pokedex_DrawMovesPage:
; Build the list for the selected mon and draw the page (without the icons
; and the highlight, which come after the palettes in Pokedex_MovesAfterLayout).
	call Pokedex_DrawPageFrame
	call Pokedex_GetSelectedMon
	ld [wDexMovesSpecies], a
	call Pokedex_BuildMoveList
	xor a
	ld [wDexMovesScroll], a
	call Pokedex_MovesFirstMoveFrom
	ld a, c
	ld [wDexMovesCursor], a
	jmp Pokedex_MovesDrawLines

Pokedex_MovesAfterLayout:
; The type icons and the highlight, once the page's palettes are loaded.
	farcall LoadTypeIconGFX
	call Pokedex_SetHighlightPal
	jmp Pokedex_MovesRedraw

Pokedex_MovesInput:
; Up/Down, Select and A on the Moves page.
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jmp nz, Pokedex_MovesDetails
	ld a, [hl]
	and SELECT
	jr nz, .next_header
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	ret z

; down: the next move line
	ld a, [wDexMovesCursor]
.down_loop
	inc a
	ld hl, wDexMoveCount
	cp [hl]
	ret nc
	ld c, a
	call Pokedex_MovesGetLine
	ld a, c
	jr z, .down_loop ; header
	jr .moved

.up
	ld a, [wDexMovesCursor]
.up_loop
	and a
	ret z
	dec a
	ld c, a
	call Pokedex_MovesGetLine
	ld a, c
	jr z, .up_loop ; header
	jr .moved

.next_header
	ld a, [wDexMovesCursor]
.header_loop
	inc a
	ld hl, wDexMoveCount
	cp [hl]
	jr nc, .wrap
	ld c, a
	call Pokedex_MovesGetLine
	ld a, c
	jr nz, .header_loop
	jr .header_found
.wrap
	xor a
.header_found
	; the first move under it
	call Pokedex_MovesFirstMoveFrom
	ld a, [wDexMovesCursor]
	cp c
	ret z
	ld a, c
	; the header line stays in view when it can
	ld [wDexMovesCursor], a
	dec a
	ld [wDexMovesScroll], a
	call Pokedex_MovesClampScroll
	jr Pokedex_MovesRedraw

.moved
	ld [wDexMovesCursor], a
	; keep the cursor in view
	ld hl, wDexMovesScroll
	cp [hl]
	jr nc, .not_above
	ld [hl], a
	; show the header above the first move of a part
	and a
	jr z, Pokedex_MovesRedraw
	dec a
	ld c, a
	call Pokedex_MovesGetLine
	jr nz, Pokedex_MovesRedraw
	ld a, c
	ld [wDexMovesScroll], a
	jr Pokedex_MovesRedraw

.not_above
	sub DEXMOVES_LINES - 1
	jr c, Pokedex_MovesRedraw
	cp [hl]
	jr c, Pokedex_MovesRedraw
	ld [hl], a
	; fallthrough

Pokedex_MovesRedraw:
; Redraw the lines, the highlight and the icons.
	call Pokedex_MovesDrawLines
	call Pokedex_MovesHighlight
	call Pokedex_MovesPlaceIcons
	call CopyTilemapAtOnce
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

Pokedex_MovesFirstMoveFrom:
; c = the first move line at or after line a (or a if there's none).
	push af
.loop
	ld hl, wDexMoveCount
	cp [hl]
	jr nc, .none
	ld c, a
	call Pokedex_MovesGetLine
	ld a, c
	jr nz, .found
	inc a
	jr .loop

.found
	pop af
	ret

.none
	pop af
	ld c, a
	ret

Pokedex_MovesClampScroll:
; Keep wDexMovesScroll from showing empty lines at the bottom.
	ld a, [wDexMoveCount]
	sub DEXMOVES_LINES
	jr nc, .max
	xor a
.max
	ld hl, wDexMovesScroll
	cp [hl]
	ret nc
	ld [hl], a
	ret

Pokedex_MovesGetLine:
; Line c of wDexMoveList: b = number, a = move (0 for a header), with z for a
; header. d = kind. Preserves c.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDexMoveList)
	ldh [rSVBK], a
	ld hl, wDexMoveList
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld e, [hl]
	pop af
	ldh [rSVBK], a
	ld a, d
	and a ; DEXMOVE_HEADER
	ld a, e
	ret z
	and a
	ret nz
	inc a ; a move line always has nz
	ld a, e
	ret

Pokedex_MovesDrawLines:
; The text of the lines shown.
	hlcoord 1, 1
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 1
	call ClearBox
	ld a, [wDexMoveCount]
	and a
	jr nz, .lines
	hlcoord 2, DEXMOVES_FIRST_ROW
	ld de, .NoMoves
	rst PlaceString
	ret

.lines
	ld a, [wDexMovesScroll]
	ld c, a
	hlcoord 0, DEXMOVES_FIRST_ROW
	ld b, DEXMOVES_LINES
.loop
	ld a, [wDexMoveCount]
	cp c
	ret z
	push bc
	push hl
	call .DrawLine
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc c
	dec b
	jr nz, .loop
	ret

.DrawLine:
; line c at hl (column 0)
	push hl
	call Pokedex_MovesGetLine
	pop hl
	jr z, .header
	push af
	ld a, d
	push hl
	inc hl
	call .Number
	pop hl
	ld de, DEXMOVES_NAME_COL
	add hl, de
	pop af
	ld [wNamedObjectIndex], a
	push hl
	call GetMoveName
	pop hl
	rst PlaceString
	ret

.header
	; a rule across the row, then the name over its start
	inc hl
	push hl
	push bc
	ld bc, SCREEN_WIDTH - 1
	ld a, $61
	rst ByteFill
	pop bc
	ld a, b
	ld hl, .Headers
	call Pokedex_LoadPointer
	ld d, h
	ld e, l
	pop hl
	rst PlaceString
	ld h, b
	ld l, c
	ld [hl], " "
	ret

.Number:
; the level, TM or HM number of kind a, number b at hl (3 tiles)
	cp DEXMOVE_LEVEL
	jr z, .level
	cp DEXMOVE_TM
	ld e, "T"
	jr z, .machine
	cp DEXMOVE_HM
	ld e, "H"
	ret nz
.machine
	ld [hl], e
	inc hl
	ld a, b
	ld [wDexMovesNumber], a
	ld de, wDexMovesNumber
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jmp PrintNum

.level
	ld a, b
	ld [wDexMovesNumber], a
	ld de, wDexMovesNumber
	lb bc, 1, 3
	jmp PrintNum

.Headers:
	dw .LevelStr
	dw .TMHMStr
	dw .TutorStr
	dw .EggStr

.LevelStr: db "Level-up@"
.TMHMStr:  db "TM/HM@"
.TutorStr: db "Tutor@"
.EggStr:   db "Egg moves@"
.NoMoves:  db "No moves@"

Pokedex_MovesHighlight:
; The highlighted line's row in DEXMOVES_HIGHLIGHT_PAL, the others in 0.
	hlcoord 1, 1, wAttrmap
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 1
	xor a
	call FillBoxWithByte
	ld a, [wDexMoveCount]
	and a
	ret z
	ld a, [wDexMovesScroll]
	ld b, a
	ld a, [wDexMovesCursor]
	sub b
	ret c
	cp DEXMOVES_LINES
	ret nc
	add a
	add DEXMOVES_FIRST_ROW
	hlcoord 1, 0, wAttrmap
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	ld a, DEXMOVES_HIGHLIGHT_PAL
	ld bc, SCREEN_WIDTH - 1
	rst ByteFill
	ret

Pokedex_MovesPlaceIcons:
; The type icon of each move line shown: line n uses icon slot and OBJ palette
; 7 - n, so the move details box (slots 6-7) borrows the icons of lines 0-1,
; which it covers.
	farcall HideTypeIcons
	ld a, [wDexMovesScroll]
	ld c, a
	ld b, 0 ; line on screen
.loop
	ld a, [wDexMoveCount]
	cp c
	ret z
	ld a, b
	cp DEXMOVES_LINES
	ret z
	push bc
	call Pokedex_MovesGetLine
	pop bc
	jr z, .next ; header
	push bc
	farcall GetMoveTypeIcon
	push af
	ld a, DEXMOVES_LINES - 1
	sub b
	ld d, a
	ld e, a
	ld a, b
	add a
	add DEXMOVES_FIRST_ROW
	ld b, a
	pop af
	ld c, DEXMOVES_ICON_X
	farcall PlaceTypeIconAtX
	pop bc
.next
	inc b
	inc c
	jr .loop

Pokedex_SetHighlightPal:
; BG palette DEXMOVES_HIGHLIGHT_PAL: white text on red.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, .Pal
	ld de, wBGPals1 palette DEXMOVES_HIGHLIGHT_PAL
	ld bc, 1 palettes
	rst CopyBytes
	ld hl, .Pal
	ld de, wBGPals2 palette DEXMOVES_HIGHLIGHT_PAL
	ld bc, 1 palettes
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	ret

.Pal:
	RGB 31, 31, 31
	RGB 31, 20, 10
	RGB 16, 04, 02
	RGB 26, 10, 06

Pokedex_MovesDetails:
; The highlighted move's details box, until A or B.
	ld a, [wDexMoveCount]
	and a
	ret z
	ld a, [wDexMovesCursor]
	ld c, a
	call Pokedex_MovesGetLine
	ret z
	push af
	; the box puts the screen back from wTempTilemap
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTempTilemap)
	ldh [rSVBK], a
	hlcoord 0, 0
	ld de, wTempTilemap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	pop af
	ld c, 0
	farcall MoveInfo_OpenPrompt
.wait
	call DelayFrame
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	jr z, .wait
	farcall MoveInfo_ClosePrompt
	jmp Pokedex_MovesRedraw

Pokedex_BuildMoveList:
; wDexMoveList for species [wDexMovesSpecies].
	xor a
	ld [wDexMoveCount], a

	; level-up moves
	lb bc, DEXMOVE_HEADER, DEXHEADER_LEVEL
	call Pokedex_AddMoveLine
	ld a, [wDexMovesSpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ld a, h
	or l
	jr z, .level_done
	call FarSkipEvolutions
.level_loop
	ld a, b
	call GetFarByte ; level, 0 = end
	and a
	jr z, .level_done
	inc hl
	ld c, a
	push hl
	push bc
	ld a, b
	call GetFarWord ; move index
	call GetMoveIDFromIndex
	pop bc
	push bc
	ld b, DEXMOVE_LEVEL ; c = level
	call Pokedex_AddMoveLine
	pop bc
	pop hl
	inc hl
	inc hl
	jr .level_loop
.level_done
	call Pokedex_DropEmptyHeader

	; TMs and HMs, then tutor moves
	lb bc, DEXMOVE_HEADER, DEXHEADER_TMHM
	call Pokedex_AddMoveLine
	ld c, 0 ; TMHMMoves index
.tmhm_loop
	ld a, c
	cp NUM_TMS + NUM_HMS
	jr nz, .not_tutors
	push bc
	call Pokedex_DropEmptyHeader
	lb bc, DEXMOVE_HEADER, DEXHEADER_TUTOR
	call Pokedex_AddMoveLine
	pop bc
	ld a, c
.not_tutors
	cp NUM_TM_HM_TUTOR
	jr z, .tmhm_done
	push bc
	ld b, 0
	ld hl, TMHMMoves
	add hl, bc
	add hl, bc
	ld a, BANK(TMHMMoves)
	call GetFarWord
	call GetMoveIDFromIndex
	ld [wPutativeTMHMMove], a
	ld a, [wDexMovesSpecies]
	ld [wCurPartySpecies], a
	predef CanLearnTMHMMove
	ld a, c
	pop bc
	and a
	jr z, .tmhm_next
	push bc
	ld a, c
	cp NUM_TMS
	jr c, .tm
	sub NUM_TMS
	cp NUM_HMS
	jr c, .hm
	ld b, DEXMOVE_TUTOR
	jr .add_tmhm
.tm
	ld b, DEXMOVE_TM
	jr .add_tmhm
.hm
	ld b, DEXMOVE_HM
.add_tmhm
	inc a
	ld c, a
	ld a, [wPutativeTMHMMove]
	call Pokedex_AddMoveLine
	pop bc
.tmhm_next
	inc c
	jr .tmhm_loop
.tmhm_done
	call Pokedex_DropEmptyHeader

	; egg moves
	lb bc, DEXMOVE_HEADER, DEXHEADER_EGG
	call Pokedex_AddMoveLine
	ld a, [wDexMovesSpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EggMovePointers
	ld a, BANK(EggMovePointers)
	call LoadDoubleIndirectPointer
	ld a, h
	or l
	jr z, .egg_done
.egg_loop
	push hl
	ld a, b
	call GetFarWord ; move index, -1 = end
	ld a, h
	and l
	inc a
	jr z, .egg_end
	push bc
	call GetMoveIDFromIndex
	lb bc, DEXMOVE_EGG, 0
	call Pokedex_AddMoveLine
	pop bc
	pop hl
	inc hl
	inc hl
	jr .egg_loop
.egg_end
	pop hl
.egg_done
	; fallthrough

Pokedex_DropEmptyHeader:
; Remove the last line if it's a header (its part is empty).
	ld a, [wDexMoveCount]
	and a
	ret z
	dec a
	ld c, a
	call Pokedex_MovesGetLine
	ret nz
	ld a, c
	ld [wDexMoveCount], a
	ret

Pokedex_AddMoveLine:
; Add the line kind b, number c, move a. Preserves bc and de.
	push de
	push hl
	ld e, a
	ld a, [wDexMoveCount]
	cp DEXMOVES_MAX
	jr z, .full
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDexMoveList)
	ldh [rSVBK], a
	push bc
	ld a, [wDexMoveCount]
	ld c, a
	ld b, 0
	ld hl, wDexMoveList
	add hl, bc
	add hl, bc
	add hl, bc
	pop bc
	ld [hl], b
	inc hl
	ld [hl], c
	inc hl
	ld [hl], e
	pop af
	ldh [rSVBK], a
	ld hl, wDexMoveCount
	inc [hl]
.full
	pop hl
	pop de
	ret
