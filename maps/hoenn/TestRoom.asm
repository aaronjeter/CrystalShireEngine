	object_const_def
	const TESTROOM_MEW
	const TESTROOM_REGIROCK
	const TESTROOM_REGISTEEL
	const TESTROOM_LATIOS
	const TESTROOM_KYOGRE
	const TESTROOM_GROUDON
	const TESTROOM_RAYQUAZA
	const TESTROOM_JIRACHI
	const TESTROOM_CANDY

TestRoom_MapScripts:
	def_scene_scripts

	def_callbacks	

Testroom_Mew:
	cry MEW
	opentext
	givepoke MEW, 5
	closetext
	disappear TESTROOM_MEW
	end

Testroom_Regirock:
	cry REGIROCK
	opentext
	givepoke REGIROCK, 5
	closetext
	disappear TESTROOM_REGIROCK
	end

Testroom_Registeel:
	cry REGISTEEL
	opentext
	givepoke REGISTEEL, 5
	closetext
	disappear TESTROOM_REGISTEEL
	end

Testroom_Latios:
	cry LATIOS
	opentext
	givepoke LATIOS, 5
	givepoke LATIAS, 5
	closetext
	disappear TESTROOM_LATIOS
	end

Testroom_Kyogre:
	cry KYOGRE
	opentext
	givepoke KYOGRE, 5
	closetext
	disappear TESTROOM_KYOGRE
	end

Testroom_Groudon:
	cry GROUDON
	opentext
	givepoke GROUDON, 5
	closetext
	disappear TESTROOM_GROUDON
	end

Testroom_Rayquaza:
	cry RAYQUAZA
	opentext
	givepoke RAYQUAZA, 5
	closetext
	disappear TESTROOM_RAYQUAZA
	end

Testroom_Jirachi:
	cry JIRACHI
	opentext
	givepoke JIRACHI, 5
	closetext
	disappear TESTROOM_JIRACHI
	end

Testroom_Candy:
	cry JIRACHI
	opentext
	verbosegiveitem RARE_CANDY, 50
	closetext
	disappear TESTROOM_CANDY
	end

TestRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  19, 18, ELMS_LAB, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 00, 01, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Testroom_Mew, -1
	object_event 02, 01, SPRITE_REGIROCK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Testroom_Regirock, -1
	object_event 04, 01, SPRITE_REGISTEEL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Testroom_Registeel, -1
	object_event 06, 01, SPRITE_LATIOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Latios, -1
	object_event 08, 01, SPRITE_KYOGRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Testroom_Kyogre, -1
	object_event 10, 01, SPRITE_GROUDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Groudon, -1
	object_event 12, 01, SPRITE_RAYQUAZA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Testroom_Rayquaza, -1
	object_event 14, 01, SPRITE_JIRACHI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Jirachi, -1
	object_event 19, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Testroom_Candy, -1