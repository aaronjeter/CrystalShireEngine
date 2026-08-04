	object_const_def
	const FIERYPATH_TORKOAL
	const FIERYPATH_SLUGMA1
	const FIERYPATH_SLUGMA2

FieryPath_MapScripts:
	def_scene_scripts

	def_callbacks	

FieryPath_Torkoal:
	cry TORKOAL
	loadwildmon TORKOAL, 9
	startbattle
	reloadmapafterbattle
	disappear FIERYPATH_TORKOAL
	end

FieryPath_Slugma1:
	cry SLUGMA
	loadwildmon SLUGMA, 4
	startbattle
	reloadmapafterbattle
	disappear FIERYPATH_SLUGMA1
	end

FieryPath_Slugma2:
	cry SLUGMA
	loadwildmon SLUGMA, 2
	startbattle
	reloadmapafterbattle
	disappear FIERYPATH_SLUGMA2
	end

FieryPathFireStone:
	itemball FIRE_STONE

FieryPathPpUp:
	itemball PP_UP

FieryPath_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  31, 37, ROUTE_112, 1
	warp_event  31, 05, ROUTE_112, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  08, 37, SPRITE_TORKOAL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FieryPath_Torkoal, -1
	object_event  09, 15, SPRITE_SLUGMA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FieryPath_Slugma1, -1
	object_event  21, 37, SPRITE_SLUGMA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FieryPath_Slugma2, -1
	object_event  15, 05, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FieryPathFireStone, EVENT_FIERY_PATH_FIRE_STONE
	object_event  08, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FieryPathPpUp, EVENT_FIERY_PATH_PP_UP
