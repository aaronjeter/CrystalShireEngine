	object_const_def
	const MOLTRESLAIR_MOLTRES
	const MOLTRESLAIR_SOLROCK
	const MOLTRESLAIR_CHARIZARD
	const MOLTRESLAIR_TYRANITAR

MoltresLair_MapScripts:
	def_scene_scripts

	def_callbacks	

MoltresLairMoltresText:
	text "Flames swirl"
	line "as Moltres"
	cont "stares at you."

	para "It accepts your"
	line "challenge!"
	done

MoltresLair_Moltres:
	cry MOLTRES
	opentext
	writetext MoltresLairMoltresText
	closetext
	loadwildmon MOLTRES, 15
	startbattle
	reloadmapafterbattle
	disappear MOLTRESLAIR_MOLTRES
	end

MoltresLair_Solrock:
	cry SOLROCK
	loadwildmon SOLROCK, 7
	startbattle
	reloadmapafterbattle
	disappear MOLTRESLAIR_SOLROCK
	end

MoltresLair_Charizard:
	cry CHARIZARD
	loadwildmon CHARIZARD, 10
	startbattle
	reloadmapafterbattle
	disappear MOLTRESLAIR_CHARIZARD
	end

MoltresLair_Tyranitar:
	cry TYRANITAR
	loadwildmon TYRANITAR, 13
	startbattle
	reloadmapafterbattle
	disappear MOLTRESLAIR_TYRANITAR
	end

MoltresLair_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 30,  33, MOUNT_MORTAR_2F_INSIDE, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 20,  0, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoltresLair_Moltres, -1
	object_event 34, 24, SPRITE_SOLROCK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoltresLair_Solrock, -1
	object_event  3,  4, SPRITE_CHARIZARD, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoltresLair_Charizard, -1
	object_event 21, 15, SPRITE_TYRANITAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MoltresLair_Tyranitar, -1
	