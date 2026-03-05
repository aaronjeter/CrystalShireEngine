	object_const_def

MossdeepCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, MossdeepCityFlypointCallback

MossdeepCityFlypointCallback:
	setflag ENGINE_FLYPOINT_MOSSDEEP
	endcallback

MossdeepCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 31, 15, MOSSDEEP_POKECENTER, 2
	warp_event 39, 17, MOSSDEEP_MART, 2
	warp_event 40, 09, MOSSDEEP_GYM, 2

	def_coord_events

	def_bg_events	

	def_object_events
	