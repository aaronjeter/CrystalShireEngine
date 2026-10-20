	object_const_def
	const MOLTRESLAIR_MOLTRES
	const MOLTRESLAIR_SOLROCK
	const MOLTRESLAIR_CHARIZARD
	const MOLTRESLAIR_TYRANITAR

MoltresLair_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, MoltresLairMonSpritesCallback

MoltresLairMonSpritesCallback:
	setmonsprite SPRITE_MON_1, MOLTRES
	setmonsprite SPRITE_MON_2, SOLROCK
	setmonsprite SPRITE_MON_3, CHARIZARD
	setmonsprite SPRITE_MON_4, TYRANITAR
	endcallback

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
	object_event 20,  0, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltresLair_Moltres, -1
	object_event 34, 24, SPRITE_MON_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltresLair_Solrock, -1
	object_event  3,  4, SPRITE_MON_3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltresLair_Charizard, -1
	object_event 21, 15, SPRITE_MON_4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltresLair_Tyranitar, -1
	