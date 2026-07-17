	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUIDE

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGymBlueScript:
	faceplayer	
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	opentext
	writetext LeaderBlueBeforeText
	promptbutton
	closetext
	scall BlueFight
	opentext
	scall BlueGiveBadge
	scall BlueGiveTm
	writetext LeaderBlueEpilogueText
	promptbutton
	closetext
	end

.FightDone:	
	opentext
	scall BlueGiveTm
	closetext
	scall BlueRematch
	end

BlueRematch:
	opentext
	writetext LeaderBlueRematchText
	yesorno
	iffalse .FightDone
	closetext
	scall BlueFight
	opentext
.FightDone:	
	writetext LeaderBlueEpilogueText
	promptbutton
.EndRematch:
	closetext
	end

BlueGiveTm:
	checkitem TM_DRAGON_CLAW
	iftrue .Done
	writetext LeaderBlueExplainTMText
	promptbutton
	verbosegiveitem TM_DRAGON_CLAW
.Done	
	end

BlueGiveBadge:
	setevent EVENT_BEAT_BLUE	
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	scall ViridianGymLevelcap
	writetext LeaderBlueAfterText
	waitbutton
	end

BlueFight:
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	end

ViridianGymLevelcap:
	jumpstd UpdateWorldLevelsScript
	end

ViridianGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script

LeaderBlueBeforeText:
	text "Blue: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at Cinnabar,"

	para "but now I'm ready"
	line "to battle you."

	para "…"

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, champ?"
	done

LeaderBlueWinText:
	text "Blue: What?"

	para "How the heck did I"
	line "lose to you?"

	para "…"

	para "Tch, all right…"
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> received"
	line "Earthbadge."
	done

LeaderBlueAfterText:
	text "Blue: …"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "But I'm going to"
	line "beat you someday."

	para "Don't you forget"
	line "it!"
	done

LeaderBlueRematchText:
	text "Rematch?"
	done

LeaderBlueRematchWinLossText:
	text "Darn! Good Job!"
	done

LeaderBlueEpilogueText:
	text "Blue: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done

LeaderBlueExplainTMText:
	text "Take this TM for"
	line "the Elite Four."

	para "Dragon Claw is"
	line "just a really"
	cont "good move."

	para "Might come in"
	line "handy against a"
	cont "certain Dragon"
	cont "Master..."
	done

ViridianGymGuideText:
	text "Yo, Champ in"
	line "making!"

	para "How's it going?"
	line "Looks like you're"
	cont "on a roll."

	para "The Gym Leader is"
	line "a guy who battled"

	para "the Champion three"
	line "years ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got!"
	done

ViridianGymGuideWinText:
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
