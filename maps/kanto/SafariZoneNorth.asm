	object_const_def
	const SAFARINORTH_GRUNT3
	const SAFARINORTH_GRUNTF3
	const SAFARINORTH_GRUNT4
	const SAFARINORTH_STEVEN
	const SAFARINORTH_TINA
	const SAFARINORTH_TAUROS
	const SAFARINORTH_RHYDON

SafariZoneNorth_MapScripts:
	def_scene_scripts

	def_callbacks	


SafariGrunt3Script:
	trainer GRUNTM, SAFARI_GRUNT3, EVENT_BEAT_SAFARI_GRUNT3, SafariGrunt3SeenText, SafariGrunt3BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGrunt3AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARINORTH_GRUNT3
	special FadeInFromBlack
	end

SafariGrunt3SeenText:
	text "This'll be fun!"

	para "No one has"
	line "fought back"
	cont "yet!"
	done

SafariGrunt3BeatenText:
	text "Ouch!"
	done

SafariGrunt3AfterBattleText:
	text "Dang it!"

	para "This was"
	line "supposed to be"
	cont "easy."
	done


SafariGruntf3Script:
	trainer GRUNTF, SAFARI_GRUNTF3, EVENT_BEAT_SAFARI_GRUNTF3, SafariGruntf3SeenText, SafariGruntf3BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGruntf3AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARINORTH_GRUNTF3
	special FadeInFromBlack
	end

SafariGruntf3SeenText:
	text "I am so flipping"
	line "lost!"
	done

SafariGruntf3BeatenText:
	text "How?"
	done

SafariGruntf3AfterBattleText:
	text "Screw this."

	para "I'm going home."
	done


SafariGrunt4Script:
	trainer GRUNTM, SAFARI_GRUNT4, EVENT_BEAT_SAFARI_GRUNT4, SafariGrunt4SeenText, SafariGrunt4BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGrunt4AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARINORTH_GRUNT4
	special FadeInFromBlack
	end

SafariGrunt4SeenText:
	text "This'll be fun!"

	para "No one has"
	line "fought back"
	cont "yet!"
	done

SafariGrunt4BeatenText:
	text "Ouch!"
	done

SafariGrunt4AfterBattleText:
	text "Dang it!"

	para "This was"
	line "supposed to be"
	cont "easy."
	done


SafariStevenScript:
	trainer RANGERM, SAFARI_STEVEN, EVENT_BEAT_SAFARI_STEVEN, SafariStevenSeenText, SafariStevenBeatenText, 0, .Script

.Script:
	opentext
	writetext SafariStevenAfterBattleText
	waitbutton
	closetext
	end

SafariStevenSeenText:
	text "Hey! A trainer!"
	done

SafariStevenBeatenText:
	text "Fun!"
	done

SafariStevenAfterBattleText:
	text "What's that?"

	para "Rockets?"

	para "I haven't seen"
	line "any yet."
	done


SafariTinaScript:
	trainer RANGERF, SAFARI_TINA, EVENT_BEAT_SAFARI_TINA, SafariTinaSeenText, SafariTinaBeatenText, 0, .Script

.Script:
	opentext
	writetext SafariTinaAfterBattleText
	waitbutton
	closetext
	end

SafariTinaSeenText:
	text "Hey there,"
	line "got a minute?"

	para "I'm bored"
	done

SafariTinaBeatenText:
	text "Aww, dang it!"
	done

SafariTinaAfterBattleText:
	text "Rockets?"

	para "In MY Safari?"

	para "They'd better"
	line "not be."
	done


SafariZoneNorth_Tauros:
	cry TAUROS
	loadwildmon TAUROS, 7
	startbattle
	reloadmapafterbattle
	disappear SAFARINORTH_TAUROS
	end

SafariZoneNorth_Rhydon:
	cry RHYDON
	loadwildmon RHYDON, 7
	startbattle
	reloadmapafterbattle
	disappear SAFARINORTH_RHYDON
	end

SafariZoneNorth_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  32, 55, SAFARI_ZONE_SOUTH, 5
	warp_event  33, 55, SAFARI_ZONE_SOUTH, 6

	warp_event  55, 52, SAFARI_ZONE_EAST, 3
	warp_event  55, 53, SAFARI_ZONE_EAST, 4

	warp_event  10, 55, SAFARI_ZONE_WEST, 3
	warp_event  11, 55, SAFARI_ZONE_WEST, 4

	warp_event  04, 55, SAFARI_ZONE_WEST, 5
	warp_event  05, 55, SAFARI_ZONE_WEST, 6

	warp_event  53, 07, SAFARI_HOUSE_NORTH, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  34, 38, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, SafariGrunt3Script, EVENT_BEAT_SAFARI_GRUNT3
	object_event  25, 16, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, SafariGruntf3Script, EVENT_BEAT_SAFARI_GRUNTF3
	object_event  40, 42, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, SafariGrunt4Script, EVENT_BEAT_SAFARI_GRUNT4
	object_event  55, 08, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, SafariStevenScript, -1
	object_event  42, 07, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, SafariTinaScript, -1
	object_event  14, 09, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SafariZoneNorth_Tauros, -1
	object_event  16, 44, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SafariZoneNorth_Rhydon, -1
