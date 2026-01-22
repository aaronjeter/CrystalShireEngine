	object_const_def

SafariZoneNorth_MapScripts:
	def_scene_scripts

	def_callbacks	



SafariZoneNorth_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  32, 55, SAFARI_ZONE_SOUTH, 5
	warp_event  33, 55, SAFARI_ZONE_SOUTH, 6

	warp_event  55, 52, SAFARI_ZONE_EAST, 3
	warp_event  55, 53, SAFARI_ZONE_EAST, 4

	warp_event  10, 55, SAFARI_ZONE_WEST, 3
	warp_event  11, 55, SAFARI_ZONE_WEST, 4

	warp_event  04, 55, SAFARI_ZONE_WEST, 5
	warp_event  05, 55, SAFARI_ZONE_WEST, 6

	warp_event  53, 07, SAFARI_HOUSE_NORTH, 1

	def_coord_events

	def_bg_events	

	def_object_events
