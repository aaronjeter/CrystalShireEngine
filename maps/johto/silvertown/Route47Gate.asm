	object_const_def
	const ROUTE47GATE_OFFICER

Route47Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route47GateBadgeCheckScript:
	readmem wJohtoBadges
	ifequal %11111111, .AllEight
	turnobject ROUTE47GATE_OFFICER, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext Route47GateOfficerText
	promptbutton
	writetext Route47GateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, Route47GateStepDownMovement
.AllEight:
	end

Route47GateOfficerScript:
	faceplayer
	opentext
	writetext Route47GateOfficerText
	promptbutton
	readmem wJohtoBadges
	ifequal %11111111, .AllEight
	writetext Route47GateNotEnoughBadgesText
	waitbutton
	closetext
	end

.AllEight:
	writetext Route47GateEightBadgesText
	waitbutton
	closetext
	end

Route47GateStepDownMovement:
	step DOWN
	step_end

Route47GateOfficerText:
	text "The pass ahead"
	line "leads to Silver"
	cont "Town and the"
	cont "Johto League."

	para "Only trainers with"
	line "all eight Johto"
	cont "Badges may pass."
	done

Route47GateNotEnoughBadgesText:
	text "You don't have all"
	line "eight yet. Come"
	cont "back when you do."
	done

Route47GateEightBadgesText:
	text "All eight Johto"
	line "Badges! Go right"
	cont "on through."
	done

Route47Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_47, 1
	warp_event  5,  0, ROUTE_47, 2
	warp_event  4,  7, LAKE_OF_RAGE, 3
	warp_event  5,  7, LAKE_OF_RAGE, 3

	def_coord_events
	coord_event  4,  4, -1, Route47GateBadgeCheckScript
	coord_event  5,  4, -1, Route47GateBadgeCheckScript

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route47GateOfficerScript, -1
