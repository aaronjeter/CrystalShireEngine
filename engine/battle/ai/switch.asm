CheckPlayerMoveTypeMatchups:
; Check how well the moves you've already used
; fare against the enemy's Pokemon.  Used to
; score a potential switch.
	push hl
	push de
	push bc
	ld a, BASE_AI_SWITCH_SCORE
	ld [wEnemyAISwitchScore], a
	ld hl, wPlayerUsedMoves
	ld a, [hl]
	and a
	jr z, .unknown_moves

	lb de, NUM_MOVES, 0
.loop
	ld a, [hli]
	and a
	jr z, .exit
	push hl
	call GetMoveTypeIfDamaging
	jr z, .next

	ld hl, wEnemyMonType
	farcall CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1 ; 1.0 + 0.1
	jr nc, .super_effective
	and a
	jr z, .next
	cp EFFECTIVE ; 1.0
	jr nc, .neutral

; not very effective
	ld a, e
	cp 1 ; 0.1
	jr nc, .next
	ld e, 1
	jr .next

.neutral
	ld e, 2
	jr .next

.super_effective
	call .DecreaseScore
	pop hl
	jr .done

.next
	pop hl
	dec d
	jr nz, .loop

.exit
	ld a, e
	cp 2
	jr z, .done
	call .IncreaseScore
	ld a, e
	and a
	call z, .IncreaseScore
	jr .done

.unknown_moves
	ld a, [wBattleMonType1]
	ld b, a
	ld hl, wEnemyMonType1
	farcall CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1 ; 1.0 + 0.1
	call nc, .DecreaseScore
	ld a, [wBattleMonType2]
	cp b
	jr z, .ok2
	farcall CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1 ; 1.0 + 0.1
	call nc, .DecreaseScore
.ok2

.done
	call .CheckEnemyMoveMatchups
	jmp PopBCDEHL

.CheckEnemyMoveMatchups:
	ld de, wEnemyMonMoves
	lb bc, NUM_MOVES + 1, 0

	ld a, [wTypeMatchup]
	push af
.loop2
	dec b
	jr z, .exit2

	ld a, [de]
	and a
	jr z, .exit2

	inc de
	call GetMoveTypeIfDamaging
	jr z, .loop2

	ld hl, wBattleMonType1
	farcall CheckTypeMatchup

	ld a, [wTypeMatchup]
	; immune
	and a
	jr z, .loop2

	; not very effective
	inc c
	cp EFFECTIVE
	jr c, .loop2

	; neutral
	inc c
	inc c
	inc c
	inc c
	inc c
	cp EFFECTIVE
	jr z, .loop2

	; super effective
	ld c, 100
	jr .loop2

.exit2
	pop af
	ld [wTypeMatchup], a

	ld a, c
	and a
	jr z, .doubledown ; double down
	cp 5
	jr c, .DecreaseScore ; down
	cp 100
	ret c
	jr .IncreaseScore ; up

.doubledown
	call .DecreaseScore
.DecreaseScore:
	ld hl, wEnemyAISwitchScore
	dec [hl]
	ret

.IncreaseScore:
	ld hl, wEnemyAISwitchScore
	inc [hl]
	ret

FindAliveEnemyMons:
	ld a, [wOTPartyCount]
	cp 2
	jr c, .only_one

	ld d, a
	ld e, 0
	lb bc, 1 << (PARTY_LENGTH - 1), 0
	ld hl, wOTPartyMon1HP

.loop
	ld a, e
	farcall IsEnemyMonOnField
	jr z, .next

	push bc
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	pop bc
	jr z, .next

	ld a, c
	or b
	ld c, a

.next
	srl b
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc e
	dec d
	jr nz, .loop

	ld a, c
	and a
	jr nz, .more_than_one

.only_one
	scf
	ret

.more_than_one
	and a
	ret

GetMoveTypeIfDamaging:
; returns the type of move a in a, and sets the zero flag depending on whether the move causes damage
; clobbers hl
	push bc
	call GetMoveAddress
	ld b, a
	rept MOVE_POWER - 1
		inc hl
	endr
	call GetFarByte
	ld c, a
	ld a, b
	inc hl
	call GetFarByte
	inc c
	dec c
	pop bc
	ret
