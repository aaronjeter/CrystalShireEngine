	object_const_def
	const LAVARIDGEGYM_FLANNERY
	const LAVARIDGEGYM_JEFF
	const LAVARIDGEGYM_JACE
	const LAVARIDGEGYM_ELI
	const LAVARIDGEGYM_COLE
	const LAVARIDGEGYM_GERALD
	const LAVARIDGEGYM_AXLE
	const LAVARIDGEGYM_KEEGAN
	const LAVARIDGEGYM_DANIELLE

LavaridgeGym_MapScripts:
	def_scene_scripts

	def_callbacks

LavaridgeGymFlanneryScript:
	faceplayer	
	checkflag ENGINE_HEATBADGE
	iftrue .FightDone
	opentext
	writetext FlanneryText_PreFight
	promptbutton
	closetext
	scall FlanneryFight
	opentext
	scall FlanneryGiveBadge
	scall FlanneryGiveTm
	writetext FlanneryPostBattleText
	promptbutton
	closetext
	end

.FightDone:	
	opentext
	scall FlanneryGiveTm
	closetext
	scall FlanneryRematch
	end

FlanneryRematch:
	opentext
	writetext FlanneryRematchText
	yesorno
	iffalse .FightDone
	closetext
	scall FlanneryFight
	opentext
.FightDone:	
	writetext FlanneryPostBattleText
	promptbutton
.EndRematch:
	closetext
	end

FlanneryGiveTm:
	checkitem TM_WILLOWISP
	iftrue .Done
	writetext FlanneryExplainTMText
	promptbutton
	verbosegiveitem TM_WILLOWISP
.Done	
	end

FlanneryGiveBadge:
	setevent EVENT_BEAT_FLANERY	
	writetext FlanneryText_ExplainBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HEATBADGE
	scall LavaridgeGymLevelcap
	end

FlanneryFight:
	readvar VAR_BADGES
	ifgreater 13, .Hard
	ifgreater 5, .Medium
	sjump .Easy

.Hard
	winlosstext FlanneryWinLossText, 0
	loadtrainer FLANNERY, FLANNERY3
	sjump .Fight

.Medium
	winlosstext FlanneryWinLossText, 0
	loadtrainer FLANNERY, FLANNERY2
	sjump .Fight

.Easy
	winlosstext FlanneryWinLossText, 0
	loadtrainer FLANNERY, FLANNERY1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	end

LavaridgeGymLevelcap:
	jumpstd UpdateWorldLevelsScript
	end

FlanneryText_PreFight:
	text "Welcome "
	line "<PLAY_G>!"

	para "I hope you"
	line "enjoyed my maze."

	para "I'm pretty new"
	line "to leading a"
	cont "Gym."

	para "Well, let's see"
	line "how this goes!"
	done

FlanneryWinLossText:
	text "Ha haha!"

	para "That was great!"
	done

FlanneryText_ExplainBadge:
	text "Okay, you"
	line "win."

	para "Take the"
	line "Heat Badge!"

	para "It's proof"
	line "that you"

	para "can handle"
	line "some heat!"
	done

FlanneryRematchText:
	text "Let's try again?"
	done

FlanneryRematchWinLossText:
	text "Awww!"
	done

FlanneryPostBattleText:
	text "I really love"
	line "leading a gym."

	para "You should try"
	line "it one day!"
	done

FlanneryExplainTMText:
	text "Alright, now for"
	line "the fun part!"

	para "This TM has my"
	line "very favorite move"
	cont "...Will-O-Wisp."

	para "As a wise man once"
	line "said..."

	para "Build a guy a"
	line "fire, and he'll"
	cont "be warm for a"
	cont "day."

	para "SET a guy on fire"
	line "and he'll be warm"
	cont "for the rest of"
	cont "his life!"
	done


LavaridgeGymJeffScript:
	trainer FIREBREATHER, LAVARIDGE_JEFF, EVENT_BEAT_LAVARIDGE_JEFF, LavaridgeGymJeffSeenText, LavaridgeGymJeffBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LavaridgeGymJeffAfterBattleText
	waitbutton
	closetext
	end

LavaridgeGymJeffSeenText:
	text "Hi"
	done

LavaridgeGymJeffBeatenText:
	text "Aiyiyi!"
	done

LavaridgeGymJeffAfterBattleText:
	text "Bye"
	done


LavaridgeGymJaceScript:
	trainer FIREBREATHER, LAVARIDGE_JACE, EVENT_BEAT_LAVARIDGE_JACE, LavaridgeGymJaceSeenText, LavaridgeGymJaceBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LavaridgeGymJaceAfterBattleText
	waitbutton
	closetext
	end

LavaridgeGymJaceSeenText:
	text "Hi"
	done

LavaridgeGymJaceBeatenText:
	text "Aiyiyi!"
	done

LavaridgeGymJaceAfterBattleText:
	text "Bye"
	done


LavaridgeGymEliScript:
	trainer HIKER, LAVARIDGE_ELI, EVENT_BEAT_LAVARIDGE_ELI, LavaridgeGymEliSeenText,LavaridgeGymEliBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LavaridgeGymEliAfterBattleText
	waitbutton
	closetext
	end

LavaridgeGymEliSeenText:
	text "Hi"
	done

LavaridgeGymEliBeatenText:
	text "Aiyiyi!"
	done

LavaridgeGymEliAfterBattleText:
	text "Bye"
	done


LavaridgeGymColeScript:
	trainer FIREBREATHER, LAVARIDGE_COLE, EVENT_BEAT_LAVARIDGE_COLE, LavaridgeGymColeSeenText, LavaridgeGymColeBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LavaridgeGymColeAfterBattleText
	waitbutton
	closetext
	end

LavaridgeGymColeSeenText:
	text "Hi"
	done

LavaridgeGymColeBeatenText:
	text "Aiyiyi!"
	done

LavaridgeGymColeAfterBattleText:
	text "Bye"
	done


LavaridgeGymGeraldScript:
	trainer COOLTRAINERM, LAVARIDGE_GERALD, EVENT_BEAT_LAVARIDGE_GERALD, LavaridgeGymGeraldSeenText, LavaridgeGymGeraldBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LavaridgeGymGeraldAfterBattleText
	waitbutton
	closetext
	end

LavaridgeGymGeraldSeenText:
	text "Hi"
	done

LavaridgeGymGeraldBeatenText:
	text "Aiyiyi!"
	done

LavaridgeGymGeraldAfterBattleText:
	text "Bye"
	done


LavaridgeGymAxleScript:
	trainer FIREBREATHER, LAVARIDGE_AXLE, EVENT_BEAT_LAVARIDGE_AXLE, LavaridgeGymAxleSeenText, LavaridgeGymAxleBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LavaridgeGymAxleAfterBattleText
	waitbutton
	closetext
	end

LavaridgeGymAxleSeenText:
	text "Hi"
	done

LavaridgeGymAxleBeatenText:
	text "Aiyiyi!"
	done

LavaridgeGymAxleAfterBattleText:
	text "Bye"
	done


LavaridgeGymKeeganScript:
	trainer FIREBREATHER, LAVARIDGE_KEEGAN, EVENT_BEAT_LAVARIDGE_KEEGAN, LavaridgeGymKeeganSeenText, LavaridgeGymKeeganBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LavaridgeGymKeeganAfterBattleText
	waitbutton
	closetext
	end

LavaridgeGymKeeganSeenText:
	text "Hi"
	done

LavaridgeGymKeeganBeatenText:
	text "Aiyiyi!"
	done

LavaridgeGymKeeganAfterBattleText:
	text "Bye"
	done


LavaridgeGymDanielleScript:
	trainer BATTLE_GIRL, LAVARIDGE_DANIELLE, EVENT_BEAT_LAVARIDGE_DANIELLE, LavaridgeGymDanielleSeenText, LavaridgeGymDanielleBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LavaridgeGymDanielleAfterBattleText
	waitbutton
	closetext
	end

LavaridgeGymDanielleSeenText:
	text "Hi"
	done

LavaridgeGymDanielleBeatenText:
	text "Aiyiyi!"
	done

LavaridgeGymDanielleAfterBattleText:
	text "Bye"
	done

LavaridgeGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  16, 19, LAVARIDGE_TOWN, 3
	warp_event  17, 19, LAVARIDGE_TOWN, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  17, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavaridgeGymFlanneryScript, -1
	object_event  10, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, LavaridgeGymJeffScript, -1
	object_event  06, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, LavaridgeGymJaceScript, -1
	object_event  00, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, LavaridgeGymEliScript, -1
	object_event  03, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, LavaridgeGymColeScript, -1
	object_event  04, 00, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, LavaridgeGymGeraldScript, -1
	object_event  10, 01, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, LavaridgeGymAxleScript, -1
	object_event  14, 03, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, LavaridgeGymKeeganScript, -1
	object_event  14, 06, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, LavaridgeGymDanielleScript, -1
	