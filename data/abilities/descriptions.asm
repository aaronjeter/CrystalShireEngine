; Ability descriptions for Pokémon abilities of Gen III
;
; Directly corresponds to the ability IDs (see constants/ability_constants.asm)
; Used to display the ability description on the Stats screen

AbilityDescriptions:
	dw NoAbilityDesc
	dw DroughtDesc
	dw DrizzleDesc
	dw SandStreamDesc
	dw SnowWarningDesc
	dw IntimidateDesc
	dw MystifyDesc
	dw SnareDesc
	dw LevitateDesc	
	dw WaterproofDesc

; Actual descriptions start here
NoAbilityDesc:
	db    "No special"
	next  "ability.@"

DroughtDesc:
	db    "Causes harsh sun"
	next  "upon entrance.@"

DrizzleDesc:
	db    "Causes heavy rain"
	next  "upon entrance.@"

SandStreamDesc:
	db    "Causes a sandstorm"
	next  "upon entrance.@"

SnowWarningDesc:
	db    "Causes a hailstorm"
	next  "upon entrance.@"

IntimidateDesc:
	db    "Cuts the foe's"
	next  "ATTACK.@"

MystifyDesc:
	db    "Cuts the foe's"
	next  "SP. ATK.@"

SnareDesc:
	db    "Cuts the foe's"
	next  "SPEED.@"

LevitateDesc:
	db    "Protects against"
	next  "GROUND moves.@"

WaterproofDesc:
	db    "Protects against"
	next  "WATER moves.@"

ElementalFistDesc:
	db    "Boosts off-type"
	next  "PUNCH moves.@"

ElementalFangDesc:
	db    "Boosts off-type"
	next  "FANG moves.@"

ElementalBladeDesc:
	db    "Boosts off-type"
	next  "SLICE moves.@"



