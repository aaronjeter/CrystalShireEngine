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

OldaleNerdScript:
	jumptextfaceplayer OldaleNerdText

OldaleNerdText:
	text "This town is"
	line "a dump..."

	para "One day I'm"
	line "gonna move to"
	cont "Rustboro!"
	done

OldaleTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  5, 15, OLDALE_POKECENTER, 2
	warp_event 13,  7, OLDALE_MART, 2
	warp_event 05, 07, OLDALE_HOUSE1, 2
	warp_event 13, 15, OLDALE_HOUSE2, 2

	def_coord_events

	def_bg_events	
	bg_event 10,  7, BGEVENT_READ, OldaleTownSign

	def_object_events
	object_event  07, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleNerdScript, -1
