	object_const_def
	const WCQROUNDONE_OPPONENT

WCQualifier1_MapScripts:
	def_scene_scripts

	def_callbacks

WorldCupQualifierRoundOneScript:
	applymovement PLAYER, WCQ_RoundOneMovement

	random 3
	ifequal 0, .zero
	ifequal 1, .one
	ifequal 2, .two

.zero
	;wesley
	opentext
	writetext WCQ_RoundOne_WesleyPreFightText
	waitbutton
	closetext
	winlosstext WCQ_RoundOne_WesleyWinLossText, 0
	loadtrainer COOLTRAINERM, WEEKDAY_WESLEY
	sjump .Fight

.one
	;arthur
	opentext
	writetext WCQ_RoundOne_ArthurPreFightText
	waitbutton
	closetext
	winlosstext WCQ_RoundOne_ArthurWinLossText, 0
	loadtrainer COOLTRAINERM, WEEKDAY_ARTHUR
	sjump .Fight

.two
	;santos
	opentext
	writetext WCQ_RoundOne_SantosPreFightText
	waitbutton
	closetext
	winlosstext WCQ_RoundOne_SantosWinLossText, 0
	loadtrainer COOLTRAINERM, WEEKDAY_SANTOS
	sjump .Fight

.Fight
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_QUALIFIER_ROUND_ONE
	special HealParty
	special FadeOutToWhite
	waitsfx
	warp WORLD_CUP_LOBBY, 08, 09
	end

WCQ_RoundOne_WesleyPreFightText:
	text "Hey, good luck!"
	done

WCQ_RoundOne_WesleyWinLossText:
	text "Ugh!"

	para "I never had a"
	line "chance, did I?"
	done


WCQ_RoundOne_ArthurPreFightText:
	text "You're toast!"
	done

WCQ_RoundOne_ArthurWinLossText:
	text "Woah!"
	line "Toasted!"
	done


WCQ_RoundOne_SantosPreFightText:
	text "Oh, hello"
	line "<PLAY_G>."

	para "I was looking"
	line "forward to this."
	done

WCQ_RoundOne_SantosWinLossText:
	text "It's spooky how"
	line "tough you are!"
	done

WCQ_RoundOneMovement:
	step UP
	step UP
	step UP
	step_end

WCQualifier1_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	;warp_event   08, 19, WORLD_CUP_LOBBY, 7
	;warp_event   09, 19, WORLD_CUP_LOBBY, 7

	def_coord_events
	coord_event  06,  09, -1, WorldCupQualifierRoundOneScript
	coord_event  07,  09, -1, WorldCupQualifierRoundOneScript

	def_bg_events

	def_object_events
	object_event  06,  05, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WorldCupLobbyQualifierClerkScript, -1
	
