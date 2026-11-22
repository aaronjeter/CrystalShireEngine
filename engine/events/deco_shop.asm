; Decoration shops: the Poké Doll vending machines (money) and the Battle Resort's
; cosmetics clerk (BP). Bought decorations are sent to the player's room; ones
; already owned aren't for sale. Data: data/events/deco_shops.asm.

DecoShop::
; wScriptVar = the shop (DECOSHOP_*)
	ld a, [wScriptVar]
	ld [wDecoShopID], a
	call .Read
	ld a, [wDecoShopCount]
	and a
	jr nz, .open
	ld hl, .SoldOutText
	call PrintText
	jmp JoyWaitAorB

.open
	call FadeToMenu
	farcall BlankScreen
	farcall LoadOW_BGPal7
	call FadePalettes
	xor a
	ld [wMenuScrollPositionBackup], a
	inc a
	ld [wMenuCursorPositionBackup], a
.loop
	call .ShowBalance
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
	call .Read
	ld a, [wDecoShopCount]
	and a
	jr nz, .loop
	xor a
	ld [wMenuScrollPositionBackup], a
	jmp CloseSubmenu

.Table:
; hl = the shop's entries, a = its currency
	ld a, [wDecoShopID]
	ld e, a
	ld d, 0
	ld hl, DecoShops
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ret

.Read:
; wDecoShopItems = the decorations for sale (not owned yet), then -1
	call .Table
	ld de, wDecoShopItems
	ld c, 0
.read_loop
	ld a, [hli]
	cp -1
	jr z, .read_done
	push hl
	push de
	push bc
	ld [wDecoShopTmp], a
	call .CheckOwned
	pop bc
	pop de
	jr nz, .owned
	ld a, [wDecoShopTmp]
	ld [de], a
	inc de
	inc c
.owned
	pop hl
	inc hl
	inc hl
	jr .read_loop

.read_done
	ld a, -1
	ld [de], a
	ld a, c
	ld [wDecoShopCount], a
	ret

.CheckOwned:
; nz if decoration a is owned
	call .GetFlag
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	ret

.GetFlag:
; de = decoration a's event flag (DecorationAttributes)
	ld hl, DecorationAttributes + DECOATTR_EVENT_FLAG
	ld bc, DECOATTR_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(DecorationAttributes)
	call GetFarWord
	ld d, h
	ld e, l
	ret

.GetPrice:
; wDecoShopPrice = the price of decoration [wMenuSelection]
	call .Table
	ld a, [wMenuSelection]
	ld b, a
.price_loop
	ld a, [hli]
	cp b
	jr z, .price_found
	inc hl
	inc hl
	jr .price_loop
.price_found
	ld a, [hli]
	ld [wDecoShopPrice + 1], a
	ld a, [hl]
	ld [wDecoShopPrice], a
	ret

.IsBP:
; z if this shop takes money, nz if BP
	call .Table
	cp DECOSHOP_BP
	jr z, .bp
	xor a
	ret
.bp
	or 1
	ret

.Buy:
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	farcall DecoShopName ; wStringBuffer2
	call .GetPrice
	call .IsBP
	ld hl, .CostsMoneyText
	jr z, .ask
	ld hl, .CostsBPText
.ask
	call PrintText
	call YesNoBox
	ret c
	call .IsBP
	jr nz, .pay_bp
; money: hMoneyTemp = the price
	xor a
	ldh [hMoneyTemp], a
	ld a, [wDecoShopPrice]
	ldh [hMoneyTemp + 1], a
	ld a, [wDecoShopPrice + 1]
	ldh [hMoneyTemp + 2], a
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall CompareMoney
	jr c, .not_enough
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall TakeMoney
	jr .bought

.pay_bp
	call .GetBP
	ld a, [wDecoShopPrice]
	ld b, a
	ld a, [wDecoShopPrice + 1]
	ld c, a
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	jr c, .not_enough
	call .SetBP

.bought
	ld a, [wMenuSelection]
	call .GetFlag
	ld b, SET_FLAG
	call EventFlagAction
	call WaitSFX
	ld de, SFX_TRANSACTION
	call PlaySFX
	ld hl, .SentHomeText
	jr .say

.not_enough
	call .IsBP
	ld hl, .NotEnoughMoneyText
	jr z, .say
	ld hl, .NotEnoughBPText
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

.ShowBalance:
	call .IsBP
	jr nz, .show_bp
	farjp PlaceMoneyTopRight
.show_bp
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
.YenString:
	db "¥@"

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 3, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 4, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wDecoShopCount
	dba .PlaceName
	dba .PrintPrice
	dba NULL

.PlaceName:
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	farcall DecoShopName
	pop hl
	ld de, wStringBuffer2
	rst PlaceString
	ret

.PrintPrice:
; the price under the name: "¥N" or "N BP"
	push de
	call .GetPrice
	call .IsBP
	pop hl
	push af
	ld de, SCREEN_WIDTH + 3
	add hl, de
	pop af
	jr nz, .print_bp
	ld de, .YenString
	push hl
	rst PlaceString
	pop hl
	inc hl
	ld de, wDecoShopPrice
	lb bc, 2, 5
	jmp PrintNum
.print_bp
	push hl
	ld de, wDecoShopPrice
	lb bc, 2, 3
	call PrintNum
	pop hl
	ld de, 4
	add hl, de
	ld de, .BPString
	rst PlaceString
	ret

.SoldOutText:
	text_far _DecoShopSoldOutText
	text_end

.CostsMoneyText:
	text_far _DecoShopCostsMoneyText
	text_end

.CostsBPText:
	text_far _DecoShopCostsBPText
	text_end

.SentHomeText:
	text_far _DecoShopSentHomeText
	text_end

.NotEnoughMoneyText:
	text_far _DecoShopNotEnoughMoneyText
	text_end

.NotEnoughBPText:
	text_far _BPShopNotEnoughText
	text_end

INCLUDE "data/events/deco_shops.asm"

SECTION "Deco Shop Text", ROMX

_DecoShopSoldOutText::
	text "It's sold out!"
	done

_DecoShopCostsMoneyText::
	text_ram wStringBuffer2
	text_start
	line "costs ¥@"
	text_decimal wDecoShopPrice, 2, 5
	text ". OK?"
	done

_DecoShopCostsBPText::
	text_ram wStringBuffer2
	text_start
	line "costs @"
	text_decimal wDecoShopPrice, 2, 3
	text " BP. OK?"
	done

_DecoShopSentHomeText::
	text_ram wStringBuffer2
	text_start
	line "was sent home!"
	done

_DecoShopNotEnoughMoneyText::
	text "You don't have"
	line "enough money."
	done
