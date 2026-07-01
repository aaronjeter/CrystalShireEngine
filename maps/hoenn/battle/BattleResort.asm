	object_const_def

BattleResort_MapScripts:
	def_scene_scripts

	def_callbacks

AshGauntletSign:
	jumptext AshGauntletSignText

AshGauntletSignText:
	text "Ashen Gauntlet"

	para "Burn away your"
	line "weakness."
	done


TreetopTrialSign:
	jumptext TreetopTrialSignText

TreetopTrialSignText:
	text "Treetop Trial"

	para "Learn to Thrive."
	line "Learn to Survive."
	done

BattleResortAceScript:
	jumptextfaceplayer BattleResortAceText

BattleResortAceText:
	text "Hey, are you"
	line "qualified yet?"

	para "Only the top"
	line "sixteen trainers"
	cont "get to fight"
	cont "for the Cup."
	done

BattleResortDaisyScript:
	jumptextfaceplayer BattleResortDaisyText

BattleResortDaisyText:
	text "Oh, hi. Come to"
	line "watch the Cup?"

	para "Ah, to compete!"
	line "My little brother"
	cont "might have some-"
	cont "thing to say."
	done

BattleResortBlueScript:
	jumptextfaceplayer BattleResortBlueText

BattleResortBlueText:
	text "Yo, <PLAY_G>!"
	line "I figured you"
	cont "would be here."

	para "You may have"
	line "won my Badge,"

	para "But I'm gonna"
	line "take you down"
	cont "if me meet in"
	cont "the Cup!"
	done

BattleResortRedScript:
	jumptextfaceplayer BattleResortRedText

BattleResortRedText:
	text "..."
	done

FancyRocksSign:
	jumptext FancyRocksSignText

FancyRocksSignText:
	text "Fancy Rocks!"

	para "They'll Rock"
	line "Your World!"
	done

BattleResort_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   19, 37, BATTLE_RESORT_POKECENTER, 2
	warp_event   29, 37, BATTLE_RESORT_MART, 2
	warp_event   44, 28, TREETOP_TRIAL, 1
	warp_event   45, 28, TREETOP_TRIAL, 2
	warp_event   10, 28, ASHEN_GAUNTLET, 1
	warp_event   11, 28, ASHEN_GAUNTLET, 2
	warp_event   24, 13, WORLD_CUP_LOBBY, 2
	warp_event   24, 51, BATTLE_RESORT_HARBOR, 1
	warp_event   25, 51, BATTLE_RESORT_HARBOR, 2
	warp_event   09, 13, FANCY_ROCKS, 2


	def_coord_events

	def_bg_events	
	bg_event  14, 29, BGEVENT_READ, AshGauntletSign
	bg_event  41, 29, BGEVENT_READ, TreetopTrialSign
	bg_event  07, 13, BGEVENT_READ, FancyRocksSign

	def_object_events
	object_event 23, 22, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, BattleResortAceScript, -1
	object_event 46, 44, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleResortDaisyScript, -1
	object_event 47, 53, SPRITE_BLUE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleResortBlueScript, -1
	object_event 05, 05, SPRITE_RED, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleResortRedScript, -1
