	object_const_def

VerdanturfTown_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, VerdanturfTownFlypointCallback

VerdanturfTownFlypointCallback:
	setflag ENGINE_FLYPOINT_VERDANTURF
	endcallback

VerdanturfTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  9,  3, RUSTURF_TUNNEL, 2
	warp_event 17,  5, VERDANTURF_POKECENTER, 2
	warp_event 13,  5, VERDANTURF_MART, 2
	warp_event 15, 15, VERDANTURF_ROCKSMASH_HOUSE, 2

	def_coord_events

	def_bg_events	

	def_object_events
	