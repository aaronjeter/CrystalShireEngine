SilverTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SilverTownFlypointCallback

SilverTownFlypointCallback:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	endcallback

SilverTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20, 13, SILVER_LEAGUE_LOBBY, 1
	warp_event  7, 13, SILVER_TOWN_HOUSE, 1
	warp_event 35, 13, SILVER_TOWN_HOUSE_2, 1
	warp_event 21, 13, SILVER_LEAGUE_LOBBY, 2

	def_coord_events

	def_bg_events

	def_object_events
