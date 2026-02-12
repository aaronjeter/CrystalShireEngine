	object_const_def

MauvilleCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, MauvilleCityFlypointCallback

MauvilleCityFlypointCallback:
	setflag ENGINE_FLYPOINT_MAUVILLE
	endcallback

MauvilleCitySign:
	jumptext MauvilleCitySignText

MauvilleCitySignText:
	text "Mauville City"

	para "The bright and"
	line "shiny city of"
	cont "fun!"
	done

MauvilleGymSign:
	jumptext MauvilleGymSignText

MauvilleGymSignText:
	text "Mauville City"
	line "#MON Gym"
	cont "Leader: Wattson"

	para "The cheerfully"
	line "electrifying man!"
	done

MauvilleGameCornerSign:
	jumptext MauvilleGameCornerSignText

MauvilleGameCornerSignText:
	text "Mauville"
	line "Game Corner"
	done

MauvilleCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  6, 5, MAUVILLE_GYM, 1
	warp_event 23, 5, MAUVILLE_POKECENTER, 2
	warp_event 23, 13, MAUVILLE_MART, 2

	def_coord_events

	def_bg_events	
	bg_event  21, 07, BGEVENT_READ, MauvilleCitySign
	bg_event  05, 07, BGEVENT_READ, MauvilleGymSign
	bg_event  03, 15, BGEVENT_READ, MauvilleGameCornerSign

	def_object_events
	