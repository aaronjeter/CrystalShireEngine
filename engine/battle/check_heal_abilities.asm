INCLUDE "data/pokemon/heal_ability_mons.asm"

CheckHealAbility:
	call Regeneration
	ret

Regeneration:
	call CheckRegenerationMon
	ret

CheckRegenerationMon:	
	call GetActiveMon
	ld b, h
	ld c, l
	ld de, 2
	ld hl, RegenerationMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, RainDishMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, SunbaskMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, SandBodyMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, IceBodyMons
	call IsInWordArray
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