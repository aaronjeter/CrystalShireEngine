	object_const_def

PetalburgCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, PetalburgCityFlypointCallback

PetalburgCityFlypointCallback:
	setflag ENGINE_FLYPOINT_PETALBURG
	endcallback

PetalburgCitySign:
	jumptext PetalburgCitySignText

PetalburgCitySignText:
	text "Petalburg City"

	para "Where people "
	line "mingle with"
	cont "nature."
	done

PetalburgGymSign:
	jumptext PetalburgGymSignText

PetalburgGymSignText:
	text "Petalburg City"
	line "#MON Gym"
	cont "Leader: Norman"

	para "The Ordinary"
	line "Master"
	done

PetalburgCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  14,  9, PETALBURG_GYM,  1
	warp_event  19, 17, PETALBURG_POKECENTER,  2
	warp_event  25, 13, PETALBURG_MART,  2
	warp_event  9, 17, PETALBURG_HOUSE1,  2
	warp_event  19, 23, PETALBURG_HOUSE2,  2

	def_coord_events

	def_bg_events	
	bg_event  15, 17, BGEVENT_READ, PetalburgCitySign
	bg_event  13, 11, BGEVENT_READ, PetalburgGymSign

	def_object_events
	