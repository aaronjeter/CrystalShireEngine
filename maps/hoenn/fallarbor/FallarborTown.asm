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

FallarborTownGrannyScript:
	jumptextfaceplayer FallarborTownGrannyText

FallarborTownGrannyText:
	text "Prof. Cozmo lives"
	line "in the big house."

	para "He's always"
	line "staring up at the"
	cont "night sky."
	done

FallarborTownLassScript:
	jumptextfaceplayer FallarborTownLassText

FallarborTownLassText:
	text "The boy next door"
	line "to the Move"
	cont "Reminder is crazy"
	cont "about fossils."
	done

FallarborTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 13,  09, FALLARBOR_POKECENTER, 2
	warp_event 15,  17, FALLARBOR_MART, 2
	warp_event  5, 15, FALLARBOR_REMINDER_HOUSE, 2
	warp_event  5,  9, FALLARBOR_COZMOS_HOUSE, 1
	warp_event  9, 15, FALLARBOR_FOSSIL_HOUSE, 1

	def_coord_events

	def_bg_events	
	bg_event 10,  8, BGEVENT_READ, FallarborTownSign
	bg_event  3, 15, BGEVENT_READ, FallarborMoveReminderSign

	def_object_events
	object_event 07, 13, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LavaridgeTwinScript, -1
	object_event  8, 11, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FallarborTownGrannyScript, -1
	object_event 11, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FallarborTownLassScript, -1
