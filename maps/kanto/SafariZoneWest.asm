	object_const_def

SafariZoneWest_MapScripts:
	def_scene_scripts

	def_callbacks	



SafariZoneWest_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  35, 34, SAFARI_ZONE_SOUTH, 7
	warp_event  35, 35, SAFARI_ZONE_SOUTH, 8

	warp_event  32, 04, SAFARI_ZONE_NORTH, 5
	warp_event  33, 04, SAFARI_ZONE_NORTH, 6

	warp_event  26, 04, SAFARI_ZONE_NORTH, 7
	warp_event  27, 04, SAFARI_ZONE_NORTH, 8

	warp_event  16, 17, SAFARI_HOUSE_WEST, 1
	warp_event  07, 05, SAFARI_HOUSE_SECRET, 1

	def_coord_events

	def_bg_events	

	def_object_events
