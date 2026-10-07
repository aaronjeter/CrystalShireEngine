; Overworld weather (see engine/overworld/weather.asm)
; Ported from Pokemon Polished Crystal (weather code by vulcandth, sprites by SourApple).

; wCurWeather / wPrevWeather values
	const_def
	const OW_WEATHER_NONE      ; 0
	const OW_WEATHER_RAIN      ; 1
	const OW_WEATHER_SNOW      ; 2
	const OW_WEATHER_SANDSTORM ; 3
	const OW_WEATHER_ASH       ; 4 ; falls like snow, gray (Route 113)
DEF NUM_OW_WEATHERS EQU const_value - 1

; Random weather zones (see data/maps/ow_weather.asm).
; Every map in a zone shares one roll, re-rolled every in-game hour.
	const_def
	const WEATHER_ZONE_JOHTO_SOUTH
	const WEATHER_ZONE_JOHTO_NORTH
	const WEATHER_ZONE_LAKE_OF_RAGE_AREA
	const WEATHER_ZONE_JOHTO_MOUNTAINS
	const WEATHER_ZONE_JOHTO_COAST
	const WEATHER_ZONE_JOHTO_EAST_SEA
	const WEATHER_ZONE_KANTO_WEST
	const WEATHER_ZONE_KANTO_NORTH
	const WEATHER_ZONE_KANTO_CENTRAL
	const WEATHER_ZONE_KANTO_SOUTH
	const WEATHER_ZONE_KANTO_SEA
	const WEATHER_ZONE_MT_SILVER
	const WEATHER_ZONE_HOENN_SOUTHWEST
	const WEATHER_ZONE_HOENN_SEA
	const WEATHER_ZONE_HOENN_CENTRAL
	const WEATHER_ZONE_HOENN_NORTH
	const WEATHER_ZONE_HOENN_EAST
	const WEATHER_ZONE_HOENN_ISLANDS
	const WEATHER_ZONE_HOENN_MOUNTAINS
DEF NUM_WEATHER_ZONES EQU const_value
DEF OW_WEATHER_ZONE_F EQU 7 ; set in an OverworldWeatherMaps entry: the byte is a zone, not a weather

; wWeatherFlags bits
	const_def
	const OW_WEATHER_DISABLED_F        ; 0 ; paused (textbox open, etc.)
	const OW_WEATHER_IGNORE_PLAYER_Y_F ; 1 ; screen shake moves the camera, not the player

; Weather particles use these two object tiles (VRAM bank 0)
; and this object palette slot.
DEF WEATHER_TILE_1  EQU $6d
DEF WEATHER_TILE_2  EQU $6e
DEF RAINDROP_TILE   EQU WEATHER_TILE_1
DEF RAINSPLASH_TILE EQU WEATHER_TILE_2
DEF SNOWFLAKE_TILE  EQU WEATHER_TILE_1
DEF SANDSTORM_TILE  EQU WEATHER_TILE_1
DEF ASH_TILE        EQU WEATHER_TILE_1
DEF PAL_OW_WEATHER  EQU 6

; frames of particles still falling after leaving a weather map
DEF OW_WEATHER_COOLDOWN EQU 32

; border fade between weather tints: number of steps. Each step takes 4 frames
; (half of the BG palettes per frame, then half of the object palettes),
; so 15 steps = 60 frames = 1 second.
DEF WEATHER_FADE_STEPS EQU 15
