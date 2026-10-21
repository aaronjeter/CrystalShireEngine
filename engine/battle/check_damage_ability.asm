GetMoveTarget:
; a = move ID -> a = its MOVE_TARGET_* (MoveAttributes; MOVE_TARGET_SELECTED if none).
; Preserves bc, de and hl.
	push de
	ld d, 0
	jr _GetMoveAttributesByte

GetMoveFlags:
; a = move ID -> a = its MOVEFLAG_* bits (MoveAttributes; 0 if none). Preserves bc, de and hl.
	push de
	ld d, 1
_GetMoveAttributesByte:
	push hl
	push bc
	push de
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, MoveAttributes
	ld a, BANK(MoveAttributes)
	call LoadIndirectPointer
	pop de
	jr z, .none
	ld b, a
	ld a, l
	add d
	ld l, a
	jr nc, .got_byte
	inc h
.got_byte
	ld a, b
	call GetFarByte
	jr .done

.none
	xor a
.done
	pop bc
	pop hl
	pop de
	ret

CheckStabAbility:
; Return carry if the attacker's ability boosts the current move like STAB:
; Elemental Fist (punching moves), Elemental Fang (biting moves) or
; Elemental Blade (slicing moves).
; Preserves hl.
	push hl
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	ld h, MOVEFLAG_PUNCH
	cp ABILITY_ELEMENTAL_FIST
	jr z, .check_move
	ld h, MOVEFLAG_BITE
	cp ABILITY_ELEMENTAL_FANG
	jr z, .check_move
	ld h, MOVEFLAG_SLICING
	cp ABILITY_ELEMENTAL_BLADE
	jr z, .check_move
	pop hl
	and a
	ret

.check_move
; h = the MOVEFLAG_* mask; carry if the current move has it
	call GetAbilityMove
	call GetMoveFlags
	and h
	pop hl
	ret z
	scf
	ret

CheckMoveGroupBoost:
; Return carry if the attacker's ability boosts the current move by 25%:
; Iron Fist (punching moves), Strong Jaw (biting moves),
; Sharpness (slicing moves) or Tough Claws (contact moves).
; Preserves hl.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_TOUGH_CLAWS
	jp z, CheckContactMove
	push hl
	ld h, MOVEFLAG_PUNCH
	cp ABILITY_IRON_FIST
	jr z, CheckStabAbility.check_move
	ld h, MOVEFLAG_BITE
	cp ABILITY_STRONG_JAW
	jr z, CheckStabAbility.check_move
	ld h, MOVEFLAG_SLICING
	cp ABILITY_SHARPNESS
	jr z, CheckStabAbility.check_move
	pop hl
	and a
	ret

CheckStabilityMon:
; Return carry if the attacker has Stability.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_STABILITY
	scf
	ret z
	and a
	ret

GetAbilityMove:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ret

ApplyThickFat:
; Halve the damage if the target has Thick Fat
; and the move is Fire or Ice type.
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp FIRE
	jr z, .CheckTarget
	cp ICE
	ret nz

.CheckTarget
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp ABILITY_THICK_FAT
	ret nz
	jmp HalveDamage

ApplyMultiscale:
; Halve the damage if the target has Multiscale and full HP.
; Clobbers bc and hl.
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp ABILITY_MULTISCALE
	ret nz

	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
; HP and max HP are consecutive big-endian words.
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	ret nz
	ld a, [hl]
	cp c
	ret nz
	jmp HalveDamage

CheckTechnician:
; Return carry if the attacker has Technician and the move's
; power is 60 or less. Moves with no power never qualify.
; in:  d = move power
; out: carry set if Technician applies
; Preserves bc, de and hl.
	ld a, d
	and a
	ret z
	cp 60 + 1
	ret nc

	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_TECHNICIAN
	scf
	ret z
	and a
	ret

ApplyGuts:
; Boost the attacker's Attack by 50% if it has Guts and a status condition.
; in:  hl = Attack stat
; out: hl = Attack stat (x1.5 if Guts applies)
; Preserves bc and de.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar ; preserves hl, de, and bc
	and a
	ret z

	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_GUTS
	ret nz

	push bc
	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc
	pop bc
	ret

ApplyDurable:
; Cut the damage by 25% if the move is super effective
; and the target has Durable.
; Must run after BattleCheckTypeMatchup has set wTypeMatchup.
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1
	ret c

	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp ABILITY_DURABLE
	ret nz
	jmp ReduceDamageByQuarter

ApplySereneGrace:
; Double a move's secondary effect chance if the attacker has Serene Grace.
; Chances of 50% or more become 100%.
; in:  a = effect chance
; out: a = effect chance (doubled if Serene Grace applies)
; Clobbers bc and hl. Preserves de.
	push de
	ld b, a
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_SERENE_GRACE
	ld a, b ; ld leaves the zero flag from the ability check alone
	jr nz, .done

	cp 50 percent
	jr c, .double
	ld a, 100 percent
	jr .done

.double
	add a
.done
	pop de
	ret

CheckContactMove:
; Return carry if the current attacker's move makes contact (MOVEFLAG_CONTACT).
; Preserves bc, de and hl.
	call GetAbilityMove
	call GetMoveFlags
	and MOVEFLAG_CONTACT
	ret z
	scf
	ret

; Contact status abilities ---------------------------------------------------
; Static, Flame Body, Poison Point and Frigid: when the holder is hit by a
; contact move, 30% chance to give the attacker a status condition.
; Effect Spore: 30% chance of poison, paralysis or sleep (not Grass types).
; The status itself is inflicted by _HandleContactStatusAbilities
; (engine/battle/ability_effects.asm), outside this full bank.

HandleContactStatusAbilities:
; Called after each hit, on the attacker's turn.
	ld a, [wAttackMissed]
	and a
	ret nz
	ld hl, wCurDamage
	ld a, [hli]
	or [hl]
	ret z
	call CheckSubstituteOpp
	ret nz
	call CheckContactMove
	ret nc

; Rough Skin hurts the attacker, whatever its status.
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp ABILITY_ROUGH_SKIN
	jr z, .rough_skin

; The attacker must not already have a status condition.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret nz

; Does the Pokemon that was hit have a contact status ability?
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	sub ABILITY_STATIC
	cp ABILITY_EFFECT_SPORE - ABILITY_STATIC + 1
	ret nc
	ld c, a
	farjp _HandleContactStatusAbilities

.rough_skin
	farjp RoughSkinDamage

; Status immunity abilities ---------------------------------------------------

OppAbilityBlocksStatus:
; Return carry if the target's ability prevents status bits b.
; Preserves b, de and hl.
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	ld c, a
	; fallthrough

AbilityBlocksStatus::
; Return carry if ability c prevents any of status bits b
; (1 << PSN etc., or SLP_MASK for sleep).
; Preserves bc, de and hl.
	push hl
	ld hl, StatusImmunityAbilities
.loop
	ld a, [hli]
	and a
	jr z, .done ; end of list; and a cleared carry
	cp c
	ld a, [hli]
	jr nz, .loop
	and b
	jr z, .done ; and b cleared carry
	scf
.done
	pop hl
	ret

StatusImmunityAbilities:
	db ABILITY_LIMBER,      1 << PAR
	db ABILITY_INSOMNIA,    SLP_MASK
	db ABILITY_IMMUNITY,    1 << PSN
	db ABILITY_WATER_VEIL,  1 << BRN
	db ABILITY_MAGMA_ARMOR, 1 << FRZ
	db NO_ABILITY ; end

CheckOppAbility:
; Return z if the target has ability b. Preserves bc, de and hl.
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp b
	ret

FailStatusMoveAbility:
; A status move was blocked by the target's ability c:
; "<TARGET>'s protected by <ABILITY>!"
	push bc
	call AnimateFailedMove
	pop bc
	ld a, c
	farcall GetAbilityName
	ld hl, ProtectedByAbilityText
	jmp StdBattleTextbox
