	object_const_def
	const ROUTE10NORTH_GREEN

Route10North_MapScripts:
	def_scene_scripts

	def_callbacks

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd PokecenterSignScript

PowerPlantSignText:
	text "Kanto Power Plant"
	done

Route10_Green:
	faceplayer
	checkevent EVENT_START_KANTO
	iffalse .notKanto
	opentext
	writetext Route10GreenIntroText
	waitbutton
	closetext

	winlosstext Route10GreenLossText, Route10GreenWinText
	loadtrainer GREEN, GREEN3
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	opentext
	writetext Route10GreenAfterBattleText
	waitbutton
	sjump .GreenExit
	end

.notKanto
	opentext
	writetext Route10GreenNotKantoText
	waitbutton 

.GreenExit
	closetext

	applymovement ROUTE10NORTH_GREEN, Route10North_GreenWalkAwayMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE10NORTH_GREEN
	setevent EVENT_FOUND_ROUTE10_GREEN
	end

Route10GreenAfterBattleText:
	text "Ah well, I'm gonna"
	line "head on."

	para "I need to stop by"
	line "Lavender Town,"
	cont "through Rock"
	cont "Tunnel..."

	para "If you're planning"
	line "to follow, you'll"
	cont "probably want a"
	cont "light source."

	para "I borrowed a"
	line "Lantern from the"
	cont "Power Plant."

	para "It's just South of"
	line "here. Sounded like"
	cont "they need some"
	cont "help, actually..."
	done

Route10GreenLossText:
	text "Ugh, lucky!"
	done

Route10GreenWinText:
	text "Ha! Suck it,"
	line "loser!"
	done

Route10GreenIntroText:
	text "Oh, goodie..."
	line "You're still"
	cont "around."

	para "Well, I hope"
	line "you've been making"
	cont "yourself useful."

	para "I've got some"
	line "errands on the"
	cont "other side of"
	cont "this tunnel..."

	para "Since you're"
	line "here though..."

	para "Let's see if"
	line "you've learned"
	cont "anything!"
	done

Route10GreenNotKantoText:
	text "Huh? Do I know"
	line "you?"

	para "Sorry, I don't"
	line "have time for"
	cont "scrubs."
	done

Route10NorthGreenEventScript1:
	checkevent EVENT_FOUND_ROUTE10_GREEN
	iftrue .done
	applymovement PLAYER, Route10North_PlayerWalkOverMovement1
	sjump Route10_Green
.done
	end

Route10NorthGreenEventScript2:
	checkevent EVENT_FOUND_ROUTE10_GREEN
	iftrue .done
	applymovement PLAYER, Route10North_PlayerWalkOverMovement2
	turnobject PLAYER, UP
	sjump Route10_Green
.done
	end

Route10North_PlayerWalkOverMovement1:
	step LEFT
	step LEFT
	step_end

Route10North_PlayerWalkOverMovement2:
	step LEFT
	step LEFT
	step LEFT
	step_end

Route10North_GreenWalkAwayMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step_end

Route10North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  1, ROUTE_10_POKECENTER_1F, 1
	warp_event  3,  9, POWER_PLANT, 1

	def_coord_events
	coord_event  13, 02, -1, Route10NorthGreenEventScript1
	coord_event  13, 03, -1, Route10NorthGreenEventScript2

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, PowerPlantSign
	bg_event 12,  1, BGEVENT_READ, Route10PokecenterSign

	def_object_events
	object_event 10, 02, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10_Green, EVENT_FOUND_ROUTE10_GREEN
