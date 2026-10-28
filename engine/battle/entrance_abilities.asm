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
	inc hl
	jr .loop

.found
	ld a, [hli] ; the target kind (ENTRANCE_*; for double battles)
	cp ENTRANCE_EACH_FOE
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jr z, .each_foe
	jp hl

.each_foe
; Double battles: the handler runs once against each foe on the field, loaded in turn.
; (ENTRANCE_OPPOSITE_FOE needs nothing: the foe opposite, or the other one, is loaded.)
	ld a, [wDoubleBattle]
	and a
	jr nz, .doubles_each_foe
	jp hl

.doubles_each_foe
	ld de, wAreaSlots
	ldh a, [hBattleTurn]
	xor 1 ; the foes' area
	ld c, a
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	ld a, [de]
	push af ; the foe loaded now
	ld a, [wDoublesSpread]
	push af
	xor a ; EntranceFoeAnim plays the animation for the first foe only
	ld [wDoublesSpread], a
	ld a, c
	add a ; the foes' first slot (P1 or E1)
	ld c, a
	call .foe
	inc c
	call .foe
	pop af
	ld [wDoublesSpread], a
	pop af
	farjp SwapInBattlerSlot

.foe
; Run handler hl with the battler in slot c loaded, if there is one.
	ld a, c
	farcall BattlerSlotMask
	ld b, a
	ld a, [wEmptyBattlerSlots]
	and b
	ret nz
	push bc
	push hl
	ld a, c
	farcall SwapInBattlerSlot
	pop hl
	push hl
	call _hl_
	pop hl
	pop bc
	ret

.Abilities:
; Each ability's target kind tells double battles who it affects (ENTRANCE_*,
; constants/battle_constants.asm); singles ignores it.
MACRO entrance_ability ; ability, ENTRANCE_* kind, handler
	db \1, \2
	dw \3
ENDM
	entrance_ability ABILITY_DRIZZLE,         ENTRANCE_FIELD,         .HasDrizzle
	entrance_ability ABILITY_AIR_LOCK,        ENTRANCE_FIELD,         .HasAirLock
	entrance_ability ABILITY_MOLD_BREAKER,    ENTRANCE_SELF,          .HasMoldBreaker
	entrance_ability ABILITY_CLOUD_NINE,      ENTRANCE_FIELD,         .HasAirLock
	entrance_ability ABILITY_DROUGHT,         ENTRANCE_FIELD,         .HasDrought
	entrance_ability ABILITY_SAND_STREAM,     ENTRANCE_FIELD,         .HasSandStream
	entrance_ability ABILITY_SNOW_WARNING,    ENTRANCE_FIELD,         .HasSnowWarning
	entrance_ability ABILITY_INTIMIDATE,      ENTRANCE_EACH_FOE,      .HasIntimidate
	entrance_ability ABILITY_MYSTIFY,         ENTRANCE_EACH_FOE,      .HasMystify
	entrance_ability ABILITY_SNARE,           ENTRANCE_EACH_FOE,      .HasSnare
	entrance_ability ABILITY_HASTE,           ENTRANCE_SELF,          .HasHaste
	entrance_ability ABILITY_AIM,             ENTRANCE_SELF,          .HasAim
	entrance_ability ABILITY_FOCUS,           ENTRANCE_SELF,          .HasFocus
	entrance_ability ABILITY_VEILED,          ENTRANCE_OWN_SIDE,      .HasVeiled
	entrance_ability ABILITY_INVISIBLE_WALL,  ENTRANCE_OWN_SIDE,      .HasInvisibleWall
	entrance_ability ABILITY_IMPOSTOR,        ENTRANCE_OPPOSITE_FOE,  .HasImpostor
	entrance_ability ABILITY_DEBRIS,          ENTRANCE_FOE_SIDE,      .HasDebris
	entrance_ability ABILITY_LEECH,           ENTRANCE_EACH_FOE,      .HasLeech
	entrance_ability ABILITY_ENERVATE,        ENTRANCE_EACH_FOE,      .HasEnervate
	entrance_ability ABILITY_DAUNT,           ENTRANCE_EACH_FOE,      .HasDaunt
	entrance_ability ABILITY_LIMBER,          ENTRANCE_SELF,          .CureStatus
	entrance_ability ABILITY_INSOMNIA,        ENTRANCE_SELF,          .CureStatus
	entrance_ability ABILITY_IMMUNITY,        ENTRANCE_SELF,          .CureStatus
	entrance_ability ABILITY_WATER_VEIL,      ENTRANCE_SELF,          .CureStatus
	entrance_ability ABILITY_MAGMA_ARMOR,     ENTRANCE_SELF,          .CureStatus
	db -1

.AirLockBlocksWeather:
; Carry (and the text) if Air Lock keeps a weather ability's weather away.
	farcall AirLockOnField
	ret nc
	ld hl, AirLockKeptAwayText
	call StdBattleTextbox
	scf
	ret

.HasMoldBreaker:
	call AbilityAnimationCleanup
	ld hl, MoldBreakerText
	jmp StdBattleTextbox

.HasAirLock:
; Air Lock, Cloud Nine: end the weather (permanent overworld weather too).
	ld a, [wBattleWeather]
	cp WEATHER_NONE
	ret z
	xor a ; WEATHER_NONE
	ld [wBattleWeather], a
	ld [wWeatherCount], a
	call AbilityAnimationCleanup
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	farcall GetAbilityName
	ld hl, AirLockClearedText
	jmp StdBattleTextbox

.HasDrizzle:
	call .AirLockBlocksWeather
	ret c
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
	call .AirLockBlocksWeather
	ret c
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
	call .AirLockBlocksWeather
	ret c
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
	call .AirLockBlocksWeather
	ret c
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
    call EntranceFoeAnim
	ld hl, BattleCommand_AttackDown
	call EntranceStatDown
	ret nz ; blocked; the reason was already printed

    ld hl, IntimidateCutsAttackText
    call StdBattleTextbox
    ret

.HasMystify:
	call AbilityAnimationCleanup
	ld de, DETECT
    call EntranceFoeAnim
	ld hl, BattleCommand_SpecialAttackDown
	call EntranceStatDown
	ret nz ; blocked; the reason was already printed

    ld hl, MystifyCutsSpecialAttackText
    call StdBattleTextbox
    ret

.HasSnare:
	call AbilityAnimationCleanup
	ld de, WRAP
    call EntranceFoeAnim
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
    call EntranceFoeAnim
	ld hl, BattleCommand_SpecialDefenseDown
	call EntranceStatDown
	ret nz ; blocked; the reason was already printed

    ld hl, EnervateCutsSpDefText
    call StdBattleTextbox
    ret

.HasDaunt:
	call AbilityAnimationCleanup
	ld de, LEER
    call EntranceFoeAnim
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
; Not with an Air Lock battler on the field (the player's ran first; the enemy's would clear it).
	ld a, [wLinkMode]
	and a
	ret nz
	farcall AirLockOnField
	ret c
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

EntranceFoeAnim:
; Play animation de for an ENTRANCE_EACH_FOE ability. In a double battle the handler runs
; once per foe; the animation plays only for the first foe it affects.
	ld a, [wDoublesSpread]
	bit DOUBLES_SPREAD_HIT_F, a
	ret nz
	ld a, [wDoubleBattle]
	and a
	jr z, .play
	ld hl, wDoublesSpread
	set DOUBLES_SPREAD_HIT_F, [hl]
.play
	farjp Call_PlayBattleAnim

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
	ld a, BATTLER_LINK_SEEDED_BY
	farcall SetTargetLink
	
	ld de, LEECH_SEED
	call EntranceFoeAnim

	ld hl, WasSeededText
	jmp StdBattleTextbox