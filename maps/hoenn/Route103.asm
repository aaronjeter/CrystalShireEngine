	object_const_def
	const ROUTE103_ZIGZAGOON
	const ROUTE103_WINGULL

Route103_MapScripts:
	def_scene_scripts

	def_callbacks	

Route103_Zigzagoon:
	cry ZIGZAGOON
	loadwildmon ZIGZAGOON, 2
	startbattle
	reloadmapafterbattle
	disappear ROUTE103_ZIGZAGOON
	end

Route103_Wingull:
	cry WINGULL
	loadwildmon WINGULL, 3
	startbattle
	reloadmapafterbattle
	disappear ROUTE103_WINGULL
	end

Route103_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  17,  8, SPRITE_ZIGZAGOON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route103_Zigzagoon, -1
	object_event  15,  4, SPRITE_WINGULL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route103_Wingull, -1
	
	