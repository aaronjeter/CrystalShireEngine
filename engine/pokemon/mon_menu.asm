HasNoItems:
	ld a, [wNumItems]
	and a
	ret nz
	ld a, [wNumKeyItems]
	and a
	ret nz
	ld a, [wNumBalls]
	and a
	ret nz
	ld hl, wTMsHMs
	ld b, NUM_TMS + NUM_HMS
.loop
	ld a, [hli]
	and a
	jr nz, .done
	dec b
	jr nz, .loop
	scf
	ret
.done
	and a
	ret

TossItemFromPC:
	push de
	call PartyMonItemName
	farcall _CheckTossableItem
	ld a, [wItemAttributeValue]
	and a
	jr nz, .key_item
	ld hl, .ItemsTossOutHowManyText
	call MenuTextbox
	farcall SelectQuantityToToss
	push af
	call CloseWindow
	call ExitMenu
	pop af
	jr c, .quit
	ld hl, .ItemsThrowAwayText
	call MenuTextbox
	call YesNoBox
	push af
	call ExitMenu
	pop af
	jr c, .quit
	pop hl
	ld a, [wCurItemQuantity]
	call TossItem
	call PartyMonItemName
	ld hl, .ItemsDiscardedText
	call MenuTextbox
	call ExitMenu
	and a
	ret

.key_item
	call .CantToss
.quit
	pop hl
	scf
	ret

.ItemsTossOutHowManyText:
	text_far _ItemsTossOutHowManyText
	text_end

.ItemsThrowAwayText:
	text_far _ItemsThrowAwayText
	text_end

.ItemsDiscardedText:
	text_far _ItemsDiscardedText
	text_end

.CantToss:
	ld hl, .ItemsTooImportantText
	jmp MenuTextboxBackup

.ItemsTooImportantText:
	text_far _ItemsTooImportantText
	text_end

CantUseItem:
	ld hl, ItemsOakWarningText
	jmp MenuTextboxWaitButton

ItemsOakWarningText:
	text_far _ItemsOakWarningText
	text_end

PartyMonItemName:
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	jmp CopyName1

CancelPokemonAction:
	farcall InitPartyMenuWithCancel
	farcall UnfreezeMonIcons
	ld a, 1
	ret

PokemonActionSubmenu:
	farcall PartyCardsHidePrompt
	farcall MonSubmenu
.dispatch
	call GetCurNickname
	ld a, [wMenuSelection]
	cp MONMENUITEM_FIELD
	jr z, .field
	ld hl, .Actions
	ld de, 3
	call IsInArray
	jr nc, .nothing

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.nothing
	xor a
	ret

.field
	farcall MonFieldSubmenu
	ld a, [wMenuSelection]
	cp MONMENUITEM_CANCEL
	jr nz, .dispatch
	farcall MonSubmenu ; back to the main list
	jr .dispatch

.Actions:
	dbw MONMENUITEM_CUT,        MonMenu_Cut
	dbw MONMENUITEM_FLY,        MonMenu_Fly
	dbw MONMENUITEM_SURF,       MonMenu_Surf
	dbw MONMENUITEM_STRENGTH,   MonMenu_Strength
	dbw MONMENUITEM_FLASH,      MonMenu_Flash
	dbw MONMENUITEM_WHIRLPOOL,  MonMenu_Whirlpool
	dbw MONMENUITEM_DIG,        MonMenu_Dig
	dbw MONMENUITEM_TELEPORT,   MonMenu_Teleport
	dbw MONMENUITEM_SOFTBOILED, MonMenu_Softboiled_MilkDrink
	dbw MONMENUITEM_MILKDRINK,  MonMenu_Softboiled_MilkDrink
	dbw MONMENUITEM_HEADBUTT,   MonMenu_Headbutt
	dbw MONMENUITEM_WATERFALL,  MonMenu_Waterfall
	dbw MONMENUITEM_ROCKSMASH,  MonMenu_RockSmash
	dbw MONMENUITEM_SWEETSCENT, MonMenu_SweetScent
	dbw MONMENUITEM_STATS,      OpenPartyStats
	dbw MONMENUITEM_SWITCH,     SwitchPartyMons
	dbw MONMENUITEM_ITEM,       GiveTakePartyMonItem
	dbw MONMENUITEM_CANCEL,     CancelPokemonAction
	dbw MONMENUITEM_FOLLOW,     MonMenu_Follow
	dbw MONMENUITEM_MAIL,       MonMailAction
	dbw MONMENUITEM_NICKNAME,   MonMenu_Nickname
	dbw MONMENUITEM_UNFOLLOW,   MonMenu_Follow

SwitchPartyMons:
; Don't try if there's nothing to switch!
	ld a, [wPartyCount]
	cp 2
	jr c, .DontSwitch

	ld a, [wCurPartyMon]
	inc a
	ld [wSwitchMon], a

	farcall HoldSwitchmonIcon
	farcall InitPartyMenuNoCancel

	ld a, PARTYMENUACTION_MOVE
	ld [wPartyMenuActionText], a
	xor a ; the cards are on the screen: only the held card's palette changes
	farcall PartyCardsRedraw
	farcall PlacePartyMenuText

	call WaitBGMap
	call SetDefaultBGPAndOBP
	call DelayFrame

	farcall PartyMenuSelect
	bit B_BUTTON_F, b
	jr c, .DontSwitch

	farcall _SwitchPartyMons

	ld a, 1 << PARTYMENU_REORDER_F ; back to the Start menu's party menu
	ld [wPartyMenuActionText], a

	farcall InitPartyMenuWithCancel
	farcall PartyCardsRedrawSwitched

	ld a, 4 ; back to the party menu as it is
	ret

.DontSwitch:
	ld a, 1 << PARTYMENU_REORDER_F ; back to the Start menu's party menu
	ld [wPartyMenuActionText], a
	jmp CancelPokemonAction

MonMenu_Nickname:
	farjp PartyCardsNickname

MonMenu_Follow:
	farjp PartyCardsFollow

GiveTakePartyMonItem:
; Eggs can't hold items!
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .cancel

	ld hl, GiveTakeItemMenuData
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu
	jr c, .cancel

	call GetCurNickname
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
	ld a, [wMenuCursorY]
	cp 3
	jr z, .swap
	cp 1
	jr nz, .take

	call LoadStandardMenuHeader
	call ClearPalettes
	call .GiveItem
	call ClearPalettes
	call LoadFontsBattleExtra
	call ExitMenu
	xor a
	ret

.take
	call TakePartyItem
	ld a, 3
	ret

.swap
	farjp PartyCardsSwapItem

.cancel
	ld a, 3
	ret

.GiveItem:
	ld hl, wItemFlags
	set IN_BAG_F, [hl]
	call GetItemToGive
	ret z
	call TryGiveItemToPartymon
	ld hl, wItemFlags
	res IN_BAG_F, [hl]
	ret

GetItemToGive:
; Returns nz if we got an item to give.
	call DepositSellInitPackBuffers
	; fallthrough
_GetItemToGive:
.loop
	call DepositSellPack

	ld a, [wPackUsedItem]
	and a
	ret z

	ld a, [wCurPocket]
	cp KEY_ITEM_POCKET
	jr z, .next

	call CheckTossableItem
	ld a, [wItemAttributeValue]
	and a
	jr nz, .next

	or 1
	ret

.next
	ld hl, ItemCantHeldText
	call MenuTextboxBackup
	jr .loop

PCGiveItem:
	ld hl, wItemFlags
	set IN_BAG_F, [hl]
	call DepositSellInitPackBuffers
.loop
	call _GetItemToGive
	jr z, .done

	; Ensure that we aren't trying to give Mail to a Pokémon in storage.
	ld a, [wCurItem]
	ld d, a
	farcall ItemIsMail
	jr nc, .item_ok

	ld a, [wBufferMonBox]
	and a
	jr z, .item_ok

	ld hl, CantPlaceMailInStorageText
	call MenuTextboxBackup
	jr .loop

.item_ok
	call PartyMonItemName
	call GiveItemToPokemon

	ld hl, wBufferMonNickname
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	rst CopyBytes

	ld hl, PokemonHoldItemText
	call MenuTextboxBackup

	; Now, actually give the item.
	ld a, [wBufferMonSpecies]
	ld [wCurPartySpecies], a
	ld de, wCurItem
	ld a, [de]
	ld [wBufferMonItem], a
	farcall UpdateStorageBoxMonFromTemp

	; We know that if we're dealing with Mail, then we're giving to a partymon.
	; Thus, there's no harm in using party-specific code.
	ld a, [wBufferMonSlot]
	dec a
	ld [wCurPartyMon], a
	ld a, [wCurItem]
	ld d, a
	farcall ItemIsMail
	jr nc, .done
	call ComposeMailMessage

.done
	ld hl, wItemFlags
	res IN_BAG_F, [hl]
	ret

TryGiveItemToPartymon:
	call SpeechTextbox
	call PartyMonItemName
	call GetPartyItemLocation
	ld a, [hl]
	and a
	jr z, .give_item_to_mon

	push hl
	ld d, a
	farcall ItemIsMail
	pop hl
	jr c, .please_remove_mail
	ld a, [hl]
	jr .already_holding_item

.give_item_to_mon
	call GiveItemToPokemon
	ld hl, PokemonHoldItemText
	call MenuTextboxBackup
	jr GivePartyItem

.please_remove_mail
	ld hl, PokemonRemoveMailText
	jmp MenuTextboxBackup

.already_holding_item
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, PokemonAskSwapItemText
	call StartMenuYesNo
	ret c

	call GiveItemToPokemon
	ld a, [wNamedObjectIndex]
	push af
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	pop af
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .bag_full

	ld hl, PokemonSwapItemText
	call MenuTextboxBackup
	ld a, [wNamedObjectIndex]
	ld [wCurItem], a
	jr GivePartyItem

.bag_full
	ld a, [wNamedObjectIndex]
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	ld hl, ItemStorageFullText
	jmp MenuTextboxBackup

GivePartyItem:
	call GetPartyItemLocation
	ld a, [wCurItem]
	ld [hl], a
	ld d, a
	farcall ItemIsMail
	ret nc
	jmp ComposeMailMessage

TakePartyItem:
	call SpeechTextbox
	call GetPartyItemLocation
	ld a, [hl]
	and a
	jr z, .not_holding_item

	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .item_storage_full

	farcall ItemIsMail
	call GetPartyItemLocation
	ld a, [hl]
	ld [wNamedObjectIndex], a
	ld [hl], NO_ITEM
	call GetItemName
	ld hl, PokemonTookItemText
	jmp MenuTextboxBackup

.not_holding_item
	ld hl, PokemonNotHoldingText
	jmp MenuTextboxBackup

.item_storage_full
	ld hl, ItemStorageFullText
	jmp MenuTextboxBackup

GiveTakeItemMenuData:
	db MENU_SPRITE_ANIMS | MENU_BACKUP_TILES ; flags
	menu_coords 12, 10, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .Items
	db 1 ; default option

.Items:
	db STATICMENU_CURSOR ; flags
	db 3 ; # items
	db "Give@"
	db "Take@"
	db "Swap@"

PokemonSwapItemText:
	text_far _PokemonSwapItemText
	text_end

PokemonHoldItemText:
	text_far _PokemonHoldItemText
	text_end

PokemonRemoveMailText:
	text_far _PokemonRemoveMailText
	text_end

PokemonNotHoldingText:
	text_far _PokemonNotHoldingText
	text_end

ItemStorageFullText:
	text_far _ItemStorageFullText
	text_end

PokemonTookItemText:
	text_far _PokemonTookItemText
	text_end

PokemonAskSwapItemText:
	text_far _PokemonAskSwapItemText
	text_end

ItemCantHeldText:
	text_far _ItemCantHeldText
	text_end

CantPlaceMailInStorageText:
	text_far _CantPlaceMailInStorageText
	text_end

GetPartyItemLocation:
	push af
	ld a, MON_ITEM
	call GetPartyParamLocation
	pop af
	ret

ReceiveItemFromPokemon:
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	jmp ReceiveItem

GiveItemToPokemon:
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	jmp TossItem

StartMenuYesNo:
	call MenuTextbox
	call YesNoBox
	jmp ExitMenu

ComposeMailMessage:
	ld de, wTempMailMessage
	call _ComposeMailMessage
	ld hl, wPlayerName
	ld de, wTempMailAuthor
	ld bc, NAME_LENGTH - 1
	rst CopyBytes
	ld hl, wPlayerID
	ld bc, 2
	rst CopyBytes
	ld a, [wCurPartySpecies]
	ld [de], a
	inc de
	ld a, [wCurItem]
	ld [de], a
	ld a, [wCurPartyMon]
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, wTempMail
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call OpenSRAM
	rst CopyBytes
	jmp CloseSRAM

MonMailAction:
; If in the time capsule or trade center,
; selecting the mail only allows you to
; read the mail.
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .read
	cp LINK_TRADECENTER
	jr z, .read

; Show the READ/TAKE/QUIT menu.
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu

; Interpret the menu.
	ld a, $3
	ret c
	ld a, [wMenuCursorY]
	cp $1
	jr z, .read
	cp $2
	jr z, TakeMail
	ld a, $3
	ret

.read
	farcall ReadPartyMonMail
	xor a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 10, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Read@"
	db "Take@"
	db "Quit@"

TakeMail:
	ld hl, .MailAskSendToPCText
	call StartMenuYesNo
	jr c, .RemoveMailToBag
	ld a, [wCurPartyMon]
	ld b, a
	farcall SendMailToPC
	jr c, .MailboxFull
	ld hl, .MailSentToPCText
	call MenuTextboxBackup
	jr .TookMail

.MailboxFull:
	ld hl, .MailboxFullText
	call MenuTextboxBackup
	jr .KeptMail

.RemoveMailToBag:
	ld hl, .MailLoseMessageText
	call StartMenuYesNo
	jr c, .KeptMail
	call GetPartyItemLocation
	ld a, [hl]
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .BagIsFull
	call GetPartyItemLocation
	ld [hl], $0
	call GetCurNickname
	ld hl, .MailDetachedText
	call MenuTextboxBackup
	; fallthrough
.TookMail:
	scf
	jr .done

.BagIsFull:
	ld hl, .MailNoSpaceText
	call MenuTextboxBackup
	; fallthrough
.KeptMail:
	and a
.done
	ld a, $3
	ret

.MailLoseMessageText:
	text_far _MailLoseMessageText
	text_end

.MailDetachedText:
	text_far _MailDetachedText
	text_end

.MailNoSpaceText:
	text_far _MailNoSpaceText
	text_end

.MailAskSendToPCText:
	text_far _MailAskSendToPCText
	text_end

.MailboxFullText:
	text_far _MailboxFullText
	text_end

.MailSentToPCText:
	text_far _MailSentToPCText
	text_end

OpenPartyStats:
; PartyMon
	xor a
	ld [wMonType], a
	; fallthrough
_OpenPartyStats:
	call LoadStandardMenuHeader
	call ClearSprites
	call LowVolume
	predef StatsScreenInit
	; This ensures that MaxVolume works as it should if we're in the middle of
	; playing a cry.
	ld a, MAX_VOLUME
	ld [wLastVolume], a
	call MaxVolume
	xor a
	ld [wLastVolume], a
	call ExitMenu
	xor a
	ret

MonMenu_Cut:
	farcall CutFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Fly:
	xor a
	ld [wFlyingWithHMItem], a
	farcall FlyFunction
	ld a, [wFieldMoveSucceeded]
	cp $2
	jr z, .Fail
	and a
	jr z, .Error
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

.Error:
	xor a
	ret

MonMenu_Flash:
	farcall FlashFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Strength:
	farcall StrengthFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Whirlpool:
	farcall WhirlpoolFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Waterfall:
	farcall WaterfallFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Teleport:
	farcall TeleportFunction
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Surf:
	farcall SurfFunction
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Dig:
	farcall DigFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_Softboiled_MilkDrink:
	call .CheckMonHasEnoughHP
	jr nc, .NotEnoughHP
	farcall Softboiled_MilkDrinkFunction
	jr .finish

.NotEnoughHP:
	ld hl, .PokemonNotEnoughHPText
	call PrintText

.finish
	ld a, 1 << PARTYMENU_REORDER_F ; back to the Start menu's party menu
	ld [wPartyMenuActionText], a
	ld a, $3
	ret

.PokemonNotEnoughHPText:
	text_far _PokemonNotEnoughHPText
	text_end

.CheckMonHasEnoughHP:
; Need to have at least (MaxHP / 5) HP left.
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ldh [hDividend + 0], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ld a, MON_HP + 1
	call GetPartyParamLocation
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ldh a, [hQuotient + 2]
	sbc [hl]
	ret

MonMenu_Headbutt:
	farcall HeadbuttFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_RockSmash:
	farcall RockSmashFunction
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, .Fail
	ld b, $4
	ld a, $2
	ret

.Fail:
	ld a, $3
	ret

MonMenu_SweetScent:
	farcall SweetScentFromMenu
	ld b, $4
	ld a, $2
	ret

ChooseMoveToDelete:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call LoadFontsBattleExtra
	call .ChooseMoveToDelete
	pop bc
	ld a, b
	ld [wOptions], a
	push af
	call ClearBGPalettes
	pop af
	ret

.ChooseMoveToDelete
	call SetUpMoveScreenBG
	ld de, DeleteMoveScreen2DMenuData
	call Load2DMenuData
	call SetUpMoveList
	ld hl, w2DMenuFlags1
	set _2DMENU_ENABLE_SPRITE_ANIMS_F, [hl]
	jr .enter_loop

.loop
	call ScrollingMenuJoypad
	bit B_BUTTON_F, a
	jr nz, .b_button
	bit A_BUTTON_F, a
	jr nz, .a_button

.enter_loop
	call PrepareToPlaceMoveData
	call PlaceMoveData
	jr .loop

.a_button
	and a
	jr .finish

.b_button
	scf

.finish
	push af
	xor a
	ld [wSwitchMon], a
	ld hl, w2DMenuFlags1
	res _2DMENU_ENABLE_SPRITE_ANIMS_F, [hl]
	call ClearSprites
	call ClearTilemap
	pop af
	ret

DeleteMoveScreen2DMenuData:
	db 3, 1 ; cursor start y, x
	db 3, 1 ; rows, columns
	db _2DMENU_ENABLE_SPRITE_ANIMS ; flags 1
	db 0 ; flags 2
	dn 2, 0 ; cursor offset
	db D_UP | D_DOWN | A_BUTTON | B_BUTTON ; accepted buttons

SetUpMoveScreenBG:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	farcall LoadStatsScreenPageTilesGFX
	farcall LoadTypeIconGFX
	farcall ClearSpriteAnims2
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wTempIconSpecies], a
	ld e, MONICON_MOVES
	farcall LoadMenuMonIcon
	hlcoord 0, 1
	lb bc, 9, 18
	call Textbox
	hlcoord 0, 11
	lb bc, 5, 18
	call Textbox
	hlcoord 2, 0
	lb bc, 2, 3
	call ClearBox
	xor a
	ld [wMonType], a
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNickname
	hlcoord 5, 1
	rst PlaceString
	push bc
	farcall CopyMonToTempMon
	pop hl
	call PrintLevel
	ld hl, wPlayerHPPal
	call SetHPPal
	ld b, SCGB_MOVE_LIST
	call GetSGBLayout
	hlcoord 16, 0
	lb bc, 1, 3
	jmp ClearBox

SetUpMoveList:
	xor a
	ldh [hBGMapMode], a
	ld [wSwappingMove], a
	ld [wMonType], a
	predef CopyMonToTempMon
	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	rst CopyBytes
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	hlcoord 2, 3
	predef ListMoves
	hlcoord 10, 4
	predef ListMovePP
	call WaitBGMap
	call SetDefaultBGPAndOBP
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	hlcoord 0, 11
	lb bc, 5, 18
	jmp Textbox

PrepareToPlaceMoveData:
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	rst AddNTimes
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurSpecies], a
	hlcoord 1, 12
	lb bc, 5, 18
	jmp ClearBox

PlaceMoveData:
	xor a
	ldh [hBGMapMode], a

	;Print UI elements
	hlcoord 0, 10
	ld de, String_MoveType_Top
	rst PlaceString
	hlcoord 0, 11
	ld de, String_MoveType_Bottom
	rst PlaceString
	hlcoord 4, 13	
	ld de, String_MoveAtk
	rst PlaceString
	hlcoord 12, 13
	ld de, String_MoveAcc
	rst PlaceString
	hlcoord 12, 12
	ld de, String_MoveEff
	rst PlaceString

	; category and type icons in the notch (1, 11) and (5, 11), in icon slots
	; 0-1 with OBJ palettes 6-7 (the mon's icon uses palette 1)
	ld a, [wCurSpecies]
	lb bc, 11, 1
	lb de, 11, 5
	lb hl, 0, 6
	farcall PlaceMoveIcons

	;Print Move Power
	ld a, [wCurSpecies]
	ld l, a
	ld a, MOVE_POWER
	call GetMoveAttribute
	hlcoord 8, 13	
	cp 2
	;jr c, .no_power
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	lb bc, 1, 3
	call PrintNum

	; Print move accuracy
	ld a, [wCurSpecies]
	ld l, a
	ld a, MOVE_ACC
	call GetMoveAttribute
	Call ConvertPercentages
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 16, 13
	call PrintNum

	; Print move effect chance
	ld a, [wCurSpecies]
	ld l, a
	ld a, MOVE_CHANCE
	call GetMoveAttribute
	cp 1
	jr c, .if_null_chance
	Call ConvertPercentages
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 16, 12
	call PrintNum
	jr .skip_null_chance

.if_null_chance
	ld de, String_MoveNoPower
	ld bc, 3
	hlcoord 16, 12
	call PlaceString

.skip_null_chance

	jr .description

.no_power
	ld de, String_MoveNoPower
	rst PlaceString

	;Print Move Description
.description
	hlcoord 1, 14
	predef PrintMoveDescription
	ld a, $1
	ldh [hBGMapMode], a
	ret

	;UI Elements
String_MoveType_Top:
	db "┌────────┐@"
String_MoveType_Bottom:
	db "│        └@"
String_MoveAtk:
	db "Atk/@"
String_MoveNoPower:
	db "---@"
String_MoveAcc:
	db "Acc/@"
String_MoveEff:
	db "Eff/@"

; This converts values out of 256 into a value
; out of 100. It achieves this by multiplying
; the value by 100 and dividing it by 256.
ConvertPercentages:

	; Overwrite the "hl" register.
	ld l, a
	ld h, 0
	push af

	; Multiplies the value of the "hl" register by 3.
	add hl, hl
	add a, l
	ld l, a
	adc h
	sub l
	ld h, a

	; Multiplies the value of the "hl" register
	; by 8. The value of the "hl" register
	; is now 24 times its original value.
	add hl, hl
	add hl, hl
	add hl, hl

	; Add the original value of the "hl" value to itself,
	; making it 25 times its original value.
	pop af
	add a, l
	ld l, a
	adc h
	sbc l
	ld h, a

	; Multiply the value of the "hl" register by
	; 4, making it 100 times its original value.
	add hl, hl
	add hl, hl

	; Set the "l" register to 0.5, otherwise the rounded
	; value may be lower than expected. Round the
	; high byte to nearest and drop the low byte.
	ld l, 0.5
	sla l
	sbc a
	and 1
	add a, h
	ret
