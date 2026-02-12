	object_const_def

LilycoveCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, LilycoveCityFlypointCallback

LilycoveCityFlypointCallback:
	setflag ENGINE_FLYPOINT_LILYCOVE
	endcallback

LilycoveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 23, 15, LILYCOVE_POKECENTER, 2

	def_coord_events

	def_bg_events	

	def_object_events
	