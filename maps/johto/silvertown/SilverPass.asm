	object_const_def
	const SILVERPASS_HIKER_GARTH
	const SILVERPASS_COOLTRAINERM_FELIX
	const SILVERPASS_BLACKBELT_HIRO
	const SILVERPASS_COOLTRAINERF_SELENE
	const SILVERPASS_COOLTRAINERM_BRAM
	const SILVERPASS_COOLTRAINERF_MARLA

SilverPass_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHikerGarth:
	trainer HIKER, GARTH, EVENT_BEAT_SILVERPASS_GARTH, HikerGarthSeenText, HikerGarthBeatenText, 0, .Script

.Script:
	trainerafter HikerGarthAfterBattleText

TrainerCooltrainerMFelix:
	trainer COOLTRAINERM, FELIX, EVENT_BEAT_SILVERPASS_FELIX, CooltrainerMFelixSeenText, CooltrainerMFelixBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerMFelixAfterBattleText

TrainerBlackbeltHiro:
	trainer BLACKBELT_T, HIRO, EVENT_BEAT_SILVERPASS_HIRO, BlackbeltHiroSeenText, BlackbeltHiroBeatenText, 0, .Script

.Script:
	trainerafter BlackbeltHiroAfterBattleText

TrainerCooltrainerFSelene:
	trainer COOLTRAINERF, SELENE, EVENT_BEAT_SILVERPASS_SELENE, CooltrainerFSeleneSeenText, CooltrainerFSeleneBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerFSeleneAfterBattleText

TrainerCooltrainerMBram:
	trainer COOLTRAINERM, BRAM, EVENT_BEAT_SILVERPASS_BRAM, CooltrainerMBramSeenText, CooltrainerMBramBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerMBramAfterBattleText

TrainerCooltrainerFMarla:
	trainer COOLTRAINERF, MARLA, EVENT_BEAT_SILVERPASS_MARLA, CooltrainerFMarlaSeenText, CooltrainerFMarlaBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerFMarlaAfterBattleText

HikerGarthSeenText:
	text "I've climbed this"
	line "pass for thirty"
	cont "years!"
	para "Let's see how you"
	line "climb!"
	done

HikerGarthBeatenText:
	text "Ha! You're as"
	line "solid as a rock!"
	done

HikerGarthAfterBattleText:
	text "Watch your step"
	line "on the bridges."
	cont "It's a long way"
	cont "down."
	done

CooltrainerMFelixSeenText:
	text "My #mon thrive"
	line "in the dark."
	para "Do you?"
	done

CooltrainerMFelixBeatenText:
	text "You saw right"
	line "through me."
	done

CooltrainerMFelixAfterBattleText:
	text "Dark caves are a"
	line "good place to"
	cont "train. Nobody sees"
	cont "you coming."
	done

BlackbeltHiroSeenText:
	text "Hoo-hah!"
	para "I train my body in"
	line "the cold. Face my"
	cont "fighting spirit!"
	done

BlackbeltHiroBeatenText:
	text "My spirit…"
	line "It's broken!"
	done

BlackbeltHiroAfterBattleText:
	text "The cold sharpens"
	line "the mind. I'll"
	cont "train harder."
	done

CooltrainerFSeleneSeenText:
	text "I foresaw you"
	line "coming."
	para "I foresaw my win,"
	line "too."
	done

CooltrainerFSeleneBeatenText:
	text "I didn't foresee"
	line "that…"
	done

CooltrainerFSeleneAfterBattleText:
	text "The future isn't"
	line "fixed after all."
	cont "How exciting."
	done

CooltrainerMBramSeenText:
	text "I'm training with"
	line "dragons to take"
	cont "on Lance!"
	done

CooltrainerMBramBeatenText:
	text "Lance is even"
	line "stronger than you?"
	done

CooltrainerMBramAfterBattleText:
	text "If you can beat"
	line "me, maybe you can"
	cont "beat Lance."
	done

CooltrainerFMarlaSeenText:
	text "The water in this"
	line "cave is ice cold."
	para "My #mon don't"
	line "mind at all!"
	done

CooltrainerFMarlaBeatenText:
	text "You washed me"
	line "right out."
	done

CooltrainerFMarlaAfterBattleText:
	text "Silver Town is"
	line "just past here."
	cont "You're almost"
	cont "there."
	done

SilverPass_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 51, 35, ROUTE_47, 3
	warp_event 23,  5, ROUTE_48, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 49, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerGarth, -1
	object_event 47, 20, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMFelix, -1
	object_event 38, 18, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltHiro, -1
	object_event 43, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFSelene, -1
	object_event 39,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMBram, -1
	object_event 28,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFMarla, -1
