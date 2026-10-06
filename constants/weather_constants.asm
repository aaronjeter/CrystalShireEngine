; Overworld weather (see engine/overworld/weather.asm)
; Ported from Pokemon Polished Crystal (weather code by vulcandth, sprites by SourApple).

; wCurWeather / wPrevWeather values
	const_def
	const OW_WEATHER_NONE      ; 0
	const OW_WEATHER_RAIN      ; 1
	const OW_WEATHER_SNOW      ; 2
	const OW_WEATHER_SANDSTORM ; 3
DEF NUM_OW_WEATHERS EQU const_value - 1

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
DEF PAL_OW_WEATHER  EQU 6

; frames of particles still falling after leaving a weather map
DEF OW_WEATHER_COOLDOWN EQU 32

; border fade between weather tints: number of steps. Each step takes 4 frames
; (half of the BG palettes per frame, then half of the object palettes),
; so 15 steps = 60 frames = 1 second.
DEF WEATHER_FADE_STEPS EQU 15
