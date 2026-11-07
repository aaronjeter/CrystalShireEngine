; The AI's switching, in Battle Core 2 (bank $7e).
;
; AIChooseSwitchIn picks every enemy send-in the game doesn't fix in advance: after a
; faint, U-turn, Volt Switch, Flip Turn, Baton Pass and the doubles send-ins (not the
; lead, not Roar). AIShouldSwitch decides a voluntary switch (AI_SwitchOrTryItem).
;
; A Pokemon's score is a quick 1-on-1 estimate against the player's loaded battler:
; - the hits it needs to knock the player out (its best move),
; - the hits the player needs to knock it out (the player's moves seen so far, plus a
;   SAI_ASSUMED_POWER STAB move of each of the player's types, with its better attack,
;   and a SAI_COVERAGE_POWER neutral move while one of its moves is still unseen),
; - who is faster.
; Damage is a quick formula: the usual level/power/attack/defense part (stats scaled to 8
; bits as the game does), STAB, the type chart, ability immunities (AbilityTypeImmunity),
; Thick Fat / Insulated, rain and sun, Reflect / Light Screen. No items, no other
; abilities, no damage roll or crits. Spikes come off a bench Pokemon's HP first.
; Battle stats (the player's, the enemy's active Pokemon's) include stat stages, burn and
; paralysis (this hack: burn halves Attack unless Guts, frostbite halves Sp. Atk,
; paralysis halves Speed); the bench's party stats get the same cuts here. Sleep counts
; as two lost turns.
;
; score = 89 + 8 * hits taken - 9 * hits needed + 4 if faster (16-156; higher is better)
; The last party Pokemon (the ace) is sent in only when nothing else is left, and never
; by a voluntary switch.

DEF SAI_ASSUMED_POWER EQU 70
DEF SAI_COVERAGE_POWER EQU 60 ; a neutral move assumed while a player move is unseen
DEF SAI_LEVEL_DAMAGE_POWER EQU 60 ; power-1 moves (Seismic Toss, Low Kick...) count as this
DEF SAI_MAX_HITS EQU 9
DEF SAI_SLEEP_TURNS EQU 2
DEF SAI_STAY_PENALTY EQU 8 ; per residual problem of the active Pokemon (one hit's worth)
DEF SAI_STAGE_BONUS EQU 4 ; per stat stage the active Pokemon would lose by leaving
DEF SAI_SWITCH_MARGIN_STEP EQU 8 ; added to the class's margin for each switch already made

; offsets in a stats block (from the Level byte; party and battle structs agree)
DEF SAI_STATUS EQU MON_STATUS - MON_LEVEL
DEF SAI_HP     EQU MON_HP - MON_LEVEL
DEF SAI_MAXHP  EQU MON_MAXHP - MON_LEVEL
DEF SAI_ATK    EQU MON_ATK - MON_LEVEL
DEF SAI_DEF    EQU MON_DEF - MON_LEVEL
DEF SAI_SPD    EQU MON_SPD - MON_LEVEL
DEF SAI_SAT    EQU MON_SAT - MON_LEVEL
DEF SAI_SDF    EQU MON_SDF - MON_LEVEL
	assert wBattleMonAttack - wBattleMonLevel == SAI_ATK
	assert wBattleMonSpclDef - wBattleMonLevel == SAI_SDF
	assert wBattleMonHP - wBattleMonLevel == SAI_HP
	assert wEnemyMonStatus - wEnemyMonLevel == SAI_STATUS

AIChooseSwitchIn:
; out: b = the enemy party index to send in (alive and not on the field).
; Leaves hBattleTurn on the player's turn, as the old type check did.
; Clobbers everything else.
	xor a
	ld [wSAIPredicted], a ; no entry hit
	call SAI_PrepareLearnset
	call SAI_FindBest
	ld a, [wSAIBestIndex]
	cp $ff
	jr nz, .got
; only the ace is left (or, defensively, the last candidate from the end)
	ld a, [wOTPartyCount]
.last_resort
	and a
	jr z, .got ; nothing at all: party index 0
	dec a
	call SAI_IsCandidate
	jr nz, .last_resort
.got
	ld b, a
	xor a
	ldh [hBattleTurn], a
	ret

AIShouldSwitch:
; a = the class's switch tier (SAI_TIER_*) -> carry to switch, with wEnemySwitchMonIndex
; set (party index + 1). The active enemy and the player's battler are loaded.
	push af
	call SAI_PrepareLearnset
; Perish count 1: leave to anything (the ace too), whatever the guards say
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr z, .no_perish
	ld a, [wEnemyPerishCount]
	cp 1
	jr nz, .no_perish
	pop af
	ldh a, [hBattleTurn] ; keep the turn: AI_TryItem follows when no switch
	push af
	call AIChooseSwitchIn
	pop af
	ldh [hBattleTurn], a
	ld a, b
	call SAI_IsCandidate
	jr nz, .no
	jr .switch

.no_perish
; at most (tier) switches per battle
	pop af
	push af
	ld hl, wEnemySwitchCount
	cp [hl]
	jr c, .no_pop
	jr z, .no_pop
; not on the turn after it came in by a switch
	ld a, [wEnemyTurnsTaken]
	and a
	jr nz, .guards_done
	ld a, [wCurOTMon]
	inc a
	ld hl, wEnemyLastSwitchIn
	cp [hl]
	jr z, .no_pop
.guards_done

; staying
	xor a
	ld [wSAIPredicted], a
	call SAI_ScoreActive
; one hit from fainting: fainting gives the next Pokemon a free entry, a switch doesn't
	ld b, a
	ld a, [wSAIHitsTaken]
	cp 1
	jr z, .no_pop
	ld a, b
	call SAI_StayAdjust
	ld [wSAIStayScore], a ; (for tests and tuning)
	push af

; the best switch-in, taking the player's predicted move (its best threat against the
; active Pokemon) as it comes in
	ld hl, wSAIBestMove
	ld de, wSAIPredicted
	call SAI_Copy2
	call SAI_FindBest
	pop bc ; b = staying
	ld a, [wSAIBestIndex]
	cp $ff
	jr z, .no_pop
	ld c, b
	pop af
	ld hl, SwitchTierMargins - 1
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, c
	add [hl]
	jr c, .no ; staying is too good
	ld c, a
; each switch already made raises the margin
	ld a, [wEnemySwitchCount]
	assert SAI_SWITCH_MARGIN_STEP == 8
	add a
	add a
	add a
	add c
	jr c, .no
	ld c, a
	ld a, [wSAIBestScore]
	cp c
	jr c, .no

; not into a Pursuit knockout
	call SAI_PursuitKO
	jr c, .no
	ld a, [wSAIBestIndex]
.switch
	inc a
	ld [wEnemySwitchMonIndex], a
	ld [wEnemyLastSwitchIn], a
	ld hl, wEnemySwitchCount
	inc [hl]
	scf
	ret

.no_pop
	pop af
.no
	and a
	ret

SwitchTierMargins:
; how much better (score) the best switch-in must be than staying, per SAI_TIER_* (plus
; SAI_SWITCH_MARGIN_STEP for each switch already made)
	table_width 1
	db 40 ; SAI_TIER_RARELY
	db 24 ; SAI_TIER_SOMETIMES
	db 12 ; SAI_TIER_OFTEN
	assert_table_length NUM_SAI_TIERS

SAI_FindBest:
; The best bench Pokemon (not the ace): wSAIBestIndex ($ff: none) and wSAIBestScore.
	ld a, $ff
	ld [wSAIBestIndex], a
	xor a
	ld [wSAIBestScore], a
	ld [wSAICurIndex], a
.loop
	ld a, [wSAICurIndex]
	ld b, a
	ld a, [wOTPartyCount]
	cp b
	ret z
	dec a
	cp b
	jr z, .next ; the ace waits
	ld a, b
	call SAI_IsCandidate
	jr nz, .next
	call SAI_ScoreCandidate
	ld hl, wSAIBestScore
	cp [hl]
	jr c, .next
	jr z, .next ; ties: the first in party order
	ld [hl], a
	ld a, [wSAICurIndex]
	ld [wSAIBestIndex], a
.next
	ld hl, wSAICurIndex
	inc [hl]
	jr .loop

SAI_IsCandidate:
; a = enemy party index -> z if it can be sent in (alive, not on the field). Preserves a.
	push hl
	push bc
	ld b, a
	farcall IsEnemyMonOnField
	jr z, .no
	ld a, b
	ld hl, wOTPartyMon1HP
	push bc
	call GetPartyLocation ; clobbers bc
	pop bc
	ld a, [hli]
	or [hl]
	ld a, b
	jr z, .no
	cp a ; z
	jr .done
.no
	ld a, b
	inc b ; nz (b <= 5)
.done
	pop bc
	pop hl
	ret

SAI_ScoreCandidate:
; The bench Pokemon [wSAICurIndex] -> a = its score.
	ld a, [wSAICurIndex]
	ld hl, wOTPartyMon1
	call GetPartyLocation
	push hl

; its types
	ld a, [hl]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, BaseData
	ld a, BANK(BaseData)
	call LoadIndirectPointer
	jr z, .no_types
	ld bc, BASE_TYPES
	add hl, bc
	ld de, wSAICandTypes
	ld bc, 2
	call FarCopyBytes
	jr .got_types
.no_types
	ld a, NORMAL
	ld [wSAICandTypes], a
	ld [wSAICandTypes + 1], a
.got_types

; its ability
	pop hl
	push hl
	farcall GetMonAbility
	ld [wSAICandAbility], a
	ld b, a

; its HP, after Spikes
	pop hl
	push hl
	ld de, MON_HP
	add hl, de
	ld a, [hli]
	ld [wSAICandHP], a
	ld a, [hli]
	ld [wSAICandHP + 1], a
	ld a, [wEnemyScreens]
	bit SCREENS_SPIKES, a
	jr z, .spikes_done
	ld a, b
	cp ABILITY_MAGIC_GUARD
	jr z, .spikes_done
	ld a, [wSAICandTypes]
	cp FLYING
	jr z, .spikes_done
	ld a, [wSAICandTypes + 1]
	cp FLYING
	jr z, .spikes_done
; hl = max HP: 1/8 of it, at least 1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .got_spikes
	inc c
.got_spikes
	ld hl, wSAICandHP + 1
	ld a, [hl]
	sub c
	ld [hld], a
	ld a, [hl]
	sbc b
	ld [hli], a
	jr c, .spikes_ko
	or [hl]
	jr nz, .spikes_done
.spikes_ko
	pop hl
	ld a, 1 ; the worst score
	ret
.spikes_done

; its stats block, moves and Speed (paralysis halves it)
	pop hl
	push hl
	ld de, MON_LEVEL
	add hl, de
	ld a, l
	ld [wSAIDefPtr], a
	ld a, h
	ld [wSAIDefPtr + 1], a
	pop hl
	push hl
	ld de, MON_MOVES
	add hl, de
	ld a, l
	ld [wSAIMovesPtr], a
	ld a, h
	ld [wSAIMovesPtr + 1], a
	pop hl
	push hl
	ld de, MON_STATUS
	add hl, de
	ld e, [hl]
	pop hl
	ld bc, MON_SPD
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	bit PAR, e
	jr z, .got_speed
	srl b
	rr c
.got_speed
	call SAI_SetFaster
	jr SAI_ScoreMon

SAI_ScoreActive:
; The enemy's active Pokemon (battle stats, with stages) -> a = its score.
	ld hl, wEnemyMonType1
	ld de, wSAICandTypes
	call SAI_Copy2
	ld a, [wEnemyMonAbility]
	ld [wSAICandAbility], a
	ld hl, wEnemyMonHP
	ld de, wSAICandHP
	call SAI_Copy2
	ld a, LOW(wEnemyMonLevel)
	ld [wSAIDefPtr], a
	ld a, HIGH(wEnemyMonLevel)
	ld [wSAIDefPtr + 1], a
	ld a, LOW(wEnemyMonMoves)
	ld [wSAIMovesPtr], a
	ld a, HIGH(wEnemyMonMoves)
	ld [wSAIMovesPtr + 1], a
	ld hl, wEnemyMonSpeed
	ld a, [hli]
	ld b, a
	ld c, [hl]
	call SAI_SetFaster
	; fallthrough

SAI_ScoreMon:
; Score the Pokemon set up in wSAICandTypes, wSAICandAbility, wSAICandHP, wSAIDefPtr
; (its stats block), wSAIMovesPtr and wSAIFaster -> a. If wSAIPredicted has a power, it
; takes that move first (a voluntary switch-in). Leaves the player's best threat against
; it in wSAIBestMove and the hits it takes in wSAIHitsTaken.
	ld hl, wSAIDefPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; SAI_STATUS
	ld a, [hl]
	push af

; pass 1: its moves against the player
	ld hl, wSAIDefPtr
	ld de, wSAIAtkPtr
	call SAI_Copy2
	ld a, LOW(wBattleMonLevel)
	ld [wSAIDefPtr], a
	ld a, HIGH(wBattleMonLevel)
	ld [wSAIDefPtr + 1], a
	ld hl, wSAICandTypes
	ld de, wSAIAtkTypes
	call SAI_Copy2
	ld hl, wBattleMonType1
	ld de, wSAIDefTypes
	call SAI_Copy2
	ld a, [wBattleMonAbility]
	ld [wSAIDefAbility], a
	ld a, [wPlayerScreens]
	ld [wSAIDefScreens], a
	call SAI_ResetBest

	ld hl, wSAIMovesPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, NUM_MOVES
.move_loop
	ld a, [hli]
	and a
	jr z, .moves_done
	push hl
	push bc
	call SAI_GetMove
	call SAI_DamageKeepMax
	pop bc
	pop hl
	dec c
	jr nz, .move_loop
.moves_done

	ld hl, wBattleMonHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	call SAI_BestHits
	ld d, a ; hits needed
; asleep: lost turns (frostbite only halves Sp. Atk: see SAI_Damage)
	pop af ; status
	and SLP_MASK
	jr z, .awake
	ld a, d
	add SAI_SLEEP_TURNS
	cp SAI_MAX_HITS + 1
	jr c, .got_hits
	ld a, SAI_MAX_HITS
.got_hits
	ld d, a
.awake
	push de

; pass 2: the player's threats against it
	ld hl, wSAIAtkPtr
	ld de, wSAIDefPtr
	call SAI_Copy2
	ld a, LOW(wBattleMonLevel)
	ld [wSAIAtkPtr], a
	ld a, HIGH(wBattleMonLevel)
	ld [wSAIAtkPtr + 1], a
	ld hl, wBattleMonType1
	ld de, wSAIAtkTypes
	call SAI_Copy2
	ld hl, wSAICandTypes
	ld de, wSAIDefTypes
	call SAI_Copy2
	ld a, [wSAICandAbility]
	ld [wSAIDefAbility], a
	ld a, [wEnemyScreens]
	ld [wSAIDefScreens], a

; a voluntary switch-in takes the player's predicted move as it comes in
	ld a, [wSAIPredicted]
	and a
	jr z, .no_entry_hit
	ld d, a
	ld a, [wSAIPredicted + 1]
	ld e, a
	call SAI_Damage
	ld de, wSAICandHP + 1
	ld a, [de]
	sub l
	ld [de], a
	dec de
	ld a, [de]
	sbc h
	ld [de], a
	jr c, .entry_ko
	ld b, a
	inc de
	ld a, [de]
	or b
	jr nz, .no_entry_hit
.entry_ko
	pop de
	ld a, 1 ; knocked out as it comes in: the worst score
	ret
.no_entry_hit
	call SAI_ResetBest

; the moves seen
	ld hl, wPlayerUsedMoves
	ld c, NUM_MOVES
.seen_loop
	ld a, [hli]
	and a
	jr z, .seen_done
	push hl
	push bc
	call SAI_GetMove
	call SAI_DamageKeepMax
	pop bc
	pop hl
	dec c
	jr nz, .seen_loop
.seen_done

; bosses: the player's default moveset (SAI_PrepareLearnset)
	ld hl, wSAILearnset
	ld c, NUM_MOVES
.learnset_loop
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	or d
	jr z, .learnset_done
	push hl
	push bc
	ld h, d
	ld l, e
	call SAI_GetMoveByIndex
	call SAI_DamageKeepMax
	pop bc
	pop hl
	dec c
	jr nz, .learnset_loop
.learnset_done

; a STAB move of each type, with the better of Attack and Sp. Atk
	ld hl, wBattleMonSpclAtk + 1
	ld a, [wBattleMonAttack + 1]
	sub [hl]
	dec hl
	ld a, [wBattleMonAttack]
	sbc [hl] ; carry if Attack < Sp. Atk
	ld e, PHYSICAL
	jr nc, .got_category
	ld e, SPECIAL
.got_category
	ld a, [wBattleMonType1]
	or e
	push de
	ld e, a
	ld d, SAI_ASSUMED_POWER
	call SAI_DamageKeepMax
	pop de
	push de
	ld a, [wBattleMonType2]
	ld hl, wBattleMonType1
	cp [hl]
	jr z, .assumed_done
	or e
	ld e, a
	ld d, SAI_ASSUMED_POWER
	call SAI_DamageKeepMax
.assumed_done
	pop de
; while a move is still unseen: a neutral coverage move (the ??? type has no matchups)
	ld a, [wPlayerUsedMoves + NUM_MOVES - 1]
	and a
	jr nz, .coverage_done
	ld a, e
	and ~TYPE_MASK
	or CURSE_TYPE
	ld e, a
	ld d, SAI_COVERAGE_POWER
	call SAI_DamageKeepMax
.coverage_done

	ld hl, wSAICandHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	call SAI_BestHits
	ld [wSAIHitsTaken], a

; 89 + 8 * hits taken - 9 * hits needed + faster
	add a
	add a
	add a
	add 89
	ld hl, wSAIFaster
	add [hl]
	ld b, a
	pop de ; d = hits needed
	ld a, d
	add a
	add a
	add a
	add d
	ld c, a
	ld a, b
	sub c
	ret

SAI_SetFaster:
; bc = its Speed -> wSAIFaster = 4 if faster than the player's battler, else 0.
	ld hl, wBattleMonSpeed + 1
	ld a, [hld]
	sub c
	ld a, [hl]
	sbc b ; carry if it's faster
	ld a, 0
	jr nc, .got
	ld a, 4
.got
	ld [wSAIFaster], a
	ret

SAI_StayAdjust:
; a = the active Pokemon's score -> a = plus SAI_STAGE_BONUS for each raised stat stage (it
; loses them by leaving), minus SAI_STAGE_BONUS for each lowered accuracy or evasion stage
; (the other stats are already in the score), minus SAI_STAY_PENALTY for each residual
; problem (Toxic, Leech Seed, Curse, infatuation, Perish count 2; half for confusion) and
; each reason to leave (Regenerator below 2/3 HP, Natural Cure with a status); 0-255.
	ld b, a
	ld c, 0
	ld hl, wEnemyStatLevels
	ld e, EVASION + 1 ; counts down: accuracy is 2, evasion 1
	assert wEnemyEvaLevel - wEnemyStatLevels == EVASION
	assert wEnemyAccLevel - wEnemyStatLevels == EVASION - 1
.stages
	ld a, [hli]
	sub BASE_STAT_LEVEL
	jr z, .stage_done
	jr c, .lowered
	ld d, a
.raised
	ld a, b
	add SAI_STAGE_BONUS
	jr nc, .raised_ok
	ld a, $ff
.raised_ok
	ld b, a
	dec d
	jr nz, .raised
	jr .stage_done
.lowered
	cpl
	inc a
	ld d, a ; stages down
	ld a, e
	cp 3
	jr nc, .stage_done
.lowered_loop
	ld a, c
	add SAI_STAGE_BONUS
	ld c, a
	dec d
	jr nz, .lowered_loop
.stage_done
	dec e
	jr nz, .stages
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	call nz, .Penalty
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	call nz, .Penalty
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_CURSE, a
	call nz, .Penalty
	bit SUBSTATUS_IN_LOVE, a
	call nz, .Penalty
	bit SUBSTATUS_PERISH, a
	jr z, .perish_done
	ld a, [wEnemyPerishCount]
	cp 2
	call z, .Penalty
.perish_done
	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr z, .confusion_done
	ld a, c
	add SAI_STAY_PENALTY / 2
	ld c, a
.confusion_done

	ld a, [wEnemyMonAbility]
	cp ABILITY_NATURAL_CURE
	jr nz, .not_natural_cure
	ld a, [wEnemyMonStatus]
	and a
	call nz, .Penalty
	jr .abilities_done
.not_natural_cure
	cp ABILITY_REGENERATOR
	jr nz, .abilities_done
; HP * 3 < max HP * 2
	push bc
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ld h, d
	ld l, e
	add hl, hl
	add hl, de
	ld b, h
	ld c, l ; bc = HP * 3
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld l, [hl]
	ld h, a
	add hl, hl ; max HP * 2
	ld a, c
	sub l
	ld a, b
	sbc h
	pop bc
	call c, .Penalty
.abilities_done

	ld a, b
	sub c
	ret nc
	xor a
	ret

.Penalty:
; Preserves af.
	push af
	ld a, c
	add SAI_STAY_PENALTY
	ld c, a
	pop af
	ret

SAI_PursuitKO:
; Carry if the player has used Pursuit (or, for bosses, has it in its default moveset) and
; it would knock the active enemy out as it leaves (double power).
	ld hl, wPlayerUsedMoves
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	and a
	jr z, .learnset
	push hl
	push bc
	ld b, a
	call GetMoveIndexFromID ; preserves bc
	ld a, l
	cp LOW(PURSUIT)
	jr nz, .next
	ld a, h
	cp HIGH(PURSUIT)
	jr z, .found
.next
	pop bc
	pop hl
	dec c
	jr nz, .loop
	jr .learnset

.found
	pop hl
	pop hl
	ld a, b
	call SAI_GetMove
	jr .got_pursuit

.learnset
; bosses: Pursuit in the default moveset
	ld hl, wSAILearnset
	ld c, NUM_MOVES
.learnset_loop
	ld a, [hli]
	ld d, a
	ld a, [hli]
	cp LOW(PURSUIT)
	jr nz, .learnset_next
	ld a, d
	cp HIGH(PURSUIT)
	jr nz, .learnset_next
	ld hl, PURSUIT
	call SAI_GetMoveByIndex
	jr .got_pursuit
.learnset_next
	dec c
	jr nz, .learnset_loop
	and a
	ret

.got_pursuit
	sla d
	jr nc, .got_power
	ld d, $ff
.got_power
	push de
	ld a, LOW(wBattleMonLevel)
	ld [wSAIAtkPtr], a
	ld a, HIGH(wBattleMonLevel)
	ld [wSAIAtkPtr + 1], a
	ld a, LOW(wEnemyMonLevel)
	ld [wSAIDefPtr], a
	ld a, HIGH(wEnemyMonLevel)
	ld [wSAIDefPtr + 1], a
	ld hl, wBattleMonType1
	ld de, wSAIAtkTypes
	call SAI_Copy2
	ld hl, wEnemyMonType1
	ld de, wSAIDefTypes
	call SAI_Copy2
	ld a, [wEnemyMonAbility]
	ld [wSAIDefAbility], a
	ld a, [wEnemyScreens]
	ld [wSAIDefScreens], a
	pop de
	call SAI_Damage
; carry if damage >= HP
	ld a, [wEnemyMonHP + 1]
	sub l
	ld c, a
	ld a, [wEnemyMonHP]
	sbc h
	ret c ; damage > HP
	or c
	ret nz ; (or clears the carry)
	scf ; damage = HP
	ret

SAI_PrepareLearnset:
; wSAILearnset = the player's battler's default moveset (the last NUM_MOVES different
; level-up moves at its level, as FillMoves gives a new Pokemon) if the trainer class has
; AI_KNOWS_LEARNSETS (bosses); else empty.
	ld hl, wSAILearnset
	ld bc, NUM_MOVES * 2
	xor a
	rst ByteFill
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	ret nz
	ld a, [wTrainerClass]
	dec a
	ld hl, TrainerClassAttributes + TRNATTR_AI_MOVE_WEIGHTS
	ld bc, NUM_TRAINER_ATTRIBUTES
	rst AddNTimes
	ld a, BANK(TrainerClassAttributes)
	call GetFarWord
	bit AI_KNOWS_LEARNSETS_F - 8, h
	ret z

	ld a, [wBattleMonSpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer ; b:hl
	call FarSkipEvolutions
.loop
	ld a, b
	call GetFarByte ; level (0: the end)
	inc hl
	and a
	ret z
	ld c, a
	ld a, [wBattleMonLevel]
	cp c
	ret c
	ld a, b
	push hl
	call GetFarWord
	ld d, h
	ld e, l ; de = the move
	pop hl
	inc hl
	inc hl
	push hl
	push bc
	call .Add
	pop bc
	pop hl
	jr .loop

.Add:
; Add move de unless it's there already: into the first empty slot, else shift the
; slots up and put it last.
	ld hl, wSAILearnset
	ld c, NUM_MOVES
.check
	ld a, [hli]
	cp d
	ld a, [hli]
	jr nz, .check_next
	cp e
	ret z ; already there
.check_next
	dec c
	jr nz, .check
	ld hl, wSAILearnset
	ld c, NUM_MOVES
.find_empty
	ld a, [hli]
	or [hl]
	dec hl
	jr z, .store
	inc hl
	inc hl
	dec c
	jr nz, .find_empty
; full: shift the slots up
	ld hl, wSAILearnset
	ld c, (NUM_MOVES - 1) * 2
.shift
	inc hl
	inc hl
	ld a, [hld]
	dec hl
	ld [hli], a
	dec c
	jr nz, .shift
	ld hl, wSAILearnset + (NUM_MOVES - 1) * 2
.store
	ld a, d
	ld [hli], a
	ld [hl], e
	ret

SAI_Copy2:
; Copy 2 bytes from hl to de.
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

SAI_ResetBest:
	xor a
	ld [wSAIBestDmg], a
	ld [wSAIBestDmg + 1], a
	ret

SAI_BestHits:
; bc = the defender's HP -> a = hits of wSAIBestDmg to knock it out (1-SAI_MAX_HITS).
	ld hl, wSAIBestDmg
	ld a, [hli]
	ld l, [hl]
	ld h, a
	or l
	ld a, SAI_MAX_HITS
	ret z
	ld e, 0
.loop
	inc e
	ld a, e
	cp SAI_MAX_HITS
	ret z
; knocked out if damage >= HP
	ld a, l
	sub c
	ld a, h
	sbc b
	ld a, e
	ret nc
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc h
	ld b, a
	jr .loop

SAI_GetMove:
; a = move ID -> d = the power to estimate with (0: skip it), e = its type byte.
	call GetMoveIndexFromID
SAI_GetMoveByIndex:
; hl = 16-bit move index -> as SAI_GetMove (no 8-bit ID needed).
	ld b, h
	ld c, l
	ld hl, Moves
	ld a, BANK(Moves)
	call LoadIndirectPointer
	push hl
	push af
	call GetFarByte ; effect
	ld b, a
	pop af
	pop hl
	inc hl
	push hl
	push af
	call GetFarByte ; power
	ld d, a
	pop af
	pop hl
	inc hl
	call GetFarByte ; type
	ld e, a
	ld a, d
	cp 1
	ret nz
; power 1: a fixed or variable damage move
	ld a, b
	ld d, 0
	cp EFFECT_OHKO
	ret z
	cp EFFECT_COUNTER
	ret z
	cp EFFECT_MIRROR_COAT
	ret z
	cp EFFECT_BIDE
	ret z
	ld d, SAI_LEVEL_DAMAGE_POWER
	ret

SAI_DamageKeepMax:
; Estimate move d/e (power/type byte) and keep the biggest damage in wSAIBestDmg,
; and that move in wSAIBestMove.
	push de
	call SAI_Damage
	pop bc
	ld de, wSAIBestDmg + 1
	ld a, [de]
	sub l
	dec de
	ld a, [de]
	sbc h
	ret nc ; not bigger
	ld a, h
	ld [de], a
	inc de
	ld a, l
	ld [de], a
	ld a, b
	ld [wSAIBestMove], a
	ld a, c
	ld [wSAIBestMove + 1], a
	ret

SAI_Damage:
; d = power, e = type byte (type | category) -> hl = estimated damage (capped at $ffff),
; from the wSAIAtk* attacker against the wSAIDef* defender.
	ld a, d
	and a
	jmp z, .zero
	ld a, e
	and ~TYPE_MASK
	cp STATUS
	jmp z, .zero
	ld a, e
	and TYPE_MASK
	ld b, a
	ld a, [wSAIDefAbility]
	farcall AbilityTypeImmunity
	jmp c, .zero
	ld a, b
	ld hl, wSAIDefTypes
	farcall CheckTypeMatchup
	ld a, [wTypeMatchup]
	and a
	jmp z, .zero

	push de
; the stats used
	ld a, e
	and ~TYPE_MASK
	cp SPECIAL
	lb bc, SAI_ATK, SAI_DEF
	jr nz, .got_offsets
	lb bc, SAI_SAT, SAI_SDF
.got_offsets
	ld hl, wSAIAtkPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl ; the attacker's Level byte
	ld a, l
	add b
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hli]
	ld d, a
	ld e, [hl] ; de = attack
; a bench attacker (party stats): burn halves its Attack (not with Guts), frostbite its
; Sp. Atk; the battle structs' stats already have them (ApplyStatusEffectOnStats)
	pop hl
	push hl
	ld a, h
	cp HIGH(wBattleMonLevel)
	jr nz, .not_player
	ld a, l
	cp LOW(wBattleMonLevel)
	jr z, .status_done
.not_player
	ld a, h
	cp HIGH(wEnemyMonLevel)
	jr nz, .party_stats
	ld a, l
	cp LOW(wEnemyMonLevel)
	jr z, .status_done
.party_stats
	inc hl ; SAI_STATUS
	ld a, b
	cp SAI_ATK
	ld a, [hl]
	jr nz, .special_status
	and 1 << BRN
	jr z, .status_done
	ld a, [wSAICandAbility]
	cp ABILITY_GUTS
	jr z, .status_done
	jr .halve_attack
.special_status
	and 1 << FRZ
	jr z, .status_done
.halve_attack
	srl d
	rr e
	ld a, d
	or e
	jr nz, .status_done
	inc e
.status_done
	ld hl, wSAIDefPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc = defense
; both to 8 bits
.scale
	ld a, d
	or b
	jr z, .scaled
	srl d
	rr e
	srl b
	rr c
	jr .scale
.scaled
	ld a, c
	and a
	jr nz, .defense_ok
	inc c
.defense_ok
	ld b, e ; b = attack, c = defense

; level * 2 / 5 + 2
	pop hl
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	ld a, 2
	ld e, 5
	call .MulDiv
	ldh a, [hQuotient + 3]
	add 2
	ldh [hMultiplicand + 2], a ; (no carry: at most 104)
; * power * attack / defense / 50 + 2
	pop de
	push de
	ld a, d
	ldh [hMultiplier], a
	call Multiply
	ld a, b
	ld e, c
	call .MulDiv
	ld a, 1
	ld e, 50
	call .MulDiv
	ldh a, [hQuotient + 3]
	add 2
	ldh [hQuotient + 3], a
	jr nc, .plus_2_done
	ldh a, [hQuotient + 2]
	inc a
	ldh [hQuotient + 2], a
	jr nz, .plus_2_done
	ldh a, [hQuotient + 1]
	inc a
	ldh [hQuotient + 1], a
.plus_2_done
	pop de
	ld a, e
	and TYPE_MASK
	ld d, a ; d = type, e = type byte

; STAB
	ld hl, wSAIAtkTypes
	cp [hl]
	jr z, .stab
	inc hl
	cp [hl]
	jr nz, .stab_done
.stab
	ld a, 3
	push de
	ld e, 2
	call .MulDiv
	pop de
.stab_done

; the type chart
	ld a, [wTypeMatchup]
	push de
	ld e, EFFECTIVE
	call .MulDiv
	pop de

; rain and sun
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	lb bc, WATER, FIRE
	jr z, .weather
	cp WEATHER_SUN
	jr nz, .weather_done
	lb bc, FIRE, WATER
.weather
	ld a, d
	cp b
	jr z, .weather_up
	cp c
	jr nz, .weather_done
	call .Halve
	jr .weather_done
.weather_up
	ld a, 3
	push de
	ld e, 2
	call .MulDiv
	pop de
.weather_done

; Thick Fat (Fire, Ice) and Insulated (Water, Electric)
	ld a, [wSAIDefAbility]
	lb bc, FIRE, ICE
	cp ABILITY_THICK_FAT
	jr z, .halving_ability
	lb bc, WATER, ELECTRIC
	cp ABILITY_INSULATED
	jr nz, .ability_done
.halving_ability
	ld a, d
	cp b
	jr z, .ability_halve
	cp c
	jr nz, .ability_done
.ability_halve
	call .Halve
.ability_done

; Reflect and Light Screen
	ld a, e
	and ~TYPE_MASK
	cp SPECIAL
	ld a, [wSAIDefScreens]
	jr z, .special
	bit SCREENS_REFLECT, a
	jr .screen
.special
	bit SCREENS_LIGHT_SCREEN, a
.screen
	call nz, .Halve

; the result, capped at $ffff
	ldh a, [hQuotient + 1]
	and a
	ld hl, $ffff
	ret nz
	ldh a, [hQuotient + 2]
	ld h, a
	ldh a, [hQuotient + 3]
	ld l, a
	ret

.zero
	ld hl, 0
	ret

.Halve:
; Preserves bc, de and hl.
	push de
	ld a, 1
	ld e, 2
	call .MulDiv
	pop de
	ret

.MulDiv:
; The value in hMultiplicand (hQuotient's low 3 bytes) times a, divided by e.
; Preserves bc and hl (de: d).
	ldh [hMultiplier], a
	call Multiply
	ld a, e
	ldh [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
	ret
