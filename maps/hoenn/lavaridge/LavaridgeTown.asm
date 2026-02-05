	object_const_def

LavaridgeTown_MapScripts:
	def_scene_scripts

	def_callbacks	

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
	line "#MON Gym"
	cont "Leader: Flannery"

	para "One with"
	line "fiery passion"
	cont "that burns."
	done

LavaridgeTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 11,  7, LAVARIDGE_POKECENTER, 2
	warp_event 17,  7, LAVARIDGE_MART, 2
	warp_event  8,  13, LAVARIDGE_GYM, 2

	def_coord_events

	def_bg_events	
	bg_event  13, 09, BGEVENT_READ, LavaridgeTownSign
	bg_event  07, 15, BGEVENT_READ, LavaridgeGymSign

	def_object_events
	