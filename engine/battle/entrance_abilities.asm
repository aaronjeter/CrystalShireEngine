Check_Entrance_Ability:	

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
	farcall CheckDrizzleAbility
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
	farcall CheckDroughtAbility
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
	farcall CheckSandStreamAbility
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
	farcall CheckSnowWarningAbility
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
	farcall CheckIntimidateAbility
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
	farcall CheckMystifyAbility
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
	farcall CheckSnareAbility
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
	farcall CheckHasteAbility
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
	farcall CheckAimAbility
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
	farcall CheckFocusAbility
	jr c, .HasFocus
	ret
		
.HasFocus:	
	ld de, FOCUS_ENERGY
    farcall Call_PlayBattleAnim
    farcall BattleCommand_FocusEnergy
    ret

.Veiled:
	call GetAbilitySpecies	
	farcall CheckVeiledAbility
	jr c, .HasVeiled
	ret
		
.HasVeiled:	
	ld de, SAFEGUARD
    farcall Call_PlayBattleAnim
    farcall BattleCommand_Safeguard
    ret

.InvisibleWall:
	call GetAbilitySpecies	
	farcall CheckInvisibleWallAbility
	jr c, .HasInvisibleWall
	ret
		
.HasInvisibleWall:	
	ld de, REFLECT
    farcall Call_PlayBattleAnim
    farcall BattleCommand_Screen
    ret

.Impostor:
	call GetAbilitySpecies	
	farcall CheckImpostorAbility
	jr c, .HasImpostor
	ret
		
.HasImpostor:	
	ld de, TRANSFORM
    farcall Call_PlayBattleAnim
    farcall BattleCommand_Transform
    ret

.Debris:
	call GetAbilitySpecies	
	farcall CheckDebrisAbility
	jr c, .HasDebris
	ret
		
.HasDebris:	
	ld de, SPIKES
    farcall Call_PlayBattleAnim
    farcall BattleCommand_Spikes
    ret

.Leech:
	call GetAbilitySpecies	
	farcall CheckLeechAbility
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
