	object_const_def
	const GRANITECAVEB2F_GASTLY
	const GRANITECAVEB2F_ARON
	const GRANITECAVEB2F_SHELLDER
	const GRANITECAVEB2F_SANDSHREW
	const GRANITECAVEB2F_ROCK

GraniteCaveB2F_MapScripts:
	def_scene_scripts

	def_callbacks	

GraniteCaveB2F_Gastly:
	cry GASTLY
	loadwildmon GASTLY, 5
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB2F_GASTLY
	end

GraniteCaveB2F_Aron:
	cry ARON
	loadwildmon ARON, 3
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB2F_ARON
	end

GraniteCaveB2F_Shellder:
	cry SHELLDER
	loadwildmon SHELLDER, 4
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB2F_SHELLDER
	end

GraniteCaveB2F_Sandshrew:
	cry SANDSHREW
	loadwildmon ASANDSHREW, 7
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB2F_SANDSHREW
	end

GraniteCaveB2FRock:
	jumpstd SmashRockScript

GraniteCaveB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  23, 43, GRANITE_CAVE_B1F, 2
	warp_event  23, 29, GRANITE_CAVE_B1F, 3

	warp_event  05, 55, GRANITE_CAVE_B3F, 1

	warp_event  25, 05, ROUTE_105, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  23, 50, SPRITE_GASTLY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Gastly, -1
	object_event  16, 44, SPRITE_ARON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_WHITE, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Aron, -1
	object_event  05, 28, SPRITE_SHELLDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Shellder, -1
	object_event  17, 13, SPRITE_SANDSHREW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Sandshrew, -1
	object_event  7, 46, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2FRock, -1
	