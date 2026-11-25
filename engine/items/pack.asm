; Pack.Jumptable and BattlePack.Jumptable indexes
	const_def
	const PACKSTATE_INITGFX       ; 0
	const PACKSTATE_INITPOCKET    ; 1 (the pocket in wCurPocket)
	const PACKSTATE_POCKETMENU    ; 2
	const PACKSTATE_QUITNOSCRIPT  ; 3
	const PACKSTATE_QUITRUNSCRIPT ; 4

Pack:
	ld hl, wItemFlags
	set IN_BAG_F, [hl]
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	call InitPackBuffers
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .done
	call .RunJumptable
	call DelayFrame
	jr .loop

.done
	ld a, [wCurPocket]
	ld [wLastPocket], a
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ld hl, wItemFlags
	res IN_BAG_F, [hl]
	ret

.RunJumptable:
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call Pack_GetJumptablePointer
	jp hl

.Jumptable:
; entries correspond to PACKSTATE_* constants
	dw .InitGFX           ; 0
	dw Pack_InitPocket    ; 1
	dw .PocketMenu        ; 2
	dw Pack_QuitNoScript  ; 3
	dw Pack_QuitRunScript ; 4

.InitGFX:
	xor a
	ldh [hBGMapMode], a
	call Pack_InitGFX
	ld a, [wPackJumptableIndex]
	ld [wJumptableIndex], a
	jmp Pack_InitColors

.PocketMenu:
	ld a, [wCurPocket]
	cp TM_HM_POCKET
	jr z, .TMHMPocketMenu
	ld hl, PackPocketMenuHeaders
	call Pack_ListPocketMenu
	call Pack_InterpretJoypad
	ret c
	jmp .ItemBallsKey_LoadSubmenu

.TMHMPocketMenu:
	farcall TMHMPocket
	call Pack_InterpretJoypad
	ret c
	farcall _CheckTossableItem
	ld a, [wItemAttributeValue]
	and a
	jr nz, .use_quit
	ld hl, .MenuHeader2
	ld de, .Jumptable2
	jr .load_jump

.use_quit
	ld hl, .MenuHeader1
	ld de, .Jumptable1
.load_jump
	push de
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu
	pop hl
	ret c
	ld a, [wMenuCursorY]
	dec a
	call Pack_GetJumptablePointer
	jp hl

.MenuHeader1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData_1
	db 1 ; default option

.MenuData_1:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2 ; items
	db "Use@"
	db "Quit@"

.Jumptable1:
	dw .UseItem
	dw DoNothing ; QuitItemSubmenu

.MenuHeader2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 5, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData_2
	db 1 ; default option

.MenuData_2:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 3 ; items
	db "Use@"
	db "Give@"
	db "Quit@"

.Jumptable2:
	dw .UseItem
	dw GiveItem
	dw DoNothing ; QuitItemSubmenu

.UseItem:
	farcall AskTeachTMHM
	ret c
	farcall ChooseMonToLearnTMHM
	jr c, .declined
	ld hl, wOptions
	ld a, [hl]
	push af
	res NO_TEXT_SCROLL, [hl]
	farcall TeachTMHM
	pop af
	ld [wOptions], a
.declined
	xor a
	ldh [hBGMapMode], a
	call Pack_InitGFX
	call WaitBGMap_DrawPackGFX
	jmp Pack_InitColors

.ItemBallsKey_LoadSubmenu:
	farcall _CheckTossableItem
	ld a, [wItemAttributeValue]
	and a
	jr nz, .tossable
	farcall CheckSelectableItem
	ld a, [wItemAttributeValue]
	and a
	jr nz, .selectable
	farcall CheckItemMenu
	ld a, [wItemAttributeValue]
	and a
	jr nz, .usable
	jr .unusable

.selectable
	farcall CheckItemMenu
	ld a, [wItemAttributeValue]
	and a
	jr nz, .selectable_usable
	jr .selectable_unusable

.tossable
	farcall CheckSelectableItem
	ld a, [wItemAttributeValue]
	and a
	jr nz, .tossable_selectable
	jr .tossable_unselectable

.usable
	ld hl, MenuHeader_UsableKeyItem
	ld de, Jumptable_UseGiveTossRegisterQuit
	jr .build_menu

.selectable_usable
	ld hl, MenuHeader_UsableItem
	ld de, Jumptable_UseGiveTossQuit
	jr .build_menu

.tossable_selectable
	ld hl, MenuHeader_UnusableItem
	ld de, Jumptable_UseQuit
	jr .build_menu

.tossable_unselectable
	ld hl, MenuHeader_UnusableKeyItem
	ld de, Jumptable_UseRegisterQuit
	jr .build_menu

.unusable
	ld hl, MenuHeader_HoldableKeyItem
	ld de, Jumptable_GiveTossRegisterQuit
	jr .build_menu

.selectable_unusable
	ld hl, MenuHeader_HoldableItem
	ld de, Jumptable_GiveTossQuit
.build_menu
	push de
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu
	pop hl
	ret c
	ld a, [wMenuCursorY]
	dec a
	call Pack_GetJumptablePointer
	jp hl

MenuHeader_UsableKeyItem:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 1, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 5 ; items
	db "Use@"
	db "Give@"
	db "Toss@"
	db "Sel@"
	db "Quit@"

Jumptable_UseGiveTossRegisterQuit:
	dw UseItem
	dw GiveItem
	dw TossMenu
	dw RegisterItem
	dw DoNothing ; QuitItemSubmenu

MenuHeader_UsableItem:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 3, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 4 ; items
	db "Use@"
	db "Give@"
	db "Toss@"
	db "Quit@"

Jumptable_UseGiveTossQuit:
	dw UseItem
	dw GiveItem
	dw TossMenu
	dw DoNothing ; QuitItemSubmenu

MenuHeader_UnusableItem:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2 ; items
	db "Use@"
	db "Quit@"

Jumptable_UseQuit:
	dw UseItem
	dw DoNothing ; QuitItemSubmenu

MenuHeader_UnusableKeyItem:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 5, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 3 ; items
	db "Use@"
	db "Sel@"
	db "Quit@"

Jumptable_UseRegisterQuit:
	dw UseItem
	dw RegisterItem
	dw DoNothing ; QuitItemSubmenu

MenuHeader_HoldableKeyItem:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 3, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 4 ; items
	db "Give@"
	db "Toss@"
	db "Sel@"
	db "Quit@"

Jumptable_GiveTossRegisterQuit:
	dw GiveItem
	dw TossMenu
	dw RegisterItem
	dw DoNothing ; QuitItemSubmenu

MenuHeader_HoldableItem:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 5, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 3 ; items
	db "Give@"
	db "Toss@"
	db "Quit@"

Jumptable_GiveTossQuit:
	dw GiveItem
	dw TossMenu
	dw DoNothing ; QuitItemSubmenu

UseItem:
	; wUsingHMItem only applies to this use; field items like the Bird Whistle
	; set it so .Oak skips the "isn't the time" text after their own message
	xor a
	ld [wUsingHMItem], a
	farcall CheckItemMenu
	ld a, [wItemAttributeValue]
	ld hl, .dw
	jmp JumpTable

.dw
; entries correspond to ITEMMENU_* constants
	dw .Oak     ; ITEMMENU_NOUSE
	dw .Oak
	dw .Oak
	dw .Oak
	dw .Current ; ITEMMENU_CURRENT
	dw .Party   ; ITEMMENU_PARTY
	dw .Field   ; ITEMMENU_CLOSE

.Oak:
	ld a, [wUsingHMItem]
	and a
	ret nz
	ld hl, OakThisIsntTheTimeText
	jmp Pack_PrintTextNoScroll

.Current:
	jmp DoItemEffect

.Party:
	ld a, [wPartyCount]
	and a
	jr z, .NoPokemon
	call DoItemEffect
	xor a
	ldh [hBGMapMode], a
	call Pack_InitGFX
	call WaitBGMap_DrawPackGFX
	jmp Pack_InitColors

.NoPokemon:
	ld hl, YouDontHaveAMonText
	jmp Pack_PrintTextNoScroll

.Field:
	call DoItemEffect
	ld a, [wItemEffectSucceeded]
	and a
	jr z, .Oak
	ld a, PACKSTATE_QUITRUNSCRIPT
	ld [wJumptableIndex], a
	ret

TossMenu:
	ld hl, AskThrowAwayText
	call Pack_PrintTextNoScroll
	farcall SelectQuantityToToss
	push af
	call ExitMenu
	pop af
	ret c
	call Pack_GetItemName
	ld hl, AskQuantityThrowAwayText
	call MenuTextbox
	call YesNoBox
	push af
	call ExitMenu
	pop af
	ret c
	ld hl, wNumItems
	ld a, [wCurItemQuantity]
	call TossItem
	call Pack_GetItemName
	ld hl, ThrewAwayText
	jmp Pack_PrintTextNoScroll

RegisterItem:
	farcall CheckSelectableItem
	ld a, [wItemAttributeValue]
	and a
	jr nz, .cant_register
	farcall RegisterItemInSlot
	cp REGISTER_CANCELLED
	ret z
	push af
	call Pack_GetItemName
	ld de, SFX_FULL_HEAL
	call WaitPlaySFX
	pop af
	ld hl, RegisteredItemText
	and a ; REGISTER_ADDED
	jmp z, Pack_PrintTextNoScroll
	ld hl, UnregisteredItemText
	jmp Pack_PrintTextNoScroll

.cant_register
	ld hl, CantRegisterText
	jmp Pack_PrintTextNoScroll

GiveItem:
	ld a, [wPartyCount]
	and a
	jr z, .NoPokemon
	ld a, [wOptions]
	push af
	res NO_TEXT_SCROLL, a
	ld [wOptions], a
	ld a, PARTYMENUACTION_GIVE_ITEM
	ld [wPartyMenuActionText], a
	call ClearBGPalettes
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
.loop
	farcall WritePartyMenuTilemap
	farcall PlacePartyMenuText
	call WaitBGMap
	call SetDefaultBGPAndOBP
	call DelayFrame
	farcall PartyMenuSelect
	jr c, .finish
	ld a, [wCurPartySpecies]
	cp EGG
	jr nz, .give
	ld hl, .AnEggCantHoldAnItemText
	call PrintText
	jr .loop

.give
	ld a, [wJumptableIndex]
	push af
	ld a, [wPackJumptableIndex]
	push af
	call GetCurNickname
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
	call TryGiveItemToPartymon
	pop af
	ld [wPackJumptableIndex], a
	pop af
	ld [wJumptableIndex], a
.finish
	pop af
	ld [wOptions], a
	xor a
	ldh [hBGMapMode], a
	call Pack_InitGFX
	call WaitBGMap_DrawPackGFX
	jmp Pack_InitColors

.NoPokemon:
	ld hl, YouDontHaveAMonText
	jmp Pack_PrintTextNoScroll
.AnEggCantHoldAnItemText:
	text_far _AnEggCantHoldAnItemText
	text_end

BattlePack:
	ld hl, wItemFlags
	set IN_BAG_F, [hl]
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	call InitPackBuffers
	ld a, MEDICINE_POCKET
	ld [wCurPocket], a
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .end
	call .RunJumptable
	call DelayFrame
	jr .loop

.end
	ld a, [wCurPocket]
	ld [wLastPocket], a
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ld hl, wItemFlags
	res IN_BAG_F, [hl]
	ret

.RunJumptable:
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call Pack_GetJumptablePointer
	jp hl

.Jumptable:
; entries correspond to PACKSTATE_* constants
	dw .InitGFX           ; 0
	dw .InitPocket        ; 1
	dw .PocketMenu        ; 2
	dw Pack_QuitNoScript  ; 3
	dw Pack_QuitRunScript ; 4

.InitGFX:
	xor a
	ldh [hBGMapMode], a
	call Pack_InitGFX
	ld a, [wPackJumptableIndex]
	ld [wJumptableIndex], a
	jmp Pack_InitColors

.InitPocket:
	ld a, [wCurPocket]
	cp TM_HM_POCKET
	jmp nz, Pack_InitPocket
	call ClearPocketList
	call DrawPocketName
	call DrawPocketGFX
	xor a
	ldh [hBGMapMode], a
	call WaitBGMap_DrawPackGFX
	ld hl, PackEmptyText
	call Pack_PrintTextNoScroll
	jmp Pack_JumptableNext

.PocketMenu:
	ld a, [wCurPocket]
	cp TM_HM_POCKET
	jr z, .TMHMPocketMenu
	ld hl, PackPocketMenuHeaders
	call Pack_ListPocketMenu
	call Pack_InterpretJoypad
	ret c
	jr ItemSubmenu

.TMHMPocketMenu:
	farcall TMHMPocket
	call Pack_InterpretJoypad
	ret c
	xor a
	jr TMHMSubmenu

ItemSubmenu:
	farcall CheckItemContext
	ld a, [wItemAttributeValue]
TMHMSubmenu:
	and a
	jr z, .NoUse
	ld hl, .UsableMenuHeader
	ld de, .UsableJumptable
	jr .proceed

.NoUse:
	ld hl, .UnusableMenuHeader
	ld de, .UnusableJumptable
.proceed
	push de
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu
	pop hl
	ret c
	ld a, [wMenuCursorY]
	dec a
	call Pack_GetJumptablePointer
	jp hl

.UsableMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .UsableMenuData
	db 1 ; default option

.UsableMenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2 ; items
	db "Use@"
	db "Quit@"

.UsableJumptable:
	dw .Use
	dw DoNothing ; .Quit

.UnusableMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 9, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .UnusableMenuData
	db 1 ; default option

.UnusableMenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 1 ; items
	db "Quit@"

.UnusableJumptable:
	dw DoNothing ; .Quit

.Use:
	farcall CheckItemContext
	ld a, [wItemAttributeValue]
	ld hl, .ItemFunctionJumptable
	jmp JumpTable

.ItemFunctionJumptable:
; entries correspond to ITEMMENU_* constants
	dw .Oak         ; ITEMMENU_NOUSE
	dw .Oak
	dw .Oak
	dw .Oak
	dw .Unused      ; ITEMMENU_CURRENT
	dw .BattleField ; ITEMMENU_PARTY
	dw .BattleOnly  ; ITEMMENU_CLOSE

.Oak:
	ld hl, OakThisIsntTheTimeText
	jmp Pack_PrintTextNoScroll

.Unused:
	call DoItemEffect
	ld a, [wItemEffectSucceeded]
	and a
	jr nz, .ReturnToBattle
	ret

.BattleField:
	call DoItemEffect
	ld a, [wItemEffectSucceeded]
	and a
	jr nz, .quit_run_script
	xor a
	ldh [hBGMapMode], a
	call Pack_InitGFX
	call WaitBGMap_DrawPackGFX
	jmp Pack_InitColors

.ReturnToBattle:
	call ClearBGPalettes
	jr .quit_run_script

.BattleOnly:
	call DoItemEffect
	ld a, [wItemEffectSucceeded]
	and a
	jr z, .Oak
	cp $2
	jr z, .didnt_use_item
.quit_run_script
	ld a, PACKSTATE_QUITRUNSCRIPT
	ld [wJumptableIndex], a
	ret

.didnt_use_item
	xor a
	ld [wItemEffectSucceeded], a
	ret

InitPackBuffers:
	xor a
	ld [wJumptableIndex], a
	ld a, [wLastPocket]
	cp NUM_POCKETS
	jr c, .got_pocket
	xor a ; ITEM_POCKET
.got_pocket
	ld [wCurPocket], a
	ld a, PACKSTATE_INITPOCKET
	ld [wPackJumptableIndex], a
	xor a ; FALSE
	ld [wPackUsedItem], a
	xor a
	ld [wSwitchItem], a
	ret

DepositSellInitPackBuffers:
	xor a
	ldh [hBGMapMode], a
	ld [wJumptableIndex], a ; PACKSTATE_INITGFX
	ld [wPackJumptableIndex], a ; PACKSTATE_INITGFX
	ld [wCurPocket], a ; ITEM_POCKET
	ld [wPackUsedItem], a
	ld [wSwitchItem], a
	call Pack_InitGFX
	jmp Pack_InitColors

DepositSellPack:
.loop
	call .RunPocket
	call DepositSellPack_InterpretJoypad
	jr c, .loop
	ret

.RunPocket:
; wJumptableIndex = the pocket
	ld a, [wJumptableIndex]
	cp TM_HM_POCKET
	jr z, .TMHMPocket
	call InitPocket
	ld hl, PC_MartPocketMenuHeaders
	jmp Pack_ListPocketMenu

.TMHMPocket:
	call InitPocket
	call WaitBGMap_DrawPackGFX
	farcall TMHMPocket
	ld a, [wCurItem]
	ret

DepositSellPack_InterpretJoypad:
; like DepositSellTutorial_InterpretJoypad, through all the pockets
	ld hl, wMenuJoypad
	ld a, [hl]
	and D_LEFT | D_RIGHT
	jr z, DepositSellTutorial_InterpretJoypad
	and D_LEFT
	ld a, [wJumptableIndex]
	jr z, .right
	and a
	jr nz, .dec
	ld a, NUM_POCKETS
.dec
	dec a
	jr .got_pocket

.right
	inc a
	cp NUM_POCKETS
	jr c, .got_pocket
	xor a
.got_pocket
	ld [wJumptableIndex], a
	push de
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	pop de
	scf
	ret

InitPocket:
	ld [wCurPocket], a
	call ClearPocketList
	call DrawPocketName
	call DrawPocketGFX
	jmp WaitBGMap_DrawPackGFX

DepositSellTutorial_InterpretJoypad:
	ld hl, wMenuJoypad
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and D_LEFT
	jr nz, .d_left
	ld a, [hl]
	and D_RIGHT
	jr nz, .d_right
	scf
	ret

.a_button
	ld a, TRUE
	ld [wPackUsedItem], a
	and a
	ret

.b_button
	xor a ; FALSE
	ld [wPackUsedItem], a
	and a
	ret

.d_left
	ld a, [wJumptableIndex]
	dec a
	maskbits NUM_TUTORIAL_POCKETS
	ld [wJumptableIndex], a
	push de
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	pop de
	scf
	ret

.d_right
	ld a, [wJumptableIndex]
	inc a
	maskbits NUM_TUTORIAL_POCKETS
	ld [wJumptableIndex], a
	push de
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	pop de
	scf
	ret

TutorialPack:
	call DepositSellInitPackBuffers
	ld a, [wInputType]
	or a
	jr z, .loop
	farcall _DudeAutoInput_RightA
.loop
	call .RunJumptable
	call DepositSellTutorial_InterpretJoypad
	jr c, .loop
	xor a ; FALSE
	ld [wPackUsedItem], a
	ret

.RunJumptable:
	ld a, [wJumptableIndex]
	ld hl, .dw
	call Pack_GetJumptablePointer
	jp hl

.dw
; entries correspond to *_POCKET constants
	dw .Items
	dw .Balls
	dw .KeyItems
	dw .TMHM

.Items:
	xor a ; ITEM_POCKET
	ld hl, .ItemsMenuHeader
	jr .DisplayPocket

.ItemsMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 1, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .ItemsMenuData
	db 1 ; default option

.ItemsMenuData:
	db STATICMENU_ENABLE_SELECT | STATICMENU_ENABLE_LEFT_RIGHT | STATICMENU_ENABLE_START | STATICMENU_WRAP | STATICMENU_CURSOR ; flags
	db 5, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_QUANTITY ; item format
	dbw 0, wDudeNumItems
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba UpdateItemDescription

.KeyItems:
	ld a, KEY_ITEM_POCKET
	ld hl, .KeyItemsMenuHeader
	jr .DisplayPocket

.KeyItemsMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 1, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .KeyItemsMenuData
	db 1 ; default option

.KeyItemsMenuData:
	db STATICMENU_ENABLE_SELECT | STATICMENU_ENABLE_LEFT_RIGHT | STATICMENU_ENABLE_START | STATICMENU_WRAP | STATICMENU_CURSOR ; flags
	db 5, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wDudeNumKeyItems
	dba PlaceMenuKeyItemName
	dba PlaceMenuKeyItemQuantity
	dba UpdateKeyItemDescription

.TMHM:
	ld a, TM_HM_POCKET
	call InitPocket
	call WaitBGMap_DrawPackGFX
	farcall TMHMPocket
	ld a, [wCurItem]
	ret

.Balls:
	ld a, BALL_POCKET
	ld hl, .BallsMenuHeader
	jr .DisplayPocket

.BallsMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 1, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .BallsMenuData
	db 1 ; default option

.BallsMenuData:
	db STATICMENU_ENABLE_SELECT | STATICMENU_ENABLE_LEFT_RIGHT | STATICMENU_ENABLE_START | STATICMENU_WRAP | STATICMENU_CURSOR ; flags
	db 5, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_QUANTITY ; item format
	dbw 0, wDudeNumBalls
	dba PlaceMenuItemBallName
	dba PlaceMenuItemBallQuantity
	dba UpdateItemBallDescription

.DisplayPocket:
	push hl
	call InitPocket
	pop hl
	call CopyMenuHeader
	jmp ScrollingMenu

Pack_JumptableNext:
	ld hl, wJumptableIndex
	inc [hl]
	ret

Pack_GetJumptablePointer:
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pack_QuitNoScript:
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	xor a ; FALSE
	ld [wPackUsedItem], a
	ret

Pack_QuitRunScript:
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	ld a, TRUE
	ld [wPackUsedItem], a
	ret

Pack_PrintTextNoScroll:
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	call PrintText
	pop af
	ld [wOptions], a
	ret

WaitBGMap_DrawPackGFX:
	call WaitBGMap
DrawPackGFX:
	ld hl, PackGFX
	ld b, BANK(PackGFX)
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .got_gfx
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_gfx
	ld hl, PackFGFX
	ld b, BANK(PackFGFX)
.got_gfx
	ld a, [wCurPocket]
	add a
	ld e, a
	ld d, 0
	push hl
	ld hl, PackGFXOffsets
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wDecompressScratch
	add hl, de
	ld d, h
	ld e, l
	pop hl
; decompress the whole bag graphic, then copy the current pocket's 15 tiles
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	push de
	ld a, b
	ld de, wDecompressScratch
	call FarDecompress
	pop de
	ld hl, vTiles2 tile $50
	lb bc, BANK(@), 15
	call Request2bpp
	pop af
	ldh [rSVBK], a
	ret

PackGFXOffsets:
; entries correspond to *_POCKET constants
	table_width 2
	dw (15 tiles) * 1 ; ITEM_POCKET
	dw (15 tiles) * 1 ; MEDICINE_POCKET
	dw (15 tiles) * 3 ; BALL_POCKET
	dw (15 tiles) * 1 ; BERRY_POCKET
	dw (15 tiles) * 1 ; HELD_POCKET
	dw (15 tiles) * 1 ; TRAINING_POCKET
	dw (15 tiles) * 2 ; TM_HM_POCKET
	dw (15 tiles) * 0 ; KEY_ITEM_POCKET
	dw (15 tiles) * 1 ; TREASURE_POCKET
	assert_table_length NUM_POCKETS

Pack_InterpretJoypad:
	ld hl, wMenuJoypad
	ld a, [wSwitchItem]
	and a
	jr nz, .switching_item
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and D_LEFT
	jr nz, .d_left
	ld a, [hl]
	and D_RIGHT
	jr nz, .d_right
	ld a, [hl]
	and SELECT
	jr nz, .select
	scf
	ret

.a_button
	and a
	ret

.b_button
	ld a, PACKSTATE_QUITNOSCRIPT
	ld [wJumptableIndex], a
	scf
	ret

.d_left
	ld a, [wCurPocket]
	and a
	jr nz, .prev
	ld a, NUM_POCKETS
.prev
	dec a
	jr .switch_pocket

.d_right
	ld a, [wCurPocket]
	inc a
	cp NUM_POCKETS
	jr c, .switch_pocket
	xor a
.switch_pocket
	ld [wCurPocket], a
	ld a, PACKSTATE_INITPOCKET
	ld [wJumptableIndex], a
	ld [wPackJumptableIndex], a
	push de
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	pop de
	scf
	ret

.select
	farcall SwitchItemsInBag
	ld hl, AskItemMoveText
	call Pack_PrintTextNoScroll
	scf
	ret

.switching_item
	ld a, [hl]
	and A_BUTTON | SELECT
	jr nz, .place_insert
	ld a, [hl]
	and B_BUTTON
	jr nz, .end_switch
	scf
	ret

.place_insert
	farcall SwitchItemsInBag
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
.end_switch
	xor a
	ld [wSwitchItem], a
	scf
	ret

Pack_InitGFX:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	call DisableLCD
	ld hl, PackMenuGFX
	ld de, vTiles2
	lb bc, BANK(PackMenuGFX), 80
	call DecompressRequest2bpp
	ld de, PocketLabelsGFX
	ld hl, vTiles2 tile $60
	lb bc, BANK(PocketLabelsGFX), 25
	call Get2bpp
; Background (blue if male, pink if female)
	hlcoord 0, 1
	ld bc, 11 * SCREEN_WIDTH
	ld a, $24
	rst ByteFill
; This is where the items themselves will be listed.
	hlcoord 5, 1
	lb bc, 11, 15
	call ClearBox
	hlcoord 0, 0
	ld a, $28
	ld c, SCREEN_WIDTH
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	call DrawPocketName
	call DrawPocketGFX
	call PlacePackGFX
; Place the textbox for displaying the item description
	hlcoord 0, SCREEN_HEIGHT - 4 - 2
	lb bc, 4, SCREEN_WIDTH - 2
	call Textbox
	call EnableLCD
	jmp DrawPackGFX

PlacePackGFX:
	hlcoord 0, 5
	ld a, $50
	ld de, SCREEN_WIDTH - 5
	ld b, 3
.row
	ld c, 5
.column
	ld [hli], a
	inc a
	dec c
	jr nz, .column
	add hl, de
	dec b
	jr nz, .row
	ret

DrawPocketGFX:
; the pocket indicator: ◂, a slot per pocket (the current one shows its icon), ▸
	hlcoord 9, 0
	ld [hl], $2d ; ◂
	inc hl
	ld c, 0
.loop
	ld a, [wCurPocket]
	cp c
	ld a, $2c ; a dot
	jr nz, .got_tile
	ld a, c
	ld de, .Icons
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	ld a, [de]
.got_tile
	ld [hli], a
	inc c
	ld a, c
	cp NUM_POCKETS
	jr c, .loop
	ld [hl], $2e ; ▸
	ret

.Icons:
; entries correspond to *_POCKET constants
	table_width 1
	db $4c ; ITEM_POCKET
	db $4c ; MEDICINE_POCKET
	db $4d ; BALL_POCKET
	db $4c ; BERRY_POCKET
	db $4c ; HELD_POCKET
	db $4c ; TRAINING_POCKET
	db $4f ; TM_HM_POCKET
	db $4e ; KEY_ITEM_POCKET
	db $4c ; TREASURE_POCKET
	assert_table_length NUM_POCKETS
	assert 9 + 1 + NUM_POCKETS + 1 == SCREEN_WIDTH

DrawPocketName:
	ld a, [wCurPocket]
	; * 4
	push bc
	ld c, 4
	ld b, a
.multloop
	add b
	dec c
	jr nz, .multloop
	pop bc
; done
	ld d, 0
	ld e, a
	ld hl, .tilemap
	add hl, de
	ld d, h
	ld e, l
	hlcoord 0, 0
	ld b, 5
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .col
	ret

.tilemap
; entries correspond to *_POCKET constants (labels: 5 tiles each)
	table_width 5
	db $06, $07, $08, $09, $0a ; Items
	db $60, $61, $62, $63, $64 ; Medicine (PocketLabelsGFX)
	db $15, $16, $17, $18, $19 ; Balls
	db $65, $66, $67, $68, $69 ; Berries
	db $6a, $6b, $6c, $6d, $6e ; HeldItems
	db $6f, $70, $71, $72, $73 ; Training
	db $10, $11, $12, $13, $14 ; TM/HM
	db $0b, $0c, $0d, $0e, $0f ; Key Items
	db $74, $75, $76, $77, $78 ; Treasures
	assert_table_length NUM_POCKETS

Pack_GetItemName:
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	jmp CopyName1

ClearPocketList:
	hlcoord 5, 2
	lb bc, 10, SCREEN_WIDTH - 5
	jmp ClearBox

Pack_InitColors:
	call WaitBGMap
	ld b, SCGB_PACKPALS
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	jmp DelayFrame

KeyItemsPocketMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 1, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_ENABLE_SELECT | STATICMENU_ENABLE_LEFT_RIGHT | STATICMENU_ENABLE_START | STATICMENU_WRAP | STATICMENU_CURSOR ; flags
	db 5, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wNumKeyItems
	dba PlaceMenuKeyItemName
	dba PackKeyItemQuantity
	dba UpdateKeyItemDescription

PC_Mart_KeyItemsPocketMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 1, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_ENABLE_SELECT | STATICMENU_ENABLE_LEFT_RIGHT | STATICMENU_ENABLE_START | STATICMENU_WRAP ; flags
	db 5, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wNumKeyItems
	dba PlaceMenuKeyItemName
	dba PlaceMenuKeyItemQuantity
	dba UpdateKeyItemDescription

MACRO list_pocket_menu_header
; \1: the pocket's list; \2: TRUE for the Pack (a cursor, the registered marks)
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 1, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw @ + 3 ; the menu data
	db 1 ; default option
	if \2
		db STATICMENU_ENABLE_SELECT | STATICMENU_ENABLE_LEFT_RIGHT | STATICMENU_ENABLE_START | STATICMENU_WRAP | STATICMENU_CURSOR ; flags
	else
		db STATICMENU_ENABLE_SELECT | STATICMENU_ENABLE_LEFT_RIGHT | STATICMENU_ENABLE_START | STATICMENU_WRAP ; flags
	endc
	db 5, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_QUANTITY ; item format
	dbw 0, \1
	dba PlaceMenuItemBallName
	if \2
		dba PackBallQuantity
	else
		dba PlaceMenuItemBallQuantity
	endc
	dba UpdateItemBallDescription
ENDM

PackPocketMenuHeaders:
; entries correspond to *_POCKET constants
	table_width 2
	dw .Items
	dw .Medicine
	dw .Balls
	dw .Berries
	dw .HeldItems
	dw .Training
	dw 0 ; TM_HM_POCKET
	dw KeyItemsPocketMenuHeader
	dw .Treasures
	assert_table_length NUM_POCKETS
.Items:     list_pocket_menu_header wNumItems, TRUE
.Medicine:  list_pocket_menu_header wNumMedicine, TRUE
.Berries:   list_pocket_menu_header wNumBerries, TRUE
.HeldItems: list_pocket_menu_header wNumHeldItems, TRUE
.Training:  list_pocket_menu_header wNumTrainingItems, TRUE
.Treasures: list_pocket_menu_header wNumTreasures, TRUE
.Balls:     list_pocket_menu_header wNumBalls, TRUE

PC_MartPocketMenuHeaders:
; entries correspond to *_POCKET constants
	table_width 2
	dw .Items
	dw .Medicine
	dw .Balls
	dw .Berries
	dw .HeldItems
	dw .Training
	dw 0 ; TM_HM_POCKET
	dw PC_Mart_KeyItemsPocketMenuHeader
	dw .Treasures
	assert_table_length NUM_POCKETS
.Items:     list_pocket_menu_header wNumItems, FALSE
.Medicine:  list_pocket_menu_header wNumMedicine, FALSE
.Berries:   list_pocket_menu_header wNumBerries, FALSE
.HeldItems: list_pocket_menu_header wNumHeldItems, FALSE
.Training:  list_pocket_menu_header wNumTrainingItems, FALSE
.Treasures: list_pocket_menu_header wNumTreasures, FALSE
.Balls:     list_pocket_menu_header wNumBalls, FALSE

Pack_InitPocket:
; Draw the pocket in wCurPocket, then go to its menu.
	call ClearPocketList
	call DrawPocketName
	call DrawPocketGFX
	xor a
	ldh [hBGMapMode], a
	call WaitBGMap_DrawPackGFX
	jmp Pack_JumptableNext

Pack_ListPocketMenu:
; The scrolling menu of list pocket wCurPocket, with its header from table hl;
; keeps the pocket's cursor and scroll position.
	ld a, [wCurPocket]
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyMenuHeader
	call .PocketVars
	ld a, [hl]
	ld [wMenuCursorPosition], a
	ld a, [de]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	call .PocketVars
	ld a, [wMenuCursorY]
	ld [hl], a
	ld a, [wMenuScrollPosition]
	ld [de], a
	ret

.PocketVars:
; hl = the pocket's cursor, de = its scroll position
	ld a, [wCurPocket]
	ld e, a
	ld d, 0
	ld hl, wPocketScrollPositions
	add hl, de
	push hl
	ld hl, wPocketCursors
	add hl, de
	pop de
	ret

AskThrowAwayText:
	text_far _AskThrowAwayText
	text_end

AskQuantityThrowAwayText:
	text_far _AskQuantityThrowAwayText
	text_end

ThrewAwayText:
	text_far _ThrewAwayText
	text_end

OakThisIsntTheTimeText:
	text_far _OakThisIsntTheTimeText
	text_end

YouDontHaveAMonText:
	text_far _YouDontHaveAMonText
	text_end

RegisteredItemText:
	text_far _RegisteredItemText
	text_end

UnregisteredItemText:
	text_far _UnregisteredItemText
	text_end

CantRegisterText:
	text_far _CantRegisterText
	text_end

AskItemMoveText:
	text_far _AskItemMoveText
	text_end

PackEmptyText:
	text_far _PackEmptyText
	text_end

PackMenuGFX:
INCBIN "gfx/pack/pack_menu.2bpp.lz"
PocketLabelsGFX:
INCBIN "gfx/pack/pocket_labels.2bpp"
PackGFX:
INCBIN "gfx/pack/pack.2bpp.lz"
