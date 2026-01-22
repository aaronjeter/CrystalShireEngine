	object_const_def

SafariZoneEast_MapScripts:
	def_scene_scripts

	def_callbacks	



SafariZoneEast_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  04, 34, SAFARI_ZONE_SOUTH, 3
	warp_event  04, 35, SAFARI_ZONE_SOUTH, 4

	warp_event  04, 06, SAFARI_ZONE_NORTH, 3
	warp_event  04, 07, SAFARI_ZONE_NORTH, 4

	warp_event  31, 11, SAFARI_HOUSE_EAST, 1

	def_coord_events

	def_bg_events	

	def_object_events
