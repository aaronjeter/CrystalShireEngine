BattleCommand_StartRain:
	; don't shorten permanent rain (from overworld weather)
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr nz, .start
	ld a, [wWeatherCount]
	inc a
	jr z, .failed
.start
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 15
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jmp StdBattleTextbox

.failed
	call AnimateFailedMove
	jmp PrintButItFailed
