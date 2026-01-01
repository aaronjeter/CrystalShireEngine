include "data/pokemon/etb_mons.asm"

Check_Etb_Ability:	

	call .Drizzle

	call .Drought

	call .SandStream

	call .SnowWarning

	call .Intimidate

	call .Mystify

	call .Snare

	call .Haste

	call .Aim

	call .Focus

	call .Veiled

	call .InvisibleWall

	call .Impostor

	call .Debris

	call .Leech

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
	ld de, LEER
    farcall Call_PlayBattleAnim
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
	ld de, DETECT
    farcall Call_PlayBattleAnim
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
	ld de, WRAP
    farcall Call_PlayBattleAnim
    farcall BattleCommand_SpeedDown

    ld hl, SnareCutsSpeedText
    call StdBattleTextbox
    ret

.Haste:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, HasteMons
	call IsInWordArray
	jr c, .HasHaste
	ret
		
.HasHaste:	
	ld de, AGILITY
    farcall Call_PlayBattleAnim
    farcall BattleCommand_SpeedUp

    ld hl, HasteBoostsSpeedText
    call StdBattleTextbox
    ret

.Aim:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AimMons
	call IsInWordArray
	jr c, .HasAim
	ret
		
.HasAim:	
	ld de, LOCK_ON
    farcall Call_PlayBattleAnim
    farcall BattleCommand_AccuracyUp

    ld hl, AimBoostsAccuracyText
    call StdBattleTextbox
    ret

.Focus:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, FocusMons
	call IsInWordArray
	jr c, .HasFocus
	ret
		
.HasFocus:	
	ld de, FOCUS_ENERGY
    farcall Call_PlayBattleAnim
    farcall BattleCommand_FocusEnergy
    ret

.Veiled:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, VeiledMons
	call IsInWordArray
	jr c, .HasVeiled
	ret
		
.HasVeiled:	
	ld de, SAFEGUARD
    farcall Call_PlayBattleAnim
    farcall BattleCommand_Safeguard
    ret

.InvisibleWall:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, InvisibleWallMons
	call IsInWordArray
	jr c, .HasInvisibleWall
	ret
		
.HasInvisibleWall:	
	ld de, REFLECT
    farcall Call_PlayBattleAnim
    farcall BattleCommand_Screen
    ret

.Impostor:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, ImpostorMons
	call IsInWordArray
	jr c, .HasImpostor
	ret
		
.HasImpostor:	
	ld de, TRANSFORM
    farcall Call_PlayBattleAnim
    farcall BattleCommand_Transform
    ret

.Debris:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, DebrisMons
	call IsInWordArray
	jr c, .HasDebris
	ret
		
.HasDebris:	
	ld de, SPIKES
    farcall Call_PlayBattleAnim
    farcall BattleCommand_Spikes
    ret

.Leech:
	call GetAbilitySpecies	
	ld b, h
	ld c, l
	ld de, 2
	ld hl, LeechMons
	call IsInWordArray
	jr c, .HasLeech
	ret
		
.HasLeech:	
	ld de, LEECH_SEED
    farcall Call_PlayBattleAnim
    farcall BattleCommand_LeechSeed
    ret


GetAbilitySpecies:
	ld a, [wTempAbilityMon]
	call GetPokemonIndexFromID
	ret
