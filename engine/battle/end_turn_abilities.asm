CheckHealAbility:
	call Regeneration
	ret

Regeneration:
	call CheckRegenerationMon
	ret

CheckRegenerationMon:	
	call GetActiveMon
	farcall CheckRegenerationAbility
	ret	

CheckWeatherHealAbility:
	call RainDish
	jr z, .Done
	jr c, .Done

	call Sunbask
	jr z, .Done
	jr c, .Done

	call SandBody
	jr z, .Done
	jr c, .Done

	call IceBody
	jr z, .Done
	jr c, .Done

	.Done
	ret

RainDish:
	call CheckRaining
	jr nz, .NotRaining

	call CheckRainDishMon
	jr nc, .NotRainDishMon
	
	.NotRaining	
	.NotRainDishMon	
	ret

CheckRainDishMon:	
	call GetActiveMon
	farcall CheckRainDishAbility
	ret	

Sunbask:
	call CheckSun
	jr nz, .NotSun

	call CheckSunbaskMon
	jr nc, .NotSunbaskMon
	
	.NotSun
	.NotSunbaskMon	
	ret

CheckSunbaskMon:	
	call GetActiveMon
	farcall CheckSunbaskAbility
	ret	

SandBody:
	call CheckSandstorm
	jr nz, .NotSandstorm

	call CheckSandBodyMon
	jr nc, .NotSandBodyMon
	
	.NotSandstorm
	.NotSandBodyMon
	ret

CheckSandBodyMon:	
	call GetActiveMon
	farcall CheckSandBodyAbility
	ret

IceBody:
	call CheckHail
	jr nz, .NotHail

	call CheckIceBodyMon
	jr nc, .NotIceBodyMon
	
	.NotHail
	.NotIceBodyMon
	ret

CheckIceBodyMon:	
	call GetActiveMon
	farcall CheckIceBodyAbility
	ret

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

GetActiveMon:
	ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_species
	ld a, [wEnemyMonSpecies]
.got_species
	jmp GetPokemonIndexFromID


CheckWeatherSpeedBoost:
; Returns carry if the hBattleTurn side's mon has the ability that doubles
; its Speed in the current weather (Swift Swim, Chlorophyll, Sand Rush, Slush Rush).
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .rain
	cp WEATHER_SUN
	jr z, .sun
	cp WEATHER_SANDSTORM
	jr z, .sand
	cp WEATHER_HAIL
	jr z, .hail
	and a
	ret

.rain
	call GetActiveMon
	farjp CheckSwiftSwimAbility

.sun
	call GetActiveMon
	farjp CheckChlorophyllAbility

.sand
	call GetActiveMon
	farjp CheckSandRushAbility

.hail
	call GetActiveMon
	farjp CheckSlushRushAbility

CheckShedSkinMon:
	call GetActiveMon
	farcall CheckShedSkinAbility
	ret
