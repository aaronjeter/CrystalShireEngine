	object_const_def
	const WCQROUNDTWO_OPPONENT

WCQualifier2_MapScripts:
	def_scene_scripts

	def_callbacks

WorldCupQualifierRoundTwoScript:
	applymovement PLAYER, WCQ_RoundTwoMovement

	random 3
	ifequal 0, .zero
	ifequal 1, .one
	ifequal 2, .two

.zero
	;monica
	opentext
	writetext WCQ_RoundOne_MonicaPreFightText
	waitbutton
	closetext
	winlosstext WCQ_RoundOne_MonicaWinLossText, 0
	loadtrainer COOLTRAINERF, WEEKDAY_MONICA
	sjump .Fight

.one
	;tuscany
	opentext
	writetext WCQ_RoundOne_TuscanyPreFightText
	waitbutton
	closetext
	winlosstext WCQ_RoundOne_TuscanyWinLossText, 0
	loadtrainer COOLTRAINERF, WEEKDAY_TUSCANY
	sjump .Fight

.two
	;frieda
	opentext
	writetext WCQ_RoundOne_FriedaPreFightText
	waitbutton
	closetext
	winlosstext WCQ_RoundOne_FriedaWinLossText, 0
	loadtrainer COOLTRAINERF, WEEKDAY_FRIEDA
	sjump .Fight

.Fight
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_QUALIFIER_ROUND_TWO
	special HealParty
	warp WORLD_CUP_LOBBY, 08, 09
	end

WCQ_RoundOne_MonicaPreFightText:
	text "Hey, good luck!"
	done

WCQ_RoundOne_MonicaWinLossText:
	text "Ugh!"

	para "I never had a"
	line "chance, did I?"
	done


WCQ_RoundOne_TuscanyPreFightText:
	text "You're toast!"
	done

WCQ_RoundOne_TuscanyWinLossText:
	text "Woah!"
	line "Toasted!"
	done


WCQ_RoundOne_FriedaPreFightText:
	text "Oh, hello"
	line "<PLAY_G>."

	para "I was looking"
	line "forward to this."
	done

WCQ_RoundOne_FriedaWinLossText:
	text "It's spooky how"
	line "tough you are!"
	done

WCQ_RoundTwoMovement:
	step UP
	step UP
	step UP
	step_end

WCQualifier2_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	;warp_event   08, 19, WORLD_CUP_LOBBY, 7
	;warp_event   09, 19, WORLD_CUP_LOBBY, 7

	def_coord_events
	coord_event  06,  09, -1, WorldCupQualifierRoundTwoScript
	coord_event  07,  09, -1, WorldCupQualifierRoundTwoScript

	def_bg_events

	def_object_events
	object_event  06,  05, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WorldCupLobbyQualifierClerkScript, -1
	