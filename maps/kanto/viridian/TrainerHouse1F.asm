	object_const_def
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "Welcome to Trainer"
	line "House!"

	para "Downstairs is our"
	line "Training Hall, a"

	para "challenge for new"
	line "trainers: three"
	cont "double battles in"
	cont "a row."

	para "Bring at least 4"
	line "#MON. Any kind"
	cont "can enter!"
	done

TrainerHouse1FCooltrainerMText:
	text "In a challenge,"
	line "every #MON is"
	cont "set to the same"
	cont "level."

	para "Your strongest one"
	line "won't just win on"
	cont "levels alone."

	para "Afterwards they go"
	line "right back to how"
	cont "they were."
	done

TrainerHouse1FCooltrainerFText:
	text "The order you pick"
	line "your #MON in is"
	cont "the order they go."

	para "The first two lead"
	line "off together, so"
	cont "pick a good pair!"
	done

TrainerHouse1FYoungsterText:
	text "You can't use"
	line "items from your"
	cont "PACK in a"
	cont "challenge."

	para "A held item is"
	line "fair game, though!"
	done

TrainerHouse1FGentlemanText:
	text "Each region has"
	line "challenges like"
	cont "this one."

	para "Beat the Training"
	line "Hall, and the"

	para "others around"
	line "KANTO will take"
	cont "you seriously."
	done

TrainerHouseSign1Text:
	text "Training Hall: 4"
	line "#MON, 3 double"
	cont "battles in a row."
	done

TrainerHouseSign2Text:
	text "Same level for"
	line "all. No PACK"
	cont "items. No EXP."
	done

TrainerHouseIllegibleText:
	text "…What's this?"
	line "A strategy memo?"

	para "This writing looks"
	line "like ONIX tracks…"

	para "It's completely"
	line "illegible…"
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, VIRIDIAN_CITY, 3
	warp_event  3, 13, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	def_object_events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  4,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
