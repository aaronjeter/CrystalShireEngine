	object_const_def
	const FORTREEGYM_WINONA

FortreeGym_MapScripts:
	def_scene_scripts

	def_callbacks	

FortreeGymWinonaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WINONA
	iftrue .FightDone
	writetext WinonaText_PreFight
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 13, .Hard
	ifgreater 3, .Medium
	sjump .Easy

.Hard
	winlosstext WinonaWinLossText, 0
	loadtrainer WINONA, WINONA3
	sjump .Fight

.Medium
	winlosstext WinonaWinLossText, 0
	loadtrainer WINONA, WINONA2
	sjump .Fight

.Easy
	winlosstext WinonaWinLossText, 0
	loadtrainer WINONA, WINONA1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WINONA
	opentext
	writetext WinonaText_ExplainBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FEATHERBADGE
	scall FortreeGymLevelcap

	closetext
	end

.FightDone:
	writetext WinonaRematchText
	yesorno
	iffalse .FightDoneText

	readvar VAR_BADGES
	ifgreater 13, .HardRematch
	ifgreater 3, .MediumRematch
	sjump .EasyRematch

.HardRematch
	winlosstext WinonaRematchWinLossText, 0
	loadtrainer WINONA, WINONA3
	sjump .Rematch

.MediumRematch
	winlosstext WinonaRematchWinLossText, 0
	loadtrainer WINONA, WINONA2
	sjump .Rematch

.EasyRematch
	winlosstext WinonaRematchWinLossText, 0
	loadtrainer WINONA, WINONA1
	sjump .Rematch

.Rematch	
	startbattle
	reloadmapafterbattle
	opentext
.FightDoneText
	writetext WinonaPostBattleText
	waitbutton
	closetext
	end

FortreeGymLevelcap:
	jumpstd UpdateWorldLevelsScript
	end

WinonaText_PreFight:
	text "Hey there,"
	line "trainer!"

	para "My name is"
	line "Winona."

	para "Welcome to my"
	line "little slice"

	para "of tropical"
	line "paradise!"

	para "I think you'll"
	line "find your stay"

	para "here relaxing"
	line "and fruitful."

	para "..."

	para "Though this"
	line "next part may"
	cont "sting a bit..."

	para "En Garde"
	line "<PLAY_G>!"
	done

WinonaWinLossText:
	text "Ha haha!"

	para "That was great!"
	done

WinonaText_ExplainBadge:
	text "Okay, you"
	line "win."

	para "Take this"
	line "Feather Badge!"

	para "It's proof"
	line "that you"

	para "can handle"
	line "the skies!"
	done

WinonaRematchText:
	text "Let's try again?"
	done

WinonaRematchWinLossText:
	text "Awww!"
	done

WinonaPostBattleText:
	text "Yawn..."

	para "That was lovely"
	line "<PLAY_G>."

	para "..."

	para "I think I"
	line "need a nap!"
	done

FortreeGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  16, 23, FORTREE_CITY, 3
	warp_event  17, 23, FORTREE_CITY, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  15, 02, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, FortreeGymWinonaScript, -1
	