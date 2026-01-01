	object_const_def
	const CENTRALCAFE_CLEA

CentralCafe_MapScripts:
	def_scene_scripts

	def_callbacks	

CentralGymCleaScript:
	faceplayer
	opentext
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .FightDone
	writetext CleaIntroText
	waitbutton
	closetext

	random 2
	ifequal 0, .FirstParty
	ifequal 1, .SecondParty
	ifequal 2, .ThirdParty

.FirstParty
	winlosstext CleaWinLossText, 0
	loadtrainer WHITNEY, WHITNEY1
	sjump .Fight
.SecondParty
	winlosstext CleaWinLossText, 0
	loadtrainer WHITNEY, WHITNEY2
	sjump .Fight
.ThirdParty
	winlosstext CleaWinLossText, 0
	loadtrainer WHITNEY, WHITNEY3
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	opentext
	writetext ReceivedCleaBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	readmem wBaseLevel
	addval 6
	writemem wBaseLevel
	checkevent EVENT_LEVELCAPS_ENABLED
	iffalse .SkipLevelCaps 
	readmem wLevelCap
	addval 6
	writemem wLevelCap
	setevent EVENT_BEAT_SOUTH_GYM_RODNEY
.SkipLevelCaps:
	closetext
	end

.FightDone:
	writetext CleaRematchText
	yesorno
	iffalse .FightDoneText

	random 2
	ifequal 0, .FirstRematchParty
	ifequal 1, .SecondRematchParty
	ifequal 2, .ThirdRematchParty

.FirstRematchParty
	winlosstext CleaRematchWinLossText, 0
	loadtrainer WHITNEY, WHITNEY1
	sjump .Rematch
.SecondRematchParty
	winlosstext CleaRematchWinLossText, 0
	loadtrainer WHITNEY, WHITNEY2
	sjump .Rematch
.ThirdRematchParty
	winlosstext CleaRematchWinLossText, 0
	loadtrainer WHITNEY, WHITNEY3
	sjump .Rematch

.Rematch	
	startbattle
	reloadmapafterbattle
	sjump .EndRematch

.FightDoneText:
	writetext CleaFightDoneText
	waitbutton
.EndRematch:
	closetext
	end


CleaIntroText:
	text "CLEA: Oh,"
	line "hello there."

	para "If you want a"
	line "drink, try the"
	cont "counter?"

	para "..."

	para "Oh!"
	line "A Challenger!"

	para "Well then..."

	para "My name is CLEA."

	para "I'm both the"
	line "leader and owner"
	cont "of this CAFE."

	para "Well, I need to"
	line "get a fresh."
	cont "drink anyways."

	para "Let's do this."
	done

CleaWinLossText:
	text "CLEA: Well then!"

	para "That was"
	line "excellent!"

	para "Go ahead--take"
	line "this BADGE."
	done

ReceivedCleaBadgeText:
	text "<PLAYER> received"
	line "a Badge."
	done

CleaBadgeText:
	text "CLEA: <PLAY_G>,"
	line "thanks. I enjoyed"

	para "that quite a bit."

	para "Now...about that"
	line "drink..."

	para "Goodbye for now!"
	done

CleaRematchText:
	text "Rematch?"
	done

CleaRematchWinLossText:
	text "Well Done!"
	done

CleaFightDoneText:
	text "CLEA: You"
	line "should head north"

	para "and face more"
	line "strong trainers."
	done

CentralCafe_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  14,  19, CENTRAL_CITY, 3
	warp_event  15,  19, CENTRAL_CITY, 3

	def_coord_events

	def_bg_events	
	

	def_object_events
	object_event  01,  03, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CentralGymCleaScript, -1