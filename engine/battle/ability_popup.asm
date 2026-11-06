; Ability popups: a black banner with white text against the screen edge on the holder's
; side, naming the Pokémon (3x5 font) and its ability (VWF font). It slides in from the edge
; and stays until HideAbilityPopup slides it out. One popup at a time.
; Drawn with the party cards' renderer (party_cards.asm) into its canvas in WRAM bank 6,
; then copied to VRAM bank 1 tiles AP_TILE.. (free in battle: below the doubles' E2 and P2
; pics and above a front pic's animation frames, which are only there while it animates).

DEF AP_TILE     EQU $80 ; 2 rows of SCREEN_WIDTH tiles (VRAM bank 1)
DEF AP_ATTR     EQU PAL_BATTLE_BG_TEXT | VRAM_BANK_1
DEF AP_SAVE     EQU PC_CANVAS + 2 * SCREEN_WIDTH tiles ; the 2 screen rows under it: tiles, then attributes
DEF AP_NAME     EQU AP_SAVE + 4 * SCREEN_WIDTH ; the Pokémon's name
DEF AP_ABILITY  EQU AP_NAME + MON_NAME_LENGTH ; the ability's name
DEF AP_BUFFER2  EQU AP_ABILITY + STRING_BUFFER_LENGTH ; wStringBuffer2, kept
DEF AP_SLIDE_STEP EQU 2 ; tiles per frame
DEF AP_MAX_WIDTH  EQU 11 ; tiles, the slant included ("Elemental Blade" needs 11)
	assert AP_BUFFER2 + STRING_BUFFER_LENGTH <= PC_STAGE

; wAbilityPopup: 0, or AP_SHOWN_F | the area (0: the player's side, 1: the enemy's)
DEF AP_SHOWN_F EQU 7

AbilityPopupUser::
; The popup for the ability of hBattleTurn's battler. Preserves all registers.
	push af
	ldh a, [hBattleTurn]
	jr AbilityPopup

AbilityPopupTarget::
; The popup for the ability of hBattleTurn's opponent. Preserves all registers.
	push af
	ldh a, [hBattleTurn]
	xor 1
	; fallthrough

AbilityPopup:
	push bc
	push de
	push hl
	ld c, a
	ld a, [wAbilityPopup]
	bit AP_SHOWN_F, a
	jr z, .show
	and 1
	cp c
	jr z, .done ; already shown for this side
	push bc
	call HideAbilityPopup
	pop bc
.show
	ld a, c
	call AP_Show
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

HideAbilityPopup::
; Slide the popup out, if one is shown. Preserves all registers.
	push af
	ld a, [wAbilityPopup]
	bit AP_SHOWN_F, a
	jr z, .none
	push bc
	push de
	push hl
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld a, [wAbilityPopupWidth]
.slide
	sub AP_SLIDE_STEP
	jr nc, .step
	xor a
.step
	push af
	call AP_Compose
	call AP_PushRows
	call DelayFrame
	pop af
	and a
	jr nz, .slide
	xor a
	ld [wAbilityPopup], a
	pop af
	ldh [rSVBK], a
	pop hl
	pop de
	pop bc
.none
	pop af
	ret

AbilityPopupAttrs::
; The popup's tiles and attributes in wTilemap and wAttrmap again, if one is shown: for the
; code that rebuilds the battle screen's attributes (_CGB_FinishBattleScreenLayout,
; DoublesBuildAttrmap). Preserves all registers.
	push af
	ld a, [wAbilityPopup]
	bit AP_SHOWN_F, a
	jr z, .none
	push bc
	push de
	push hl
	call AP_RowAddr
	ld a, [wAbilityPopupWidth]
	call AP_Overlay
	pop hl
	pop de
	pop bc
.none
	pop af
	ret

AP_Show:
; Show the popup for area a.
	or 1 << AP_SHOWN_F
	ld [wAbilityPopup], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wEnemyMonAbility)
	ldh [rSVBK], a
	ld a, [wAbilityPopup]
	rrca
	ld hl, wBattleMonNickname
	ld a, [wBattleMonAbility]
	jr nc, .got_side
	ld hl, wEnemyMonNickname
	ld a, [wEnemyMonAbility]
.got_side
	push hl
	push af
	; GetAbilityName writes wStringBuffer2: keep what the caller has there
	ld hl, wStringBuffer2
	ld de, AP_BUFFER2
	call AP_ToWRAM6
	pop af
	farcall GetAbilityName
	ld hl, wStringBuffer2
	ld de, AP_ABILITY
	call AP_ToWRAM6
	ld hl, AP_BUFFER2
	ld de, wStringBuffer2
	call AP_FromWRAM6
	ld a, PC_WRAM
	ldh [rSVBK], a
	pop hl
	ld de, AP_NAME
	ld bc, MON_NAME_LENGTH
	rst CopyBytes

	call AP_Render
	call AP_SaveRows
	ld a, AP_SLIDE_STEP
.slide
	ld b, a
	ld a, [wAbilityPopupWidth]
	cp b
	jr nc, .step
	ld b, a
.step
	push bc
	ld a, b
	call AP_Compose
	call AP_PushRows
	call DelayFrame
	pop bc
	ld a, [wAbilityPopupWidth]
	cp b
	ld a, b
	jr z, .shown
	add AP_SLIDE_STEP
	jr .slide
.shown
	pop af
	ldh [rSVBK], a
	ret

AP_Render:
; Draw the banner into the canvas (columns 0 to width - 1 of 2 rows) and copy it to VRAM.
	ld a, SCREEN_WIDTH
	ld [PC_DATA + PCV_W], a
	ld hl, PC_CANVAS
	ld bc, 2 * SCREEN_WIDTH tiles
	xor a
	rst ByteFill
	; the width: the longer line, 4 pixels on each side, and the slant's tile
	ld hl, AP_NAME
	call PC_TinyWidth
	ld b, a
	push bc
	ld de, AP_ABILITY
	call GetVWFLength
	pop bc
	cp b
	jr nc, .got_text_width
	ld a, b
.got_text_width
	add 4 + 4 + 7
	srl a
	srl a
	srl a
	inc a ; the slant
	cp AP_MAX_WIDTH + 1
	jr c, .got_width
	ld a, AP_MAX_WIDTH
.got_width
	ld [wAbilityPopupWidth], a
	; the black body and the slanted inner end (the player's on the right, a foe's on the left)
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld a, [wAbilityPopupWidth]
	dec a
	add a
	add a
	add a
	ld b, a ; the body's width in pixels
	ld c, 2 * TILE_WIDTH
	ld d, 0
	call AP_IsFoe
	jr z, .body
	ld d, TILE_WIDTH
.body
	ld e, 0
	push bc
	call PC_FillRect
	pop bc
	; the slant: row y keeps 8 - y / 2 pixels next to the body
	ld e, 0
.slant
	ld a, e
	srl a
	cpl
	add TILE_WIDTH + 1 ; 8 - y / 2
	ld b, a
	call AP_IsFoe
	jr nz, .foe_slant
	ld a, [wAbilityPopupWidth]
	dec a
	add a
	add a
	add a
	ld d, a
	jr .slant_row
.foe_slant
	ld a, e
	srl a
	ld d, a
.slant_row
	push de
	call PC_HLine
	pop de
	inc e
	ld a, e
	cp 2 * TILE_WIDTH
	jr nz, .slant
	; the text, in white, 4 pixels after the body's start
	xor a
	ld [PC_DATA + PCV_COLOR], a
	ld d, 4
	call AP_IsFoe
	jr z, .got_x
	ld d, TILE_WIDTH + 4
.got_x
	push de
	ld e, 2
	ld hl, AP_NAME
	call PC_TinyString
	pop de
	ld c, d
	ld de, AP_ABILITY
	call PC_VWFStrip
	xor a
	ld b, 0
	ld a, [wAbilityPopupWidth]
	ld c, a
	xor a
	call PC_MergeStrip
	ld a, AP_TILE
	ld de, PC_CANVAS
	ld c, 2 * SCREEN_WIDTH
	jmp PC_Transfer

AP_ToWRAM6:
; Copy STRING_BUFFER_LENGTH bytes from hl (WRAM bank 1) to de (WRAM bank 6); bank 1 is selected after.
	ld c, STRING_BUFFER_LENGTH
.loop
	ld a, BANK(wStringBuffer2)
	ldh [rSVBK], a
	ld a, [hli]
	ld b, a
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld a, b
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ld a, BANK(wStringBuffer2)
	ldh [rSVBK], a
	ret

AP_FromWRAM6:
; Copy STRING_BUFFER_LENGTH bytes from hl (WRAM bank 6) to de (WRAM bank 1); bank 1 is selected after.
	ld c, STRING_BUFFER_LENGTH
.loop
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld a, [hli]
	ld b, a
	ld a, BANK(wStringBuffer2)
	ldh [rSVBK], a
	ld a, b
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

AP_IsFoe:
; nz if the popup is on the enemy's side
	ld a, [wAbilityPopup]
	and 1
	ret

AP_Row:
; a = the popup's first screen row: rows 4-5 in singles; in doubles 7-8 (the player's side)
; or 5-6 (the enemy's)
	ldh a, [hDoublesScreen]
	bit DOUBLES_SCREEN_F, a
	ld a, 4
	ret z
	call AP_IsFoe
	ld a, 7
	ret z
	ld a, 5
	ret

AP_RowAddr:
; hl = the popup's first row in wTilemap
	call AP_Row
	ld hl, wTilemap
	ld bc, SCREEN_WIDTH
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret

AP_SaveRows:
	call AP_RowAddr
	push hl
	ld de, AP_SAVE
	ld bc, 2 * SCREEN_WIDTH
	rst CopyBytes
	pop hl
	ld bc, wAttrmap - wTilemap
	add hl, bc
	ld bc, 2 * SCREEN_WIDTH
	rst CopyBytes
	ret

AP_Compose:
; The 2 rows in wTilemap and wAttrmap: what was under the popup, with its a columns
; nearest the edge (sliding in from the edge) over it.
	push af
	call AP_RowAddr
	push hl
	ld d, h
	ld e, l
	ld hl, AP_SAVE
	ld bc, 2 * SCREEN_WIDTH
	rst CopyBytes
	pop hl
	push hl
	ld bc, wAttrmap - wTilemap
	add hl, bc
	ld d, h
	ld e, l
	ld hl, AP_SAVE + 2 * SCREEN_WIDTH
	ld bc, 2 * SCREEN_WIDTH
	rst CopyBytes
	pop hl ; the first row in wTilemap
	pop af
	; fallthrough

AP_Overlay:
; The popup's a columns nearest the edge over the 2 rows from hl in wTilemap (and wAttrmap).
	and a
	ret z
	ld c, a ; columns shown
	; b = the first banner column shown, de = the screen column it goes to
	call AP_IsFoe
	jr nz, .foe
	ld a, [wAbilityPopupWidth]
	sub c
	ld b, a
	ld de, 0
	jr .got
.foe
	ld b, 0
	ld a, SCREEN_WIDTH
	sub c
	ld e, a
	ld d, 0
.got
	add hl, de
.column
	ld a, b
	add AP_TILE
	ld [hl], a
	add SCREEN_WIDTH
	ld de, SCREEN_WIDTH
	push hl
	add hl, de
	ld [hl], a
	ld de, wAttrmap - wTilemap
	add hl, de
	ld [hl], AP_ATTR
	ld de, -SCREEN_WIDTH
	add hl, de
	ld [hl], AP_ATTR
	pop hl
	inc hl
	inc b
	dec c
	jr nz, .column
	ret

AP_PushRows:
; Write the popup's 2 rows of wTilemap and wAttrmap to the BG map, a byte per HBlank.
	call AP_RowAddr
	push hl
	; de = the row's BG map address
	call AP_Row
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl ; * BG_MAP_WIDTH
	ldh a, [hBGMapAddress]
	ld e, a
	ldh a, [hBGMapAddress + 1]
	ld d, a
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld b, 0 ; tiles
	call .rows
	ld bc, wAttrmap - wTilemap - 2 * SCREEN_WIDTH
	add hl, bc
	ld b, 1 ; attributes
.rows
	push de
	call .row
	ld a, e
	add BG_MAP_WIDTH - SCREEN_WIDTH
	ld e, a
	adc d
	sub e
	ld d, a
	call .row
	pop de
	ret

.row
	ld c, SCREEN_WIDTH
.byte
	di
	ld a, b
	ldh [rVBK], a
.wait
	ldh a, [rSTAT]
	and %10 ; modes 2 and 3 (VRAM busy in mode 3)
	jr nz, .wait
	ld a, [hli]
	ld [de], a
	xor a
	ldh [rVBK], a
	ei
	inc de
	dec c
	jr nz, .byte
	ret
