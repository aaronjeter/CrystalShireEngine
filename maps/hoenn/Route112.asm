	object_const_def
	const MAPROUTE112_TRENT
	const MAPROUTE112_BRICE
	const MAPROUTE112_CAROL
	const MAPROUTE112_LARRY
	const MAPROUTE112_BRYANT
	const MAPROUTE112_SHAYLA
	const MAPROUTE112_FRUIT_TREE_1
	const MAPROUTE112_FRUIT_TREE_2

Route112_MapScripts:
	def_scene_scripts

	def_callbacks	

Route112TrentScript:
	trainer HIKER, ROUTE112_TRENT, EVENT_BEAT_ROUTE112_TRENT, Route112TrentSeenText, Route112TrentBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route112TrentAfterBattleText
	waitbutton
	closetext
	end

Route112TrentSeenText:
	text "Hey there!"

	para "Headed to"
	line "Fallarbor?"
	done

Route112TrentBeatenText:
	text "Aww!"
	done

Route112TrentAfterBattleText:
	text "The path here"
	line "is HOT!"
	done

Route112BriceScript:
	trainer HIKER, ROUTE112_BRICE, EVENT_BEAT_ROUTE112_BRICE, Route112BriceSeenText, Route112BriceBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route112BriceAfterBattleText
	waitbutton
	closetext
	end

Route112BriceSeenText:
	text "WHEW!"

	para "I just came"
	line "through the"
	cont "Fiery Path!"
	done

Route112BriceBeatenText:
	text "Smoked!"
	done

Route112BriceAfterBattleText:
	text "Hot caves make"
	line "me tired."

	para "Maybe it's time"
	line "for a nap."
	done


Route112CarolScript:
	trainer PICNICKER, ROUTE112_CAROL, EVENT_BEAT_ROUTE112_CAROL, Route112CarolSeenText, Route112CarolBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route112CarolAfterBattleText
	waitbutton
	closetext
	end

Route112CarolSeenText:
	text "You coming to"
	line "Lavaridge town"
	cont "as well?"
	done

Route112CarolBeatenText:
	text "Dang it!"
	done

Route112CarolAfterBattleText:
	text "I'm heading to"
	line "Lavaridge Gym."
	done


Route112LarryScript:
	trainer CAMPER, ROUTE112_LARRY, EVENT_BEAT_ROUTE112_LARRY, Route112LarrySeenText, Route112LarryBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route112LarryAfterBattleText
	waitbutton
	closetext
	end

Route112LarrySeenText:
	text "Yo!"

	para "Got a minute?"
	done

Route112LarryBeatenText:
	text "Fun!"
	done

Route112LarryAfterBattleText:
	text "I needed a"
	line "warm-up."

	para "I'm getting ready"
	line "to challenge"
	cont "Flannery."
	done


Route112BryantScript:
	trainer FIREBREATHER, ROUTE112_BRYANT, EVENT_BEAT_ROUTE112_BRYANT, Route112BryantSeenText, Route112BryantBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route112BryantAfterBattleText
	waitbutton
	closetext
	end

Route112BryantSeenText:
	text "Ah hahaha!"

	para "Burn it all down!"
	done

Route112BryantBeatenText:
	text "Woah there!"
	done

Route112BryantAfterBattleText:
	text "Ah, nothing like"
	line "a good fire!"
	done


Route112ShaylaScript:
	trainer BEAUTY, ROUTE112_SHAYLA, EVENT_BEAT_ROUTE112_SHAYLA, Route112ShaylaSeenText, Route112ShaylaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route112ShaylaAfterBattleText
	waitbutton
	closetext
	end

Route112ShaylaSeenText:
	text "Do you have any"
	line "water #mon?"
	done

Route112ShaylaBeatenText:
	text "Huh. How about"
	line "that?"
	done

Route112ShaylaAfterBattleText:
	text "You know, when"
	line "I said I just"

	para "wanted him to"
	line "be passionate"
	cont "about something..."

	para "..."

	para "I hadn't really"
	line "considered Arson"
	cont "a Thing."
	done

Route112FruitTree1:
	fruittree FRUITTREE_ROUTE_112_1

Route112FruitTree2:
	fruittree FRUITTREE_ROUTE_112_2

Route112_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  13, 31, FIERY_PATH, 1
	warp_event   5,  9, FIERY_PATH, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 24, 29, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route112TrentScript, -1
	object_event 15, 35, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route112BriceScript, -1
	object_event 22, 48, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, Route112CarolScript, -1
	object_event 28, 50, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route112LarryScript, -1
	object_event 13, 06, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route112BryantScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route112ShaylaScript, -1
	object_event  22,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route112FruitTree1, -1
	object_event  23,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route112FruitTree2, -1
	