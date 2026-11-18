ShoalCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

ShoalCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 23, ROUTE_125, 1
	warp_event 25,  5, SHOAL_CAVE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
