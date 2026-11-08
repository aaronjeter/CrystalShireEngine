DoPlayerMovement::
	call .GetDPad
	ld a, movement_step_sleep
	ld [wMovementAnimation], a
	xor a
	ld [wWalkingIntoEdgeWarp], a
	call .TranslateIntoMovement
	ld c, a
	ld a, [wMovementAnimation]
	ld [wPlayerNextMovement], a
	ret

.GetDPad:
	ldh a, [hJoyDown]
	ld [wCurInput], a

; Standing downhill instead moves down.

	ld hl, wBikeFlags
	bit BIKEFLAGS_DOWNHILL_F, [hl]
	ret z

	ld c, a
	and D_PAD
	ret nz

	ld a, c
	or D_DOWN
	ld [wCurInput], a
	ret

.TranslateIntoMovement:
	if DEF(_DEBUG)
	ld a, [wCurInput]
	or ~(A_BUTTON | B_BUTTON)
	inc a
	jr nz, .regular_move
	call .GetAction
	ld a, [wWalkingTileCollision]
	cp -1
	ld a, STEP_BACK_LEDGE
	jr z, .hopback
	ld a, STEP_RUN
.hopback
	call .DoStep
	scf
	ret
.regular_move
endc
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr z, .Normal
	cp PLAYER_SURF
	jr z, .Surf
	cp PLAYER_SURF_PIKA
	jr z, .Surf
	cp PLAYER_BIKE
	jr z, .Normal
	cp PLAYER_SKATE
	jr z, .Ice

.Normal:
	call .CheckForced
	call .DiagonalGrace
	ret c
	call .GetAction
	call .CheckTile
	ret c
	call .TryDiagonal
	ret c
; Walk off in a new direction without turning first; turn in place only
; when the way is blocked (to face a wall, sign or person).
	call .TryStep
	ret c
	call .CheckTurning
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	jr .NotMoving

.Surf:
	call .CheckForced
	call .DiagonalGrace
	ret c
	call .GetAction
	call .CheckTile
	ret c
	call .TryDiagonal
	ret c
	call .CheckTurning
	ret c
	call .TrySurf
	ret c
	jr .NotMoving

.Ice:
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TryStep
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	ld a, [wWalkingDirection]
	cp STANDING
	call nz, .BumpSound
	call .StandInPlace
	xor a
	ret

.NotMoving:
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .Standing

; Walking into an edge warp won't bump.
	ld a, [wWalkingIntoEdgeWarp]
	and a
	call z, .BumpSound
	call ._WalkInPlace
	xor a
	ret

.Standing:
	call .StandInPlace
	xor a
	ret

.CheckTile:
; Tiles such as waterfalls and warps move the player
; in a given direction, overriding input.

	ld a, [wPlayerTileCollision]
	ld c, a
	call CheckWhirlpoolTile
	jr c, .not_whirlpool
	ld a, PLAYERMOVEMENT_FORCE_TURN
	scf
	ret

.not_whirlpool
	and $f0
	cp HI_NYBBLE_CURRENT
	jr z, .water
	cp HI_NYBBLE_WALK
	jr z, .land1
	cp HI_NYBBLE_WALK_ALT
	jr z, .land2
	cp HI_NYBBLE_WARPS
	jr z, .warps
	jr .no_walk

.water
	ld a, c
	maskbits NUM_DIRECTIONS
	ld c, a
	ld b, 0
	ld hl, .water_table
	add hl, bc
	ld a, [hl]
	ld [wWalkingDirection], a
	jr .continue_walk

.water_table
	db RIGHT ; COLL_WATERFALL_RIGHT
	db LEFT  ; COLL_WATERFALL_LEFT
	db UP    ; COLL_WATERFALL_UP
	db DOWN  ; COLL_WATERFALL

.land1
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land1_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .no_walk
	ld [wWalkingDirection], a
	jr .continue_walk

.land1_table
	db STANDING ; COLL_BRAKE
	db RIGHT    ; COLL_WALK_RIGHT
	db LEFT     ; COLL_WALK_LEFT
	db UP       ; COLL_WALK_UP
	db DOWN     ; COLL_WALK_DOWN
	db STANDING ; COLL_BRAKE_45
	db STANDING ; COLL_BRAKE_46
	db STANDING ; COLL_BRAKE_47

.land2
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land2_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .no_walk
	ld [wWalkingDirection], a
	jr .continue_walk

.land2_table
	db RIGHT    ; COLL_WALK_RIGHT_ALT
	db LEFT     ; COLL_WALK_LEFT_ALT
	db UP       ; COLL_WALK_UP_ALT
	db DOWN     ; COLL_WALK_DOWN_ALT
	db STANDING ; COLL_BRAKE_ALT
	db STANDING ; COLL_BRAKE_55
	db STANDING ; COLL_BRAKE_56
	db STANDING ; COLL_BRAKE_57

.warps
	ld a, c
	cp COLL_DOOR
	jr z, .down
	cp COLL_DOOR_79
	jr z, .down
	cp COLL_STAIRCASE
	jr z, .down
	cp COLL_CAVE
	jr nz, .no_walk

.down
	ld a, DOWN
	ld [wWalkingDirection], a
	jr .continue_walk

.no_walk
	xor a
	ret

.continue_walk
	ld a, STEP_WALK
	call .DoStep
	ld a, PLAYERMOVEMENT_CONTINUE
	scf
	ret

.DiagonalGrace:
; Starting from a standstill with one direction held, wait a few frames
; before stepping straight: the second direction of a diagonal is rarely
; pressed on exactly the same frame. Meanwhile the player turns to face the
; direction at once, so a short tap still turns (to talk, surf, etc.).
; Return carry while waiting.
	ld hl, wDiagonalGrace
	ld a, [wInputType]
	cp AUTO_INPUT
	jr z, .grace_reset ; scripted input (e.g. the step onto the water after Surf)
	ld a, [wPlayerTurningDirection]
	and a
	jr nz, .grace_reset ; already walking
	ld a, [wCurInput]
	and D_PAD
	jr z, .grace_reset
	ld b, a
	dec a
	and b
	jr nz, .grace_reset ; two or more directions: no need to wait
	ld a, [hl]
	cp DIAGONAL_GRACE_FRAMES
	ret nc
	inc [hl]
; face the held direction
	ld e, DOWN
	bit D_DOWN_F, b
	jr nz, .grace_got_dir
	inc e ; UP
	bit D_UP_F, b
	jr nz, .grace_got_dir
	inc e ; LEFT
	bit D_LEFT_F, b
	jr nz, .grace_got_dir
	inc e ; RIGHT
.grace_got_dir
	ld a, [wPlayerDirection]
	rrca
	rrca
	maskbits NUM_DIRECTIONS
	cp e
	jr z, .grace_wait
	ld a, e
	or movement_turn_head
	ld [wMovementAnimation], a
.grace_wait
	ld a, PLAYERMOVEMENT_NORMAL
	scf
	ret

.grace_reset
	xor a
	ld [hl], a
	ret

.TryDiagonal:
; With a vertical and a horizontal direction held, step diagonally when the
; current tile, the two tiles beside the way and the destination are all
; plain floor or grass (plain water when surfing), nobody stands on them and no coord event would be
; skipped. Otherwise walk along whichever of the two ways is open.
	ld a, [wCurInput]
	and D_UP | D_DOWN
	ret z
	cp D_UP | D_DOWN
	ret z
	ld a, [wCurInput]
	and D_LEFT | D_RIGHT
	ret z
	cp D_LEFT | D_RIGHT
	ret z

	ld b, LEFT
	bit D_RIGHT_F, a
	jr z, .got_x
	ld b, RIGHT
.got_x
	ld c, UP
	ld a, [wCurInput]
	bit D_DOWN_F, a
	jr z, .got_y
	ld c, DOWN
.got_y
	ld a, b
	ld [wDiagonalX], a
	ld a, c
	ld [wDiagonalY], a

; The main (facing) direction: the current facing if it's one of the two,
; else the vertical one.
	ld a, [wPlayerDirection]
	rrca
	rrca
	maskbits NUM_DIRECTIONS
	cp b
	jr z, .got_main
	cp c
	jr z, .got_main
	ld a, c
.got_main
	ld [wDiagonalMain], a

	call CheckStandingOnIce
	jp c, .walk_straight
	ld a, [wPlayerTileCollision]
	call .IsDiagonalTile
	jp nz, .walk_straight

; walls on the current tile's edges
	ld a, [wDiagonalX]
	call .DirectionMask
	ld b, a
	ld a, [wDiagonalY]
	call .DirectionMask
	or b
	ld b, a
	ld a, [wTilePermissions]
	and b
	jp nz, .walk_straight

; the tiles beside the way
	ld a, [wDiagonalX]
	call .NeighborTile
	call .IsDiagonalTile
	jp nz, .walk_straight
	ld a, [wDiagonalY]
	call .NeighborTile
	call .IsDiagonalTile
	jp nz, .walk_straight

; stay inside the map (no connections or edge warps)
	ld a, [wDiagonalX]
	call .DirectionDelta
	ld hl, wXCoord
	add [hl]
	ld d, a
	ld a, [wMapWidth]
	add a
	ld e, a
	ld a, d
	cp e
	jp nc, .walk_straight
	ld a, [wDiagonalY]
	call .DirectionDelta
	ld hl, wYCoord
	add [hl]
	ld d, a
	ld a, [wMapHeight]
	add a
	ld e, a
	ld a, d
	cp e
	jp nc, .walk_straight

; the destination tile, then objects there and beside the way
	call .DiagonalCoords
	push de
	call GetCoordTileCollision
	pop de
	call .IsDiagonalTile
	jp nz, .walk_straight
	call .IsBlockingObjectAt
	jp c, .walk_straight
	call .DiagonalCoords
	ld a, [wPlayerMapY]
	ld e, a
	push de
	call .IsBlockingObjectAt
	pop de
	jr c, .walk_straight
	call .IsCoordEventAt
	jr c, .walk_straight
	call .DiagonalCoords
	ld a, [wPlayerMapX]
	ld d, a
	push de
	call .IsBlockingObjectAt
	pop de
	jr c, .walk_straight
	call .IsCoordEventAt
	jr c, .walk_straight

; Step. Set up the main direction's walking info first.
	ld a, [wDiagonalMain]
	call .SetInputDirection
	call .GetAction
	call .IsSurfing
	ld a, DIAG_WALK
	jr z, .got_speed
	call .BikeCheck
	ld a, DIAG_BIKE
	jr z, .got_speed
	ld a, [wCurInput]
	and B_BUTTON
	ld a, DIAG_RUN
	jr nz, .got_speed
	ld a, DIAG_WALK
.got_speed
	ld [wDiagonalSpeed], a
	add a
	add a
	add a
	ld b, a
	ld a, [wDiagonalMain]
	ld e, a
	add a
	add b
	ld b, a
; + 1 if the other direction is RIGHT or DOWN
	ld a, e
	cp LEFT
	jr nc, .other_is_y
	ld a, [wDiagonalX]
	cp RIGHT
	jr .add_plus
.other_is_y
	ld a, [wDiagonalY]
	cp DOWN
.add_plus
	ld a, b
	jr nz, .no_plus
	inc a
.no_plus
	add movement_diag_step
	ld [wMovementAnimation], a
	ld a, e
	or $80 ; see .FinishFacing
	ld [wPlayerTurningDirection], a
	ld a, [wDiagonalSpeed]
	cp DIAG_RUN
	call z, CheckTrainerRun
	ld a, PLAYERMOVEMENT_FINISH
	scf
	ret

.walk_straight
; Walk along the main direction if it's open, else along the other one.
	ld a, [wDiagonalMain]
	ld e, a
	call .DirectionMask
	ld b, a
	ld a, [wTilePermissions]
	and b
	jr nz, .take_other
	ld a, e
	call .NeighborTile
	call .CanStepStraightOnto
	jr c, .take_other
	ld a, [wDiagonalMain]
	jr .take
.take_other
	ld a, [wDiagonalMain]
	ld e, a
	ld a, [wDiagonalX]
	cp e
	jr nz, .take
	ld a, [wDiagonalY]
.take
	call .SetInputDirection
	call .GetAction
	xor a
	ret

.SetInputDirection:
; Keep only direction a in wCurInput's D-pad bits.
	ld e, a
	ld d, 0
	ld hl, .forced_dpad
	add hl, de
	ld a, [wCurInput]
	and BUTTONS
	or [hl]
	ld [wCurInput], a
	ret

.DiagonalCoords:
; de = the destination's object coords
	ld a, [wDiagonalX]
	call .DirectionDelta
	ld hl, wPlayerMapX
	add [hl]
	ld d, a
	ld a, [wDiagonalY]
	call .DirectionDelta
	ld hl, wPlayerMapY
	add [hl]
	ld e, a
	ret

.DirectionDelta:
; a = -1 for UP or LEFT, 1 for DOWN or RIGHT
	cp UP
	jr z, .minus
	cp LEFT
	jr z, .minus
	ld a, 1
	ret
.minus
	ld a, -1
	ret

.DirectionMask:
; wTilePermissions bit for direction a
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, .direction_masks
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.direction_masks
	db DOWN_MASK, UP_MASK, LEFT_MASK, RIGHT_MASK

.NeighborTile:
; collision of the tile next to the player in direction a
	ld e, a
	ld d, 0
	ld hl, .neighbor_tiles
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ret

.neighbor_tiles
	dw wTileDown, wTileUp, wTileLeft, wTileRight

.IsDiagonalTile:
; Return z if collision a can be crossed diagonally: any plain land tile
; (collision $00-$1f with land permission: floor, grass, the "garbage" floor
; types some tilesets use), or when surfing any plain water tile ($2x with
; water permission: not whirlpools, currents, waterfalls or buoys).
	push bc
	ld b, a
	call .IsSurfing
	ld a, b
	jr z, .check_water
	cp $20
	jr nc, .not_diagonal_tile
	call GetTilePermission
	cp LAND_TILE
	pop bc
	ret

.check_water
	and $f0
	cp HI_NYBBLE_WATER
	jr nz, .not_diagonal_tile
	ld a, b
	call GetTilePermission
	cp WATER_TILE
	pop bc
	ret

.not_diagonal_tile
	pop bc
	or 1 ; nz
	ret

.IsSurfing:
; Return z if surfing.
	ld a, [wPlayerState]
	cp PLAYER_SURF
	ret z
	cp PLAYER_SURF_PIKA
	ret

.CanStepStraightOnto:
; Return carry if collision a can't be walked onto (or surfed or landed on
; when surfing).
	push bc
	ld b, a
	call .IsSurfing
	ld a, b
	pop bc
	jp z, .CheckSurfable
	jp .CheckWalkable

.IsBlockingObjectAt:
; Return carry if an object other than the player or the following Pokémon
; is at (or stepping from) object coords de.
	xor a
	ldh [hMapObjectIndex], a
	farcall IsNPCAtCoord
	ret nc
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	cp SPRITE_FOLLOWER
	scf
	ret nz
	and a
	ret

.IsCoordEventAt:
; Return carry if any coord event (in any scene) is at object coords de.
	ld a, [wCurMapCoordEventCount]
	and a
	ret z
	ld c, a
	ld a, d
	sub 4
	ld d, a
	ld a, e
	sub 4
	ld e, a
	ld hl, wCurMapCoordEventsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; skip the scene id
.coord_loop
	call GetMapScriptsBank
	call GetFarByte
	cp e
	jr nz, .coord_next
	inc hl
	call GetMapScriptsBank
	call GetFarByte
	dec hl
	cp d
	scf
	ret z
.coord_next
	ld a, COORD_EVENT_SIZE
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	dec c
	jr nz, .coord_loop
	and a
	ret

.CheckTurning:
; If the player is turning, change direction first. This also lets
; the player change facing without moving by tapping a direction.

	ld a, [wPlayerTurningDirection]
	and a
	jr nz, .not_turning
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .not_turning

	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	maskbits NUM_DIRECTIONS
	cp e
	jr z, .not_turning

	ld a, STEP_TURN
	call .DoStep
	ld a, PLAYERMOVEMENT_TURN
	scf
	ret

.not_turning
	xor a
	ret

.TryStep:
; Surfing actually calls .TrySurf directly instead of passing through here.
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .TrySurf
	cp PLAYER_SURF_PIKA
	jr z, .TrySurf

	call .CheckLandPerms
	jr c, .bump

	call .CheckNPC
	and a
	jr z, .bump
	cp 2
	jr z, .bump

	ld a, [wPlayerTileCollision]
	call CheckIceTile
	jr nc, .ice

; Downhill riding is slower when not moving down.
	call .BikeCheck
	jr nz, .walk

	ld hl, wBikeFlags
	bit BIKEFLAGS_DOWNHILL_F, [hl]
	jr z, .fast

	ld a, [wWalkingDirection]
	cp DOWN
	jr z, .fast

	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.fast
	ld a, STEP_BIKE
	call .DoStep
	scf
	ret

.walk
	ld a, [wCurInput]
	and B_BUTTON
	jr nz, .run
	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.ice
	ld a, STEP_ICE
	call .DoStep
	scf
	ret

.run
	ld a, STEP_RUN
	call .DoStep
	push af
	ld a, [wWalkingDirection]
	cp STANDING
	call nz, CheckTrainerRun
	pop af
	scf
	ret

.bump
	xor a
	ret

.TrySurf:
	call .CheckSurfPerms
	push af
	ld [wWalkingIntoLand], a
	ld a, [wPlayerStepType]
	cp STEP_TYPE_TURN
	jr nz, .not_surf_turning
	xor a
	ld [wWalkingIntoLand], a
.not_surf_turning
	pop af
	jr c, .surf_bump

	call .CheckNPC
	ld [wWalkingIntoNPC], a
	and a
	jr z, .surf_bump
	cp 2
	jr z, .surf_bump

	ld a, [wWalkingIntoLand]
	and a
	jr nz, .ExitWater

	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.ExitWater:
	call .GetOutOfWater
	call PlayMapMusic
	ld a, STEP_WALK
	call .DoStep
	ld a, PLAYERMOVEMENT_EXIT_WATER
	scf
	ret

.surf_bump
	xor a
	ret

.TryJump:
	ld a, [wPlayerTileCollision]
	ld e, a
	and $f0
	cp HI_NYBBLE_LEDGES
	jr nz, .DontJump

	ld a, e
	and 7
	ld e, a
	ld d, 0
	ld hl, .ledge_table
	add hl, de
	ld a, [wFacingDirection]
	and [hl]
	jr z, .DontJump

	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ld a, STEP_LEDGE
	call .DoStep
	ld a, PLAYERMOVEMENT_JUMP
	scf
	ret

.DontJump:
	xor a
	ret

.ledge_table
	db FACE_RIGHT             ; COLL_HOP_RIGHT
	db FACE_LEFT              ; COLL_HOP_LEFT
	db FACE_UP                ; COLL_HOP_UP
	db FACE_DOWN              ; COLL_HOP_DOWN
	db FACE_RIGHT | FACE_DOWN ; COLL_HOP_DOWN_RIGHT
	db FACE_DOWN | FACE_LEFT  ; COLL_HOP_DOWN_LEFT
	db FACE_UP | FACE_RIGHT   ; COLL_HOP_UP_RIGHT
	db FACE_UP | FACE_LEFT    ; COLL_HOP_UP_LEFT

.CheckWarp:

	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .not_warp
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [wPlayerTileCollision]
	cp [hl]
	jr nz, .not_warp

	ld a, TRUE
	ld [wWalkingIntoEdgeWarp], a
	ld a, [wWalkingDirection]

	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	maskbits NUM_DIRECTIONS
	cp e
	jr nz, .not_warp
	call WarpCheck
	jr nc, .not_warp
	farcall ResolveConditionalWarp
	jr nc, .not_warp

	call .StandInPlace
	scf
	ld a, PLAYERMOVEMENT_WARP
	ret

.not_warp
	xor a ; PLAYERMOVEMENT_NORMAL
	ret

.EdgeWarps:
	db COLL_WARP_CARPET_DOWN
	db COLL_WARP_CARPET_UP
	db COLL_WARP_CARPET_LEFT
	db COLL_WARP_CARPET_RIGHT

.DoStep:
	cp STEP_TURN
	jr z, .no_bridge_check
	push af
	call CheckBridgeStep
	pop af
.no_bridge_check
	ld e, a
	ld d, 0
	ld hl, .Steps
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wWalkingDirection]
	ld e, a
	cp STANDING
	jr z, .StandInPlace

	add hl, de
	ld a, [hl]
	ld [wMovementAnimation], a

	ld hl, .FinishFacing
	add hl, de
	ld a, [hl]
	ld [wPlayerTurningDirection], a

	ld a, PLAYERMOVEMENT_FINISH
	ret

.Steps:
; entries correspond to STEP_* constants (see constants/map_object_constants.asm)
	table_width 2
	dw .SlowStep
	dw .NormalStep
	dw .RunStep
	dw .BikeStep
	dw .JumpStep
	dw .SlideStep
	dw .TurningStep
	dw .BackJumpStep
	dw .FinishFacing
	assert_table_length NUM_STEPS

.SlowStep:
	slow_step DOWN
	slow_step UP
	slow_step LEFT
	slow_step RIGHT
.NormalStep:
	step DOWN
	step UP
	step LEFT
	step RIGHT
.RunStep:
	big_step DOWN
	big_step UP
	big_step LEFT
	big_step RIGHT
.BikeStep:
	bike_step DOWN
	bike_step UP
	bike_step LEFT
	bike_step RIGHT
.JumpStep:
	jump_step DOWN
	jump_step UP
	jump_step LEFT
	jump_step RIGHT
.SlideStep:
	fast_slide_step DOWN
	fast_slide_step UP
	fast_slide_step LEFT
	fast_slide_step RIGHT
.BackJumpStep:
	jump_step UP
	jump_step DOWN
	jump_step RIGHT
	jump_step LEFT
.TurningStep:
	turn_step DOWN
	turn_step UP
	turn_step LEFT
	turn_step RIGHT
.FinishFacing:
	db $80 | DOWN
	db $80 | UP
	db $80 | LEFT
	db $80 | RIGHT

.StandInPlace:
	xor a
	ld [wPlayerTurningDirection], a
	ld a, movement_step_sleep
	ld [wMovementAnimation], a
	xor a
	ret

._WalkInPlace:
	xor a
	ld [wPlayerTurningDirection], a
	ld a, movement_step_bump
	ld [wMovementAnimation], a
	xor a
	ret

.CheckForced:
; When sliding on ice, input is forced to remain in the same direction.

	call CheckStandingOnIce
	ret nc

	ld a, [wPlayerTurningDirection]
	and a
	ret z

	maskbits NUM_DIRECTIONS
	ld e, a
	ld d, 0
	ld hl, .forced_dpad
	add hl, de
	ld a, [wCurInput]
	and BUTTONS
	or [hl]
	ld [wCurInput], a
	ret

.forced_dpad
	db D_DOWN, D_UP, D_LEFT, D_RIGHT

.GetAction:
; Poll player input and update movement info.

	ld hl, .action_table
	ld de, .action_table_1_end - .action_table_1
	ld a, [wCurInput]
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
; Standing
	jr .update

.d_down
	add hl, de
.d_up
	add hl, de
.d_left
	add hl, de
.d_right
	add hl, de
.update
	ld a, [hli]
	ld [wWalkingDirection], a
	ld a, [hli]
	ld [wFacingDirection], a
	ld a, [hli]
	ld [wWalkingX], a
	ld a, [hli]
	ld [wWalkingY], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld [wWalkingTileCollision], a
	ret

MACRO player_action
; walk direction, facing, x movement, y movement, tile collision pointer
	db \1, \2, \3, \4
	dw \5
ENDM

.action_table:
.action_table_1
	player_action STANDING, FACE_CURRENT, 0,  0, wPlayerTileCollision
.action_table_1_end
	player_action RIGHT,    FACE_RIGHT,   1,  0, wTileRight
	player_action LEFT,     FACE_LEFT,   -1,  0, wTileLeft
	player_action UP,       FACE_UP,      0, -1, wTileUp
	player_action DOWN,     FACE_DOWN,    0,  1, wTileDown

.CheckNPC:
; Returns 0 if there is an NPC in front that you can't move
; Returns 1 if there is no NPC in front
; Returns 2 if there is a movable NPC in front. The game actually treats
; this the same as an NPC in front (bump).
	xor a
	ldh [hMapObjectIndex], a
; Load the next X coordinate into d
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wWalkingX]
	add d
	ld d, a
; Load the next Y coordinate into e
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wWalkingY]
	add e
	ld e, a
; Find an object struct with coordinates equal to d,e
	ld bc, wObjectStructs ; redundant
	farcall IsNPCAtCoord
	jr nc, .no_npc
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	cp SPRITE_FOLLOWER
	jr z, .no_npc ; the player can walk through the following Pokémon
	call .CheckStrengthBoulder
	jr c, .no_bump

	xor a ; bump
	ret

.no_npc
	ld a, 1
	ret

.no_bump
	ld a, 2
	ret

.CheckStrengthBoulder:
	ld hl, wBikeFlags
	bit BIKEFLAGS_STRENGTH_ACTIVE_F, [hl]
	jr z, .not_boulder

	ld hl, OBJECT_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr nz, .not_boulder

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit STRENGTH_BOULDER_F, [hl]
	jr z, .not_boulder

	ld hl, OBJECT_FLAGS2
	add hl, bc
	set BOULDER_MOVING_F, [hl]

	ld a, [wWalkingDirection]
	ld d, a
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and %11111100
	or d
	ld [hl], a

	scf
	ret

.not_boulder
	xor a
	ret

.CheckLandPerms:
; Return 0 if walking onto land and tile permissions allow it.
; Otherwise, return carry.

	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .NotWalkable

	ld a, [wWalkingTileCollision]
	call .CheckWalkable
	jr c, .NotWalkable

	xor a
	ret

.NotWalkable:
	scf
	ret

.CheckSurfPerms:
; Return 0 if moving in water, or 1 if moving onto land.
; Otherwise, return carry.

	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .NotSurfable

	ld a, [wWalkingTileCollision]
	call .CheckSurfable
	jr c, .NotSurfable

	and a
	ret

.NotSurfable:
	scf
	ret

.BikeCheck:
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	ret z
	cp PLAYER_SKATE
	ret

.CheckWalkable:
; Return 0 if tile a is land. Otherwise, return carry.

	call GetTilePermission
	and a ; LAND_TILE
	ret z
	scf
	ret

.CheckSurfable:
; Return 0 if tile a is water, or 1 if land.
; Otherwise, return carry.

	call GetTilePermission
	cp WATER_TILE
	jr z, .Water

; Can walk back onto land from water.
	and a ; LAND_TILE
	jr z, .Land

	jr .Neither

.Water:
	xor a
	ret

.Land:
	ld a, 1
	and a
	ret

.Neither:
	scf
	ret

.BumpSound:
	call CheckSFX
	ret c
	ld de, SFX_BUMP
	jmp PlaySFX

.GetOutOfWater:
	push bc
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call UpdatePlayerSprite ; UpdateSprites
	pop bc
	ret

CheckStandingOnIce::
	ld a, [wPlayerTurningDirection]
	and a
	jr z, .not_ice
	cp $f0
	jr z, .not_ice
	ld a, [wPlayerTileCollision]
	call CheckIceTile
	jr nc, .yep
	ld a, [wPlayerState]
	cp PLAYER_SKATE
	jr nz, .not_ice

.yep
	scf
	ret

.not_ice
	and a
	ret

CheckTrainerRun:
; Check if any trainer on the map sees the player.

; Skip the player object.
	ld a, 1
	ld de, wMap1Object

.loop

; Have them face the player if the object:

	push af
	push de

; Has a sprite
	ld hl, MAPOBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .next

; Is a trainer
	ld hl, MAPOBJECT_TYPE
	add hl, de
	ld a, [hl]
	and $f
	cp $2
	jr nz, .next
; Is visible on the map
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .next

; Spins around
	ld hl, MAPOBJECT_MOVEMENT
	add hl, de
	ld a, [hl]
	cp SPRITEMOVEDATA_SPINRANDOM_SLOW
	jr z, .spinner
	cp SPRITEMOVEDATA_SPINRANDOM_FAST
	jr z, .spinner
	cp SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE
	jr z, .spinner
	cp SPRITEMOVEDATA_SPINCLOCKWISE
	jr nz, .next

.spinner

; You're within their sight range
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, de
	ld a, [hl]
	call GetObjectStruct
	call AnyFacingPlayerDistance_bc
	ld hl, MAPOBJECT_SIGHT_RANGE
	add hl, de
	ld a, [hl]
	cp c
	jr c, .next

; Get them to face you
	ld a, b
	push af
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, de
	ld a, [hl]
	call GetObjectStruct
	pop af
	call SetSpriteDirection
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .next
	ld [hl], $40

.next
	pop de
	ld hl, OBJECT_LENGTH
	add hl, de
	ld d, h
	ld e, l

	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	xor a
	ret

AnyFacingPlayerDistance_bc::
; Returns distance in c and direction in b.
	push de
	call .AnyFacingPlayerDistance
	ld b, d
	ld c, e
	pop de
	ret

.AnyFacingPlayerDistance
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld d, [hl]

	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld e, [hl]

	ldh a, [hJoypadDown]
	bit 7, a
	jr nz, .down
	bit 6, a
	jr nz, .up
	bit 5, a
	jr nz, .left
	bit 4, a
	jr nz, .right
.down
	lb bc, 1, 0
	jr .got_vector
.up
	lb bc, -1, 0
	jr .got_vector
.left
	lb bc, 0, -1
	jr .got_vector
.right
	lb bc, 0, 1
.got_vector

	ld a, [wPlayerMapX]
	add c
	sub d
	ld l, OW_RIGHT
	jr nc, .check_y
	cpl
	inc a
	ld l, OW_LEFT
.check_y
	ld d, a
	ld a, [wPlayerMapY]
	add b
	sub e
	ld h, OW_DOWN
	jr nc, .compare
	cpl
	inc a
	ld h, OW_UP
.compare
	cp d
	ld e, a
	ld a, d
	ld d, h
	ret nc
	ld e, a
	ld d, l
	ret

StopPlayerForEvent::
	ld hl, wPlayerNextMovement
	ld a, movement_step_sleep
	cp [hl]
	ret z

	ld [hl], a
	xor a
	ld [wPlayerTurningDirection], a
	ret

CheckBridgeStep:
; Update the player's bridge level (see home/bridges.asm) for the step
; about to be taken, and redraw the screen if it changed.
	ld a, [wWalkingDirection]
	cp STANDING
	ret z
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wPlayerMapY]
	ld e, a
	push de
	call GetCoordTileCollisionRaw
	pop de
	sub COLL_BRIDGE_FLOOR
	ld b, a ; current tile: 0-1: deck, 2: edge, 3+: not a bridge
	ld a, [wWalkingX]
	add d
	ld d, a
	ld a, [wWalkingY]
	add e
	ld e, a
	push bc
	call GetCoordTileCollisionRaw
	pop bc
	sub COLL_BRIDGE_FLOOR
	cp COLL_BRIDGE_EDGE - COLL_BRIDGE_FLOOR + 1
	ret nc ; not stepping onto a bridge
	cp COLL_BRIDGE_EDGE - COLL_BRIDGE_FLOOR
	jr z, .upper ; onto an edge
	ld a, b
	cp COLL_BRIDGE_EDGE - COLL_BRIDGE_FLOOR
	jr z, .upper ; from an edge onto a deck
	ret c ; from deck to deck
; onto a deck from off the bridge
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BRIDGE_UPPER_F, [hl]
	ret z
	res STATUSFLAGS2_BRIDGE_UPPER_F, [hl]
	jr .changed

.upper
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BRIDGE_UPPER_F, [hl]
	ret nz
	set STATUSFLAGS2_BRIDGE_UPPER_F, [hl]
.changed
	call ApplyBridgePriority
	; fallthrough

RefreshScreenAttrmap:
; Redraw the attributes of the visible map in place (the tiles are unchanged),
; wherever the BG map is anchored, in one vblank.
	call LoadOverworldTilemap
	ld a, [wBGMapAnchor]
	ld c, a
	ld a, [wBGMapAnchor + 1]
	and HIGH(BG_MAP_WIDTH * BG_MAP_HEIGHT - 1)
	ld b, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wScratchAttrmap)
	ldh [rSVBK], a
; lay wAttrmap out in a copy of the BG map, starting at the anchor and wrapping
	ld hl, wScratchAttrmap
	add hl, bc
	ld de, wAttrmap
	ld b, SCREEN_HEIGHT
.row
	push hl
	ld c, SCREEN_WIDTH
.col
	ld a, [de]
	inc de
	ld [hli], a
	ld a, l
	and BG_MAP_WIDTH - 1
	jr nz, .next_col
	ld a, l
	sub BG_MAP_WIDTH
	ld l, a
	jr nc, .next_col
	dec h
.next_col
	dec c
	jr nz, .col
	pop hl
	ld a, l
	add BG_MAP_WIDTH
	ld l, a
	jr nc, .no_carry
	inc h
.no_carry
	ld a, h
	cp HIGH(wScratchAttrmap + BG_MAP_WIDTH * BG_MAP_HEIGHT)
	jr c, .no_wrap
	ld h, HIGH(wScratchAttrmap)
.no_wrap
	dec b
	jr nz, .row
; copy it all to the attribute map during vblank
	ldh a, [rVBK]
	push af
	ld a, 1
	ldh [rVBK], a
	ld a, HIGH(wScratchAttrmap)
	ldh [rHDMA1], a
	ld a, LOW(wScratchAttrmap)
	ldh [rHDMA2], a
	ld a, HIGH(vBGMap0)
	ldh [rHDMA3], a
	ld a, LOW(vBGMap0)
	ldh [rHDMA4], a
	di
.wait
	ldh a, [rLY]
	cp LY_VBLANK
	jr nz, .wait
	ld a, BG_MAP_WIDTH * BG_MAP_HEIGHT / 16 - 1 ; general-purpose DMA
	ldh [rHDMA5], a
	ei
	pop af
	ldh [rVBK], a
	pop af
	ldh [rSVBK], a
	ret
