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
	call GetPokemonIndexFromID
	ret z
	ld a, [wEnemyMonSpecies]
	call GetPokemonIndexFromID
    ret