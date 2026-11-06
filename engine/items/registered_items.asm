; Up to NUM_REGISTERED_ITEMS items registered for Select, one per direction:
; slot 0 ▲ (wRegisteredItem), 1 ◀, 2 ▶, 3 ▼ (wRegisteredItems2). Each slot holds an
; 8-bit item ID, 0 when empty.

RegisteredItemAddress:
; hl = the address of slot a. Preserves bc and de.
	ld hl, wRegisteredItem
	and a
	ret z
	push de
	ld e, a
	ld d, 0
	ld hl, wRegisteredItems2 - 1
	add hl, de
	pop de
	ret

RegisteredItemSlotItem::
; a = the item in slot a. Preserves bc.
	call RegisteredItemAddress
	ld a, [hl]
	ret

CountRegisteredItems::
; Empty the slots whose item is no longer in the Pack; c = the number of items left.
	ld a, [wCurItem]
	push af
	lb bc, 0, 0 ; b = slot, c = count
.loop
	ld a, b
	call RegisteredItemAddress
	ld a, [hl]
	and a
	jr z, .next
	ld [wCurItem], a
	push hl
	ld hl, wNumItems
	call CheckItem
	pop hl
	jr c, .have
	ld [hl], 0
	jr .next
.have
	inc c
.next
	inc b
	ld a, b
	cp NUM_REGISTERED_ITEMS
	jr nz, .loop
	pop af
	ld [wCurItem], a
	ret

FindRegisteredItem::
; Carry and b = the slot if item a is registered.
	ld c, a
	ld b, 0
.loop
	ld a, b
	call RegisteredItemAddress
	ld a, [hl]
	cp c
	jr z, .found
	inc b
	ld a, b
	cp NUM_REGISTERED_ITEMS
	jr nz, .loop
	and a
	ret

.found
	scf
	ret

RegisterItemInSlot::
; Register wCurItem to a direction picked in a box over the Pack. A direction that's
; taken is replaced; a registered item moves, or is unregistered if its own
; direction is picked. Returns a = REGISTER_ADDED, REGISTER_REMOVED or REGISTER_CANCELLED.
	call CountRegisteredItems
	ld a, [wCurItem]
	call FindRegisteredItem
	ld a, -1
	jr nc, .not_registered
	ld a, b
.not_registered
	push af ; the item's slot, or -1
	ld hl, RegisterWhichDirectionText
	call PrintText
	call DrawRegisteredItemsBox
	; the box takes the palette of the Pack's item names (the cursor column is red)
	ld a, [wAttrmap + SCREEN_WIDTH + 8]
	hlcoord 4, 0, wAttrmap
	ld c, 2 * NUM_REGISTERED_ITEMS + 1
.attr_row
	ld b, SCREEN_WIDTH - 4
.attr
	ld [hli], a
	dec b
	jr nz, .attr
	ld de, 4
	add hl, de
	dec c
	jr nz, .attr_row
	call CopyTilemapAtOnce
	ld e, TRUE ; empty directions too
	call PickRegisteredItemSlot.any
	push af
	call ExitMenu
	call CopyTilemapAtOnce
	pop af
	pop bc ; b = the item's slot, or -1
	jr nc, .picked
	ld a, REGISTER_CANCELLED
	ret

.picked
	ld c, a
	ld a, b
	cp -1
	jr z, .store
	; take it out of its old direction
	push bc
	call RegisteredItemAddress
	ld [hl], 0
	pop bc
	ld a, b
	cp c
	ld a, REGISTER_REMOVED
	ret z
.store
	ld a, c
	call RegisteredItemAddress
	ld a, [wCurItem]
	ld [hl], a
	ld a, REGISTER_ADDED
	ret

RegisterWhichDirectionText:
	text_far _RegisterWhichDirectionText
	text_end

RegisteredItemsMenu::
; The overworld's Select box. Returns carry if closed, else wCurItem = the chosen item.
	farcall ClearWeatherSprites
	call ClearWindowData
	ld de, SFX_MENU
	call PlaySFX
	farcall ReanchorBGMap_NoOAMUpdate
	; the empty box first, as the Start menu does: the font isn't loaded yet
	call DrawRegisteredItemsFrame
	call SafeUpdateSprites
	call HDMATransferTilemapAndAttrmap_Menu
	farcall LoadFonts_NoOAMUpdate
	call PlaceRegisteredItemsText
	call ApplyTilemap
	call UpdateTimePals
	call PickRegisteredItemSlot
	push af
	jr c, .closed
	call RegisteredItemAddress
	ld a, [hl]
	ld [wCurItem], a
	call PlayClickSFX
.closed
	call ExitMenu
	call CloseText
	call UpdateTimePals
	pop af
	ret

DrawRegisteredItemsBox:
	call DrawRegisteredItemsFrame
PlaceRegisteredItemsText:
	ld b, 0
.loop
	; the row: 1 + 2 * slot
	ld a, b
	add a
	inc a
	push bc
	ld c, a
	ld b, 0
	hlcoord 5, 0
	ld de, SCREEN_WIDTH
.row
	add hl, de
	dec c
	jr nz, .row
	pop bc
	push hl
	call PlaceRegisteredItemArrow
	pop hl
	inc hl
	inc hl
	ld a, b
	push hl
	call RegisteredItemAddress
	ld a, [hl]
	pop hl
	and a
	jr z, .next
	ld [wNamedObjectIndex], a
	push bc
	push hl
	call GetItemName
	pop hl
	call PlaceString
	pop bc
.next
	inc b
	ld a, b
	cp NUM_REGISTERED_ITEMS
	jr nz, .loop
	ret

PlaceRegisteredItemArrow:
; Place slot b's arrow at tilemap address hl. Preserves bc.
	push bc
	ld c, b
	ld b, 0
	push hl
	ld hl, .Arrows
	add hl, bc
	ld a, [hl]
	pop hl
	ld [hl], a
	pop bc
	ret

.Arrows:
; one per slot
	db "▲◂▶▼"

DrawRegisteredItemsFrame:
	ld hl, .MenuHeader
	call LoadMenuHeader
	jmp MenuBox

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 0, SCREEN_WIDTH - 1, 2 * NUM_REGISTERED_ITEMS
	dw NULL
	db 1 ; default option

PickRegisteredItemSlot:
; Wait for a direction with an item (carry clear, a = its slot) or B/Select (carry).
; .any: e = TRUE takes empty directions too.
	ld e, FALSE
.any
.loop
	push de
	call DelayFrame
	call GetJoypad
	pop de
	ldh a, [hJoyPressed]
	ld b, a
	and B_BUTTON | SELECT
	jr nz, .cancel
	ld c, 0
	bit D_UP_F, b
	jr nz, .got
	inc c
	bit D_LEFT_F, b
	jr nz, .got
	inc c
	bit D_RIGHT_F, b
	jr nz, .got
	inc c
	bit D_DOWN_F, b
	jr z, .loop
.got
	ld a, e
	and a
	jr nz, .ok
	ld a, c
	call RegisteredItemAddress
	ld a, [hl]
	and a
	jr z, .loop
.ok
	ld a, c
	and a
	ret

.cancel
	scf
	ret

PackItemQuantity::
	push de
	farcall PlaceMenuItemQuantity
	pop de
	jr PackRegisteredItemMark

PackKeyItemQuantity::
	push de
	farcall PlaceMenuKeyItemQuantity
	pop de
	jr PackRegisteredItemMark

PackBallQuantity::
	push de
	farcall PlaceMenuItemBallQuantity
	pop de
	; fallthrough

DEF PACK_MARK_COL EQU 6
DEF PACK_LIST_TOP EQUS "wTilemap + 2 * SCREEN_WIDTH + 16" ; the first entry's quantity column

PackRegisteredItemMark:
; Mark a Pack list entry whose item (wCurItem) is registered with its slot's arrow, in
; the blank column left of the cursor. de = the quantity column of the entry's name row.
	; the list's top entry clears the column first: entries move when it scrolls
	ld a, e
	cp LOW(PACK_LIST_TOP)
	jr nz, .mark
	ld a, d
	cp HIGH(PACK_LIST_TOP)
	jr nz, .mark
	hlcoord PACK_MARK_COL, 2
	ld bc, 2 * SCREEN_WIDTH
	ld a, 5 ; entries shown
.clear
	ld [hl], " "
	add hl, bc
	dec a
	jr nz, .clear
.mark
	ld a, [wCurItem]
	and a
	ret z
	push de
	call FindRegisteredItem
	pop hl
	ret nc
	ld de, PACK_MARK_COL - 16
	add hl, de
	jp PlaceRegisteredItemArrow

