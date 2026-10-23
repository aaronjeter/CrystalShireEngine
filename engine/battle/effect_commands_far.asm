; Move effects moved out of the Effect Commands bank (double battles phase 0.5, step 7)
; to make room there. Each BattleCommand_X left in effect_commands.asm is a 4-byte
; stub, "farjp _BattleCommand_X", so the command table and move scripts are unchanged.
; Calls from here into routines that stayed in Effect Commands are farcall/farjp
; (far calls keep a, bc, de, hl and the flags). A helper that reads a table at an
; address in its own bank (CheckMoveInList) must get a table that stayed there too.

; ---- from engine/battle/move_effects/thief.asm

_BattleCommand_Thief:
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The player needs to be able to steal an item.

	call .playeritem
	ld a, [hl]
	and a
	ret nz

; The enemy needs to have an item to steal.

	call .enemyitem
	ld a, [hl]
	and a
	ret z

; Can't steal mail.

	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

	ld a, [wLinkMode]
	and a
	jr z, .stealenemyitem

	ld a, [wBattleMode]
	dec a
	ret z

.stealenemyitem
	call .enemyitem
	xor a
	ld [hl], a
	ld [de], a

	call .playeritem
	ld a, [wNamedObjectIndex]
	ld [hl], a
	ld [de], a
	jr .stole

.enemy

; The enemy can't already have an item.

	call .enemyitem
	ld a, [hl]
	and a
	ret nz

; The player must have an item to steal.

	call .playeritem
	ld a, [hl]
	and a
	ret z

; Can't steal mail!

	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

; If the enemy steals your item,
; it's gone for good if you don't get it back.

	call .playeritem
	xor a
	ld [hl], a
	ld [de], a

	call .enemyitem
	ld a, [wNamedObjectIndex]
	ld [hl], a
	ld [de], a

.stole
	call GetItemName
	ld hl, StoleText
	jmp StdBattleTextbox

.playeritem
	ld a, MON_ITEM
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, wBattleMonItem
	ret

.enemyitem
	ld a, MON_ITEM
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, wEnemyMonItem
	ret

; ---- from engine/battle/move_effects/rollout.asm

DEF MAX_ROLLOUT_COUNT EQU 5

_BattleCommand_CheckRollout:
	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVar
	bit SUBSTATUS_ROLLOUT, a
	jr z, .reset

	ld b, doturn_command
	farjp SkipToBattleCommand

.reset
	xor a
	ld [de], a
	ret

_BattleCommand_RolloutPower:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP_MASK
	ret nz

	ld hl, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_rollout_count
	ld hl, wEnemyRolloutCount

.got_rollout_count
	ld a, [hl]
	and a
	jr nz, .skip_set_rampage
	ld a, 1
	ld [wSomeoneIsRampaging], a

.skip_set_rampage
	ld a, [wAttackMissed]
	and a
	jr z, .hit

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]
	ret

.hit
	inc [hl]
	ld a, [hl]
	ld b, a
	cp MAX_ROLLOUT_COUNT
	jr c, .not_done_with_rollout

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]
	jr .done_with_substatus_flag

.not_done_with_rollout
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	set SUBSTATUS_ROLLOUT, [hl]

.done_with_substatus_flag
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_CURLED, a
	jr z, .not_curled
	inc b
.not_curled
.loop
	dec b
	ret z

	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .loop

	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

; ---- from engine/battle/move_effects/pain_split.asm

_BattleCommand_PainSplit:
	ld a, [wAttackMissed]
	and a
	jmp nz, .ButItFailed
	farcall CheckSubstituteOpp
	jmp nz, .ButItFailed
	farcall AnimateCurrentMove
	ld hl, wBattleMonMaxHP + 1
	ld de, wEnemyMonMaxHP + 1
	call .PlayerShareHP
	xor a ; the player's area
	farcall AnimateAreaHPBar
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wHPBuffer2 + 1], a
	ld a, [hli]
	ld [wHPBuffer2], a
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	call .EnemyShareHP
	call ResetDamage
	ld a, 1 ; the enemy's area
	farcall AnimateAreaHPBar
	farcall _UpdateBattleHUDs

	ld hl, SharedPainText
	jmp StdBattleTextbox

.PlayerShareHP:
	ld a, [hld]
	ld [wHPBuffer1], a
	ld a, [hld]
	ld [wHPBuffer1 + 1], a
	ld a, [hld]
	ld b, a
	ld [wHPBuffer2], a
	ld a, [hl]
	ld [wHPBuffer2 + 1], a
	dec de
	dec de
	ld a, [de]
	dec de
	add b
	ld [wCurDamage + 1], a
	ld b, [hl]
	ld a, [de]
	adc b
	srl a
	ld [wCurDamage], a
	ld a, [wCurDamage + 1]
	rra
	ld [wCurDamage + 1], a
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de

.EnemyShareHP:
	ld a, [hld]
	ld c, a
	ld a, [wCurDamage + 1]
	sub c
	ld a, [hld]
	ld b, a
	ld a, [wCurDamage]
	sbc b
	jr nc, .skip

	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
.skip
	ld a, c
	ld [hld], a
	ld [wHPBuffer3], a
	ld a, b
	ld [hli], a
	ld [wHPBuffer3 + 1], a
	ret

.ButItFailed:
	farjp PrintDidntAffect2

; ---- from engine/battle/move_effects/encore.asm

_BattleCommand_Encore:
	ld hl, wEnemyMonMoves
	ld de, wEnemyEncoreCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonMoves
	ld de, wPlayerEncoreCount
.ok
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVar
	ld b, a
	push hl
	ld hl, EncoreInvalidMoves
	farcall CheckMoveInList
	pop hl
	jmp c, .failed

.got_move
	ld a, [hli]
	cp b
	jr nz, .got_move

	ld bc, wBattleMonPP - wBattleMonMoves - 1
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jmp z, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_ENCORED, [hl]
	jr nz, .failed
	set SUBSTATUS_ENCORED, [hl]
	call BattleRandom
	and $3
	inc a
	inc a
	inc a
	ld [de], a
	farcall CheckOpponentWentFirst
	jr nz, .finish_move
	ldh a, [hBattleTurn]
	and a
	jr z, .force_last_enemy_move

	push hl
	ld a, [wLastPlayerMove]
	ld b, a
	ld c, 0
	ld hl, wBattleMonMoves
.find_player_move
	ld a, [hli]
	cp b
	jr z, .got_player_move
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .find_player_move
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.got_player_move
	pop hl
	ld a, c
	ld [wCurMoveNum], a
	ld a, b
	ld [wCurPlayerMove], a
	ld de, wPlayerMoveStruct
	call GetMoveData
	jr .finish_move

.force_last_enemy_move
	push hl
	ld a, [wLastEnemyMove]
	ld b, a
	ld c, 0
	ld hl, wEnemyMonMoves
.find_enemy_move
	ld a, [hli]
	cp b
	jr z, .got_enemy_move
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .find_enemy_move
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.got_enemy_move
	pop hl
	ld a, c
	ld [wCurEnemyMoveNum], a
	ld a, b
	ld [wCurEnemyMove], a
	ld de, wEnemyMoveStruct
	call GetMoveData

.finish_move
	farcall AnimateCurrentMove
	ld hl, GotAnEncoreText
	jmp StdBattleTextbox

.failed
	farjp PrintDidntAffect2

; ---- from engine/battle/move_effects/conversion.asm

_BattleCommand_Conversion:
	ld hl, wBattleMonMoves
	ld de, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonType1
.got_moves
	push de
	ld c, 0
	ld de, wStringBuffer1
.loop
	push hl
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .okay
	push hl
	push bc
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	and TYPE_MASK
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .loop
.okay
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	pop de
	ld hl, wStringBuffer1
.loop2
	ld a, [hl]
	cp -1
	jr z, .fail
	cp CURSE_TYPE
	jr z, .next
	ld a, [de]
	cp [hl]
	jr z, .next
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr nz, .done
.next
	inc hl
	jr .loop2

.fail
	farcall AnimateFailedMove
	farjp PrintButItFailed

.done
.loop3
	call BattleRandom
	maskbits NUM_MOVES
	ld c, a
	ld b, 0
	ld hl, wStringBuffer1
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .loop3
	cp CURSE_TYPE
	jr z, .loop3
	ld a, [de]
	cp [hl]
	jr z, .loop3
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr z, .loop3
	ld a, [hl]
	ld [de], a
	inc de
	ld [de], a
	ld [wNamedObjectIndex], a
	farcall GetTypeName
	farcall AnimateCurrentMove
	ld hl, TransformedTypeText
	jmp StdBattleTextbox

; ---- from engine/battle/move_effects/spite.asm

_BattleCommand_Spite:
	ld a, [wAttackMissed]
	and a
	jmp nz, .failed
	ld bc, PARTYMON_STRUCT_LENGTH ; unused
	ld hl, wEnemyMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wBattleMonMoves
.got_moves
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed
	ld b, a
	push bc
	ld bc, STRUGGLE
	farcall CompareMove
	pop bc
	jr z, .failed
	ld c, -1
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop
	ld [wNamedObjectIndex], a
	dec hl
	ld b, 0
	push bc
	ld c, wBattleMonPP - wBattleMonMoves
	add hl, bc
	pop bc
	ld a, [hl]
	and PP_MASK
	jr z, .failed
	push bc
	call GetMoveName
	; lose 2-5 PP
	call BattleRandom
	and %11
	inc a
	inc a
	ld b, a
	ld a, [hl]
	and PP_MASK
	cp b
	jr nc, .deplete_pp
	ld b, a
.deplete_pp
	ld a, [hl]
	sub b
	ld [hl], a
	push af
	ld a, MON_PP
	call OpponentPartyAttr
	ld d, b
	pop af
	pop bc
	add hl, bc
	ld e, a
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ldh a, [hBattleTurn]
	and a
	jr nz, .not_wildmon
	ld a, [wBattleMode]
	dec a
	jr nz, .not_wildmon
	ld hl, wWildMonPP
	add hl, bc
.not_wildmon
	ld [hl], e
.transformed
	push de
	farcall AnimateCurrentMove
	pop de
	ld a, d
	ld [wTextDecimalByte], a
	ld hl, SpiteEffectText
	jmp StdBattleTextbox

.failed
	farjp PrintDidntAffect2

; ---- from engine/battle/move_effects/disable.asm

_BattleCommand_Disable:
	ld a, [wAttackMissed]
	and a
	jr nz, .failed

	ld de, wEnemyDisableCount
	ld hl, wEnemyMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld de, wPlayerDisableCount
	ld hl, wBattleMonMoves
.got_moves

	ld a, [de]
	and a
	jr nz, .failed

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed
	ld b, a
	push bc
	ld bc, STRUGGLE
	farcall CompareMove
	pop bc
	jr z, .failed

	ld c, $ff
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonPP
	jr z, .got_pp
	ld hl, wBattleMonPP
.got_pp
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .failed
.loop2
	call BattleRandom
	and 7
	jr z, .loop2
	inc a
	inc c
	swap c
	add c
	ld [de], a
	farcall AnimateCurrentMove
	ld hl, wDisabledMove
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_disabled_move_pointer
	inc hl
.got_disabled_move_pointer
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	ld hl, WasDisabledText
	jmp StdBattleTextbox

.failed
	farjp FailMove

; ---- from engine/battle/move_effects/sketch.asm

_BattleCommand_Sketch:
	farcall ClearLastMove
; Don't sketch during a link battle
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	farcall AnimateFailedMove
	farjp PrintNothingHappened

.not_linked
; If the opponent has a substitute up, fail.
	farcall CheckSubstituteOpp
	jmp nz, .fail
; If the user is transformed, fail.
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jmp nz, .fail
; Get the user's moveset in its party struct.
; This move replacement shall be permanent.
; Pointer will be in de.
	ld a, MON_MOVES
	call UserPartyAttr
	ld d, h
	ld e, l
; Get the battle move structs.
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .get_last_move
	ld hl, wEnemyMonMoves
.get_last_move
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [wNamedObjectIndex], a
	ld b, a
; Fail if move is invalid or is Struggle.
	and a
	jr z, .fail
	push bc
	ld bc, STRUGGLE
	farcall CompareMove
	pop bc
	jr z, .fail
; Fail if user already knows that move
	ld c, NUM_MOVES
.does_user_already_know_move
	ld a, [hli]
	cp b
	jr z, .fail
	dec c
	jr nz, .does_user_already_know_move
; Find Sketch in the user's moveset.
; Pointer in hl, and index in c.
	push hl
	ld hl, SKETCH
	call GetMoveIDFromIndex
	pop hl
	ld c, NUM_MOVES
.find_sketch
	dec c
	dec hl
	cp [hl]
	jr nz, .find_sketch
; The Sketched move is loaded to that slot.
	ld a, b
	ld [hl], a
; Copy the base PP from that move.
	push bc
	push hl
	ld l, a
	ld a, MOVE_PP
	call GetMoveAttribute
	pop hl
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld [hl], a
	pop bc

	ldh a, [hBattleTurn]
	and a
	jr z, .user_trainer
	ld a, [wBattleMode]
	dec a
	jr nz, .user_trainer
; wildmon
	ld a, [hl]
	push bc
	ld hl, wWildMonPP
	ld b, 0
	add hl, bc
	ld [hl], a
	ld hl, wWildMonMoves
	add hl, bc
	pop bc
	ld [hl], b
	jr .done_copy

.user_trainer
	ld a, [hl]
	push af
	ld l, c
	ld h, 0
	add hl, de
	ld a, b
	ld [hl], a
	pop af
	ld de, MON_PP - MON_MOVES
	add hl, de
	ld [hl], a
.done_copy
	call GetMoveName
	farcall AnimateCurrentMove

	ld hl, SketchedText
	jmp StdBattleTextbox

.fail
	farcall AnimateFailedMove
	farjp PrintDidntAffect

; ---- from engine/battle/move_effects/mimic.asm

_BattleCommand_Mimic:
	farcall ClearLastMove
	farcall BattleCommand_MoveDelay
	ld a, [wAttackMissed]
	and a
	jr nz, .fail
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn
	ld hl, wEnemyMonMoves
.player_turn
	farcall CheckHiddenOpponent
	jr nz, .fail
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .fail
	ld b, a
	push bc
	ld bc, STRUGGLE
	farcall CompareMove
	pop bc
	jr z, .fail
	ld c, NUM_MOVES
.check_already_knows_move
	ld a, [hli]
	cp b
	jr z, .fail
	dec c
	jr nz, .check_already_knows_move
	push hl
	ld hl, MIMIC
	call GetMoveIDFromIndex
	pop hl
.find_mimic
	dec hl
	cp [hl]
	jr nz, .find_mimic
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndex], a
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld [hl], 5
	call GetMoveName
	farcall AnimateCurrentMove
	ld hl, MimicLearnedMoveText
	jmp StdBattleTextbox

.fail
	farjp FailMimic

; ---- from engine/battle/move_effects/conversion2.asm

_BattleCommand_Conversion2:
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wEnemyMonType1
.got_type
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed
	push hl
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	and TYPE_MASK
	ld d, a
	pop hl
	cp CURSE_TYPE
	jr z, .failed
	farcall AnimateCurrentMove
	farcall BattleCommand_SwitchTurn

.loop
	call BattleRandom
	maskbits TYPES_END
	cp UNUSED_TYPES
	jr c, .okay
	cp UNUSED_TYPES_END
	jr c, .loop
	cp TYPES_END
	jr nc, .loop
.okay
	ld [hli], a
	ld [hld], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	push af
	push hl
	ld a, d
	ld [hl], a
	farcall BattleCheckTypeMatchup
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .loop
	farcall BattleCommand_SwitchTurn

	ld a, [hl]
	ld [wNamedObjectIndex], a
	predef GetTypeName
	ld hl, TransformedTypeText
	jmp StdBattleTextbox

.failed
	farjp FailMove

; ---- from engine/battle/effect_commands.asm (BattleCommand_TrapTarget)

_BattleCommand_TrapTarget:
	ld a, [wAttackMissed]
	and a
	ret nz
	ld hl, wEnemyWrapCount
	ld de, wEnemyTrappingMove
	ldh a, [hBattleTurn]
	and a
	jr z, .got_trap
	ld hl, wPlayerWrapCount
	ld de, wPlayerTrappingMove

.got_trap
	ld a, [hl]
	and a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	call BattleRandom
	; trapped for 2-5 turns
	and %11
	inc a
	inc a
	inc a
	ld [hl], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, .Traps

.find_trap_text
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .next_trap_text
	cp b
	jr z, .found_trap_text
.next_trap_text
	inc hl
	inc hl
	jr .find_trap_text

.found_trap_text
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jmp StdBattleTextbox

.Traps:
	dw BIND,      UsedBindText      ; 'used BIND on'
	dw WRAP,      WrappedByText     ; 'was WRAPPED by'
	dw FIRE_SPIN, FireSpinTrapText  ; 'was trapped!'
	dw CLAMP,     ClampedByText     ; 'was CLAMPED by'
	dw WHIRLPOOL, WhirlpoolTrapText ; 'was trapped!'

; ---- from engine/battle/effect_commands.asm (BattleCommand_Recoil)

_BattleCommand_Recoil:
; Magic Guard: no recoil damage.
	farcall CheckMagicGuardUser
	ret c
; Rock Head: no recoil damage, except from Struggle.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_ROCK_HEAD
	jr nz, .no_rock_head
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld bc, STRUGGLE
	farcall CompareMove
	ret nz
.no_rock_head

	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld d, a
; get 1/4 damage or 1 HP, whichever is higher
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .min_damage
	inc c
.min_damage
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	dec hl
	dec hl
	ld a, [hl]
	ld [wHPBuffer2], a
	sub c
	ld [hld], a
	ld [wHPBuffer3], a
	ld a, [hl]
	ld [wHPBuffer2 + 1], a
	sbc b
	ld [hl], a
	ld [wHPBuffer3 + 1], a
	jr nc, .dont_ko
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wHPBuffer3
	ld [hli], a
	ld [hl], a
.dont_ko
	ldh a, [hBattleTurn]
	farcall AnimateAreaHPBar
	call RefreshBattleHuds
	ld hl, RecoilText
	jmp StdBattleTextbox
