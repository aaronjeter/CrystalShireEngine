_ReceiveItem::
	call DoesHLEqualNumItems
	jmp nz, PutItemInPocket ; the PC's list: 16-bit item indexes
	call GetBagListForItem
	jr c, .not_list
	jmp PutItemInPocketLow

.not_list
	cp KEY_ITEM
	jmp z, ReceiveKeyItem
	ld a, [wCurItem]
	ld c, a
	call GetTMHMNumber
	jmp ReceiveTMHM

_TossItem::
	call DoesHLEqualNumItems
	jmp nz, RemoveItemFromPocket
	call GetBagListForItem
	jr c, .not_list
	jmp RemoveItemFromPocketLow

.not_list
	cp KEY_ITEM
	jmp z, TossKeyItem
	ld a, [wCurItem]
	ld c, a
	call GetTMHMNumber
	jmp TossTMHM

_CheckItem::
	call DoesHLEqualNumItems
	jmp nz, CheckTheItem
	call GetBagListForItem
	jr c, .not_list
	jmp CheckTheItemLow

.not_list
	cp KEY_ITEM
	jmp z, CheckKeyItems
	ld a, [wCurItem]
	ld c, a
	call GetTMHMNumber
	jmp CheckTMHM

GetBagListForItem:
; hl = the Pack list that holds wCurItem (by its item type); carry and a = the
; type for Key Items and TMs/HMs, which aren't 2-byte lists
	push hl
	call CheckItemPocket
	pop hl
	ld a, [wItemAttributeValue]
	cp KEY_ITEM
	jr z, .not_list
	cp TM_HM
	jr z, .not_list
	dec a
	add a
	ld e, a
	ld d, 0
	ld hl, ItemTypeBagLists
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	and a
	ret

.not_list
	ld hl, wNumItems
	scf
	ret

ItemTypeBagLists:
; entries correspond to item types (ITEM, KEY_ITEM, ...)
	table_width 2
	dw wNumItems         ; ITEM
	dw 0                 ; KEY_ITEM
	dw wNumBalls         ; BALL
	dw 0                 ; TM_HM
	dw wNumMedicine      ; MEDICINE
	dw wNumBerries       ; BERRY
	dw wNumHeldItems     ; HELD_ITEM
	dw wNumTrainingItems ; TRAINING
	dw wNumTreasures     ; TREASURE
	assert_table_length NUM_ITEM_TYPES

DoesHLEqualNumItems:
	ld a, l
	cp LOW(wNumItems)
	ret nz
	ld a, h
	cp HIGH(wNumItems)
	ret

GetPocketCapacity:
; c = the capacity of the item list at de (clobbers hl and b)
	ld hl, ItemListCapacities
.loop
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	or b
	jr z, .default
	ld a, b
	cp e
	jr nz, .next
	ld a, c
	cp d
	jr nz, .next
	ld c, [hl]
	ret

.next
	inc hl
	jr .loop

.default
	ld c, MAX_BALLS
	ret

ItemListCapacities:
	dw wNumItems
	db MAX_ITEMS
	dw wNumMedicine
	db MAX_MEDICINE
	dw wNumBerries
	db MAX_BERRIES
	dw wNumHeldItems
	db MAX_HELD
	dw wNumTrainingItems
	db MAX_TRAINING
	dw wNumTreasures
	db MAX_TREASURES
	dw wNumBalls
	db MAX_BALLS
	dw wNumPCItems
	db MAX_PC_ITEMS
	dw 0

PutItemInPocket:
	ld d, h
	ld e, l
	inc hl
	push hl
	ld a, [wCurItem]
	call GetItemIndexFromID
	ld c, l
	ld b, h
	pop hl
	push de
	ld d, 0
	dec hl
.loop
	inc hl
	ld a, [hli]
	cp -1
	jr z, .terminator
	cp b
	jr nz, .next_inc_one
	ld a, [hli]
	cp c
	jr nz, .loop
	ld a, MAX_ITEM_STACK
	sub [hl]
	add d
	ld d, a
	ld a, [wItemQuantityChange]
	cp d
	jr z, .ok_pop
	jr c, .ok_pop
	jr .loop

.next_inc_one
	inc hl
	jr .loop

.terminator
	pop de
	call GetPocketCapacity
	ld a, [de]
	cp c
	jr c, .ok
	and a
	ret
.ok_pop
	pop de
.ok
	ld h, d
	ld l, e
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld c, l
	ld b, h
	pop hl
	ld a, [wItemQuantityChange]
	ld [wItemQuantity], a
.loop2
	inc hl
	ld a, [hli]
	cp -1
	jr z, .terminator2
	cp b
	jr nz, .next2_inc_one
	ld a, [hli]
	cp c
	jr nz, .loop2
	ld a, [wItemQuantity]
	add [hl]
	cp MAX_ITEM_STACK + 1
	jr nc, .newstack
	ld [hl], a
	jr .done

.next2_inc_one
	inc hl
	jr .loop2

.newstack
	ld [hl], MAX_ITEM_STACK
	sub MAX_ITEM_STACK
	ld [wItemQuantity], a
	jr .loop2

.terminator2
	dec hl
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld b, h
	ld c, l
	pop hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wItemQuantity]
	ld [hli], a
	ld [hl], -1
	ld h, d
	ld l, e
	inc [hl]

.done
	scf
	ret

PutItemInPocketLow:
	ld d, h
	ld e, l
	inc hl
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld c, l
	pop hl
	ld b, 0
.loop
	ld a, [hli]
	cp -1
	jr z, .terminator
	cp c
	jr nz, .next
	ld a, MAX_ITEM_STACK
	sub [hl]
	add b
	ld b, a
	ld a, [wItemQuantityChange]
	cp b
	jr z, .ok
	jr c, .ok

.next
	inc hl
	jr .loop

.terminator
	call GetPocketCapacity
	ld a, [de]
	cp c
	jr c, .ok
	and a
	ret

.ok
	ld h, d
	ld l, e
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld c, l
	pop hl
	ld a, [wItemQuantityChange]
	ld [wItemQuantity], a
.loop2
	inc hl
	ld a, [hli]
	cp -1
	jr z, .terminator2
	cp c
	jr nz, .loop2
	ld a, [wItemQuantity]
	add [hl]
	cp MAX_ITEM_STACK + 1
	jr nc, .newstack
	ld [hl], a
	jr .done

.newstack
	ld [hl], MAX_ITEM_STACK
	sub MAX_ITEM_STACK
	ld [wItemQuantity], a
	jr .loop2

.terminator2
	dec hl
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld a, l
	pop hl
	ld [hli], a
	ld a, [wItemQuantity]
	ld [hli], a
	ld [hl], -1
	ld h, d
	ld l, e
	inc [hl]

.done
	scf
	ret

RemoveItemFromPocketLow:
	ld d, h
	ld e, l
	ld a, [hli]
	ld c, a
	ld a, [wCurItemQuantity]
	cp c
	jr nc, .ok ; memory
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld a, l
	pop hl
	cp [hl]
	inc hl
	jr z, .skip
	ld h, d
	ld l, e
	inc hl

.ok
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld a, l
	pop hl
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr z, .skip
	cp -1
	jr z, .nope
	inc hl
	jr .loop

.skip
	ld a, [wItemQuantityChange]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .nope
	ld [hl], a
	ld [wItemQuantity], a
	and a
	jr nz, .yup
	dec hl
	ld b, h
	ld c, l
	inc hl
	inc hl
.loop2
	ld a, [hli]
	ld [bc], a
	inc bc
	cp -1
	jr nz, .loop2
	ld h, d
	ld l, e
	dec [hl]

.yup
	scf
	ret

.nope
	and a
	ret

RemoveItemFromPocket:
	ld d, h
	ld e, l
	ld a, [hli]
	ld c, a
	ld a, [wCurItemQuantity]
	cp c
	jr nc, .ok ; memory
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld b, h
	ld c, l
	pop hl
	ld a, b
	cp [hl]
	inc hl
	inc hl
	jr nz, .nope1
	dec hl
	ld a, c
	cp [hl]
	inc hl
	jr z, .skip
.nope1
	ld h, d
	ld l, e
	inc hl

.ok
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld b, h
	ld c, l
	pop hl
.loop
	ld a, [hli]
	cp -1
	jr z, .nope
	cp b
	inc hl
	jr nz, .nope2
	dec hl
	ld a, [hli]
	cp c
	jr z, .skip
.nope2
	inc hl
	jr .loop

.skip
	ld a, [wItemQuantityChange]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .nope
	ld [hl], a
	ld [wItemQuantity], a
	and a
	jr nz, .yup
	dec hl
	dec hl
	ld b, h
	ld c, l
	inc hl
	inc hl
	inc hl
.loop2
	ld a, [hli]
	ld [bc], a
	inc bc
	cp -1
	jr nz, .loop2
	ld h, d
	ld l, e
	dec [hl]

.yup
	scf
	ret

.nope
	and a
	ret

CheckTheItemLow:
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld a, l
	pop hl
	ld c, a
.loop
	inc hl
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .loop
	scf
	ret

.done
	and a
	ret

CheckTheItem:
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld b, h
	ld c, l
	pop hl
	inc hl
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp b
	jr nz, .inc_two
	ld a, [hli]
	cp c
	jr nz, .inc_one
	scf
	ret

.inc_two
	inc hl
.inc_one
	inc hl
	jr .loop

.done
	and a
	ret

ReceiveKeyItem:
	ld hl, wNumKeyItems
	ld a, [hli]
	cp MAX_KEY_ITEMS
	jr nc, .nope
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld a, l
	pop hl
	ld [hli], a
	ld [hl], -1
	ld hl, wNumKeyItems
	inc [hl]
	scf
	ret

.nope
	and a
	ret

TossKeyItem:
	ld a, [wCurItemQuantity]
	ld e, a
	ld d, 0
	ld hl, wNumKeyItems
	ld a, [hl]
	cp e
	jr nc, .ok
	call .Toss
	ret nc
	jr .ok2

.ok
	dec [hl]
	inc hl
	add hl, de

.ok2
	ld d, h
	ld e, l
	inc hl
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp -1
	jr nz, .loop
	scf
	ret

.Toss:
	ld hl, wNumKeyItems
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld a, l
	pop hl
	ld c, a
.loop3
	inc hl
	ld a, [hl]
	cp c
	jr z, .ok3
	cp -1
	jr nz, .loop3
	xor a
	ret

.ok3
	ld a, [wNumKeyItems] ; no-optimize Inefficient WRAM increment/decrement (hl is needed)
	dec a
	ld [wNumKeyItems], a
	scf
	ret

CheckKeyItems:
	ld a, [wCurItem]
	push hl
	call GetItemIndexFromID
	ld a, l
	pop hl
	ld c, a
	ld hl, wKeyItems
.loop
	ld a, [hli]
	cp c
	jr z, .done
	cp -1
	jr nz, .loop
	and a
	ret

.done
	scf
	ret

ReceiveTMHM:
; TM/HM number c is owned from now on (owning it twice changes nothing).
	ld b, SET_FLAG
	call TMHMFlagAction
	scf
	ret

TossTMHM:
; TM/HM number c is no longer owned: carry if it was.
	push bc
	ld b, CHECK_FLAG
	call TMHMFlagAction
	pop bc
	and a
	ret z
	ld b, RESET_FLAG
	call TMHMFlagAction
	xor a
	ld [wItemQuantity], a
	ld a, [wTMHMPocketScrollPosition]
	and a
	jr z, .done
	dec a
	ld [wTMHMPocketScrollPosition], a
.done
	scf
	ret

CheckTMHM:
; carry if TM/HM number c is owned
	ld b, CHECK_FLAG
	call TMHMFlagAction
	and a
	ret z
	scf
	ret

TMHMFlagAction::
; FlagAction b on the wTMsHMs bit of TM/HM number c (1 to NUM_TMS + NUM_HMS):
; returns c and a (nonzero if set).
	ld a, c
	dec a
	cp NUM_TMS
	jr c, .got_bit
	add MAX_TMS - NUM_TMS
.got_bit
	ld e, a
	ld d, 0
	ld hl, wTMsHMs
	call FlagAction
	ld a, c
	ret

ItemIndexIsOwnedTMHM::
; carry if item index de is a TM or HM the player owns
	ld hl, -FIRST_TMHM_ITEM
	add hl, de
	jr nc, .no
	ld a, h
	and a
	jr nz, .no
	ld a, l
	cp NUM_TMS + NUM_HMS
	jr nc, .no
	inc a
	ld c, a
	jr CheckTMHM

.no
	and a
	ret

BuildTMHMPocketList::
; wTMHMPocketList = 1 for each TM/HM owned, else 0
	ld hl, wTMHMPocketList
	ld c, 1
.loop
	push hl
	push bc
	call CheckTMHM
	pop bc
	pop hl
	sbc a
	and 1
	ld [hli], a
	inc c
	ld a, c
	cp NUM_TMS + NUM_HMS + 1
	jr c, .loop
	ret

GetTMHMNumber::
; Return the number of a TM/HM by item id c.
	ld a, c
	push hl
	push de
	call GetItemIndexFromID
	ld de, -(FIRST_TMHM_ITEM - 1)
	add hl, de
	ld a, l
	pop de
	pop hl
	ld c, a
	ret

GetNumberedTMHM:
; Return the item id of a TM/HM by number c.
	ld a, c
	push hl
	push de
	ld h, 0
	ld l, a
	ld de, FIRST_TMHM_ITEM - 1
	add hl, de
	call GetItemIDFromIndex
	pop de
	pop hl
	ld c, a
	ret

_CheckTossableItem::
; Return 1 in wItemAttributeValue and carry if wCurItem can't be removed from the bag.
	ld a, ITEMATTR_PERMISSIONS
	call GetItemAttr
	bit CANT_TOSS_F, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret

CheckSelectableItem:
; Return 1 in wItemAttributeValue and carry if wCurItem can't be selected.
	ld a, ITEMATTR_PERMISSIONS
	call GetItemAttr
	bit CANT_SELECT_F, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret

CheckItemPocket::
; Return the pocket for wCurItem in wItemAttributeValue.
	ld a, ITEMATTR_POCKET
	call GetItemAttr
	and $f
	ld [wItemAttributeValue], a
	ret

CheckItemContext:
; Return the context for wCurItem in wItemAttributeValue.
	ld a, ITEMATTR_HELP
	call GetItemAttr
	and $f
	ld [wItemAttributeValue], a
	ret

CheckItemMenu:
; Return the menu for wCurItem in wItemAttributeValue.
	ld a, ITEMATTR_HELP
	call GetItemAttr
	swap a
	and $f
	ld [wItemAttributeValue], a
	ret

GetItemAttr:
; Get attribute a of wCurItem.

	push hl
	push bc

	push af
	xor a
	ld [wItemAttributeValue], a

	ld a, [wCurItem]
	call GetItemIndexFromID

	ld b, h
	ld c, l

	ld a, BANK(ItemAttributes)
	ld hl, ItemAttributes
	call LoadIndirectPointer
	pop af

	ld b, 0
	ld c, a
	add hl, bc ; offset attribute

	ld a, BANK(ItemAttributes)
	call GetFarByte

	pop bc
	pop hl
	ret

ItemAttr_ReturnCarry:
	ld a, 1
	ld [wItemAttributeValue], a
	scf
	ret

GetItemPrice:
; Return the price of wCurItem in de.
	push hl
	push bc
	ld a, ITEMATTR_PRICE_LO
	call GetItemAttr
	ld e, a
	ld a, ITEMATTR_PRICE_HI
	call GetItemAttr
	ld d, a
	pop bc
	pop hl
	ret
