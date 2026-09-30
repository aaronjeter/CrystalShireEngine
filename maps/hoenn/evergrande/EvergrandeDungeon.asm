	object_const_def
	const EVERGRANDEDUNGEON_ACEM1
	const EVERGRANDEDUNGEON_ACEM2
	const EVERGRANDEDUNGEON_ACEM3
	const EVERGRANDEDUNGEON_ACEF1
	const EVERGRANDEDUNGEON_ACEF2
	const EVERGRANDEDUNGEON_ACEF3

EvergrandeDungeon_MapScripts:
	def_scene_scripts

	def_callbacks

EvergrandeBridge1Script:
	end

EvergrandeDungeonEnableBridgeScript:
	;bridge 1
	changeblock 18, 46, $99 ; LeftBridge
	changeblock 20, 46, $98 ; Bridge
	changeblock 22, 46, $98 ; Bridge
	changeblock 24, 46, $9a ; RightBridge

	;bridge 2
	changeblock 10, 36, $99 ; LeftBridge
	changeblock 12, 36, $98 ; Bridge
	changeblock 14, 36, $9a ; RightBridge

	;bridge 3
	changeblock 30, 36, $99 ; LeftBridge
	changeblock 32, 36, $98 ; Bridge
	changeblock 34, 36, $98 ; Bridge
	changeblock 36, 36, $9a ; RightBridge

	;bridge 4
	changeblock 26, 28, $99 ; LeftBridge
	changeblock 28, 28, $98 ; Bridge
	changeblock 30, 28, $98 ; Bridge
	changeblock 32, 28, $9a ; RightBridge

	;bridge 5
	changeblock 36, 28, $99 ; LeftBridge
	changeblock 38, 28, $98 ; Bridge
	changeblock 40, 28, $9a ; RightBridge

	end


EvergrandeDungeonDisableBridgeScript:
	;bridge 1
	changeblock 18, 46, $95 ; LeftBridge
	changeblock 20, 46, $94 ; Bridge
	changeblock 22, 46, $94 ; Bridge
	changeblock 24, 46, $96 ; RightBridge

	;bridge 2
	changeblock 10, 36, $95 ; LeftBridge
	changeblock 12, 36, $94 ; Bridge
	changeblock 14, 36, $96 ; RightBridge

	;bridge 3
	changeblock 30, 36, $95 ; LeftBridge
	changeblock 32, 36, $94 ; Bridge
	changeblock 34, 36, $94 ; Bridge
	changeblock 36, 36, $96 ; RightBridge

	;bridge 4
	changeblock 26, 28, $95 ; LeftBridge
	changeblock 28, 28, $94 ; Bridge
	changeblock 30, 28, $94 ; Bridge
	changeblock 32, 28, $96 ; RightBridge

	;bridge 5
	changeblock 36, 28, $95 ; LeftBridge
	changeblock 38, 28, $94 ; Bridge
	changeblock 40, 28, $96 ; RightBridge
	end

GenericCooltrainerM1:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M1, EVENT_BEAT_EVERGRANDE_M1, CooltrainerM1SeenText, CooltrainerM1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerM1AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerM2:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M2, EVENT_BEAT_EVERGRANDE_M2, CooltrainerM2SeenText, CooltrainerM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerM2AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerM3:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M3, EVENT_BEAT_EVERGRANDE_M3, CooltrainerM3SeenText, CooltrainerM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerM3AfterBattleText
	waitbutton
	closetext
	end


GenericCooltrainerF1:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F1, EVENT_BEAT_EVERGRANDE_F1, CooltrainerF1SeenText, CooltrainerF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerF1AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerF2:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F2, EVENT_BEAT_EVERGRANDE_F2, CooltrainerF2SeenText, CooltrainerF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerF2AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerF3:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F3, EVENT_BEAT_EVERGRANDE_F3, CooltrainerF3SeenText, CooltrainerF3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerF3AfterBattleText
	waitbutton
	closetext
	end


CooltrainerM1SeenText:
	text "I raised all three"
	line "Kanto starters."

	para "Let's see if you"
	line "can handle them!"
	done

CooltrainerM1BeatenText:
	text "All three... down!"
	done

CooltrainerM1AfterBattleText:
	text "Maybe I spread"
	line "myself too thin."

	para "The Elite Four"
	line "won't go easy on"
	cont "a divided team."
	done


CooltrainerM2SeenText:
	text "I came all the way"
	line "from Johto for"
	cont "this!"

	para "Don't think I'll"
	line "go down easy!"
	done

CooltrainerM2BeatenText:
	text "Johto pride..."
	line "shattered..."
	done

CooltrainerM2AfterBattleText:
	text "Hoenn's League is"
	line "no joke."

	para "Guess I'll need"
	line "more training"
	cont "back home."
	done


CooltrainerM3SeenText:
	text "Only the strongest"
	line "make it through"
	cont "Victory Road."

	para "Prove you belong!"
	done

CooltrainerM3BeatenText:
	text "You belong here,"
	line "no doubt."
	done

CooltrainerM3AfterBattleText:
	text "Every trainer"
	line "here dreams of"
	cont "facing the Elite"
	cont "Four."

	para "Few actually"
	line "make it."
	done


CooltrainerF1SeenText:
	text "I've beaten eight"
	line "Gym Leaders."

	para "You're just one"
	line "more obstacle!"
	done

CooltrainerF1BeatenText:
	text "An obstacle I"
	line "couldn't clear..."
	done

CooltrainerF1AfterBattleText:
	text "Badges get you"
	line "in the door."

	para "Only skill gets"
	line "you through it."
	done


CooltrainerF2SeenText:
	text "Ah, a challenger!"

	para "Let's warm up"
	line "for the Elite"
	cont "Four together!"
	done

CooltrainerF2BeatenText:
	text "Some warm-up!"
	done

CooltrainerF2AfterBattleText:
	text "I heard Drake's"
	line "dragons are"
	cont "unstoppable."

	para "Better be ready!"
	done


CooltrainerF3SeenText:
	text "Sidney loves dirty"
	line "tricks."

	para "So I learned a"
	line "few of my own!"
	done

CooltrainerF3BeatenText:
	text "Tricked by you"
	line "instead..."
	done

CooltrainerF3AfterBattleText:
	text "Watch out for"
	line "Dark types in"
	cont "the League."
	done

EvergrandeDungeon_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 21, 53, EVERGRANDE_CITY, 3
	warp_event 51, 17, EVERGRANDE_CITY, 4
	warp_event 15, 25, EVERGRANDE_DUNGEON_B1F, 1
	warp_event 27, 41, EVERGRANDE_DUNGEON_B1F, 2


	def_coord_events
	;enable bridge 1
	coord_event 13, 47, -1, EvergrandeDungeonEnableBridgeScript
	coord_event 31, 47, -1, EvergrandeDungeonEnableBridgeScript

	;disable bridge 1
	coord_event 13, 50, -1, EvergrandeDungeonDisableBridgeScript
	coord_event 31, 50, -1, EvergrandeDungeonDisableBridgeScript

	;enable bridge 2
	coord_event 19, 37, -1, EvergrandeDungeonEnableBridgeScript
	coord_event 09, 29, -1, EvergrandeDungeonEnableBridgeScript

	;disable bridge 2
	coord_event 19, 40, -1, EvergrandeDungeonDisableBridgeScript

	;enable bridge 3
	coord_event 25, 37, -1, EvergrandeDungeonEnableBridgeScript
	coord_event 41, 37, -1, EvergrandeDungeonEnableBridgeScript

	;disable bridge 3
	coord_event 41, 40, -1, EvergrandeDungeonDisableBridgeScript

	;enable bridge 4
	coord_event 21, 29, -1, EvergrandeDungeonEnableBridgeScript
	coord_event 49, 29, -1, EvergrandeDungeonEnableBridgeScript

	;disable bridge 4
	coord_event 21, 32, -1, EvergrandeDungeonDisableBridgeScript
	coord_event 49, 32, -1, EvergrandeDungeonDisableBridgeScript

	def_bg_events	

	def_object_events
	object_event 23, 44, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, GenericCooltrainerM1, -1
	object_event 35, 44, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, GenericCooltrainerM2, -1
	object_event 35, 32, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, GenericCooltrainerM3, -1

	object_event 11, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, GenericCooltrainerF1, -1
	object_event 14, 30, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, GenericCooltrainerF2, -1
	object_event 32, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, GenericCooltrainerF3, -1
