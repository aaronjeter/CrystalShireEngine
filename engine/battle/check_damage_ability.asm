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
