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
	text "Don't you dare"
	line "brush me off!"

	para "It's not my fault"
	line "if you cry!"
	done

DewfordLauraBeatenText:
	text "Waaaaaaah!"
	line "I lost!"
	done

DewfordLauraAfterBattleText:
	text "I battle here"
	line "to make my heart"
	cont "stronger."
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
	text "Ufufu..."
	line "Are you lost?"
	done

DewfordLilithBeatenText:
	text "Oh, you..."

	para "I don't want"
	line "to know you!"
	done

DewfordLilithAfterBattleText:
	text "You deserve"
	line "to stay lost!"
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
	text "I'll show you"
	line "the gumption of"
	cont "a sailing man!"
	done

DewfordBrendenBeatenText:
	text "How'd this"
	line "happen?"

	para "It's not like me"
	line "to lose this way!"
	done

DewfordBrendenAfterBattleText:
	text "Oh, aye!"

	para "You're worthy"
	line "of seeing"
	cont "our GYM LEADER."
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
	text "Might is right!"
	line "Come on!"
	done

DewfordTakaoBeatenText:
	text "Not enough "
	line "power..."
	done

DewfordTakaoAfterBattleText:
	text "Your skill"
	line "overcame my"
	cont "strength!"

	para "Your technique"
	line "is commendable!"
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
	text "If you mean  "
	line "to pass, it"
	cont "has to be"
	cont "through me!"
	done

DewfordCristianBeatenText:
	text "Grrrrr!"
	line "Overpowered!"
	done

DewfordCristianAfterBattleText:
	text "You win!"

	para "Go after"
	line "that BADGE!"
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
	text "There's no need"
	line "for BRAWLY to be"
	cont "involved!"

	para "I'll crush you!"
	done

DewfordJocelynBeatenText:
	text "But... How?"

	para "How could I"
	line "lose so easily?"
	done

DewfordJocelynAfterBattleText:
	text "I'm not going"
	line "to waste this"
	cont "loss."

	para "I'll use it"
	line "to motivate me"
	cont "to train!"

	para "One day I'll"
	line "become a"
	cont "GYM LEADER!"
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
	ifgreater 13, .Hard
	ifgreater 3, .Medium
	sjump .Easy

.Hard
	winlosstext BrawlyWinLossText, 0
	loadtrainer BRAWLY, BRAWLY3
	sjump .Fight

.Medium
	winlosstext BrawlyWinLossText, 0
	loadtrainer BRAWLY, BRAWLY2
	sjump .Fight

.Easy
	winlosstext BrawlyWinLossText, 0
	loadtrainer BRAWLY, BRAWLY1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BRAWLY
	opentext
	writetext BrawlyText_ExplainBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_KNUCKLEBADGE
	scall DewfordGymLevelcap

	;disable gym trainers
	setevent EVENT_BEAT_DEWFORD_LAURA
	setevent EVENT_BEAT_DEWFORD_LILITH
	setevent EVENT_BEAT_DEWFORD_BRENDEN
	setevent EVENT_BEAT_DEWFORD_TAKAO
	setevent EVENT_BEAT_DEWFORD_CRISTIAN
	setevent EVENT_BEAT_DEWFORD_JOCELYN

	closetext
	end

.FightDone:
	writetext BrawlyRematchText
	yesorno
	iffalse .FightDoneText

	readvar VAR_BADGES
	ifgreater 13, .HardRematch
	ifgreater 3, .MediumRematch
	sjump .EasyRematch

.HardRematch
	winlosstext BrawlyRematchWinLossText, 0
	loadtrainer BRAWLY, BRAWLY3
	sjump .Rematch

.MediumRematch
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

DewfordGymLevelcap:
	jumpstd UpdateWorldLevelsScript
	end


BrawlyText_PreFight:
	text "I'm BRAWLY!"
	line "DEWFORD's"
	cont "GYM LEADER!"
	
	para "I've been churned"
	line "in the rough "
	cont "waves of these"
	cont "parts, and I've"
	cont "grown tough!"

	para "So you wanted"
	line "to challenge me?"

	para "Let me see"
	line "what you're"
	cont "made of!"
	done

BrawlyWinLossText:
	text "Whoah, wow!"

	para "You made a much"
	line "bigger splash"
	cont "than I expected!"
	done

BrawlyText_ExplainBadge:
	text "Okay, you've"
	line "got me."

	para "Take the"
	line "KNUCKLE BADGE!"

	para "It's proof"
	line "that you"
	cont "tackled my"
	cont "gym today!"
	done

BrawlyRematchText:
	text "Fight me?"
	done

BrawlyRematchWinLossText:
	text "Good Fight!"
	done

BrawlyPostBattleText:
	text "I can see your"
	line "talent becoming"
	cont "a giant wave"
	cont "to cause a storm"
	cont "of astonishment"
	cont "among TRAINERS "
	cont "one day!"
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
	