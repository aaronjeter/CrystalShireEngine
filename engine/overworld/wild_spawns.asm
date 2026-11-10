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

DEF WILD_SPAWN_NOTICE_RANGE EQU 3 ; skittish: steps
DEF WILD_SPAWN_NOTICE_RANGE_FAST EQU 5 ; skittish, when the player runs or bikes
DEF WILD_SPAWN_SIGHT_RANGE EQU 4 ; aggressive: steps in a straight line
DEF WILD_SPAWN_ZZZ_RANGE EQU 4 ; sleepy: steps from the player that show its "Zzz" once
DEF WILD_SPAWN_ZZZ_FRAMES EQU 90

SpawnWildMons::
	call InitStaticWanderers
	xor a
	ld [wSpawnZzzRequest], a
	ld [wSpawnZzzObject], a
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
	call GetSpawnTemperament
	pop bc
	ld hl, MAPOBJECT_SPAWN_STATE
	add hl, bc
	ld [hld], a
	push hl
	call StaticWandererLevel
	pop hl
	ld [hl], a ; MAPOBJECT_SPAWN_LEVEL
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
	call GetSpawnTemperament
	ld [hl], a ; MAPOBJECT_SPAWN_STATE
	assert MAPOBJECT_SPAWN_STATE + 1 == MAPOBJECT_LENGTH
; visible
	ld a, [wWildSpawnSlot]
	ld e, a
	ld d, 0
	ld hl, wObjectMasks
	add hl, de
	ld [hl], 0
	ret

GetSpawnTemperament:
; a = the temperament of wTempWildMonSpecies, from one of its types (at random)
	push hl
	ld a, [wTempWildMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	call Random
	rrca
	ld a, [wBaseType1]
	jr nc, .got_type
	ld a, [wBaseType2]
.got_type
	ld e, a
	ld d, 0
	ld hl, SpawnTemperaments
	add hl, de
	ld a, [hl]
	pop hl
	ret

SpawnTemperaments:
; indexed by type
	table_width 1
	db WILDSPAWN_WANDERER   ; NORMAL
	db WILDSPAWN_AGGRESSIVE ; FIGHTING
	db WILDSPAWN_SKITTISH   ; FLYING
	db WILDSPAWN_WANDERER   ; POISON
	db WILDSPAWN_WANDERER   ; GROUND
	db WILDSPAWN_SLEEPY     ; ROCK
	db WILDSPAWN_WANDERER   ; BIRD
	db WILDSPAWN_WANDERER   ; BUG
	db WILDSPAWN_AGGRESSIVE ; GHOST
	db WILDSPAWN_SLEEPY     ; STEEL
	ds UNUSED_TYPES_END - UNUSED_TYPES, WILDSPAWN_WANDERER
	db WILDSPAWN_AGGRESSIVE ; FIRE
	db WILDSPAWN_WANDERER   ; WATER
	db WILDSPAWN_WANDERER   ; GRASS
	db WILDSPAWN_SKITTISH   ; ELECTRIC
	db WILDSPAWN_SKITTISH   ; PSYCHIC_TYPE
	db WILDSPAWN_WANDERER   ; ICE
	db WILDSPAWN_AGGRESSIVE ; DRAGON
	db WILDSPAWN_AGGRESSIVE ; DARK
	db WILDSPAWN_SKITTISH   ; FAIRY
	assert_table_length TYPES_END

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

WildSpawnZzz:
; Show the "Zzz" a sleepy spawn asked for (wSpawnZzzRequest) over it, or take
; one away when its time is up.
	ld a, [wSpawnZzzObject]
	and a
	jr z, .request
	ld hl, wSpawnZzzTimer
	dec [hl]
	ret nz
	xor a
	ld [wSpawnZzzObject], a
	farjp DeleteEmoteObjects

.request
	ld hl, wSpawnZzzRequest
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
	ld hl, MAPOBJECT_SPAWN_STATE
	add hl, bc
	bit WILDSPAWN_AWAKE_F, [hl]
	ret nz
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
	ld [wSpawnZzzObject], a
	ld a, d ; the emote tracks this object struct
	ldh [hMapObjectIndex], a
	push bc
	ld c, EMOTE_SLEEP
	farcall LoadEmote
	pop bc
	farcall SpawnEmoteObject
	pop af
	ldh [hMapObjectIndex], a
	ld a, WILD_SPAWN_ZZZ_FRAMES
	ld [wSpawnZzzTimer], a
	ret

CheckWildSpawnTouch::
; PlayerEvents: start the battle with a spawn the player walked into (or that
; walked into the player), or show the "!" of one that spotted the player.
; Returns carry and a = PLAYEREVENT_MAPSCRIPT if it does. Also shows or takes
; away a sleepy spawn's "Zzz".
	call WildSpawnZzz
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
	ret z ; nc
	ld [hl], 0
	ldh [hLastTalked], a
	ld a, BANK(WildSpawnSpottedScript)
	ld hl, WildSpawnSpottedScript
	jmp CallScript

WildSpawnSpottedScript:
	showemote EMOTE_SHOCK, LAST_TALKED, 15
	end

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
; Object struct bc, a spawn, decides its next move. Returns a = a direction
; to step (DOWN, UP, LEFT, RIGHT: 0-3), WILDSPAWN_WAIT_SLOW or
; WILDSPAWN_WAIT_FAST. Walking into the player sets wWildSpawnTouched.
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
	ld hl, MAPOBJECT_SPAWN_STATE
	add hl, bc
	ld a, [hl]
	and WILDSPAWN_TEMPERAMENT_MASK
	cp WILDSPAWN_SKITTISH
	jr z, .skittish
	cp WILDSPAWN_AGGRESSIVE
	jp z, .aggressive
	cp WILDSPAWN_SLEEPY
	jr nz, .wander
; sleepy: still until the player is next to it; once, its "Zzz" when the
; player comes near
	bit WILDSPAWN_AWAKE_F, [hl]
	jr nz, .wander
	call .Distance
	cp 2
	jr c, .wake
	cp WILD_SPAWN_ZZZ_RANGE + 1
	jr nc, .doze
	bit WILDSPAWN_ZZZ_F, [hl]
	jr nz, .doze
	ld a, [wSpawnZzzObject]
	and a
	jr nz, .doze
	set WILDSPAWN_ZZZ_F, [hl]
	ld a, [wWildSpawnBrainObject]
	ld [wSpawnZzzRequest], a
.doze
	ld a, WILDSPAWN_WAIT_SLOW
	ret

.wake
	set WILDSPAWN_AWAKE_F, [hl]
; its "Zzz" goes away
	ld a, [wWildSpawnBrainObject]
	push hl
	ld hl, wSpawnZzzObject
	cp [hl]
	pop hl
	jr nz, .no_zzz
	ld a, 1
	ld [wSpawnZzzTimer], a
.no_zzz
	call .FacePlayer
	ld a, WILDSPAWN_WAIT_FAST
	ret

.wander
; a random step; one into the player starts the battle
	call Random
	and %11
	push af
	call .Adjacent
	jr nz, .no_touch
	call .ExactDirectionToPlayer
	ld b, a
	pop af
	cp b
	jr nz, .random_step
	jp .Touch

.no_touch
	pop af
.random_step
	ret

.skittish
; flee from the player within its notice range
	ld b, WILD_SPAWN_NOTICE_RANGE
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr z, .fast
	ldh a, [hJoyDown]
	bit B_BUTTON_F, a
	jr z, .got_range
.fast
	ld b, WILD_SPAWN_NOTICE_RANGE_FAST
.got_range
	call .Distance
	cp b
	jr z, .flee
	jr nc, .wander
.flee
; away along the longer axis, or along the other one (sideways when the
; player is in line): never toward the player
	call .Unbound
	call .ExactDirectionToPlayer
	xor 1 ; away (DOWN <-> UP, LEFT <-> RIGHT)
	ld b, a
	call Random
	cp 60 percent
	ld a, b
	jr c, .flee_done
	ld a, [wWildSpawnDX]
	and a
	jr z, .flee_sideways
	ld a, [wWildSpawnDY]
	and a
	jr z, .flee_sideways
; away along the other axis
	bit 1, b
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
	xor b
.flee_done
	set WILDSPAWN_NO_DETOUR_F, a
	ret

.aggressive
	bit WILDSPAWN_CHARGING_F, [hl]
	jr nz, .charge
; does it see the player? In a straight line, facing them, within range
	ld a, [wWildSpawnDX]
	and a
	jr z, .in_line
	ld a, [wWildSpawnDY]
	and a
	jp nz, .wander
.in_line
	call .Distance
	and a
	jp z, .wander
	cp WILD_SPAWN_SIGHT_RANGE + 1
	jp nc, .wander
	push hl
	push bc
	ld hl, OBJECT_DIRECTION
	add hl, de
	ld a, [hl]
	rrca
	rrca
	and %11
	ld b, a
	call .ExactDirectionToPlayer
	cp b
	pop bc
	pop hl
	jp nz, .wander
; with a Repel, weaker ones than the lead don't charge
	ld a, [wRepelEffect]
	and a
	jr z, .spotted
	push hl
	ld hl, MAPOBJECT_SPAWN_LEVEL
	add hl, bc
	ld a, [wPartyMon1Level]
	cp [hl]
	pop hl
	jr z, .spotted
	jp nc, .wander
.spotted
	set WILDSPAWN_CHARGING_F, [hl]
	ld a, [wWildSpawnBrainObject]
	ld [wWildSpawnSpotted], a
	ld a, WILDSPAWN_WAIT_FAST
	ret

.charge
	call .Adjacent
	jr z, .touch_now
	call .Unbound
	jr .DirectionToPlayer

.touch_now

.Touch:
; walk into the player: the battle starts (once the player stands still)
	call .FacePlayer
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
