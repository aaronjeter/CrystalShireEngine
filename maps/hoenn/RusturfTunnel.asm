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
	trainer GRUNTM, RUSTTURF_GRUNT1, EVENT_BEAT_RUSTTURF_ROCKET1, RusturfGrunt1SeenText, RusturfGrunt1BeatenText, 0, .Script

.Script:
	opentext
	writetext RusturfGrunt1AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear RUSTURF_GRUNT1
	special FadeInFromBlack
	end

RusturfGrunt1SeenText:
	text "Oh, hello there!"

	para "You walked into"
	line "the wrong cave,"
	cont "huh?"
	done

RusturfGrunt1BeatenText:
	text "What!!"
	line "How?"
	done

RusturfGrunt1AfterBattleText:
	text "Ugh, I hate"
	line "this stupid cave."

	para "I'd better"
	line "report in!"
	done

RusturfGrunt2Script:
	trainer GRUNTM, RUSTTURF_GRUNT2, EVENT_BEAT_RUSTTURF_ROCKET2, RusturfGrunt2SeenText, RusturfGrunt2BeatenText, 0, .Script

.Script:
	opentext
	writetext RusturfGrunt2AfterBattleText
	waitbutton
	closetext
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
	trainer GRUNTF, RUSTTURF_GRUNTF1, EVENT_BEAT_RUSTTURF_ROCKET3, RusturfGrunt3SeenText, RusturfGrunt3BeatenText, 0, .Script

.Script:
	opentext
	writetext RusturfGrunt3AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear RUSTURF_GRUNT3
	special FadeInFromBlack
	end

RusturfGrunt3SeenText:
	text "Oh my..."

	para "No one crosses"
	line "Team Rocket."

	para "This is going"
	line "to hurt!"
	done

RusturfGrunt3BeatenText:
	text "..."
	done

RusturfGrunt3AfterBattleText:
	text "I'll never make"
	line "it to New"
	cont "Mauville now..."

	para "I'd better"
	line "cheese it."
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
	object_event  07, 08, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, RusturfGrunt1Script, EVENT_BEAT_RUSTTURF_ROCKET1
	object_event  09, 06, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, RusturfGrunt2Script, EVENT_BEAT_RUSTTURF_ROCKET2
	object_event  15, 06, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, RusturfGrunt3Script, EVENT_BEAT_RUSTTURF_ROCKET3
	