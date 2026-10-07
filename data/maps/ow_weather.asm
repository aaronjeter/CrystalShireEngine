; Overworld weather per map (see engine/overworld/weather.asm).
; Indoor maps and caves should not be listed.
;  ow_weather      MAP, OW_WEATHER_*   - always this weather
;  ow_weather_zone MAP, WEATHER_ZONE_* - random weather shared by the whole zone

MACRO ow_weather
	map_id \1
	db \2 ; OW_WEATHER_* constant
ENDM

MACRO ow_weather_zone
	map_id \1
	db \2 | (1 << OW_WEATHER_ZONE_F)
ENDM

MACRO weather_zone
	db \1, \2 ; weather, chance (rolled every in-game hour)
ENDM

OverworldWeatherZones:
	table_width 2
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_JOHTO_SOUTH
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_JOHTO_NORTH
	weather_zone OW_WEATHER_RAIN,       50 percent ; WEATHER_ZONE_LAKE_OF_RAGE_AREA
	weather_zone OW_WEATHER_SNOW,       50 percent ; WEATHER_ZONE_JOHTO_MOUNTAINS
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_JOHTO_COAST
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_JOHTO_EAST_SEA
	weather_zone OW_WEATHER_RAIN,       15 percent ; WEATHER_ZONE_KANTO_WEST
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_KANTO_NORTH
	weather_zone OW_WEATHER_RAIN,       15 percent ; WEATHER_ZONE_KANTO_CENTRAL
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_KANTO_SOUTH
	weather_zone OW_WEATHER_RAIN,       50 percent ; WEATHER_ZONE_KANTO_SEA
	weather_zone OW_WEATHER_SNOW,       50 percent ; WEATHER_ZONE_MT_SILVER
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_HOENN_SOUTHWEST
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_HOENN_SEA
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_HOENN_CENTRAL
	weather_zone OW_WEATHER_SANDSTORM,  25 percent ; WEATHER_ZONE_HOENN_NORTH
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_HOENN_EAST
	weather_zone OW_WEATHER_RAIN,       25 percent ; WEATHER_ZONE_HOENN_ISLANDS
	weather_zone OW_WEATHER_SNOW,       50 percent ; WEATHER_ZONE_HOENN_MOUNTAINS
	assert_table_length NUM_WEATHER_ZONES

OverworldWeatherMaps:
	ow_weather ROUTE_119_SOUTH,     OW_WEATHER_RAIN
	ow_weather ROUTE_119_NORTH,     OW_WEATHER_RAIN
	ow_weather ROUTE_120,           OW_WEATHER_RAIN
	ow_weather FORTREE_CITY,        OW_WEATHER_RAIN
	ow_weather LAKE_OF_RAGE,        OW_WEATHER_RAIN
	ow_weather ROUTE_43,            OW_WEATHER_RAIN
	ow_weather LAVARIDGE_DESERT,    OW_WEATHER_SANDSTORM
	ow_weather SILVER_CAVE_OUTSIDE, OW_WEATHER_SNOW
	ow_weather ROUTE_113,           OW_WEATHER_ASH

	; WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone ROUTE_29,                  WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone ROUTE_30,                  WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone ROUTE_31,                  WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone ROUTE_32,                  WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone ROUTE_33,                  WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone ROUTE_34,                  WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone NEW_BARK_TOWN,             WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone CHERRYGROVE_CITY,          WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone VIOLET_CITY,               WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone AZALEA_TOWN,               WEATHER_ZONE_JOHTO_SOUTH
	ow_weather_zone GOLDENROD_CITY,            WEATHER_ZONE_JOHTO_SOUTH

	; WEATHER_ZONE_JOHTO_NORTH
	ow_weather_zone ROUTE_35,                  WEATHER_ZONE_JOHTO_NORTH
	ow_weather_zone ROUTE_36,                  WEATHER_ZONE_JOHTO_NORTH
	ow_weather_zone ROUTE_37,                  WEATHER_ZONE_JOHTO_NORTH
	ow_weather_zone ROUTE_38,                  WEATHER_ZONE_JOHTO_NORTH
	ow_weather_zone ROUTE_39,                  WEATHER_ZONE_JOHTO_NORTH
	ow_weather_zone ECRUTEAK_CITY,             WEATHER_ZONE_JOHTO_NORTH
	ow_weather_zone NATIONAL_PARK,             WEATHER_ZONE_JOHTO_NORTH
	ow_weather_zone NATIONAL_PARK_BUG_CONTEST, WEATHER_ZONE_JOHTO_NORTH
	ow_weather_zone RUINS_OF_ALPH_OUTSIDE,     WEATHER_ZONE_JOHTO_NORTH

	; WEATHER_ZONE_LAKE_OF_RAGE_AREA
	ow_weather_zone ROUTE_42,                  WEATHER_ZONE_LAKE_OF_RAGE_AREA
	ow_weather_zone ROUTE_44,                  WEATHER_ZONE_LAKE_OF_RAGE_AREA
	ow_weather_zone MAHOGANY_TOWN,             WEATHER_ZONE_LAKE_OF_RAGE_AREA

	; WEATHER_ZONE_JOHTO_MOUNTAINS
	ow_weather_zone ROUTE_45,                  WEATHER_ZONE_JOHTO_MOUNTAINS
	ow_weather_zone ROUTE_46,                  WEATHER_ZONE_JOHTO_MOUNTAINS
	ow_weather_zone BLACKTHORN_CITY,           WEATHER_ZONE_JOHTO_MOUNTAINS

	; WEATHER_ZONE_JOHTO_COAST
	ow_weather_zone OLIVINE_CITY,              WEATHER_ZONE_JOHTO_COAST
	ow_weather_zone ROUTE_40,                  WEATHER_ZONE_JOHTO_COAST
	ow_weather_zone ROUTE_41,                  WEATHER_ZONE_JOHTO_COAST
	ow_weather_zone CIANWOOD_CITY,             WEATHER_ZONE_JOHTO_COAST

	; WEATHER_ZONE_JOHTO_EAST_SEA
	ow_weather_zone ROUTE_26,                  WEATHER_ZONE_JOHTO_EAST_SEA
	ow_weather_zone ROUTE_27,                  WEATHER_ZONE_JOHTO_EAST_SEA

	; WEATHER_ZONE_KANTO_WEST
	ow_weather_zone PALLET_TOWN,               WEATHER_ZONE_KANTO_WEST
	ow_weather_zone VIRIDIAN_CITY,             WEATHER_ZONE_KANTO_WEST
	ow_weather_zone PEWTER_CITY,               WEATHER_ZONE_KANTO_WEST
	ow_weather_zone ROUTE_1,                   WEATHER_ZONE_KANTO_WEST
	ow_weather_zone ROUTE_2,                   WEATHER_ZONE_KANTO_WEST
	ow_weather_zone ROUTE_3,                   WEATHER_ZONE_KANTO_WEST
	ow_weather_zone ROUTE_22,                  WEATHER_ZONE_KANTO_WEST

	; WEATHER_ZONE_KANTO_NORTH
	ow_weather_zone CERULEAN_CITY,             WEATHER_ZONE_KANTO_NORTH
	ow_weather_zone ROUTE_4,                   WEATHER_ZONE_KANTO_NORTH
	ow_weather_zone ROUTE_9,                   WEATHER_ZONE_KANTO_NORTH
	ow_weather_zone ROUTE_10_NORTH,            WEATHER_ZONE_KANTO_NORTH
	ow_weather_zone ROUTE_10_SOUTH,            WEATHER_ZONE_KANTO_NORTH
	ow_weather_zone ROUTE_24,                  WEATHER_ZONE_KANTO_NORTH
	ow_weather_zone ROUTE_25,                  WEATHER_ZONE_KANTO_NORTH

	; WEATHER_ZONE_KANTO_CENTRAL
	ow_weather_zone SAFFRON_CITY,              WEATHER_ZONE_KANTO_CENTRAL
	ow_weather_zone CELADON_CITY,              WEATHER_ZONE_KANTO_CENTRAL
	ow_weather_zone VERMILION_CITY,            WEATHER_ZONE_KANTO_CENTRAL
	ow_weather_zone LAVENDER_TOWN,             WEATHER_ZONE_KANTO_CENTRAL
	ow_weather_zone ROUTE_5,                   WEATHER_ZONE_KANTO_CENTRAL
	ow_weather_zone ROUTE_6,                   WEATHER_ZONE_KANTO_CENTRAL
	ow_weather_zone ROUTE_7,                   WEATHER_ZONE_KANTO_CENTRAL
	ow_weather_zone ROUTE_8,                   WEATHER_ZONE_KANTO_CENTRAL
	ow_weather_zone ROUTE_11,                  WEATHER_ZONE_KANTO_CENTRAL

	; WEATHER_ZONE_KANTO_SOUTH
	ow_weather_zone FUCHSIA_CITY,              WEATHER_ZONE_KANTO_SOUTH
	ow_weather_zone ROUTE_12,                  WEATHER_ZONE_KANTO_SOUTH
	ow_weather_zone ROUTE_13,                  WEATHER_ZONE_KANTO_SOUTH
	ow_weather_zone ROUTE_14,                  WEATHER_ZONE_KANTO_SOUTH
	ow_weather_zone ROUTE_15,                  WEATHER_ZONE_KANTO_SOUTH
	ow_weather_zone ROUTE_16,                  WEATHER_ZONE_KANTO_SOUTH
	ow_weather_zone ROUTE_17,                  WEATHER_ZONE_KANTO_SOUTH
	ow_weather_zone ROUTE_18,                  WEATHER_ZONE_KANTO_SOUTH

	; WEATHER_ZONE_KANTO_SEA
	ow_weather_zone CINNABAR_ISLAND,           WEATHER_ZONE_KANTO_SEA
	ow_weather_zone ROUTE_19,                  WEATHER_ZONE_KANTO_SEA
	ow_weather_zone ROUTE_20,                  WEATHER_ZONE_KANTO_SEA
	ow_weather_zone ROUTE_21,                  WEATHER_ZONE_KANTO_SEA

	; WEATHER_ZONE_MT_SILVER
	ow_weather_zone ROUTE_28,                  WEATHER_ZONE_MT_SILVER

	; WEATHER_ZONE_HOENN_SOUTHWEST
	ow_weather_zone LITTLEROOT_TOWN,           WEATHER_ZONE_HOENN_SOUTHWEST
	ow_weather_zone OLDALE_TOWN,               WEATHER_ZONE_HOENN_SOUTHWEST
	ow_weather_zone PETALBURG_CITY,            WEATHER_ZONE_HOENN_SOUTHWEST
	ow_weather_zone RUSTBORO_CITY,             WEATHER_ZONE_HOENN_SOUTHWEST
	ow_weather_zone ROUTE_101,                 WEATHER_ZONE_HOENN_SOUTHWEST
	ow_weather_zone ROUTE_102,                 WEATHER_ZONE_HOENN_SOUTHWEST
	ow_weather_zone ROUTE_103,                 WEATHER_ZONE_HOENN_SOUTHWEST
	ow_weather_zone ROUTE_104,                 WEATHER_ZONE_HOENN_SOUTHWEST
	ow_weather_zone ROUTE_116,                 WEATHER_ZONE_HOENN_SOUTHWEST

	; WEATHER_ZONE_HOENN_SEA
	ow_weather_zone DEWFORD_TOWN,              WEATHER_ZONE_HOENN_SEA
	ow_weather_zone SLATEPORT_CITY,            WEATHER_ZONE_HOENN_SEA
	ow_weather_zone ROUTE_105,                 WEATHER_ZONE_HOENN_SEA
	ow_weather_zone ROUTE_108,                 WEATHER_ZONE_HOENN_SEA
	ow_weather_zone ROUTE_109,                 WEATHER_ZONE_HOENN_SEA

	; WEATHER_ZONE_HOENN_CENTRAL
	ow_weather_zone MAUVILLE_CITY,             WEATHER_ZONE_HOENN_CENTRAL
	ow_weather_zone VERDANTURF_TOWN,           WEATHER_ZONE_HOENN_CENTRAL
	ow_weather_zone ROUTE_110,                 WEATHER_ZONE_HOENN_CENTRAL
	ow_weather_zone ROUTE_117,                 WEATHER_ZONE_HOENN_CENTRAL
	ow_weather_zone ROUTE_118,                 WEATHER_ZONE_HOENN_CENTRAL

	; WEATHER_ZONE_HOENN_NORTH
	ow_weather_zone ROUTE_111,                 WEATHER_ZONE_HOENN_NORTH
	ow_weather_zone ROUTE_112,                 WEATHER_ZONE_HOENN_NORTH

	; WEATHER_ZONE_HOENN_EAST
	ow_weather_zone LILYCOVE_CITY,             WEATHER_ZONE_HOENN_EAST
	ow_weather_zone MT_PYRE,                   WEATHER_ZONE_HOENN_EAST
	ow_weather_zone ROUTE_121,                 WEATHER_ZONE_HOENN_EAST
	ow_weather_zone ROUTE_122,                 WEATHER_ZONE_HOENN_EAST
	ow_weather_zone ROUTE_123,                 WEATHER_ZONE_HOENN_EAST

	; WEATHER_ZONE_HOENN_ISLANDS
	ow_weather_zone MOSSDEEP_CITY,             WEATHER_ZONE_HOENN_ISLANDS
	ow_weather_zone SOOTOPOLIS_CITY,           WEATHER_ZONE_HOENN_ISLANDS
	ow_weather_zone EVERGRANDE_CITY,           WEATHER_ZONE_HOENN_ISLANDS

	; WEATHER_ZONE_HOENN_MOUNTAINS
	ow_weather_zone FALLARBOR_TOWN,            WEATHER_ZONE_HOENN_MOUNTAINS
	ow_weather_zone ROUTE_114,                 WEATHER_ZONE_HOENN_MOUNTAINS
	ow_weather_zone ROUTE_115,                 WEATHER_ZONE_HOENN_MOUNTAINS
	db -1 ; end

WeatherHashTable:
; A shuffled list of 0-255 (Pearson hashing) used to roll zone weather.
	db $2f, $fa, $11, $8f, $67, $cd, $3e, $d6, $02, $b9, $d9, $0b, $83, $28, $f8, $7a
	db $8d, $14, $c3, $6f, $e6, $64, $92, $9d, $b6, $54, $fd, $27, $26, $2c, $73, $af
	db $85, $fc, $05, $3d, $6e, $c1, $46, $3f, $c7, $bb, $5d, $39, $72, $45, $f1, $53
	db $ef, $2b, $bf, $db, $7e, $7c, $18, $f7, $df, $97, $10, $4c, $f3, $37, $78, $91
	db $cc, $57, $69, $c5, $4e, $bc, $5e, $b7, $6b, $24, $96, $71, $a2, $9e, $3a, $33
	db $84, $b3, $b0, $de, $d4, $07, $5b, $e8, $dc, $ac, $48, $4f, $eb, $b2, $9c, $12
	db $c2, $ab, $a7, $1f, $7f, $a5, $6c, $88, $c6, $87, $4d, $34, $15, $86, $03, $a6
	db $60, $41, $e9, $2e, $9a, $35, $d7, $94, $29, $40, $51, $98, $95, $d1, $62, $ad
	db $a9, $e1, $25, $cb, $d8, $42, $c4, $e5, $cf, $44, $e3, $1b, $93, $7d, $17, $e0
	db $55, $22, $d5, $c9, $6d, $aa, $fb, $6a, $66, $4b, $da, $e7, $77, $3b, $59, $a4
	db $68, $0f, $f9, $70, $58, $f2, $76, $08, $5f, $ae, $ed, $b5, $c8, $23, $e4, $63
	db $8c, $89, $38, $21, $65, $ee, $61, $81, $31, $75, $f4, $0d, $a0, $52, $ca, $49
	db $a3, $1d, $ff, $06, $82, $09, $04, $0a, $16, $ba, $ce, $0e, $f0, $36, $0c, $a8
	db $8b, $bd, $43, $56, $f5, $00, $3c, $7b, $99, $5c, $32, $b1, $50, $1c, $2d, $2a
	db $8a, $1e, $b8, $30, $a1, $01, $e2, $79, $ea, $ec, $1a, $c0, $d2, $8e, $80, $20
	db $f6, $dd, $47, $19, $be, $90, $fe, $b4, $9f, $9b, $4a, $13, $5a, $d3, $d0, $74
