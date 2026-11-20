DoItemEffect::
	farjp _DoItemEffect

CheckTossableItem::
	push hl
	push de
	push bc
	farcall _CheckTossableItem
	jmp PopBCDEHL

TossItem::
	push hl
	push de
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(_TossItem)
	rst Bankswitch

	call _TossItem

	pop bc
	ld a, b
	rst Bankswitch
	jmp PopBCDEHL

ReceiveItem::
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(_ReceiveItem)
	rst Bankswitch
	push hl
	push de

	call _ReceiveItem

	pop de
	pop hl
	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	ret

ItemIsMail_a::
; No item is Mail: always returns nc.
	and a
	ret

CheckItem::
; [wCurItem] = item *ID* to check.
	push hl
	push de
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(_CheckItem)
	rst Bankswitch

	call _CheckItem

	pop bc
	ld a, b
	rst Bankswitch
	jmp PopBCDEHL

GetPocketIndexHigh::
; h = the high byte of the item indexes in pocket [wCurPocket]
	push af
	push de
	ld a, [wCurPocket]
	ld e, a
	ld d, 0
	ld hl, PocketIndexHighs
	add hl, de
	ld h, [hl]
	pop de
	pop af
	ret

PocketIndexHighs:
; entries correspond to *_POCKET constants
	table_width 1
	db HIGH(1)                   ; ITEM_POCKET
	db HIGH(FIRST_MEDICINE_ITEM) ; MEDICINE_POCKET
	db HIGH(FIRST_BERRY_ITEM)    ; BERRY_POCKET
	db HIGH(FIRST_HELD_ITEM)     ; HELD_POCKET
	db HIGH(FIRST_TRAINING_ITEM) ; TRAINING_POCKET
	db HIGH(FIRST_TREASURE_ITEM) ; TREASURE_POCKET
	db HIGH(FIRST_BALL_ITEM)     ; BALL_POCKET
	db HIGH(FIRST_TMHM_ITEM)     ; TM_HM_POCKET
	db HIGH(FIRST_KEY_ITEM)      ; KEY_ITEM_POCKET
	assert_table_length NUM_POCKETS
