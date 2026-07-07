	object_const_def
	const EVERGRANDEDUNGEONB1F_ACEM4
	const EVERGRANDEDUNGEONB1F_ACEM5
	const EVERGRANDEDUNGEONB1F_ACEM6
	const EVERGRANDEDUNGEONB1F_ACEF4
	const EVERGRANDEDUNGEONB1F_ACEF5
	const EVERGRANDEDUNGEONB1F_ACEF6

EvergrandeDungeonB1F_MapScripts:
	def_scene_scripts

	def_callbacks

EvergrandeDungeonB1FEnableBridgeScript:
	;bridge 1
	changeblock 32, 08, $99 ; LeftBridge
	changeblock 34, 08, $98 ; Bridge
	changeblock 36, 08, $98 ; Bridge
	changeblock 38, 08, $9a ; RightBridge

	;bridge 2
	changeblock 44, 24, $99 ; LeftBridge
	changeblock 46, 24, $98 ; Bridge
	changeblock 48, 24, $9a ; RightBridge
	end


EvergrandeDungeonB1FDisableBridgeScript:
	;bridge 1
	changeblock 32, 08, $95 ; LeftBridge
	changeblock 34, 08, $94 ; Bridge
	changeblock 36, 08, $94 ; Bridge
	changeblock 38, 08, $96 ; RightBridge

	;bridge 2
	changeblock 44, 24, $95 ; LeftBridge
	changeblock 46, 24, $94 ; Bridge
	changeblock 48, 24, $96 ; RightBridge
	end


GenericCooltrainerM4:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M4, EVENT_BEAT_EVERGRANDE_M4, CooltrainerM4SeenText, CooltrainerM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerM4AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerM5:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M5, EVENT_BEAT_EVERGRANDE_M5, CooltrainerM5SeenText, CooltrainerM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerM5AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerM6:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M6, EVENT_BEAT_EVERGRANDE_M6, CooltrainerM6SeenText, CooltrainerM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerM6AfterBattleText
	waitbutton
	closetext
	end


GenericCooltrainerF4:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F4, EVENT_BEAT_EVERGRANDE_F4, CooltrainerF4SeenText, CooltrainerF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerF4AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerF5:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F5, EVENT_BEAT_EVERGRANDE_F5, CooltrainerF5SeenText, CooltrainerF5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerF5AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerF6:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F6, EVENT_BEAT_EVERGRANDE_F6, CooltrainerF6SeenText, CooltrainerF6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerF6AfterBattleText
	waitbutton
	closetext
	end


CooltrainerM4SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerM4BeatenText:
	text "Yow!"
	done

CooltrainerM4AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerM5SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerM5BeatenText:
	text "Yow!"
	done

CooltrainerM5AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerM6SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerM6BeatenText:
	text "Yow!"
	done

CooltrainerM6AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerF4SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerF4BeatenText:
	text "Yow!"
	done

CooltrainerF4AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerF5SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerF5BeatenText:
	text "Yow!"
	done

CooltrainerF5AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerF6SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerF6BeatenText:
	text "Yow!"
	done

CooltrainerF6AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


EvergrandeDungeonB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 13, 05, EVERGRANDE_DUNGEON, 3
	warp_event 29, 29, EVERGRANDE_DUNGEON, 4

	warp_event 07, 35, EVERGRANDE_DUNGEON_B2F, 1
	warp_event 23, 25, EVERGRANDE_DUNGEON_B2F, 2
	warp_event 39, 35, EVERGRANDE_DUNGEON_B2F, 3
	warp_event 51, 07, EVERGRANDE_DUNGEON_B2F, 4

	def_coord_events
	;enable bridge 1
	coord_event 25, 12, -1, EvergrandeDungeonB1FEnableBridgeScript
	coord_event 43, 10, -1, EvergrandeDungeonB1FEnableBridgeScript

	;disable bridge 1
	coord_event 25, 16, -1, EvergrandeDungeonB1FDisableBridgeScript
	coord_event 43, 14, -1, EvergrandeDungeonB1FDisableBridgeScript

	;enable bridge 2
	coord_event 41, 26, -1, EvergrandeDungeonB1FEnableBridgeScript
	coord_event 53, 30, -1, EvergrandeDungeonB1FEnableBridgeScript

	;disable bridge 2
	coord_event 41, 30, -1, EvergrandeDungeonB1FDisableBridgeScript
	coord_event 53, 34, -1, EvergrandeDungeonB1FDisableBridgeScript

	def_bg_events	

	def_object_events
	object_event 08, 27, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, GenericCooltrainerM4, -1
	object_event 09, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, GenericCooltrainerM5, -1
	object_event 33, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, GenericCooltrainerM6, -1

	object_event 52, 08, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, GenericCooltrainerF4, -1
	object_event 43, 33, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_TRAINER, 3, GenericCooltrainerF5, -1
	object_event 21, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, GenericCooltrainerF6, -1
