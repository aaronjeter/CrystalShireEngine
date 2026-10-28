BattleCommand_StartHail:
	farcall AirLockOnField ; Air Lock: no new weather
	jr c, .failed
; starthail

	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .failed

	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	ld a, 10
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, ItStartedToHailText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
