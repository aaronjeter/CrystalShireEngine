	object_const_def
	const TESTROOM_GOROCHU
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

Testroom_Gorochu:
	cry GOROCHU
	opentext
	givepoke GOROCHU, 5
	closetext
	disappear TESTROOM_GOROCHU
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
	writetext TestroomRareCandyText
	yesorno
	iffalse .Done
	verbosegiveitem RARE_CANDY, 99
	disappear TESTROOM_CANDY
	.Done
	closetext	
	end

Testroom_Guy:
	faceplayer
	opentext
	writetext WelcomeToTheTestroomText
	waitbutton
	closetext
	end

Testroom_Kris:
	faceplayer
	opentext

	checkevent EVENT_LEVELCAPS_ENABLED
	iffalse .SkipLevelCaps 

	writetext TestroomLevelcapsOffText
	yesorno
	iffalse .Done

	clearflag EVENT_LEVELCAPS_ENABLED
	setval 100
	writemem wLevelCap
	writetext TestroomlevelcapsDeactivatedText
	waitbutton
	sjump .Done

.SkipLevelCaps 
	writetext TestroomLevelcapsAlreadyOffText
	waitbutton

.Done
	closetext
	end

Testroom_Mom:
	faceplayer
	opentext

	checkevent EVENT_HARDMODE_ENABLED
	iftrue .AskTurnOffHardmode

	writetext TestroomHardmodeOnText
	yesorno
	iffalse .Done

	;turn on hard mode
	setevent EVENT_HARDMODE_ENABLED
	setval 0 ;yes, hardmode on == 0, this does seem backwards
	writemem wHardMode
	writetext TestroomHardmodeActivatedText
	waitbutton
	sjump .Done
	

.AskTurnOffHardmode
	writetext TestroomHardmodeOffText
	yesorno
	iffalse .Done

	;turn off hard mode
	writetext TestroomHardmodeTauntText
	waitbutton
	clearevent EVENT_HARDMODE_ENABLED
	setval 1
	writemem wHardMode
	writetext TestroomHardmodeDeactivatedText
	waitbutton
	sjump .Done

.Done
	closetext
	end

TestroomRareCandyText:
	text "Do you want"
	line "the RARE CANDY"
	cont "cheat?"
	done


TestroomHardmodeOnText:
	text "Do you want"
	line "to turn on"
	cont "Hardmode?"
	done

TestroomHardmodeOffText:
	text "Do you want"
	line "to turn off"
	cont "Hardmode?"
	done

TestroomHardmodeDeactivatedText:
	text "Hardmode"
	line "deactivated!"
	done

TestroomHardmodeActivatedText:
	text "Hardmode"
	line "activated!"
	done

TestroomlevelcapsDeactivatedText:
	text "Level Caps"
	line "deactivated!"
	done

TestroomHardmodeTauntText:
	text "Don't worry."

	para "I won't judge"
	line "you."

	para "..."

	para "Well, I'll"
	line "judge you a"
	cont "little..."
	done

TestroomLevelcapsAlreadyOffText:
	text "Your level caps"
	line "are already off."

	para "I've got nothing"
	line "for you."
	done

TestroomLevelcapsOffText:
	text "Do you want"
	line "to turn off"
	cont "Level Caps?"

	para "You won't be"
	line "able to turn"

	para "them back on."
	line "Ever..."
	done

WelcomeToTheTestroomText:
	text "Hi, welcome to"
	line "the TEST ROOM!"

	para "I keep stuff"
	line "here to test"
	cont "the game with."

	para "Using it is"
	line "technically"
	cont "a cheat."

	para "But I won't"
	line "tell on you."

	para "Have fun!"
	done

TestRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  19, 18, ELMS_LAB, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 00, 01, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Testroom_Gorochu, -1
	object_event 02, 01, SPRITE_REGIROCK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Testroom_Regirock, -1
	object_event 04, 01, SPRITE_REGISTEEL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Testroom_Registeel, -1
	object_event 06, 01, SPRITE_LATIOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Latios, -1
	object_event 08, 01, SPRITE_KYOGRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Testroom_Kyogre, -1
	object_event 10, 01, SPRITE_GROUDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Groudon, -1
	object_event 12, 01, SPRITE_RAYQUAZA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Testroom_Rayquaza, -1
	object_event 14, 01, SPRITE_JIRACHI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Testroom_Jirachi, -1
	object_event 19, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Testroom_Candy, -1
	object_event 19, 17, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, Testroom_Guy, -1
	object_event 15, 15, SPRITE_MOM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, Testroom_Mom, -1
	object_event 14, 15, SPRITE_KRIS_BIKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, Testroom_Kris, -1
