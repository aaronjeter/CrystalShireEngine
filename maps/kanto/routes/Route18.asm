	object_const_def
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperBoris:
	trainer BIRDERS, ROBANDBOB, EVENT_BEAT_BIRDERS_ROB_BOB, BirdersRobBobSeenText, BirdersRobBobBeatenText, 0, .Script

.Script:
	trainerafter BirdersRobBobAfterBattleText

TrainerBirdKeeperBob:
	trainer BIRDERS, ROBANDBOB, EVENT_BEAT_BIRDERS_ROB_BOB, BirdersRobBobSeenText, BirdersRobBobBeatenText, 0, .Script

.Script:
	trainerafter BirdersRobBobAfterBattleText

Route18Sign:
	jumptext Route18SignText

Route18SignText:
	text "Route 18"

	para "Celadon City -"
	line "Fuchsia City"
	done

BirdersRobBobSeenText:
	text "Rob: Rob and Bob,"
	line "Bob and Rob!"

	para "Bob: Double birds,"
	line "double trouble!"
	done

BirdersRobBobBeatenText:
	text "Bob: Plucked…"
	done

BirdersRobBobAfterBattleText:
	text "Rob: Cycling Road"
	line "is all downhill"
	cont "from here."
	done

Route18_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  6, ROUTE_17_ROUTE_18_GATE, 3
	warp_event  2,  7, ROUTE_17_ROUTE_18_GATE, 4

	def_coord_events

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, Route18Sign

	def_object_events
	object_event 14,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
