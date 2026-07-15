	object_const_def
	const FORTREEGYM_WINONA

FortreeGym_MapScripts:
	def_scene_scripts

	def_callbacks	


FortreeGymWinonaScript:
	faceplayer	
	checkflag ENGINE_FEATHERBADGE
	iftrue .FightDone
	opentext
	writetext WinonaText_PreFight
	promptbutton
	closetext
	scall WinonaFight
	opentext
	scall WinonaGiveBadge
	scall WinonaGiveTm
	writetext WinonaPostBattleText
	promptbutton
	closetext
	end

.FightDone:	
	opentext
	scall WinonaGiveTm
	closetext
	scall WinonaRematch
	end

WinonaRematch:
	opentext
	writetext WinonaRematchText
	yesorno
	iffalse .FightDone
	closetext
	scall WinonaFight
	opentext
.FightDone:	
	writetext WinonaPostBattleText
	promptbutton
.EndRematch:
	closetext
	end

WinonaGiveTm:
	checkitem TM_AERIAL_ACE
	iftrue .Done
	writetext WinonaExplainTMText
	promptbutton
	verbosegiveitem TM_AERIAL_ACE
.Done	
	end

WinonaGiveBadge:
	setevent EVENT_BEAT_WINONA
	opentext
	writetext WinonaText_ExplainBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FEATHERBADGE
	scall FortreeGymLevelcap
	end

WinonaFight:
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

WinonaExplainTMText:
	text "Here, take this TM"
	line "for Aerial Ace."

	para "It's a solid move"
	line "that never misses."

	para "Nothing fancy, but"
	line "it puts in work."
	done


FortreeGymHumbertScript:
	trainer BIRD_KEEPER, FORTREE_HUMBERT, EVENT_BEAT_FORTREE_HUMBERT, FortreeGymHumbertSeenText, FortreeGymHumbertBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FortreeGymHumbertAfterBattleText
	waitbutton
	closetext
	end

FortreeGymHumbertSeenText:
	text "Winona would"
	line "never lose to"
	cont "a rat like you."
	done

FortreeGymHumbertBeatenText:
	text "I couldn't"
	line "stop you."
	done

FortreeGymHumbertAfterBattleText:
	text "Winona is still"
	line "going to destroy"
	cont "you."
	done


FortreeGymJaredScript:
	trainer BIRD_KEEPER, FORTREE_JARED, EVENT_BEAT_FORTREE_JARED, FortreeGymJaredSeenText, FortreeGymJaredBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FortreeGymJaredAfterBattleText
	waitbutton
	closetext
	end

FortreeGymJaredSeenText:
	text "Behold the"
	line "elegance of"
	cont "birds!"
	done

FortreeGymJaredBeatenText:
	text "You..."
	line "You're too strong."
	done

FortreeGymJaredAfterBattleText:
	text "A trainer has to"
	line "be smart to win."
	done


FortreeGymEdwardoScript:
	trainer BIRD_KEEPER, FORTREE_EDWARDO, EVENT_BEAT_FORTREE_EDWARDO, FortreeGymEdwardoSeenText, FortreeGymEdwardoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FortreeGymEdwardoAfterBattleText
	waitbutton
	closetext
	end

FortreeGymEdwardoSeenText:
	text "Lovers of Bird"
	line "#mon aspire to"
	cont "this Gym."
	done

FortreeGymEdwardoBeatenText:
	text "You were just"
	line "too much!"
	done

FortreeGymEdwardoAfterBattleText:
	text "This world is huge"
	line "and full of tough"
	cont "trainers."

	para "One day I want"
	line "to face them all!"
	done

FortreeGymDariusScript:
	trainer BIRD_KEEPER, FORTREE_DARIUS, EVENT_BEAT_FORTREE_DARIUS, FortreeGymDariusSeenText, FortreeGymDariusBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FortreeGymDariusAfterBattleText
	waitbutton
	closetext
	end

FortreeGymDariusSeenText:
	text "There are tons"
	line "of different"
	cont "Flying #mon."

	para "It's not just"
	line "birds."
	done

FortreeGymDariusBeatenText:
	text "You really know"
	line "your stuff!"
	done

FortreeGymDariusAfterBattleText:
	text "Sure, you beat"
	line "me just fine."

	para "But Winona is"
	line "really tough!"
	done


FortreeGymAshleyScript:
	trainer PICNICKER, FORTREE_ASHLEY, EVENT_BEAT_FORTREE_ASHLEY, FortreeGymAshleySeenText, FortreeGymAshleyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FortreeGymAshleyAfterBattleText
	waitbutton
	closetext
	end

FortreeGymAshleySeenText:
	text "Winona taught"
	line "me personally."

	para "I could never"
	line "lose to you!"
	done

FortreeGymAshleyBeatenText:
	text "I still lost?"
	done

FortreeGymAshleyAfterBattleText:
	text "Thanks to Winona,"
	line "the people here"

	para "can live without"
	line "any fears!"
	done


FortreeGymFlintScript:
	trainer CAMPER, FORTREE_FLINT, EVENT_BEAT_FORTREE_FLINT, FortreeGymFlintSeenText, FortreeGymFlintBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FortreeGymFlintAfterBattleText
	waitbutton
	closetext
	end

FortreeGymFlintSeenText:
	text "There's no need"
	line "for Winona."

	para "You'll never"
	line "get past me."
	done

FortreeGymFlintBeatenText:
	text "I, uh..."
	line "didn't cut it."
	done

FortreeGymFlintAfterBattleText:
	text "Winona is cute"
	line "and strong."

	para "Watch out!"
	done

FortreeGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  16, 23, FORTREE_CITY, 3
	warp_event  17, 23, FORTREE_CITY, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 15, 02, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, FortreeGymWinonaScript, -1
	object_event 03, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, FortreeGymHumbertScript, -1
	object_event 04, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, FortreeGymJaredScript, -1
	object_event 09, 08, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_TRAINER, 3, FortreeGymEdwardoScript, -1
	object_event 02, 05, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, FortreeGymDariusScript, -1
	object_event 06, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, FortreeGymAshleyScript, -1
	object_event 06, 09, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, FortreeGymFlintScript, -1
	
