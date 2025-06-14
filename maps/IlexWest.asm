	object_const_def	
	const ILEXWEST_SUNFLORA
	const ILEXWEST_HYPNO
	const ILEXWEST_COOLTRAINERF
	const ILEXWEST_YOUNGSTER

IlexWest_MapScripts:
	def_scene_scripts

	def_callbacks	

TrainerCooltrainerFMarina:
	trainer COOLTRAINERF, MARINA1, EVENT_BEAT_ILEX_MARINA, TrainerCooltrainerFMarinaSeenText, TrainerCooltrainerFMarinaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerCooltrainerFMarinaAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterRonald:
	trainer YOUNGSTER, RONALD1, EVENT_BEAT_ILEX_RONALD, TrainerYoungsterRonaldSeenText, TrainerYoungsterRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerYoungsterRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterRonaldSeenText:
	text "I'm looking for"
	line "rare #MON."

	para "I think the"
	line "forest hides one."
	done

TrainerYoungsterRonaldBeatenText:
	text "Yikes!"
	line "You're really "
	cont "strong."	
	done

TrainerYoungsterRonaldAfterBattleText:
	text "I'm training"
	line "for the"
	cont "JOHTO GAMES."

	para "You should "
	line "compete!"
	done

TrainerCooltrainerFMarinaSeenText:
	text "I heard there's"
	line "a rare #MON"

	para "hidden around"
	line "here somewhere"
	done

TrainerCooltrainerFMarinaBeatenText:
	text "Well Fought!"
	line "I needed a "
	cont "good challenge."	
	done

TrainerCooltrainerFMarinaAfterBattleText:
	text "I'm training"
	line "to take on the"
	cont "Elite Four."

	para "Maybe we'll "
	line "meet again!"
	done

IlexWestBarrierWeakenedText:
	text "You feel the"
	line "shadows shift."
	done

IlexWest_Sunflora:
	cry SUNFLORA
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon SUNFLORA, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_SUNFLORA
	disappear ILEXWEST_SUNFLORA
	opentext
	writetext IlexWestBarrierWeakenedText
	waitbutton
	closetext
	end

IlexWest_Hypno:
	cry HYPNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon HYPNO, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_HYPNO
	disappear ILEXWEST_HYPNO
	opentext
	writetext IlexWestBarrierWeakenedText
	waitbutton
	closetext
	end

IlexWest_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  39, 34, ILEX_FOREST, 4
	warp_event  39, 35, ILEX_FOREST, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  3,  0, SPRITE_SUNFLORA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexWest_Sunflora, EVENT_DEFEATED_CELEBI_GUARDIAN_SUNFLORA
	object_event 17, 36, SPRITE_HYPNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexWest_Hypno, EVENT_DEFEATED_CELEBI_GUARDIAN_HYPNO
	object_event 22, 33, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerFMarina, -1
	object_event 39, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerYoungsterRonald, -1
	