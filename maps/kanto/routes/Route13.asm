	object_const_def
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3

Route13_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	trainerafter PokefanmAlexAfterBattleText

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	trainerafter PokefanmJoshuaAfterBattleText

TrainerBirdKeeperPerry:
	trainer BIRDERS, RAYANDBRET, EVENT_BEAT_BIRDERS_RAY_BRET, BirdersRayBretSeenText, BirdersRayBretBeatenText, 0, .Script

.Script:
	trainerafter BirdersRayBretAfterBattleText

TrainerBirdKeeperBret:
	trainer BIRDERS, RAYANDBRET, EVENT_BEAT_BIRDERS_RAY_BRET, BirdersRayBretSeenText, BirdersRayBretBeatenText, 0, .Script

.Script:
	trainerafter BirdersRayBretAfterBattleText

TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	trainerafter HikerKennyAfterBattleText

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

PokefanmAlexSeenText:
	text "Bow down before my"
	line "regal #mon!"
	done

PokefanmAlexBeatenText:
	text "How… How dare you"
	line "mock royalty!"
	done

PokefanmAlexAfterBattleText:
	text "Doesn't everyone"
	line "wish to someday be"
	cont "a king?"
	done

PokefanmJoshuaSeenText:
	text "Nihihi! Would you"
	line "like to battle my"
	cont "Pikachu gang?"
	done

PokefanmJoshuaBeatenText:
	text "Pi-Pikachu!"
	done

PokefanmJoshuaAfterBattleText:
	text "You look like you"
	line "have many #mon,"

	para "but Pikachu is"
	line "still the best."
	done

HikerKennySeenText:
	text "I should go to"
	line "Rock Tunnel to get"
	cont "myself an Onix."
	done

HikerKennyBeatenText:
	text "I lost…"
	done

HikerKennyAfterBattleText:
	text "Geological fea-"
	line "tures don't appear"
	cont "to change."

	para "But they actually"
	line "change, little by"
	cont "little."
	done

Route13TrainerTipsText:
	text "Trainer Tips"

	para "Look! Right there,"
	line "at the left side"
	cont "of the post."
	done

Route13SignText:
	text "Route 13"

	para "North to Silence"
	line "Bridge"
	done

Route13DirectionsSignText:
	text "North to Lavender"
	line "Town"

	para "West to Fuchsia"
	line "City"
	done

BirdersRayBretSeenText:
	text "Ray: Our birds"
	line "fly as one!"

	para "Bret: Try to keep"
	line "up!"
	done

BirdersRayBretBeatenText:
	text "Bret: Grounded…"
	done

BirdersRayBretAfterBattleText:
	text "Ray: The fences"
	line "here make a maze."
	cont "Birds don't care!"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	def_object_events
	object_event 42,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 43,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
