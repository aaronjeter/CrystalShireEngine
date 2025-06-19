BattleCommand_StartSun:
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld a, 15
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jmp StdBattleTextbox
