	object_const_def
	const EVERGRANDEDUNGEONB2F_ACEM7
	const EVERGRANDEDUNGEONB2F_ACEM8
	const EVERGRANDEDUNGEONB2F_ACEM9
	const EVERGRANDEDUNGEONB2F_ACEF7
	const EVERGRANDEDUNGEONB2F_ACEF8
	const EVERGRANDEDUNGEONB2F_ACEF9
	const EVERGRANDEDUNGEONB2F_PETRA

EvergrandeDungeonB2F_MapScripts:
	def_scene_scripts

	def_callbacks

EvergrandeDungeonB2FEnableBridgeScript:
	;bridge 1
	changeblock 14, 24, $99 ; LeftBridge
	changeblock 16, 24, $98 ; Bridge
	changeblock 18, 24, $98 ; Bridge
	changeblock 20, 24, $9a ; RightBridge

	;bridge 2
	changeblock 38, 26, $99 ; LeftBridge
	changeblock 40, 26, $98 ; Bridge
	changeblock 42, 26, $9a ; RightBridge
	end


EvergrandeDungeonB2FDisableBridgeScript:
	;bridge 1
	changeblock 14, 24, $95 ; LeftBridge
	changeblock 16, 24, $94 ; Bridge
	changeblock 18, 24, $94 ; Bridge
	changeblock 20, 24, $96 ; RightBridge

	;bridge 2
	changeblock 38, 26, $95 ; LeftBridge
	changeblock 40, 26, $94 ; Bridge
	changeblock 42, 26, $96 ; RightBridge
	end


GenericCooltrainerM7:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M7, EVENT_BEAT_EVERGRANDE_M7, CooltrainerM7SeenText, CooltrainerM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerM7AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerM8:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M8, EVENT_BEAT_EVERGRANDE_M8, CooltrainerM8SeenText, CooltrainerM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerM8AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerM9:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M9, EVENT_BEAT_EVERGRANDE_M9, CooltrainerM9SeenText, CooltrainerM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerM9AfterBattleText
	waitbutton
	closetext
	end


GenericCooltrainerF7:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F7, EVENT_BEAT_EVERGRANDE_F7, CooltrainerF7SeenText, CooltrainerF7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerF7AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerF8:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F8, EVENT_BEAT_EVERGRANDE_F8, CooltrainerF8SeenText, CooltrainerF8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerF8AfterBattleText
	waitbutton
	closetext
	end

GenericCooltrainerF9:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F9, EVENT_BEAT_EVERGRANDE_F9, CooltrainerF9SeenText, CooltrainerF9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerF9AfterBattleText
	waitbutton
	closetext
	end


CooltrainerM7SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerM7BeatenText:
	text "Yow!"
	done

CooltrainerM7AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerM8SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerM8BeatenText:
	text "Yow!"
	done

CooltrainerM8AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerM9SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerM9BeatenText:
	text "Yow!"
	done

CooltrainerM9AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerF7SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerF7BeatenText:
	text "Yow!"
	done

CooltrainerF7AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerF8SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerF8BeatenText:
	text "Yow!"
	done

CooltrainerF8AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done


CooltrainerF9SeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainerF9BeatenText:
	text "Yow!"
	done

CooltrainerF9AfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done

Djinn_PetraScript:
	cry VENUS
	opentext
	writetext Djinn_PetraText
	yesorno
	iffalse .Done
	givepoke VENUS, 40, LEFTOVERS, Djinn_PetraName, Djinn_PetraOTName
	setevent EVENT_GOT_PETRA
	disappear EVERGRANDEDUNGEONB2F_PETRA
	.Done
	closetext	
	end

Djinn_PetraName:
	db "Petra@"

Djinn_PetraOTName:
	db "Felix@" 

Djinn_PetraText:
	text "I do love a nice"
	line "labyrinth, but I"
	cont "think I'm just"
	cont "lost..."

	para "Want to go look"
	line "for a way out"
	cont "together?"

	para "Invite Petra to"
	line "join your party?"
	done


EvergrandeDungeonB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 07, 35, EVERGRANDE_DUNGEON_B1F, 3
	warp_event 23, 17, EVERGRANDE_DUNGEON_B1F, 4
	warp_event 39, 35, EVERGRANDE_DUNGEON_B1F, 5
	warp_event 53, 15, EVERGRANDE_DUNGEON_B1F, 6

	def_coord_events
	;enable bridge 1
	coord_event 07, 24, -1, EvergrandeDungeonB2FEnableBridgeScript

	;disable bridge 1
	coord_event 07, 20, -1, EvergrandeDungeonB2FDisableBridgeScript

	;enable bridge 2
	coord_event 50, 28, -1, EvergrandeDungeonB2FEnableBridgeScript

	;disable bridge 2
	coord_event 50, 34, -1, EvergrandeDungeonB2FDisableBridgeScript

	def_bg_events	

	def_object_events
	object_event 24, 09, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, GenericCooltrainerM7, -1
	object_event 16, 29, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, GenericCooltrainerM8, -1
	object_event 28, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, GenericCooltrainerM9, -1
	object_event 43, 34, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, GenericCooltrainerF7, -1
	object_event 21, 35, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_TRAINER, 3, GenericCooltrainerF8, -1
	object_event 10, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, GenericCooltrainerF9, -1
	object_event 52, 21, SPRITE_VENUS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Djinn_PetraScript, EVENT_GOT_PETRA
