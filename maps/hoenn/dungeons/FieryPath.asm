	object_const_def

FieryPath_MapScripts:
	def_scene_scripts

	def_callbacks

FieryPathFireStone:
	itemball FIRE_STONE

FieryPathPpUp:
	itemball TM_SLUDGE_WAVE

FieryPathWildRock:
	jumpstd SmashRockScript

FieryPath_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  31, 37, ROUTE_112, 1
	warp_event  31, 05, ROUTE_112, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  15, 05, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FieryPathFireStone, EVENT_FIERY_PATH_FIRE_STONE
	object_event  08, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FieryPathPpUp, EVENT_FIERY_PATH_PP_UP
	object_event  9, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FieryPathWildRock, -1
	object_event 33, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FieryPathWildRock, -1
	object_event  4,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FieryPathWildRock, -1
