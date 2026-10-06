; Maps with permanent overworld weather (see engine/overworld/weather.asm).
; Indoor maps and caves should not be listed.

MACRO ow_weather
	map_id \1
	db \2 ; OW_WEATHER_* constant
ENDM

OverworldWeatherMaps:
	ow_weather ROUTE_119_SOUTH,     OW_WEATHER_RAIN
	ow_weather ROUTE_119_NORTH,     OW_WEATHER_RAIN
	ow_weather ROUTE_120,           OW_WEATHER_RAIN
	ow_weather FORTREE_CITY,        OW_WEATHER_RAIN
	ow_weather LAKE_OF_RAGE,        OW_WEATHER_RAIN
	ow_weather ROUTE_43,            OW_WEATHER_RAIN
	ow_weather LAVARIDGE_DESERT,    OW_WEATHER_SANDSTORM
	ow_weather SILVER_CAVE_OUTSIDE, OW_WEATHER_SNOW
	db -1 ; end
