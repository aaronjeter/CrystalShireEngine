	object_const_def
	const SAFFRONEASTGATE_OFFICER
	const SAFFRONEASTGATE_GREEN

SaffronEastGate_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronEastGateOfficerScript:
	jumptextfaceplayer SaffronEastGateOfficerText

SaffronEastGateOfficerText:
	text "Have you been to"
	line "Lavender Town?"

	para "There's a tall"
	line "Radio Tower there."
	done


SaffronEastGateGreenScript:
	opentext

	turnobject PLAYER, UP	
	showemote EMOTE_SHOCK, SAFFRONEASTGATE_OFFICER, 10
	writetext SaffronEastGateOfficerBlocksText
	waitbutton

	showemote EMOTE_SHOCK, SAFFRONEASTGATE_GREEN, 15
	writetext SaffronEastGateGreenOfficerText
	waitbutton

	turnobject SAFFRONEASTGATE_GREEN, DOWN

	checkevent EVENT_START_KANTO
	iffalse .notKanto

	writetext SaffronEastGateGreenKantoText
	waitbutton
	sjump .greenAskforHelp

.notKanto
	writetext SaffronEastGateGreenNotKantoText
	waitbutton

.greenAskforHelp
	writetext SaffronEastGateGreenText
	waitbutton	
	closetext

	applymovement SAFFRONEASTGATE_GREEN, SaffronEastGate_GreenWalkAwayMovement
	playsound SFX_ENTER_DOOR
	disappear SAFFRONEASTGATE_GREEN
	setevent EVENT_SAFFRON_CITY_OPEN
	setevent EVENT_SAFFRON_CITY_UNSAFE
	
.done	
	end

SaffronEastGateGreenEventScript1:
	checkevent EVENT_SAFFRON_CITY_OPEN
	iftrue .done
	applymovement PLAYER, SaffronEastGate_PlayerWalkOverMovement1
	sjump SaffronEastGateGreenScript
.done
	end

SaffronEastGateGreenEventScript2:
	checkevent EVENT_SAFFRON_CITY_OPEN
	iftrue .done
	applymovement PLAYER, SaffronEastGate_PlayerWalkOverMovement2
	sjump SaffronEastGateGreenScript
.done
	end

SaffronEastGate_GreenWalkAwayMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

SaffronEastGate_PlayerWalkOverMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

SaffronEastGate_PlayerWalkOverMovement2:
	step LEFT
	step LEFT
	step LEFT
	step_end

SaffronEastGateGreenOfficerText:
	text "Wait! They're with"
	line "me. I might need"
	cont "their help..."
	done

SaffronEastGateGreenKantoText:
	text "Well, I hope"
	line "you're ready,"
	cont "<PLAY_G>..."
	done

SaffronEastGateGreenNotKantoText:
	text "Well, I hope"
	line "you can help"
	cont "me..."
	done

SaffronEastGateGreenText:
	text "Things look bad"
	line "in Saffron. It"
	cont "sounds like a"
	cont "disaster!"

	para "Something those"
	line "mad scientists"
	cont "as Silph Co"
	cont "cooked up, I bet."

	para "Whatever it is, I"
	line "need to help stop"
	cont "it..."

	para "And I can't be in"
	line "two places at one"
	cont "time."

	para "So, I guess you're"
	line "up!"

	para "I'm supposed to be"
	line "investigating"
	cont "rumors of Team"
	cont "Rocket activity in"
	cont "the Safari Zone."

	para "Can you check in"
	line "on it for me?"

	para "It's probably"
	line "nothing..."

	para "The Safari Zone"
	line "is in Fuscia City."

	para "It's down by the"
	line "Southern coast of"
	cont "Kanto."

	para "..."
	line "..."

	para "Alright, well..."
	line "Good luck!"
	done

SaffronEastGateOfficerBlocksText:
	text "I'm sorry, but"
	line "you can't come"
	cont "any further!"
	done


SaffronEastGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, SAFFRON_CITY, 14
	warp_event  0,  5, SAFFRON_CITY, 15
	warp_event  9,  4, ROUTE_8, 1
	warp_event  9,  5, ROUTE_8, 2

	def_coord_events
	coord_event  08, 04, -1, SaffronEastGateGreenEventScript1
	coord_event  08, 05, -1, SaffronEastGateGreenEventScript2

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronEastGateOfficerScript, -1
	object_event  5,  4, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronEastGateGreenScript, EVENT_SAFFRON_CITY_OPEN
