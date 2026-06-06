	object_const_def
	const CENTRALCAFE_CLEA
	const CENTRALCAFE_CARRIE
	const CENTRALCAFE_BRIDGET
	const CENTRALCAFE_VICTORIA
	const CENTRALCAFE_SAMANTHA
	const CENTRALCAFE_CLEFAIRY
	const CENTRALCAFE_JIGGLYPUFF
	const CENTRALCAFE_VULPIX

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
	text "Clea: Oh,"
	line "hello there."

	para "If you want a"
	line "drink, try the"
	cont "counter?"

	para "..."

	para "Oh!"
	line "A Challenger!"

	para "Well then..."

	para "My name is Clea."

	para "I'm both the"
	line "leader and owner"
	cont "of this cafe."

	para "Well, I need to"
	line "get a fresh."
	cont "drink anyways."

	para "Let's do this."
	done

CleaWinLossText:
	text "Clea: Well then!"

	para "That was"
	line "excellent!"

	para "Go ahead--take"
	line "this badge."
	done

ReceivedCleaBadgeText:
	text "<PLAYER> received"
	line "a badge."
	done

CleaBadgeText:
	text "Clea: <PLAY_G>,"
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
	text "Clea: You"
	line "should head north"

	para "and face more"
	line "strong trainers."
	done


TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end


TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end


LassCarrieSeenText:
	text "Waiter!"

	para "Another Cofee"
	line "please!"

	para "Oh, you're a"
	line "trainer!"
	done

LassCarrieBeatenText:
	text "Darn. I thought"
	line "you were weak.."
	done

LassCarrieAfterBattleText:
	text "Clea's Cafe"
	line "is just the best!"
	done

LassBridgetSeenText:
	text "I like cute #-"
	line "MON better than"
	cont "strong #mon."

	para "But I have strong"
	line "and cute #mon!"
	done

LassBridgetBeatenText:
	text "Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "I'm trying to beat"
	line "Clea, but..."
	cont "It's depressing."

	para "I'm okay! If I"
	line "lose, I'll just"

	para "try harder next"
	line "time!"
	done

BeautyVictoriaSeenText:
	text "Oh, you are a cute"
	line "little trainer!"

	para "I like you, but I"
	line "won't hold back!"
	done

BeautyVictoriaBeatenText:
	text "Let's see... Oops,"
	line "it's over?"
	done

BeautyVictoriaAfterBattleText:
	text "Wow, you must be"
	line "good to beat me!"
	cont "Keep it up!"
	done

BeautySamanthaSeenText:
	text "Give it your best"
	line "shot, or I'll take"
	cont "you down!"
	done

BeautySamanthaBeatenText:
	text "No!"
	line "I'm so sorry!"
	done

BeautySamanthaAfterBattleText:
	text "I taught them"
	line "moves for taking"
	cont "on any type..."
	done


CentralCafeClefairy:
	cry CLEFAIRY
	end

CentralCafeJigglypuff:
	cry JIGGLYPUFF
	end

CentralCafeVulpix:
	cry VULPIX
	end

CentralCafe_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  14,  19, CENTRAL_CITY, 3
	warp_event  15,  19, CENTRAL_CITY, 3

	def_coord_events

	def_bg_events	
	

	def_object_events
	object_event  01,  03, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CentralGymCleaScript, -1
	object_event  16,  13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, TrainerLassCarrie, -1
	object_event  10,  10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  07,  06, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerBeautyVictoria, -1
	object_event  03,  16, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBeautySamantha, -1
	object_event  06, 01, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CentralCafeClefairy, -1
	object_event  12, 19, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CentralCafeJigglypuff, -1
	object_event  19, 12, SPRITE_VULPIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CentralCafeVulpix, -1
