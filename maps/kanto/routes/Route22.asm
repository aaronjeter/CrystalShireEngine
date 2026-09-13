object_const_def	
	const ROUTE22_GREEN
	const ROUTE22_GUARD

Route22_MapScripts:
	def_scene_scripts

	def_callbacks

Route22_Green:
	faceplayer
	checkevent EVENT_START_KANTO
	iffalse .notKanto
	opentext
	writetext Route22GreenIntroText
	waitbutton
	closetext

	winlosstext Route22GreenLossText, Route22GreenWinText
	loadtrainer GREEN, GREEN1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	opentext
	writetext Route22GreenAfterBattleText
	waitbutton
	sjump .GreenExit
	end

.notKanto
	opentext
	writetext Route22GreenNotKantoText
	waitbutton 

.GreenExit
	closetext
	setevent EVENT_FOUND_ROUTE22_GREEN
	special FadeOutToBlack
	disappear ROUTE22_GREEN
	special FadeInFromBlack
	end

Route22GreenAfterBattleText:
	text "Ah well, I'm gonna"
	line "head back and see"
	cont "Oak. Later scrub!"
	done

Route22GreenLossText:
	text "Ugh, lucky!"
	done

Route22GreenWinText:
	text "Ha! Suck it,"
	line "loser!"
	done

Route22GreenIntroText:
	text "Uhh...do I..."
	line "like, know you?"

	para "Oh, you're Oak's"
	line "new charity case."

	para "Yeah, I don't"
	line "have time to"
	cont "babysit today..."

	para "Since you're"
	line "here though..."

	para "How about a"
	line "#mon battle?"
	done

Route22GreenNotKantoText:
	text "Huh? Do I know"
	line "you?"

	para "Sorry, I don't"
	line "have time for"
	cont "scrubs."
	done

Route22_Guard:
	jumptextfaceplayer Route22_GuardText

Route22_GuardText:
	text "Huh? You're not"
	line "even close to"
	cont "good enough to"
	cont "go past here."

	para "Maybe come back"
	line "once you beat the"
	cont "Gym in Viridian."
	done

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#mon League"

	para "Victory Road"
	line "Entrance"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	def_object_events
	object_event 27, 04, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route22_Green, EVENT_FOUND_ROUTE22_GREEN
	object_event 14, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22_Guard, EVENT_BEAT_BLUE
