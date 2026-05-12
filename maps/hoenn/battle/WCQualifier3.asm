	object_const_def
	const WCQROUNDTHREE_OPPONENT

WCQualifier3_MapScripts:
	def_scene_scripts

	def_callbacks

WorldCupQualifierRoundThreeScript:
	applymovement PLAYER, WCQ_RoundThreeMovement

	random 3
	ifequal 0, .zero
	ifequal 1, .one
	ifequal 2, .two

.zero
	;monica
	opentext
	writetext WCQ_RoundThree_MonicaPreFightText
	waitbutton
	closetext
	winlosstext WCQ_RoundThree_MonicaWinLossText, 0
	loadtrainer YOUNGSTER, RONALD3
	sjump .Fight

.one
	;tuscany
	opentext
	writetext WCQ_RoundThree_TuscanyPreFightText
	waitbutton
	closetext
	winlosstext WCQ_RoundThree_TuscanyWinLossText, 0
	loadtrainer COOLTRAINERF, MARINA3
	sjump .Fight

.two
	;frieda
	opentext
	writetext WCQ_RoundThree_FriedaPreFightText
	waitbutton
	closetext
	winlosstext WCQ_RoundThree_FriedaWinLossText, 0
	loadtrainer TEACHER, JESS2
	sjump .Fight

.Fight
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_QUALIFIER_ROUND_THREE
	setevent EVENT_WORLD_CUP_QUALIFIED
	special HealParty
	warp WORLD_CUP_LOBBY, 08, 09
	end

WCQ_RoundThree_MonicaPreFightText:
	text "Hey, good luck!"
	done

WCQ_RoundThree_MonicaWinLossText:
	text "Ugh!"

	para "I never had a"
	line "chance, did I?"
	done


WCQ_RoundThree_TuscanyPreFightText:
	text "You're toast!"
	done

WCQ_RoundThree_TuscanyWinLossText:
	text "Woah!"
	line "Toasted!"
	done


WCQ_RoundThree_FriedaPreFightText:
	text "Oh, hello"
	line "<PLAY_G>."

	para "I was looking"
	line "forward to this."
	done

WCQ_RoundThree_FriedaWinLossText:
	text "It's spooky how"
	line "tough you are!"
	done

WCQ_RoundThreeMovement:
	step UP
	step UP
	step UP
	step_end

WCQualifier3_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	;warp_event   08, 19, WORLD_CUP_LOBBY, 7
	;warp_event   09, 19, WORLD_CUP_LOBBY, 7

	def_coord_events
	coord_event  06,  09, -1, WorldCupQualifierRoundThreeScript
	coord_event  07,  09, -1, WorldCupQualifierRoundThreeScript

	def_bg_events

	def_object_events
	object_event  06,  05, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WorldCupQualifierRoundThreeScript, -1
	