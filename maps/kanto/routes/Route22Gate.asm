	object_const_def
	const ROUTE22GATE_OFFICER

Route22Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route22GateBadgeCheckScript:
	readmem wKantoBadges
	ifequal %11111111, .AllEight
	turnobject ROUTE22GATE_OFFICER, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext Route22GateOfficerText
	promptbutton
	writetext Route22GateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, Route22GateStepDownMovement
.AllEight:
	end

Route22GateOfficerScript:
	faceplayer
	opentext
	writetext Route22GateOfficerText
	promptbutton
	readmem wKantoBadges
	ifequal %11111111, .AllEight
	writetext Route22GateNotEnoughBadgesText
	waitbutton
	closetext
	end

.AllEight:
	writetext Route22GateEightBadgesText
	waitbutton
	closetext
	end

Route22GateStepDownMovement:
	step DOWN
	step_end

Route22GateOfficerText:
	text "This road leads to"
	line "Victory Road and"
	cont "the Kanto League."

	para "Only trainers with"
	line "all eight Kanto"
	cont "Badges may pass."
	done

Route22GateNotEnoughBadgesText:
	text "You don't have all"
	line "eight yet. Come"
	cont "back when you do."
	done

Route22GateEightBadgesText:
	text "All eight Kanto"
	line "Badges! Go right"
	cont "on through."
	done

Route22Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_27, 4
	warp_event  5,  0, ROUTE_27, 5
	warp_event  4,  7, ROUTE_22, 1
	warp_event  5,  7, ROUTE_22, 1

	def_coord_events
	coord_event  4,  4, -1, Route22GateBadgeCheckScript
	coord_event  5,  4, -1, Route22GateBadgeCheckScript

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22GateOfficerScript, -1
