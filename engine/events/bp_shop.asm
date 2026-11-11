; BP shops: a vendor sells one BP tier (data/events/bp_shops.asm) for Battle
; Points (wBattlePoints, in the save extension). One item per purchase.

BPShop::
; wScriptVar = the shop (BPSHOP_*)
	call .ReadShop
	call FadeToMenu
	farcall BlankScreen
	farcall LoadOW_BGPal7
	call FadePalettes
	xor a
	ld [wMenuScrollPositionBackup], a
	inc a
	ld [wMenuCursorPositionBackup], a
.loop
	call .ShowBP
	call UpdateSprites
	ld hl, .MenuHeader
	call CopyMenuHeader
	ld a, [wMenuCursorPositionBackup]
	ld [wMenuCursorPosition], a
	ld a, [wMenuScrollPositionBackup]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wMenuScrollPositionBackup], a
	ld a, [wMenuCursorY]
	ld [wMenuCursorPositionBackup], a
	call SpeechTextbox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jmp z, CloseSubmenu
	call .Buy
	jr .loop

.ReadShop:
; wCurMartCount, wCurMartItems = the shop's item IDs; wMartItem1BCD = their
; prices, one byte each
	ld a, [wScriptVar]
	ld e, a
	ld d, 0
	ld hl, BPShops
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wCurMartItems
	ld bc, wMartItem1BCD
.read
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	cphl16 -1
	jr z, .read_done
	call GetItemIDFromIndex
	ld [de], a
	inc de
	pop hl
	inc hl
	ld a, [hli]
	ld [bc], a
	inc bc
	jr .read

.read_done
	pop hl
	ld a, -1
	ld [de], a
	ld a, e
	sub LOW(wCurMartItems)
	ld [wCurMartCount], a
	ret

.Buy:
	ld a, [wMenuSelection]
	ld [wCurItem], a
	ld [wNamedObjectIndex], a
	call GetItemName
	ld a, [wScrollingMenuCursorPosition]
	ld e, a
	ld d, 0
	ld hl, wMartItem1BCD
	add hl, de
	ld a, [hl]
	ld [wBPShopPrice], a
	ld hl, .CostsText
	call PrintText
	call YesNoBox
	ret c
; enough BP?
	call .GetBP
	ld a, h
	and a
	jr nz, .enough
	ld a, [wBPShopPrice]
	ld c, a
	ld a, l
	cp c
	jr c, .not_enough
.enough
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .pack_full
	call .GetBP
	ld a, [wBPShopPrice]
	ld c, a
	ld b, 0
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call .SetBP
	call WaitSFX
	ld de, SFX_TRANSACTION
	call PlaySFX
	ld hl, .HereYouGoText
	jr .say

.not_enough
	ld hl, .NotEnoughText
	jr .say

.pack_full
	ld hl, .PackFullText
.say
	call PrintText
	jmp JoyWaitAorB

.GetBP:
; hl = wBattlePoints
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBattlePoints)
	ldh [rSVBK], a
	ld a, [wBattlePoints]
	ld h, a
	ld a, [wBattlePoints + 1]
	ld l, a
	pop af
	ldh [rSVBK], a
	ret

.SetBP:
; wBattlePoints = hl
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBattlePoints)
	ldh [rSVBK], a
	ld a, h
	ld [wBattlePoints], a
	ld a, l
	ld [wBattlePoints + 1], a
	pop af
	ldh [rSVBK], a
	ret

.ShowBP:
; a box at the top right with the player's BP
	call .GetBP
	ld a, h
	ld [wBPShopBalance], a
	ld a, l
	ld [wBPShopBalance + 1], a
	hlcoord 11, 0
	lb bc, 1, 7
	call Textbox
	hlcoord 12, 1
	ld de, .BPString
	rst PlaceString
	ld de, wBPShopBalance
	lb bc, 2, 4
	hlcoord 15, 1
	jmp PrintNum

.BPString:
	db "BP@"

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 3, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3 ; flags
	db 4, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wCurMartCount
	dba PlaceMenuItemName
	dba .PrintPrice
	dba UpdateItemDescription

.PrintPrice:
; "  N BP" under the item's name
	ld a, [wScrollingMenuCursorPosition]
	ld c, a
	ld b, 0
	ld hl, wMartItem1BCD
	add hl, bc
	ld a, [hl]
	ld [wBPShopPrice], a
	ld hl, SCREEN_WIDTH + 3
	add hl, de
	push hl
	ld de, wBPShopPrice
	lb bc, 1, 3
	call PrintNum
	pop hl
	ld de, 4
	add hl, de
	ld de, .BPString
	rst PlaceString
	ret

.CostsText:
	text_far _BPShopCostsText
	text_end

.HereYouGoText:
	text_far _BPShopHereYouGoText
	text_end

.NotEnoughText:
	text_far _BPShopNotEnoughText
	text_end

.PackFullText:
	text_far _BPShopPackFullText
	text_end

INCLUDE "data/events/bp_shops.asm"

SECTION "BP Shop Text", ROMX

_BPShopCostsText::
	text_ram wStringBuffer1
	text_start
	line "costs @"
	text_decimal wBPShopPrice, 1, 3
	text " BP. OK?"
	done

_BPShopHereYouGoText::
	text "Here you go!"
	done

_BPShopNotEnoughText::
	text "You don't have"
	line "enough BP."
	done

_BPShopPackFullText::
	text "You have no room"
	line "for it."
	done
