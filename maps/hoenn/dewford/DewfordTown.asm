	object_const_def
	const DEWFORDTOWN_GYM_GUARD

DewfordTown_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, DewfordTownFlypointCallback

DewfordTownFlypointCallback:
	setflag ENGINE_FLYPOINT_DEWFORD
	endcallback

DewfordGymGuardScript:
	faceplayer
	opentext
	writetext DewfordGymGuardText
	waitbutton
	closetext
	end

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

DewfordGymGuardText:
	text "Hey kid,"
	line "Gym's closed."

	para "Brawly, the"
	line "Gym Leader"

	para "is off training"
	line "in the Granite"

	para "Caves north"
	line "of town."

	para "You could go"
	line "find him, I"
	cont "guess..."
	done

DewfordTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  14, 33, DEWFORD_GYM, 1
	warp_event  07, 31, DEWFORD_POKECENTER, 2
	warp_event  05, 13, GRANITE_CAVE_B1F, 1
	warp_event  17, 23, DEWFORD_BRINEY_HOUSE, 2

	def_coord_events

	def_bg_events	
	bg_event  09, 35, BGEVENT_READ, DewfordTownSign
	bg_event  19, 33, BGEVENT_READ, DewfordGymSign

	def_object_events
	object_event  14,  34, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DewfordGymGuardScript, EVENT_GOT_PICKAXE
