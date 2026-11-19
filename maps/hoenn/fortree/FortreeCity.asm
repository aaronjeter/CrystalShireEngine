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
	line "#mon Gym"
	cont "Leader: Winona"

	para "Taking flight"
	line "into the world."
	done

FortreeHikerScript:
	jumptextfaceplayer FortreeHikerText

FortreeHikerText:
	text "Whew! The trek"
	line "up here was"
	cont "exhausting."

	para "And I'm still"
	line "only halfway to"
	cont "Lilycove."
	done

FortreeCityBirdKidScript:
	jumptextfaceplayer FortreeCityBirdKidText

FortreeCityBirdKidText:
	text "I want to fly"
	line "like Winona!"

	para "Some day my bird"
	line "#mon will carry"
	cont "me over the trees."
	done

FortreeCityGrannyScript:
	jumptextfaceplayer FortreeCityGrannyText

FortreeCityGrannyText:
	text "We build our homes"
	line "in the trees so we"
	cont "can live with"
	cont "nature."

	para "Mind the rope"
	line "bridges, dear."
	done

FortreeCityLassScript:
	jumptextfaceplayer FortreeCityLassText

FortreeCityLassText:
	text "Winona's #mon"
	line "fly so gracefully."

	para "She doesn't use"
	line "only bird types,"
	cont "though. Be ready!"
	done

FortreeCityGirlScript:
	jumptextfaceplayer FortreeCityGirlText

FortreeCityGirlText:
	text "Have you seen a"
	line "Tropius?"

	para "Kids love the"
	line "fruit that grows"
	cont "around its neck!"
	done

FortreeCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  05, 07, FORTREE_POKECENTER, 2
	warp_event  03, 17, FORTREE_MART, 2
	warp_event  20, 11, FORTREE_GYM, 1
	warp_event  31, 15, FORTREE_TRADE_HOUSE, 2
	warp_event  15, 05, FORTREE_HIDDEN_POWER_HOUSE, 2
	warp_event  13, 15, FORTREE_HOUSE1, 2
	warp_event  29, 05, FORTREE_HOUSE2, 2


	def_coord_events

	def_bg_events	
	bg_event  3,  9, BGEVENT_READ, FortreeCitySign
	bg_event 21, 11, BGEVENT_READ, FortreeGymSign

	def_object_events
	object_event  7, 10, SPRITE_PHARMACIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FortreeHikerScript, -1
	object_event 24, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FortreeCityBirdKidScript, -1
	object_event  6,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FortreeCityGrannyScript, -1
	object_event 20, 13, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FortreeCityLassScript, -1
	object_event  9, 18, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FortreeCityGirlScript, -1
