; Shared menu for the NPCs and shrines that change a Pokémon's colors
; (and Hidden Power type) through its DVs.
;
; Usage, after opentext:
;	monpaletteservice .Options ; wScriptVar = MONPALSERVICE_* result
;	...
; .Options:
;	monpal_item SILVER_LEAF, HP_MAX_GHOST, MONPAL_ALIGN, AlignedText
;	monpal_money 10000, HP_MAX_DARK, MONPAL_TYPE_COLORS, DoneText
;	monpal_end
;
; The options and their texts must be in the same bank as the script.
; With more than one option, the player picks one from a menu (item names,
; or "Money"). Then the player picks a party Pokémon and confirms; the cost
; is paid, the DVs are set, the stats are recalculated, and the option's text
; is printed (wStringBuffer1 holds the Pokémon's nickname).

; scratch (wStringBuffer2): the options table, then the chosen option
DEF wMonPalOptions EQUS "wStringBuffer2"
DEF wMonPalOption EQUS "(wStringBuffer2 + 2)"
; the menu is built in wStringBuffer3-5
DEF wMonPalMenuData EQUS "wStringBuffer3"

MonPaletteService:
; the options pointer follows the special command in the script
	rst GetScriptByte
	ld [wMonPalOptions], a
	rst GetScriptByte
	ld [wMonPalOptions + 1], a

	call .CountOptions
	ld a, c
	cp MAX_MONPAL_OPTIONS + 1
	jr c, .count_ok
	ld c, MAX_MONPAL_OPTIONS ; the menu only has room for this many
.count_ok
	ld a, c
	dec a
	jr z, .got_option ; a = 0: the only option
	call .ChooseOption
	jr c, .cancelled
.got_option
; copy the chosen option (a) to wMonPalOption
	ld hl, wMonPalOptions
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
	ld bc, MONPAL_OPTION_LENGTH
	rst AddNTimes
	add hl, de
	ld de, wMonPalOption
	ld bc, MONPAL_OPTION_LENGTH
	ld a, [wScriptBank]
	call FarCopyBytes

	call .CheckCost
	jr c, .cant_pay

	ld hl, .WhichMonText
	call PrintText
	farcall SelectMonFromParty
	jr c, .cancelled
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNickname
	ld hl, .ConfirmText
	call PrintText
	call YesNoBox
	jr c, .cancelled

	call .Pay
	call .ApplyDVs
	call .PlaySound
	farcall RefreshFollower ; the lead may look different now

	ld a, [wMonPalOption + MONPAL_OPTION_TEXT]
	ld l, a
	ld a, [wMonPalOption + MONPAL_OPTION_TEXT + 1]
	ld h, a
	ld a, [wScriptBank]
	call FarPrintText
	ld a, MONPALSERVICE_DONE
	jr .done

.egg
	ld hl, .EggText
	call PrintText
.cancelled
	xor a ; MONPALSERVICE_CANCELLED
	jr .done

.cant_pay
	ld a, MONPALSERVICE_CANT_PAY
.done
	ld [wScriptVar], a
	ret

.CountOptions:
; c = number of options
	ld hl, wMonPalOptions
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, 0
.count_loop
	push hl
	ld a, [wScriptBank]
	call GetFarWord
	ld a, h
	and l
	inc a
	pop hl
	ret z ; monpal_end
	inc c
	ld de, MONPAL_OPTION_LENGTH
	add hl, de
	jr .count_loop

.ChooseOption:
; Build a menu with c options; return a = the chosen option (from 0),
; or carry if cancelled.
	ld de, wMonPalMenuData
	ld a, STATICMENU_CURSOR
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld hl, wMonPalOptions
	ld a, [hli]
	ld h, [hl]
	ld l, a
.menu_loop
	push bc
	push hl
	push de
	ld a, [wScriptBank]
	call GetFarWord
	ld a, h
	or l
	jr z, .money
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	call GetItemName ; de = name
	jr .got_name
.money
	ld de, .MoneyString
.got_name
	pop hl ; menu data
.copy_name
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .copy_name
	ld d, h
	ld e, l
	pop hl
	ld bc, MONPAL_OPTION_LENGTH
	add hl, bc
	pop bc
	dec c
	jr nz, .menu_loop

	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	push af
	call CloseWindow
	pop af
	ret c
	ld a, [wMenuCursorY]
	dec a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw wMonPalMenuData
	db 1 ; default option

.MoneyString:
	db "Money@"

.CheckCost:
; carry if the player doesn't have the item or the money
	call .GetItem
	jr z, .check_money
	ld hl, wNumItems
	call CheckItem
	ccf
	ret

.check_money
	call .LoadMoney
	ld bc, hMoneyTemp
	ld de, wMoney
	farjp CompareMoney ; carry if less

.Pay:
	call .GetItem
	jr z, .pay_money
	ld a, 1
	ld [wItemQuantityChange], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	jmp TossItem

.pay_money
	call .LoadMoney
	ld bc, hMoneyTemp
	ld de, wMoney
	farjp TakeMoney

.GetItem:
; wCurItem = the option's item; z if it costs money instead
	ld hl, wMonPalOption + MONPAL_OPTION_ITEM
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	call GetItemIDFromIndex
	ld [wCurItem], a
	or 1 ; nz
	ret

.LoadMoney:
	ld hl, wMonPalOption + MONPAL_OPTION_MONEY
	ld de, hMoneyTemp
	ld bc, 3
	rst CopyBytes
	ret

.PlaySound:
	call .GetItem
	ld de, SFX_CAUGHT_MON
	jr nz, .play
	farcall PlaceMoneyTopRight
	ld de, SFX_TRANSACTION
.play
	call PlaySFX
	jmp WaitSFX

.ApplyDVs:
	ld a, MON_DVS
	call GetPartyParamLocation
	ld a, [wMonPalOption + MONPAL_OPTION_ATKDEF_DV]
	ld [hli], a
	ld a, [wMonPalOption + MONPAL_OPTION_SPDSPC_DV]
	ld [hl], a
; the DVs changed, so recalculate the stats
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ld b, a
	ld c, [hl]
	push bc ; old max HP
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, MON_EVS - 1
	call GetPartyParamLocation
	ld b, TRUE
	predef CalcMonStats
; HP += new max HP - old max HP (fainted Pokémon stay fainted, others keep
; at least 1 HP)
	ld a, MON_HP
	call GetPartyParamLocation
	pop bc
	ld a, [hli]
	ld d, a
	ld e, [hl] ; de = HP
	or e
	ret z
	push hl
	ld a, MON_MAXHP + 1
	call GetPartyParamLocation
	ld a, e
	add [hl]
	ld e, a
	dec hl
	ld a, d
	adc [hl]
	ld d, a ; de = HP + new max HP
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a ; de = HP + new max HP - old max HP
	pop hl
	jr c, .one_hp
	or e
	jr nz, .set_hp
.one_hp
	ld de, 1
.set_hp
	ld [hl], e
	dec hl
	ld [hl], d
	ret

.WhichMonText:
	text "Which #mon"
	line "should it be?"
	done

.ConfirmText:
	text_ram wStringBuffer1
	text ","
	line "is that right?"
	done

.EggText:
	text "That Egg hasn't"
	line "hatched yet…"
	prompt
