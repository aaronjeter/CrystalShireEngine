	object_const_def
	const RUSTURF_ROCK
	const RUSTURF_GRUNT1
	const RUSTURF_GRUNT2
	const RUSTURF_GRUNT3

RusturfTunnel_MapScripts:
	def_scene_scripts

	def_callbacks	

RusturfRock:
	jumpstd SmashRockScript

RusturfGrunt1Script:
	trainer GRUNTS, GRUNTS_RUSTURF, EVENT_BEAT_GRUNTS_RUSTURF, GruntsRusturfSeenText, GruntsRusturfBeatenText, 0, .Script

.Script:
	opentrainerdialog
	writetext GruntsRusturfAfterBattleText
	waitbutton
	closedialog
	special FadeOutToBlack
	disappear RUSTURF_GRUNT1
	disappear RUSTURF_GRUNT3
	special FadeInFromBlack
	end

RusturfGrunt2Script:
	trainer GRUNTM, RUSTTURF_GRUNT2, EVENT_BEAT_RUSTTURF_ROCKET2, RusturfGrunt2SeenText, RusturfGrunt2BeatenText, 0, .Script

.Script:
	opentrainerdialog
	writetext RusturfGrunt2AfterBattleText
	waitbutton
	closedialog
	special FadeOutToBlack
	disappear RUSTURF_GRUNT2
	special FadeInFromBlack
	end

RusturfGrunt2SeenText:
	text "Oh, a kid!"

	para "Gimmie your"
	line "lunch money,"
	cont "twerp!"
	done

RusturfGrunt2BeatenText:
	text "Dang it!"
	done

RusturfGrunt2AfterBattleText:
	text "Stupid caves!"
	line "Stupid Rock-"
	cont "slides!"

	para "How are we"
	line "supposed to"

	para "join up with"
	line "the rest now?"
	done


RusturfGrunt3Script:
	trainer GRUNTS, GRUNTS_RUSTURF, EVENT_BEAT_GRUNTS_RUSTURF, GruntsRusturfSeenText, GruntsRusturfBeatenText, 0, .Script

.Script:
	opentrainerdialog
	writetext GruntsRusturfAfterBattleText
	waitbutton
	closedialog
	special FadeOutToBlack
	disappear RUSTURF_GRUNT1
	disappear RUSTURF_GRUNT3
	special FadeInFromBlack
	end

RusturfPearl:
	itemball PEARL

RusturfRareCandy:
	itemball RARE_CANDY

GruntsRusturfSeenText:
	text "Alex: Wrong cave,"
	line "kid!"

	para "Lisa: No one"
	line "crosses Team"
	cont "Rocket!"
	done

GruntsRusturfBeatenText:
	text "Lisa: …"
	done

GruntsRusturfAfterBattleText:
	text "Alex: I hate this"
	line "stupid cave!"

	para "Lisa: We'll never"
	line "make it to New"
	cont "Mauville now…"
	done

RusturfTunnel_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  7, 11, ROUTE_116, 1
	warp_event 33, 15, VERDANTURF_TOWN, 1
	;warp_event  3, 21, ROUTE_116, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  16, 06, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RusturfRock, -1
	object_event  7,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, RusturfGrunt1Script, EVENT_BEAT_GRUNTS_RUSTURF
	object_event  09, 06, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, RusturfGrunt2Script, EVENT_BEAT_RUSTTURF_ROCKET2
	object_event  6,  8, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, RusturfGrunt3Script, EVENT_BEAT_GRUNTS_RUSTURF
	object_event  05, 04, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RusturfPearl, EVENT_RUSTTURF_PEARL
	object_event  19, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RusturfRareCandy, EVENT_RUSTTURF_RARE_CANDY
	
