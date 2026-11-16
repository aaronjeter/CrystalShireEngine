; Wild Pokémon choose their moves with the trainer AI's scoring layers. A profile
; (WILDAI_*) picks the layers (WildAIProfiles, in the trainer class format): a boss
; uses its record's (BOSS_AI); any other wild Pokémon, the profile of its species'
; first overworld behavior (WildAIBehaviorProfiles). WILDAI_RANDOM runs no layer, so its
; usable moves tie and AIPickLowestScore picks one at random.

WildAIProfilePointer::
; hl = the layer flags of the wild enemy's profile (in BANK(TrainerClassAttributes)).
	call WildAIGetProfile
	add a
	ld c, a
	ld b, 0
	ld hl, WildAIProfiles
	add hl, bc
	ret

WildAIGetProfile:
; a = the wild enemy's WILDAI_* profile.
	ld a, [wBossID]
	and a
	jr z, .species
	farjp BossGetAIProfile

.species
	ld a, [wEnemyMonSpecies]
	call GetPokemonIndexFromID
	add hl, hl
	ld de, OverworldBehaviors
	add hl, de
	ld a, BANK(OverworldBehaviors)
	call GetFarByte
	and WILDSPAWN_BEHAVIOR_MASK ; its first behavior
	ld c, a
	ld b, 0
	ld hl, WildAIBehaviorProfiles
	add hl, bc
	ld a, [hl]
	ret

WildAIBehaviorProfiles:
; indexed by OW_*
	table_width 1
	db WILDAI_BASIC    ; OW_WANDERER
	db WILDAI_SKITTISH ; OW_SKITTISH
	db WILDAI_FERAL    ; OW_AGGRESSIVE
	db WILDAI_RANDOM   ; OW_SLEEPY
	db WILDAI_CUNNING  ; OW_CURIOUS
	db WILDAI_FERAL    ; OW_TERRITORIAL
	db WILDAI_BASIC    ; OW_PACER
	db WILDAI_RANDOM   ; OW_LAZY
	db WILDAI_CUNNING  ; OW_MIMIC
	db WILDAI_FERAL    ; OW_HIT_AND_RUN
	db WILDAI_CUNNING  ; OW_HIDER
	db WILDAI_CUNNING  ; OW_TELEPORTER
	db WILDAI_BASIC    ; OW_BURROWER
	assert_table_length NUM_OW_BEHAVIORS

WildAIAdjustScores::
; After the layers, in a wild battle that isn't a boss battle (escapes fail there):
; - Roar, Whirlwind and Teleport would end the battle. A WILDAI_SKITTISH Pokémon
;   picks one when it's at half HP or below, or the player's best hit would knock it
;   out; otherwise, and for every other profile, they're avoided.
; - Heal Bell does nothing for a wild Pokémon without a status.
	ld a, [wBossID]
	and a
	ret nz
	call WildAIGetProfile
	ld e, 0 ; avoid escapes
	cp WILDAI_SKITTISH
	jr nz, .got_escape
	call WildAIWantsToEscape
	jr nc, .got_escape
	inc e
.got_escape
	ld hl, wEnemyMonMoves
	ld bc, wEnemyAIMoveScores
	ld d, NUM_MOVES
.loop
	ld a, [hli]
	and a
	ret z
	push hl
	ld l, a
	ld a, MOVE_EFFECT
	call GetMoveAttribute
	pop hl
	cp EFFECT_FORCE_SWITCH
	jr z, .escape
	cp EFFECT_TELEPORT
	jr z, .escape
	cp EFFECT_HEAL_BELL
	jr nz, .next
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .next
	jr .useless

.escape
	ld a, [bc]
	cp 80
	jr nc, .next ; unusable (no PP, disabled, taunted)
	ld a, e
	and a
	jr z, .useless
	ld a, 1 ; the best score
	ld [bc], a
	jr .next

.useless
	ld a, 80
	ld [bc], a
.next
	inc bc
	dec d
	jr nz, .loop
	ret

WildAIWantsToEscape:
; Carry if the wild enemy is at half HP or below, or the player's best hit (the
; switch scorer's estimate) knocks it out.
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld c, [hl]
	srl a
	rr c
	ld b, a ; bc = max HP / 2
	ld a, [wEnemyMonHP]
	cp b
	ret c
	jr nz, .threat
	ld a, [wEnemyMonHP + 1]
	cp c
	ret c
	scf
	ret z
.threat
	push de
	xor a
	ld [wSAIPredicted], a
	call SAI_PrepareLearnset
	call SAI_ScoreActive
	pop de
	ld a, [wSAIHitsTaken]
	cp 2
	ret
