INCLUDE "data/mon_menu.asm"

MonFieldSubmenu:
; The field moves and Cancel, for the Field entry.
	xor a
	ldh [hBGMapMode], a
	call ResetMonSubmenu
	call AddFieldMoves
	ld a, MONMENUITEM_CANCEL
	call AddMonMenuItem
	call TerminateMonSubmenu
	jr _MonSubmenu

MonSubmenu:
	xor a
	ldh [hBGMapMode], a
	call GetMonSubmenuItems
_MonSubmenu:
	farcall FreezeMonIcons
	ld hl, .MenuHeader
	call LoadMenuHeader
	call .GetTopCoord
	call PopulateMonMenu

	ld a, 1
	ldh [hBGMapMode], a
	call MonMenuLoop
	ld [wMenuSelection], a

	jmp ExitMenu

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw 0
	db 1 ; default option

.GetTopCoord:
; [wMenuBorderTopCoord] = 1 + [wMenuBorderBottomCoord] - 2 * ([wMonSubmenuCount] + 1)
	ld a, [wMonSubmenuCount]
	inc a
	add a
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	sub b
	inc a
	ld [wMenuBorderTopCoord], a
	jmp MenuBox

MonMenuLoop:
.loop
	ld a, MENU_UNUSED | MENU_BACKUP_TILES_2 ; flags
	ld [wMenuDataFlags], a
	ld a, [wMonSubmenuCount]
	ld [wMenuDataItems], a
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set _2DMENU_ENABLE_SPRITE_ANIMS_F, [hl]
	call StaticMenuJoypad
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ldh a, [hJoyPressed]
	bit A_BUTTON_F, a
	jr nz, .select
	bit B_BUTTON_F, a
	jr z, .loop
	ld a, MONMENUITEM_CANCEL
	ret

.select
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	ld hl, wMonSubmenuItems
	add hl, bc
	ld a, [hl]
	ret

PopulateMonMenu:
	call MenuBoxCoord2Tile
	ld bc, 2 * SCREEN_WIDTH + 2
	add hl, bc
	ld de, wMonSubmenuItems
.loop
	ld a, [de]
	inc de
	cp -1
	ret z
	push de
	push hl
	call GetMonMenuString
	pop hl
	rst PlaceString
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop de
	jr .loop

GetMonMenuString:
	ld hl, MonMenuOptions + 1
	ld de, 4
	call IsInArray
	dec hl
	ld a, [hli]
	inc hl
	cp MONMENU_MENUOPTION
	jr z, .NotMove
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMoveIDFromIndex
	ld [wNamedObjectIndex], a
	jmp GetMoveName

.NotMove:
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

GetMonSubmenuItems:
	call ResetMonSubmenu
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	ld a, [wLinkMode]
	and a
	jr nz, .skip_moves
	; the field moves, or one Field entry when the menu can't hold them all
	call AddFieldMoves
	ld a, [wMonSubmenuCount]
	cp NUM_MONMENU_ITEMS - NUM_FIXED_MONMENU_ITEMS + 1
	jr c, .skip_moves
	call ResetMonSubmenu
	ld a, MONMENUITEM_FIELD
	call AddMonMenuItem

.skip_moves
	ld a, MONMENUITEM_STATS
	call AddMonMenuItem
	ld a, [wLinkMode]
	and a
	jr nz, .skip2
	push hl
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld d, [hl]
	farcall ItemIsMail
	pop hl
	; a = carry ? MONMENUITEM_MAIL : MONMENUITEM_ITEM
	sbc a
	and MONMENUITEM_MAIL - MONMENUITEM_ITEM
	add MONMENUITEM_ITEM
	call AddMonMenuItem
	ld a, MONMENUITEM_NICKNAME
	call AddMonMenuItem

.skip2
	ld a, MONMENUITEM_SWITCH ; "Move"
	call AddMonMenuItem
	ld a, [wLinkMode]
	and a
	jr nz, .no_follow
	farcall PartyCardsFollowItem ; Follow, Unfollow, or 0 with followers off
	and a
	call nz, AddMonMenuItem
.no_follow
	ld a, [wMonSubmenuCount]
	cp NUM_MONMENU_ITEMS
	jr z, TerminateMonSubmenu
	ld a, MONMENUITEM_CANCEL
	call AddMonMenuItem
	jr TerminateMonSubmenu

.egg
	ld a, MONMENUITEM_STATS
	call AddMonMenuItem
	ld a, MONMENUITEM_SWITCH
	call AddMonMenuItem
	ld a, MONMENUITEM_CANCEL
	call AddMonMenuItem
	jr TerminateMonSubmenu

DEF NUM_FIXED_MONMENU_ITEMS EQU 6 ; Stats, Item, Nickname, Move, Follow, Cancel

AddFieldMoves:
; Add wCurPartyMon's field moves to the submenu.
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld c, NUM_MOVES
.loop
	push bc
	push de
	ld a, [de]
	and a
	jr z, .next
	push hl
	call IsFieldMove
	pop hl
	call c, AddMonMenuItem
.next
	pop de
	inc de
	pop bc
	dec c
	jr nz, .loop
	ret

IsFieldMove:
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, MonMenuOptions
.next
	ld a, [hli]
	cp -1
	ret z
	cp MONMENU_MENUOPTION
	ret z
	ld a, [hli]
	ld d, a
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .next
	cp b
	jr nz, .next
	ld a, d
	scf
	ret

ResetMonSubmenu:
	xor a
	ld [wMonSubmenuCount], a
	ld hl, wMonSubmenuItems
	ld bc, NUM_MONMENU_ITEMS + 1
	jmp ByteFill

TerminateMonSubmenu:
	ld a, [wMonSubmenuCount]
	ld e, a
	ld d, 0
	ld hl, wMonSubmenuItems
	add hl, de
	ld [hl], -1
	ret

AddMonMenuItem:
	push hl
	push de
	push af
	ld a, [wMonSubmenuCount]
	ld e, a
	inc a
	ld [wMonSubmenuCount], a
	ld d, 0
	ld hl, wMonSubmenuItems
	add hl, de
	pop af
	ld [hl], a
	pop de
	pop hl
	ret

BattleMonMenu:
	ld hl, .MenuHeader
	call CopyMenuHeader
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call PlaceVerticalMenuItems
	call WaitBGMap
	call CopyMenuData
	ld a, [wMenuDataFlags]
	bit STATICMENU_CURSOR_F, a
	jr z, .set_carry
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set _2DMENU_ENABLE_SPRITE_ANIMS_F, [hl]
	call StaticMenuJoypad
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ldh a, [hJoyPressed]
	bit B_BUTTON_F, a
	jr z, .clear_carry
	ret z

.set_carry
	scf
	ret

.clear_carry
	and a
	ret

.MenuHeader:
	db 0 ; flags
	menu_coords 11, 11, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 3 ; items
	db "Switch@"
	db "Stats@"
	db "Cancel@"
