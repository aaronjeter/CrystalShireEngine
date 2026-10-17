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
	call PlaceFollowerObject
	farcall InitializeVisibleSprites
	; fallthrough

StartPokemonFollower:
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_SPRITE]
	cp SPRITE_FOLLOWER
	ret nz
	lb bc, PLAYER_OBJECT, FOLLOWER_OBJECT
	farjp StartFollow

PlaceFollowerObject:
; Put the follower in the last map object slot.
; The slot's NPC (on maps with 15 object_events) is replaced.
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
; evolution, the PC...). Its sprite is reloaded with the other sprites; this
; updates its colors, or removes it if no Pokémon can follow anymore.
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_SPRITE]
	cp SPRITE_FOLLOWER
	ret nz
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

_FollowerScript::
	faceplayer
	callasm FollowerCry
	end

FollowerCry:
	call GetFollowerPartyMon
	ret c
	jmp PlayMonCry
