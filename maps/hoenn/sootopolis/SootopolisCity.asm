	object_const_def
	const SOOTOPOLISCITY_CAVE_GUARD
	const SOOTOPOLISCITY_CAVE_GUARD_2

SootopolisCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, SootopolisCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, SootopolisCityCaveGuardCallback

SootopolisCityFlypointCallback:
	setflag ENGINE_FLYPOINT_SOOTOPOLIS
	endcallback

SootopolisCityCaveGuardCallback:
	checkflag ENGINE_RAINBADGE
	iffalse .Done
	moveobject SOOTOPOLISCITY_CAVE_GUARD, 34, 18
.Done:
	endcallback

SootopolisCaveGuardScript:
	checkflag ENGINE_RAINBADGE
	iftrue .Open
	jumptextfaceplayer SootopolisCaveGuardClosedText

.Open:
	jumptextfaceplayer SootopolisCaveGuardOpenText

SootopolisCaveGuard2Script:
	jumptextfaceplayer SootopolisCaveGuard2Text

SootopolisCaveGuardClosedText:
	text "This is the Cave"
	line "of Origin."

	para "Only a trainer"
	line "who holds the"
	cont "Rain Badge may"
	cont "enter."
	done

SootopolisCaveGuardOpenText:
	text "You hold the Rain"
	line "Badge."

	para "The Cave of Origin"
	line "is open to you."
	done

SootopolisCaveGuard2Text:
	text "The #mon that"
	line "made the seas is"

	para "said to sleep deep"
	line "inside the cave."
	done

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
	line "#mon Gym"

	para "Leader: Wallace"
	done

SootopolisCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 45, 21, SOOTOPOLIS_POKECENTER, 2
	warp_event 13, 21, SOOTOPOLIS_MART, 2
	warp_event 30, 29, SOOTOPOLIS_GYM, 2
	warp_event 07, 19, SOOTOPOLIS_FISHER_HOUSE, 2
	warp_event 33, 17, CAVE_OF_ORIGIN, 1

	def_coord_events

	def_bg_events	
	bg_event  50, 20, BGEVENT_READ, SootopolisSign
	bg_event 31, 29, BGEVENT_READ, SootopolisGymSign

	def_object_events
	object_event 33, 18, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SootopolisCaveGuardScript, -1
	object_event 32, 18, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SootopolisCaveGuard2Script, -1
	