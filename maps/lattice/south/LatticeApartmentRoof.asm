	object_const_def
	const LATTICEROOF_MARINA
	const LATTICEROOF_YOUNGSTER

LatticeApartmentRoof_MapScripts:
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

TrainerCooltrainerFMarinaSeenText:
	text "I heard there's"
	line "tournament coming"

	para "up soon."
	line "I'll be ready!"
	done

TrainerCooltrainerFMarinaBeatenText:
	text "Well Fought!"
	line "I needed a "
	cont "good challenge."	
	done

TrainerCooltrainerFMarinaAfterBattleText:
	text "I'm training"
	line "to take on the"
	cont "Judges."

	para "Maybe we'll "
	line "meet again!"
	done


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
	text "I'm gonna win"
	line "the cup!"
	done

TrainerYoungsterRonaldBeatenText:
	text "Yikes!"
	line "You're really "
	cont "strong."	
	done

TrainerYoungsterRonaldAfterBattleText:
	text "I'm training"
	line "for the"
	cont "Lattice Cup."

	para "You should "
	line "compete!"
	done

LatticeApartmentRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  1, LATTICE_APARTMENT_3F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 03, 01, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerFMarina, -1
	object_event 00, 08, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerYoungsterRonald, -1
