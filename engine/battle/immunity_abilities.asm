CheckTypeImmunityAbilities::
	call PrintParalyze
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp GROUND
	jr z, .Levitate
	cp WATER
	jr z, .Waterproof
	ret

.Levitate
	call CheckLevitateMon
	jr c, .Immune
	ret

.Waterproof
	call CheckWaterproofMon
	jr c, .Immune
	ret

.Immune
	ld a, 0
	ld [wTypeMatchup], a 
	ret

CheckLevitateMon:	
	call GetActiveMon
	farcall CheckLevitateAbility
	ret	

CheckWaterproofMon:	
	call GetActiveMon
	farcall CheckWaterproofAbility
	ret	
