	object_const_def

SafariZoneSouth_MapScripts:
	def_scene_scripts

	def_callbacks	



SafariZoneSouth_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  18, 33, FUCHSIA_CITY, 7
	warp_event  19, 33, FUCHSIA_CITY, 7

	warp_event  35, 14, SAFARI_ZONE_EAST, 1
	warp_event  35, 15, SAFARI_ZONE_EAST, 2

	warp_event  20, 04, SAFARI_ZONE_NORTH, 1
	warp_event  21, 04, SAFARI_ZONE_NORTH, 2 

	warp_event  04, 14, SAFARI_ZONE_WEST, 1
	warp_event  04, 15, SAFARI_ZONE_WEST, 2 

	warp_event  25, 27, SAFARI_HOUSE_SOUTH, 1

	def_coord_events

	def_bg_events	

	def_object_events
