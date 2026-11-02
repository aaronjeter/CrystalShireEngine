	object_const_def
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2

Route6_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmRex:
	trainer POKEFANS, REXANDANN, EVENT_BEAT_POKEFANS_REX_ANN, PokefansRexAnnSeenText, PokefansRexAnnBeatenText, 0, .Script

.Script:
	trainerafter PokefansRexAnnAfterBattleText

TrainerPokefanmAllan:
	trainer POKEFANS, REXANDANN, EVENT_BEAT_POKEFANS_REX_ANN, PokefansRexAnnSeenText, PokefansRexAnnBeatenText, 0, .Script

.Script:
	trainerafter PokefansRexAnnAfterBattleText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6UndergroundPathSignText:
	text "Underground Path"

	para "Cerulean City -"
	line "Vermilion City"
	done

PokefansRexAnnSeenText:
	text "Rex: Ann, show"
	line "them our babies!"

	para "Ann: With joy,"
	line "dear!"
	done

PokefansRexAnnBeatenText:
	text "Ann: My poor"
	line "sweeties…"
	done

PokefansRexAnnAfterBattleText:
	text "Rex: We dress our"
	line "#mon to match."
	done

Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6,  1, SAFFRON_SOUTH_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 19,  5, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event  9, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	object_event 10, 12, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
