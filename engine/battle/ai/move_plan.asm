; The AI_PLAN move layer, in Battle Core 2.
; It runs after the class's other layers (AI_Plan in scoring.asm farjumps here) and makes
; the big calls with the switch scorer's 1-on-1 estimate (switch_score.asm), so they
; don't hang on the other layers' random rolls (lower scores are better):
; - a move that knocks the player out even on a low damage roll: -PLAN_KO_BONUS
;   (-PLAN_RISKY_KO_BONUS if it's under 80% accurate, or if the AI is slower and goes
;   down to the player's next hit, unless the move has priority);
; - the strongest damaging move: -PLAN_BEST_HIT_BONUS (a mild lean toward attacking);
; - set-up and stat moves (SetupEffects): +PLAN_UNSAFE if the player knocks the AI out in
;   2 hits or fewer, -PLAN_SAFE_SETUP_BONUS if it takes 3 or more;
; - healing: +PLAN_UNSAFE if it can't save the Pokemon (slower: the hit lands first;
;   faster: the hit still beats HP + heal), -PLAN_HEAL_BONUS at half HP or below when
;   the heal outpaces the player's hit;
; - any other status move: +PLAN_UNSAFE when the AI is slower and goes down to the next
;   hit (Protect and Endure excepted).
; Damage: AIDamageCalc (the full calculation, no roll, no crit) for the AI's own moves;
; the player's best threat from SAI_ScoreActive (seen moves, assumed STAB and coverage).

DEF PLAN_KO_BONUS EQU 20
DEF PLAN_RISKY_KO_BONUS EQU 10
DEF PLAN_BEST_HIT_BONUS EQU 2
DEF PLAN_UNSAFE EQU 10
DEF PLAN_SAFE_SETUP_BONUS EQU 3
DEF PLAN_HEAL_BONUS EQU 8
DEF PLAN_MIN_ACCURACY EQU 80 percent
; every score is raised by this first, so the bonuses never hit the floor of 1 and erase
; the order the other layers set (only the lowest score matters to AIPickLowestScore)
DEF PLAN_OFFSET EQU 32

; switch scorer temporaries that are free once SAI_ScoreActive has run
DEF wPlanThreat   EQUS "wSAICandHP"    ; dw: the player's best threat (big-endian)
DEF wPlanBestDmg  EQUS "wSAIMovesPtr"  ; dw: the AI's best damage so far (big-endian)
DEF wPlanBestMove EQUS "wSAIBestIndex" ; its move slot ($ff: none)
DEF wPlanIndex    EQUS "wSAICurIndex"  ; the move slot being scored

AIPlanScoreMoves:
; The enemy's active Pokemon and the player's battler are loaded.
	xor a
	ld [wSAIPredicted], a
	call SAI_PrepareLearnset
	call SAI_ScoreActive ; wSAIHitsTaken, wSAIFaster, wSAIBestDmg = the player's threat
	ld hl, wSAIBestDmg
	ld de, wPlanThreat
	call SAI_Copy2
	xor a
	ld [wPlanBestDmg], a
	ld [wPlanBestDmg + 1], a
	ld [wPlanIndex], a
	dec a
	ld [wPlanBestMove], a
	ld hl, wEnemyAIMoveScores
	ld c, NUM_MOVES
.offset
	ld a, [hl]
	add PLAN_OFFSET
	jr nc, .offset_ok
	ld a, $ff
.offset_ok
	ld [hli], a
	dec c
	jr nz, .offset

.loop
	ld a, [wPlanIndex]
	cp NUM_MOVES
	jmp z, .done
	ld c, a
	ld b, 0
	ld hl, wEnemyMonMoves
	add hl, bc
	ld a, [hl]
	and a
	jmp z, .done
	ld hl, wEnemyAIMoveScores
	add hl, bc
	ld b, a
	ld a, [hl]
	cp 80 + PLAN_OFFSET
	jmp nc, .next ; unusable (no PP, disabled, taunted)
	ld a, b
	ld de, wEnemyMoveStruct
	call GetMoveData
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .status_move

; a damaging move
	farcall AIDamageCalc
	ld hl, wPlanBestDmg + 1
	ld a, [wCurDamage + 1]
	sub [hl]
	dec hl
	ld a, [wCurDamage]
	sbc [hl]
	jr c, .not_best
	ld a, [wCurDamage]
	ld [hli], a
	ld a, [wCurDamage + 1]
	ld [hl], a
	ld a, [wPlanIndex]
	ld [wPlanBestMove], a
.not_best
; a knockout even on a low roll: damage - damage / 8 >= the player's HP
	ld a, [wCurDamage]
	ld d, a
	ld a, [wCurDamage + 1]
	ld e, a
	ld b, d
	ld c, e
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld a, [wBattleMonHP + 1]
	sub e
	ld c, a
	ld a, [wBattleMonHP]
	sbc d
	jr c, .ko ; HP < damage
	or c
	jr nz, .next_jr ; HP > damage
.ko
	ld e, PLAN_KO_BONUS
	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp PLAN_MIN_ACCURACY
	jr nc, .accurate
	ld e, PLAN_RISKY_KO_BONUS
.accurate
	call .AboutToFaint
	jr nc, .got_ko_bonus
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_PRIORITY_HIT
	jr z, .got_ko_bonus
	cp EFFECT_SUCKER_PUNCH
	jr z, .got_ko_bonus
	ld e, PLAN_RISKY_KO_BONUS
.got_ko_bonus
	ld a, e
	call .Encourage
.next_jr
	jmp .next

.status_move
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_HEAL
	jr z, .heal
	cp EFFECT_MORNING_SUN
	jr z, .heal
	cp EFFECT_SYNTHESIS
	jr z, .heal
	cp EFFECT_MOONLIGHT
	jr z, .heal
	cp EFFECT_PROTECT
	jr z, .next_jr
	cp EFFECT_ENDURE
	jr z, .next_jr
	farcall AIPlan_IsSetupEffect
	jr c, .setup
; any other status move: not as the last act of a Pokemon about to faint
	call .AboutToFaint
	jr nc, .next_jr
	call .Discourage
	jr .next_jr

.setup
	ld a, [wSAIHitsTaken]
	cp 3
	jr nc, .safe_setup
	call .Discourage
	jr .next_jr
.safe_setup
	ld a, PLAN_SAFE_SETUP_BONUS
	call .Encourage
	jr .next_jr

.heal
; bc = HP, de = max HP / 2 (the heal)
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ld a, b
	cp d
	jr nz, .not_full
	ld a, c
	cp e
	jr z, .next_jr ; full HP: the other layers already handle it
.not_full
	srl d
	rr e
; pointless: slower and the hit beats HP, or faster and it beats HP + heal
	ld a, [wSAIFaster]
	and a
	ld h, b
	ld l, c
	jr z, .got_survive_hp
	add hl, de
.got_survive_hp
	ld a, [wPlanThreat + 1]
	sub l
	ld a, [wPlanThreat]
	sbc h
	jr c, .heal_helps ; threat < HP (+ heal)
	call .Discourage
	jr .next_jr
.heal_helps
; at half HP or below, and the heal beats the hit
	ld a, e
	sub c
	ld a, d
	sbc b
	jr c, .next_jr ; HP > max HP / 2
	ld a, [wPlanThreat + 1]
	sub e
	ld a, [wPlanThreat]
	sbc d
	jr nc, .next_jr ; threat >= heal
	ld a, PLAN_HEAL_BONUS
	call .Encourage

.next
	ld hl, wPlanIndex
	inc [hl]
	jmp .loop

.done
	ld a, [wPlanBestMove]
	cp $ff
	ret z
	ld [wPlanIndex], a
	ld a, PLAN_BEST_HIT_BONUS
	; fallthrough

.Encourage:
; Lower move [wPlanIndex]'s score by a, to at least 1.
	ld e, a
	call .ScorePointer
	ld a, [hl]
	sub e
	jr c, .floor
	jr nz, .store
.floor
	ld a, 1
.store
	ld [hl], a
	ret

.Discourage:
; Raise move [wPlanIndex]'s score by PLAN_UNSAFE, to at most $ff.
	call .ScorePointer
	ld a, [hl]
	add PLAN_UNSAFE
	jr nc, .store
	ld a, $ff
	jr .store

.ScorePointer:
	ld a, [wPlanIndex]
	ld c, a
	ld b, 0
	ld hl, wEnemyAIMoveScores
	add hl, bc
	ret

.AboutToFaint:
; Carry if the AI is slower and goes down to the player's next hit.
	ld a, [wSAIFaster]
	and a
	ret nz ; no carry
	ld a, [wSAIHitsTaken]
	cp 2 ; carry if 1
	ret
