INCLUDE "data/abilities/abilities.asm"
INCLUDE "data/abilities/descriptions.asm"

PrintAbility:	
	jp .Drought
	.NotDrought
	
	jp .Drizzle
	.NotDrizzle

	jp .SandStream
	.NotSandStream

	jp .SnowWarning
	.NotSnowWarning

	jp .Intimidate
	.NotIntimidate

	jp .Mystify
	.NotMystify

	jp .Snare
	.NotSnare

	jp .Levitate
	.NotLevitate

	jp .Waterproof
	.NotWaterproof

	jp .ElementalFist
	.NotElementalFist

	jp .ElementalFang
	.NotElementalFang

	jp .ElementalBlade
	.NotElementalBlade

	jp .Stability
	.NotStability

	jp .Regeneration
	.NotRegeneration

	jp .RainDish
	.NotRainDish

	jp .Sunbask
	.NotSunbask

	jp .SandBody
	.NotSandBody

	jp .IceBody
	.NotIceBody	

	jp .Haste
	.NotHaste

	jp .Aim
	.NotAim

	jp .Focus
	.NotFocus

	jp .Veiled
	.NotVeiled

	jp .InvisibleWall
	.NotInvisibleWall

	jp .Impostor
	.NotImpostor

	jp .Debris
	.NotDebris

	jp .Leech
	.NotLeech

	jp .Enervate
	.NotEnervate

	jp .Daunt
	.NotDaunt

	jp .SwiftSwim
	.NotSwiftSwim

	jp .Chlorophyll
	.NotChlorophyll

	jp .SandRush
	.NotSandRush

	jp .SlushRush
	.NotSlushRush

	jp .NoAbility

	.Done

	ret

.NoAbility
	ld de, NoAbilityNameString
	hlcoord 3, 11
	call PlaceString

	ld de, NoAbilityDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Drought:
	call GetAbilityMon	
	farcall CheckDroughtAbility
	jr c, .HasDrought
	jp .NotDrought
		
.HasDrought:
	ld de, DroughtNameString
	hlcoord 3, 11
	call PlaceString

	ld de, DroughtDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Drizzle:
	call GetAbilityMon	
	farcall CheckDrizzleAbility
	jr c, .HasDrizzle
	jp .NotDrizzle
		
.HasDrizzle:
	ld de, DrizzleNameString
	hlcoord 3, 11
	call PlaceString

	ld de, DrizzleDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.SandStream:
	call GetAbilityMon	
	farcall CheckSandStreamAbility
	jr c, .HasSandStream
	jp .NotSandStream
		
.HasSandStream:
	ld de, SandStreamNameString
	hlcoord 3, 11
	call PlaceString

	ld de, SandStreamDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.SnowWarning:
	call GetAbilityMon	
	farcall CheckSnowWarningAbility
	jr c, .HasSnowWarning
	jp .NotSnowWarning
		
.HasSnowWarning:
	ld de, SnowWarningNameString
	hlcoord 3, 11
	call PlaceString

	ld de, SnowWarningDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Intimidate:
	call GetAbilityMon	
	farcall CheckIntimidateAbility
	jr c, .HasIntimidate
	jp .NotIntimidate
		
.HasIntimidate:
	ld de, IntimidateNameString
	hlcoord 3, 11
	call PlaceString

	ld de, IntimidateDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Mystify:
	call GetAbilityMon	
	farcall CheckMystifyAbility
	jr c, .HasMystify
	jp .NotMystify
		
.HasMystify:
	ld de, MystifyNameString
	hlcoord 3, 11
	call PlaceString

	ld de, MystifyDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Snare:
	call GetAbilityMon	
	farcall CheckSnareAbility
	jr c, .HasSnare
	jp .NotSnare
		
.HasSnare:
	ld de, SnareNameString
	hlcoord 3, 11
	call PlaceString

	ld de, SnareDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Levitate:
	call GetAbilityMon	
	farcall CheckLevitateAbility
	jr c, .HasLevitate
	jp .NotLevitate
		
.HasLevitate:
	ld de, LevitateNameString
	hlcoord 3, 11
	call PlaceString

	ld de, LevitateDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Waterproof:
	call GetAbilityMon	
	farcall CheckWaterproofAbility
	jr c, .HasWaterproof
	jp .NotWaterproof
		
.HasWaterproof:
	ld de, WaterproofNameString
	hlcoord 3, 11
	call PlaceString

	ld de, WaterproofDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.ElementalFist:
	call GetAbilityMon	
	farcall CheckElementalFistAbility
	jr c, .HasElementalFist
	jp .NotElementalFist
		
.HasElementalFist:
	ld de, ElementalFistNameString
	hlcoord 3, 11
	call PlaceString

	ld de, ElementalFistDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.ElementalFang:
	call GetAbilityMon	
	farcall CheckElementalFangAbility
	jr c, .HasElementalFang
	jp .NotElementalFang
		
.HasElementalFang:
	ld de, ElementalFangNameString
	hlcoord 3, 11
	call PlaceString

	ld de, ElementalFangDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.ElementalBlade:
	call GetAbilityMon
	farcall CheckElementalBladeAbility
	jr c, .HasElementalBlade
	jp .NotElementalBlade
		
.HasElementalBlade:
	ld de, ElementalBladeNameString
	hlcoord 3, 11
	call PlaceString

	ld de, ElementalBladeDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Stability:
	call GetAbilityMon	
	farcall CheckStabilityAbility
	jr c, .HasStability
	jp .NotStability
		
.HasStability:
	ld de, StabilityNameString
	hlcoord 3, 11
	call PlaceString

	ld de, StabilityDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Regeneration:
	call GetAbilityMon	
	farcall CheckRegenerationAbility
	jr c, .HasRegeneration
	jp .NotRegeneration
		
.HasRegeneration:
	ld de, RegenerationNameString
	hlcoord 3, 11
	call PlaceString

	ld de, RegenerationDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.RainDish:
	call GetAbilityMon	
	farcall CheckRainDishAbility
	jr c, .HasRainDish
	jp .NotRainDish
		
.HasRainDish:
	ld de, RainDishNameString
	hlcoord 3, 11
	call PlaceString

	ld de, RainDishDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Sunbask:
	call GetAbilityMon	
	farcall CheckSunbaskAbility
	jr c, .HasSunbask
	jp .NotSunbask
		
.HasSunbask:
	ld de, SunbaskNameString
	hlcoord 3, 11
	call PlaceString

	ld de, SunbaskDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.SandBody:
	call GetAbilityMon	
	farcall CheckSandBodyAbility
	jr c, .HasSandBody
	jp .NotSandBody
		
.HasSandBody:
	ld de, SandBodyNameString
	hlcoord 3, 11
	call PlaceString

	ld de, SandBodyDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.IceBody:
	call GetAbilityMon	
	farcall CheckIceBodyAbility
	jr c, .HasIceBody
	jp .NotIceBody
		
.HasIceBody:
	ld de, IceBodyNameString
	hlcoord 3, 11
	call PlaceString

	ld de, IceBodyDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Haste:
	call GetAbilityMon	
	farcall CheckHasteAbility
	jr c, .HasHaste
	jp .NotHaste
		
.HasHaste:
	ld de, HasteNameString
	hlcoord 3, 11
	call PlaceString

	ld de, HasteDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Aim:
	call GetAbilityMon	
	farcall CheckAimAbility
	jr c, .HasAim
	jp .NotAim
		
.HasAim:
	ld de, AimNameString
	hlcoord 3, 11
	call PlaceString

	ld de, AimDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Focus:
	call GetAbilityMon	
	farcall CheckFocusAbility
	jr c, .HasFocus
	jp .NotFocus
		
.HasFocus:
	ld de, FocusNameString
	hlcoord 3, 11
	call PlaceString

	ld de, FocusDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Veiled:
	call GetAbilityMon	
	farcall CheckVeiledAbility
	jr c, .HasVeiled
	jp .NotVeiled
		
.HasVeiled:
	ld de, VeiledNameString
	hlcoord 3, 11
	call PlaceString

	ld de, VeiledDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.InvisibleWall:
	call GetAbilityMon	
	farcall CheckInvisibleWallAbility
	jr c, .HasInvisibleWall
	jp .NotInvisibleWall
		
.HasInvisibleWall:
	ld de, InvisibleWallNameString
	hlcoord 3, 11
	call PlaceString

	ld de, InvisibleWallDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Impostor:
	call GetAbilityMon	
	farcall CheckImpostorAbility
	jr c, .HasImpostor
	jp .NotImpostor
		
.HasImpostor:
	ld de, ImpostorNameString
	hlcoord 3, 11
	call PlaceString

	ld de, ImpostorDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Debris:
	call GetAbilityMon	
	farcall CheckDebrisAbility
	jr c, .HasDebris
	jp .NotDebris
		
.HasDebris:
	ld de, DebrisNameString
	hlcoord 3, 11
	call PlaceString

	ld de, DebrisDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Leech:
	call GetAbilityMon	
	farcall CheckLeechAbility
	jr c, .HasLeech
	jp .NotLeech
		
.HasLeech:
	ld de, LeechNameString
	hlcoord 3, 11
	call PlaceString

	ld de, LeechDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Enervate:
	call GetAbilityMon	
	farcall CheckEnervateAbility
	jr c, .HasEnervate
	jp .NotEnervate
		
.HasEnervate:
	ld de, EnervateNameString
	hlcoord 3, 11
	call PlaceString

	ld de, EnervateDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Daunt:
	call GetAbilityMon	
	farcall CheckDauntAbility
	jr c, .HasDaunt
	jp .NotDaunt
		
.HasDaunt:
	ld de, DauntNameString
	hlcoord 3, 11
	call PlaceString

	ld de, DauntDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.SwiftSwim:
	call GetAbilityMon	
	farcall CheckSwiftSwimAbility
	jr c, .HasSwiftSwim
	jp .NotSwiftSwim
		
.HasSwiftSwim:
	ld de, SwiftSwimNameString
	hlcoord 3, 11
	call PlaceString

	ld de, SwiftSwimDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.Chlorophyll:
	call GetAbilityMon	
	farcall CheckChlorophyllAbility
	jr c, .HasChlorophyll
	jp .NotChlorophyll
		
.HasChlorophyll:
	ld de, ChlorophyllNameString
	hlcoord 3, 11
	call PlaceString

	ld de, ChlorophyllDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.SandRush:
	call GetAbilityMon	
	farcall CheckSandRushAbility
	jr c, .HasSandRush
	jp .NotSandRush
		
.HasSandRush:
	ld de, SandRushNameString
	hlcoord 3, 11
	call PlaceString

	ld de, SandRushDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

.SlushRush:
	call GetAbilityMon	
	farcall CheckSlushRushAbility
	jr c, .HasSlushRush
	jp .NotSlushRush
		
.HasSlushRush:
	ld de, SlushRushNameString
	hlcoord 3, 11
	call PlaceString

	ld de, SlushRushDesc
	hlcoord 1, 14
	call PlaceString
    jp .Done

GetAbilityMon:
	ld a, [wTempAbilityMon]
	call GetPokemonIndexFromID
	ret

NoAbilityNameString:
	db "NO ABILITY@"

DroughtNameString:
	db "Drought@"

DrizzleNameString:
	db "Drizzle@"

SandStreamNameString:
	db "Sand Stream@"

SnowWarningNameString:
	db "Snow Warning@"

IntimidateNameString:
	db "Intimidate@"

MystifyNameString:
	db "Mystify@"

SnareNameString:
	db "Snare@"

LevitateNameString:
	db "Levitate@"

WaterproofNameString:
	db "Waterproof@"

ElementalFistNameString:
	db "Elemental Fist@"

ElementalFangNameString:
	db "Elemental Fang@"

ElementalBladeNameString:
	db "Elemental Blade@"

StabilityNameString:
	db "Stability@"

RegenerationNameString:
	db "Regeneration@"

RainDishNameString:
	db "Rain Dish@"

SunbaskNameString:
	db "Sunbask@"

SandBodyNameString:
	db "Sand Body@"

IceBodyNameString:
	db "Ice Body@"

HasteNameString:
	db "Haste@"

AimNameString:
	db "Aim@"

FocusNameString:
	db "Focus@"

VeiledNameString:
	db "Veiled@"

InvisibleWallNameString:
	db "Invisible Wall@"

ImpostorNameString:
	db "Impostor@"

DebrisNameString:
	db "Debris@"

LeechNameString:
	db "Leech@"

SwiftSwimNameString:
	db "Swift Swim@"

ChlorophyllNameString:
	db "Chlorophyll@"

SandRushNameString:
	db "Sand Rush@"

SlushRushNameString:
	db "Slush Rush@"

EnervateNameString:
	db "Enervate@"

DauntNameString:
	db "Daunt@"
