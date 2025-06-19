BattleCommand_StartSandstorm:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .failed

	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	ld a, 15
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SandstormBrewedText
	jmp StdBattleTextbox

.failed
	call AnimateFailedMove
	jmp PrintButItFailed
