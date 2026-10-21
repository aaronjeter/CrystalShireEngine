BattleCommand_Safeguard:
	call GetUserScreens
	bit SCREENS_SAFEGUARD, [hl]
	jr nz, .failed
	set SCREENS_SAFEGUARD, [hl]
	ld a, 5
	ld [de], a
	call AnimateCurrentMove
	ld hl, CoveredByVeilText
	jmp StdBattleTextbox

.failed
	call AnimateFailedMove
	jmp PrintButItFailed
