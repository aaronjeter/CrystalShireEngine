	object_const_def
	const SOUTHGYM_RODNEY
	const SOUTHGYM_JOEY
	const SOUTHGYM_JERRY

SouthGym_MapScripts:
	def_scene_scripts

	def_callbacks	

SouthGymRodneyScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext RodneyIntroText
	waitbutton
	closetext

	random 2
	ifequal 0, .FirstParty
	ifequal 1, .SecondParty
	ifequal 2, .ThirdParty

.FirstParty
	winlosstext RodneyWinLossText, 0
	loadtrainer BROCK, BROCK1
	sjump .Fight
.SecondParty
	winlosstext RodneyWinLossText, 0
	loadtrainer BROCK, BROCK2
	sjump .Fight
.ThirdParty
	winlosstext RodneyWinLossText, 0
	loadtrainer BROCK, BROCK3
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	readmem wBaseLevel
	addval 2
	writemem wBaseLevel
	checkevent EVENT_LEVELCAPS_ENABLED
	iffalse .SkipLevelCaps 
	readmem wLevelCap
	addval 2
	writemem wLevelCap
.SkipLevelCaps:
	closetext
	end

.FightDone:
	writetext RodneyRematchText
	yesorno
	iffalse .FightDoneText

	random 2
	ifequal 0, .FirstRematchParty
	ifequal 1, .SecondRematchParty
	ifequal 2, .ThirdRematchParty

.FirstRematchParty
	winlosstext RodneyRematchWinLossText, 0
	loadtrainer BROCK, BROCK1
	sjump .Rematch
.SecondRematchParty
	winlosstext RodneyRematchWinLossText, 0
	loadtrainer BROCK, BROCK2
	sjump .Rematch
.ThirdRematchParty
	winlosstext RodneyRematchWinLossText, 0
	loadtrainer BROCK, BROCK3
	sjump .Rematch

.Rematch	
	startbattle
	reloadmapafterbattle
	sjump .EndRematch

.FightDoneText:
	writetext RodneyFightDoneText
	waitbutton
.EndRematch:
	closetext
	end


RodneyIntroText:
	text "RODNEY: Yo!"

	para "How are you"
	line "liking my little"
	cont "GYM?"

	para "RODNEY'S"
	line "RODENTORIUM!"

	para "I've always had"
	line "a passion for the"
	cont "little critters."

	para "They deserve more"
	line "than your disdain."

	para "In a proper"
	line "trainer's hands"

	para "they'll make YOU"
	line "into Rodakill!"

	para "Bring it!"
	done

RodneyWinLossText:
	text "RODNEY: Woah!"

	para "I think I got"
	line "hit by a Truck!"

	para "That was a"
	line "good effort, kid."

	para "You're stronger"
	line "than I expected."

	para "Go ahead--take"
	line "this BADGE."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> received"
	line "BOULDERBADGE."
	done

RodneyBoulderBadgeText:
	text "RODNEY: <PLAY_G>,"
	line "thanks. I enjoyed"

	para "battling you, even"
	line "though I am a bit"
	cont "upset."
	done

RodneyRematchText:
	text "Rematch?"
	done

RodneyRematchWinLossText:
	text "Well Done!"
	done

RodneyFightDoneText:
	text "RODNEY: You"
	line "should head north"

	para "and face more"
	line "trainers like you."
	done

SouthGymJoey:
	trainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoeySeenText, YoungsterJoeyBeatenText, 0, .Script

.Script:
	opentext
	writetext YoungsterJoeyAfterText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SOUTHGYM_JOEY
	pause 15
	special FadeInFromBlack
	end

YoungsterJoeySeenText:
	text "My Ratatta is"
	line "the best!"

	para "Tatta will kick"
	line "your butt!"
	done

YoungsterJoeyBeatenText:
	text "Tatta! NO!!!"
	done

YoungsterJoeyAfterText:
	text "Please be OK"
	line "Tatta!!!"
	done


TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

CamperJerrySeenText:
	text "The trainers of"
	line "this GYM use rock-"
	cont "type #MON."

	para "The rock-type has"
	line "high DEFENSE."

	para "Battles could end"
	line "up going a long"

	para "time. Are you"
	line "ready for this?"
	done

CamperJerryBeatenText:
	text "I have to win"
	line "these battles..."
	done

CamperJerryAfterBattleText:
	text "Hey, you!"
	line "RODNEY is tough."

	para "He'll punish"
	line "you if you"

	para "don't take him"
	line "seriously."
	done

SouthGym_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  08,  19, CITY_SOUTH, 2
	warp_event  09,  19, CITY_SOUTH, 2

	def_coord_events

	def_bg_events	
	bg_event 38,  42, BGEVENT_READ, CitySouthPlayersHouseSign
	bg_event 25,  14, BGEVENT_READ, CitySouthGymSign

	def_object_events
	object_event  08,  01, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SouthGymRodneyScript, -1
	object_event  06,  15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, SouthGymJoey, EVENT_BEAT_YOUNGSTER_JOEY
	object_event  10,  13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	