	object_const_def
	const OLIVINELIGHTHOUSE5F_SAILOR
	const OLIVINELIGHTHOUSE5F_YOUNGSTER
	const OLIVINELIGHTHOUSE5F_POKE_BALL1
	const OLIVINELIGHTHOUSE5F_POKE_BALL2
	const OLIVINELIGHTHOUSE5F_POKE_BALL3
	const OLIVINELIGHTHOUSE5F_BIRDER

OlivineLighthouse5F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperDenis:
	trainer BIRDERS, THEOANDDEN, EVENT_BEAT_BIRDERS_THEO_DEN, BirdersTheoDenSeenText, BirdersTheoDenBeatenText, 0, .Script

.Script:
	trainerafter BirdersTheoDenAfterBattleText

TrainerSailorErnest:
	trainer SAILOR, ERNEST, EVENT_BEAT_SAILOR_ERNEST, SailorErnestSeenText, SailorErnestBeatenText, 0, .Script

.Script:
	trainerafter SailorErnestAfterBattleText

OlivineLighthouse5FRareCandy:
	itemball RARE_CANDY

OlivineLighthouse5FSuperRepel:
	itemball SUPER_REPEL

OlivineLighthouse5FTMSwagger:
	itemball TM_HYPER_VOICE

OlivineLighthouse5FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_OLIVINE_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION

SailorErnestSeenText:
	text "I wanted to battle"
	line "Jasmine, but she's"

	para "not up to it now."
	line "So, how about you?"
	done

SailorErnestBeatenText:
	text "Whoa, whoa. You're"
	line "overwhelming!"
	done

SailorErnestAfterBattleText:
	text "A Gym Leader isn't"
	line "just about being"

	para "strong. A Leader"
	line "also needs to be"
	cont "compassionate."
	done

TrainerBirdersTheo:
	trainer BIRDERS, THEOANDDEN, EVENT_BEAT_BIRDERS_THEO_DEN, BirdersTheoDenSeenText, BirdersTheoDenBeatenText, 0, .Script

.Script:
	trainerafter BirdersTheoDenAfterBattleText

BirdersTheoDenSeenText:
	text "Theo: From up here"
	line "we watch the sea"
	cont "birds fly."

	para "Den: Our birds"
	line "fly together!"
	done

BirdersTheoDenBeatenText:
	text "Den: Shot down…"
	done

BirdersTheoDenAfterBattleText:
	text "Theo: Sick #mon"
	line "can't light the"
	cont "lighthouse lamp."

	para "Den: Someone has"
	line "to help it!"
	done

OlivineLighthouse5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_6F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_4F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_4F, 3
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_4F, 9
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_4F, 10
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_6F, 2
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_6F, 3

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_ITEM, OlivineLighthouse5FHiddenHyperPotion

	def_object_events
	object_event  8, 11, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorErnest, -1
	object_event  4,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperDenis, -1
	object_event 15, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FRareCandy, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY
	object_event  6, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FSuperRepel, EVENT_OLIVINE_LIGHTHOUSE_5F_SUPER_REPEL
	object_event  2, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FTMSwagger, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_SWAGGER
	object_event  4,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdersTheo, -1
