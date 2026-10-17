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
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_SPRITE]
	cp SPRITE_FOLLOWER
	call z, ReloadFollowerPal ; in case another lead's colors are still loaded
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
	call LoadFollowerColors
	ret c
	ld e, PAL_NPC_FOLLOWER

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

LoadFollowerColors:
; Copy the lead Pokémon's colors (normal or shiny) from FollowerPalettes
; to wFollowerColors. Carry if there's no follower.
	call GetFollowerPartyMon
	ret c
	push hl
	call GetPokemonIndexFromID
	add hl, hl ; 8 bytes per species
	add hl, hl
	add hl, hl
	ld de, FollowerPalettes
	add hl, de
	pop de
	push hl
	ld hl, MON_DVS
	add hl, de
	ld b, h
	ld c, l
	farcall CheckShininess
	pop hl
	jr nc, .got_colors
	ld de, 2 * PAL_COLOR_SIZE
	add hl, de
.got_colors
	ld de, wFollowerColors
	ld bc, 2 * PAL_COLOR_SIZE
	ld a, BANK(wFollowerColors)
	call FarCopyWRAM
	and a
	ret

ReloadFollowerPal:
; Make the follower's object use PAL_OW_FOLLOWER, and reload that palette's
; colors (they change with the lead Pokémon, the index doesn't).
	ld a, PAL_NPC_FOLLOWER
	ld [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_PALETTE], a
	ld a, [wMapObjects + FOLLOWER_OBJECT * MAPOBJECT_LENGTH + MAPOBJECT_OBJECT_STRUCT_ID]
	cp -1
	ret z
	call GetObjectStruct
	ld hl, OBJECT_PAL_INDEX
	add hl, bc
	ld [hl], PAL_OW_FOLLOWER
	; forget the loaded copy, so CheckForUsedObjPals loads it again
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLoadedObjPal0)
	ldh [rSVBK], a
	ld hl, wLoadedObjPal0
	ld b, 8
.loop
	ld a, [hl]
	cp PAL_OW_FOLLOWER
	jr nz, .next
	ld [hl], -1
.next
	inc hl
	dec b
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	farjp CheckForUsedObjPals

GetPokemonSpritePalette::
; For _GetSpritePalette: if sprite c is a Pokémon (or a variable sprite set to
; one), return carry and c = the palette with its species' own colors.
	ld a, c
	cp SPRITE_VARS
	jr c, .got_sprite
	push hl
	push de
	sub SPRITE_VARS
	ld e, a
	ld d, 0
	ld hl, wVariableSprites
	add hl, de
	ld a, [hl]
	pop de
	pop hl
.got_sprite
	ld b, PAL_OW_FOLLOWER
	cp SPRITE_FOLLOWER
	jr z, .mon
	ld b, PAL_OW_DAY_CARE_MON_1
	cp SPRITE_DAY_CARE_MON_1
	jr z, .mon
	inc b
	cp SPRITE_DAY_CARE_MON_2
	jr z, .mon
	cp SPRITE_POKEMON
	ccf
	ret nc
	cp SPRITE_POKEMON + NUM_POKEMON_SPRITES
	ret nc
	add PAL_OW_MON - SPRITE_POKEMON
	ld b, a
.mon
	ld c, b
	scf
	ret

BuildFollowerOBPal::
; For CopySpritePal: build the follower's palette in wFollowerOBPal from
; wFollowerColors. Output: hl = wFollowerOBPal
	ld hl, wFollowerColors
	ld de, wMonOBPalColors
	ld bc, 2 * PAL_COLOR_SIZE
	ld a, BANK(wFollowerColors)
	call FarCopyWRAM
	jr BuildMonOBPal

BuildSpriteMonOBPal::
; For CopySpritePal: build the palette of a Pokémon sprite (PAL_OW_MON to
; PAL_OW_MON_END - 1 in wNeededPalIndex) from its species' normal colors.
; Output: hl = wFollowerOBPal
	ld a, [wNeededPalIndex]
	sub PAL_OW_MON
	cp NUM_POKEMON_SPRITES
	jr nc, .day_care
	ld e, a
	ld d, 0
	ld hl, SpriteMons
	add hl, de
	add hl, de
	ld a, BANK(SpriteMons)
	call GetFarWord ; hl = species index
	jr .got_index

.day_care
	sub NUM_POKEMON_SPRITES
	ld a, [wBreedMon1Species]
	jr z, .got_species
	ld a, [wBreedMon2Species]
.got_species
	call GetPokemonIndexFromID
.got_index
	add hl, hl ; 8 bytes per species
	add hl, hl
	add hl, hl
	ld de, FollowerPalettes
	add hl, de
	ld de, wMonOBPalColors
	ld bc, 2 * PAL_COLOR_SIZE
	ld a, BANK(wMonOBPalColors)
	call FarCopyWRAM
	; fallthrough

BuildMonOBPal:
; Build wFollowerOBPal from wMonOBPalColors, darkened like the other NPCs at
; night and in dark caves. Output: hl = wFollowerOBPal
	assert BANK(wFollowerOBPal) == BANK("GBC Video"), \
		"CopySpritePal copies with FarCopyColorWRAM"
	; work out the lighting first: these variables are in WRAM bank 1
	; e = 0: normal, 1: night, 2: dark cave without Flash
	ld e, 0
	ld a, [wPalFlags]
	bit USE_DAYTIME_PAL_F, a
	jr nz, .got_lighting
	call GetMapTimeOfDay ; clobbers de
	ld e, 0
	or ~IN_DARKNESS
	inc a
	jr nz, .not_dark_map
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr nz, .not_dark_map
	ld e, 2
	jr .got_lighting

.not_dark_map
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	cp NITE_F
	jr nz, .got_lighting
	inc e
.got_lighting
	ldh a, [rSVBK]
	push af
	ld a, BANK(wFollowerOBPal)
	ldh [rSVBK], a

	ld a, e
	cp 2
	jr nz, .not_dark
	push de
	ld hl, DarknessOBPalette
	ld de, wFollowerOBPal
	ld bc, 1 palettes
	ld a, BANK(DarknessOBPalette)
	call FarCopyBytes
	pop de
	jr .done

.not_dark
	ld hl, wFollowerOBPal
	ld a, LOW(palred 31 + palgreen 31 + palblue 31)
	ld [hli], a
	ld a, HIGH(palred 31 + palgreen 31 + palblue 31)
	ld [hli], a
	ld bc, wMonOBPalColors
	ld d, 2
.color_loop
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	dec d
	jr nz, .color_loop
	xor a ; black
	ld [hli], a
	ld [hl], a

	; at night, darken the two colors like the NPC night palettes
	dec e
	jr nz, .done
	ld hl, wFollowerOBPal + 1 * PAL_COLOR_SIZE
	call .Darken
	ld hl, wFollowerOBPal + 2 * PAL_COLOR_SIZE
	call .Darken

.done
	pop af
	ldh [rSVBK], a
	ld hl, wFollowerOBPal
	ret

.Darken:
; red / 2 + 1, green / 2, blue * 7 / 8 (close to the NPC night palettes)
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a ; de = color
	; red: bits 0-4
	ld a, e
	and %11111
	srl a
	inc a
	ld b, a
	; green: bits 5-9
	ld a, e
	and %11100000
	ld c, a
	ld a, d
	and %11
	or c
	rlca
	rlca
	rlca ; green in bits 0-4
	srl a
	ld c, a
	; blue: bits 10-14
	ld a, d
	srl a
	srl a
	and %11111
	ld d, a
	srl a
	srl a
	srl a
	cpl
	inc a
	add d ; blue - blue / 8
	; repack: blue << 10 | green << 5 | red
	ld d, a
	ld a, c
	rrca
	rrca
	rrca
	ld e, a
	and %11100000
	or b
	ld [hli], a
	ld a, e
	and %00000011
	sla d
	sla d
	or d
	ld [hl], a
	ret

INCLUDE "data/pokemon/follower_palettes.asm"

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
	call LoadFollowerColors
	jr c, .remove
	jmp ReloadFollowerPal

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
