	object_const_def
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2
	const PEWTERCITY_GREEN

PewterCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlypointCallback

PewterCityFlypointCallback:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	end

.GotSilverWing:
	writetext PewterCityGrampsText_GotSilverWing
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd PokecenterSignScript

PewterCityMartSign:
	jumpstd MartSignScript

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "Have you visited"
	line "Pewter Gym?"

	para "The Leader uses"
	line "rock-type #mon."
	done

PewterCityBugCatcherText:
	text "At night, Clefairy"
	line "come out to play"
	cont "at Mt.Moon."

	para "But not every"
	line "night."
	done

PewterCityGrampsText:
	text "That brings back"
	line "memories. When I"

	para "was young, I went"
	line "to Johto to train."

	para "You remind me so"
	line "much of what I was"

	para "like as a young"
	line "man."

	para "Here. I want you"
	line "to have this item"
	cont "I found in Johto."
	done

PewterCityGrampsText_GotSilverWing:
	text "Going to new, un-"
	line "known places and"
	cont "seeing new people…"

	para "Those are the joys"
	line "of travel."
	done

PewterCitySignText:
	text "Pewter City"
	line "A Stone Gray City"
	done

PewterGymSignText:
	text "Pewter City"
	line "#mon Gym"
	cont "Leader: Brock"

	para "The Rock Solid"
	line "#mon Trainer"
	done

PewterMuseumSignText:
	text "There's a notice"
	line "here…"

	para "Pewter Museum of"
	line "Science is closed"
	cont "for renovations…"
	done

PewterCityMtMoonGiftShopSignText:
	text "There's a notice"
	line "here…"

	para "Mt.Moon Gift Shop"
	line "now open!"
	done

PewterCityWelcomeSignText:
	text "Welcome to"
	line "Pewter City!"
	done


PewterCity_Green:
	showemote EMOTE_SHOCK, PEWTERCITY_GREEN, 10
	faceplayer
	checkevent EVENT_START_KANTO
	iffalse .notKanto

	checkflag ENGINE_BOULDERBADGE
	iffalse .notReady

	opentext
	writetext PewterCityGreenIntroText
	waitbutton
	closetext

	winlosstext PewterCityGreenLossText, PewterCityGreenWinText
	loadtrainer GREEN, GREEN2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	opentext
	writetext PewterCityGreenAfterBattleText
	waitbutton
	sjump .GreenExit
	end

.notReady
	writetext PewterCityNoBadgeText
	waitbutton

	turnobject PLAYER, LEFT
	applymovement PLAYER, PewterCityGreen_StepBackMovement

.notKanto
	opentext
	writetext PewterCityGreenNotKantoText
	waitbutton 

.GreenExit
	closetext
	setevent EVENT_FOUND_PEWTER_CITY_GREEN
	special FadeOutToBlack
	disappear PEWTERCITY_GREEN
	special FadeInFromBlack
	end

PewterCityGreenAfterBattleText:
	text "Ah well, I'm gonna"
	line "head on through"
	cont "Mt Moon. Later"
	cont "scrub!"
	done

PewterCityGreenLossText:
	text "Ugh, lucky!"
	done

PewterCityGreenWinText:
	text "Ha! Suck it,"
	line "loser!"
	done

PewterCityNoBadgeText:
	text "Oh, hey newbie."
	line "You are NOT"
	cont "ready to go"
	cont "past here..."

	para "Maybe try your"
	line "luck with the"
	cont "Pewter City Gym"
	cont "first?"
	done

PewterCityGreenIntroText:
	text "Oh, good. You got"
	line "Brock's badge."

	para "Maybe you've got"
	line "a chance after"
	cont "all."	

	para "Since we're here"
	line "though..."

	para "How about a"
	line "#mon battle"
	cont "before heading on?"
	done

PewterCityGreenNotKantoText:
	text "Huh? Do I know"
	line "you?"

	para "Sorry, I don't"
	line "have time for"
	cont "scrubs."
	done

PewterCityApproachGreen0Script:
	checkevent EVENT_FOUND_PEWTER_CITY_GREEN
	iftrue .done

	turnobject PLAYER, UP
	sjump PewterCity_Green

	.done
	end

PewterCityApproachGreen1Script:
	checkevent EVENT_FOUND_PEWTER_CITY_GREEN
	iftrue .done

	turnobject PLAYER, UP
	applymovement PLAYER, PewterCityGreen_StepUpMovement
	sjump PewterCity_Green

	.done
	end

PewterCityApproachGreen2Script:
	checkevent EVENT_FOUND_PEWTER_CITY_GREEN
	iftrue .done

	turnobject PLAYER, UP
	applymovement PLAYER, PewterCityGreen_StepUp2Movement
	sjump PewterCity_Green

	.done
	end

PewterCityGreen_StepUpMovement:
	step UP
	step_end

PewterCityGreen_StepUp2Movement:
	step UP
	step UP
	step_end

PewterCityGreen_StepBackMovement:
	step LEFT
	step LEFT
	step_end

PewterCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 08, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event 07, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1
	warp_event 12, 07, PEWTER_MUSEUM, 2
	warp_event 20, 05, PEWTER_MUSEUM, 4

	def_coord_events
	coord_event  34, 17, -1, PewterCityApproachGreen0Script
	coord_event  34, 18, -1, PewterCityApproachGreen1Script
	coord_event  34, 19, -1, PewterCityApproachGreen2Script

	def_bg_events
	bg_event 24, 24, BGEVENT_READ, PewterCitySign
	bg_event 06, 18, BGEVENT_READ, PewterGymSign
	bg_event 16, 12, BGEVENT_READ, PewterMuseumSign
	bg_event 35, 17, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 17, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	def_object_events
	object_event 19, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 14, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 29, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
	object_event 34, 16, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCity_Green, EVENT_FOUND_PEWTER_CITY_GREEN
