BattleCommand_WeatherBall:
; Weather Ball: in any weather, the move's power doubles and its type changes
; (Rain: Water, Sun: Fire, Sandstorm: Rock, Hail: Ice). It stays special.
; Runs before damagestats, so damage, STAB, type matchups and the weather's
; own damage boosts all use the new type.
; Also leaves the weather in wBattleAnimParam, for the move's animation.
	ld a, [wBattleWeather]
	cp WEATHER_HAIL + 1
	jr c, .ok
	xor a ; not a weather that's in effect
.ok
	ld [wBattleAnimParam], a
	and a
	ret z

	ld e, a
	ld d, 0
	ld hl, .WeatherTypes - 1
	add hl, de
	ld b, [hl]

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	ld a, [hl]
	and ~TYPE_MASK ; keep the category
	or b
	ld [hl], a

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	sla [hl]
	ret nc
	ld [hl], $ff ; cap at 255
	ret

.WeatherTypes:
; entries correspond to WEATHER_* constants
	db WATER ; WEATHER_RAIN
	db FIRE  ; WEATHER_SUN
	db ROCK  ; WEATHER_SANDSTORM
	db ICE   ; WEATHER_HAIL
