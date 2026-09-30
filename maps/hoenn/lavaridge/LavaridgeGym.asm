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
	opendialog FLANNERY
	checkflag ENGINE_HEATBADGE
	iftrue .FightDone	
	writetext FlanneryText_PreFight
	promptbutton
	closedialog
	scall FlanneryFight
	opendialog FLANNERY
	scall FlanneryGiveBadge
	scall FlanneryGiveTm
	writetext FlanneryPostBattleText
	promptbutton
	closedialog
	end

.FightDone:	
	scall FlanneryGiveTm
	scall FlanneryRematch
	end

FlanneryRematch:
	writetext FlanneryRematchText
	yesorno
	iffalse .FightDone
	scall FlanneryFight
	opendialog FLANNERY
.FightDone:	
	writetext FlanneryPostBattleText
	promptbutton
.EndRematch:
	closedialog
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
	text "Okay, you win."
	line "Take the Heat"
	cont "Badge!"

	para "It's proof that"
	line "you can handle"
	cont "some heat!"
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
	text "Feel the heat of"
	line "Lavaridge!"

	para "My #mon are"
	line "burning up to"
	cont "battle!"
	done

LavaridgeGymJeffBeatenText:
	text "Ow, ow! I got"
	line "burned!"
	done

LavaridgeGymJeffAfterBattleText:
	text "Flannery's new,"
	line "but she's got"
	cont "fire in her soul."

	para "We'd follow her"
	line "into a volcano!"
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
	text "Lost in the maze?"

	para "Let me light the"
	line "way... with a"
	cont "Flamethrower!"
	done

LavaridgeGymJaceBeatenText:
	text "My flame went"
	line "out..."
	done

LavaridgeGymJaceAfterBattleText:
	text "The maze throws"
	line "off a lot of"
	cont "challengers."

	para "Keep your eyes"
	line "peeled for the"
	cont "right path!"
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
	text "I hiked all the"
	line "way down from Mt."
	cont "Chimney!"

	para "My legs are"
	line "tired, but my"
	cont "#mon aren't!"
	done

LavaridgeGymEliBeatenText:
	text "Whew! Time for"
	line "a hot spring."
	done

LavaridgeGymEliAfterBattleText:
	text "Nothing beats a"
	line "soak in the hot"
	cont "springs after a"
	cont "long climb."

	para "Heh, maybe after"
	line "your badge!"
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
	text "Hot enough for"
	line "you?"

	para "It's about to get"
	line "a whole lot"
	cont "hotter!"
	done

LavaridgeGymColeBeatenText:
	text "Too hot to"
	line "handle..."
	done

LavaridgeGymColeAfterBattleText:
	text "The ground here"
	line "stays warm all"
	cont "year long."

	para "That's why our"
	line "#mon love it!"
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
	text "Fire isn't the"
	line "only thing burning"
	cont "here."

	para "My Marowak's"
	line "flames burn with"
	cont "a ghostly glow!"
	done

LavaridgeGymGeraldBeatenText:
	text "Snuffed out..."
	done

LavaridgeGymGeraldAfterBattleText:
	text "Flannery took"
	line "over from her"
	cont "grandfather."

	para "Some folks doubt"
	line "her, but I think"
	cont "she'll be great."
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
	text "I'm all fired up!"

	para "Let's see if you"
	line "can take the heat!"
	done

LavaridgeGymAxleBeatenText:
	text "I'm burned out..."
	done

LavaridgeGymAxleAfterBattleText:
	text "Flannery's just"
	line "ahead. She's"
	cont "tougher than she"
	cont "looks!"
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
	text "You made it this"
	line "far through the"
	cont "maze?"

	para "Then you'll have"
	line "to get past me!"
	done

LavaridgeGymKeeganBeatenText:
	text "You're hot stuff!"
	done

LavaridgeGymKeeganAfterBattleText:
	text "My Sunkern loves"
	line "the sunshine and"
	cont "the heat here."
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
	text "I train my body"
	line "in the heat of"
	cont "the volcano!"

	para "Hi-yah! Get"
	line "ready!"
	done

LavaridgeGymDanielleBeatenText:
	text "I need to cool"
	line "down..."
	done

LavaridgeGymDanielleAfterBattleText:
	text "Training in the"
	line "heat builds real"
	cont "endurance."

	para "Try it sometime!"
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
	