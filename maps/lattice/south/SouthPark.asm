	object_const_def
	const SOUTHPARK_LASS1
	const SOUTHPARK_LASS2
	const SOUTHPARK_BEAUTY
	const SOUTHPARK_TWIN1
	const SOUTHPARK_TWIN2
	const SOUTHPARK_ERIKA
	const SOUTHPARK_GRIMER

SouthPark_MapScripts:
	def_scene_scripts

	def_callbacks	

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoeSeenText, TwinsJoAndZoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoeAfterBattleText
	waitbutton
	closetext
	end


SouthParkIella:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SOUTH_PARK_IELLA
	iftrue .FightDone
	writetext IellaBeforeBattleText
	waitbutton
	closetext

	winlosstext IellaBeatenText, 0
	loadtrainer ERIKA, ERIKA1

	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SOUTH_PARK_IELLA
	opentext
	writetext IellaGivesCoinsText
	promptbutton
	givecoins 10
	closetext
	end

.FightDone:	
	writetext IellaRematchText
	yesorno
	iffalse .FightDoneText

	winlosstext IellaRematchWinLossText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	sjump .EndRematch

.FightDoneText:
	writetext IellaAfterBattleText
	waitbutton
.EndRematch:
	closetext
	end

LassMichelleSeenText:
	text "Do you think a"
	line "girls-only park"
	cont "is wierd?"
	done

LassMichelleBeatenText:
	text "Oh, bleah!"
	done

LassMichelleAfterBattleText:
	text "I just got care-"
	line "less, that's all!"
	done

PicnickerTanyaSeenText:
	text "Oh, a battle?"
	line "That's kind of"
	cont "scary, but OK!"
	done

PicnickerTanyaBeatenText:
	text "Oh, that's it?"
	done

PicnickerTanyaAfterBattleText:
	text "Oh, look at all"
	line "your #MON. No"

	para "wonder I couldn't"
	line "win!"
	done

BeautyJuliaSeenText:
	text "Were you looking"
	line "at these flowers"
	cont "or at me?"
	done

BeautyJuliaBeatenText:
	text "How annoying!"
	done

BeautyJuliaAfterBattleText:
	text "How do I go about"
	line "becoming ladylike"
	cont "like Iella?"
	done

TwinsJoAndZoeSeenText:
	text "We'll show you"
	line "some #MON moves!"
	done

TwinsJoAndZoeBeatenText:
	text "Oh. We lost..."
	done

TwinsJoAndZoeAfterBattleText:
	text "We'll get you"
	line "back for this!"
	done

IellaBeforeBattleText:
	text "Iella: Hello."
	line "Lovely weather,"

	para "isn't it?"

	para "My name is Iella."
	line "I am the LEADER of"
	cont "this park club."

	para "Oh. I'm sorry, I"
	line "didn't realize"

	para "that you wished to"
	line "challenge me."

	para "Very well, but I"
	line "shall not lose."
	done

IellaBeatenText:
	text "Iella: Oh!"
	line "I concede defeat."

	para "You are remarkably"
	line "strong..."
	done

IellaRematchText:
	text "Rematch?"
	done

IellaRematchWinLossText:
	text "Delightful!"
	done

IellaAfterBattleText:
	text "Iella: Losing"
	line "leaves a bitter"
	cont "aftertaste..."
	done

IellaGivesCoinsText:
	text "Iella: Here,"

	para "You've earned"
	line "these 10 coins."
	done

SouthParkGrimer:
	cry GRIMER
	opentext
	writetext SouthParkGrimerText
	waitbutton
	closetext
	end

SouthParkGrimerText:
	text "It's happily"
	line "eating trash."
	done

SouthPark_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  12,  23, CITY_SOUTH, 5
	warp_event  13,  23, CITY_SOUTH, 6

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  10, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  06, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  08, 08, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  16, 11, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe, -1
	object_event  17, 11, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe, -1
	object_event  11, 06, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SouthParkIella, -1
	object_event  15, 18, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SouthParkGrimer, -1
