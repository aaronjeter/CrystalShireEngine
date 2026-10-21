BattleCommand_Spikes:
	call GetTargetScreens

; Fails if spikes are already down!

	bit SCREENS_SPIKES, [hl]
	jr nz, .failed

; Nothing else stops it from working.

	set SCREENS_SPIKES, [hl]

	call AnimateCurrentMove

	ld hl, SpikesText
	jmp StdBattleTextbox

.failed
	jmp FailMove
