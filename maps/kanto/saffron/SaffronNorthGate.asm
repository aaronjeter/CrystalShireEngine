	object_const_def
	const SAFFRONNORTHGATE_OFFICER

SaffronNorthGate_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronNorthGateOfficerScript:
	jumptextfaceplayer SaffronNorthGateOfficerText

SaffronNorthGateOfficerText:
	text "How do you like"
	line "Kanto? It's nice,"
	cont "don't you agree?"
	done

SaffronNorthGateOfficerBlocksText:
	text "I'm sorry, but"
	line "Saffron City is"
	cont "currently on"
	cont "lockdown."

	para "I wish I knew what"
	line "happened..."

	para "Probably some non-"
	line "sense from Silph"
	cont "Co."
	done

SaffronNorthGateBlockScript:
	checkevent EVENT_SAFFRON_CITY_OPEN
	iftrue .done

	showemote EMOTE_SHOCK, SAFFRONNORTHGATE_OFFICER, 10

	opentext
	writetext SaffronNorthGateOfficerBlocksText
	waitbutton
	closetext

	turnobject PLAYER, UP
	applymovement PLAYER, SaffronNorthGate_StepUpMovement
	
	.done 
	end

SaffronNorthGate_StepUpMovement:
	step UP
	step UP
	step_end

SaffronNorthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_5, 2
	warp_event  5,  0, ROUTE_5, 3
	warp_event  4,  7, SAFFRON_CITY, 9
	warp_event  5,  7, SAFFRON_CITY, 9

	def_coord_events
	coord_event  02, 04, -1, SaffronNorthGateBlockScript
	coord_event  03, 04, -1, SaffronNorthGateBlockScript
	coord_event  04, 04, -1, SaffronNorthGateBlockScript
	coord_event  05, 04, -1, SaffronNorthGateBlockScript
	coord_event  06, 04, -1, SaffronNorthGateBlockScript
	coord_event  07, 04, -1, SaffronNorthGateBlockScript


	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronNorthGateOfficerScript, -1
