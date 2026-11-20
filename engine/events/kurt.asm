Kurt_PrintTextWhichApricorn:
	ld hl, .WhichApricornText
	jmp PrintText

.WhichApricornText:
	text_far _WhichApricornText
	text_end

Kurt_PrintTextHowMany:
	ld hl, .HowManyShouldIMakeText
	jmp PrintText

.HowManyShouldIMakeText:
	text_far _HowManyShouldIMakeText
	text_end

SelectApricornForKurt:
	call LoadStandardMenuHeader
	ld c, $1
	xor a
	ld [wMenuScrollPosition], a
	ld [wKurtApricornQuantity], a
.loop
	push bc
	call Kurt_PrintTextWhichApricorn
	pop bc
	ld a, c
	ld [wMenuSelection], a
	call Kurt_SelectApricorn
	ld a, c
	ld [wScriptVar], a
	and a
	jr z, .done
	ld [wCurItem], a
	ld a, [wMenuCursorY]
	ld c, a
	push bc
	call Kurt_PrintTextHowMany
	call Kurt_SelectQuantity
	pop bc
	jr nc, .loop
	ld a, [wItemQuantityChange]
	ld [wKurtApricornQuantity], a
	call Kurt_GiveUpSelectedQuantityOfSelectedApricorn

.done
	jmp ExitMenu

Kurt_SelectApricorn:
	farcall FindApricornsInBag
	jr c, .nope
	ld hl, .MenuHeader
	call CopyMenuHeader
	ld a, [wMenuSelection]
	ld [wMenuCursorPosition], a
	xor a
	ldh [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .nope
	ld a, [wMenuSelection]
	cp -1
	jr nz, .done

.nope
	xor a ; FALSE

.done
	ld c, a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, 13, 10
	dw .MenuData
	db 1 ; default option

	db 0 ; unused

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 4, 7 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wKurtApricornCount
	dba .Name
	dba .Quantity
	dba NULL

.Name:
	ld a, [wMenuSelection]
	and a
	ret z
	farjp PlaceMenuItemName

.Quantity:
	ld a, [wMenuSelection]
	ld [wCurItem], a
	call Kurt_GetQuantityOfApricorn
	ret z
	ld a, [wItemQuantityChange]
	ld [wMenuSelectionQuantity], a
	farjp PlaceMenuItemQuantity

Kurt_SelectQuantity:
	ld a, [wCurItem]
	ld [wMenuSelection], a
	call Kurt_GetQuantityOfApricorn
	jr z, .done
	ld a, [wItemQuantityChange]
	ld [wItemQuantity], a
	ld a, $1
	ld [wItemQuantityChange], a
	ld hl, .MenuHeader
	call LoadMenuHeader
.loop
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call .PlaceApricornName
	call PlaceApricornQuantity
	call ApplyTilemap
	farcall Kurt_SelectQuantity_InterpretJoypad
	jr nc, .loop

	push bc
	call PlayClickSFX
	pop bc
	ld a, b
	cp -1
	jr z, .done
	ld a, [wItemQuantityChange]
	scf

.done
	jmp CloseWindow

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 9, SCREEN_WIDTH - 1, 12
	dw NULL
	db -1 ; default option
	db 0

.PlaceApricornName:
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld d, h
	ld e, l
	farjp PlaceMenuItemName

PlaceApricornQuantity:
	call MenuBoxCoord2Tile
	ld de, 2 * SCREEN_WIDTH + 10
	add hl, de
	ld a, "×"
	ld [hli], a
	ld de, wItemQuantityChange
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jmp PrintNum

Kurt_GetQuantityOfApricorn:
; wItemQuantityChange = how many of Apricorn [wCurItem] the Berries pocket holds (at most 99)
	push bc
	push de
	ld a, [wCurItem]
	call GetItemIndexFromID
	ld d, l
	ld hl, wBerries
	ld b, 0
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp d
	ld a, [hli]
	jr nz, .loop
	add b
	ld b, a
	jr nc, .loop
	ld b, -1

.done
	ld a, b
	cp 99
	jr c, .got_count
	ld a, 99
.got_count
	ld [wItemQuantityChange], a
	and a
	pop de
	pop bc
	ret

Kurt_GiveUpSelectedQuantityOfSelectedApricorn:
; Take [wItemQuantityChange] of Apricorn [wCurItem] from the Berries pocket, from
; as many stacks as it takes. Returns a = the quantity that couldn't be taken (z if none).
	push de
	push bc
	ld a, [wCurItem]
	call GetItemIndexFromID
	ld d, l
	ld a, [wItemQuantityChange]
	ld b, a
.loop
	ld a, b
	and a
	jr z, .done
	; find a stack of it
	ld hl, wBerries
.find
	ld a, [hli]
	cp -1
	jr z, .done
	cp d
	jr z, .found
	inc hl
	jr .find

.found
	ld a, [hl]
	cp b
	jr c, .take ; the whole stack
	ld a, b
.take
	ld c, a
	ld [wItemQuantityChange], a
	ld a, -1 ; no list position hint
	ld [wCurItemQuantity], a
	push bc
	push de
	ld hl, wNumItems
	call TossItem
	pop de
	pop bc
	ld a, b
	sub c
	ld b, a
	jr .loop

.done
	ld a, b
	ld [wItemQuantityChange], a
	and a
	pop bc
	pop de
	ret
