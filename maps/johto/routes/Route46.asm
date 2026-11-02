	object_const_def
	const ROUTE46_POKEFAN_M
	const ROUTE46_YOUNGSTER
	const ROUTE46_LASS
	const ROUTE46_FRUIT_TREE1
	const ROUTE46_FRUIT_TREE2
	const ROUTE46_POKE_BALL
	const ROUTE46_SANDSHREW

Route46_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, Route46MonSpritesCallback

Route46MonSpritesCallback:
	setmonsprite SPRITE_MON_1, SANDSHREW
	endcallback

TrainerCamperTed:
	trainer COUPLE, TEDANDERIN, EVENT_BEAT_COUPLE_TED_ERIN, CoupleTedErinSeenText, CoupleTedErinBeatenText, 0, .Script

.Script:
	trainerafter CoupleTedErinAfterBattleText

TrainerPicnickerErin1:
	trainer COUPLE, TEDANDERIN, EVENT_BEAT_COUPLE_TED_ERIN, CoupleTedErinSeenText, CoupleTedErinBeatenText, 0, .Script

.Script:
	trainerafter CoupleTedErinAfterBattleText

TrainerHikerBailey:
	trainer HIKER, BAILEY, EVENT_BEAT_HIKER_BAILEY, HikerBaileySeenText, HikerBaileyBeatenText, 0, .Script

.Script:
	trainerafter HikerBaileyAfterBattleText

Route46Sign:
	jumptext Route46SignText

Route46XSpeed:
	itemball X_SPEED

Route46FruitTree1:
	fruittree FRUITTREE_ROUTE_46_1

Route46FruitTree2:
	fruittree FRUITTREE_ROUTE_46_2

Route46_Sandshrew:
	cry SANDSHREW
	loadwildmon SANDSHREW, 4
	startbattle
	reloadmapafterbattle
	disappear ROUTE46_SANDSHREW
	end

HikerBaileySeenText:
	text "Awright! I'll show"
	line "you the power of"
	cont "mountain #mon!"
	done

HikerBaileyBeatenText:
	text "Mercy! You showed"
	line "me your power!"
	done

HikerBaileyAfterBattleText:
	text "It's over. I don't"
	line "mind. We hikers"
	cont "are like that."
	done

PicnickerErin2BeatenText:
	text "Aww… I keep losing"
	line "all the time!"

	para "I'll just have to"
	line "try harder!"

	para "Anyway, thanks for"
	line "battling me again"

	para "and again. Here's"
	line "that present from"
	cont "the other time."
	done

Route46SignText:
	text "Route 46"
	line "Mountain Rd. Ahead"
	done

CoupleTedErinSeenText:
	text "Ted: We camp out"
	line "here every week!"

	para "Erin: Our #mon"
	line "train together."
	cont "Battle us both!"
	done

CoupleTedErinBeatenText:
	text "Ted: Wha…?"
	line "Erin: Oh, rats!"
	done

CoupleTedErinAfterBattleText:
	text "Ted: We did our"
	line "best. No excuses."

	para "Erin: Next time,"
	line "we'll camp near a"
	cont "#mon Center!"
	done

Route46_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 33, ROUTE_29_ROUTE_46_GATE, 1
	warp_event  8, 33, ROUTE_29_ROUTE_46_GATE, 2
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_READ, Route46Sign

	def_object_events
	object_event 12, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBailey, -1
	object_event  4, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperTed, -1
	object_event  3, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerErin1, -1
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree1, -1
	object_event  8,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree2, -1
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route46XSpeed, EVENT_ROUTE_46_X_SPEED
	object_event  7, 26, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46_Sandshrew, -1
