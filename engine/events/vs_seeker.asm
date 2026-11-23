; The Vs Seeker: readies every beaten map trainer on screen for a rematch by
; clearing their beaten flags. Each readied trainer shows an emote, then
; battles through the usual sight and talk checks with its own party. After a
; use it needs VS_SEEKER_RECHARGE_STEPS steps (wVsSeekerCharge counts down).

DEF VS_SEEKER_RECHARGE_STEPS EQU 100

; map objects readied by the current use, a bit per object (2 bytes)
DEF wVsSeekerReadied EQUS "wStringBuffer5"

VsSeekerItem::
	call VsSeekerGetCharge
	ld hl, VsSeekerChargingScript
	jr nz, .queue
	call VsSeekerReadyTrainers
	ld hl, VsSeekerNoneScript
	jr z, .queue
	ld hl, VsSeekerUsedScript
.queue
	call QueueScript
	ld a, 1
	ld [wItemEffectSucceeded], a
	ret

VsSeekerStep::
; Each step: one step less until the Vs Seeker is charged
	ldh a, [rSVBK]
	push af
	ld a, BANK(wVsSeekerCharge)
	ldh [rSVBK], a
	ld hl, wVsSeekerCharge
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
.done
	pop af
	ldh [rSVBK], a
	ret

VsSeekerGetCharge:
; a = steps left until charged; z if charged
	ldh a, [rSVBK]
	push af
	ld a, BANK(wVsSeekerCharge)
	ldh [rSVBK], a
	ld a, [wVsSeekerCharge]
	ld b, a
	pop af
	ldh [rSVBK], a
	ld a, b
	and a
	ret

VsSeekerSetCharge:
; wVsSeekerCharge = b
	ldh a, [rSVBK]
	push af
	ld a, BANK(wVsSeekerCharge)
	ldh [rSVBK], a
	ld a, b
	ld [wVsSeekerCharge], a
	pop af
	ldh [rSVBK], a
	ret

VsSeekerReadyTrainers:
; Marks the eligible beaten trainers on screen in wVsSeekerReadied, then clears
; their beaten flags (both steps first mark, so objects sharing a flag are all
; readied) and starts the recharge. z if there were none.
	xor a
	ld [wVsSeekerReadied], a
	ld [wVsSeekerReadied + 1], a
	ld a, 1 ; skip the player
.mark_loop
	push af
	call VsSeekerCheckObject
	jr nc, .mark_next
	pop af
	push af
	ld e, a
	ld d, 0
	ld b, SET_FLAG
	ld hl, wVsSeekerReadied
	call FlagAction
.mark_next
	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .mark_loop

	ld hl, wVsSeekerReadied
	ld a, [hli]
	or [hl]
	ret z

	ld a, 1
.clear_loop
	push af
	ld e, a
	ld d, 0
	ld b, CHECK_FLAG
	ld hl, wVsSeekerReadied
	call FlagAction
	ld a, c
	and a
	jr z, .clear_next
	pop af
	push af
	call GetMapObject
	call VsSeekerTrainerFlag
	ld b, RESET_FLAG
	call EventFlagAction
.clear_next
	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .clear_loop

	ld b, VS_SEEKER_RECHARGE_STEPS
	call VsSeekerSetCharge
	or 1 ; nz
	ret

VsSeekerCheckObject:
; carry if map object a is a beaten trainer on screen that the Vs Seeker can
; ready
	call GetMapObject
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld a, [hl]
	cp OBJECTTYPE_TRAINER
	jr nz, .no
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .no

; on screen: x from the player's - 4 to + 5, y from - 4 to + 4
	push bc
	call GetObjectStruct
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [wPlayerMapX]
	sub [hl]
	add 5
	cp 10
	jr nc, .off_screen
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [wPlayerMapY]
	sub [hl]
	add 4
	cp 9
	jr nc, .off_screen
	pop bc

	call VsSeekerTrainerFlag
	call VsSeekerIsExcluded
	jr c, .no
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	ret z
	scf
	ret

.off_screen
	pop bc
.no
	and a
	ret

VsSeekerTrainerFlag:
; de = the beaten flag of map object bc (the first word of its trainer header)
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	call GetFarWord
	ld d, h
	ld e, l
	ret

VsSeekerIsExcluded:
; carry if event flag de is in VsSeekerExcludedFlags
	ld hl, VsSeekerExcludedFlags
.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	and c
	inc a
	jr z, .not_found ; -1
	ld a, c
	cp e
	jr nz, .loop
	ld a, b
	cp d
	jr nz, .loop
	scf
	ret

.not_found
	and a
	ret

VsSeekerNextTrainer:
; hLastTalked = the next readied trainer (taken off wVsSeekerReadied);
; wScriptVar = FALSE when there are none left
	ld a, 1
.loop
	push af
	ld e, a
	ld d, 0
	ld b, CHECK_FLAG
	ld hl, wVsSeekerReadied
	call FlagAction
	ld a, c
	and a
	jr nz, .found
	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	xor a ; FALSE
	ld [wScriptVar], a
	ret

.found
	pop af
	ldh [hLastTalked], a
	ld e, a
	ld d, 0
	ld b, RESET_FLAG
	ld hl, wVsSeekerReadied
	call FlagAction
	ld a, TRUE
	ld [wScriptVar], a
	ret

VsSeekerChargeToBuffer:
; wStringBuffer5 = the steps left until charged
	call VsSeekerGetCharge
	ld [wStringBuffer5], a
	ret

VsSeekerUsedScript:
	refreshmap
	special UpdateTimePals
	opentext
	writetext VsSeekerUsedText
	playsound SFX_2_BOOPS
	waitsfx
	closetext
.loop
	callasm VsSeekerNextTrainer
	iffalse .done
	showemote EMOTE_BOLT, LAST_TALKED, 20
	sjump .loop

.done
	end

VsSeekerNoneScript:
	refreshmap
	special UpdateTimePals
	opentext
	writetext VsSeekerUsedText
	playsound SFX_2_BOOPS
	waitsfx
	writetext VsSeekerNoneText
	waitbutton
	closetext
	end

VsSeekerChargingScript:
	refreshmap
	special UpdateTimePals
	callasm VsSeekerChargeToBuffer
	opentext
	writetext VsSeekerChargingText
	waitbutton
	closetext
	end

VsSeekerUsedText:
	text "<PLAYER> used"
	line "the Vs Seeker!"
	done

VsSeekerNoneText:
	text "No trainers nearby"
	line "want a rematch."
	done

VsSeekerChargingText:
	text "The Vs Seeker"
	line "isn't charged yet."

	para "Steps left: @"
	text_decimal wStringBuffer5, 1, 3
	text "."
	done

INCLUDE "data/events/vs_seeker_excluded.asm"
