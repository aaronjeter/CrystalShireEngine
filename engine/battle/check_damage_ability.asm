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