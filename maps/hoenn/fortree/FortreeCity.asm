	object_const_def

FortreeCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, FortreeCityFlypointCallback

FortreeCityFlypointCallback:
	setflag ENGINE_FLYPOINT_FORTREE
	endcallback

FortreeCitySign:
	jumptext FortreeCitySignText

FortreeCitySignText:
	text "Fortree City"

	para "The treetop"
	line "city that"

	para "frolics with"
	line "nature."
	done

FortreeGymSign:
	jumptext FortreeGymSignText

FortreeGymSignText:
	text "Fortree City"
	line "#MON Gym"
	cont "Leader: Winona"

	para "Taking flight"
	line "into the world."
	done

FortreeCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  05, 07, FORTREE_POKECENTER, 2
	warp_event  03, 17, FORTREE_MART, 2
	warp_event  22, 11, FORTREE_GYM, 1
	warp_event  31, 15, FORTREE_TRADE_HOUSE, 2

	def_coord_events

	def_bg_events	
	bg_event  05, 11, BGEVENT_READ, FortreeCitySign
	bg_event  27, 11, BGEVENT_READ, FortreeGymSign

	def_object_events
	