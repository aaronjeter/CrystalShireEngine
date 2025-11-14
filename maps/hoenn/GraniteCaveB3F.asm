	object_const_def
	const GRANITECAVEB3F_TENTACOOL1
	const GRANITECAVEB3F_TENTACOOL2
	const GRANITECAVEB3F_TENTACOOL3

GraniteCaveB3F_MapScripts:
	def_scene_scripts

	def_callbacks	

GraniteCaveB2F_Tentacool1:
	cry TENTACOOL2
	loadwildmon TENTACOOL2, 7
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB3F_TENTACOOL1
	end

GraniteCaveB2F_Tentacool2:
	cry TENTACOOL2
	loadwildmon TENTACOOL2, 5
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB3F_TENTACOOL2
	end

GraniteCaveB2F_Tentacool3:
	cry TENTACOOL2
	loadwildmon TENTACOOL2, 10
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB3F_TENTACOOL3
	end

GraniteCaveB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  11, 05, GRANITE_CAVE_B2F, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  09, 13, SPRITE_TENTACOOL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Tentacool1, -1
	object_event  11, 13, SPRITE_TENTACOOL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Tentacool2, -1
	object_event  10, 12, SPRITE_TENTACOOL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLACK, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Tentacool3, -1

