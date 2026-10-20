; Ability IDs
; indexes for:
; - AbilityNames (see data/abilities/names.asm)
; - AbilityDescriptions (see data/abilities/descriptions.asm)
; - the entries of SpeciesAbilities (see data/abilities/species_abilities.asm)
	const_def
	const NO_ABILITY
	const ABILITY_DRIZZLE
	const ABILITY_DROUGHT
	const ABILITY_SAND_STREAM
	const ABILITY_SNOW_WARNING
	const ABILITY_INTIMIDATE
	const ABILITY_MYSTIFY
	const ABILITY_SNARE
	const ABILITY_HASTE
	const ABILITY_AIM
	const ABILITY_FOCUS
	const ABILITY_VEILED
	const ABILITY_INVISIBLE_WALL
	const ABILITY_IMPOSTOR
	const ABILITY_DEBRIS
	const ABILITY_LEECH
	const ABILITY_ENERVATE
	const ABILITY_DAUNT
	const ABILITY_LEVITATE
	const ABILITY_WATERPROOF
	const ABILITY_ELEMENTAL_FIST
	const ABILITY_ELEMENTAL_FANG
	const ABILITY_ELEMENTAL_BLADE
	const ABILITY_STABILITY
	const ABILITY_REGENERATION
	const ABILITY_RAIN_DISH
	const ABILITY_SUNBASK
	const ABILITY_SAND_BODY
	const ABILITY_ICE_BODY
	const ABILITY_SWIFT_SWIM
	const ABILITY_CHLOROPHYLL
	const ABILITY_SAND_RUSH
	const ABILITY_SLUSH_RUSH
	const ABILITY_THICK_FAT
	const ABILITY_DURABLE
	const ABILITY_PRANKSTER
	const ABILITY_SERENE_GRACE
	const ABILITY_TECHNICIAN
	const ABILITY_GUTS
	const ABILITY_SHED_SKIN
	const ABILITY_STATIC
	const ABILITY_FLAME_BODY
	const ABILITY_POISON_POINT
	const ABILITY_MAGIC_GUARD
	const ABILITY_CLEAR_BODY
DEF NUM_ABILITIES EQU const_value

; ability slots: which of its species' three abilities a Pokemon has
	const_def
	const ABILITY_SLOT_1      ; 0
	const ABILITY_SLOT_2      ; 1
	const ABILITY_SLOT_HIDDEN ; 2
DEF NUM_ABILITY_SLOTS EQU const_value

; A Pokemon's slot is stored in bits 0-1 of MON_ABILITY_SLOT (box_struct padding).
; Slot value 3 is unused and counts as ABILITY_SLOT_1. Bits 2-7 are free.
DEF ABILITY_SLOT_MASK EQU %11
