	object_const_def
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route20ClearRocksCallback

Route20ClearRocksCallback:
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	endcallback

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	trainerafter SwimmerfNicoleAfterBattleText

TrainerSwimmerfLori:
	trainer SWIMMERS, CAMANDLIV, EVENT_BEAT_SWIMMERS_CAM_LIV, SwimmersCamLivSeenText, SwimmersCamLivBeatenText, 0, .Script

.Script:
	trainerafter SwimmersCamLivAfterBattleText

TrainerSwimmermCameron:
	trainer SWIMMERS, CAMANDLIV, EVENT_BEAT_SWIMMERS_CAM_LIV, SwimmersCamLivSeenText, SwimmersCamLivBeatenText, 0, .Script

.Script:
	trainerafter SwimmersCamLivAfterBattleText

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerfNicoleSeenText:
	text "I feel so much"
	line "lighter in water."
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Swimming exercises"
	line "your full body."

	para "It's really good"
	line "for you."
	done

CinnabarGymSignText:
	text "What does this"
	line "sign say?"

	para "Cinnabar Gym"
	line "Leader: Blaine"
	done

SwimmersCamLivSeenText:
	text "Liv: Cam, someone"
	line "is surfing by!"

	para "Cam: Let's make a"
	line "splash!"
	done

SwimmersCamLivBeatenText:
	text "Cam: Sunk…"
	done

SwimmersCamLivAfterBattleText:
	text "Liv: Swimming in"
	line "pairs is safer."
	done

Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 38,  7, SEAFOAM_GYM, 1

	def_coord_events

	def_bg_events
	bg_event 37, 11, BGEVENT_READ, CinnabarGymSign

	def_object_events
	object_event 52,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 12, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 12, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
