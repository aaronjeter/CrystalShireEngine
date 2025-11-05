;include "data/pokemon/etb_mons.asm"
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilityDroughtMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilityDrizzleMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilitySandStreamMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilitySnowWarningMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilityIntimidateMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilityMystifyMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilitySnareMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilityLevitateMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilityWaterproofMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilityElementalFistMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilityElementalFangMons
	call IsInWordArray
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
	ld b, h
	ld c, l
	ld de, 2
	ld hl, AbilityElementalBladeMons
	call IsInWordArray
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

GetAbilityMon:
	ld a, [wTempAbilityMon]
	call GetPokemonIndexFromID
	ret

NoAbilityNameString:
	db "NO ABILITY@"

DroughtNameString:
	db "DROUGHT@"

DrizzleNameString:
	db "DRIZZLE@"

SandStreamNameString:
	db "SAND STREAM@"

SnowWarningNameString:
	db "SNOW WARNING@"

IntimidateNameString:
	db "INTIMIDATE@"

MystifyNameString:
	db "MYSTIFY@"

SnareNameString:
	db "SNARE@"

LevitateNameString:
	db "LEVITATE@"

WaterproofNameString:
	db "WATERPROOF@"

ElementalFistNameString:
	db "ELEMENTAL FIST@"

ElementalFangNameString:
	db "ELEMENTAL FANG@"

ElementalBladeNameString:
	db "ELEMENTAL BLADE@"

