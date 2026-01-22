	object_const_def
	const JOHTOGAMES_MARINA
	const JOHTOGAMES_KLUTCH
	const JOHTOGAMES_JESS
	const JOHTOGAMES_AMAYA
	const JOHTOGAMES_DALORIC
	const JOHTOGAMES_CRYSTAL
	const JOHTOGAMES_AARON


JohtoGames_MapScripts:
	def_scene_scripts

	def_callbacks

JohtoGamesMarina:
	faceplayer
	winlosstext JohtoGamesRematchText, 0
	loadtrainer COOLTRAINERF, MARINA3
	startbattle
	reloadmapafterbattle
	end

JohtoGamesKlutch:
	faceplayer
	winlosstext JohtoGamesRematchText, 0
	loadtrainer TEACHER, KLUTCH3
	startbattle
	reloadmapafterbattle
	end

JohtoGamesJess:
	faceplayer
	winlosstext JohtoGamesRematchText, 0
	loadtrainer TEACHER, JESS2
	startbattle
	reloadmapafterbattle
	end

JohtoGamesAmaya:
	faceplayer
	winlosstext JohtoGamesRematchText, 0
	loadtrainer GRUNTF, AMAYA3
	startbattle
	reloadmapafterbattle
	end

JohtoGamesDaloric:
	faceplayer
	winlosstext JohtoGamesRematchText, 0
	loadtrainer COOLTRAINERM, DALORIC2
	startbattle
	reloadmapafterbattle
	end

JohtoGamesCrystal:
	faceplayer
	winlosstext JohtoGamesRematchText, 0
	loadtrainer COOLTRAINERM, CONTEST_CRYSTAL2
	startbattle
	reloadmapafterbattle
	end

JohtoGamesAaron:
	faceplayer
	winlosstext JohtoGamesRematchText, 0
	loadtrainer RANGERM, AARON3
	startbattle
	reloadmapafterbattle
	end

JohtoGamesRematchText:
	text "Rematch?"
	done

JohtoGames_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  00,  10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, JohtoGamesMarina, -1
	object_event  03,  09, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, JohtoGamesKlutch, -1
	object_event  06,  10, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, JohtoGamesJess, -1
	object_event  14,  09, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, JohtoGamesAmaya, -1
	object_event  20,  08, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, JohtoGamesDaloric, -1
	object_event  20,  11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, JohtoGamesCrystal, -1
	object_event  14,  03, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, JohtoGamesAaron, -1
