	object_const_def

DewfordTown_MapScripts:
	def_scene_scripts

	def_callbacks	

DewfordTownSign:
	jumptext DewfordTownSignText

DewfordTownSignText:
	text "Dewford Town"

	para "A tiny island"
	line "in the blue sea."
	done

DewfordGymSign:
	jumptext DewfordGymSignText

DewfordGymSignText:
	text "Dewford Town"
	line "#MON Gym"
	cont "Leader: Brawly"

	para "A big wave"
	line "in Fighting."
	done

DewfordTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  14, 33, DEWFORD_GYM, 1
	warp_event  07, 31, DEWFORD_POKECENTER, 2
	warp_event  05, 13, GRANITE_CAVE_B1F, 1

	def_coord_events

	def_bg_events	
	bg_event  09, 35, BGEVENT_READ, DewfordTownSign
	bg_event  19, 33, BGEVENT_READ, DewfordGymSign

	def_object_events
	