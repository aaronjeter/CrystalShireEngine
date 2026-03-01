	object_const_def
	const MAPROUTE105_IMANI
	const MAPROUTE105_LUIS
	const MAPROUTE105_FOSTER
	const MAPROUTE105_ANDRES
	const MAPROUTE105_JOSUE
	const MAPROUTE105_NED
	const MAPROUTE105_ELLIOT

Route105_MapScripts:
	def_scene_scripts

	def_callbacks	

Route105ImaniScript:
	trainer SWIMMERF, ROUTE105_IMANI, EVENT_BEAT_ROUTE105_IMANI, Route105ImaniSeenText, Route105ImaniBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route105ImaniAfterBattleText
	waitbutton
	closetext
	end

Route105ImaniSeenText:
	text "Hi there!"

	para "We're swimming to"
	line "DEWFORD CITY."
	done

Route105ImaniBeatenText:
	text "Nice!"

	para "You're pretty"
	line "good."
	done

Route105ImaniAfterBattleText:
	text "That was a fun"
	line "distraction."
	done


Route105LuisScript:
	trainer SWIMMERM, ROUTE105_LUIS, EVENT_BEAT_ROUTE105_LUIS, Route105LuisSeenText, Route105LuisBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route105LuisAfterBattleText
	waitbutton
	closetext
	end

Route105LuisSeenText:
	text "Hey there."

	para "Are you going"
	line "to challenge"

	para "BRAWLY as well?"
	done

Route105LuisBeatenText:
	text "That was a"
	line "good warmup!"
	done

Route105LuisAfterBattleText:
	text "I hope I'm"
	line "ready for"

	para "DEWFORD GYM."
	done


Route105FosterScript:
	trainer EXPLORER, ROUTE105_FOSTER, EVENT_BEAT_ROUTE105_FOSTER, Route105FosterSeenText, Route105FosterBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route105FosterAfterBattleText
	waitbutton
	closetext
	end

Route105FosterSeenText:
	text "Have you seen"
	line "any interesting"

	para "ruins around"
	line "here?"
	done

Route105FosterBeatenText:
	text "Oof!"
	done

Route105FosterAfterBattleText:
	text "I heard there"
	line "was something"

	para "fascinating"
	line "around here."

	para "But I just"
	line "can't find it."
	done


Route105AndresScript:
	trainer EXPLORER, ROUTE105_ANDRES, EVENT_BEAT_ROUTE105_ANDRES, Route105AndresSeenText, Route105AndresBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route105AndresAfterBattleText
	waitbutton
	closetext
	end

Route105AndresSeenText:
	text "Whoa?"

	para "Who goes there?"
	done

Route105AndresBeatenText:
	text "You startled me!"
	done

Route105AndresAfterBattleText:
	text "I'm trying to"
	line "figure out what"

	para "the purpose of"
	line "this ruin is."

	para "But it's too"
	line "cold in there!"
	done


Route105JosueScript:
	trainer BIRD_KEEPER, ROUTE105_JOSUE, EVENT_BEAT_ROUTE105_JOSUE, Route105JosueSeenText, Route105JosueBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route105JosueAfterBattleText
	waitbutton
	closetext
	end

Route105JosueSeenText:
	text "Ahoy there!"

	para "My birds could"
	line "use a challenge!"
	done

Route105JosueBeatenText:
	text "Wow."

	para "I didn't see"
	line "that coming."
	done

Route105JosueAfterBattleText:
	text "What do you"
	line "think of my"
	cont "island?"
	done


Route105NedScript:
	trainer FISHER, ROUTE105_NED, EVENT_BEAT_ROUTE105_NED, Route105NedSeenText, Route105NedBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route105NedAfterBattleText
	waitbutton
	closetext
	end

Route105NedSeenText:
	text "Hey, you like"
	line "fishing?"
	done

Route105NedBeatenText:
	text "Woah dude!"
	done

Route105NedAfterBattleText:
	text "There's plenty"
	line "to catch here!"
	done


Route105ElliotScript:
	trainer FISHER, ROUTE105_ELLIOT, EVENT_BEAT_ROUTE105_ELLIOT, Route105ElliotSeenText, Route105ElliotBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route105ElliotAfterBattleText
	waitbutton
	closetext
	end

Route105ElliotSeenText:
	text "Hey!"

	para "This is my"
	line "secret spot!"

	para "Scram!"
	done

Route105ElliotBeatenText:
	text "Ugh!"

	para "You're not"
	line "wanted out here."
	done

Route105ElliotAfterBattleText:
	text "Buzz off."

	para "I come here"
	line "to be alone."
	done

Route105_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  9, 41, GRANITE_CAVE_B2F, 4
	warp_event  9, 19, REGICE_LAIR, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 21, 15, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route105ImaniScript, -1
	object_event 23, 15, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route105LuisScript, -1
	object_event 19, 26, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route105FosterScript, -1
	object_event 11, 20, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route105AndresScript, -1
	object_event 25, 44, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route105JosueScript, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, Route105NedScript, -1
	object_event 08, 31, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, Route105ElliotScript, -1
	