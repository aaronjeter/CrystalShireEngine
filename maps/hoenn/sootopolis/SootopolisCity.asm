	object_const_def

SootopolisCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, SootopolisCityFlypointCallback

SootopolisCityFlypointCallback:
	setflag ENGINE_FLYPOINT_SOOTOPOLIS
	endcallback

SootopolisSign:
	jumptext SootopolisSignText

SootopolisSignText:
	text "Sootopolis City"

	para "The mystical city"
	line "where history"
	cont "slumbers."
	done

SootopolisGymSign:
	jumptext SootopolisGymSignText

SootopolisGymSignText:
	text "Sootopolis City"
	line "#MON Gym"

	para "Leader: Wallace"
	done

SootopolisCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 45, 21, SOOTOPOLIS_POKECENTER, 2
	warp_event 13, 21, SOOTOPOLIS_MART, 2
	warp_event 30, 33, SOOTOPOLIS_GYM, 2

	def_coord_events

	def_bg_events	
	bg_event  50, 20, BGEVENT_READ, SootopolisSign
	bg_event 29, 35, BGEVENT_READ, SootopolisGymSign

	def_object_events
	