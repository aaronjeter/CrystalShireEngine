INCLUDE "data/moves/move_categories.asm"

CheckStabAbility:	

	call ElementalFist
	jr c, .Done

	call ElementalFang
	jr c, .Done

	call ElementalBlade
	jr c, .Done

	.Done
	ret

ElementalFist:
	call CheckFistMon
	jr nc, .NotFistMon
	
	call CheckPunchMove	
	jr nc, .NotPunchMove

	.NotFistMon
	.NotPunchMove	
	ret

CheckFistMon:	
	call GetCurrentMon
	farcall CheckElementalFistAbility
	ret	

CheckPunchMove:		
	call GetAbilityMove	
	push hl
	ld hl, PunchMoves
	call CheckMoveInList
	pop hl
	ret

ElementalFang:
	call CheckFangMon
	jr nc, .NotFangMon
	
	call CheckFangMove	
	jr nc, .NotFangMove	

	.NotFangMon
	.NotFangMove	
	ret

CheckFangMon:
	call GetCurrentMon
	farcall CheckElementalFangAbility
	ret	

CheckFangMove:		
	call GetAbilityMove	
	push hl
	ld hl, FangMoves
	call CheckMoveInList
	pop hl
	ret


ElementalBlade:
	call CheckBladeMon
	jr nc, .NotBladeMon
	
	call CheckBladeMove	
	jr nc, .NotBladeMove	

	.NotBladeMon
	.NotBladeMove	
	ret

CheckBladeMon:	
	call GetCurrentMon
	farcall CheckElementalBladeAbility
	ret	

CheckBladeMove:		
	call GetAbilityMove	
	push hl
	ld hl, SharpMoves
	call CheckMoveInList
	pop hl
	ret

CheckStabilityMon:	
	call GetCurrentMon
	farcall CheckStabilityAbility
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
	call GetTargetSpecies
	call GetPokemonIndexFromID
	farcall CheckThickFatAbility
	ret nc
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

	push bc
	push hl
	push de
	call GetCurrentMon ; the attacker
	farcall CheckTechnicianAbility
	pop de
	pop hl
	pop bc
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

	push bc
	push de
	push hl
	call GetCurrentMon ; the attacker
	farcall CheckGutsAbility
	pop hl
	pop de
	pop bc
	ret nc

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

	call GetTargetSpecies
	call GetPokemonIndexFromID
	farcall CheckDurableAbility
	ret nc
	jmp ReduceDamageByQuarter

ApplySereneGrace:
; Double a move's secondary effect chance if the attacker has Serene Grace.
; Chances of 50% or more become 100%.
; in:  a = effect chance
; out: a = effect chance (doubled if Serene Grace applies)
; Clobbers bc and hl. Preserves de.
	push de
	ld b, a
	push bc
	call GetCurrentMon ; the attacker
	farcall CheckSereneGraceAbility
	pop bc
	ld a, b ; ld and pop leave the carry flag from the ability check alone
	jr nc, .done

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
; Return carry if the current attacker's move makes contact.
; Physical moves make contact unless listed in NonContactPhysicalMoves.
; Special moves make contact only if listed in ContactSpecialMoves.
; Status moves never make contact.
; Preserves bc, de and hl.
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and ~TYPE_MASK
	cp PHYSICAL
	jr z, .physical
	cp SPECIAL
	jr z, .special
	and a ; status: no contact
	ret

.physical
	push hl
	call GetAbilityMove
	ld hl, NonContactPhysicalMoves
	call CheckMoveInList
	pop hl
	ccf ; listed = no contact
	ret

.special
	push hl
	call GetAbilityMove
	ld hl, ContactSpecialMoves
	call CheckMoveInList
	pop hl
	ret

; Contact status abilities ---------------------------------------------------
; Static, Flame Body and Poison Point: when the holder is hit by a contact
; move, 30% chance to give the attacker a status condition.

ContactStatusAbilityEffects:
; status, immune type, immune type, animation, text
	db 1 << PAR, ELECTRIC, ELECTRIC
	dw ANIM_PAR, StaticParalyzedText
	db 1 << BRN, FIRE, FIRE
	dw ANIM_BRN, FlameBodyBurnedText
	db 1 << PSN, POISON, STEEL
	dw ANIM_PSN, PoisonPointPoisonedText
DEF CONTACT_ABILITY_ENTRY_SIZE EQU 7

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

; The attacker must not already have a status condition.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret nz

; Does the Pokemon that was hit have a contact status ability?
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_target
	ld a, [wBattleMonSpecies]
.got_target
	call GetPokemonIndexFromID
	farcall GetContactStatusAbility
	ret nc

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
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_types
	ld hl, wEnemyMonType1
.got_types
	ld a, [hli]
	cp c
	jr z, .immune
	cp b
	jr z, .immune
	ld a, [hl]
	cp c
	jr z, .immune
	cp b
	jr z, .immune

	call BattleRandom
	cp 30 percent
	jr nc, .immune ; failed the roll
	pop hl

; Inflict the status. Switch turns so the attacker is the "opponent";
; the existing status helpers all act on the opponent.
	call BattleCommand_SwitchTurn
	push hl
	ld b, [hl]
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld [hl], b
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore
	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore
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
	call PlayOpponentBattleAnim
	pop af
	ld [wNumHits], a
	call RefreshBattleHuds
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextbox
	ld hl, UseHeldStatusHealingItem
	call CallBattleCore
	jmp BattleCommand_SwitchTurn

.immune
	pop hl
	ret
