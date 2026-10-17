; The Pokémon that follows the player (see following-pokemon-plan.md in the
; project docs).
; Prototype: the follower is a map object in the last slot (FOLLOWER_OBJECT),
; added to every map by LoadMapObjects, and moved by the follow system
; (StartFollow) with the player as the leader.

SECTION "Pokemon Follower", ROMX

GetFollowerPartyMon::
; Find the first party Pokémon that isn't an egg and isn't fainted.
; Output: a = species, hl = its party struct; carry if there's none.
	ld hl, wPartyMon1
	ld de, wPartySpecies
.loop
	ld a, [de]
	cp -1
	jr z, .none
	cp EGG
	jr z, .next
	push hl
	ld bc, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	pop hl
	jr z, .next
	ld a, [de]
	and a
	ret

.next
	inc de
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	jr .loop

.none
	scf
	ret

LoadMapObjects_Follower::
; The end of LoadMapObjects: add the follower, spawn the visible objects,
; then make the follower follow the player.
	ld hl, wFollowerFlags
	res FOLLOWER_HIDDEN_BY_SCRIPT_F, [hl]
	call PlaceFollowerObject
	farcall InitializeVisibleSprites
	; fallthrough

StartPokemonFollower:
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_SPRITE]
	cp SPRITE_FOLLOWER
	ret nz
	lb bc, PLAYER_OBJECT, FOLLOWER_OBJECT
	farcall StartFollow
	jmp UpdateFollowerVisibility

PlaceFollowerObject:
; Put the follower in the last map object slot.
; The slot's NPC (on maps with 15 object_events) is replaced.
	call CheckFollowerAllowed
	ret c
	call GetFollowerPalette
	ret c
	ld e, a

	ld hl, wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH
	ld [hl], -1 ; MAPOBJECT_OBJECT_STRUCT_ID
	inc hl
	ld [hl], SPRITE_FOLLOWER ; MAPOBJECT_SPRITE
	inc hl
	call GetFollowerStartCoords
	ld a, c
	ld [hli], a ; MAPOBJECT_Y_COORD
	ld a, b
	ld [hli], a ; MAPOBJECT_X_COORD
	ld [hl], SPRITEMOVEDATA_STANDING_DOWN ; MAPOBJECT_MOVEMENT
	inc hl
	ld [hl], 0 ; MAPOBJECT_RADIUS
	inc hl
	ld [hl], e ; MAPOBJECT_PALETTE
	inc hl
	ld [hl], -1 ; MAPOBJECT_TIMEOFDAY (always)
	inc hl
	ld [hl], OBJECTTYPE_SCRIPT ; MAPOBJECT_TYPE
	inc hl
	ld [hl], 0 ; MAPOBJECT_SIGHT_RANGE
	inc hl
	ld a, LOW(FollowerScript)
	ld [hli], a ; MAPOBJECT_SCRIPT_POINTER
	ld a, HIGH(FollowerScript)
	ld [hli], a
	ld a, -1
	ld [hli], a ; MAPOBJECT_EVENT_FLAG (always visible)
	ld [hl], a

	xor a
	ld [wObjectMasks + FOLLOWER_OBJECT], a
	ret

GetFollowerStartCoords:
; Output: b = x, c = y (map object coordinates).
; After walking across a map connection, the follower starts one tile behind
; the player, so it keeps following without a gap. After a warp it starts on
; the player's tile, and steps out from behind them on their first step.
	ld a, [wXCoord]
	add 4
	ld b, a
	ld a, [wYCoord]
	add 4
	ld c, a
	ldh a, [hMapEntryMethod]
	cp MAPSETUP_CONNECTION
	ret nz
	ld a, [wPlayerDirection]
	maskbits NUM_DIRECTIONS, 2
	cp OW_UP
	jr z, .facing_up
	cp OW_LEFT
	jr z, .facing_left
	cp OW_RIGHT
	jr z, .facing_right
; facing down
	dec c
	ret
.facing_up
	inc c
	ret
.facing_left
	inc b
	ret
.facing_right
	dec b
	ret

GetFollowerPalette:
; Output: a = PAL_NPC_* for the lead Pokémon (its menu icon color, shiny
; aware); carry if there's no follower.
	call GetFollowerPartyMon
	ret c
	ld b, a
	ld a, [wCurPartySpecies]
	push af
	ld a, b
	ld [wCurPartySpecies], a
	ld bc, MON_DVS
	add hl, bc
	farcall GetMenuMonIconPalette
	ld e, a
	ld d, 0
	ld hl, .IconPalToNPCPal
	add hl, de
	pop af
	ld [wCurPartySpecies], a
	ld a, [hl]
	and a
	ret

.IconPalToNPCPal:
; indexed by PAL_ICON_* (constants/icon_constants.asm)
	db PAL_NPC_RED    ; PAL_ICON_RED
	db PAL_NPC_BLUE   ; PAL_ICON_BLUE
	db PAL_NPC_GREEN  ; PAL_ICON_GREEN
	db PAL_NPC_BROWN  ; PAL_ICON_BROWN
	db PAL_NPC_PINK   ; PAL_ICON_PINK
	db PAL_NPC_GRAY   ; PAL_ICON_GRAY
	db PAL_NPC_TEAL   ; PAL_ICON_TEAL
	db PAL_NPC_PURPLE ; PAL_ICON_PURPLE

RefreshFollower::
; After menus and battles (the lead may have changed: party order, fainting,
; evolution, the PC...; the option may have been turned off; the player may
; have gotten on or off the Bike). Its sprite is reloaded with the other
; sprites; this updates its colors and visibility, or removes it if no Pokémon
; can follow anymore or the option is off.
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_SPRITE]
	cp SPRITE_FOLLOWER
	ret nz
	call CheckFollowerAllowed
	jr c, .remove
	call UpdateFollowerVisibility
	call GetFollowerPalette
	jr c, .remove
	ld [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_PALETTE], a
	dec a ; PAL_NPC_* -> PAL_OW_*
	ld e, a
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_OBJECT_STRUCT_ID]
	cp -1
	ret z
	call GetObjectStruct
	ld hl, OBJECT_PAL_INDEX
	add hl, bc
	ld a, [hl]
	cp e
	ret z
	ld [hl], e
	farjp CheckForUsedObjPals ; load the new colors

.remove
	ld a, FOLLOWER_OBJECT
	call DeleteObjectStruct
	xor a
	ld [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_SPRITE], a
	ret

CheckFollowerAllowed:
; Carry if the follower option is off, or on maps where the Pokémon stays in
; its ball (see NoFollowerMaps).
	ld a, [wOptions2]
	bit FOLLOWER_OFF, a
	scf
	ret nz
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	ld hl, NoFollowerMaps
.loop
	ld a, [hli]
	cp -1
	ret z ; carry clear
	cp b
	ld a, [hli]
	jr nz, .loop
	cp c
	jr nz, .loop
	scf
	ret

NoFollowerMaps:
; Maps where the following Pokémon stays in its ball:
; cutscene-heavy rooms and link rooms.
	map_id LANCES_ROOM
	map_id HALL_OF_FAME
	map_id TRADE_CENTER
	map_id COLOSSEUM
	map_id TIME_CAPSULE
	map_id WC_QUALIFIER_1
	map_id WC_QUALIFIER_2
	map_id WC_QUALIFIER_3
	map_id WC_CHALLENGER_LOBBY
	map_id WC_ROUND_ONE
	map_id WC_ROUND_TWO
	map_id WC_ROUND_THREE
	map_id WC_ROUND_FOUR
	map_id WC_FINALS
	db -1 ; end

FollowerOnPlayerStep::
; Called by CountStep after each of the player's steps.
	; fallthrough

UpdateFollowerVisibility:
; The Pokémon goes back in its ball while the player isn't walking (Bike,
; Surf...): its object is removed, and the map object stays in the slot.
; On the first step back on foot, it comes back out on the player's tile and
; steps out behind them on their next step.
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_SPRITE]
	cp SPRITE_FOLLOWER
	ret nz
	ld a, [wFollowerFlags]
	bit FOLLOWER_HIDDEN_BY_SCRIPT_F, a
	jr nz, .check_hide
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
.check_hide
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_OBJECT_STRUCT_ID]
	jr nz, .hide
	cp -1
	ret nz ; already out
	; not while a script has an NPC following or leading
	ld a, [wObjectFollow_Leader]
	cp -1
	ret nz

	; come back out
	ld a, [wYCoord]
	add 4
	ld [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_Y_COORD], a
	ld a, [wXCoord]
	add 4
	ld [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_X_COORD], a
	ld a, FOLLOWER_OBJECT
	call UnmaskCopyMapObjectStruct
	lb bc, PLAYER_OBJECT, FOLLOWER_OBJECT
	farjp StartFollow

.hide
	cp -1
	ret z ; already in its ball
	ld a, FOLLOWER_OBJECT
	jmp DeleteObjectStruct

HideFollowerScript::
; hidefollower: put the Pokémon in its ball until showfollower or the next
; map load.
	ld hl, wFollowerFlags
	set FOLLOWER_HIDDEN_BY_SCRIPT_F, [hl]
	jr UpdateFollowerVisibility

ShowFollowerScript::
; showfollower: bring it back out on the player's tile (if it can follow).
	ld hl, wFollowerFlags
	res FOLLOWER_HIDDEN_BY_SCRIPT_F, [hl]
.update::
	jr UpdateFollowerVisibility

HideFollowerForScriptFollow::
; Script_follow: there's only one follow pair, so the Pokémon goes back in
; its ball while an NPC follows or leads the player. stopfollow brings it back.
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_SPRITE]
	cp SPRITE_FOLLOWER
	ret nz
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_OBJECT_STRUCT_ID]
	cp -1
	ret z
	ld a, FOLLOWER_OBJECT
	jmp DeleteObjectStruct

_FollowerScript::
	faceplayer
	callasm FollowerCry
	end

FollowerCry:
	call GetFollowerPartyMon
	ret c
	jmp PlayMonCry
