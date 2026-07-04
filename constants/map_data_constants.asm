DEF MAPGROUP_N_A  EQU -1
DEF GROUP_N_A     EQU -1
DEF MAP_N_A       EQU -1
DEF MAPGROUP_NONE EQU 0
DEF GROUP_NONE    EQU 0
DEF MAP_NONE      EQU 0

; map struct members (see data/maps/maps.asm)
rsreset
DEF MAP_MAPATTRIBUTES_BANK rb ; 0
DEF MAP_TILESET            rb ; 1
DEF MAP_ENVIRONMENT        rb ; 2
DEF MAP_MAPATTRIBUTES      rw ; 3
DEF MAP_LOCATION           rb ; 5
DEF MAP_MUSIC              rb ; 6
DEF MAP_PALETTE            rb ; 7
DEF MAP_FISHGROUP          rb ; 8
DEF MAP_LENGTH EQU _RS

; map landmark name signs
	const_def
	const SIGN_WOOD
	const SIGN_CITY
	const SIGN_FOREST
	const SIGN_CAVE
	const SIGN_ROUTE
	const SIGN_WATER
	const SIGN_BUILDING
DEF NUM_SIGNS EQU const_value

; map environments (wEnvironment)
; EnvironmentColorsPointers indexes (see data/maps/environment_colors.asm)
	const_def 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const ENVIRONMENT_5
	const GATE
	const DUNGEON
DEF NUM_ENVIRONMENTS EQU const_value - 1

; map palettes (wMapTimeOfDay)
	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_EVE
DEF NUM_MAP_PALETTES EQU const_value

DEF IN_DARKNESS_F EQU 3
DEF IN_DARKNESS EQU 1 << IN_DARKNESS_F ; masked with a PALETTE_* constant

; FishGroups indexes (see data/wild/fish.asm)
	const_def
	const FISHGROUP_NONE
	const FISHGROUP_SHORE
	const FISHGROUP_OCEAN
	const FISHGROUP_LAKE
	const FISHGROUP_POND
	const FISHGROUP_DRATINI
	const FISHGROUP_QWILFISH_SWARM
	const FISHGROUP_REMORAID_SWARM
	const FISHGROUP_GYARADOS
	const FISHGROUP_DRATINI_2
	const FISHGROUP_WHIRL_ISLANDS
	const FISHGROUP_QWILFISH
	const FISHGROUP_REMORAID
	const FISHGROUP_QWILFISH_NO_SWARM
	const FISHGROUP_HOENN_SHORE
	const FISHGROUP_HOENN_OCEAN
	const FISHGROUP_HOENN_LAKE
	const FISHGROUP_HOENN_POND
	const FISHGROUP_HOENN_CAVE
	const FISHGROUP_HOENN_RIVER
DEF NUM_FISHGROUPS EQU const_value - 1

; wMapConnections
; connection directions (see data/maps/data.asm)
	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH

; SpawnPoints indexes (see data/maps/spawn_points.asm)
	const_def
	const SPAWN_HOME
	const SPAWN_DEBUG
; kanto
	const SPAWN_PALLET
	const SPAWN_VIRIDIAN
	const SPAWN_PEWTER
	const SPAWN_CERULEAN
	const SPAWN_ROCK_TUNNEL
	const SPAWN_VERMILION
	const SPAWN_LAVENDER
	const SPAWN_SAFFRON
	const SPAWN_CELADON
	const SPAWN_FUCHSIA
	const SPAWN_CINNABAR
	const SPAWN_INDIGO
; johto
	const SPAWN_NEW_BARK
	const SPAWN_CHERRYGROVE
	const SPAWN_VIOLET
	const SPAWN_UNION_CAVE
	const SPAWN_AZALEA
	const SPAWN_CIANWOOD
	const SPAWN_GOLDENROD
	const SPAWN_OLIVINE
	const SPAWN_ECRUTEAK
	const SPAWN_MAHOGANY
	const SPAWN_LAKE_OF_RAGE
	const SPAWN_BLACKTHORN
	const SPAWN_MT_SILVER
	const SPAWN_FAST_SHIP
; hoenn
	const SPAWN_LITTLEROOT
	const SPAWN_OLDALE
	const SPAWN_PETALBURG
	const SPAWN_RUSTBORO
	const SPAWN_DEWFORD
	const SPAWN_SLATEPORT
	const SPAWN_MAUVILLE
	const SPAWN_VERDANTURF
	const SPAWN_LAVARIDGE
	const SPAWN_FALLARBOR
	const SPAWN_FORTREE
	const SPAWN_LILYCOVE
	const SPAWN_MOSSDEEP
	const SPAWN_SOOTOPOLIS
	const SPAWN_PACIFIDLOG
	const SPAWN_EVERGRANDE
DEF NUM_SPAWNS EQU const_value

DEF SPAWN_N_A EQU -1

; Flypoints indexes (see data/maps/flypoints.asm)
	const_def
; johto
DEF JOHTO_FLYPOINT EQU const_value
	const FLY_NEW_BARK
	const FLY_CHERRYGROVE
	const FLY_VIOLET
	const FLY_AZALEA
	const FLY_GOLDENROD
	const FLY_ECRUTEAK
	const FLY_OLIVINE
	const FLY_CIANWOOD
	const FLY_MAHOGANY
	const FLY_LAKE_OF_RAGE
	const FLY_BLACKTHORN
	const FLY_MT_SILVER
; kanto
DEF KANTO_FLYPOINT EQU const_value
	const FLY_PALLET
	const FLY_VIRIDIAN
	const FLY_PEWTER
	const FLY_CERULEAN
	const FLY_VERMILION
	const FLY_ROCK_TUNNEL
	const FLY_LAVENDER
	const FLY_CELADON	
	const FLY_FUCHSIA
	const FLY_CINNABAR
	const FLY_INDIGO
	const FLY_SAFFRON
DEF HOENN_FLYPOINT EQU const_value	
	const FLY_OLDALE
	const FLY_PETALBURG
	const FLY_RUSTBORO
	const FLY_DEWFORD
	const FLY_SLATEPORT
	const FLY_MAUVILLE
	const FLY_VENDANTURF
	const FLY_LAVARIDGE
	const FLY_FALLARBOR
	const FLY_FORTREE
	const FLY_LILYCOVE
	const FLY_MOSSDEEP
	const FLY_SOOTOPOLIS
	const FLY_PACIFIDLOG
	const FLY_EVERGRANDE
	const FLY_LITTLEROOT
DEF NUM_FLYPOINTS EQU const_value

DEF MAX_OUTDOOR_SPRITES EQU 23 ; see engine/overworld/overworld.asm
