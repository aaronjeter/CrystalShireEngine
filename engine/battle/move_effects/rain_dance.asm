BattleCommand_StartRain:
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 15
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jmp StdBattleTextbox
