	object_const_def
	const RUSTURF_ROCK

RusturfTunnel_MapScripts:
	def_scene_scripts

	def_callbacks	

RusturfRock:
	jumpstd SmashRockScript

RusturfTunnel_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   5, 11, ROUTE_116, 1
	warp_event  33, 21, VERDANTURF_TOWN, 1
	;warp_event  3, 21, ROUTE_116, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  13, 6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RusturfRock, -1
	