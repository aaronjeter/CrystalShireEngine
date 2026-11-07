; The doubles AI (double battles phase 6), in Battle Core 2 (bank $7e).
; Each enemy battler scores its moves against each foe with the trainer class's usual
; scoring layers (AIScoreMoves), then a small doubles layer adjusts the move/target pairs:
; - spread moves (BOTH_FOES, ALL_OTHERS) get the average of both foes' scores, -1 when
;   they would damage both;
; - a single-target move that should knock its target out gets -2;
; - a single-target move aimed at a foe an earlier enemy's move should knock out this turn
;   gets +DOUBLES_AI_OVERKILL (no overkill; above AI_PLAN's knockout bonus);
; - a damaging move that would do no damage to a foe gets +10 for that foe;
; - focus fire: a single-target move that should knock out the foe an earlier enemy's attack
;   aims at, with that attack's damage, gets -DOUBLES_AI_FOCUS_BONUS;
; - a single-target move aimed at a foe that may use Protect (seen using Protect or Detect,
;   and didn't use it last turn) gets +DOUBLES_AI_PROTECT_RISK while the other foe is out;
; - Protect, Detect and Endure right after this battler used one get +DOUBLES_AI_PROTECT_AGAIN
;   (they would likely fail); Protect and Detect get -DOUBLES_AI_PROTECT_BONUS when a foe
;   should knock this battler out in one hit and its partner is out to act.
; The lowest score wins, with random ties, as in singles.

DEF DOUBLES_AI_SPREAD_BONUS  EQU 1
DEF DOUBLES_AI_KO_BONUS      EQU 2
DEF DOUBLES_AI_OVERKILL      EQU 30 ; above AI_PLAN's knockout bonus (move_plan.asm)
DEF DOUBLES_AI_NO_EFFECT     EQU 10
DEF DOUBLES_AI_FOCUS_BONUS   EQU 5
DEF DOUBLES_AI_PROTECT_RISK  EQU 2
DEF DOUBLES_AI_PROTECT_AGAIN EQU 30
DEF DOUBLES_AI_PROTECT_BONUS EQU 8

DoublesAIChooseMove:
; The enemy battler in slot c (loaded) chooses its move and target: wCurEnemyMove,
; wCurEnemyMoveNum and BATTLER_LINK_TARGET. A battler locked into a move keeps both.
; Clobbers everything.
	ld a, c
	ld [wDoublesAISelf], a
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
	ld hl, wDoublesAIDamage
	ld bc, 2 * NUM_MOVES
	xor a
	rst ByteFill
	ld [wDoublesAIHits], a
	ld [wDoublesAIKOs], a
	ld [wDoublesAIDamaging], a
	ld [wDoublesAIUntargeted], a
	ld [wDoublesAIFocus], a
	ld [wDoublesAIGuarded], a
	dec a
	ld [wDoublesAIThreat], a
	xor a

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
	call DoublesAIOwnProtect
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
	jr z, .plan
	ld a, [wDoublesAIDoomed]
	or b
	ld [wDoublesAIDoomed], a
	ret

.plan
; a single-target attack that won't knock its target out: the next enemy may join in
	ld a, [wDoublesAIHits]
	and d
	ret z
	ld hl, wDoublesAIDamage
	ld e, c
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wDoublesAIPlanDamage], a
	ld a, b
	ld [wDoublesAIPlanSlot], a
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
; wDoublesAIHits, wDoublesAIKOs and wDoublesAIFocus, each move's damage in wDoublesAIDamage,
; its threat in wDoublesAIThreat and whether it may Protect in wDoublesAIGuarded.
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

; the fewest hits a foe needs to knock this enemy out
	xor a
	ld [wSAIPredicted], a
	call SAI_PrepareLearnset
	call SAI_ScoreActive
	ld a, [wSAIHitsTaken]
	ld hl, wDoublesAIThreat
	cp [hl]
	jr nc, .threat_done
	ld [hl], a
.threat_done

; a foe that may Protect: seen using Protect or Detect, and didn't use it last turn
	ld a, [wPlayerProtectCount]
	and a
	jr nz, .guard_done
	ld hl, wPlayerUsedMoves
	ld b, NUM_MOVES
.guard_loop
	ld a, [hli]
	and a
	jr z, .guard_done
	push hl
	ld l, a
	ld a, MOVE_EFFECT
	call GetMoveAttribute
	pop hl
	cp EFFECT_PROTECT
	jr z, .guarded
	dec b
	jr nz, .guard_loop
	jr .guard_done

.guarded
	ld a, [wDoublesAIBase]
	and a
	ld a, 1 ; foe A
	jr z, .guard_bit
	add a ; foe B
.guard_bit
	ld hl, wDoublesAIGuarded
	or [hl]
	ld [hl], a
.guard_done

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
	; drawn away by the foe's ally (Lightning Rod, Storm Drain)
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	ld e, a
	ld a, [wAreaSlots]
	ld d, a
	farcall RedirectTargetSlot
	cp d
	jr nz, .next
	; (0 against an ability that makes the foe immune or absorbs it: AIDamageCalc)
	farcall AIDamageCalc
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	or b
	jr z, .next
	; its damage, halved and capped, for the next enemy's focus fire
	ld hl, sp + 0 ; c of the pushed bc: the move
	ld a, [wDoublesAIBase]
	add [hl]
	ld e, a
	ld d, 0
	ld hl, wDoublesAIDamage
	add hl, de
	ld a, [wCurDamage]
	ld d, a
	ld a, [wCurDamage + 1]
	srl d
	rra
	inc d
	dec d
	jr z, .halved
	ld a, $ff
.halved
	ld [hl], a
	ld de, wDoublesAIHits
	call .SetBit
	; knocks it out: damage >= HP
	ld a, [wCurDamage]
	ld b, a
	ld a, [wBattleMonHP]
	cp b
	jr c, .ko
	jr nz, .not_ko
	ld a, [wCurDamage + 1]
	ld b, a
	ld a, [wBattleMonHP + 1]
	cp b
	jr z, .ko
	jr nc, .not_ko
.ko
	ld de, wDoublesAIKOs
	call .SetBit
	jr .next

.not_ko
	; with an earlier enemy's planned attack on this foe, it should knock it out
	call .FocusKO
	jr nc, .next
	ld de, wDoublesAIFocus
	call .SetBit
.next
	pop bc
	inc c
	ld a, c
	cp NUM_MOVES
	jmp nz, .damage_loop
	ret

.FocusKO:
; Carry if this foe is the one an earlier enemy's attack aims at (wDoublesAIPlanSlot) and
; wCurDamage plus that attack's damage is at least its HP.
	ld a, [wDoublesAIBase]
	and a
	ld a, [wDoublesAIFoes]
	jr z, .got_slot
	ld a, [wDoublesAIFoes + 1]
.got_slot
	call DoublesAIChooseMove.SlotMask
	ld hl, wDoublesAIPlanSlot
	and [hl]
	ret z ; no carry
	ld a, [wDoublesAIPlanDamage]
	ld l, a
	ld h, 0
	add hl, hl
	ld a, [wCurDamage]
	ld d, a
	ld a, [wCurDamage + 1]
	ld e, a
	add hl, de
	; HP - the combined damage
	ld a, [wBattleMonHP + 1]
	sub l
	ld e, a
	ld a, [wBattleMonHP]
	sbc h
	ret c ; HP < the combined damage
	or e
	ret nz ; no carry: HP > the combined damage
	scf
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
	jr .guard
.no_ko
	; focus fire: with an earlier enemy's attack, it should knock the foe out
	ld a, [wDoublesAIFocus]
	and e
	jr z, .guard
	ld a, b
	sub DOUBLES_AI_FOCUS_BONUS
	jr nc, .focus_ok
	xor a
.focus_ok
	ld b, a
.guard
	; a foe that may Protect, while the other foe is out: the attack may be blocked
	ld a, [wDoublesAIFoes + 1]
	cp $ff
	jr z, .no_guard
	ld a, c
	and NUM_MOVES ; foe B?
	ld a, [wDoublesAIGuarded]
	jr z, .guard_a
	rra
.guard_a
	rra
	jr nc, .no_guard
	ld a, b
	add DOUBLES_AI_PROTECT_RISK
	jr c, .guard_cap
	cp $ff
	jr c, .guard_ok
.guard_cap
	ld a, $fe
.guard_ok
	ld b, a
.no_guard
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

DoublesAIOwnProtect:
; Protect, Detect and Endure: +DOUBLES_AI_PROTECT_AGAIN right after this battler used one.
; Protect and Detect otherwise: -DOUBLES_AI_PROTECT_BONUS when a foe should knock this
; battler out in one hit (wDoublesAIThreat) and its partner is out to act.
	ld c, 0
.loop
	ld hl, wEnemyMonMoves
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld l, a
	ld a, MOVE_EFFECT
	call GetMoveAttribute
	ld e, a ; the effect
	ld hl, wDoublesAIScores
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .next
	ld d, a ; the score
	ld a, e
	cp EFFECT_ENDURE
	jr z, .protect
	cp EFFECT_PROTECT
	jr nz, .next
.protect
	ld a, [wEnemyProtectCount]
	and a
	jr z, .fresh
	ld a, d
	add DOUBLES_AI_PROTECT_AGAIN
	jr c, .cap
	cp $ff
	jr c, .store
.cap
	ld a, $fe
	jr .store

.fresh
	ld a, e
	cp EFFECT_PROTECT
	jr nz, .next
	ld a, [wDoublesAIThreat]
	cp 2
	jr nc, .next
	ld a, [wDoublesAISelf]
	xor 1 ; the partner's slot
	call DoublesAIChooseMove.IsSlotEmpty
	jr nz, .next
	ld a, d
	sub DOUBLES_AI_PROTECT_BONUS
	jr nc, .store
	xor a
.store
	ld [hl], a
.next
	inc c
	ld a, c
	cp NUM_MOVES
	jr nz, .loop
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
