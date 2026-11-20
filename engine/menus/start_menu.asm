; More entries than fit scroll the menu: wMenuItemsList holds only the visible
; entries; these two bytes past them hold the scroll state while it's open.
DEF wStartMenuEntries EQUS "(wMenuItemsList + 14)" ; entries in total
DEF wStartMenuScroll  EQUS "(wMenuItemsList + 15)" ; entries hidden above
DEF START_MENU_ROWS         EQU 8
DEF START_MENU_CONTEST_ROWS EQU 7 ; the contest box starts lower

; StartMenu.Items indexes
	const_def
	const STARTMENUITEM_POKEDEX  ; 0
	const STARTMENUITEM_POKEMON  ; 1
	const STARTMENUITEM_PACK     ; 2
	const STARTMENUITEM_STATUS   ; 3
	const STARTMENUITEM_SAVE     ; 4
	const STARTMENUITEM_OPTION   ; 5
	const STARTMENUITEM_EXIT     ; 6
	const STARTMENUITEM_POKEGEAR ; 7
	const STARTMENUITEM_QUIT     ; 8
	const STARTMENUITEM_PASSPORT ; 9
	const STARTMENUITEM_JOURNAL  ; 10

StartMenu::
	farcall ClearWeatherSprites ; don't draw frozen particles over the menu
	call ClearWindowData

	ld de, SFX_MENU
	call PlaySFX

	farcall ReanchorBGMap_NoOAMUpdate

	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	ld hl, .MenuHeader
	jr z, .GotMenuData
	ld hl, .ContestMenuHeader

.GotMenuData:
	call LoadMenuHeader
	call .SetUpMenuItemsAtCursor
	call .DrawMenuAccount
	call DrawVariableLengthMenuBox
	call .DrawBugContestStatusBox
	call SafeUpdateSprites
	call HDMATransferTilemapAndAttrmap_Menu
	farcall LoadFonts_NoOAMUpdate
	call .DrawBugContestStatus
	call UpdateTimePals
	jr .Select

.Reopen:
	call UpdateSprites
	call UpdateTimePals
	call .SetUpMenuItemsAtCursor

.Select:
	call .GetInput
	jr c, .Exit
	call .DrawMenuAccount
	ld a, [wStartMenuScroll]
	ld b, a
	ld a, [wMenuCursorPosition]
	add b
	ld [wBattleMenuCursorPosition], a
	call PlayClickSFX
	call PlaceHollowCursor
	call .OpenMenu

; Menu items have different return functions.
; For example, saving exits the menu.
	ld hl, .MenuReturns
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.MenuReturns:
	dw .Reopen
	dw .Exit
	dw .ExitMenuCallFuncCloseText
	dw .ExitMenuRunScriptCloseText
	dw .ExitMenuRunScript
	dw .ReturnEnd
	dw .ReturnRedraw

.Exit:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call LoadFontsExtra
	pop af
	ldh [hOAMUpdate], a
.ReturnEnd:
	call ExitMenu
.ReturnEnd2:
	call CloseText
	jmp UpdateTimePals

.GetInput:
; Return carry on exit, and no-carry on selection.
	xor a
	ldh [hBGMapMode], a
	call .DrawMenuAccount
	call SetUpMenu
	call .SetUpScrolling
	ld a, $ff
	ld [wMenuSelection], a
.loop
	call .PrintMenuAccount
	call GetScrollingMenuJoypad
	ld hl, w2DMenuFlags2
	bit _2DMENU_EXITING_F, [hl]
	jr nz, .scroll
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b
	cp A_BUTTON
	jr nz, .loop
; fallthrough
.a
	call PlayClickSFX
	and a
	ret
.b
	scf
	ret

.scroll
; the cursor left the top or the bottom of a menu with more entries than fit
	res _2DMENU_EXITING_F, [hl]
	call .GetMaxRows
	ld c, a
	ld a, [wStartMenuEntries]
	sub c
	ld b, a ; the largest scroll
	ld hl, wStartMenuScroll
	ldh a, [hJoyLast]
	bit D_UP_F, a
	jr nz, .scroll_up
	bit D_DOWN_F, a
	jr z, .loop
	ld a, [hl]
	cp b
	jr nc, .wrap_to_top
	inc [hl]
	ld a, c ; stay on the bottom row
	jr .scrolled

.wrap_to_top
	ld [hl], 0
	ld a, 1
	jr .scrolled

.scroll_up
	ld a, [hl]
	and a
	jr z, .wrap_to_bottom
	dec [hl]
	ld a, 1 ; stay on the top row
	jr .scrolled

.wrap_to_bottom
	ld [hl], b
	ld a, c
.scrolled
	ld [wMenuCursorPosition], a
	call .SetUpMenuItems
	jr .GetInput

.SetUpScrolling:
; with more entries than fit: exit at the top and bottom instead of wrapping,
; and show arrows on the box border where entries are hidden
	call .GetMaxRows
	ld c, a
	ld a, [wStartMenuEntries]
	cp c
	ret c
	ret z
	ld hl, w2DMenuFlags1
	res _2DMENU_WRAP_UP_DOWN_F, [hl]
	set _2DMENU_EXIT_UP_F, [hl]
	set _2DMENU_EXIT_DOWN_F, [hl]
	ld a, [wStartMenuScroll]
	and a
	jr z, .no_up_arrow
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld c, SCREEN_WIDTH - 2
	call .GetTilemapCoord
	ld [hl], "▲"
.no_up_arrow
	call .GetMaxRows
	ld c, a
	ld a, [wStartMenuScroll]
	add c
	ld c, a
	ld a, [wStartMenuEntries]
	cp c
	jr z, .no_down_arrow
	ld a, [wMenuBorderBottomCoord]
	ld b, a
	ld c, SCREEN_WIDTH - 2
	call .GetTilemapCoord
	ld [hl], "▼"
.no_down_arrow
	jmp ApplyTilemap

.GetTilemapCoord:
; hl = wTilemap + b * SCREEN_WIDTH + c
	ld hl, wTilemap
	ld a, b
	and a
	jr z, .got_row
	ld de, SCREEN_WIDTH
.row
	add hl, de
	dec b
	jr nz, .row
.got_row
	ld b, 0
	add hl, bc
	ret

.GetMaxRows:
	ld a, [wStatusFlags2]
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, a
	ld a, START_MENU_ROWS
	ret z
	ld a, START_MENU_CONTEST_ROWS
	ret

.ExitMenuRunScript:
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.ExitMenuRunScriptCloseText:
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	jmp .ReturnEnd2

.ExitMenuCallFuncCloseText:
	call ExitMenu
	ld hl, wQueuedScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wQueuedScriptBank]
	call FarCall_hl
	jmp .ReturnEnd2

.ReturnRedraw:
	farcall ClearSavedObjPals
	farcall DisableDynPalUpdates
	call ClearBGPalettes
	call ExitMenu
	call ReloadTilesetAndPalettes
	call .DrawMenuAccount
	call DrawVariableLengthMenuBox
	call .DrawBugContestStatus
	call UpdateSprites
	call FinishExitMenu
	jmp .Reopen

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default selection

.ContestMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 2, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default selection

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_ENABLE_START ; flags
	dn 0, 0 ; rows, columns
	dw wMenuItemsList
	dw .MenuString
	dw .Items

.Items:
; entries correspond to STARTMENUITEM_* constants
	dw StartMenu_Pokedex,  .PokedexString,  .PokedexDesc
	dw StartMenu_Pokemon,  .PartyString,    .PartyDesc
	dw StartMenu_Pack,     .PackString,     .PackDesc
	dw StartMenu_Status,   .StatusString,   .StatusDesc
	dw StartMenu_Save,     .SaveString,     .SaveDesc
	dw StartMenu_Option,   .OptionString,   .OptionDesc
	dw StartMenu_Exit,     .ExitString,     .ExitDesc
	dw StartMenu_Pokegear, .PokegearString, .PokegearDesc
	dw StartMenu_Quit,     .QuitString,     .QuitDesc
	dw StartMenu_Passport, .PassportString, .PassportDesc
	dw StartMenu_Journal,  .JournalString,  .JournalDesc

.PokedexString:  db "#dex@"
.PartyString:    db "#mon@"
.PackString:     db "Pack@"
.StatusString:   db "<PLAYER>@"
.SaveString:     db "Save@"
.OptionString:   db "Option@"
.ExitString:     db "Exit@"
.PokegearString: db "<POKE>gear@"
.QuitString:     db "Quit@"
.PassportString: db "Passport@"
.JournalString:  db "Journal@"

.PokedexDesc:
	db   "#mon"
	next "database@"

.PartyDesc:
	db   "Party <PKMN>"
	next "status@"

.PackDesc:
	db   "Contains"
	next "items@"

.PokegearDesc:
	db   "Trainer's"
	next "device@"

.StatusDesc:
	db   "Your own"
	next "status@"

.SaveDesc:
	db   "Save your"
	next "progress@"

.OptionDesc:
	db   "Change"
	next "settings@"

.ExitDesc:
	db   "Close this"
	next "menu@"

.QuitDesc:
	db   "Quit and"
	next "be judged@"

.JournalDesc:
	db   "Missions"
	next "and goals@"

.PassportDesc:
	db   "Leagues &"
	next "records@"

.OpenMenu:
	ld a, [wMenuSelection]
	call .GetMenuAccountTextPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.MenuString:
	push de
	ld a, [wMenuSelection]
	call .GetMenuAccountTextPointer
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	jmp PlaceString

.MenuDesc:
	push de
	ld a, [wMenuSelection]
	cp $ff
	jr z, .none
	call .GetMenuAccountTextPointer
rept 4
	inc hl
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	jmp PlaceString
.none
	pop de
	ret

.GetMenuAccountTextPointer:
	ld e, a
	ld d, 0
	ld hl, wMenuDataPointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 6
	add hl, de
endr
	ret

.SetUpMenuItemsAtCursor:
; wBattleMenuCursorPosition is the entry's position in the whole list: scroll
; just enough to show it, on the bottom row if it's below the first page
	xor a
	ld [wStartMenuScroll], a
	call .SetUpMenuItems
	call .GetMaxRows
	ld c, a
	ld a, [wBattleMenuCursorPosition]
	ld b, a
	ld a, [wStartMenuEntries]
	cp b
	jr nc, .position_ok
	ld b, a ; fewer entries than before: the last one
.position_ok
	ld a, b
	sub c
	jr c, .first_page
	jr z, .first_page
	ld [wStartMenuScroll], a
	ld a, c
	ld [wMenuCursorPosition], a
	jr .SetUpMenuItems

.first_page
	ld a, b
	ld [wMenuCursorPosition], a
	ret

.SetUpMenuItems:
	xor a
	ld [wWhichIndexSet], a
	ld [wStartMenuEntries], a
	call .FillMenuList

	ld hl, wStatusFlags
	bit STATUSFLAGS_POKEDEX_F, [hl]
	jr z, .no_pokedex
	ld a, STARTMENUITEM_POKEDEX
	call .AppendMenuList
.no_pokedex

	ld a, [wPartyCount]
	and a
	jr z, .no_pokemon
	ld a, STARTMENUITEM_POKEMON
	call .AppendMenuList
.no_pokemon

	ld a, [wLinkMode]
	and a
	jr nz, .no_pack
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	jr nz, .no_pack
	ld a, STARTMENUITEM_PACK
	call .AppendMenuList
.no_pack

	ld hl, wPokegearFlags
	bit POKEGEAR_OBTAINED_F, [hl]
	jr z, .no_pokegear
	ld a, STARTMENUITEM_POKEGEAR
	call .AppendMenuList
.no_pokegear

	ld a, STARTMENUITEM_STATUS
	call .AppendMenuList

	push de
	push bc
	farcall CheckPassportUnlocked
	pop bc
	pop de
	jr z, .no_passport
	ld a, STARTMENUITEM_PASSPORT
	call .AppendMenuList
.no_passport

	push de
	push bc
	farcall Journal_AnyStarted
	pop bc
	pop de
	jr z, .no_journal
	ld a, STARTMENUITEM_JOURNAL
	call .AppendMenuList
.no_journal

	ld a, [wLinkMode]
	and a
	jr nz, .no_save
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	ld a, STARTMENUITEM_QUIT
	jr nz, .write
	ld a, STARTMENUITEM_SAVE
.write
	call .AppendMenuList
.no_save

	ld a, STARTMENUITEM_OPTION
	call .AppendMenuList
	ld a, c
	ld [wMenuItemsList], a
	ret

.FillMenuList:
	xor a
	ld hl, wMenuItemsList
	ld [hli], a
	ld a, -1
	ld bc, wStartMenuEntries - (wMenuItemsList + 1)
	rst ByteFill
	ld de, wMenuItemsList + 1
	ld c, 0
	ret

.AppendMenuList:
; add entry a to the visible list if it falls within the scrolled window
	push hl
	ld b, a
	ld hl, wStartMenuEntries
	ld a, [hl]
	inc [hl]
	ld hl, wStartMenuScroll
	sub [hl]
	jr c, .hidden
	push bc
	ld b, a
	call .GetMaxRows
	cp b
	ld a, b
	pop bc
	jr c, .hidden
	jr z, .hidden
	ld a, b
	ld [de], a
	inc de
	inc c
.hidden
	pop hl
	ret

.PrintMenuAccount:
	call .IsMenuAccountOn
	ret z
	call .DrawMenuAccount
	decoord 0, 14
	jmp .MenuDesc

.DrawMenuAccount:
	call .IsMenuAccountOn
	ret z
	hlcoord 0, 13
	lb bc, 5, 9
	call ClearBox
	hlcoord 0, 13
	lb bc, 3, 8
	jmp TextboxPalette

.IsMenuAccountOn:
	ld a, [wOptions2]
	and 1 << MENU_ACCOUNT
	ret

.DrawBugContestStatusBox:
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	ret z
	farjp StartMenu_DrawBugContestStatusBox

.DrawBugContestStatus:
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	ret z
	farjp StartMenu_PrintBugContestStatus

StartMenu_Exit:
; Exit the menu.

	ld a, 1
	ret

StartMenu_Quit:
; Retire from the bug catching contest.

	ld hl, .StartMenuContestEndText
	call StartMenuYesNo
	jr c, .DontEndContest
	ld a, BANK(BugCatchingContestReturnToGateScript)
	ld hl, BugCatchingContestReturnToGateScript
	call FarQueueScript
	ld a, 4
	ret

.DontEndContest:
	xor a
	ret

.StartMenuContestEndText:
	text_far _StartMenuContestEndText
	text_end

StartMenu_Save:
; Save the game.

	call BufferScreen
	farcall SaveMenu
	jr nc, .saved
	xor a
	ret

.saved
	ld a, 1
	ret

StartMenu_Option:
; Game options.

	call FadeToMenu
	farcall Option
	ld a, 6
	ret

StartMenu_Status:
; Player status.

	call FadeToMenu
	farcall TrainerCard
	call CloseSubmenu
	xor a
	ret

StartMenu_Passport:
	call FadeToMenu
	farcall Passport
	call CloseSubmenu
	xor a
	ret

StartMenu_Journal:
	call FadeToMenu
	farcall Journal
	call CloseSubmenu
	xor a
	ret

StartMenu_Pokedex:
	ld a, [wPartyCount]
	and a
	jr z, .empty

	call FadeToMenu
	farcall Pokedex
	call CloseSubmenu

.empty
	xor a
	ret

StartMenu_Pokegear:
	call FadeToMenu
	farcall PokeGear
	call CloseSubmenu
	xor a
	ret

StartMenu_Pack:
	call FadeToMenu
	call Pack
	ld a, [wPackUsedItem]
	and a
	jr nz, .used_item
	call CloseSubmenu
	xor a
	ret

.used_item
	call ExitAllMenus
	ld a, 4
	ret

StartMenu_Pokemon:
	ld a, [wPartyCount]
	and a
	jr z, .return

	call FadeToMenu

.choosemenu
	; "Choose a Pokémon", and Select picks a Pokémon up to move it
	ld a, 1 << PARTYMENU_REORDER_F
	ld [wPartyMenuActionText], a
	call ClearBGPalettes

.menu
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX

.menunoreload
	farcall WritePartyMenuTilemap
	farcall PlacePartyMenuText
	call WaitBGMap
	call SetDefaultBGPAndOBP
	call DelayFrame
.select
	farcall PartyMenuSelect
	jr c, .return ; if cancelled or pressed B

	call PokemonActionSubmenu
	cp 3
	jr z, .refresh
	and a
	jr z, .choosemenu
	cp 1
	jr z, .menunoreload
	cp 2
	jr z, .quit
	cp 4
	jr z, .select

.return
	call CloseSubmenu
	xor a
	ret

.refresh
	farcall PartyCardsRefresh
	jr .select

.quit
	ld a, b
	push af
	call ExitAllMenus
	pop af
	ret
