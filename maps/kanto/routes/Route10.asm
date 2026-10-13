	object_const_def
	const ROUTE10_GREEN
	const ROUTE10_POKEFAN_M1
	const ROUTE10_POKEFAN_M2

Route10_MapScripts:
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
	reloadmap
	iftrue .GreenWon
	opentext
	writetext Route10GreenAfterBattleText
	waitbutton
	sjump .GreenExit

.GreenWon
	special HealParty
	opentext
	writetext Route10GreenWonText
	waitbutton
	sjump .GreenExit

.notKanto
	opentext
	writetext Route10GreenNotKantoText
	waitbutton 

.GreenExit
	closetext

	applymovement ROUTE10_GREEN, Route10_GreenWalkAwayMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE10_GREEN
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

Route10GreenWonText:
	text "Ah, I got a bit"
	line "carried away..."

	para "Here, let me heal"
	line "your #mon..."

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

Route10GreenEventScript1:
	checkevent EVENT_FOUND_ROUTE10_GREEN
	iftrue .done
	applymovement PLAYER, Route10_PlayerWalkOverMovement1
	turnobject PLAYER, UP
	sjump Route10_Green
.done
	end

Route10GreenEventScript2:
	checkevent EVENT_FOUND_ROUTE10_GREEN
	iftrue .done
	applymovement PLAYER, Route10_PlayerWalkOverMovement2
	turnobject PLAYER, UP
	sjump Route10_Green
.done
	end

Route10_PlayerWalkOverMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

Route10_PlayerWalkOverMovement2:
	step LEFT
	step LEFT
	step LEFT
	step_end

Route10_GreenWalkAwayMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end


TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	trainerafter HikerJimAfterBattleText

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	trainerafter PokefanmRobertAfterBattleText

Route10Sign:
	jumptext Route10SignText

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-hachoo!"
	done

HikerJimAfterBattleText:
	text "Hay fever is"
	line "making me sneeze!"
	cont "Ahahah-CHOO!"
	done

PokefanmRobertSeenText:
	text "You like #mon,"
	line "don't you?"

	para "Me too!"
	done

PokefanmRobertBeatenText:
	text "I'd have to say"
	line "that's my loss."
	done

PokefanmRobertAfterBattleText:
	text "Look what you did"
	line "to my #mon."

	para "I won't forget"
	line "this."
	done

Route10SignText:
	text "Route 10"

	para "Cerulean City -"
	line "Lavender Town"
	done

Route10_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 19, ROUTE_10_POKECENTER_1F, 1
	warp_event 07, 39, POWER_PLANT, 1
	warp_event 08, 17, ROCK_TUNNEL_1F, 1
	warp_event 08, 53, ROCK_TUNNEL_1F, 2

	def_coord_events
	coord_event 13, 20, -1, Route10GreenEventScript1
	coord_event 13, 21, -1, Route10GreenEventScript2

	def_bg_events
	bg_event 05, 41, BGEVENT_READ, PowerPlantSign
	bg_event 12, 19, BGEVENT_READ, Route10PokecenterSign
	bg_event 09, 55, BGEVENT_READ, Route10Sign

	def_object_events
	object_event 10, 20, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10_Green, EVENT_FOUND_ROUTE10_GREEN
	object_event 15, 65, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event 05, 55, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
