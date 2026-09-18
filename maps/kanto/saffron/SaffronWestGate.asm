	object_const_def
	const SAFFRONWESTGATE_OFFICER

SaffronWestGate_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronWestGateGuardScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedPart
	writetext SaffronWestGateGuardPowerPlantText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext SaffronWestGateGuardSeriousText
	waitbutton
	closetext
	end

SaffronWestGateGuardPowerPlantText:
	text "Did you hear about"
	line "the accident at"
	cont "the Power Plant?"

	para "It's located in"
	line "the East, close to"
	cont "Lavender Town."
	done

SaffronWestGateGuardSeriousText:
	text "I take my Guard"
	line "job seriously."

	para "Hey! You have a"
	line "#dex."

	para "OK. You can go"
	line "through."
	done

SaffronWestGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_7, 1
	warp_event  0,  5, ROUTE_7, 2
	warp_event  9,  4, SAFFRON_CITY, 10
	warp_event  9,  5, SAFFRON_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronWestGateGuardScript, -1
