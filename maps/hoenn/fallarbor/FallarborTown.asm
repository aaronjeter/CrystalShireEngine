	object_const_def

FallarborTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FallarborTownFlypointCallback

FallarborTownFlypointCallback:
	setflag ENGINE_FLYPOINT_FALLARBOR
	endcallback

FallarborTownSign:
	jumptext FallarborTownSignText

FallarborTownSignText:
	text "Fallarbor Town"

	para "A community"
	line "with small"
	cont "gardens."
	done

FallarborMoveReminderSign:
	jumptext FallarborMoveReminderSignText

FallarborMoveReminderSignText:
	text "Move Reminder's"
	line "House."
	done

LavaridgeTwinScript:
	jumptextfaceplayer LavaridgeTwinText

LavaridgeTwinText:
	text "Hi there!"
	line "Are you here"
	cont "to see the falls?"
	done

LavaridgeGuruScript:
	jumptextfaceplayer LavaridgeGuruText

LavaridgeGuruText:
	text "My #mon"
	line "forgot some of"
	cont "their best moves."

	para "The Move Relearner"
	line "should be able"
	cont "to fix that."

	para "For a price..."
	done

FallarborTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 13,  09, FALLARBOR_POKECENTER, 2
	warp_event 15,  17, FALLARBOR_MART, 2
	warp_event 03,  15, FALLARBOR_REMINDER_HOUSE, 2

	def_coord_events

	def_bg_events	
	bg_event  10, 10, BGEVENT_READ, FallarborTownSign
	bg_event  04, 16, BGEVENT_READ, FallarborMoveReminderSign

	def_object_events
	object_event 07, 13, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LavaridgeTwinScript, -1
	object_event 04, 10, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, LavaridgeGuruScript, -1
	