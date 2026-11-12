LearnMove:
	call LoadTilemapToTempTilemap
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	rst CopyBytes

.loop
	xor a
	ld [wMoveInfoFlags], a
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	rst AddNTimes
	ld d, h
	ld e, l
	ld b, NUM_MOVES
; Get the first empty move slot.  This routine also serves to
; determine whether the Pokemon learning the moves already has
; all four slots occupied, in which case one would need to be
; deleted.
.next
	ld a, [hl]
	and a
	jr z, .learn
	inc hl
	dec b
	jr nz, .next
; If we're here, we enter the routine for forgetting a move
; to make room for the new move we're trying to learn.
	push de
	call ForgetMove
	pop de
	jr c, .cancel

	push hl
	push de
	ld [wNamedObjectIndex], a

	ld b, a
	ld a, [wBattleMode]
	and a
	jr z, .not_disabled
	ld a, [wDisabledMove]
	cp b
	jr nz, .not_disabled
	xor a
	ld [wDisabledMove], a
	ld [wPlayerDisableCount], a
.not_disabled

	call GetMoveName
	ld hl, Text_1_2_and_Poof ; 1, 2 and…
	call PrintText
	pop de
	pop hl

.learn
	ld a, [wPutativeTMHMMove]
	ld [hl], a
	ld bc, MON_PP - MON_MOVES
	add hl, bc

	push hl
	ld l, a
	ld a, MOVE_PP
	call GetMoveAttribute
	pop hl

	ld [hl], a

	ld a, [wBattleMode]
	and a
	jr z, .learned

	ld a, [wCurPartyMon]
	ld b, a
	ld a, [wCurBattleMon]
	cp b
	jr nz, .learned

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .learned

	ld h, d
	ld l, e
	ld de, wBattleMonMoves
	ld bc, NUM_MOVES
	rst CopyBytes
	ld bc, wPartyMon1PP - (wPartyMon1Moves + NUM_MOVES)
	add hl, bc
	ld de, wBattleMonPP
	ld bc, NUM_MOVES
	rst CopyBytes
	jr .learned

.cancel
	ld hl, StopLearningMoveText
	call PrintText
	call YesNoBox
	jmp c, .loop

	ld hl, DidNotLearnMoveText
	call PrintText
	ld b, 0
	ret

.learned
	ld a, [wMoveInfoFlags]
	bit MOVEINFO_FORGOT_F, a
	jr nz, .learned_text
	; learned into a free slot: the move's details with the message
	ld a, [wPutativeTMHMMove]
	ld c, 1 << MOVEINFO_PARTY_HP_F
	farcall MoveInfo_OpenPrompt
	ld hl, LearnedMoveText
	call PrintText
	farcall MoveInfo_ClosePrompt
	ld b, 1
	ret

.learned_text
	ld hl, LearnedMoveText
	call PrintText
	ld b, 1
	ret

ForgetMove:
; hl = the party mon's moves + NUM_MOVES. Shows the new move's details while
; asking to delete a move, then the forget screen. Returns a = the forgotten
; move and hl = its slot, or carry if none was forgotten.
	push hl
	ld a, [wPutativeTMHMMove]
	ld c, 1 << MOVEINFO_PARTY_HP_F
	farcall MoveInfo_OpenPrompt
	ld hl, AskForgetMoveText
	call PrintText
	call YesNoBox
	pop hl
	jr nc, .forget
	farcall MoveInfo_ClosePrompt
	scf
	ret

.forget
	ld bc, -NUM_MOVES
	add hl, bc
.loop
	push hl
	farcall MoveForgetScreen
	pop hl
	jr c, .cancel
	push hl
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	push af
	push bc
	call IsHMMove
	pop bc
	pop de
	ld a, d
	;jr c, .hmmove
	pop hl
	add hl, bc
	push hl
	ld hl, wMoveInfoFlags
	set MOVEINFO_FORGOT_F, [hl]
	pop hl
	and a
	ret

.hmmove
	ld hl, MoveCantForgetHMText
	call PrintText
	pop hl
	jr .loop

.cancel
	scf
	ret

LearnedMoveText:
	text_far _LearnedMoveText
	text_end

StopLearningMoveText:
	text_far _StopLearningMoveText
	text_end

DidNotLearnMoveText:
	text_far _DidNotLearnMoveText
	text_end

AskForgetMoveText:
	text_far _AskForgetMoveText
	text_end

Text_1_2_and_Poof:
	text_far Text_MoveForgetCount ; 1, 2 and…
	text_asm
	push de
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	pop de
	ld hl, .MoveForgotText
	ret

.MoveForgotText:
	text_far _MoveForgotText
	text_end

MoveCantForgetHMText:
	text_far _MoveCantForgetHMText
	text_end
