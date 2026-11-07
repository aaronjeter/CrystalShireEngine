; The AI_PLAN move layer, in Battle Core 2.
; It runs after the class's other layers (AI_Plan in scoring.asm farjumps here) and makes
; the big calls with the switch scorer's 1-on-1 estimate (switch_score.asm), so they
; don't hang on the other layers' random rolls (lower scores are better):
; - a move that knocks the player out even on a low damage roll: -PLAN_KO_BONUS
;   (-PLAN_RISKY_KO_BONUS if it's under 80% accurate, or if the AI is slower and goes
;   down to the player's next hit, unless the move has priority); not against Sturdy or a Focus Sash
;   at full HP, unless the move hits more than once;
; - a contact move that doesn't knock the player out, when Rough Skin, Iron Barbs or a Rocky
;   Helmet would knock the AI out: +PLAN_UNSAFE;
; - the strongest damaging move: -PLAN_BEST_HIT_BONUS (a mild lean toward attacking; a contact
;   move counts 3/4 of its damage if Static, Flame Body, Poison Point, Frigid or Effect Spore
;   may give the AI a status condition);
; - set-up and stat moves (SetupEffects): +PLAN_UNSAFE if the player knocks the AI out in
;   2 hits or fewer, -PLAN_SAFE_SETUP_BONUS if it takes 3 or more;
; - healing: +PLAN_UNSAFE if it can't save the Pokemon (slower: the hit lands first;
;   faster: the hit still beats HP + heal), -PLAN_HEAL_BONUS at half HP or below when
;   the heal outpaces the player's hit;
; - any other status move: +PLAN_UNSAFE when the AI is slower and goes down to the next
;   hit (Protect and Endure excepted).
; Damage: AIDamageCalc (the full calculation, no roll, no crit; 0 against an ability that makes
; the player immune or absorbs the move) for the AI's own moves;
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
	jmp z, .status_move

; a damaging move
	farcall AIDamageCalc
	ld a, [wCurDamage]
	ld d, a
	ld a, [wCurDamage + 1]
	ld e, a
	or d
	jmp z, .next ; no damage (an immunity, or an ability that absorbs it)
; the strongest hit: a contact move counts 3/4 of its damage when Static and the like may hit back
	call .ContactStatusRisk
	jr nc, .compare
	ld b, d
	ld c, e
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
.compare
	ld hl, wPlanBestDmg + 1
	ld a, e
	sub [hl]
	dec hl
	ld a, d
	sbc [hl]
	jr c, .not_best
	ld a, d
	ld [hli], a
	ld [hl], e
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
	jr nz, .no_ko ; HP > damage
.ko
	call .Survives
	jr c, .no_ko
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

.no_ko
; a contact move whose recoil would knock the AI out
	call .RecoilFaints
	call c, .Discourage
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
	jr c, .next ; HP > max HP / 2
	ld a, [wPlanThreat + 1]
	sub e
	ld a, [wPlanThreat]
	sbc d
	jr nc, .next ; threat >= heal
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

.Survives:
; Carry if the player is at full HP and Sturdy or a Focus Sash would leave it at 1 HP
; (not against a multi-hit move: its first hit breaks them).
	ld hl, wBattleMonHP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli] ; max HP
	cp b
	jr nz, .no
	ld a, [hl]
	cp c
	jr nz, .no
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_MULTI_HIT
	jr z, .no
	cp EFFECT_DOUBLE_HIT
	jr z, .no
	cp EFFECT_POISON_MULTI_HIT
	jr z, .no
	cp EFFECT_TRIPLE_KICK
	jr z, .no
	ld a, 1
	ldh [hBattleTurn], a
	farcall GetBreakableOppAbility
	cp ABILITY_STURDY
	jr z, .yes
	farcall GetOpponentItem
	ld a, b
	cp HELD_FOCUS_SASH
	jr z, .yes
.no
	and a
	ret

.yes
	scf
	ret

.ContactStatusRisk:
; Carry if the move makes contact and the player's Static, Flame Body, Poison Point, Frigid
; or Effect Spore may give the AI a status condition. Preserves de.
	ld a, [wEnemyMonStatus]
	and a
	ret nz
	ld a, [wBattleMonAbility]
	sub ABILITY_STATIC
	cp ABILITY_EFFECT_SPORE - ABILITY_STATIC + 1
	ret nc
	; fallthrough

.IsContact:
; Carry if the move makes contact. Preserves de.
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	farcall GetMoveFlags
	and MOVEFLAG_CONTACT
	ret z
	scf
	ret

.RecoilFaints:
; Carry if the move makes contact and its recoil (Rough Skin and Iron Barbs: 1/8 of the AI's
; max HP; Rocky Helmet: 1/6) would knock the AI out.
	ld a, [wEnemyMonAbility]
	cp ABILITY_MAGIC_GUARD
	jr z, .no
	call .IsContact
	ret nc
	ld de, 0 ; the recoil
	ld a, [wBattleMonAbility]
	cp ABILITY_ROUGH_SKIN
	jr z, .eighth
	cp ABILITY_IRON_BARBS
	jr nz, .helmet
.eighth
	ld a, [wEnemyMonMaxHP]
	ld d, a
	ld a, [wEnemyMonMaxHP + 1]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	ld a, d
	or e
	jr nz, .helmet
	inc e
.helmet
	push de
	ld a, 1
	ldh [hBattleTurn], a
	farcall GetOpponentItem
	pop de
	ld a, b
	cp HELD_ROCKY_HELMET
	jr nz, .got_recoil
	; + max HP / 6, at least 1
	push de
	ld a, [wEnemyMonMaxHP]
	ld h, a
	ld a, [wEnemyMonMaxHP + 1]
	ld l, a
	ld bc, -6
	ld de, 0
.sixth
	add hl, bc
	jr nc, .sixth_done
	inc de
	jr .sixth
.sixth_done
	ld a, d
	or e
	jr nz, .sixth_ok
	inc e
.sixth_ok
	pop hl
	add hl, de
	ld d, h
	ld e, l
.got_recoil
	ld a, d
	or e
	jr z, .no
; carry if HP <= the recoil
	ld a, [wEnemyMonHP + 1]
	ld c, a
	ld a, e
	sub c
	ld a, [wEnemyMonHP]
	ld c, a
	ld a, d
	sbc c
	ccf
	ret

.AboutToFaint:
; Carry if the AI is slower and goes down to the player's next hit.
	ld a, [wSAIFaster]
	and a
	ret nz ; no carry
	ld a, [wSAIHitsTaken]
	cp 2 ; carry if 1
	ret
