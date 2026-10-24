; Battle animations on the double battle screen (double battles phase 5; see
; claude/double-battles-phase5.md).
;
; Animation objects are placed and moved in singles coordinates, as before. When an object
; is drawn, DoublesRemapAnimObj moves it to the real slots: it's shifted by the user's
; offset (singles user position -> its slot's position) blended into the target's offset,
; by how far along the singles player -> enemy path it is (its x position). Objects on the
; user or the target just move with it; paths between them land between the real slots.
; Objects without RELATIVE_X (screen-wide ones: Surf, Haze, balls...) aren't moved.

; wDoublesAnimMap
rsreset
DEF DANIM_ON        rb ; nonzero: shift the objects
DEF DANIM_PLAYER_DX rb ; the player's side's offset
DEF DANIM_PLAYER_DY rb
DEF DANIM_BLEND_DX  rb ; the enemy's side's offset minus the player's
DEF DANIM_BLEND_DY  rb
DEF DANIM_LENGTH EQU _RS

DEF SINGLES_ANIM_PLAYER_X EQU 48 ; OAM position of the middle of each singles pic
DEF SINGLES_ANIM_PLAYER_Y EQU 88
DEF SINGLES_ANIM_ENEMY_X  EQU 132 ; = $b4 - SINGLES_ANIM_PLAYER_X (the enemy-turn mirror)
DEF SINGLES_ANIM_ENEMY_Y  EQU 44
DEF DOUBLES_BLEND_SPAN EQU SINGLES_ANIM_ENEMY_X - SINGLES_ANIM_PLAYER_X
	assert SINGLES_ANIM_ENEMY_X == $b4 - SINGLES_ANIM_PLAYER_X

DoublesAnimSlotCenters:
; (OAM x is the screen x + 8, OAM y the screen y + 16)
; OAM x, y of the middle of each slot's pic (see DoublesSlotGeometry)
	table_width 2
	db  3 * TILE_WIDTH + 8, 10 * TILE_WIDTH + 16 ; BATTLER_SLOT_P1: 6x6 at (0, 7)
	db  9 * TILE_WIDTH + 8, 10 * TILE_WIDTH + 16 ; BATTLER_SLOT_P2: 6x6 at (6, 7)
	db 19 * TILE_WIDTH / 2 + 8, 7 * TILE_WIDTH / 2 + 16 ; BATTLER_SLOT_E1: 7x7 at (6, 0)
	db 33 * TILE_WIDTH / 2 + 8, 7 * TILE_WIDTH / 2 + 16 ; BATTLER_SLOT_E2: 7x7 at (13, 0)
	assert_table_length NUM_BATTLER_SLOTS

DoublesBlendTable:
; x - SINGLES_ANIM_PLAYER_X (0 to DOUBLES_BLEND_SPAN) -> the target's share in 256ths
for x, DOUBLES_BLEND_SPAN + 1
	db (x * 255 + DOUBLES_BLEND_SPAN / 2) / DOUBLES_BLEND_SPAN
endr

DoublesInitAnimMap:
; At the start of each battle animation: the offsets the objects are shifted by
; (wDoublesAnimMap), or none outside the double battle screen.
	xor a
	ld [wDoublesAnimMap], a
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ret nc
	xor a
	call DoublesAnimSidePoint
	ld a, d
	sub SINGLES_ANIM_PLAYER_X
	ld [wDoublesAnimMap + DANIM_PLAYER_DX], a
	ld a, e
	sub SINGLES_ANIM_PLAYER_Y
	ld [wDoublesAnimMap + DANIM_PLAYER_DY], a
	ld a, 1
	call DoublesAnimSidePoint
	ld hl, wDoublesAnimMap + DANIM_PLAYER_DX
	ld a, d
	sub SINGLES_ANIM_ENEMY_X
	sub [hl]
	ld [wDoublesAnimMap + DANIM_BLEND_DX], a
	inc hl
	ld a, e
	sub SINGLES_ANIM_ENEMY_Y
	sub [hl]
	ld [wDoublesAnimMap + DANIM_BLEND_DY], a
	ld a, 1
	ld [wDoublesAnimMap + DANIM_ON], a
	ret

DoublesAnimSidePoint:
; d, e = OAM x, y of the battler loaded in area a (0: the player's, 1: the enemy's), or
; for the targets of a spread move hitting both foes, the point between them.
	ld c, a
	ld a, [wDoublesSpread]
	bit DOUBLES_SPREAD_ACTIVE_F, a
	jr z, .one
	ldh a, [hBattleTurn]
	xor c
	jr z, .one ; the user's side
	ld a, c
	add a ; the side's first slot
	push af
	call DoublesAnimSlotCenter
	pop af
	push de
	inc a
	call DoublesAnimSlotCenter
	pop hl
	ld a, d
	add h
	rra
	ld d, a
	ld a, e
	add l
	rra
	ld e, a
	ret

.one
	ld hl, wAreaSlots
	ld b, 0
	add hl, bc
	ld a, [hl]
	; fallthrough

DoublesAnimSlotCenter:
; d, e = OAM x, y of the middle of slot a's pic.
	add a
	ld hl, DoublesAnimSlotCenters
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ret

DoublesRemapAnimObj:
; bc = the animation object being drawn, after InitBattleAnimBuffer: shift its drawn
; position (wBattleAnimTempX/YCoord) to the real slots. Preserves bc.
	ld a, [wDoublesAnimMap + DANIM_ON]
	and a
	ret z
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	bit BATTLEANIMSTRUCT_OAMFLAGS_FIX_COORDS_F, [hl] ; RELATIVE_X
	ret z
	push bc
	ld a, [wBattleAnimTempXOffset]
	ld b, a
	ld a, [wBattleAnimTempXCoord]
	add b
	sub SINGLES_ANIM_PLAYER_X
	jr nc, .not_left
	xor a
.not_left
	cp DOUBLES_BLEND_SPAN
	jr c, .got_x
	ld a, DOUBLES_BLEND_SPAN
.got_x
	ld hl, DoublesBlendTable
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld c, [hl]
	ld a, [wDoublesAnimMap + DANIM_BLEND_DX]
	call .Scale
	ld hl, wDoublesAnimMap + DANIM_PLAYER_DX
	add [hl]
	ld hl, wBattleAnimTempXCoord
	add [hl]
	ld [hl], a
	ld a, [wDoublesAnimMap + DANIM_BLEND_DY]
	call .Scale
	ld hl, wDoublesAnimMap + DANIM_PLAYER_DY
	add [hl]
	ld hl, wBattleAnimTempYCoord
	add [hl]
	ld [hl], a
	pop bc
	ret

.Scale:
; a = a (signed) * c / 256, rounded. Preserves c.
	bit 7, a
	jr z, .Multiply
	cpl
	inc a
	call .Multiply
	cpl
	inc a
	ret

.Multiply:
; a = (a * c + 128) / 256
	ld e, a
	ld d, 0
	ld hl, $80
	ld a, c
.loop
	srl a
	jr nc, .skip
	add hl, de
.skip
	sla e
	rl d
	and a
	jr nz, .loop
	ld a, h
	ret

DoublesAnimAreaPal::
; a = the BG palette of the pic of the battler in area a (0: the player's, 1: the enemy's):
; PAL_BATTLE_BG_PLAYER or _ENEMY in singles, its slot's palette on the double battle screen.
; Preserves bc, de and hl.
	assert PAL_BATTLE_BG_PLAYER == 0 && PAL_BATTLE_BG_ENEMY == 1
	and 1
	push hl
	ld l, a
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ld a, l
	jr nc, .done
	ld hl, wAreaSlots
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	ld hl, .SlotPals
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
.done
	pop hl
	ret

.SlotPals:
	table_width 1
	db PAL_BATTLE_BG_PLAYER ; BATTLER_SLOT_P1
	db PAL_BATTLE_BG_5      ; BATTLER_SLOT_P2
	db PAL_BATTLE_BG_ENEMY  ; BATTLER_SLOT_E1
	db PAL_BATTLE_BG_6      ; BATTLER_SLOT_E2
	assert_table_length NUM_BATTLER_SLOTS
