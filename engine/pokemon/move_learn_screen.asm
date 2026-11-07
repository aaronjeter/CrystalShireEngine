; Move details for learning moves: a box with a move's name, PP, category and
; type icons, power, accuracy, effect chance and description, drawn over
; whatever screen is up (the learn and teach prompts, the Move Tutors' lists),
; and the full-screen list for choosing a move to forget.
;
; The box saves the screen's attributes and sprites (WRAM bank 6 scratch) and
; restores them when it closes; its tiles come back from wTempTilemap, so the
; caller must have saved the screen there (LearnMove does at its start).

DEF MOVEINFO_HEIGHT EQU 7 ; rows, borders included

; WRAM bank 6, the parts of wScratchTilemap and wScratchAttrmap that the
; padded tilemap and attribute copies (BG_MAP_WIDTH * SCREEN_HEIGHT bytes)
; don't reach.
DEF MOVEINFO_SAVED_OAM   EQU $d000 + BG_MAP_WIDTH * SCREEN_HEIGHT
DEF MOVEINFO_SAVED_ATTRS EQU $d400 + BG_MAP_WIDTH * SCREEN_HEIGHT
	assert MOVEINFO_SAVED_OAM + NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH <= $d400
	assert MOVEINFO_SAVED_ATTRS + SCREEN_WIDTH * SCREEN_HEIGHT <= $d800
	assert BANK(wScratchTilemap) == 6 && wScratchTilemap == $d000, "move the move info buffers"
	assert wScratchAttrmap == $d400, "move the move info buffers"

MoveInfo_OpenPrompt::
; The box for move a at the top of the screen (rows 0-6), over the screen.
; c = wMoveInfoFlags.
	push af
	ld a, c
	ld [wMoveInfoFlags], a
	call MoveInfo_SaveScreen
	lb bc, 0, MOVEINFO_HEIGHT - 1
	call MoveInfo_HideSprites
	farcall LoadTypeIconGFX
	pop af
	ld b, 0
	ld c, 6 ; icon slots and OBJ palettes 6-7
	call MoveInfo_DrawBox
	jr MoveInfo_CopyTilemap

MoveInfo_ClosePrompt::
; Close the box from MoveInfo_OpenPrompt. Preserves af.
	push af
	lb bc, 0, MOVEINFO_HEIGHT
	call MoveInfo_RestoreRows
	pop af
	ret

MoveInfo_CopyTilemap:
; CopyTilemapAtOnce keeps interrupts off for about two frames, so the VBlank
; that was due runs late, outside VBlank, where palette writes are lost but
; hCGBPalUpdate is still cleared: ask for the palettes again.
	call CopyTilemapAtOnce
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

MoveInfo_SaveScreen:
; Save wAttrmap and the sprites (wShadowOAM). Over the party menu's cards, the
; cards' text box hooks keep working while the box covers the top left.
	xor a
	ld [wMoveInfoOverCards], a
	farcall PartyCards_OnScreen
	jr nz, .not_cards
	ld a, TRUE
	ld [wMoveInfoOverCards], a
.not_cards
	ldh a, [rSVBK]
	push af
	ld a, BANK(wScratchTilemap)
	ldh [rSVBK], a
	ld hl, wShadowOAM
	ld de, MOVEINFO_SAVED_OAM
	ld bc, wShadowOAMEnd - wShadowOAM
	rst CopyBytes
	hlcoord 0, 0, wAttrmap
	ld de, MOVEINFO_SAVED_ATTRS
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	; GetMoveName and PrintMoveDescription use these
	ld hl, wStringBuffer1
	ld de, wMoveInfoSavedName
	ld bc, STRING_BUFFER_LENGTH
	rst CopyBytes
	ld a, [wNamedObjectIndex]
	ld [wMoveInfoSavedIndex], a
	ld a, [wCurSpecies]
	ld [wMoveInfoSavedSpecies], a
	ret

MoveInfo_HideSprites:
; Hide the sprites that overlap tile rows b to c.
	; d = the lowest OAM y that reaches row b, e = the highest that starts in row c
	ld a, b
	add a
	add a
	add a
	add 16 - TILE_WIDTH + 1 ; OAM y is screen y + 16
	ld d, a
	ld a, c
	add a
	add a
	add a
	add 16 + TILE_WIDTH - 1
	ld e, a
	ld hl, wShadowOAM
	ld b, NUM_SPRITE_OAM_STRUCTS
.loop
	ld a, [hl]
	cp d
	jr c, .next
	cp e
	jr z, .hide
	jr nc, .next
.hide
	xor a
	ld [hl], a
.next
	inc hl
	inc hl
	inc hl
	inc hl
	dec b
	jr nz, .loop
	ret

MoveInfo_RestoreRows:
; Back to the saved screen in rows b to b + c - 1: tiles from wTempTilemap,
; attributes and sprites from MoveInfo_SaveScreen.
	farcall HideTypeIcons
	; de = the rows' offset into the screen, bc = their size
	push bc
	ld a, c
	ld hl, 0
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	pop bc
	push hl
	ld a, b
	ld hl, 0
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop bc

	ldh a, [rSVBK]
	push af
	ld a, BANK(wTempTilemap)
	ldh [rSVBK], a
	push de
	push bc
	ld hl, wTempTilemap
	add hl, de
	push hl
	ld hl, wTilemap
	add hl, de
	ld d, h
	ld e, l
	pop hl
	rst CopyBytes
	pop bc
	pop de
	ld a, BANK(wScratchTilemap)
	ldh [rSVBK], a
	ld hl, MOVEINFO_SAVED_ATTRS
	add hl, de
	push hl
	ld hl, wAttrmap
	add hl, de
	ld d, h
	ld e, l
	pop hl
	rst CopyBytes
	ld hl, MOVEINFO_SAVED_OAM
	ld de, wShadowOAM
	ld bc, wShadowOAMEnd - wShadowOAM
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	ld hl, wMoveInfoSavedName
	ld de, wStringBuffer1
	ld bc, STRING_BUFFER_LENGTH
	rst CopyBytes
	ld a, [wMoveInfoSavedIndex]
	ld [wNamedObjectIndex], a
	ld a, [wMoveInfoSavedSpecies]
	ld [wCurSpecies], a
	call MoveInfo_CopyTilemap
	xor a
	ld [wMoveInfoOverCards], a
	ret

MoveInfo_DrawBox:
; The box for move a with its top border on row b, its icons in slots and
; OBJ palettes c (category) and c + 1 (type).
	ld [wMoveInfoMove], a
	ld a, b
	ld [wMoveInfoRow], a
	ld a, c
	ld [wMoveInfoSlot], a
	ld bc, 0
	call MoveInfo_Coord
	lb bc, MOVEINFO_HEIGHT - 2, SCREEN_WIDTH - 2
	call Textbox
	ld a, [wMoveInfoMove]
	and a
	jp z, MoveInfo_HideBoxIcons ; no move (the Move Tutors' Cancel): an empty box

	; row 1: name, PP
	ld [wNamedObjectIndex], a
	call GetMoveName
	lb bc, 1, 1
	call MoveInfo_Coord
	rst PlaceString
	ld de, .PPStr
	lb bc, 1, 14
	call MoveInfo_Coord
	rst PlaceString
	ld a, MOVE_PP
	call MoveInfo_Attribute
	lb bc, 1, 17
	call MoveInfo_Coord
	ld [wMoveInfoNumber], a
	ld de, wMoveInfoNumber
	lb bc, 1, 2
	call PrintNum

	; row 2: icons, power
	ld de, .PowStr
	lb bc, 2, 12
	call MoveInfo_Coord
	rst PlaceString
	ld a, MOVE_POWER
	call MoveInfo_Attribute
	lb bc, 2, 16
	call MoveInfo_Coord
	ld c, 2 ; 0 and 1 (no or variable power) show "---"
	call MoveInfo_NumberOrDashes

	; row 3: accuracy, effect chance
	ld de, .AccStr
	lb bc, 3, 1
	call MoveInfo_Coord
	rst PlaceString
	ld a, MOVE_ACC
	call MoveInfo_Attribute
	farcall ConvertPercentages
	lb bc, 3, 5
	call MoveInfo_Coord
	ld c, 0
	call MoveInfo_NumberOrDashes
	ld de, .EffStr
	lb bc, 3, 12
	call MoveInfo_Coord
	rst PlaceString
	ld a, MOVE_CHANCE
	call MoveInfo_Attribute
	and a
	jr z, .no_chance
	farcall ConvertPercentages
.no_chance
	lb bc, 3, 16
	call MoveInfo_Coord
	ld c, 1
	call MoveInfo_NumberOrDashes

	; rows 4-5: the description (its second line lands on the bottom border:
	; move it up a row and put the border back)
	lb bc, 6, 1
	call MoveInfo_Coord
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	rst ByteFill
	ld a, [wMoveInfoMove]
	ld [wCurSpecies], a
	lb bc, 4, 1
	call MoveInfo_Coord
	predef PrintMoveDescription
	lb bc, 6, 1
	call MoveInfo_Coord
	push hl
	ld de, -SCREEN_WIDTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push hl
	ld bc, SCREEN_WIDTH - 2
	rst CopyBytes
	pop hl
	ld bc, SCREEN_WIDTH - 2
	ld a, "─"
	rst ByteFill

	; the icons
	ld a, [wMoveInfoRow]
	add 2
	ld b, a
	ld d, a
	ld c, 1
	ld e, 6
	ld a, [wMoveInfoSlot]
	ld h, a
	ld l, a
	ld a, [wMoveInfoMove]
	farcall PlaceMoveIcons
	call MoveInfo_HiddenPower
	ret nc
	ld a, [wMoveInfoRow]
	add 2
	ld b, a
	ld c, 6
	ld a, [wMoveInfoSlot]
	inc a
	ld d, a
	ld e, a
	ld a, [wHiddenPowerType]
	farjp PlaceTypeIconForType

.PPStr:
	db "PP/@"
.PowStr:
	db "Pow/@"
.AccStr:
	db "Acc/@"
.EffStr:
	db "Eff/@"

MoveInfo_HideBoxIcons:
; Hide the box's two icons (their OBJ palettes stay borrowed until HideTypeIcons).
	ld a, [wMoveInfoSlot]
	add a
	add a ; * TYPE_ICON_WIDTH
	add TYPE_ICON_FIRST_OAM
	add a
	add a ; * SPRITEOAMSTRUCT_LENGTH
	ld l, a
	ld h, HIGH(wShadowOAM)
	ld bc, 2 * TYPE_ICON_WIDTH * SPRITEOAMSTRUCT_LENGTH
	xor a
	rst ByteFill
	ret

MoveInfo_Coord:
; hl = the tilemap at row [wMoveInfoRow] + b, column c. Preserves af.
	push af
	ld a, [wMoveInfoRow]
	add b
	ld hl, wTilemap
	push bc
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	pop bc
	ld b, 0
	add hl, bc
	pop af
	ret

MoveInfo_Attribute:
; a = attribute a of [wMoveInfoMove]
	push hl
	ld hl, wMoveInfoMove
	ld l, [hl]
	call GetMoveAttribute
	pop hl
	ret

MoveInfo_HiddenPower:
; [wMoveInfoMove] with MOVEINFO_PARTY_HP_F: carry if it's Hidden Power, with
; [wHiddenPowerType] = its type for wCurPartyMon.
	ld a, [wMoveInfoFlags]
	bit MOVEINFO_PARTY_HP_F, a
	ret z ; no carry
	ld a, [wMoveInfoMove]
	; fallthrough

MoveInfo_PartyHiddenPower:
; carry if move a is Hidden Power, with [wHiddenPowerType] = its type for
; wCurPartyMon.
	push hl
	ld l, a
	ld a, MOVE_EFFECT
	call GetMoveAttribute
	pop hl
	cp EFFECT_HIDDEN_POWER
	jr z, .hidden_power
	and a
	ret
.hidden_power
	push hl
	push bc
	ld a, MON_DVS
	call GetPartyParamLocation
	farcall GetHiddenPowerFromDVs
	ld [wHiddenPowerType], a
	pop bc
	pop hl
	scf
	ret

MoveInfo_NumberOrDashes:
; at hl: a as 3 digits, or "---" if a < c
	cp c
	jr c, .dashes
	ld [wMoveInfoNumber], a
	ld de, wMoveInfoNumber
	lb bc, 1, 3
	jmp PrintNum
.dashes
	ld de, .DashesStr
	rst PlaceString
	ret

.DashesStr:
	db "---@"

MoveForgetScreen::
; The full-screen list for choosing a move to forget for [wPutativeTMHMMove]:
; hl = the party mon's moves. The old moves, a divider and the new move
; (rows 0-10), each with its type icon, and the highlighted move's details
; (rows 11-17). The screen behind must have been saved by MoveInfo_OpenPrompt.
; Returns wMenuCursorY; carry if B was pressed or the new move was picked.
	ld a, l
	ld [wMoveInfoMoves], a
	ld a, h
	ld [wMoveInfoMoves + 1], a
	farcall HideTypeIcons
	lb bc, 0, SCREEN_HEIGHT - 1
	call MoveInfo_HideSprites

	hlcoord 0, 0
	lb bc, 9, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 1, 0
	ld de, .Title
	rst PlaceString
	hlcoord 1, 8
	ld bc, SCREEN_WIDTH - 2
	ld a, "─"
	rst ByteFill

	; rows 1, 3, 5, 7 (the old moves) and 9 (the new move): the name at
	; column 2, the type icon at column 15 (icon slot and OBJ palette = the
	; move number)
	ld d, 0
.rows
	ld a, d
	call .MoveAt
	and a
	jr z, .next_row
	push de
	ld [wNamedObjectIndex], a
	push af
	call GetMoveName
	pop af
	call .TypeIcon
	pop de
	push de
	push af
	ld a, d
	add a
	inc a
	ld b, a ; row
	ld hl, wTilemap + 2
	push bc
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	pop bc
	ld de, wStringBuffer1
	rst PlaceString
	pop af
	pop de
	push de
	push af
	ld a, d
	add a
	inc a
	ld b, a ; row
	pop af
	ld c, 15
	ld e, d
	farcall PlaceTypeIconForType
	pop de
.next_row
	inc d
	ld a, d
	cp NUM_MOVES + 1
	jr c, .rows

	ld a, 1
	ld [wMenuCursorY], a
	call .Details
	call MoveInfo_CopyTilemap

	ld a, 1
	ld [w2DMenuCursorInitY], a
	ld [w2DMenuCursorInitX], a
	ld [w2DMenuNumCols], a
	ld [wMenuCursorX], a
	ld a, NUM_MOVES + 1
	ld [w2DMenuNumRows], a
	ld a, _2DMENU_WRAP_UP_DOWN
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	ld a, A_BUTTON | B_BUTTON | D_UP | D_DOWN
	ld [wMenuJoypadFilter], a
	call StaticMenuJoypad ; places the cursor
.loop
	bit A_BUTTON_F, a
	jr nz, .done
	bit B_BUTTON_F, a
	jr nz, .done
	call .Details
	call ScrollingMenuJoypad ; moves the cursor
	jr .loop

.done
	push af
	lb bc, 0, SCREEN_HEIGHT
	call MoveInfo_RestoreRows
	pop af
	bit B_BUTTON_F, a
	jr nz, .cancel
	ld a, [wMenuCursorY]
	cp NUM_MOVES + 1
	jr z, .cancel
	and a
	ret

.cancel
	scf
	ret

.Details:
	ld a, [wMenuCursorY]
	dec a
	call .MoveAt
	lb bc, SCREEN_HEIGHT - MOVEINFO_HEIGHT, NUM_MOVES + 1
	jmp MoveInfo_DrawBox

.MoveAt:
; a = move number a (0-3: the party mon's moves, 4: the new move)
	cp NUM_MOVES
	jr z, .new_move
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, wMoveInfoMoves
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret
.new_move
	ld a, [wPutativeTMHMMove]
	ret

.TypeIcon:
; a = the type of move a (Hidden Power's for wCurPartyMon)
	push af
	call MoveInfo_PartyHiddenPower
	jr nc, .not_hp
	pop af
	ld a, [wHiddenPowerType]
	ret
.not_hp
	pop af
	push hl
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	pop hl
	and TYPE_MASK
	ret

.Title:
	db "Forget a move?@"

MoveTutorMenu::
; The Move Tutors' list: [wScriptVar] = the first of three MOVETUTOR_*
; moves. The list (rows 7-10, with Cancel) sits under the highlighted move's
; details (rows 0-5). Returns [wScriptVar] = 1-3 for a move, 0 for Cancel/B.
	ld a, [wScriptVar]
	ld [wMoveInfoTutorFirst], a
	call LoadTilemapToTempTilemap
	xor a
	ld [wMoveInfoFlags], a
	call MoveInfo_SaveScreen
	lb bc, 0, MOVEINFO_HEIGHT - 1 + 5
	call MoveInfo_HideSprites
	farcall LoadTypeIconGFX

	hlcoord 0, MOVEINFO_HEIGHT - 1
	lb bc, 4, SCREEN_WIDTH - 2
	call Textbox
	ld c, 0
.names
	ld a, c
	call .MoveAt
	ld [wNamedObjectIndex], a
	push bc
	call GetMoveName
	pop bc
	push bc
	ld a, c
	add MOVEINFO_HEIGHT
	ld hl, wTilemap + 2
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	rst PlaceString
	pop bc
	inc c
	ld a, c
	cp 3
	jr nz, .names
	hlcoord 2, MOVEINFO_HEIGHT + 3
	ld de, .CancelStr
	rst PlaceString

	ld a, 1
	ld [wMenuCursorY], a
	call .Details
	call MoveInfo_CopyTilemap

	ld a, MOVEINFO_HEIGHT
	ld [w2DMenuCursorInitY], a
	ld a, 1
	ld [w2DMenuCursorInitX], a
	ld [w2DMenuNumCols], a
	ld [wMenuCursorX], a
	ld a, 4
	ld [w2DMenuNumRows], a
	ld a, _2DMENU_WRAP_UP_DOWN
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $10
	ld [w2DMenuCursorOffsets], a
	ld a, A_BUTTON | B_BUTTON | D_UP | D_DOWN
	ld [wMenuJoypadFilter], a
	call StaticMenuJoypad ; places the cursor
.loop
	bit A_BUTTON_F, a
	jr nz, .done
	bit B_BUTTON_F, a
	jr nz, .done
	call .Details
	call ScrollingMenuJoypad ; moves the cursor
	jr .loop

.done
	push af
	lb bc, 0, MOVEINFO_HEIGHT + 5
	call MoveInfo_RestoreRows
	pop af
	ld c, 0
	bit B_BUTTON_F, a
	jr nz, .got
	ld a, [wMenuCursorY]
	cp 4
	jr z, .got
	ld c, a
.got
	ld a, c
	ld [wScriptVar], a
	ret

.Details:
; the box for the highlighted move (none for Cancel), its bottom border made
; the divider above the list
	ld a, [wMenuCursorY]
	dec a
	cp 3
	ld a, 0
	jr z, .got_move
	ld a, [wMenuCursorY]
	dec a
	call .MoveAt
.got_move
	lb bc, 0, 6
	call MoveInfo_DrawBox
	hlcoord 0, MOVEINFO_HEIGHT - 1
	ld [hl], "│"
	hlcoord SCREEN_WIDTH - 1, MOVEINFO_HEIGHT - 1
	ld [hl], "│"
	ret

.MoveAt:
; a = the move ID of list entry a
	push bc
	push de
	push hl
	ld c, a
	ld a, [wMoveInfoTutorFirst]
	dec a
	add c
	add a
	ld e, a
	ld d, 0
	ld hl, MoveTutor.Moves
	add hl, de
	ld a, BANK(MoveTutor.Moves)
	call GetFarWord
	call GetMoveIDFromIndex
	pop hl
	pop de
	pop bc
	ret

.CancelStr:
	db "Cancel@"
