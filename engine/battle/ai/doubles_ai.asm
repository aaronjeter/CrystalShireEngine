; The doubles AI (double battles phase 6), in Battle Core 2 (bank $7e).
; Each enemy battler scores its moves against each foe with the trainer class's usual
; scoring layers (AIScoreMoves), then a small doubles layer adjusts the move/target pairs:
; - spread moves (BOTH_FOES, ALL_OTHERS) get the average of both foes' scores, -1 when
;   they would damage both;
; - a single-target move that should knock its target out gets -2;
; - a single-target move aimed at a foe an earlier enemy's move should knock out this turn
;   gets +10 (no overkill);
; - a damaging move that would do no damage to a foe gets +10 for that foe.
; The lowest score wins, with random ties, as in singles.

DEF DOUBLES_AI_SPREAD_BONUS EQU 1
DEF DOUBLES_AI_KO_BONUS     EQU 2
DEF DOUBLES_AI_OVERKILL     EQU 10
DEF DOUBLES_AI_NO_EFFECT    EQU 10

DoublesAIChooseMove:
; The enemy battler in slot c (loaded) chooses its move and target: wCurEnemyMove,
; wCurEnemyMoveNum and BATTLER_LINK_TARGET. A battler locked into a move keeps both.
; Clobbers everything.
	farcall CheckEnemyLockedIn
	ret nz

; foe A: the opposite slot, or the other foe; foe B: the other foe if it's out
	ld a, c
	xor %10
	call .IsSlotEmpty
	jr z, .got_foe_a
	xor 1
	call .IsSlotEmpty
	ret nz ; no foe out
.got_foe_a
	ld [wDoublesAIFoes], a
	xor 1
	call .IsSlotEmpty
	jr z, .got_foe_b
	ld a, $ff
.got_foe_b
	ld [wDoublesAIFoes + 1], a

	ld hl, wDoublesAIScores
	ld bc, 2 * NUM_MOVES
	ld a, $ff
	rst ByteFill
	xor a
	ld [wDoublesAIHits], a
	ld [wDoublesAIKOs], a
	ld [wDoublesAIDamaging], a
	ld [wDoublesAIUntargeted], a

; score against foe A, then foe B
	ld [wDoublesAIBase], a
	ld a, [wDoublesAIFoes]
	call DoublesAIScoreFoe
	ld a, [wDoublesAIFoes + 1]
	cp $ff
	jr z, .scored
	push af
	ld a, NUM_MOVES
	ld [wDoublesAIBase], a
	pop af
	call DoublesAIScoreFoe
.scored
	call DoublesAINoEffect
	call DoublesAITargetTypes
	call DoublesAIPick

; set the choice: wCurEnemyMove(Num) and the target
	ld a, c
	and NUM_MOVES - 1
	ld [wCurEnemyMoveNum], a
	ld e, a
	ld d, 0
	ld hl, wEnemyMonMoves
	add hl, de
	ld a, [hl]
	ld [wCurEnemyMove], a
	ld hl, wDoublesAIFoes
	bit 2, c ; foe B?
	jr z, .got_target
	inc hl
.got_target
	ld a, [hl]
	call .SlotMask
	ld [wEnemyBattlerLinks + BATTLER_LINK_TARGET], a
	ld b, a

; a single-target move that should knock its target out: the other enemy leaves that foe be
	ld a, c
	call .ChoiceBit ; a = the choice's bit in wDoublesAIKOs, e = the move's bit
	ld d, a
	ld a, [wDoublesAIUntargeted]
	and e
	ret nz
	ld a, [wDoublesAIKOs]
	and d
	ret z
	ld a, [wDoublesAIDoomed]
	or b
	ld [wDoublesAIDoomed], a
	ret

.ChoiceBit:
; a = the bit of choice a (0-7: move + 4 * foe) in wDoublesAIHits/KOs; e = the move's bit.
	push af
	and NUM_MOVES - 1
	call .MoveBit
	ld e, a
	pop af
	bit 2, a
	ld a, e
	ret z
	swap a
	ret

.MoveBit:
; a = 1 << a (0-7). Preserves bc, de and hl.
	push bc
	inc a
	ld b, a
	xor a
	scf
.bit_loop
	rla
	dec b
	jr nz, .bit_loop
	pop bc
	ret

.SlotMask:
; a = 1 << slot a. Preserves bc, de and hl.
	and %11
	jr .MoveBit

.IsSlotEmpty:
; nz if slot a has no battler. Preserves a, bc, de and hl.
	push bc
	ld c, a
	call .SlotMask
	ld b, a
	ld a, [wEmptyBattlerSlots]
	and b
	ld a, c
	pop bc
	ret

DoublesAIScoreFoe:
; Load the player's battler in slot a and score the loaded enemy's moves against it into
; wDoublesAIScores + [wDoublesAIBase] ($fe at most), with its bits in wDoublesAIDamaging,
; wDoublesAIHits and wDoublesAIKOs.
	farcall SwapInBattlerSlot
	farcall AIScoreMoves
	ld hl, wDoublesAIBase
	ld e, [hl]
	ld d, 0
	ld hl, wDoublesAIScores
	add hl, de
	ld d, h
	ld e, l
	ld hl, wEnemyAIMoveScores
	ld c, NUM_MOVES
.copy
	ld a, [hli]
	cp $ff
	jr nz, .copy_ok
	dec a
.copy_ok
	ld [de], a
	inc de
	dec c
	jr nz, .copy

; damage of each move against this foe
	ld c, 0
.damage_loop
	push bc
	ld hl, wEnemyMonMoves
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	ld de, wEnemyMoveStruct
	call GetMoveData
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .next
	ld de, wDoublesAIDamaging
	call .SetBit
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	and TYPE_MASK
	ld b, a
	; Levitate, Waterproof, Lightning Rod, Storm Drain
	ld a, [wBattleMonAbility]
	farcall AbilityTypeImmunity
	jr c, .next
	; drawn away by the foe's ally (Lightning Rod, Storm Drain)
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	ld e, a
	ld a, [wAreaSlots]
	ld d, a
	farcall RedirectTargetSlot
	cp d
	jr nz, .next
	farcall AIDamageCalc
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	or b
	jr z, .next
	ld de, wDoublesAIHits
	call .SetBit
	; knocks it out: damage >= HP
	ld a, [wCurDamage]
	ld b, a
	ld a, [wBattleMonHP]
	cp b
	jr c, .ko
	jr nz, .next
	ld a, [wCurDamage + 1]
	ld b, a
	ld a, [wBattleMonHP + 1]
	cp b
	jr z, .ko
	jr nc, .next
.ko
	ld de, wDoublesAIKOs
	call .SetBit
.next
	pop bc
	inc c
	ld a, c
	cp NUM_MOVES
	jr nz, .damage_loop
	ret

.SetBit:
; Set the bit of the move being checked (c of the bc pushed by the loop) against this foe in
; [de]. Clobbers a and b.
	ld hl, sp + 2
	ld a, [wDoublesAIBase]
	add [hl]
	call DoublesAIChooseMove.MoveBit
	ld b, a
	ld a, [de]
	or b
	ld [de], a
	ret

DoublesAINoEffect:
; A damaging move that would do no damage to a foe (type immunity, Levitate...): +10 for
; that choice, as AI_Basic dismisses a move.
	ld hl, wDoublesAIScores
	ld c, 0
.loop
	ld a, c
	call DoublesAIChooseMove.ChoiceBit
	ld b, a
	ld a, [wDoublesAIDamaging]
	and b
	jr z, .next
	ld a, [wDoublesAIHits]
	and b
	jr nz, .next
	ld a, [hl]
	cp $ff
	jr z, .next
	add DOUBLES_AI_NO_EFFECT
	jr c, .cap
	cp $ff
	jr c, .store
.cap
	ld a, $fe
.store
	ld [hl], a
.next
	inc hl
	inc c
	ld a, c
	cp 2 * NUM_MOVES
	jr nz, .loop
	ret

DoublesAITargetTypes:
; Fold each move's two scores by its target type (spread, single target or none), then
; apply the KO and overkill adjustments.
	ld c, 0
.loop
	ld hl, wEnemyMonMoves
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no_move
	farcall GetMoveTarget
	and a ; MOVE_TARGET_SELECTED
	jr z, .single
	cp MOVE_TARGET_BOTH_FOES
	jr z, .spread
	cp MOVE_TARGET_ALL_OTHERS
	jr z, .spread
	cp MOVE_TARGET_RANDOM_FOE
	jr z, .random
; not aimed at a foe: one choice, scored against foe A
	call .Untargeted
	jr .next

.no_move
	call .ScoreAddrs
	ld a, $ff
	ld [hl], a
	ld [de], a
	jr .next

.random
; Thrash and the like: the target is random, so the average, as one choice
	call .Average
	call .Untargeted
	jr .next

.spread
	call .Average
	jr nz, .one_foe
	; both foes out: a bonus if it damages both
	ld a, c
	call DoublesAIChooseMove.MoveBit
	ld b, a
	swap a
	or b
	ld b, a
	ld a, [wDoublesAIHits]
	and b
	cp b
	jr nz, .no_bonus
	call .ScoreAddrs
	ld a, [hl]
	sub DOUBLES_AI_SPREAD_BONUS
	jr nc, .bonus_ok
	xor a
.bonus_ok
	ld [hl], a
.no_bonus
	call .Untargeted
	jr .next

.one_foe
	; only foe A is out: it's a single-target move against it
.single
	call .Adjust
.next
	inc c
	ld a, c
	cp NUM_MOVES
	jr nz, .loop
	ret

.ScoreAddrs:
; hl = move c's score against foe A, de = against foe B. Preserves bc.
	ld hl, wDoublesAIScores
	ld b, 0
	add hl, bc
	ld d, h
	ld e, l
	inc de
	inc de
	inc de
	inc de
	ret

.Untargeted:
; Move c is one choice: the score against foe B is dropped. Preserves bc.
	call .ScoreAddrs
	ld a, $ff
	ld [de], a
	ld a, c
	call DoublesAIChooseMove.MoveBit
	ld hl, wDoublesAIUntargeted
	or [hl]
	ld [hl], a
	ret

.Average:
; Move c's score against foe A = the average of both foes' scores. nz if foe B isn't out.
; Preserves bc.
	ld a, [wDoublesAIFoes + 1]
	cp $ff
	jr z, .no_foe_b
	call .ScoreAddrs
	ld a, [de]
	add [hl]
	rra ; carry in, so no overflow
	ld [hl], a
	xor a ; z
	ret

.no_foe_b
	or a ; nz
	ret

.Adjust:
; A single-target move c: the KO bonus and the overkill penalty for each foe. Preserves bc.
	ld a, c
	call .AdjustFoe
	ld a, c
	add NUM_MOVES
	; fallthrough

.AdjustFoe:
; Choice a (move + 4 * foe). Preserves bc.
	push bc
	ld c, a
	ld hl, wDoublesAIScores
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .adjust_done
	ld b, a ; score
	ld a, c
	call DoublesAIChooseMove.ChoiceBit
	ld e, a
	ld a, [wDoublesAIKOs]
	and e
	jr z, .no_ko
	ld a, b
	sub DOUBLES_AI_KO_BONUS
	jr nc, .ko_ok
	xor a
.ko_ok
	ld b, a
.no_ko
	; aimed at a doomed foe?
	ld a, c
	and NUM_MOVES ; foe B?
	ld de, wDoublesAIFoes
	jr z, .got_foe
	inc de
.got_foe
	ld a, [de]
	call DoublesAIChooseMove.SlotMask
	ld e, a
	ld a, [wDoublesAIDoomed]
	and e
	jr z, .store
	ld a, b
	add DOUBLES_AI_OVERKILL
	jr c, .cap
	cp $ff
	jr c, .store_a
.cap
	ld a, $fe
.store_a
	ld b, a
.store
	ld [hl], b
.adjust_done
	pop bc
	ret

DoublesAIPick:
; c = the choice (move + 4 * foe) with the lowest score, random among ties.
	ld hl, wDoublesAIScores
	ld b, 2 * NUM_MOVES
	ld c, $ff
.min_loop
	ld a, [hli]
	cp c
	jr nc, .not_lower
	ld c, a
.not_lower
	dec b
	jr nz, .min_loop
	ld b, c ; the lowest score
.random
	call Random
	and 2 * NUM_MOVES - 1
	ld c, a
	ld hl, wDoublesAIScores
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	cp b
	jr nz, .random
	ret
