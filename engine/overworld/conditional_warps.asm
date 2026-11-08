; Conditional warps (cond_warp_event): the destination is chosen from a table
; of event-flag conditions when the warp is taken.

ResolveConditionalWarp::
; Run after a warp's destination is copied to wNextWarp, wNextMapGroup and
; wNextMapNumber. For a conditional warp (wNextWarp = COND_WARP, the map bytes
; = its table), the first entry whose condition holds gives the destination.
; Returns carry to take the warp, no carry for a locked door (warp_locked).
; Other warps: carry, unchanged.
	ld a, [wNextWarp]
	cp COND_WARP
	scf
	ret nz
	ld a, [wNextMapGroup]
	ld l, a
	ld a, [wNextMapNumber]
	ld h, a
.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and e
	inc a
	jr z, .found ; COND_WARP_ALWAYS
	push hl
	push de
	res 7, d ; COND_WARP_IF_CLEAR
	ld b, CHECK_FLAG
	call EventFlagAction
	pop de
	pop hl
	ld a, c
	and a
	jr z, .got_flag
	ld a, 1 << 7
.got_flag
	xor d
	bit 7, a ; set: the flag is set for warp_if, or clear for warp_if_not
	jr nz, .found
	inc hl
	inc hl
	inc hl
	jr .loop

.found
	ld a, [hli]
	and a
	ret z ; warp_locked (no carry)
	ld [wNextWarp], a
	ld a, [hli]
	ld [wNextMapGroup], a
	ld a, [hl]
	ld [wNextMapNumber], a
	scf
	ret

LockedDoorScript::
; The player stepped onto a locked conditional door: step back out.
	opentext
	writetext LockedDoorText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .StepDown
	ifequal DOWN, .StepUp
	ifequal LEFT, .StepRight
	applymovement PLAYER, .LeftMovement
	end

.StepDown:
	applymovement PLAYER, .DownMovement
	end

.StepUp:
	applymovement PLAYER, .UpMovement
	end

.StepRight:
	applymovement PLAYER, .RightMovement
	end

.DownMovement:
	step DOWN
	step_end

.UpMovement:
	step UP
	step_end

.RightMovement:
	step RIGHT
	step_end

.LeftMovement:
	step LEFT
	step_end

LockedDoorText:
	text "The door is"
	line "locked."
	done

INCLUDE "data/maps/conditional_warps.asm"
