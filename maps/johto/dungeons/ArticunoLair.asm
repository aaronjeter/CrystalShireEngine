	object_const_def
	const ARTICUNOLAIR_ARTICUNO
	const ARTICUNOLAIR_DELIBIRD1
	const ARTICUNOLAIR_DELIBIRD2
	const ARTICUNOLAIR_DELIBIRD3
	const ARTICUNOLAIR_SANDSLASH
	const ARTICUNOLAIR_GLALIE

ArticunoLair_MapScripts:
	def_scene_scripts

	def_callbacks	

ArticunoLairArticunoText:
	text "The great bird"
	line "regards you"
	cont "pensively."

	para "It accepts your"
	line "challenge!"
	done

ArticunoLair_Articuno:
	cry ARTICUNO
	opentext
	writetext ArticunoLairArticunoText
	closetext
	loadwildmon ARTICUNO, 14
	startbattle
	reloadmapafterbattle
	disappear ARTICUNOLAIR_ARTICUNO
	end

ArticunoLair_Delibird:
	cry DELIBIRD
	loadwildmon DELIBIRD, 5
	startbattle
	reloadmapafterbattle
	disappear ARTICUNOLAIR_DELIBIRD1
	disappear ARTICUNOLAIR_DELIBIRD2
	disappear ARTICUNOLAIR_DELIBIRD3
	end

ArticunoLair_Sandslash:
	cry ASANDSLASH
	loadwildmon ASANDSLASH, 7
	startbattle
	reloadmapafterbattle
	disappear ARTICUNOLAIR_SANDSLASH
	end

ArticunoLair_Glalie:
	cry GLALIE
	loadwildmon GLALIE, 8
	startbattle
	reloadmapafterbattle
	disappear ARTICUNOLAIR_GLALIE
	end

ArticunoLair_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 39,  1, ICE_PATH_B1F, 9

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  7,  2, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoLair_Articuno, -1
	object_event 28, 26, SPRITE_DELIBIRD, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArticunoLair_Delibird, -1
	object_event 30, 34, SPRITE_DELIBIRD, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArticunoLair_Delibird, -1
	object_event 18, 14, SPRITE_DELIBIRD, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArticunoLair_Delibird, -1
	object_event 37, 12, SPRITE_SANDSLASH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoLair_Sandslash, -1
	object_event 21, 10, SPRITE_GLALIE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoLair_Glalie, -1
	