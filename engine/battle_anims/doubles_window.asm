; Per-line battle effects on the double battle screen (Tackle, wobbles, Night Shade...)
; shift whole screen lines, and both pics on a side share their lines. To move only the
; targeted pic, the right-hand pic of that side (E2 or P2, which reaches the screen's right
; edge with the HP boxes) is copied onto the window layer while the effect runs:
; - the effect moves the left pic (E1 or P1): the background moves as before (SCX or SCY)
;   and the window keeps the partner still;
; either way the background's copy of the right pic is blanked while the window shows it;
; - an SCX effect moves the right pic: the window holds it and LCDDoublesWX moves the window
;   instead (rWX = hWX - the line's SCX value); the background stays still;
; - an SCY effect moves the right pic: no window (it can't move up or down per line), so
;   both pics move, as before.
; DoublesAnimWindowOn starts it (BGEffect_DoublesLYRange), DoublesAnimWindowOff ends it (the
; effects' LCD resets, and the end of every battle animation).

	assert BATTLER_SLOT_P2 == BATTLER_SLOT_P1 + 1 && BATTLER_SLOT_E2 == BATTLER_SLOT_E1 + 1
	assert BATTLER_SLOT_P2 & 1 && BATTLER_SLOT_E2 & 1 ; bit 0: the right-hand pic

DEF DOUBLES_WINDOW_WX_F EQU 7 ; wDoublesAnimWindow: the window moves (LCDDoublesWX)
DEF DOUBLES_WINDOW_ON_F EQU 6 ; wDoublesAnimWindow: the window is shown; bit 0: the side
DEF DOUBLES_WINDOW_BLANK_ATTR EQU PAL_BATTLE_BG_ENEMY_HP ; the empty field's palette (DoublesBuildAttrmap)
DEF DOUBLES_WINDOW_MARGIN EQU 2 ; blank columns after the copy (the window moving left)

DoublesWindowSides:
; per side (0: the player's, 1: the enemy's): the right-hand pic's x, y, size
	db  6, 7, 6 ; P2: 6x6 at (6, 7)
	db 13, 0, 7 ; E2: 7x7 at (13, 0)

DoublesAnimWindowOn::
; A per-line effect starts on the double battle screen: hLCDCPointer = its register,
; d = its first line (0: the enemy's side). Preserves bc, de, hl.
	push bc
	push de
	push hl
	call .on
	pop hl
	pop de
	pop bc
	ret

.on
	ld a, [wDoublesAnimWindow]
	and a
	ret nz ; already on
	ldh a, [hLCDCPointer]
	ld e, a
	cp LOW(rSCX)
	jr z, .reg_ok
	cp LOW(rSCY)
	ret nz
.reg_ok
	ld c, 0
	ld a, d
	and a
	jr nz, .got_side
	inc c ; the enemy's side
.got_side
	ld b, 0
	ld hl, wAreaSlots ; area = side in v1 (no ally hits)
	add hl, bc
	ld a, [hl]
	bit 0, a
	jr nz, .right
; the effect moves the left pic: the window keeps the right one still, if it's shown
	inc a
	ld b, a
	ld a, [wDoublesShown]
.shift
	rrca
	dec b
	jr nz, .shift
	ret nc ; not shown
	ld a, c
	jr .start

.right
	ld a, e
	cp LOW(rSCX)
	ret nz ; SCY: both pics move
	ld a, c
	or 1 << DOUBLES_WINDOW_WX_F
.start
	or 1 << DOUBLES_WINDOW_ON_F
	ld [wDoublesAnimWindow], a
	ld hl, DoublesWindowSides
	ld a, c
	add a
	add c
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hli]
	ld [wDoublesAnimWindowX], a
	ld a, [hli]
	ld [wDoublesAnimWindowY], a
	ld a, [hl]
	ld [wDoublesAnimWindowSize], a
	ldh a, [hWX]
	ld [wDoublesAnimWindowSavedWX], a
	ldh a, [hWY]
	ld [wDoublesAnimWindowSavedWY], a

	call DoublesWindowCopyScreen
	ld a, [wDoublesAnimWindowX]
	add a
	add a
	add a
	add 7 ; (rWX is the window's x + 7)
	ldh [hWX], a
	ldh [rWX], a ; (the cutscene VBlank handlers don't copy hWX and hWY)
	ld a, [wDoublesAnimWindowY]
	add a
	add a
	add a
	ldh [hWY], a
	ldh [rWY], a
	ld a, [wDoublesAnimWindow]
	bit DOUBLES_WINDOW_WX_F, a
	jr z, .blank
; the window moves the right pic
	di
	ld a, LOW(LCDDoublesWX)
	ldh [hFunctionTargetLo], a
	ld a, HIGH(LCDDoublesWX)
	ldh [hFunctionTargetHi], a
	ei
.blank
; the background's copy of the right pic is blanked once the window is shown (next frame),
; so neither a pic moving away nor the left one moving under it shows a stray copy
	call DelayFrame
	ld a, TRUE
	jr DoublesWindowSwapPic

DoublesAnimWindowOff::
; The per-line effect ends: put the background back and hide the window. Preserves bc, de, hl.
	push bc
	push de
	push hl
	call .off
	pop hl
	pop de
	pop bc
	ret

.off
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ret nc ; (wDoublesAnimWindow is in the battle variables' union)
	ld a, [wDoublesAnimWindow]
	and a
	ret z
	bit DOUBLES_WINDOW_WX_F, a
	jr z, .restore
	di
	ld a, LOW(LCDGeneric)
	ldh [hFunctionTargetLo], a
	ld a, HIGH(LCDGeneric)
	ldh [hFunctionTargetHi], a
	ei
.restore
	xor a
	call DoublesWindowSwapPic
	ld a, [wDoublesAnimWindowSavedWY]
	ldh [hWY], a
	ldh [rWY], a
	ld a, [wDoublesAnimWindowSavedWX]
	ldh [hWX], a
	ldh [rWX], a
	xor a
	ld [wDoublesAnimWindow], a
	ret

DoublesWindowSwapPic:
; a = TRUE: save the right-hand pic's tiles and attributes (wTilemap, wAttrmap) and blank
; them; FALSE: put them back. Then the background map gets them too.
	ld [wDoublesAnimWindowSaving], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesAnimWindowBuf)
	ldh [rSVBK], a
	call DoublesWindowPicPos
	push hl
	ld de, wDoublesAnimWindowBuf
	ld a, [wDoublesAnimWindowSize]
	ld [wDoublesAnimWindowRows], a
.row
	push hl
	ld a, [wDoublesAnimWindowSize]
	ld [wDoublesAnimWindowCols], a
.col
	ld bc, wAttrmap - wTilemap
	ld a, [wDoublesAnimWindowSaving]
	and a
	jr z, .restore
	ld a, [hl]
	ld [de], a
	inc de
	ld [hl], " "
	push hl
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de
	ld [hl], DOUBLES_WINDOW_BLANK_ATTR
	pop hl
	jr .next

.restore
	ld a, [de]
	inc de
	ld [hl], a
	push hl
	add hl, bc
	ld a, [de]
	inc de
	ld [hl], a
	pop hl
.next
	inc hl
	ld a, [wDoublesAnimWindowCols]
	dec a
	ld [wDoublesAnimWindowCols], a
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, [wDoublesAnimWindowRows]
	dec a
	ld [wDoublesAnimWindowRows], a
	jr nz, .row
	pop hl
	pop af
	ldh [rSVBK], a
; the background map
	ld a, [wDoublesAnimWindowY]
	ld e, a
	ld d, 0
	ld b, 5
.times32
	sla e
	rl d
	dec b
	jr nz, .times32
	ld a, [wDoublesAnimWindowX]
	add e
	ld e, a
	ld a, HIGH(vBGMap0)
	adc d
	ld d, a ; de = vBGMap0 + y * BG_MAP_WIDTH + x
	ld a, [wDoublesAnimWindowSize]
	ld b, a
	ld c, 0
	jr DoublesWindowCopyRect

DoublesWindowPicPos:
; hl = wTilemap at the right-hand pic (wDoublesAnimWindowX, Y)
	ld a, [wDoublesAnimWindowY]
	ld l, a
	ld h, 0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, hl
	add hl, hl ; y * SCREEN_WIDTH
	ld a, [wDoublesAnimWindowX]
	ld e, a
	add hl, de
	ld de, wTilemap
	add hl, de
	ret

DoublesWindowCopyScreen:
; The window map: the screen from the right-hand pic's x and y to the right and bottom
; edges, then DOUBLES_WINDOW_MARGIN blank columns.
	call DoublesWindowPicPos
	ld de, vBGMap1
	ld a, [wDoublesAnimWindowX]
	cpl
	add SCREEN_WIDTH + 1
	ld [wDoublesAnimWindowCols], a ; (a = SCREEN_WIDTH - x)
	ld a, [wDoublesAnimWindowY]
	cpl
	add SCREEN_HEIGHT + 1
	ld b, a
	ld a, [wDoublesAnimWindowCols]
	ld c, DOUBLES_WINDOW_MARGIN
	; fallthrough

DoublesWindowCopyRect:
; Copy a ROWS (b) x COLS (a) block of wTilemap at hl (and wAttrmap's) to the BG map at de
; in VRAM, with c blank columns after each row, while the screen is on.
	ld [wDoublesAnimWindowCols], a
	ld a, c
	ld [wDoublesAnimWindowMargin], a
	ld a, b
	ld [wDoublesAnimWindowRows], a
.row
	push hl
	push de
	ld a, [wDoublesAnimWindowCols]
	ld b, a
.col
	ld a, [hl]
	call DoublesWindowPut0
	push hl
	push bc
	ld bc, wAttrmap - wTilemap
	add hl, bc
	pop bc
	ld a, [hl]
	pop hl
	call DoublesWindowPut1
	inc hl
	inc de
	dec b
	jr nz, .col
	ld a, [wDoublesAnimWindowMargin]
	and a
	jr z, .next_row
	ld b, a
.margin
	ld a, " "
	call DoublesWindowPut0
	ld a, DOUBLES_WINDOW_BLANK_ATTR
	call DoublesWindowPut1
	inc de
	dec b
	jr nz, .margin
.next_row
	pop hl ; the map row
	ld de, BG_MAP_WIDTH
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, [wDoublesAnimWindowRows]
	dec a
	ld [wDoublesAnimWindowRows], a
	jr nz, .row
	ret

DoublesWindowPut0:
; [de] = a in VRAM bank 0, when VRAM can be written. Preserves bc, de, hl.
	push bc
	ld c, 0
	jr DoublesWindowPut

DoublesWindowPut1:
; [de] = a in VRAM bank 1
	push bc
	ld c, 1
DoublesWindowPut:
	ld b, a
	di ; (the VBlank handler may switch VRAM banks)
.wait
	ldh a, [rSTAT]
	bit 1, a ; mode 2 or 3
	jr nz, .wait
	ld a, c
	ldh [rVBK], a
	ld a, b
	ld [de], a
	xor a
	ldh [rVBK], a
	ei
	pop bc
	ret
