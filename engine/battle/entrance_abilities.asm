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

	call .Enervate

	call .Daunt

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
    ld a, 5 
    ld [wWeatherCount], a
	call AbilityAnimationCleanup
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
    ld a, 5 
    ld [wWeatherCount], a
	call AbilityAnimationCleanup
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
	ld a, 5
    ld [wWeatherCount], a
	call AbilityAnimationCleanup
	ld de, SANDSTORM
    farcall Call_PlayBattleAnim    
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
    ld a, 5 
    ld [wWeatherCount], a
	call AbilityAnimationCleanup
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
	call AbilityAnimationCleanup
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
	call AbilityAnimationCleanup
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
	call AbilityAnimationCleanup
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
	call AbilityAnimationCleanup
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
	call AbilityAnimationCleanup
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
	call AbilityAnimationCleanup
    call FocusEnergyAbility
    ret

.Veiled:
	call GetAbilitySpecies	
	farcall CheckVeiledAbility
	jr c, .HasVeiled
	ret
		
.HasVeiled:
	call AbilityAnimationCleanup
	call SafeguardAbility
	ret

.InvisibleWall:
	call GetAbilitySpecies	
	farcall CheckInvisibleWallAbility
	jr c, .HasInvisibleWall
	ret
		
.HasInvisibleWall:
	call AbilityAnimationCleanup
	call ReflectAbility
    ret

.Impostor:
	call GetAbilitySpecies	
	farcall CheckImpostorAbility
	jr c, .HasImpostor
	ret
		
.HasImpostor:
	call AbilityAnimationCleanup
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
	call AbilityAnimationCleanup
	call DebrisAbility
    ret

.Leech:
	call GetAbilitySpecies	
	farcall CheckLeechAbility
	jr c, .HasLeech
	ret
		
.HasLeech:
	call AbilityAnimationCleanup
	call LeechAbility
    ret

.Enervate:
	call GetAbilitySpecies	
	farcall CheckEnervateAbility
	jr c, .HasEnervate
	ret
		
.HasEnervate:
	call AbilityAnimationCleanup
	ld de, GIGA_DRAIN
    farcall Call_PlayBattleAnim
    farcall BattleCommand_SpecialDefenseDown

    ld hl, EnervateCutsSpDefText
    call StdBattleTextbox
    ret

.Daunt:
	call GetAbilitySpecies	
	farcall CheckDauntAbility
	jr c, .HasDaunt
	ret
		
.HasDaunt:
	call AbilityAnimationCleanup
	ld de, LEER
    farcall Call_PlayBattleAnim
    farcall BattleCommand_DefenseDown

    ld hl, DauntCutsDefText
    call StdBattleTextbox
    ret


GetAbilitySpecies:
	ld a, [wTempAbilityMon]
	call GetPokemonIndexFromID
	ret

AbilityAnimationCleanup:
	;set numhits to 0 to prevent animation weirdness
	;set up as a function, we might need to do other cleanups
	xor a
	ld [wNumHits], a
	ret

SafeguardAbility:
	ld de, SAFEGUARD
	farcall Call_PlayBattleAnim

	ld hl, wPlayerScreens
	ld de, wPlayerSafeguardCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens
	ld de, wEnemySafeguardCount
.ok
	set SCREENS_SAFEGUARD, [hl]
	ld a, 3
	ld [de], a
	ld hl, CoveredByVeilText
	jmp StdBattleTextbox

FocusEnergyAbility:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_FOCUS_ENERGY, [hl]
	ret nz  ; already active — do nothing
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	
	ld de, FOCUS_ENERGY
	farcall Call_PlayBattleAnim

	ld hl, GettingPumpedText
	jmp StdBattleTextbox

ReflectAbility:
	ld hl, wPlayerScreens
	ld bc, wPlayerReflectCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens
	ld bc, wEnemyReflectCount
.ok
	set SCREENS_REFLECT, [hl]
	ld a, 3
	ld [bc], a
	
	ld de, REFLECT
	farcall Call_PlayBattleAnim

	ld hl, ReflectEffectText
	jmp StdBattleTextbox

DebrisAbility:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerScreens
.ok
	bit SCREENS_SPIKES, [hl]
	ret nz ; spikes already down, do nothing

	set SCREENS_SPIKES, [hl]
	
	ld de, SPIKES
	farcall Call_PlayBattleAnim

	ld hl, SpikesText
	jmp StdBattleTextbox


LeechAbility:
	farcall CheckSubstituteOpp
	ret nz ; blocked by Substitute

	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	cp GRASS
	ret z 
	inc de
	ld a, [de]
	cp GRASS
	ret z

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	ret nz ; already seeded, do nothing
	set SUBSTATUS_LEECH_SEED, [hl]
	
	ld de, LEECH_SEED
	farcall Call_PlayBattleAnim

	ld hl, WasSeededText
	jmp StdBattleTextbox