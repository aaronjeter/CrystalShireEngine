INCLUDE "data/moves/move_categories.asm"
INCLUDE "data/pokemon/damage_boost_ability_mons.asm"

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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, ElementalFistMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, ElementalFangMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, ElementalBladeMons
	call IsInWordArray
	ret	

CheckBladeMove:		
	call GetAbilityMove	
	push hl
	ld hl, SharpMoves
	call CheckMoveInList
	pop hl
	ret


GetAbilityMove:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ret