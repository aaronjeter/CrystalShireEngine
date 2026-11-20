Marts:
; entries correspond to MART_* constants (see constants/mart_constants.asm)
	table_width 2
	dw MartCherrygrove
	dw MartViolet
	dw MartAzalea
	dw MartCianwood
	dw MartGoldenrod2F1
	dw MartGoldenrod2F2
	dw MartGoldenrod3F
	dw MartGoldenrod4F
	dw MartGoldenrod5F1
	dw MartGoldenrod5F2
	dw MartGoldenrod5F3
	dw MartGoldenrod5F4
	dw MartOlivine
	dw MartEcruteak
	dw MartMahogany1
	dw MartMahogany2
	dw MartBlackthorn
	dw MartViridian
	dw MartPewter
	dw MartCerulean
	dw MartLavender
	dw MartVermilion
	dw MartCeladon2F1
	dw MartCeladon2F2
	dw MartCeladon3F
	dw MartCeladon4F
	dw MartCeladon5F1
	dw MartCeladon5F2
	dw MartFuchsia
	dw MartSaffron
	dw MartMtMoon
	dw MartIndigoPlateau
	dw MartUnderground
	dw MartMegaMart
	dw Lilycove2FPokeballs
	dw Lilycove2FGear
	dw Lilycove3FTms
	dw Lilycove4FStones
	dw Lilycove5FMedicine
	dw Lilycove5FDrugs
	dw MartOldale
	dw MartPetalburg
	dw MartRustboro
	dw MartVerdanturf
	dw MartSlateport
	dw MartMauville
	dw MartFallarbor
	dw MartLavaridge
	dw MartFortree
	dw MartMossdeep
	dw MartSootopolis
	dw MartBattleResort
	dw MartSlateportMarket
	dw wBadgeMartList ; MART_STANDARD: built by BuildBadgeMart
	assert_table_length NUM_MARTS

MartCherrygrove:
	db 2 ; # items
	dw MYSTIC_WATER
	dw POKE_DOLL

MartViolet:
	db 3 ; # items
	dw SHARP_BEAK
	dw ZOOM_LENS
	dw EVERSTONE

MartAzalea:
	db 3 ; # items
	dw CHARCOAL
	dw SILVERPOWDER
	dw SMOKE_BALL

MartCianwood:
	db 10 ; # items
	dw POTION
	dw SUPER_POTION
	dw HYPER_POTION
	dw FULL_HEAL
	dw REVIVE
	dw MAX_REVIVE
	dw ETHER
	dw MAX_ETHER
	dw ELIXER
	dw BLACKBELT_I

MartGoldenrod2F1:
	db 7 ; # items
	dw POTION
	dw SUPER_POTION
	dw ANTIDOTE
	dw PARLYZ_HEAL
	dw AWAKENING
	dw BURN_HEAL
	dw ICE_HEAL

MartGoldenrod2F2:
	db 7 ; # items
	dw POKE_BALL
	dw GREAT_BALL
	dw ESCAPE_ROPE
	dw REPEL
	dw REVIVE
	dw FULL_HEAL
	dw POKE_DOLL

MartGoldenrod3F:
	db 8 ; # items
	dw FIRE_STONE
	dw THUNDERSTONE
	dw WATER_STONE
	dw LEAF_STONE
	dw MOON_STONE
	dw SUN_STONE
	dw DAWN_STONE
	dw ICE_STONE

MartGoldenrod4F:
	db 13 ; # items
	dw PROTEIN
	dw IRON
	dw CARBOS
	dw CALCIUM
	dw HP_UP
	dw ZINC
	dw MACHO_BRACE
	dw POWER_WEIGHT
	dw POWER_BRACER
	dw POWER_BELT
	dw POWER_ANKLET
	dw POWER_LENS
	dw POWER_BAND

MartGoldenrod5F1:
	db 3 ; # items
	dw TM_THUNDERPUNCH
	dw TM_FIRE_PUNCH
	dw TM_ICE_PUNCH

MartGoldenrod5F2:
	db 4 ; # items
	dw TM_THUNDERPUNCH
	dw TM_FIRE_PUNCH
	dw TM_ICE_PUNCH
	dw TM_HEADBUTT

MartGoldenrod5F3:
	db 4 ; # items
	dw TM_THUNDERPUNCH
	dw TM_FIRE_PUNCH
	dw TM_ICE_PUNCH
	dw TM_ROCK_SMASH

MartGoldenrod5F4:
	db 5 ; # items
	dw TM_THUNDERPUNCH
	dw TM_FIRE_PUNCH
	dw TM_ICE_PUNCH
	dw TM_HEADBUTT
	dw TM_ROCK_SMASH

MartOlivine:
	db 3 ; # items
	dw METAL_COAT
	dw MYSTIC_WATER
	dw ETHER

MartEcruteak:
	db 4 ; # items
	dw SPELL_TAG
	dw CLEANSE_TAG
	dw ETHER
	dw EVERSTONE

MartMahogany1:
	db 4 ; # items
	dw TINYMUSHROOM
	dw SLOWPOKETAIL
	dw POKE_BALL
	dw POTION

MartMahogany2:
	db 3 ; # items
	dw RAGECANDYBAR
	dw NEVERMELTICE
	dw BIG_MUSHROOM

MartBlackthorn:
	db 4 ; # items
	dw DRAGON_FANG
	dw MAX_ETHER
	dw DRAGON_SCALE
	dw POWER_HERB

MartViridian:
	db 2 ; # items
	dw PINK_BOW
	dw POKE_DOLL

MartPewter:
	db 3 ; # items
	dw HARD_STONE
	dw SAFETY_GOGGLES
	dw MOON_STONE

MartCerulean:
	db 3 ; # items
	dw MYSTIC_WATER
	dw ABSORB_BULB
	dw LUMINOUS_MOSS

MartLavender:
	db 4 ; # items
	dw CLEANSE_TAG
	dw SPELL_TAG
	dw POKE_DOLL
	dw ETHER

MartVermilion:
	db 4 ; # items
	dw MAGNET
	dw TM_THIEF
	dw ETHER
	dw MAX_ETHER

MartCeladon2F1:
	db 7 ; # items
	dw POTION
	dw SUPER_POTION
	dw HYPER_POTION
	dw MAX_POTION
	dw REVIVE
	dw SUPER_REPEL
	dw MAX_REPEL

MartCeladon2F2:
	db 10 ; # items
	dw POKE_BALL
	dw GREAT_BALL
	dw ULTRA_BALL
	dw ESCAPE_ROPE
	dw FULL_HEAL
	dw ANTIDOTE
	dw BURN_HEAL
	dw ICE_HEAL
	dw AWAKENING
	dw PARLYZ_HEAL

MartCeladon3F:
	db 7 ; # items
	dw TM_LIGHT_SCREEN
	dw TM_REFLECT
	dw TM_HIDDEN_POWER
	dw TM_SUNNY_DAY
	dw TM_PROTECT
	dw TM_RAIN_DANCE
	dw TM_SANDSTORM

MartCeladon4F:
	db 10 ; # items
	dw POKE_DOLL
	dw POWER_HERB
	dw METRONOME_ITEM
	dw LOADED_DICE
	dw ABSORB_BULB
	dw CELL_BATTERY
	dw SNOWBALL
	dw LUMINOUS_MOSS
	dw SAFETY_GOGGLES
	dw ZOOM_LENS

MartCeladon5F1:
	db 6 ; # items
	dw HP_UP
	dw PROTEIN
	dw IRON
	dw CARBOS
	dw CALCIUM
	dw ZINC

MartCeladon5F2:
	db 7 ; # items
	dw MACHO_BRACE
	dw POWER_WEIGHT
	dw POWER_BRACER
	dw POWER_BELT
	dw POWER_ANKLET
	dw POWER_LENS
	dw POWER_BAND

MartFuchsia:
	db 3 ; # items
	dw POISON_BARB
	dw SMOKE_BALL
	dw BLACK_SLUDGE

MartSaffron:
	db 4 ; # items
	dw TWISTEDSPOON
	dw ELIXER
	dw METRONOME_ITEM
	dw ZOOM_LENS

MartMtMoon:
	db 5 ; # items
	dw POKE_DOLL
	dw FRESH_WATER
	dw SODA_POP
	dw LEMONADE
	dw REPEL

MartIndigoPlateau:
	db 3 ; # items
	dw MAX_REVIVE
	dw ELIXER
	dw MAX_ETHER

MartUnderground:
	db 4 ; # items
	dw ENERGYPOWDER
	dw ENERGY_ROOT
	dw HEAL_POWDER
	dw REVIVAL_HERB

MartMegaMart:
	db 4 ; # items
	dw KANTOITE_X
	dw KANTOITE_Y
	dw JOHTOITE_X
	dw HOENNITE_X

Lilycove2FPokeballs:
	db 8 ; # items
	dw POKE_BALL
	dw GREAT_BALL
	dw ULTRA_BALL
	dw LURE_BALL
	dw HEAVY_BALL
	dw FAST_BALL
	dw FRIEND_BALL
	dw MOON_BALL

Lilycove2FGear:
	db 5 ; # items
	dw ESCAPE_ROPE
	dw REPEL
	dw SUPER_REPEL
	dw POWER_HERB
	dw SAFETY_GOGGLES
	dw ZOOM_LENS
	dw METRONOME_ITEM
	dw MAX_REPEL	
	dw POKE_DOLL

Lilycove3FTms:
	db 9 ; # items
	dw TM_LIGHT_SCREEN
	dw TM_REFLECT
	dw TM_ROCK_SMASH
	dw TM_HIDDEN_POWER
	dw TM_STEEL_WING
	dw TM_BRICK_BREAK
	dw TM_DIG
	dw TM_SANDSTORM
	dw TM_HAIL

Lilycove4FStones:
	db 13 ; # items
	dw FIRE_STONE
	dw THUNDERSTONE
	dw WATER_STONE
	dw LEAF_STONE
	dw MOON_STONE
	dw SUN_STONE
	dw DAWN_STONE
	dw ICE_STONE
	dw ABSORB_BULB
	dw CELL_BATTERY
	dw SNOWBALL
	dw LUMINOUS_MOSS
	dw LOADED_DICE

Lilycove5FMedicine:
	db 7 ; # items
	dw HYPER_POTION
	dw MAX_POTION
	dw FULL_HEAL
	dw REVIVE
	dw ETHER
	dw MAX_ETHER
	dw FULL_RESTORE

Lilycove5FDrugs:
	db 13 ; # items
	dw PROTEIN
	dw IRON
	dw CARBOS
	dw CALCIUM
	dw HP_UP
	dw ZINC
	dw MACHO_BRACE
	dw POWER_WEIGHT
	dw POWER_BRACER
	dw POWER_BELT
	dw POWER_ANKLET
	dw POWER_LENS
	dw POWER_BAND

DefaultMart:
	db 2 ; # items
	dw POKE_BALL
	dw POTION

MartOldale:
	db 2 ; # items
	dw MIRACLE_SEED
	dw POKE_DOLL

MartPetalburg:
	db 3 ; # items
	dw PINK_BOW
	dw LOADED_DICE
	dw METRONOME_ITEM

MartRustboro:
	db 3 ; # items
	dw HARD_STONE
	dw EVERSTONE
	dw SAFETY_GOGGLES

MartVerdanturf:
	db 2 ; # items
	dw POLKADOT_BOW
	dw POKE_DOLL

MartSlateport:
	db 2 ; # items
	dw MYSTIC_WATER
	dw ETHER

MartMauville:
	db 3 ; # items
	dw MAGNET
	dw CELL_BATTERY
	dw THUNDERSTONE

MartFallarbor:
	db 3 ; # items
	dw SOFT_SAND
	dw BLACKGLASSES
	dw MAX_ETHER

MartLavaridge:
	db 5 ; # items
	dw CHARCOAL
	dw ENERGYPOWDER
	dw ENERGY_ROOT
	dw HEAL_POWDER
	dw REVIVAL_HERB

MartFortree:
	db 3 ; # items
	dw SHARP_BEAK
	dw POWER_HERB
	dw ZOOM_LENS

MartMossdeep:
	db 3 ; # items
	dw TWISTEDSPOON
	dw MAX_ETHER
	dw METRONOME_ITEM

MartSootopolis:
	db 3 ; # items
	dw MYSTIC_WATER
	dw MAX_ETHER
	dw ELIXER

MartBattleResort:
	db 3 ; # items
	dw MAX_REVIVE
	dw ELIXER
	dw MAX_ETHER

MartSlateportMarket:
	db 7 ; # items
	dw ORAN_BERRY
	dw CHERI_BERRY
	dw CHESTO_BERRY
	dw PECHA_BERRY
	dw RAWST_BERRY
	dw ASPEAR_BERRY
	dw PERSIM_BERRY
