	object_const_def
	const SAFARIWEST_GRUNT5
	const SAFARIWEST_GRUNTF4
	const SAFARIWEST_GRUNTF5
	const SAFARIWEST_JOEY
	const SAFARIWEST_CHANDLER
	const SAFARIWEST_ROSS
	const SAFARIWEST_FARFETCH_D

SafariZoneWest_MapScripts:
	def_scene_scripts

	def_callbacks	

SafariGrunt5Script:
	trainer GRUNTM, SAFARI_GRUNT5, EVENT_BEAT_SAFARI_GRUNT5, SafariGrunt5SeenText, SafariGrunt5BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGrunt5AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARIWEST_GRUNT5
	special FadeInFromBlack
	end

SafariGrunt5SeenText:
	text "I'm going to"
	line "find something"

	para "super rare and"
	line "get promoted!"
	done

SafariGrunt5BeatenText:
	text "Oof!"
	done

SafariGrunt5AfterBattleText:
	text "How dare you"
	line "mess with"

	para "Team Rocket's"
	line "schemes?"
	done


SafariGruntf4Script:
	trainer GRUNTF, SAFARI_GRUNTF4, EVENT_BEAT_SAFARI_GRUNTF4, SafariGruntf4SeenText, SafariGruntf4BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGruntf4AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARIWEST_GRUNTF4
	special FadeInFromBlack
	end

SafariGruntf4SeenText:
	text "Woah, how did"
	line "you get this"
	cont "far?"
	done

SafariGruntf4BeatenText:
	text "What the heck?"
	done

SafariGruntf4AfterBattleText:
	text "So strong."

	para "I'd better"
	line "warn the others!"
	done

SafariGruntf5Script:
	trainer GRUNTF, SAFARI_GRUNTF5, EVENT_BEAT_SAFARI_GRUNTF5, SafariGruntf5SeenText, SafariGruntf5BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGruntf5AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARIWEST_GRUNTF5
	special FadeInFromBlack
	end

SafariGruntf5SeenText:
	text "Not on my"
	line "watch!"
	done

SafariGruntf5BeatenText:
	text "How are you"
	line "this tough?"
	done

SafariGruntf5AfterBattleText:
	text "Boss is going"
	line "to shut you"
	cont "down!"
	done


SafariJoeyScript:
	trainer EXPLORER, SAFARI_JOEY, EVENT_BEAT_SAFARI_JOEY, SafariJoeySeenText, SafariJoeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SafariJoeyAfterBattleText
	waitbutton
	closetext
	end

SafariJoeySeenText:
	text "Oh, hey!"

	para "Haven't seen"
	line "anyone in a"
	cont "while."
	done

SafariJoeyBeatenText:
	text "Nice job kid!"
	done

SafariJoeyAfterBattleText:
	text "Welcome to our"
	line "little lodge!"

	para "It's home away"
	line "from home."
	done


SafariChandlerScript:
	trainer EXPLORER, SAFARI_CHANDLER, EVENT_BEAT_SAFARI_CHANDLER, SafariChandlerSeenText, SafariChandlerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SafariChandlerAfterBattleText
	waitbutton
	closetext
	end

SafariChandlerSeenText:
	text "Well hey there!"

	para "It's been way"
	line "too quiet lately."

	para "Time for a fun"
	line "little battle!"
	done

SafariChandlerBeatenText:
	text "Ah ha haa!"
	done

SafariChandlerAfterBattleText:
	text "That was fun!"

	para "You should stick"
	line "around and fish."
	done


SafariRossScript:
	trainer EXPLORER, SAFARI_ROSS, EVENT_BEAT_SAFARI_ROSS, SafariRossSeenText, SafariRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SafariRossAfterBattleText
	waitbutton
	closetext
	end

SafariRossSeenText:
	text "Ugh, kids."

	para "I came here"
	line "for the quiet."
	done

SafariRossBeatenText:
	text "..."
	done

SafariRossAfterBattleText:
	text "Can you go away?"
	done

SafariZoneWest_Farfetched:
	cry FARFETCH_D
	loadwildmon FARFETCH_D, 7
	startbattle
	reloadmapafterbattle
	disappear SAFARIWEST_FARFETCH_D
	end

SafariZoneWest_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  35, 34, SAFARI_ZONE_SOUTH, 7
	warp_event  35, 35, SAFARI_ZONE_SOUTH, 8

	warp_event  32, 04, SAFARI_ZONE_NORTH, 5
	warp_event  33, 04, SAFARI_ZONE_NORTH, 6

	warp_event  26, 04, SAFARI_ZONE_NORTH, 7
	warp_event  27, 04, SAFARI_ZONE_NORTH, 8

	warp_event  16, 17, SAFARI_HOUSE_WEST, 1
	warp_event  07, 05, SAFARI_HOUSE_SECRET, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  26, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, SafariGrunt5Script, EVENT_BEAT_SAFARI_GRUNT5
	object_event  10, 08, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, SafariGruntf4Script, EVENT_BEAT_SAFARI_GRUNTF4
	object_event  06, 06, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, SafariGruntf5Script, EVENT_BEAT_SAFARI_GRUNTF5
	object_event  14, 18, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, SafariJoeyScript, -1
	object_event  11, 22, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 2, SafariChandlerScript, -1
	object_event  17, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, SafariRossScript, -1
	object_event  06, 17, SPRITE_FARFETCH_D, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SafariZoneWest_Farfetched, -1
