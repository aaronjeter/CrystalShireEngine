	object_const_def
	const DEWFORDGYM_BRAWLY
	const DEWFORDGYM_LAURA
	const DEWFORDGYM_LILITH
	const DEWFORDGYM_BRENDEN
	const DEWFORDGYM_TAKAO
	const DEWFORDGYM_CRISTIAN
	const DEWFORDGYM_JOCELYN

DewfordGym_MapScripts:
	def_scene_scripts

	def_callbacks	

DewfordLaura:
	trainer BATTLE_GIRL, DEWFORD_LAURA, EVENT_BEAT_DEWFORD_LAURA, DewfordLauraSeenText, DewfordLauraBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DewfordLauraAfterBattleText
	waitbutton
	closetext
	end

DewfordLauraSeenText:
	text "With my charm"
	line "and moves,"
	cont "you'll be"
	cont "shocked!"
	done

DewfordLauraBeatenText:
	text "I'm shocked"
	line "by your power!"
	done

DewfordLauraAfterBattleText:
	text "I've heard that "
	line "MAUVILLE was"
	cont "founded by"
	cont "WATTSON."

	para "He was a TRAINER"
	line "long before us."

	para "He must know"
	line "all sorts of"
	cont "things!"
	done


DewfordLilith:
	trainer BATTLE_GIRL, DEWFORD_LILITH, EVENT_BEAT_DEWFORD_LILITH, DewfordLilithSeenText, DewfordLilithBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DewfordLilithAfterBattleText
	waitbutton
	closetext
	end

DewfordLilithSeenText:
	text "With my charm"
	line "and moves,"
	cont "you'll be"
	cont "shocked!"
	done

DewfordLilithBeatenText:
	text "I'm shocked"
	line "by your power!"
	done

DewfordLilithAfterBattleText:
	text "I've heard that "
	line "MAUVILLE was"
	cont "founded by"
	cont "WATTSON."

	para "He was a TRAINER"
	line "long before us."

	para "He must know"
	line "all sorts of"
	cont "things!"
	done


DewfordBrenden:
	trainer SAILOR, DEWFORD_BRENDEN, EVENT_BEAT_DEWFORD_BRENDEN, DewfordBrendenSeenText, DewfordBrendenBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DewfordBrendenAfterBattleText
	waitbutton
	closetext
	end

DewfordBrendenSeenText:
	text "With my charm"
	line "and moves,"
	cont "you'll be"
	cont "shocked!"
	done

DewfordBrendenBeatenText:
	text "I'm shocked"
	line "by your power!"
	done

DewfordBrendenAfterBattleText:
	text "I've heard that "
	line "MAUVILLE was"
	cont "founded by"
	cont "WATTSON."

	para "He was a TRAINER"
	line "long before us."

	para "He must know"
	line "all sorts of"
	cont "things!"
	done


DewfordTakao:
	trainer BLACKBELT_T, DEWFORD_TAKAO, EVENT_BEAT_DEWFORD_TAKAO, DewfordTakaoSeenText, DewfordTakaoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DewfordTakaoAfterBattleText
	waitbutton
	closetext
	end

DewfordTakaoSeenText:
	text "With my charm"
	line "and moves,"
	cont "you'll be"
	cont "shocked!"
	done

DewfordTakaoBeatenText:
	text "I'm shocked"
	line "by your power!"
	done

DewfordTakaoAfterBattleText:
	text "I've heard that "
	line "MAUVILLE was"
	cont "founded by"
	cont "WATTSON."

	para "He was a TRAINER"
	line "long before us."

	para "He must know"
	line "all sorts of"
	cont "things!"
	done


DewfordCristian:
	trainer BLACKBELT_T, DEWFORD_CRISTIAN, EVENT_BEAT_DEWFORD_CRISTIAN, DewfordCristianSeenText, DewfordCristianBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DewfordCristianAfterBattleText
	waitbutton
	closetext
	end

DewfordCristianSeenText:
	text "With my charm"
	line "and moves,"
	cont "you'll be"
	cont "shocked!"
	done

DewfordCristianBeatenText:
	text "I'm shocked"
	line "by your power!"
	done

DewfordCristianAfterBattleText:
	text "I've heard that "
	line "MAUVILLE was"
	cont "founded by"
	cont "WATTSON."

	para "He was a TRAINER"
	line "long before us."

	para "He must know"
	line "all sorts of"
	cont "things!"
	done


DewfordJocelyn:
	trainer BATTLE_GIRL, DEWFORD_JOCELYN, EVENT_BEAT_DEWFORD_JOCELYN, DewfordJocelynSeenText, DewfordJocelynBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DewfordJocelynAfterBattleText
	waitbutton
	closetext
	end

DewfordJocelynSeenText:
	text "With my charm"
	line "and moves,"
	cont "you'll be"
	cont "shocked!"
	done

DewfordJocelynBeatenText:
	text "I'm shocked"
	line "by your power!"
	done

DewfordJocelynAfterBattleText:
	text "I've heard that "
	line "MAUVILLE was"
	cont "founded by"
	cont "WATTSON."

	para "He was a TRAINER"
	line "long before us."

	para "He must know"
	line "all sorts of"
	cont "things!"
	done


DewfordGymBrawlyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BRAWLY
	iftrue .FightDone
	writetext BrawlyText_PreFight
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 3, .Hard
	sjump .Easy

.Hard
	winlosstext BrawlyWinLossText, 0
	loadtrainer BRAWLY, BRAWLY2
	sjump .Fight

.Easy
	winlosstext BrawlyWinLossText, 0
	loadtrainer BRAWLY, BRAWLY2
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BRAWLY
	opentext
	writetext BrawlyText_ExplainBadge
	playsound SFX_GET_BADGE
	waitsfx
	;setflag ENGINE_KNUCKLEBADGE
	readvar VAR_BADGES
	scall DewfordGymActivateRockets

	;disable gym trainers
	setevent EVENT_BEAT_DEWFORD_LAURA
	setevent EVENT_BEAT_DEWFORD_LILITH
	setevent EVENT_BEAT_DEWFORD_BRENDEN
	setevent EVENT_BEAT_DEWFORD_TAKAO
	setevent EVENT_BEAT_DEWFORD_CRISTIAN
	setevent EVENT_BEAT_DEWFORD_JOCELYN

	readmem wBaseLevel
	addval 3
	writemem wBaseLevel

	checkevent EVENT_LEVELCAPS_ENABLED
	iffalse .SkipLevelCaps 
	readmem wLevelCap
	addval 3
	writemem wLevelCap

.SkipLevelCaps:
	readmem wWildLevel
	addval 3
	writemem wWildLevel

	closetext
	end

.FightDone:
	writetext BrawlyRematchText
	yesorno
	iffalse .FightDoneText

	readvar VAR_BADGES
	ifgreater 3, .HardRematch
	sjump .EasyRematch

.HardRematch
	winlosstext BrawlyRematchWinLossText, 0
	loadtrainer BRAWLY, BRAWLY2
	sjump .Rematch

.EasyRematch
	winlosstext BrawlyRematchWinLossText, 0
	loadtrainer BRAWLY, BRAWLY1
	sjump .Rematch

.Rematch	
	startbattle
	reloadmapafterbattle
	opentext
.FightDoneText
	writetext BrawlyPostBattleText
	waitbutton
	closetext
	end

DewfordGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript


BrawlyText_PreFight:
	text "I've given up"
	line "on my plans"
	cont "for the city."
	
	para "Now I just"
	line "live to fry"
	cont "little sprouts"
	cont "like you."

	para "I'm glad you"
	line "made it this"
	cont "far."

	para "I, WATTSON,"
	line "the LEADER of"
	cont "MAUVILLE GYM,"
	cont "shall electrify"
	cont "you!"
	done

BrawlyWinLossText:
	text "Wahahahah!"

	para "Fine, I lost!"

	para "You ended up"
	line "giving me a"
	cont "thrill!"
	done

BrawlyText_ExplainBadge:
	text "Take this BADGE!"

	para "The DYNAMO BADGE"
	line "marks your"
	cont "victory here"
	cont "today!"
	done

BrawlyRematchText:
	text "Rematch?"
	done

BrawlyRematchWinLossText:
	text "Well Done!"
	done

BrawlyPostBattleText:
	text "I swell with"
	line "optimism, seeing"
	cont "a promising"
	cont "young TRAINER"
	cont "like you!"
	
	para "Wahahahah!"

	para "Go forth and"
	line "endeavor,"
	cont "youngster!"
	done

DewfordGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 27, DEWFORD_TOWN, 1
	warp_event  5, 27, DEWFORD_TOWN, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  3,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DewfordGymBrawlyScript, -1
	object_event  3, 21, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, DewfordLaura, -1
	object_event 10, 21, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, DewfordLilith, -1
	object_event 13, 17, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, DewfordBrenden, -1
	object_event  3, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, DewfordTakao, -1
	object_event  8, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, DewfordCristian, -1
	object_event 13, 05, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, DewfordJocelyn, -1
	