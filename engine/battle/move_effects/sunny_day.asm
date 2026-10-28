BattleCommand_StartSun:
	farcall AirLockOnField ; Air Lock: no new weather
	jr c, .failed
	; don't shorten permanent sun (from overworld weather)
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr nz, .start
	ld a, [wWeatherCount]
	inc a
	jr z, .failed
.start
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld a, 15
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jmp StdBattleTextbox

.failed
	call AnimateFailedMove
	jmp PrintButItFailed
