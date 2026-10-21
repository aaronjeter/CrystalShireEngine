AbilityDescriptions:
; entries correspond to ABILITY_* constants
	table_width 2
	dw NoAbilityDesc
	dw DrizzleDesc
	dw DroughtDesc
	dw SandStreamDesc
	dw SnowWarningDesc
	dw IntimidateDesc
	dw MystifyDesc
	dw SnareDesc
	dw HasteDesc
	dw AimDesc
	dw FocusDesc
	dw VeiledDesc
	dw InvisibleWallDesc
	dw ImpostorDesc
	dw DebrisDesc
	dw LeechDesc
	dw EnervateDesc
	dw DauntDesc
	dw LevitateDesc
	dw WaterproofDesc
	dw ElementalFistDesc
	dw ElementalFangDesc
	dw ElementalBladeDesc
	dw StabilityDesc
	dw RegenerationDesc
	dw RainDishDesc
	dw SunbaskDesc
	dw SandBodyDesc
	dw IceBodyDesc
	dw SwiftSwimDesc
	dw ChlorophyllDesc
	dw SandRushDesc
	dw SlushRushDesc
	dw ThickFatDesc
	dw DurableDesc
	dw PranksterDesc
	dw SereneGraceDesc
	dw TechnicianDesc
	dw GutsDesc
	dw ShedSkinDesc
	dw StaticDesc
	dw FlameBodyDesc
	dw PoisonPointDesc
	dw FrigidDesc
	dw EffectSporeDesc
	dw MagicGuardDesc
	dw ClearBodyDesc
	dw SharpnessDesc
	dw IronFistDesc
	dw StrongJawDesc
	dw LimberDesc
	dw InsomniaDesc
	dw ImmunityDesc
	dw WaterVeilDesc
	dw MagmaArmorDesc
	dw OwnTempoDesc
	dw InnerFocusDesc
	dw MultiscaleDesc
	dw BlazeDesc
	dw TorrentDesc
	dw OvergrowDesc
	dw SwarmDesc
	dw ToughClawsDesc
	dw ShieldDustDesc
	dw RoughSkinDesc
	dw RockHeadDesc
	dw GaleWingsDesc
	assert_table_length NUM_ABILITIES

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
	next  "Attack.@"

MystifyDesc:
	db    "Cuts the foe's"
	next  "Sp. Atk.@"

SnareDesc:
	db    "Cuts the foe's"
	next  "Speed.@"

LevitateDesc:
	db    "Protects against"
	next  "Ground moves.@"

WaterproofDesc:
	db    "Protects against"
	next  "Water moves.@"

ElementalFistDesc:
	db    "Boosts off-type"
	next  "Punch moves.@"

ElementalFangDesc:
	db    "Boosts off-type"
	next  "Fang moves.@"

ElementalBladeDesc:
	db    "Boosts off-type"
	next  "Slice moves.@"

StabilityDesc:
	db    "Boosts same-type"
	next  "Attack moves.@"

RegenerationDesc:
	db    "Heals a little"
	next  "each turn.@"

RainDishDesc:
	db    "Heals during"
	next  "Rain.@"

SunbaskDesc:
	db    "Heals during"
	next  "Sun.@"

SandBodyDesc:
	db    "Heals during"
	next  "Sandstorm.@"

IceBodyDesc:
	db    "Heals during"
	next  "Hail.@"

HasteDesc:
	db    "Boosts speed"
	next  "upon entrance.@"

AimDesc:
	db    "Boosts accuracy"
	next  "upon entrance.@"

FocusDesc:
	db    "Boosts critial"
	next  "hit ratio.@"

VeiledDesc:
	db    "Sets Safeguard"
	next  "on entrance.@"

InvisibleWallDesc:
	db    "Sets Reflect"
	next  "on entrance.@"

ImpostorDesc:
	db    "Uses Transform"
	next  "on entrance.@"

DebrisDesc:
	db    "Scatters Spikes"
	next  "on entrance.@"

LeechDesc:
	db    "Scatters Seeds"
	next  "on entrance.@"

SwiftSwimDesc:
	db    "Doubles Speed"
	next  "in Rain.@"

ChlorophyllDesc:
	db    "Doubles Speed"
	next  "in Sun.@"

SandRushDesc:
	db    "Doubles Speed"
	next  "in Sandstorm.@"

SlushRushDesc:
	db    "Doubles Speed"
	next  "in Hail.@"

EnervateDesc:
	db    "Cuts the foe's"
	next  "Sp. Def.@"

DauntDesc:
	db    "Cuts the foe's"
	next  "Def.@"

ThickFatDesc:
	db    "Halves Fire and"
	next  "Ice damage taken.@"

DurableDesc:
	db    "Weakens super-"
	next  "effective hits.@"

PranksterDesc:
	db    "Gives priority to"
	next  "Status moves.@"

SereneGraceDesc:
	db    "Doubles the odds"
	next  "of added effects.@"

TechnicianDesc:
	db    "Boosts moves with"
	next  "60 power or less.@"

GutsDesc:
	db    "Status boosts Atk"
	next  "and ignores burn.@"

ShedSkinDesc:
	db    "May cure its own"
	next  "status each turn.@"

StaticDesc:
	db    "Contact may"
	next  "paralyze attacker.@"

FlameBodyDesc:
	db    "Contact may burn"
	next  "the attacker.@"

PoisonPointDesc:
	db    "Contact may"
	next  "poison attacker.@"

MagicGuardDesc:
	db    "Only takes damage"
	next  "from attacks.@"

ClearBodyDesc:
	db    "Foes can't lower"
	next  "its stats.@"

FrigidDesc:
	db    "Contact may"
	next  "frostbite foe.@"

EffectSporeDesc:
	db    "Contact may cause"
	next  "PSN, PAR or SLP.@"

SharpnessDesc:
	db    "Boosts slicing"
	next  "moves.@"

IronFistDesc:
	db    "Boosts punching"
	next  "moves.@"

StrongJawDesc:
	db    "Boosts biting"
	next  "moves.@"

LimberDesc:
	db    "Prevents"
	next  "paralysis.@"

InsomniaDesc:
	db    "Prevents"
	next  "sleep.@"

ImmunityDesc:
	db    "Prevents"
	next  "poisoning.@"

WaterVeilDesc:
	db    "Prevents"
	next  "burns.@"

MagmaArmorDesc:
	db    "Prevents"
	next  "frostbite.@"

OwnTempoDesc:
	db    "Prevents"
	next  "confusion.@"

InnerFocusDesc:
	db    "Prevents"
	next  "flinching.@"

MultiscaleDesc:
	db    "Halves damage"
	next  "while HP is full.@"

BlazeDesc:
	db    "Powers up Fire"
	next  "moves in a pinch.@"

TorrentDesc:
	db    "Powers up Water"
	next  "moves in a pinch.@"

OvergrowDesc:
	db    "Powers up Grass"
	next  "moves in a pinch.@"

SwarmDesc:
	db    "Powers up Bug"
	next  "moves in a pinch.@"

ToughClawsDesc:
	db    "Boosts contact"
	next  "moves.@"

ShieldDustDesc:
	db    "Blocks added"
	next  "effects of moves.@"

RoughSkinDesc:
	db    "Hurts foes that"
	next  "make contact.@"

RockHeadDesc:
	db    "Protects from"
	next  "recoil damage.@"

GaleWingsDesc:
	db    "Gives priority to"
	next  "Flying moves.@"
