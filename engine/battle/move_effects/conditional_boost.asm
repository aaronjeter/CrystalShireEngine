BattleCommand_ConditionalBoost:	
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld bc, VENOSHOCK
	call CompareMove
	jr z, .Venoshock

	;when adding moves, we'll just check for everything but Hex, then fallthrough

	;fallthrough to Hex 
.Hex
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jp DoubleDamageIfNZ
	ret

.Venoshock
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit PSN, a
	jp DoubleDamageIfNZ
	ret

