; Player characters: the looks the player can pick when starting a new game.
;
; To add a character:
; - add a CHARACTER_* constant (constants/ram_constants.asm)
; - add its overworld and bike sprites (SPRITE_* constants,
;   data/sprites/sprites.asm, gfx/sprites.asm)
; - add its pics (front 56x56, back 48x48, trainer card 40x56, fishing 16x40;
;   see "Player Character Pics" below, and the Makefile's --columns rules)
; - add a row to every table in this file marked
;   "entries correspond to CHARACTER_* constants"; each is checked by an
;   assert, so a missing row won't build.
;
; wPlayerGender still decides the things that mean gender rather than looks
; (the -kun/-chan suffix, the OT gender of caught Pokemon, link, the bag,
; the name lists); it's set from PlayerCharacterGenders when picking.

PlayerCharacterNames:
; entries correspond to CHARACTER_* constants
	list_start
	li "Chris"
	li "Kris"
	li "Brendan"
	li "May"
	assert_list_length NUM_PLAYER_CHARACTERS

PlayerCharacterGenders:
; entries correspond to CHARACTER_* constants
	table_width 1
	db 0                            ; CHARACTER_CHRIS
	db 1 << PLAYERGENDER_FEMALE_F   ; CHARACTER_KRIS
	db 0                            ; CHARACTER_BRENDAN
	db 1 << PLAYERGENDER_FEMALE_F   ; CHARACTER_MAY
	assert_table_length NUM_PLAYER_CHARACTERS

GetPlayerCharacterForGFX:
; Like GetPlayerCharacter, but PLAYERSPRITESETUP_FEMALE_TO_MALE_F forces Chris.
	ld a, [wPlayerSpriteSetupFlags]
	bit PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	ld a, CHARACTER_CHRIS
	ret nz
	jmp GetPlayerCharacter

GetPlayerCharacterTableEntry:
; hl = table of 3-byte entries (dba), indexed by character
; returns b = bank, de = address, hl = the byte after the entry
	ld c, 3
	; fallthrough
GetPlayerCharacterTableEntryWidth:
; hl = table of c-byte entries starting with a dba, indexed by character
; returns b = bank, de = address, hl = the byte after the dba
	call GetPlayerCharacterForGFX
	ld b, 0
	and a
	jr z, .got_entry
.loop
	add hl, bc
	dec a
	jr nz, .loop
.got_entry
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ret

; Overworld sprite

_GetPlayerSprite:
; Get the player character's sprite for wPlayerState.
	call GetPlayerCharacterForGFX
	ld hl, PlayerStateSprites
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wPlayerState]
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr z, .good
	inc hl
	cp -1
	jr nz, .loop

; Any player state not in the array defaults to Chris's sprite.
	xor a ; ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	ld a, SPRITE_CHRIS
	jr .finish

.good
	ld a, [hl]

.finish
	ld [wUsedSprites + 0], a
	ld [wPlayerSprite], a
	ld [wPlayerObjectSprite], a
	ret

INCLUDE "data/sprites/player_sprites.asm"

; Name screen, Pokegear and magnet train icon

GetPlayerIcon:
; returns de = the player's overworld sprite gfx, b = its bank
	ld hl, PlayerIconGFX
	jr GetPlayerCharacterTableEntry

PlayerIconGFX:
; entries correspond to CHARACTER_* constants
	table_width 3
	dba ChrisSpriteGFX
	dba KrisSpriteGFX
	dba BrendanSpriteGFX
	dba MaySpriteGFX
	assert_table_length NUM_PLAYER_CHARACTERS

; Fishing

LoadFishingGFX:
; Replace the bottom halves of the player's standing frames with the fishing
; poses, and load the fishing line tiles.
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a

	ld hl, PlayerFishingGFX
	call GetPlayerCharacterTableEntry
	ld hl, .Destinations
	ld c, 4
.loop
	push bc
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, 2
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	pop hl
	inc hl
	inc hl
	pop bc
	dec c
	jr nz, .loop

	pop af
	ldh [rVBK], a
	ret

.Destinations:
	dw vTiles0 tile $02
	dw vTiles0 tile $06
	dw vTiles0 tile $0a
	dw vTiles0 tile $fc

PlayerFishingGFX:
; entries correspond to CHARACTER_* constants
	table_width 3
	dba FishingGFX
	dba KrisFishingGFX
	dba BrendanFishingGFX
	dba MayFishingGFX
	assert_table_length NUM_PLAYER_CHARACTERS

; Battle back pic

GetPlayerBackpic:
; Load the player's backpic into VRAM starting from vTiles2 tile $31.
	ld hl, PlayerBackpics
	ld c, 5 ; entry width
	call GetPlayerCharacterTableEntryWidth
	ld a, [hli] ; tile count
	ld c, a
	ld a, [hl] ; compressed?
	ld hl, vTiles2 tile $31
	and a
	jr z, .uncompressed
	ld h, d
	ld l, e
	ld de, vTiles2 tile $31
	predef_jump DecompressGet2bpp

.uncompressed
	jmp Get2bpp

PlayerBackpics:
; entries correspond to CHARACTER_* constants
	table_width 5
	; pic, tiles to load, compressed?
	dba ChrisBackpic
	db 7 * 7, TRUE
	dba KrisBackpic
	db 7 * 7, FALSE
	dba BrendanBackpic
	db 6 * 6, FALSE
	dba MayBackpic
	db 6 * 6, FALSE
	assert_table_length NUM_PLAYER_CHARACTERS

; Trainer card pic

GetCardPic:
	ld hl, PlayerCardPics
	call GetPlayerCharacterTableEntry
	ld h, d
	ld l, e
	ld a, b
	ld de, vTiles2 tile $00
	ld bc, $23 tiles
	call FarCopyBytes
	ld hl, TrainerCardGFX
	ld de, vTiles2 tile $23
	ld bc, 6 tiles
	ld a, BANK(TrainerCardGFX)
	jmp FarCopyBytes

PlayerCardPics:
; entries correspond to CHARACTER_* constants
	table_width 3
	dba ChrisCardPic
	dba KrisCardPic
	dba BrendanCardPic
	dba MayCardPic
	assert_table_length NUM_PLAYER_CHARACTERS

; Front pic

LoadPlayerFrontpic:
; Load the player's front pic (7x7) into VRAM at hl, and set wTrainerClass
; for its palette.
	push hl
	ld e, CHRIS
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_class
	ld e, KRIS
.got_class
	ld a, e
	ld [wTrainerClass], a
	ld hl, PlayerFrontpics
	call GetPlayerCharacterTableEntry
	pop hl
	ld c, 7 * 7
	jmp Get2bpp

PlayerFrontpics:
; entries correspond to CHARACTER_* constants
	table_width 3
	dba ChrisPic
	dba KrisPic
	dba BrendanPic
	dba MayPic
	assert_table_length NUM_PLAYER_CHARACTERS

HOF_LoadTrainerFrontpic:
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ld hl, vTiles2
	call LoadPlayerFrontpic
	call WaitBGMap
	ld a, $1
	ldh [hBGMapMode], a
	ret

DrawIntroPlayerPic:
; Draw the player pic at (6,4).
	ld hl, vTiles2
	call LoadPlayerFrontpic
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef_jump PlaceGraphic

; New game character menu

ChoosePlayerCharacter:
; The characters are listed on the left; the highlighted one's pic is shown
; on the right. Sets wPlayerCharacter and wPlayerGender.
.menu
	xor a
	ld [wItemFlags], a ; make sure the list is read as plain bytes
	ld [wMenuScrollPosition], a
	call LoadStandardMenuHeader ; back up the whole screen
	ld hl, .MenuHeader
	call CopyMenuHeader
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	call CloseWindow
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .menu ; B or "Cancel" doesn't skip the question; just ask again
	ld a, [wMenuSelection]
	cp -1
	jr z, .menu

	ld c, a
	inc a ; wPlayerCharacter holds CHARACTER_* + 1
	ld [wPlayerCharacter], a
	ld b, 0
	ld hl, PlayerCharacterGenders
	add hl, bc
	ld a, [hl]
	ld [wPlayerGender], a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	; Scrolling menus draw their border one tile outside these coords,
	; so this box covers (0,0)-(11,10). 4 visible rows: bottom = top + 2 * rows.
	menu_coords 1, 1, 10, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3 ; flags
	db 4, 0 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dba .List
	dba .PlaceName
	dba NULL
	dba .Preview ; Function 3: runs whenever the cursor moves

.List:
	db NUM_PLAYER_CHARACTERS
	for n, NUM_PLAYER_CHARACTERS
		db n
	endr
	db -1

.PlaceName:
; de = where to print; [wMenuSelection] = CHARACTER_*
	push de
	ld a, [wMenuSelection]
	ld hl, PlayerCharacterNames
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	jmp PlaceString

.Preview:
; Show the highlighted character's pic at (12,2), in the player's color.
; [wMenuSelection] = CHARACTER_*, or -1 on "Cancel" (keep the last pic)
	ld a, [wMenuSelection]
	cp -1
	ret z
	inc a
	ld [wPlayerCharacter], a
	ld c, a
	dec c
	ld b, 0
	ld hl, PlayerCharacterGenders
	add hl, bc
	ld a, [hl]
	ld [wPlayerGender], a

	xor a
	ldh [hBGMapMode], a
	; Tile $00 is the screen's light blue, so the pic starts at tile $01.
	ld hl, vTiles2 tile $01
	call LoadPlayerFrontpic
	ld a, $01
	ldh [hGraphicStartTile], a
	hlcoord 12, 2
	lb bc, 7, 7
	predef PlaceGraphic
	; the pic uses BG palette 1
	hlcoord 12, 2, wAttrmap
	ld b, 7
.row
	push hl
	ld c, 7
	ld a, 1
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .row
	ld de, wBGPals1 palette 1
	farcall PreviewPlayerColorAt
	jmp WaitBGMap2


SECTION "Player Character Pics", ROMX

BrendanPic:     INCBIN "gfx/player/brendan.2bpp"
MayPic:         INCBIN "gfx/player/may.2bpp"
BrendanBackpic: INCBIN "gfx/player/brendan_back.2bpp"
MayBackpic:     INCBIN "gfx/player/may_back.2bpp"
BrendanCardPic: INCBIN "gfx/trainer_card/brendan_card.2bpp"
MayCardPic:     INCBIN "gfx/trainer_card/may_card.2bpp"
BrendanFishingGFX: INCBIN "gfx/overworld/brendan_fish.2bpp"
MayFishingGFX:     INCBIN "gfx/overworld/may_fish.2bpp"
