; Wild Pokémon that wander on the map. On every map load, maps with land wild
; Pokémon get up to MAX_WILD_SPAWNS of them (MAX_CAVE_WILD_SPAWNS in caves and
; dungeons) in free map object slots: on routes and in towns on tall grass, in
; caves and dungeons on any floor. Each of the first ones gets its own Pokémon
; sprite slot; the others share a slot with a spawn of the same species.
; Walking into one, pressing A on it or being walked into by it starts a wild
; battle with it; it's removed afterwards. Its primary type gives it a
; temperament (WildSpawnBrain): wanderer, skittish (flees), aggressive (charges
; when it sees the player) or sleepy (still until the player is next to it). Each spawn uses its own Pokémon sprite slot
; (SPRITE_MON_5 and up), whose species index has bit 15 set for a shiny.

DEF MAX_WILD_SPAWNS EQU 3
DEF MAX_CAVE_WILD_SPAWNS EQU 5
DEF NUM_SPAWN_SPRITE_SLOTS EQU 4
DEF FIRST_SPAWN_SPRITE_SLOT EQU 4 ; SPRITE_MON_5: maps' own Pokémon use SPRITE_MON_1-4
assert FIRST_SPAWN_SPRITE_SLOT + NUM_SPAWN_SPRITE_SLOTS <= NUM_MON_SPRITE_SLOTS
DEF SHARED_SPAWN_TRIES EQU 8 ; table rolls to find a species already shown
DEF NEW_SPECIES_TRIES EQU 8 ; table rolls to find a species not shown yet, for a free sprite slot
DEF FIRST_SPAWN_OBJECT EQU 1
DEF LAST_SPAWN_OBJECT EQU FOLLOWER_OBJECT - 1
DEF WILD_SPAWN_TRIES EQU 32 ; spots from the area list tried per spawn
DEF SPAWN_AREA_SIZE EQU 32 ; tiles across: the area around the player searched for spots
DEF MAX_SPAWN_SPOTS EQU 512

; BuildSpawnArea step directions, for side walls
DEF SPAWN_STEP_DOWN  EQU 1 << 0
DEF SPAWN_STEP_UP    EQU 1 << 1
DEF SPAWN_STEP_LEFT  EQU 1 << 2
DEF SPAWN_STEP_RIGHT EQU 1 << 3
DEF WILD_SPAWN_MIN_DISTANCE EQU 3 ; from the player, in steps
DEF WILD_SPAWN_OFFSCREEN_DISTANCE EQU 6 ; a respawn appears outside the screen
DEF WILD_SPAWN_RESPAWN_STEPS EQU 64 ; steps between respawns once the map has been full (0: spawns only on map load)
DEF WILD_SPAWN_TOPUP_STEPS EQU 16 ; steps between respawns until then
DEF WILD_SPAWN_FILLED_F EQU 7 ; wWildSpawnSteps: the map has had its cap since the player came in
assert WILD_SPAWN_RESPAWN_STEPS < 1 << WILD_SPAWN_FILLED_F
DEF WILD_SPAWN_RADIUS EQU $22 ; wander radius: 2 steps each way

; WildSpawnBrain ranges, in steps from the player (Bold: +2, Timid: -1)
DEF WILD_SPAWN_NOTICE_RANGE EQU 3 ; skittish
DEF WILD_SPAWN_NOTICE_RANGE_FAST EQU 5 ; skittish, when the player runs or bikes
DEF WILD_SPAWN_SIGHT_RANGE EQU 4 ; aggressive: in front of it
DEF WILD_SPAWN_CURIOUS_RANGE EQU 4 ; curious
DEF WILD_SPAWN_TERRITORY EQU 2 ; territorial: from its home
DEF WILD_SPAWN_MIMIC_RANGE EQU 4 ; mimic
DEF WILD_SPAWN_DASH_RANGE EQU 3 ; hit and run
DEF WILD_SPAWN_HIDE_RANGE EQU 2 ; hider
DEF WILD_SPAWN_TELEPORT_RANGE EQU 3 ; teleporter
DEF WILD_SPAWN_BURROW_RANGE EQU 2 ; burrower
; fixed ranges
DEF WILD_SPAWN_GIVE_UP_RANGE EQU 6 ; a chase ends past this
DEF WILD_SPAWN_LEASH EQU 3 ; territorial: goes home when the player is past this from it
DEF WILD_SPAWN_PACE EQU 2 ; pacer: steps each way from its spot
DEF WILD_SPAWN_BURROW_DISTANCE EQU 5 ; burrower: comes up at most this far away
DEF WILD_SPAWN_BURROW_TRIES EQU 16
DEF WILD_SPAWN_ZZZ_RANGE EQU 4 ; sleepy: shows its "Zzz" once
DEF WILD_SPAWN_EMOTE_FRAMES EQU 90

SpawnWildMons::
	call InitStaticWanderers
	xor a
	ld [wSpawnSpotCount], a
	ld [wSpawnSpotCount + 1], a
	ld [wSpawnEmoteRequest], a
	ld [wSpawnEmoteObject], a
	ld [wWildSpawnMove], a
	ld [wWildSpawnBattle], a
	ld [wWildSpawnTouched], a
	ld [wWildSpawnSpotted], a
	ld [wWildSpawnSteps], a
	call CheckWildSpawnsAllowed
	ret c
	ld a, WILD_SPAWN_MIN_DISTANCE
	ld [wWildSpawnMinDistance], a
	call BuildSpawnArea
.loop
	call CheckWildSpawnRoom
	jr c, .filled
	call AddWildSpawn
	jr nc, .loop
	ret

.filled
	ld hl, wWildSpawnSteps
	set WILD_SPAWN_FILLED_F, [hl]
	ret

ContinueWildSpawns::
; Continue: the saved spawns were removed (LoadMonSpriteSlots), so spawn new
; ones, as on arrival
	call SpawnWildMons
	farjp InitializeVisibleSprites

InitStaticWanderers:
; A map's own Pokémon (object_events with SPRITEMOVEDATA_WILDSPAWN and a
; SPRITE_MON_* sprite, battled through their own script) wander like spawns:
; give each the temperament of its species, and the level of the script's
; loadwildmon (after an optional cry), or 0 if it isn't there.
	ld a, FIRST_SPAWN_OBJECT
.loop
	push af
	call GetMapObject
	call IsStaticWanderer
	jr nz, .next
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	sub SPRITE_MON_1
	add a
	ld e, a
	ld d, 0
	ld hl, wMonSpriteSpecies
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	res 7, h ; the shiny bit
	push bc
	call GetPokemonIDFromIndex
	ld [wTempWildMonSpecies], a
	pop bc
	ld hl, MAPOBJECT_SPAWN_STATE
	add hl, bc
	call SetSpawnBehavior
	call StaticWandererLevel
	ld hl, MAPOBJECT_SPAWN_LEVEL
	add hl, bc
	ld [hl], a
.next
	pop af
	inc a
	cp LAST_SPAWN_OBJECT + 1
	jr c, .loop
	ret

StaticWandererLevel:
; a = the level in map object bc's script: cry (optional), then loadwildmon
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	call GetFarByte
	cp cry_command
	jr nz, .no_cry
	inc hl
	inc hl
	inc hl
	call GetMapScriptsBank
	call GetFarByte
.no_cry
	cp loadwildmon_command
	jr nz, .none
	inc hl
	inc hl
	inc hl
	call GetMapScriptsBank
	jmp GetFarByte

.none
	xor a
	ret

IsStaticWanderer:
; z if map object bc is a map's own wandering Pokémon (see InitStaticWanderers)
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	cp SPRITE_MON_1
	jr c, .no
	cp SPRITE_MON_1 + NUM_MON_SPRITE_SLOTS
	jr nc, .no
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld a, [hl]
	cp OBJECTTYPE_WILDSPAWN
	jr z, .no
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	cp SPRITEMOVEDATA_WILDSPAWN
	ret

.no
	or 1
	ret

CheckWildSpawnRoom:
; carry if the map has its cap of spawns, or if one more object near the
; player (within SPAWN_AREA_SIZE / 2 tiles) could leave a visible object (the
; follower first: it's the last map object) without an object struct
	ld bc, 0 ; b: shown objects near the player, c: spawns
	ld a, FIRST_SPAWN_OBJECT
.count
	push af
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld d, [hl]
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld e, [hl]
	inc hl
	ld h, [hl] ; MAPOBJECT_X_COORD
	pop bc
	and a
	jr z, .next
	ld a, d
	cp OBJECTTYPE_WILDSPAWN
	jr nz, .not_spawn
	inc c
.not_spawn
; near the player?
	ld a, [wXCoord]
	add 4 - SPAWN_AREA_SIZE / 2
	cpl
	inc a
	add h
	cp SPAWN_AREA_SIZE
	jr nc, .next
	ld a, [wYCoord]
	add 4 - SPAWN_AREA_SIZE / 2
	cpl
	inc a
	add e
	cp SPAWN_AREA_SIZE
	jr nc, .next
	pop af
	push af
	ld hl, wObjectMasks
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	and a
	jr nz, .next ; hidden
	inc b
.next
	pop af
	inc a
	cp NUM_OBJECTS
	jr c, .count
	ld a, b
	cp NUM_OBJECT_STRUCTS - 1 ; the player has the first one
	ccf
	ret c
	ld b, MAX_WILD_SPAWNS
	ld a, [wEnvironment]
	cp CAVE
	jr z, .cave
	cp DUNGEON
	jr nz, .got_cap
.cave
	ld b, MAX_CAVE_WILD_SPAWNS
.got_cap
	ld a, c
	cp b
	ccf
	ret

AddWildSpawn:
; Add one spawn at least wWildSpawnMinDistance steps from the player.
; Carry if there's no room, no wild Pokémon or no spot.
	call FindFreeSpawnSlot
	ret c
	ld [wWildSpawnSlot], a
	call FindUnusedSpawnSpriteSlot
	jr c, .shared
	ld [wWildSpawnCount], a
	xor a
	ld [wWildSpawnShared], a
; a species not shown yet, if a few rolls find one
	ld a, NEW_SPECIES_TRIES
.choose
	push af
	farcall ChooseWildSpawnMon
	jr nz, .none
	call SpawnSpeciesShown
	jr nc, .chosen
	pop af
	dec a
	jr nz, .choose
	jr .got_species ; the last roll

.none
	pop af
	scf
	ret ; no land wild Pokémon here

.chosen
	pop af
.got_species
; that sprite slot's palette may still hold another species' colors
	ld a, [wWildSpawnCount]
	add PAL_OW_MON_SLOT_1 + FIRST_SPAWN_SPRITE_SLOT
	ld hl, wLoadedObjPal0
	ld b, 8
.pals
	cp [hl]
	jr nz, .next_pal
	ld [hl], -1
.next_pal
	inc hl
	dec b
	jr nz, .pals
	jr .spot

.shared
	call ChooseSharedSpawnMon
	ret c
.spot
	call FindSpawnSpot
	ret c
	call PlaceWildSpawn
	and a
	ret

SpawnSpeciesShown:
; carry if a spawn in another sprite slot is wTempWildMonSpecies
	ld a, [wTempWildMonSpecies]
	call GetPokemonIndexFromID
	ld e, 0
.slots
	push hl
	push de
	ld a, e
	call SpawnSpriteSlotUsed
	pop de
	pop hl
	jr nc, .next_slot
	push hl
	ld a, e
	add FIRST_SPAWN_SPRITE_SLOT
	add a
	ld c, a
	ld b, 0
	ld hl, wMonSpriteSpecies
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	res 7, b ; the shiny bit
	ld c, a
	pop hl
	ld a, l
	cp c
	jr nz, .next_slot
	ld a, h
	cp b
	scf
	ret z
.next_slot
	inc e
	ld a, e
	cp NUM_SPAWN_SPRITE_SLOTS
	jr c, .slots
	and a
	ret

SpawnSpriteSlotUsed:
; carry if a spawn uses sprite slot a (0 to NUM_SPAWN_SPRITE_SLOTS - 1)
	add SPRITE_MON_1 + FIRST_SPAWN_SPRITE_SLOT
	ld d, a
	ld a, FIRST_SPAWN_OBJECT
.loop
	push af
	call GetMapObject
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .used
	pop af
	inc a
	cp LAST_SPAWN_OBJECT + 1
	jr c, .loop
	and a
	ret

.used
	pop af
	scf
	ret

FindUnusedSpawnSpriteSlot:
; a = a sprite slot no spawn uses, or carry
	ld e, 0
.loop
	ld a, e
	push de
	call SpawnSpriteSlotUsed
	pop de
	ld a, e
	ret nc ; unused
	inc e
	ld a, e
	cp NUM_SPAWN_SPRITE_SLOTS
	jr c, .loop
	scf
	ret

ChooseSharedSpawnMon:
; Roll the wild table until the species is one a spawn already shows: its
; sprite slot goes in wWildSpawnCount. Carry if none comes up.
	ld a, TRUE
	ld [wWildSpawnShared], a
	ld a, SHARED_SPAWN_TRIES
.try
	push af
	farcall ChooseWildSpawnMon
	jr nz, .none
	ld a, [wTempWildMonSpecies]
	call GetPokemonIndexFromID
	ld e, 0
.slots
	push hl
	push de
	ld a, e
	call SpawnSpriteSlotUsed
	pop de
	pop hl
	jr nc, .next_slot
	push hl
	ld a, e
	add FIRST_SPAWN_SPRITE_SLOT
	add a
	ld c, a
	ld b, 0
	ld hl, wMonSpriteSpecies
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	res 7, b ; the shiny bit
	ld c, a
	pop hl
	ld a, l
	cp c
	jr nz, .next_slot
	ld a, h
	cp b
	jr z, .found
.next_slot
	inc e
	ld a, e
	cp NUM_SPAWN_SPRITE_SLOTS
	jr c, .slots
	pop af
	dec a
	jr nz, .try
	scf
	ret

.none
	pop af
	scf
	ret

.found
	pop af
	ld a, e
	ld [wWildSpawnCount], a
	and a
	ret

CheckWildSpawnsAllowed::
; carry if this map can't have spawns now
	ld hl, wStatusFlags
	bit STATUSFLAGS_NO_WILD_ENCOUNTERS_F, [hl]
	jr nz, .no
	ld de, ENGINE_BUG_CONTEST_TIMER
	ld b, CHECK_FLAG
	farcall EngineFlagAction
	ld a, c
	and a
	jr nz, .no ; not during the Bug-Catching Contest
	ld a, [wEnvironment]
	cp TOWN
	jr z, .ok
	cp ROUTE
	jr z, .ok
	cp CAVE
	jr z, .ok
	cp DUNGEON
	jr z, .ok
.no
	scf
	ret

.ok
	and a
	ret

WildSpawnStep::
; CountStep: a new spawn comes in from outside the screen while the map has
; room for one: every WILD_SPAWN_TOPUP_STEPS steps until the map has been full
; since the player came in, then every WILD_SPAWN_RESPAWN_STEPS steps.
if WILD_SPAWN_RESPAWN_STEPS
	ld hl, wWildSpawnSteps
	inc [hl]
	ld a, [hl]
	and ~(1 << WILD_SPAWN_FILLED_F)
	ld b, WILD_SPAWN_TOPUP_STEPS
	bit WILD_SPAWN_FILLED_F, [hl]
	jr z, .got_steps
	ld b, WILD_SPAWN_RESPAWN_STEPS
.got_steps
	cp b
	ret c
	ld a, [hl]
	and 1 << WILD_SPAWN_FILLED_F
	ld [hl], a
	call CheckWildSpawnsAllowed
	ret c
	call CheckWildSpawnRoom
	jr c, .filled
	ld a, WILD_SPAWN_OFFSCREEN_DISTANCE
	ld [wWildSpawnMinDistance], a
	call BuildSpawnArea
	jp AddWildSpawn

.filled
	ld hl, wWildSpawnSteps
	set WILD_SPAWN_FILLED_F, [hl]
endc
	ret

FindFreeSpawnSlot:
; Returns a = a free map object slot (no sprite), or carry if there's none.
	ld a, FIRST_SPAWN_OBJECT
.loop
	push af
	call GetMapObject
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .found
	pop af
	inc a
	cp LAST_SPAWN_OBJECT + 1
	jr c, .loop
	scf
	ret

.found
	pop af
	and a
	ret

MACRO spawn_area_wram
	ld a, BANK(wSpawnAreaMarks)
	ldh [rSVBK], a
ENDM

MACRO spawn_vars_wram
	ld a, BANK(wSpawnAreaLeft)
	ldh [rSVBK], a
ENDM

	assert BANK(wSpawnAreaLeft) == BANK(wMapWidth)
	assert LOW(wSpawnAreaMarks) == 0
	assert SPAWN_AREA_SIZE == 32 && MAX_SPAWN_SPOTS == 512, "resize the wSpawnArea buffers"

BuildSpawnArea:
; List in wSpawnAreaSpots (up to MAX_SPAWN_SPOTS) the spawn ground within
; SPAWN_AREA_SIZE / 2 tiles of the player that the player can walk to: a
; flood fill from the player over land tiles (ledges both ways), not through
; warps and pits.
	ld a, [wXCoord]
	add 4 - SPAWN_AREA_SIZE / 2
	ld [wSpawnAreaLeft], a
	ld a, [wYCoord]
	add 4 - SPAWN_AREA_SIZE / 2
	ld [wSpawnAreaTop], a
	xor a
	ld [wSpawnSpotCount], a
	ld [wSpawnSpotCount + 1], a
	ld a, LOW(wSpawnAreaQueue)
	ld [wSpawnQueueHead], a
	ld a, HIGH(wSpawnAreaQueue)
	ld [wSpawnQueueHead + 1], a
	ld a, LOW(wSpawnAreaQueue + 2)
	ld [wSpawnQueueTail], a
	ld a, HIGH(wSpawnAreaQueue + 2)
	ld [wSpawnQueueTail + 1], a
	spawn_area_wram
	ld hl, wSpawnAreaMarks
	ld bc, SPAWN_AREA_SIZE * SPAWN_AREA_SIZE
	xor a
	call ByteFill
	ld a, SPAWN_AREA_SIZE / 2
	ld [wSpawnAreaQueue], a
	ld [wSpawnAreaQueue + 1], a
	ld a, TRUE
	ld [wSpawnAreaMarks + SPAWN_AREA_SIZE / 2 * SPAWN_AREA_SIZE + SPAWN_AREA_SIZE / 2], a
	spawn_vars_wram
.loop
	ld hl, wSpawnQueueHead
	ld a, [wSpawnQueueTail]
	cp [hl]
	jr nz, .next
	ld a, [wSpawnQueueTail + 1]
	inc hl
	cp [hl]
	ret z
.next
	ld hl, wSpawnQueueHead
	ld a, [hli]
	ld h, [hl]
	ld l, a
	spawn_area_wram
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	spawn_vars_wram
	ld a, l
	ld [wSpawnQueueHead], a
	ld a, h
	ld [wSpawnQueueHead + 1], a
; the collision of this cell, for its side walls
	push de
	ld a, [wSpawnAreaLeft]
	add d
	ld d, a
	ld a, [wSpawnAreaTop]
	add e
	ld e, a
	call GetCoordTileCollisionRaw
	ld [wSpawnAreaCellColl], a
	pop de
	ld a, SPAWN_STEP_LEFT
	ld [wSpawnAreaDir], a
	dec d
	call .Neighbor
	ld a, SPAWN_STEP_RIGHT
	ld [wSpawnAreaDir], a
	inc d
	inc d
	call .Neighbor
	ld a, SPAWN_STEP_UP
	ld [wSpawnAreaDir], a
	dec d
	dec e
	call .Neighbor
	ld a, SPAWN_STEP_DOWN
	ld [wSpawnAreaDir], a
	inc e
	inc e
	call .Neighbor
	jr .loop

.Neighbor:
; d, e = a cell of the area; keeps d, e
	ld a, d
	cp SPAWN_AREA_SIZE
	ret nc
	ld a, e
	cp SPAWN_AREA_SIZE
	ret nc
	push de
	call .Visit
	pop de
	spawn_vars_wram
	ret

.Visit:
; inside the map?
	ld a, [wSpawnAreaLeft]
	add d
	ld b, a
	sub 4
	ld c, a
	ld a, [wMapWidth]
	add a
	cp c
	ret c
	ret z
	ld a, [wSpawnAreaTop]
	add e
	ld c, a
	sub 4
	ld l, a
	ld a, [wMapHeight]
	add a
	cp l
	ret c
	ret z
; not seen yet
	push bc
	call .MarkAddress
	spawn_area_wram
	ld a, [hl]
	and a
	jr nz, .seen
	ld [hl], TRUE
	spawn_vars_wram
	pop bc
	push de
	push bc
	ld d, b
	ld e, c
	call GetCoordTileCollisionRaw
	pop bc
	pop de
	cp -1
	ret z
; land, not a warp or a pit
	cp COLL_PIT
	jr c, .not_warp
	cp COLL_WARP_7F + 1
	ret c
.not_warp
	call .CheckSideWalls
	jr nc, .no_wall
; a side wall may only block this way in: the cell can be seen again
	push af
	call .MarkAddress
	spawn_area_wram
	ld [hl], FALSE
	spawn_vars_wram
	pop af
	ret

.no_wall
	push af
	call GetTilePermission
	and a ; LAND_TILE
	jr z, .walkable
	pop af
	ret

.walkable
	pop af
	push de
	push bc
	push bc
	call IsSpawnGround
	pop bc
	call z, .AddSpot
	pop bc
	pop de
; queue the cell
	ld hl, wSpawnQueueTail
	ld a, [hli]
	ld h, [hl]
	ld l, a
	spawn_area_wram
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	spawn_vars_wram
	ld a, l
	ld [wSpawnQueueTail], a
	ld a, h
	ld [wSpawnQueueTail + 1], a
	ret

.seen
	pop bc
	ret

.MarkAddress:
; hl = the wSpawnAreaMarks entry of cell d, e
	ld l, e
	ld h, 0
rept 5 ; SPAWN_AREA_SIZE
	add hl, hl
endr
	ld a, d
	add l
	ld l, a
	ld a, h
	adc HIGH(wSpawnAreaMarks)
	ld h, a
	ret

.CheckSideWalls:
; a = the collision of the cell stepped into; carry if a side wall of it or of
; the cell stepped from blocks the step (wSpawnAreaDir). Keeps a, bc, de.
	push af
	push bc
	push hl
	ld c, a
	ld a, [wSpawnAreaDir]
	ld b, a
	ld a, [wSpawnAreaCellColl]
	ld hl, .ExitWalls
	call .SideWall
	jr c, .walled
	ld a, c
	ld hl, .EntryWalls
	call .SideWall
.walled
	pop hl
	pop bc
	jr c, .blocked
	pop af
	and a
	ret

.blocked
	pop af
	scf
	ret

.SideWall:
; a = collision, hl = wall table, b = step; carry if blocked
	sub COLL_RIGHT_WALL
	cp COLL_UP_LEFT_WALL - COLL_RIGHT_WALL + 1
	ret nc
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	and b
	ret z
	scf
	ret

.ExitWalls:
; steps out of a cell that its walls block
	table_width 1
	db SPAWN_STEP_RIGHT                    ; COLL_RIGHT_WALL
	db SPAWN_STEP_LEFT                     ; COLL_LEFT_WALL
	db SPAWN_STEP_UP                       ; COLL_UP_WALL
	db SPAWN_STEP_DOWN                     ; COLL_DOWN_WALL
	db SPAWN_STEP_DOWN | SPAWN_STEP_RIGHT  ; COLL_DOWN_RIGHT_WALL
	db SPAWN_STEP_DOWN | SPAWN_STEP_LEFT   ; COLL_DOWN_LEFT_WALL
	db SPAWN_STEP_UP | SPAWN_STEP_RIGHT    ; COLL_UP_RIGHT_WALL
	db SPAWN_STEP_UP | SPAWN_STEP_LEFT     ; COLL_UP_LEFT_WALL
	assert_table_length COLL_UP_LEFT_WALL - COLL_RIGHT_WALL + 1

.EntryWalls:
; steps into a cell that its walls block
	table_width 1
	db SPAWN_STEP_LEFT                     ; COLL_RIGHT_WALL
	db SPAWN_STEP_RIGHT                    ; COLL_LEFT_WALL
	db SPAWN_STEP_DOWN                     ; COLL_UP_WALL
	db SPAWN_STEP_UP                       ; COLL_DOWN_WALL
	db SPAWN_STEP_UP | SPAWN_STEP_LEFT     ; COLL_DOWN_RIGHT_WALL
	db SPAWN_STEP_UP | SPAWN_STEP_RIGHT    ; COLL_DOWN_LEFT_WALL
	db SPAWN_STEP_DOWN | SPAWN_STEP_LEFT   ; COLL_UP_RIGHT_WALL
	db SPAWN_STEP_DOWN | SPAWN_STEP_RIGHT  ; COLL_UP_LEFT_WALL
	assert_table_length COLL_UP_LEFT_WALL - COLL_RIGHT_WALL + 1

.AddSpot:
; b, c = map object coordinates
	ld hl, wSpawnSpotCount
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -MAX_SPAWN_SPOTS
	add hl, de
	ret c
	ld de, MAX_SPAWN_SPOTS
	add hl, de
	push hl
	inc hl
	ld a, l
	ld [wSpawnSpotCount], a
	ld a, h
	ld [wSpawnSpotCount + 1], a
	pop hl
	add hl, hl
	ld de, wSpawnAreaSpots
	add hl, de
	spawn_area_wram
	ld [hl], b
	inc hl
	ld [hl], c
	spawn_vars_wram
	ret

IsSpawnGround:
; z if collision a is ground a spawn can be placed on: grass, or plain floor
; in a cave
	cp COLL_TALL_GRASS
	ret z
	cp COLL_LONG_GRASS
	ret z
	ld b, a
	ld a, [wEnvironment]
	cp CAVE
	jr z, .floor
	cp DUNGEON
	ret nz
.floor
; COLL_FLOOR and the floor values below COLL_WALL
	ld a, b
	cp COLL_WALL
	jr nc, .no
	xor a
	ret

.no
	or 1
	ret

FindSpawnSpot:
; Returns d, e = a free spot (map object coordinates) for a spawn from the
; BuildSpawnArea list, or carry.
; Picks come from a xorshift seeded once from Random: calls to Random in a
; tight loop give correlated values.
	ld a, [wSpawnSpotCount]
	ld hl, wSpawnSpotCount + 1
	or [hl]
	scf
	ret z
	call Random
	ld [wWildSpawnRNG], a
	call Random
	or 1
	ld [wWildSpawnRNG + 1], a
	ld a, WILD_SPAWN_TRIES
.loop
	push af
	call .Try
	jr nc, .found
	pop af
	dec a
	jr nz, .loop
	scf
	ret

.found
	pop af
	and a
	ret

.Try:
	call .RandomSpot
	add hl, hl
	ld de, wSpawnAreaSpots
	add hl, de
	spawn_area_wram
	ld a, [hli]
	ld d, a
	ld e, [hl]
	spawn_vars_wram
; not next to the player
	ld a, [wXCoord]
	add 4
	sub d
	jr nc, .dx
	cpl
	inc a
.dx
	ld hl, wWildSpawnMinDistance
	cp [hl]
	jr nc, .far_enough
	ld a, [wYCoord]
	add 4
	sub e
	jr nc, .dy
	cpl
	inc a
.dy
	cp [hl]
	ret c
.far_enough
; no other object there
	ld a, 1
.objects
	push af
	call GetMapObject
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hli]
	and a
	jr z, .next_object
	ld a, [hli] ; MAPOBJECT_Y_COORD
	cp e
	jr nz, .next_object
	ld a, [hl] ; MAPOBJECT_X_COORD
	cp d
	jr z, .taken
.next_object
	pop af
	inc a
	cp NUM_OBJECTS
	jr c, .objects
	and a
	ret

.taken
	pop af
	scf
	ret

.RandomSpot:
; hl = a random index below wSpawnSpotCount
	ld a, [wSpawnSpotCount + 1]
	and a
	jr nz, .big
	ld a, [wSpawnSpotCount]
	call SpawnRandomBelow
	ld l, a
	ld h, 0
	ret

.big
; 256 to MAX_SPAWN_SPOTS spots: 9 random bits until one is below the count
	call SpawnRandomWord
	ld a, h
	and HIGH(MAX_SPAWN_SPOTS - 1)
	ld h, a
	ld a, [wSpawnSpotCount + 1]
	cp h
	jr c, .big
	jr nz, .ok
	ld a, [wSpawnSpotCount]
	and a
	jr z, .big
	dec a
	cp l
	jr c, .big
.ok
	ret

SpawnRandomWord:
; hl = the next xorshift value of wWildSpawnRNG
	ld hl, wWildSpawnRNG
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	rra
	ld a, l
	rra
	xor h
	ld h, a
	ld a, l
	rra
	ld a, h
	rra
	xor l
	ld l, a
	xor h
	ld h, a
	ld a, l
	ld [wWildSpawnRNG], a
	ld a, h
	ld [wWildSpawnRNG + 1], a
	ret

SpawnRandomBelow:
; a = a number from 0 to a - 1 (a > 0), from the xorshift in wWildSpawnRNG
	push bc
	push de
	push hl
	ld e, a
	call SpawnRandomWord
; (h * e) >> 8
	ld a, h
	ld hl, 0
	ld d, l
	ld b, 8
.mul
	add hl, hl
	add a
	jr nc, .mul_next
	add hl, de
.mul_next
	dec b
	jr nz, .mul
	ld a, h
	pop hl
	pop de
	pop bc
	ret

PlaceWildSpawn:
; Write the spawn of wTempWildMonSpecies (level wCurPartyLevel) at d, e into
; map object wWildSpawnSlot, with sprite slot wWildSpawnCount: its own, or
; shared (wWildSpawnShared) with a spawn of the same species, whose look it
; then keeps (shiny or not).
	push de
	call Random
	ld [wWildSpawnDVs], a
	call Random
	ld [wWildSpawnDVs + 1], a
	ld a, [wWildSpawnCount]
	add FIRST_SPAWN_SPRITE_SLOT
	ld c, a
	add a
	ld e, a
	ld d, 0
	ld hl, wMonSpriteSpecies
	add hl, de
	ld a, [wWildSpawnShared]
	and a
	jr z, .own_slot
; a shared slot: the same shininess
	inc hl
	ld a, [wWildSpawnDVs + 1]
	bit 7, [hl]
	jr z, .not_shiny_slot
	ld a, SHINY_SPDSPC_DV
	jr .shared_dvs
.not_shiny_slot
	cp SHINY_SPDSPC_DV
	jr nz, .shared_dvs
	xor $10 ; not shiny
.shared_dvs
	ld [wWildSpawnDVs + 1], a
	jr .got_sprite

.own_slot
; the species index into its sprite slot, bit 15 for a shiny
	push hl
	ld a, [wTempWildMonSpecies]
	call GetPokemonIndexFromID
	ld a, [wWildSpawnDVs + 1]
	cp SHINY_SPDSPC_DV
	jr nz, .not_shiny
	set 7, h
.not_shiny
	ld d, h
	ld e, l
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
.got_sprite
	ld a, c
	add SPRITE_MON_1
	ld c, a ; sprite
; the map object
	ld a, [wWildSpawnSlot]
	push bc
	call GetMapObject
	ld h, b
	ld l, c
	pop bc
	pop de
	ld [hl], -1 ; MAPOBJECT_OBJECT_STRUCT_ID
	inc hl
	ld [hl], c ; MAPOBJECT_SPRITE
	inc hl
	ld [hl], e ; MAPOBJECT_Y_COORD
	inc hl
	ld [hl], d ; MAPOBJECT_X_COORD
	inc hl
	ld [hl], SPRITEMOVEDATA_WILDSPAWN ; MAPOBJECT_MOVEMENT
	inc hl
	ld [hl], WILD_SPAWN_RADIUS ; MAPOBJECT_RADIUS
	inc hl
	ld [hl], 0 ; MAPOBJECT_PALETTE (the species' colors)
	inc hl
	ld [hl], -1 ; MAPOBJECT_TIMEOFDAY (always)
	inc hl
	ld [hl], OBJECTTYPE_WILDSPAWN ; MAPOBJECT_TYPE
	inc hl
	ld [hl], 0 ; MAPOBJECT_SIGHT_RANGE
	inc hl
	ld a, [wWildSpawnDVs]
	ld [hli], a ; MAPOBJECT_SPAWN_DVS
	ld a, [wWildSpawnDVs + 1]
	ld [hli], a
	ld a, -1
	ld [hli], a ; MAPOBJECT_EVENT_FLAG (always visible)
	ld [hli], a
	ld a, [wCurPartyLevel]
	ld [hli], a ; MAPOBJECT_SPAWN_LEVEL
	call SetSpawnBehavior
	assert MAPOBJECT_SPAWN_STATE + 1 == MAPOBJECT_LENGTH
; visible
	ld a, [wWildSpawnSlot]
	ld e, a
	ld d, 0
	ld hl, wObjectMasks
	add hl, de
	ld [hl], 0
	ret

SetSpawnBehavior:
; Give the spawn of wTempWildMonSpecies whose MAPOBJECT_SPAWN_STATE is at hl
; one of its two behaviors (at random) and its modifiers. Nocturnal ones are
; sleepy in the morning and day, diurnal ones in the evening and at night.
	push bc
	push hl
	ld a, [wTempWildMonSpecies]
	call GetPokemonIndexFromID
	add hl, hl
	ld de, OverworldBehaviors
	add hl, de
	ld a, BANK(OverworldBehaviors)
	call GetFarWord ; l = behaviors, h = modifiers
	ld d, h
	call Random
	rrca
	ld a, l
	jr nc, .first
	swap a
.first
	and WILDSPAWN_BEHAVIOR_MASK
	ld e, a
	ld a, [wTimeOfDay]
	cp EVE_F
	ld a, OW_NOCTURNAL
	jr c, .got_asleep
	ld a, OW_DIURNAL
.got_asleep
	and d
	jr z, .awake
	ld e, OW_SLEEPY
.awake
	pop hl
	ld [hl], e
	ld a, d
	ld de, MAPOBJECT_SPAWN_MODS - MAPOBJECT_SPAWN_STATE
	add hl, de
	ld [hl], a
	pop bc
	ret

ClearWildSpawns::
; Continue: the saved map objects may hold spawns of a map visit that's over
; (their species slots aren't saved): remove them.
; After a warp, the slots past the new map's objects keep the previous map's
; type and object struct id, with no sprite: only their type is reset, since
; that struct id may now belong to another object (DeleteObjectStruct would
; take the player's map object off its struct, and the follower couldn't
; start following).
	ld a, FIRST_SPAWN_OBJECT
.loop
	push af
	call GetMapObject
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld a, [hl]
	cp OBJECTTYPE_WILDSPAWN
	jr nz, .next
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .remove
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld [hl], OBJECTTYPE_SCRIPT
	jr .next

.remove
	pop af
	push af
	call RemoveWildSpawn
.next
	pop af
	inc a
	cp LAST_SPAWN_OBJECT + 1
	jr c, .loop
	xor a
	ld [wWildSpawnBattle], a
	ld [wWildSpawnTouched], a
	ld [wWildSpawnSpotted], a
	ret

RemoveWildSpawn:
; a = map object: delete its object struct and free the slot.
	push af
	call DeleteObjectStruct
	pop af
	call GetMapObject
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld [hl], 0
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld [hl], OBJECTTYPE_SCRIPT
	ret

WildSpawnBumpCheck::
; The player bumped into object struct bc: if it's a spawn, remember it for
; CheckWildSpawnTouch.
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	push af
	call GetMapObject
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld a, [hl]
	cp OBJECTTYPE_WILDSPAWN
	jr z, .touched
	call IsStaticWanderer
.touched
	pop bc ; b = map object
	ret nz
	ld a, b
	ld [wWildSpawnTouched], a
	ret

WildSpawnEmote:
; Show the emote a spawn asked for (wSpawnEmoteRequest, wSpawnEmoteKind) over
; it, or take one away when its time is up.
	ld a, [wSpawnEmoteObject]
	and a
	jr z, .request
	ld hl, wSpawnEmoteTimer
	dec [hl]
	ret nz
	xor a
	ld [wSpawnEmoteObject], a
	farjp DeleteEmoteObjects

.request
	ld hl, wSpawnEmoteRequest
	ld a, [hl]
	and a
	ret z
	ld [hl], 0
	ld e, a
	push de
	call GetMapObject
	pop de
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	ret z
	ld d, a
	push de
	call GetObjectStruct
	pop de
	ldh a, [hMapObjectIndex]
	push af
	ld a, e
	ld [wSpawnEmoteObject], a
	ld a, d ; the emote tracks this object struct
	ldh [hMapObjectIndex], a
	push bc
	ld a, [wSpawnEmoteKind]
	ld c, a
	farcall LoadEmote
	pop bc
	farcall SpawnEmoteObject
	pop af
	ldh [hMapObjectIndex], a
	ld a, WILD_SPAWN_EMOTE_FRAMES
	ld [wSpawnEmoteTimer], a
	ret

CheckWildSpawnTouch::
; PlayerEvents: start the battle with a spawn the player walked into (or that
; walked into the player), show the "!" of one that spotted the player, or
; move a teleporter or burrower to a new spot. Returns carry and
; a = PLAYEREVENT_MAPSCRIPT if it does. Also shows or takes away a spawn's
; emote.
	call WildSpawnEmote
	ld hl, wWildSpawnTouched
	ld a, [hl]
	and a
	jr z, .spotted
	ld [hl], 0
	ldh [hLastTalked], a
	call GetMapObject
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld a, [hl]
	cp OBJECTTYPE_WILDSPAWN
	jr nz, .own_script
	ld a, BANK(WildSpawnScript)
	ld hl, WildSpawnScript
	jmp CallScript

.own_script
; a map's own wandering Pokémon: its battle script
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	jmp CallScript

.spotted
	ld hl, wWildSpawnSpotted
	ld a, [hl]
	and a
	jr z, .move
	ld [hl], 0
	ldh [hLastTalked], a
	ld a, BANK(WildSpawnSpottedScript)
	ld hl, WildSpawnSpottedScript
	jmp CallScript

.move
	ld hl, wWildSpawnMove
	ld a, [hl]
	and a
	ret z ; nc
	ld [hl], 0
	ldh [hLastTalked], a
	ld a, BANK(WildSpawnMoveScript)
	ld hl, WildSpawnMoveScript
	jmp CallScript

WildSpawnSpottedScript:
	showemote EMOTE_SHOCK, LAST_TALKED, 15
	end

WildSpawnMoveScript:
	disappear LAST_TALKED
	callasm WildSpawnNewSpot
	appear LAST_TALKED
	end

WildSpawnNewSpot:
; Move spawn hLastTalked to a new spot: anywhere for a teleporter, nearby for
; a burrower (or nowhere, if there's no free spot).
	ldh a, [hLastTalked]
	call GetMapObject
	ld a, WILD_SPAWN_MIN_DISTANCE
	ld [wWildSpawnMinDistance], a
	ld hl, MAPOBJECT_SPAWN_STATE
	add hl, bc
	ld a, [hl]
	and WILDSPAWN_BEHAVIOR_MASK
	cp OW_BURROWER
	jr z, .burrow
	ld de, SFX_WARP_TO
	call PlaySFX
	push bc
	call FindSpawnSpot
	pop bc
	ret c
	jr .write

.burrow
	ld de, SFX_SANDSTORM
	call PlaySFX
	ld a, WILD_SPAWN_BURROW_TRIES
.try
	push af
	push bc
	call FindSpawnSpot
	pop bc
	jr c, .next
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hli]
	sub e
	call .Near
	jr nc, .next
	ld a, [hl] ; MAPOBJECT_X_COORD
	sub d
	call .Near
	jr c, .found
.next
	pop af
	dec a
	jr nz, .try
	ret

.found
	pop af
.write
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d ; MAPOBJECT_X_COORD
	ret

.Near:
; c if |a| <= WILD_SPAWN_BURROW_DISTANCE
	bit 7, a
	jr z, .positive
	cpl
	inc a
.positive
	cp WILD_SPAWN_BURROW_DISTANCE + 1
	ret

WildSpawnScript::
	faceplayer
	callasm WildSpawnLoadBattle
	startbattle
	callasm WildSpawnRemoveLastTalked
	reloadmapafterbattle
	end

WildSpawnLoadBattle:
; Set up a wild battle with the spawn hLastTalked: its species, level and DVs.
	ldh a, [hLastTalked]
	call GetMapObject
	ld hl, MAPOBJECT_SPAWN_LEVEL
	add hl, bc
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld hl, MAPOBJECT_SPAWN_DVS
	add hl, bc
	ld a, [hli]
	ld [wWildSpawnDVs], a
	ld a, [hl]
	ld [wWildSpawnDVs + 1], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	sub SPRITE_MON_1
	add a
	ld e, a
	ld d, 0
	ld hl, wMonSpriteSpecies
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	res 7, h ; the shiny bit
	call GetPokemonIDFromIndex
	ld [wTempWildMonSpecies], a
	ld a, 1 << 7
	ld [wBattleScriptFlags], a
	ld a, BATTLETYPE_NORMAL
	ld [wBattleType], a
	ld a, TRUE
	ld [wWildSpawnBattle], a
	ld a, [wTempWildMonSpecies]
	jmp PlayMonCry

WildSpawnRemoveLastTalked:
	xor a
	ld [wWildSpawnBattle], a
	ldh a, [hLastTalked]
	jp RemoveWildSpawn

WildSpawnBrain::
; Object struct bc, a spawn, decides its next move by its behavior and
; modifiers. Returns a = a direction to step (DOWN, UP, LEFT, RIGHT: 0-3) plus
; its speed (STEP_* << 2), and WILDSPAWN_NO_DETOUR_F to not try sideways; or
; WILDSPAWN_WAIT_SLOW or WILDSPAWN_WAIT_FAST. Walking into the player sets
; wWildSpawnTouched.
	push bc
	call .Think
	pop bc
	ret

.Think:
	ld d, b
	ld e, c ; de = object struct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld [wWildSpawnBrainObject], a
	call GetMapObject ; bc = map object
	call .Stuck
; the map object keeps its position, so it comes back there when it scrolls
; into view again
	ld hl, OBJECT_MAP_X
	add hl, de
	ld a, [hli]
	push af
	ld a, [hl] ; OBJECT_MAP_Y
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld [hli], a
	ld h, a
	ld a, [wPlayerMapY]
	sub h
	ld [wWildSpawnDY], a
	pop af
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld [hl], a
	ld h, a
	ld a, [wPlayerMapX]
	sub h
	ld [wWildSpawnDX], a
	call .Behave
	cp WILDSPAWN_WAIT_SLOW
	ret nc
; Speedy: one speed faster; Sluggish: half its steps are pauses instead
	ld l, a
	call .Mods
	bit OW_SPEEDY_F, a
	jr z, .not_speedy
	ld a, l
	and %1100
	cp STEP_BIKE << 2
	ld a, l
	ret z
	add 1 << 2
	ret

.not_speedy
	bit OW_SLUGGISH_F, a
	ld a, l
	ret z
	call Random
	rrca
	ld a, l
	ret nc
	and %1100
	ld a, WILDSPAWN_WAIT_SLOW
	ret z
	inc a ; WILDSPAWN_WAIT_FAST
	ret

.Behave:
	call .State
	ld a, [hl]
	and WILDSPAWN_BEHAVIOR_MASK
	cp NUM_OW_BEHAVIORS
	jr c, .known
	xor a ; OW_WANDERER
.known
	ld hl, .Behaviors
	jmp JumpTable

.Behaviors:
	table_width 2
	dw .wander      ; OW_WANDERER
	dw .skittish    ; OW_SKITTISH
	dw .aggressive  ; OW_AGGRESSIVE
	dw .sleepy      ; OW_SLEEPY
	dw .curious     ; OW_CURIOUS
	dw .territorial ; OW_TERRITORIAL
	dw .pacer       ; OW_PACER
	dw .lazy        ; OW_LAZY
	dw .mimic       ; OW_MIMIC
	dw .hit_and_run ; OW_HIT_AND_RUN
	dw .hider       ; OW_HIDER
	dw .teleporter  ; OW_TELEPORTER
	dw .burrower    ; OW_BURROWER
	assert_table_length NUM_OW_BEHAVIORS

.wander:
; a random step
	call Random
	and %11
.StepOrTouch:
; a step in direction a; one into the player starts the battle
	ld l, a
	call .Adjacent
	ld a, l
	ret nz
	call .ExactDirectionToPlayer
	cp l
	ld a, l
	ret nz
	jp .Touch

.sleepy:
; still until the player is next to it, then a wanderer; once, its "Zzz"
; when the player comes near
	call .State
	bit WILDSPAWN_ACTIVE_F, [hl]
	jr nz, .wander
	call .Distance
	cp 2
	jr c, .wake
	cp WILD_SPAWN_ZZZ_RANGE + 1
	jr nc, .doze
	bit WILDSPAWN_ONCE_F, [hl]
	jr nz, .doze
	ld a, [wSpawnEmoteObject]
	and a
	jr nz, .doze
	set WILDSPAWN_ONCE_F, [hl]
	ld a, EMOTE_SLEEP
	call .Emote
.doze
	ld a, WILDSPAWN_WAIT_SLOW
	ret

.wake
	set WILDSPAWN_ACTIVE_F, [hl]
; its "Zzz" goes away
	ld a, [wWildSpawnBrainObject]
	ld hl, wSpawnEmoteObject
	cp [hl]
	jr nz, .Watch
	ld a, 1
	ld [wSpawnEmoteTimer], a
.Watch:
; face the player and wait a moment
	call .FacePlayer
	ld a, WILDSPAWN_WAIT_FAST
	ret

.skittish:
; flee from the player within its notice range
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr z, .fast
	ldh a, [hJoyDown]
	bit B_BUTTON_F, a
	ld a, WILD_SPAWN_NOTICE_RANGE
	jr z, .got_range
.fast
	ld a, WILD_SPAWN_NOTICE_RANGE_FAST
.got_range
	call .Within
	jr nc, .wander
.flee
; away along the longer axis, or along the other one (sideways when the
; player is in line): never toward the player
	call .Unbound
	call .ExactDirectionToPlayer
	xor 1 ; away (DOWN <-> UP, LEFT <-> RIGHT)
	ld l, a
	call Random
	cp 60 percent
	ld a, l
	jr c, .flee_done
	ld a, [wWildSpawnDX]
	and a
	jr z, .flee_sideways
	ld a, [wWildSpawnDY]
	and a
	jr z, .flee_sideways
; away along the other axis
	bit 1, l
	jr nz, .flee_vertical ; the longer axis was horizontal
	ld a, [wWildSpawnDX]
	bit 7, a
	ld a, LEFT
	jr z, .flee_done ; the player is to the right
	ld a, RIGHT
	jr .flee_done
.flee_vertical
	ld a, [wWildSpawnDY]
	bit 7, a
	ld a, UP
	jr z, .flee_done ; the player is below
	ld a, DOWN
	jr .flee_done

.flee_sideways
	call Random
	and 1
	add 2
	xor l
.flee_done
	set WILDSPAWN_NO_DETOUR_F, a
	ret

.aggressive:
; sees the player in front of it (within 45 degrees), then gives chase
	call .State
	bit WILDSPAWN_ACTIVE_F, [hl]
	jr nz, .chase
	ld a, WILD_SPAWN_SIGHT_RANGE
	call .Within
	jp nc, .wander
	call .Facing
	jp nz, .wander
	call .Repelled
	jp c, .wander
.Notice:
; it reacts to the player: its "!", and it leaves its wander radius
	set WILDSPAWN_ACTIVE_F, [hl]
	call .Unbound
	ld a, [wWildSpawnBrainObject]
	ld [wWildSpawnSpotted], a
	jp .Watch

.chase
; toward the player, until they get far enough away
	call .Distance
	cp WILD_SPAWN_GIVE_UP_RANGE + 1
	jr nc, .GiveUp
.ChaseStep:
	call .Adjacent
	jp z, .Touch
	call .DirectionToPlayer
	or STEP_WALK << 2
	ret

.GiveUp:
	res WILDSPAWN_ACTIVE_F, [hl]
	res WILDSPAWN_ALT_F, [hl]
	call .Rebind
	ld a, WILDSPAWN_WAIT_SLOW
	ret

.curious:
; comes over to look at the player, keeping a step away; now and then it
; comes all the way and starts the battle
	call .State
	bit WILDSPAWN_ACTIVE_F, [hl]
	jr nz, .curious_active
	ld a, WILD_SPAWN_CURIOUS_RANGE
	call .Within
	jp nc, .wander
	set WILDSPAWN_ACTIVE_F, [hl]
	call .Unbound
	call Random
	cp 17 percent
	jr nc, .look
	call .Repelled
	jr c, .look
	set WILDSPAWN_ALT_F, [hl]
.look
	bit WILDSPAWN_ONCE_F, [hl]
	jp nz, .Watch
	set WILDSPAWN_ONCE_F, [hl]
	ld a, EMOTE_QUESTION
	call .Emote
	jp .Watch

.curious_active
	call .Distance
	cp WILD_SPAWN_GIVE_UP_RANGE + 1
	jr nc, .GiveUp
	bit WILDSPAWN_ALT_F, [hl]
	jr nz, .approach
	cp 2
	jr c, .back_off
	jp z, .Watch
	jp .DirectionToPlayer

.approach
	call .Adjacent
	jp z, .Touch
	jp .DirectionToPlayer

.back_off
	call .ExactDirectionToPlayer
	xor 1
	set WILDSPAWN_NO_DETOUR_F, a
	ret

.territorial:
; chases the player out of the area around its home (where it was placed),
; then goes back there
	call .State
	ld a, WILD_SPAWN_TERRITORY
	call .Range
	inc a
	push hl
	ld l, a
	call .HomeDistance
	cp l
	pop hl
	jr nc, .outside
	res WILDSPAWN_ALT_F, [hl]
	bit WILDSPAWN_ACTIVE_F, [hl]
	jp nz, .ChaseStep
	call .Repelled
	jp c, .wander
	jp .Notice

.outside
	bit WILDSPAWN_ACTIVE_F, [hl]
	jp z, .wander
	bit WILDSPAWN_ALT_F, [hl]
	jr nz, .go_home
	cp WILD_SPAWN_LEASH + 1
	jp c, .ChaseStep
	set WILDSPAWN_ALT_F, [hl]
.go_home
	call .HomeDirection
	ret nc
; home
	call .State
	jp .GiveUp

.pacer:
; back and forth along the way it faces, a few steps each way from its spot
; (and back now and then); when it can't step, back the other way, and when
; it can't go either way, sideways
	call .State
	bit WILDSPAWN_ALT2_F, [hl]
	jr z, .pace_free
	bit WILDSPAWN_ALT_F, [hl]
	set WILDSPAWN_ALT_F, [hl]
	ld a, 1 ; back
	jr z, .pace_turn
	res WILDSPAWN_ALT_F, [hl]
	call Random
	and 1
	add 2 ; sideways
.pace_turn
	push af
	call .FacingDirection
	pop hl
	xor h
	jr .pace_go

.pace_free
	res WILDSPAWN_ALT_F, [hl]
	push bc
	call .FacingDirection
	ld b, a
	call Random
	cp 15 percent
	jr c, .turn_back
	ld hl, OBJECT_MAP_X
	add hl, de
	ld a, [hli]
	ld c, [hl] ; OBJECT_MAP_Y
	ld hl, OBJECT_INIT_X
	add hl, de
	bit 1, b
	jr nz, .got_axis ; LEFT or RIGHT
	inc hl ; OBJECT_INIT_Y
	ld a, c
.got_axis
	sub [hl]
	ld c, a ; steps from its spot, + right or down
	ld a, b
	and a ; DOWN
	jr z, .got_ahead
	cp RIGHT
	jr z, .got_ahead
	xor a
	sub c
	ld c, a
.got_ahead
	bit 7, c
	jr nz, .pace
	ld a, c
	cp WILD_SPAWN_PACE
	jr c, .pace
.turn_back
	ld a, b
	xor 1
	ld b, a
.pace
	ld a, b
	pop bc
.pace_go
	call .StepOrTouch
	cp WILDSPAWN_WAIT_SLOW
	ret nc
	set WILDSPAWN_NO_DETOUR_F, a
	ret

.lazy:
; mostly lies around, turning now and then; rarely a step
	call Random
	cp 12 percent
	jp c, .wander
	cp 40 percent
	ld a, WILDSPAWN_WAIT_SLOW
	ret nc
	call Random
	and %1100
	ld hl, OBJECT_DIRECTION
	add hl, de
	ld [hl], a
	ld a, WILDSPAWN_WAIT_SLOW
	ret

.mimic:
; copies the player's steps when near
	ld a, WILD_SPAWN_MIMIC_RANGE
	call .Within
	jr nc, .mimic_away
	call .Unbound
	ld a, [wPlayerStruct + OBJECT_WALKING]
	cp STANDING
	jp z, .Watch
	and %11
	or (STEP_WALK << 2) | (1 << WILDSPAWN_NO_DETOUR_F)
	ret

.mimic_away
	ld hl, OBJECT_RADIUS
	add hl, de
	ld a, [hl]
	and a
	call z, .Rebind
	jp .wander

.hit_and_run:
; dashes at the player, then backs off; a third of the time it starts the
; battle instead
	call .State
	bit WILDSPAWN_ACTIVE_F, [hl]
	jr nz, .hit_active
	ld a, WILD_SPAWN_DASH_RANGE
	call .Within
	jp nc, .wander
	call .Repelled
	jp c, .wander
	set WILDSPAWN_ACTIVE_F, [hl]
	call .Unbound
	jp .Watch

.hit_active
	call .Distance
	cp WILD_SPAWN_GIVE_UP_RANGE + 1
	jp nc, .GiveUp
	bit WILDSPAWN_ALT_F, [hl]
	jr nz, .retreat
	call .Adjacent
	jr nz, .dash
	call Random
	cp 33 percent
	jp c, .Touch
	set WILDSPAWN_ALT_F, [hl]
	jp .Watch

.dash
	call .DirectionToPlayer
	or STEP_RUN << 2
	ret

.retreat
	cp WILD_SPAWN_DASH_RANGE + 1
	jr c, .retreat_step
	res WILDSPAWN_ALT_F, [hl]
	jp .Watch

.retreat_step
	call .ExactDirectionToPlayer
	xor 1
	or STEP_WALK << 2
	ret

.hider:
; unseen until the player comes close; then it flees or gives chase
	call .State
	bit WILDSPAWN_ACTIVE_F, [hl]
	jr nz, .revealed
	ld a, WILD_SPAWN_HIDE_RANGE
	call .Within
	jr c, .reveal
	ld hl, OBJECT_FLAGS1
	add hl, de
	set INVISIBLE_F, [hl]
	ld a, WILDSPAWN_WAIT_FAST
	ret

.reveal
	call Random
	rrca
	jr c, .reveal_flee
	call .Repelled
	jr nc, .shown
.reveal_flee
	set WILDSPAWN_ALT_F, [hl]
.shown
	push hl
	ld hl, OBJECT_FLAGS1
	add hl, de
	res INVISIBLE_F, [hl]
	pop hl
	jp .Notice

.revealed
	bit WILDSPAWN_ALT_F, [hl]
	jp nz, .flee
	jp .chase

.burrower:
; burrows away once when the player comes close, coming up nearby
	ld a, WILD_SPAWN_BURROW_RANGE
	jr .move_away

.teleporter:
; teleports away once when the player comes close
	ld a, WILD_SPAWN_TELEPORT_RANGE
.move_away
	call .Within
	jp nc, .wander
	call .State
	bit WILDSPAWN_ONCE_F, [hl]
	jp nz, .wander
	ld a, [wWildSpawnMove]
	and a
	jp nz, .wander
	set WILDSPAWN_ONCE_F, [hl]
	ld a, [wWildSpawnBrainObject]
	ld [wWildSpawnMove], a
	jp .Watch

.Touch:
; walk into the player: the battle starts (once the player stands still);
; Timid ones don't
	call .FacePlayer
	call .Mods
	bit OW_TIMID_F, a
	jr nz, .wait
	ld hl, wPlayerStruct + OBJECT_WALKING
	ld a, [hl]
	cp STANDING
	jr nz, .wait
	ld a, [wWildSpawnTouched]
	and a
	jr nz, .wait
	ld a, [wWildSpawnBrainObject]
	ld [wWildSpawnTouched], a
.wait
	ld a, WILDSPAWN_WAIT_FAST
	ret

.State:
; hl = its MAPOBJECT_SPAWN_STATE
	ld hl, MAPOBJECT_SPAWN_STATE
	add hl, bc
	ret

.Mods:
; a = its modifiers
	push hl
	ld hl, MAPOBJECT_SPAWN_MODS
	add hl, bc
	ld a, [hl]
	pop hl
	ret

.Range:
; a = range a, for its modifiers
	push hl
	ld l, a
	call .Mods
	bit OW_BOLD_F, a
	jr z, .not_bold
	inc l
	inc l
.not_bold
	bit OW_TIMID_F, a
	jr z, .not_timid
	dec l
.not_timid
	ld a, l
	pop hl
	ret

.Within:
; c if the player is within range a (for its modifiers)
	call .Range
	push hl
	inc a
	ld l, a
	call .Distance
	cp l
	pop hl
	ret

.Repelled:
; c if a Repel keeps it from starting a battle: it's weaker than the lead,
; and not Bold
	ld a, [wRepelEffect]
	and a
	ret z
	call .Mods
	and OW_BOLD
	ret nz
	push hl
	ld hl, MAPOBJECT_SPAWN_LEVEL
	add hl, bc
	ld a, [wPartyMon1Level]
	dec a
	cp [hl] ; nc if the lead is stronger
	ccf
	pop hl
	ret

.Facing:
; z if the player is in front of it (within 45 degrees)
	push bc
	call .FacingDirection
	ld b, a
	call .ExactDirectionToPlayer
	cp b
	pop bc
	ret

.FacingDirection:
; a = the direction it faces
	push hl
	ld hl, OBJECT_DIRECTION
	add hl, de
	ld a, [hl]
	rrca
	rrca
	and %11
	pop hl
	ret

.Stuck:
; WILDSPAWN_ALT2_F: it hasn't moved since it last decided (its map object
; still has its position)
	ld hl, OBJECT_MAP_X
	add hl, de
	ld a, [hli]
	push hl
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	cp [hl]
	pop hl
	jr nz, .moved
	ld a, [hl] ; OBJECT_MAP_Y
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	cp [hl]
	jr nz, .moved
	call .State
	set WILDSPAWN_ALT2_F, [hl]
	ret

.moved
	call .State
	res WILDSPAWN_ALT2_F, [hl]
	ret

.Emote:
; ask for emote a over it (WildSpawnEmote)
	ld [wSpawnEmoteKind], a
	ld a, [wWildSpawnBrainObject]
	ld [wSpawnEmoteRequest], a
	ret

.HomeDistance:
; a = how far the player is from its home (OBJECT_INIT_X, OBJECT_INIT_Y)
	push hl
	push bc
	ld hl, OBJECT_INIT_X
	add hl, de
	ld a, [wPlayerMapX]
	sub [hl]
	call .Abs
	ld b, a
	inc hl ; OBJECT_INIT_Y
	ld a, [wPlayerMapY]
	sub [hl]
	call .Abs
	cp b
	jr nc, .got_home_distance
	ld a, b
.got_home_distance
	pop bc
	pop hl
	ret

.HomeDirection:
; a = the direction toward its home, or carry if it's there
	push bc
	ld hl, OBJECT_MAP_X
	add hl, de
	ld a, [hli]
	ld c, [hl] ; OBJECT_MAP_Y
	ld hl, OBJECT_INIT_X
	add hl, de
	ld b, a
	ld a, [hli]
	sub b
	ld b, a ; home x - x
	ld a, [hl] ; OBJECT_INIT_Y
	sub c
	ld c, a ; home y - y
	or b
	scf
	jr z, .home_done
	ld a, b
	call .Abs
	ld h, a
	ld a, c
	call .Abs
	cp h
	jr c, .home_x
	bit 7, c
	ld a, DOWN
	jr z, .home_done_nc
	ld a, UP
	jr .home_done_nc
.home_x
	bit 7, b
	ld a, RIGHT
	jr z, .home_done_nc
	ld a, LEFT
.home_done_nc
	and a
.home_done
	pop bc
	ret

.Rebind:
; it wanders around the spot it's on again
	push hl
	ld hl, OBJECT_MAP_X
	add hl, de
	ld a, [hli]
	push af
	ld a, [hl] ; OBJECT_MAP_Y
	ld hl, OBJECT_INIT_Y
	add hl, de
	ld [hld], a
	pop af
	ld [hl], a ; OBJECT_INIT_X
	ld hl, OBJECT_RADIUS
	add hl, de
	ld [hl], WILD_SPAWN_RADIUS
	ld hl, OBJECT_FLAGS1
	add hl, de
	res MOVE_ANYWHERE_F, [hl]
	pop hl
	ret

.FacePlayer:
	call .ExactDirectionToPlayer
	add a
	add a
	ld hl, OBJECT_DIRECTION
	add hl, de
	ld [hl], a
	ret

.Unbound:
; leave its wander radius and the screen
	push hl
	ld hl, OBJECT_RADIUS
	add hl, de
	ld [hl], 0
	ld hl, OBJECT_FLAGS1
	add hl, de
	set MOVE_ANYWHERE_F, [hl]
	pop hl
	ret

.Abs:
	bit 7, a
	ret z
	cpl
	inc a
	ret

.Distance:
; a = the larger of |dx| and |dy|
	push bc
	ld a, [wWildSpawnDX]
	call .Abs
	ld b, a
	ld a, [wWildSpawnDY]
	call .Abs
	cp b
	jr nc, .got_distance
	ld a, b
.got_distance
	pop bc
	ret

.Adjacent:
; z if the player is on a tile next to it
	push bc
	ld a, [wWildSpawnDX]
	call .Abs
	ld b, a
	ld a, [wWildSpawnDY]
	call .Abs
	add b
	pop bc
	cp 1
	ret

.DirectionToPlayer:
; a = the direction toward the player along the longer axis (a quarter of the
; time along the other one, or sideways, to get around obstacles)
	push bc
	ld a, [wWildSpawnDX]
	call .Abs
	ld b, a
	ld a, [wWildSpawnDY]
	call .Abs
	ld c, a ; b = |dx|, c = |dy|
	call Random
	cp 25 percent
	jr c, .other_axis
	ld a, b
	cp c
	jr nc, .horizontal
	jr .vertical

.other_axis
	ld a, b
	cp c
	jr c, .horizontal
	; the vertical axis; sideways (a random one) if the player is in line
	ld a, c
	and a
	jr nz, .vertical
	call Random
	rrca
	ld a, DOWN
	jr c, .dir_done
	ld a, UP
	jr .dir_done

.vertical
	ld a, [wWildSpawnDY]
	bit 7, a
	ld a, DOWN
	jr z, .dir_done
	ld a, UP
	jr .dir_done
.horizontal
	ld a, [wWildSpawnDX]
	and a
	jr nz, .left_right
	call Random ; sideways: a random one
.left_right
	bit 7, a
	ld a, RIGHT
	jr z, .dir_done
	ld a, LEFT
.dir_done
	pop bc
	ret

.ExactDirectionToPlayer:
; a = the direction toward the player along the longer axis
	push bc
	ld a, [wWildSpawnDX]
	call .Abs
	ld b, a
	ld a, [wWildSpawnDY]
	call .Abs
	cp b
	jr nc, .exact_vertical
	ld a, [wWildSpawnDX]
	bit 7, a
	ld a, RIGHT
	jr z, .dir_done
	ld a, LEFT
	jr .dir_done
.exact_vertical
	ld a, [wWildSpawnDY]
	bit 7, a
	ld a, DOWN
	jr z, .dir_done
	ld a, UP
	jr .dir_done
