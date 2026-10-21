Check_Entrance_Ability:
; Run the entrance effect of ability [wTempAbility], if it has one.
; hBattleTurn is the side of the Pokemon that just entered.
	ld a, [wTempAbility]
	ld b, a
	ld hl, .Abilities
.loop
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr z, .found
	inc hl
	inc hl
	jr .loop

.found
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Abilities:
	dbw ABILITY_DRIZZLE,        .HasDrizzle
	dbw ABILITY_DROUGHT,        .HasDrought
	dbw ABILITY_SAND_STREAM,    .HasSandStream
	dbw ABILITY_SNOW_WARNING,   .HasSnowWarning
	dbw ABILITY_INTIMIDATE,     .HasIntimidate
	dbw ABILITY_MYSTIFY,        .HasMystify
	dbw ABILITY_SNARE,          .HasSnare
	dbw ABILITY_HASTE,          .HasHaste
	dbw ABILITY_AIM,            .HasAim
	dbw ABILITY_FOCUS,          .HasFocus
	dbw ABILITY_VEILED,         .HasVeiled
	dbw ABILITY_INVISIBLE_WALL, .HasInvisibleWall
	dbw ABILITY_IMPOSTOR,       .HasImpostor
	dbw ABILITY_DEBRIS,         .HasDebris
	dbw ABILITY_LEECH,          .HasLeech
	dbw ABILITY_ENERVATE,       .HasEnervate
	dbw ABILITY_DAUNT,          .HasDaunt
	dbw ABILITY_LIMBER,         .CureStatus
	dbw ABILITY_INSOMNIA,       .CureStatus
	dbw ABILITY_IMMUNITY,       .CureStatus
	dbw ABILITY_WATER_VEIL,     .CureStatus
	dbw ABILITY_MAGMA_ARMOR,    .CureStatus
	db -1

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

.HasIntimidate:
	call AbilityAnimationCleanup
	ld de, LEER
    farcall Call_PlayBattleAnim
	ld hl, BattleCommand_AttackDown
	call EntranceStatDown
	ret nz ; blocked; the reason was already printed

    ld hl, IntimidateCutsAttackText
    call StdBattleTextbox
    ret

.HasMystify:
	call AbilityAnimationCleanup
	ld de, DETECT
    farcall Call_PlayBattleAnim
	ld hl, BattleCommand_SpecialAttackDown
	call EntranceStatDown
	ret nz ; blocked; the reason was already printed

    ld hl, MystifyCutsSpecialAttackText
    call StdBattleTextbox
    ret

.HasSnare:
	call AbilityAnimationCleanup
	ld de, WRAP
    farcall Call_PlayBattleAnim
	ld hl, BattleCommand_SpeedDown
	call EntranceStatDown
	ret nz ; blocked; the reason was already printed

    ld hl, SnareCutsSpeedText
    call StdBattleTextbox
    ret

.HasHaste:
	call AbilityAnimationCleanup
	ld de, AGILITY
    farcall Call_PlayBattleAnim
    farcall BattleCommand_SpeedUp

    ld hl, HasteBoostsSpeedText
    call StdBattleTextbox
    ret

.HasAim:
	call AbilityAnimationCleanup
	ld de, LOCK_ON
    farcall Call_PlayBattleAnim
    farcall BattleCommand_AccuracyUp

    ld hl, AimBoostsAccuracyText
    call StdBattleTextbox
    ret

.HasFocus:
	call AbilityAnimationCleanup
    call FocusEnergyAbility
    ret

.HasVeiled:
	call AbilityAnimationCleanup
	call SafeguardAbility
	ret

.HasInvisibleWall:
	call AbilityAnimationCleanup
	call ReflectAbility
    ret

.HasImpostor:
	call AbilityAnimationCleanup
	ld de, TRANSFORM
    farcall Call_PlayBattleAnim
    farcall BattleCommand_Transform
    ret

.HasDebris:
	call AbilityAnimationCleanup
	call DebrisAbility
    ret

.HasLeech:
	call AbilityAnimationCleanup
	call LeechAbility
    ret

.HasEnervate:
	call AbilityAnimationCleanup
	ld de, GIGA_DRAIN
    farcall Call_PlayBattleAnim
	ld hl, BattleCommand_SpecialDefenseDown
	call EntranceStatDown
	ret nz ; blocked; the reason was already printed

    ld hl, EnervateCutsSpDefText
    call StdBattleTextbox
    ret

.HasDaunt:
	call AbilityAnimationCleanup
	ld de, LEER
    farcall Call_PlayBattleAnim
	ld hl, BattleCommand_DefenseDown
	call EntranceStatDown
	ret nz ; blocked; the reason was already printed

    ld hl, DauntCutsDefText
    call StdBattleTextbox
    ret

.CureStatus:
; Limber, Insomnia, Immunity, Water Veil and Magma Armor cure the status
; they prevent, e.g. one gained before an Ability Capsule changed the ability.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	ld b, a
	ld a, [wTempAbility]
	ld c, a
	farcall AbilityBlocksStatus
	ret nc

	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TOXIC, [hl]
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
	call UpdateUserInParty

; Recalculate stats without the paralysis, burn or frostbite drop.
	ldh a, [hBattleTurn]
	and a
	jr nz, .cure_enemy
	farcall CalcPlayerStats
	jr .cured
.cure_enemy
	farcall CalcEnemyStats
.cured
	call RefreshBattleHuds
	ld a, [wTempAbility]
	farcall GetAbilityName
	ld hl, AbilityCuredStatusText
	jmp StdBattleTextbox


EntranceStatDown:
; Lower the opponent's stat with the far stat-down command in hl.
; Leftover miss/fail flags from earlier in the turn must not block it,
; so clear them for the call and restore them afterwards.
; Returns nz (after printing why) if the stat wasn't lowered,
; e.g. Clear Body, Mist, or the stat can't go any lower.
	ld a, [wAttackMissed]
	push af
	ld a, [wEffectFailed]
	push af
	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	ld a, BANK(BattleCommand_StatDown)
	call FarCall_hl
	pop af
	ld [wEffectFailed], a
	pop af
	ld [wAttackMissed], a
	ld a, [wFailedMessage]
	and a
	ret z
	farcall BattleCommand_StatDownFailText
	or 1 ; return nz
	ret

StartOverworldBattleWeather::
; Battles on a map with overworld weather start with that weather, permanently
; (wWeatherCount = 255; HandleWeather never counts it down).
; Runs after the player's entrance ability, so a weather ability (Drought etc.) wins.
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wBattleWeather]
	and a ; WEATHER_NONE
	ret nz
	ld a, [wCurWeather]
	and a
	ret z
	ld b, a
	ld hl, OverworldBattleWeathers
.loop
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr z, .found
	ld de, 5
	add hl, de
	jr .loop

.found
	ld a, [hli]
	ld [wBattleWeather], a
	ld a, 255
	ld [wWeatherCount], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	xor a ; play the animation from the player's side, like HandleWeather
	ldh [hBattleTurn], a
	call AbilityAnimationCleanup
	farcall Call_PlayBattleAnim
	pop hl
	jmp StdBattleTextbox

OverworldBattleWeathers:
; overworld weather, battle weather, animation, text
	db OW_WEATHER_RAIN
	db WEATHER_RAIN
	dw RAIN_DANCE, BattleText_OverworldRain
	db OW_WEATHER_SNOW
	db WEATHER_HAIL
	dw HAIL, BattleText_OverworldHail
	db OW_WEATHER_SANDSTORM
	db WEATHER_SANDSTORM
	dw SANDSTORM, BattleText_OverworldSandstorm
	db -1

AbilityAnimationCleanup:
	;set numhits to 0 to prevent animation weirdness
	;set up as a function, we might need to do other cleanups
	xor a
	ld [wNumHits], a
	ret

SafeguardAbility:
	ld de, SAFEGUARD
	farcall Call_PlayBattleAnim

	call GetUserScreens
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
	call GetUserScreens
	ld b, d
	ld c, e
	inc bc
	inc bc ; SafeguardCount -> ReflectCount
	set SCREENS_REFLECT, [hl]
	ld a, 3
	ld [bc], a
	
	ld de, REFLECT
	farcall Call_PlayBattleAnim

	ld hl, ReflectEffectText
	jmp StdBattleTextbox

DebrisAbility:
	call GetTargetScreens
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