	object_const_def
	const GRANITECAVEB1F_SABLEYE

GraniteCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks	

GraniteCaveB1F_Sableye:
	cry SABLEYE
	loadwildmon SABLEYE, 9
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB1F_SABLEYE
	end

GraniteCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  35, 13, DEWFORD_TOWN, 3
	warp_event  07, 15, GRANITE_CAVE_B2F, 1
	warp_event  07,  1, GRANITE_CAVE_B2F, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  08, 04, SPRITE_SABLEYE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, GraniteCaveB1F_Sableye, -1