	object_const_def

OldaleTown_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, OldaleTownFlypointCallback

OldaleTownFlypointCallback:
	setflag ENGINE_FLYPOINT_OLDALE
	endcallback

OldaleTownSign:
	jumptext OldaleTownSignText

OldaleTownSignText:
	text "Oldale Town"

	para "Where things "
	line "start off scare."
	done

OldaleTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  5, 15, OLDALE_POKECENTER, 2
	warp_event 15,  5, OLDALE_MART, 2

	def_coord_events

	def_bg_events	
	bg_event  11, 09, BGEVENT_READ, OldaleTownSign

	def_object_events
	