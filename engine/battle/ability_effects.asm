; Battle ability effects that don't fit in the full Effect Commands bank.

ContactStatusAbilityEffects:
; entries correspond to ABILITY_STATIC, ABILITY_FLAME_BODY,
; ABILITY_POISON_POINT and ABILITY_FRIGID,
; then Effect Spore's three entries (picked at random).
	assert ABILITY_FLAME_BODY == ABILITY_STATIC + 1
	assert ABILITY_POISON_POINT == ABILITY_STATIC + 2
	assert ABILITY_FRIGID == ABILITY_STATIC + 3
	assert ABILITY_EFFECT_SPORE == ABILITY_STATIC + 4
; status (SLP_MASK: sleep for 2-4 turns), immune type, immune type,
; animation, text
	db 1 << PAR, ELECTRIC, ELECTRIC
	dw ANIM_PAR, StaticParalyzedText
	db 1 << BRN, FIRE, FIRE
	dw ANIM_BRN, FlameBodyBurnedText
	db 1 << PSN, POISON, STEEL
	dw ANIM_PSN, PoisonPointPoisonedText
	db 1 << FRZ, ICE, ICE
	dw ANIM_FRZ, FrigidFrostbiteText
.EffectSpore:
	db 1 << PSN, POISON, STEEL
	dw ANIM_PSN, EffectSporePoisonedText
	db 1 << PAR, ELECTRIC, ELECTRIC
	dw ANIM_PAR, EffectSporeParalyzedText
	db SLP_MASK, -1, -1
	dw ANIM_SLP, EffectSporeSleepText
DEF CONTACT_ABILITY_ENTRY_SIZE EQU 7
DEF EFFECT_SPORE_ENTRY EQU ABILITY_EFFECT_SPORE - ABILITY_STATIC

_HandleContactStatusAbilities:
; The attacker made contact with a contact status ability holder
; (see HandleContactStatusAbilities, which already checked the rest).
; in: c = holder's ability - ABILITY_STATIC
	ld a, c
	cp EFFECT_SPORE_ENTRY
	jr nz, .got_entry

; Effect Spore: Grass types are immune. 30% chance, then an even pick of
; poison, paralysis or sleep.
	ld bc, GRASS << 8 | GRASS
	call .CheckAttackerType
	ret z
	call BattleRandom
	cp 30 percent
	ret nc
.pick
	call BattleRandom
	and %11
	cp 3
	jr z, .pick
	add EFFECT_SPORE_ENTRY
	jr .roll_done

.got_entry
	push af
	call BattleRandom
	cp 30 percent
	jr nc, .pop_fail ; failed the roll
	pop af

.roll_done
; hl = ContactStatusAbilityEffects + a * CONTACT_ABILITY_ENTRY_SIZE
	ld hl, ContactStatusAbilityEffects
	ld bc, CONTACT_ABILITY_ENTRY_SIZE
	rst AddNTimes

; Type immunity: the attacker can't have either immune type.
	push hl
	inc hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call .CheckAttackerType
	pop hl
	ret z

; Ability immunity: Limber, Insomnia, Immunity, Water Veil, Magma Armor.
	ld b, [hl]
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	ld c, a
	push hl
	farcall AbilityBlocksStatus
	pop hl
	ret c

; Inflict the status. Switch turns so the attacker is the "opponent";
; the existing status helpers all act on the opponent.
	call .SwitchTurn
	push hl
	ld a, [hl]
	cp SLP_MASK
	jr nz, .got_status
.sleep_turns
	call BattleRandom
	and %11
	jr z, .sleep_turns
	inc a ; 2-4 turns
.got_status
	ld b, a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld [hl], b
	call UpdateOpponentInParty
	farcall ApplyPrzEffectOnSpeed
	farcall ApplyBrnEffectOnAttack
	farcall ApplyFrbEffectOnSpclAttack
	pop hl

	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
; PlayOpponentBattleAnim clears wNumHits, which multi-hit moves still need.
	ld a, [wNumHits]
	push af
	farcall PlayOpponentBattleAnim
	pop af
	ld [wNumHits], a
	call RefreshBattleHuds
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextbox
	farcall UseHeldStatusHealingItem
	; fallthrough

.SwitchTurn:
	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	ret

.pop_fail
	pop af
	ret

.CheckAttackerType:
; Return z if the attacker (the current turn's Pokemon) has type b or c.
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_types
	ld hl, wEnemyMonType1
.got_types
	ld a, [hli]
	cp c
	ret z
	cp b
	ret z
	ld a, [hl]
	cp c
	ret z
	cp b
	ret

CheckLowHPTypeBoost:
; Return carry if the attacker's Blaze, Torrent, Overgrow or Swarm boosts the
; current move: a move of its type, at 1/3 of max HP or less.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	ld b, a
	ld hl, LowHPTypeBoostAbilities
.loop
	ld a, [hli]
	and a
	ret z ; end of list; and a cleared carry
	cp b
	ld a, [hli]
	jr nz, .loop
	ld c, a
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp c
	jr nz, .no

; HP * 3 <= max HP
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP
.got_hp
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a ; bc = HP
	push hl
	ld h, b
	ld l, c
	add hl, hl
	add hl, bc
	ld d, h
	ld e, l ; de = HP * 3
	pop hl
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc = max HP
	ld a, c
	sub e
	ld a, b
	sbc d ; carry if max HP < HP * 3
	ccf
	ret

.no
	and a
	ret

LowHPTypeBoostAbilities:
	db ABILITY_BLAZE,    FIRE
	db ABILITY_TORRENT,  WATER
	db ABILITY_OVERGROW, GRASS
	db ABILITY_SWARM,    BUG
	db NO_ABILITY ; end

CheckShieldDust:
; Return carry if the target's Shield Dust blocks the current move's
; secondary effect. Effects on the user (stat boosts) and Thief still work.
	call _GetBreakableOppAbility
	cp ABILITY_SHIELD_DUST
	jr nz, .no
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld c, a
	ld hl, .UserEffects
.loop
	ld a, [hli]
	cp -1
	jr z, .blocked
	cp c
	jr nz, .loop
.no
	and a
	ret

.blocked
	scf
	ret

.UserEffects:
	db EFFECT_ATTACK_UP_HIT
	db EFFECT_DEFENSE_UP_HIT
	db EFFECT_SP_ATK_UP_HIT
	db EFFECT_SPEED_UP_HIT
	db EFFECT_ALL_UP_HIT
	db EFFECT_THIEF
	db -1

AbilityTypeImmunity:
; a = ability, b = move type -> carry if the ability makes its holder immune to that type
; (Levitate, Waterproof, the AbsorbAbilities). Used by the AI.
; Preserves bc, de and hl.
	push hl
	push bc
	ld c, a
	ld hl, AbsorbAbilityTypes
.loop
	ld a, [hli]
	and a
	jr z, .done ; carry is clear
	cp c
	ld a, [hli]
	jr nz, .loop
	cp b
	jr nz, .loop
	scf
.done
	pop bc
	pop hl
	ret

AbsorbAbilityTypes:
	db ABILITY_LEVITATE,      GROUND
	db ABILITY_WATERPROOF,    WATER
	db ABILITY_LIGHTNING_ROD, ELECTRIC
	db ABILITY_STORM_DRAIN,   WATER
	db ABILITY_VOLT_ABSORB,   ELECTRIC
	db ABILITY_WATER_ABSORB,  WATER
	db ABILITY_SAP_SIPPER,    GRASS
	db ABILITY_FLASH_FIRE,    FIRE
	db NO_ABILITY ; end

; AbsorbAbilities kinds
DEF ABSORB_SP_ATK EQU 0 ; Sp. Atk +1
DEF ABSORB_HEAL   EQU 1 ; heal 1/4 of max HP
DEF ABSORB_ATTACK EQU 2 ; Attack +1

CheckAbsorbAbility:
; Lightning Rod / Storm Drain / Volt Absorb / Water Absorb / Sap Sipper / Flash Fire: if the target has
; the one for the move's type, it takes no damage or effect, and its Sp. Atk or Attack rises
; one stage or it gets back 1/4 of its max HP (AbsorbAbilities). Prints the text. Carry if
; the move was absorbed (the caller treats it as a miss: "It doesn't affect <TARGET>!").
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	ld b, a
	call _GetBreakableOppAbility
	ld c, a
	ld hl, AbsorbAbilities
.loop
	ld a, [hli]
	and a
	ret z ; NO_ABILITY: the end; carry is clear
	cp c
	jr nz, .skip_type
	ld a, [hli]
	cp b
	jr nz, .skip_kind
	ld a, [hl]
	cp ABSORB_HEAL
	jr z, .heal

; raise the target's Sp. Atk (ABSORB_SP_ATK) or Attack (ABSORB_ATTACK)
	ld b, SP_ATTACK
	ld hl, AbsorbAbilityRaisedText
	and a ; ABSORB_SP_ATK
	jr z, .got_stat
	ld b, ATTACK
	ld hl, AbsorbAbilityRaisedAtkText
.got_stat
	push hl
	ld a, [wEffectFailed]
	push af
	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	call .SwitchTurn
	farcall RaiseStat
	call .SwitchTurn
	pop af
	ld [wEffectFailed], a
	pop hl
	ld a, [wFailedMessage]
	and a
	jr z, .text
	jr .absorbed_text

.skip_type
	inc hl
.skip_kind
	inc hl
	jr .loop

.heal
; nothing to heal at full HP
	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	jr nz, .restore
	ld a, [hl]
	cp c
	jr z, .absorbed_text
.restore
	call .SwitchTurn
	farcall GetQuarterMaxHP ; bc = the target's max HP / 4
	call .SwitchTurn
	farcall RestoreHP ; heals hBattleTurn's opponent: the target
	ld hl, AbsorbAbilityHealedText
	jr .text

.absorbed_text
	ld hl, AbsorbAbilityText
.text
	push hl
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	farcall GetAbilityName
	pop hl
	call StdBattleTextbox
	ld a, [wTypeModifier]
	and ~EFFECTIVENESS_MASK
	ld [wTypeModifier], a
	scf
	ret

.SwitchTurn:
	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	ret

AbsorbAbilities:
; ability, move type, ABSORB_* kind
	db ABILITY_LIGHTNING_ROD, ELECTRIC, ABSORB_SP_ATK
	db ABILITY_STORM_DRAIN,   WATER,    ABSORB_SP_ATK
	db ABILITY_VOLT_ABSORB,   ELECTRIC, ABSORB_HEAL
	db ABILITY_WATER_ABSORB,  WATER,    ABSORB_HEAL
	db ABILITY_SAP_SIPPER,    GRASS,    ABSORB_ATTACK
	db ABILITY_FLASH_FIRE,    FIRE,     ABSORB_SP_ATK
	db NO_ABILITY ; end

KeenEyeAccuracyBoost:
; Keen Eye: the accuracy in hQuotient + 2/3 (from BattleCommand_CheckHit.StatModifiers)
; x 1.2. Preserves bc, de and hl.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_KEEN_EYE
	ret nz
	push bc
	ld a, 6
	ldh [hMultiplier], a
	call Multiply
	ld a, 5
	ldh [hDivisor], a
	ld b, 4
	call Divide
	pop bc
	ret

CriticalDamageMultiplier:
; A critical hit doubles the damage in hQuotient + 2/3 (capped at $ffff);
; with Sniper it's tripled. Preserves bc, de and hl.
	ld a, [wCriticalHit]
	and a
	ret z
	push bc
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	ld c, a
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_SNIPER
	ld a, 1
	jr nz, .loop
	inc a
.loop
	push af
	ldh a, [hQuotient + 3]
	add c
	ldh [hQuotient + 3], a
	ldh a, [hQuotient + 2]
	adc b
	ldh [hQuotient + 2], a
	jr nc, .next
	ld a, $ff
	ldh [hQuotient + 2], a
	ldh [hQuotient + 3], a
.next
	pop af
	dec a
	jr nz, .loop
	pop bc
	ret

SpeedBoostAbility:
; End of turn: Speed Boost raises the Speed of the battler whose turn it is one stage,
; unless it entered this turn (a lead or an end-of-turn replacement boosts the next turn).
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_SPEED_BOOST
	ret nz
	farcall EnteredThisTurn ; not on the turn it came in
	ret c
	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	ld b, SPEED
	farcall RaiseStat
	ld a, [wFailedMessage]
	and a
	ret nz ; already at +6
	ld [wNumHits], a
	ld de, AGILITY
	farcall Call_PlayBattleAnim
	ld hl, SpeedBoostText
	jmp StdBattleTextbox

CheckSturdyFullHP:
; Carry if the target (hBattleTurn's opponent) has Sturdy and full HP.
; Preserves bc, de and hl.
	call _GetBreakableOppAbility
	cp ABILITY_STURDY
	jr nz, .no
	push hl
	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
	; HP and max HP are consecutive big-endian words
	ld a, [hli]
	inc hl
	cp [hl]
	jr nz, .pop_no
	dec hl
	ld a, [hli]
	inc hl
	cp [hl]
	pop hl
	jr nz, .no
	scf
	ret

.pop_no
	pop hl
.no
	and a
	ret

AbilityLeavingField::
; The battler in area a (0: the player's, 1: the enemy's), party mon b, is leaving the field
; (a switch, Baton Pass, Roar, a switching move), still loaded. Silent, as in the mainline
; games. Its battle copy and its party struct (none for a wild enemy) are both updated:
; - Natural Cure: its status is cured.
; - Regenerator: it gets 1/3 of its max HP back (not if it has fainted).
; Preserves bc, de and hl.
	push bc
	push de
	push hl
	ld c, a
	; de = its party struct (0: a wild enemy)
	ld hl, wPartyMon1
	and a
	jr z, .got_party
	ld hl, wOTPartyMon1
	ld a, [wBattleMode]
	dec a ; WILD_BATTLE
	jr nz, .got_party
	ld hl, 0
	jr .got_party_struct
.got_party
	ld a, b
	push bc
	call GetPartyLocation
	pop bc
.got_party_struct
	ld d, h
	ld e, l
	ld a, c
	and a
	ld a, [wBattleMonAbility]
	ld hl, wBattleMonStatus
	jr z, .got_side
	ld a, [wEnemyMonAbility]
	ld hl, wEnemyMonStatus
.got_side
	cp ABILITY_NATURAL_CURE
	jr z, .natural_cure
	cp ABILITY_REGENERATOR
	jr nz, .done

; Regenerator: hl = its status; HP and max HP follow (big-endian)
	assert wBattleMonHP - wBattleMonStatus == wEnemyMonHP - wEnemyMonStatus
	ld bc, wBattleMonHP - wBattleMonStatus
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	or b
	jr z, .done ; fainted
	push hl
	push bc
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ld a, [hli]
	ldh [hDividend + 2], a
	ld a, [hl]
	ldh [hDividend + 3], a
	ld a, 3
	ldh [hDivisor], a
	ld b, 4
	call Divide
	pop bc
	pop hl ; max HP
	ldh a, [hQuotient + 3]
	add c
	ld c, a
	ldh a, [hQuotient + 2]
	adc b
	ld b, a ; bc = HP + max HP / 3
	; cap at max HP
	ld a, [hli]
	cp b
	jr c, .cap
	jr nz, .no_cap
	ld a, [hl]
	cp c
	jr nc, .no_cap
.cap
	ld a, [hld]
	ld c, a
	ld b, [hl]
	inc hl
.no_cap
	dec hl
	dec hl
	ld a, c
	ld [hld], a
	ld [hl], b
	; the party struct's HP
	ld a, d
	or e
	jr z, .done
	ld hl, MON_HP
	add hl, de
	ld a, b
	ld [hli], a
	ld [hl], c
	jr .done

.natural_cure
	ld [hl], 0
	ld a, d
	or e
	jr z, .done
	ld hl, MON_STATUS
	add hl, de
	ld [hl], 0
.done
	pop hl
	pop de
	pop bc
	ret

_GetBreakableOppAbility:
; (GetBreakableOppAbility for this bank) a = the target's ability, for the checks Mold Breaker ignores: NO_ABILITY if the
; attacker (hBattleTurn's battler) has Mold Breaker. Preserves bc, de and hl.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_MOLD_BREAKER
	ld a, NO_ABILITY
	ret z
	ld a, BATTLE_VARS_ABILITY_OPP
	jmp GetBattleVar

; The type-changing abilities' damage boost: x1.25 (between Gen 6's x1.3 and Gen 7+'s x1.2)
DEF TYPE_CHANGE_BOOST_NUM EQU 5
DEF TYPE_CHANGE_BOOST_DEN EQU 4
DEF TYPE_CHANGE_ALL_F EQU 7 ; TypeChangeAbilities: every move, not just Normal ones
DEF TYPE_CHANGE_ALL EQU 1 << TYPE_CHANGE_ALL_F
	assert NUM_TYPES <= TYPE_CHANGE_ALL

TypeChangeAbilities:
; ability, the type its moves become
	db ABILITY_PIXILATE,    FAIRY
	db ABILITY_GALVANIZE,   ELECTRIC
	db ABILITY_AERILATE,    FLYING
	db ABILITY_REFRIGERATE, ICE
	db ABILITY_DRAGONIZE,   DRAGON
	db ABILITY_IMMOLATE,    FIRE
	db ABILITY_HYDRATE,     WATER
	db ABILITY_CONTAMINATE, POISON
	db ABILITY_VERDIFY,     GRASS
	db ABILITY_NORMALIZE,   TYPE_CHANGE_ALL | NORMAL
	db NO_ABILITY ; end

ApplyTypeChangeAbility:
; End of BattleCommand_DamageCalc: the -ate abilities (TypeChangeAbilities) turn the user's
; Normal move into their type, Normalize turns any move into a Normal one. It's the move
; struct's type, so the STAB, type matchup, immunities and absorbs that follow see the new
; type. The damage x1.25 (TYPE_CHANGE_BOOST_NUM / _DEN). Later hits of a multi-hit move
; (already converted, a Normal move in the move data) are boosted again. Hidden Power keeps
; its own type.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	ld c, a
	ld hl, TypeChangeAbilities
.find
	ld a, [hli]
	and a
	ret z ; NO_ABILITY: the end of the table
	cp c
	jr z, .found
	inc hl
	jr .find

.found
	ld b, [hl] ; the new type (TYPE_CHANGE_ALL: any move)
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_HIDDEN_POWER
	ret z
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	bit TYPE_CHANGE_ALL_F, b
	jr z, .normal_moves
	res TYPE_CHANGE_ALL_F, b
	jr .set_type

.normal_moves
	ld a, [hl]
	and TYPE_MASK
	cp NORMAL
	jr z, .set_type
	cp b
	ret nz
	; already converted: only if the move itself is Normal
	push hl
	push bc
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	pop bc
	pop hl
	and TYPE_MASK
	cp NORMAL
	ret nz
	jr .boost

.set_type
	ld a, [hl]
	and ~TYPE_MASK
	or b
	ld [hl], a
.boost
	ld bc, TYPE_CHANGE_BOOST_NUM << 8 | TYPE_CHANGE_BOOST_DEN
	; fallthrough

MultiplyCurDamage:
; wCurDamage x b / c, at most MAX_DAMAGE (999). Clobbers bc and hl.
	ld hl, wCurDamage
	xor a
	ldh [hMultiplicand], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	ld a, b
	ldh [hMultiplier], a
	call Multiply
	ld a, c
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	ld c, a
	; cap at 999
	ld a, b
	cp HIGH(999)
	jr c, .store
	jr nz, .cap
	ld a, c
	cp LOW(999) + 1
	jr c, .store
.cap
	ld bc, 999
.store
	ld hl, wCurDamage
	ld a, b
	ld [hli], a
	ld [hl], c
	ret

GooeyAbility:
; The attacker (hBattleTurn's battler) made contact with a Gooey holder: its Speed falls one
; stage (Clear Body, Mist and -6 stop it, silently). Called from HandleContactStatusAbilities.
	ld a, [wAttackMissed]
	push af
	ld a, [wEffectFailed]
	push af
	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	call .SwitchTurn ; the holder "uses" the stat drop on the attacker
	farcall BattleCommand_SpeedDown
	ld a, [wFailedMessage]
	and a
	jr nz, .done
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	farcall GetAbilityName
	ld hl, AbilityActivatedText
	call StdBattleTextbox
	farcall BattleCommand_StatDownMessage
.done
	call .SwitchTurn
	pop af
	ld [wEffectFailed], a
	pop af
	ld [wAttackMissed], a
	ret

.SwitchTurn:
	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	ret

CuteCharmAbility:
; The attacker made contact with a Cute Charm holder: 30% chance that it falls in love with
; the holder (opposite genders; not if it already is).
	call BattleRandom
	cp 30 percent
	ret nc
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVar
	bit SUBSTATUS_IN_LOVE, a
	ret nz
	call GooeyAbility.SwitchTurn ; the holder is the "user" now
	farcall CheckOppositeGender
	jr c, .done
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	set SUBSTATUS_IN_LOVE, [hl]
	ld a, BATTLER_LINK_ATTRACTED_TO
	farcall SetTargetLink
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	farcall GetAbilityName
	ld hl, AbilityActivatedText
	call StdBattleTextbox
	ld hl, FellInLoveText
	call StdBattleTextbox
.done
	jp GooeyAbility.SwitchTurn

SynchronizeStatus:
; A move just gave the target (hBattleTurn's opponent) a status. If the target has
; Synchronize and it's poison (badly too), a burn, paralysis or frostbite, the attacker gets it,
; unless it already has a status, has fainted, or its type or ability protects it.
; Called from the status-giving commands, before UseHeldStatusHealingItem.
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp ABILITY_SYNCHRONIZE
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << PSN | 1 << BRN | 1 << PAR | 1 << FRZ
	ret z
	ld b, a
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret nz
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP
.got_hp
	ld a, [hli]
	or [hl]
	ret z
	call GooeyAbility.SwitchTurn ; the holder gives it to the attacker (the "opponent" now)

	; type immunity (the attacker's types)
	ld hl, SynchronizeImmuneTypes
.type_loop
	ld a, [hli]
	cp b
	jr z, .got_types
	inc hl
	inc hl
	jr .type_loop
.got_types
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_attacker_types
	ld de, wBattleMonType1
.got_attacker_types
	ld a, [de]
	cp [hl]
	jp z, .done
	inc de
	ld a, [de]
	cp [hl]
	jp z, .done
	inc hl
	dec de
	ld a, [de]
	cp [hl]
	jp z, .done
	inc de
	ld a, [de]
	cp [hl]
	jp z, .done

	; ability immunity (Limber, Immunity, Water Veil...)
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	ld c, a
	farcall AbilityBlocksStatus
	jp c, .done

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld [hl], b
	; badly poisoned is passed on as badly poisoned
	ld a, b
	cp 1 << PSN
	jr nz, .not_toxic
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVar
	bit SUBSTATUS_TOXIC, a
	jr z, .not_toxic
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	set SUBSTATUS_TOXIC, [hl]
	ld hl, wEnemyToxicCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_toxic_count
	ld hl, wPlayerToxicCount
.got_toxic_count
	ld [hl], 0
.not_toxic
	push bc
	call UpdateOpponentInParty
	pop bc
	ld a, b
	cp 1 << PAR
	jr nz, .not_par
	push bc
	farcall ApplyPrzEffectOnSpeed
	pop bc
.not_par
	ld a, b
	cp 1 << BRN
	jr nz, .not_brn
	push bc
	farcall ApplyBrnEffectOnAttack
	pop bc
.not_brn
	ld a, b
	cp 1 << FRZ
	jr nz, .not_frb
	push bc
	farcall ApplyFrbEffectOnSpclAttack
	pop bc
.not_frb
	push bc
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	farcall GetAbilityName
	ld hl, AbilityActivatedText
	call StdBattleTextbox
	pop bc
	ld de, ANIM_PSN
	ld hl, WasPoisonedText
	ld a, b
	cp 1 << PSN
	jr z, .got_anim
	ld de, ANIM_BRN
	ld hl, WasBurnedText
	cp 1 << BRN
	jr z, .got_anim
	ld de, ANIM_FRZ
	ld hl, GotAFrostbiteText
	cp 1 << FRZ
	jr z, .got_anim
	ld de, ANIM_PAR
	ld hl, SynchronizeParalyzedText
.got_anim
	push hl
	farcall PlayOpponentBattleAnim
	call RefreshBattleHuds
	pop hl
	call StdBattleTextbox
.done
	jp GooeyAbility.SwitchTurn

SynchronizeImmuneTypes:
; status, the two types it can't affect
	db 1 << PSN, POISON,   STEEL
	db 1 << BRN, FIRE,     FIRE
	db 1 << PAR, ELECTRIC, ELECTRIC
	db 1 << FRZ, ICE,      ICE
