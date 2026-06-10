	object_const_def

LavaridgeTown_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, LavaridgeTownFlypointCallback

LavaridgeTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LAVARIDGE
	endcallback

LavaridgeTownSign:
	jumptext LavaridgeTownSignText

LavaridgeTownSignText:
	text "Lavaridge Town"

	para "An excellent"
	line "place for"
	cont "relaxing."
	done

LavaridgeGymSign:
	jumptext LavaridgeGymSignText

LavaridgeGymSignText:
	text "Lavaridge Town"
	line "#mon Gym"
	cont "Leader: Flannery"

	para "One with"
	line "fiery passion"
	cont "that burns."
	done

LavaridgeGrannyScript:
	jumptextfaceplayer LavaridgeGrannyText

LavaridgeGrannyText:
	text "This hot spring"
	line "feels great on"
	cont "my old joints."
	done

LavaridgeTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 11,  7, LAVARIDGE_POKECENTER, 2
	warp_event 17,  7, LAVARIDGE_MART, 2
	warp_event  6, 13, LAVARIDGE_GYM, 2

	def_coord_events

	def_bg_events	
	bg_event 13, 11, BGEVENT_READ, LavaridgeTownSign
	bg_event  5, 15, BGEVENT_READ, LavaridgeGymSign

	def_object_events
	object_event 07, 07, SPRITE_GRANNY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavaridgeGrannyScript, -1
	