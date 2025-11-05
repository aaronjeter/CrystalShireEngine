include "data/pokemon/etb_mons.asm"

Check_Etb_Ability:	

	call .Drizzle

	call .Drought

	call .SandStream

	call .SnowWarning

	call .Intimidate

	call .Mystify

	call .Snare

	ret

.Drizzle:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, DrizzleMons
	call IsInWordArray
	jr c, .HasDrizzle
	ret
		
.HasDrizzle:
	;next, check if it's already raining
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret z	

	ld a, WEATHER_RAIN
    ld [wBattleWeather], a
    ld a, 10 
    ld [wWeatherCount], a
	ld de, RAIN_DANCE
    farcall Call_PlayBattleAnim
    ld hl, DrizzleText
    call StdBattleTextbox
	;call HandleWeather
    ret

.Drought:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, DroughtMons
	call IsInWordArray
	jr c, .HasDrought
	ret

.HasDrought:
	;next, check if it's already sunny
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	
	ld a, WEATHER_SUN
    ld [wBattleWeather], a
    ld a, 10 
    ld [wWeatherCount], a
	ld de, SUNNY_DAY
    farcall Call_PlayBattleAnim
    ld hl, DroughtText
    call StdBattleTextbox
	;call HandleWeather
    ret

.SandStream:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, SandStreamMons
	call IsInWordArray
	jr c, .HasSandStream
	ret

.HasSandStream:
	;next, check if it's already sandy
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	ret z	

	ld a, WEATHER_SANDSTORM
    ld [wBattleWeather], a
    ld a, 10 
	ld de, SANDSTORM
    farcall Call_PlayBattleAnim
    ld [wWeatherCount], a
    ld hl, SandStreamText
    call StdBattleTextbox
	;call HandleWeather
	ret	

.SnowWarning:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, SnowWarningMons
	call IsInWordArray
	jr c, .HasSnowWarning
	ret

.HasSnowWarning:
	;next, check if it's already hailing
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ret z	

	ld a, WEATHER_HAIL
    ld [wBattleWeather], a
    ld a, 10 
    ld [wWeatherCount], a
	ld de, HAIL
    farcall Call_PlayBattleAnim
    ld hl, SnowWarningText
    call StdBattleTextbox
	;call HandleWeather
	ret	

.Intimidate:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, IntimidateMons
	call IsInWordArray
	jr c, .HasIntimidate
	ret
		
.HasIntimidate:	
	farcall BattleCommand_StatDownAnim.etb_ability_skip
    farcall BattleCommand_AttackDown

    ld hl, IntimidateCutsAttackText
    call StdBattleTextbox
    ret

.Mystify:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, MystifyMons
	call IsInWordArray
	jr c, .HasMystify
	ret
		
.HasMystify:	
	farcall BattleCommand_StatDownAnim.etb_ability_skip
    farcall BattleCommand_SpecialAttackDown

    ld hl, MystifyCutsSpecialAttackText
    call StdBattleTextbox
    ret

.Snare:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, SnareMons
	call IsInWordArray
	jr c, .HasSnare
	ret
		
.HasSnare:	
	farcall BattleCommand_StatDownAnim.etb_ability_skip
    farcall BattleCommand_SpeedDown

    ld hl, SnareCutsSpeedText
    call StdBattleTextbox
    ret

GetAbilitySpecies:
	ld a, [wTempAbilityMon]
	call GetPokemonIndexFromID
	ret
