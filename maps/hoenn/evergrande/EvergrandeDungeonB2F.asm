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
	trainerafter CooltrainerM7AfterBattleText

GenericCooltrainerM8:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M8, EVENT_BEAT_EVERGRANDE_M8, CooltrainerM8SeenText, CooltrainerM8BeatenText, 0, .Script

.Script:
	trainerafter CooltrainerM8AfterBattleText

GenericCooltrainerM9:
	trainer COOLTRAINERM, EVERGRANDE_DUNGEON_M9, EVENT_BEAT_EVERGRANDE_M9, CooltrainerM9SeenText, CooltrainerM9BeatenText, 0, .Script

.Script:
	trainerafter CooltrainerM9AfterBattleText


GenericCooltrainerF7:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F7, EVENT_BEAT_EVERGRANDE_F7, CooltrainerF7SeenText, CooltrainerF7BeatenText, 0, .Script

.Script:
	trainerafter CooltrainerF7AfterBattleText

GenericCooltrainerF8:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F8, EVENT_BEAT_EVERGRANDE_F8, CooltrainerF8SeenText, CooltrainerF8BeatenText, 0, .Script

.Script:
	trainerafter CooltrainerF8AfterBattleText

GenericCooltrainerF9:
	trainer COOLTRAINERF, EVERGRANDE_DUNGEON_F9, EVENT_BEAT_EVERGRANDE_F9, CooltrainerF9SeenText, CooltrainerF9BeatenText, 0, .Script

.Script:
	trainerafter CooltrainerF9AfterBattleText


CooltrainerM7SeenText:
	text "I've been camping"
	line "in this cave for"
	cont "a week!"

	para "I'm more than"
	line "ready!"
	done

CooltrainerM7BeatenText:
	text "Maybe one more"
	line "week..."
	done

CooltrainerM7AfterBattleText:
	text "The deeper you"
	line "go, the tougher"
	cont "the trainers get."
	done


CooltrainerM8SeenText:
	text "Turn back now,"
	line "while you can!"

	para "The Elite Four"
	line "are on another"
	cont "level!"
	done

CooltrainerM8BeatenText:
	text "Maybe you're on"
	line "their level..."
	done

CooltrainerM8AfterBattleText:
	text "If you can beat"
	line "me, you might"
	cont "stand a chance."
	done


CooltrainerM9SeenText:
	text "You're deep in the"
	line "cave now."

	para "Think you can"
	line "find your way out?"
	done

CooltrainerM9BeatenText:
	text "Guess you can."
	done

CooltrainerM9AfterBattleText:
	text "Rest up before"
	line "the League."

	para "Once you enter,"
	line "there's no"
	cont "turning back."
	done


CooltrainerF7SeenText:
	text "I've trained for"
	line "years to get here."

	para "I won't lose now!"
	done

CooltrainerF7BeatenText:
	text "All those years..."
	done

CooltrainerF7AfterBattleText:
	text "Win or lose, I'm"
	line "proud of how far"
	cont "I've come."
	done


CooltrainerF8SeenText:
	text "Phoebe trained on"
	line "Mt. Pyre."

	para "I'm training here"
	line "to beat her!"
	done

CooltrainerF8BeatenText:
	text "Her ghosts would"
	line "have beaten me"
	cont "too..."
	done

CooltrainerF8AfterBattleText:
	text "Ghosts can't be"
	line "hit by Normal"
	cont "moves."

	para "Plan ahead for"
	line "Phoebe!"
	done


CooltrainerF9SeenText:
	text "You made it all"
	line "the way down here?"

	para "Impressive. But"
	line "this is the end"
	cont "of the line!"
	done

CooltrainerF9BeatenText:
	text "The end of MY"
	line "line, I guess."
	done

CooltrainerF9AfterBattleText:
	text "The Champion is"
	line "waiting beyond"
	cont "the Elite Four."

	para "Good luck!"
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
