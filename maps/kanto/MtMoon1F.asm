	object_const_def

MtMoon1F_MapScripts:
	def_scene_scripts

	def_callbacks


MtMoon1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  15, 33, ROUTE_3, 1
	warp_event  09, 33, MOUNT_MOON_SQUARE, 1
	warp_event  19, 21, MT_MOON_B1F, 1
	warp_event  07, 07, MT_MOON_B1F, 3

	def_coord_events

	def_bg_events	

	def_object_events