ShoalCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

ShoalCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  5, SHOAL_CAVE_1F, 2
	warp_event  5, 23, SHOAL_CAVE_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
