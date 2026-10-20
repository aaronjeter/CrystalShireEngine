CheckUserAbility:
; in:  b = ABILITY_* constant
; out: carry if the Pokemon whose turn it is has that ability
; Preserves bc, de and hl.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp b
	scf
	ret z
	and a
	ret

CheckHealAbility:
; Return carry if the Pokemon whose turn it is has Regeneration.
	ld b, ABILITY_REGENERATION
	jr CheckUserAbility

CheckShedSkinMon:
; Return carry if the Pokemon whose turn it is has Shed Skin.
	ld b, ABILITY_SHED_SKIN
	jr CheckUserAbility

CheckWeatherHealAbility:
; Return carry if the Pokemon whose turn it is has the ability that heals it
; in the current weather (Rain Dish, Sunbask, Sand Body, Ice Body).
	push hl
	ld hl, WeatherHealAbilities
	jr CheckWeatherAbility

CheckWeatherSpeedBoost:
; Return carry if the Pokemon whose turn it is has the ability that doubles
; its Speed in the current weather (Swift Swim, Chlorophyll, Sand Rush, Slush Rush).
	push hl
	ld hl, WeatherSpeedAbilities
	; fallthrough

CheckWeatherAbility:
; in:  hl = table of weather, ability pairs ending with -1 (pushed hl on the stack)
; out: carry if the Pokemon whose turn it is has the current weather's ability
	ld a, [wBattleWeather]
	ld b, a
.loop
	ld a, [hli]
	cp -1
	jr z, .no
	cp b
	ld a, [hli]
	jr nz, .loop
	pop hl
	ld b, a
	jr CheckUserAbility

.no
	pop hl
	and a
	ret

WeatherHealAbilities:
	db WEATHER_RAIN,      ABILITY_RAIN_DISH
	db WEATHER_SUN,       ABILITY_SUNBASK
	db WEATHER_SANDSTORM, ABILITY_SAND_BODY
	db WEATHER_HAIL,      ABILITY_ICE_BODY
	db -1

WeatherSpeedAbilities:
	db WEATHER_RAIN,      ABILITY_SWIFT_SWIM
	db WEATHER_SUN,       ABILITY_CHLOROPHYLL
	db WEATHER_SANDSTORM, ABILITY_SAND_RUSH
	db WEATHER_HAIL,      ABILITY_SLUSH_RUSH
	db -1

CheckRaining:
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret

CheckSun:
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret

CheckSandstorm:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	ret

CheckHail:
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ret
