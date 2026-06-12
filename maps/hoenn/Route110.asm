	object_const_def
	const MAPROUTE110_ISABEL
	const MAPROUTE110_KALEB
	const MAPROUTE110_TIMMY
	const MAPROUTE110_EDWIN
	const MAPROUTE110_JOSEPH
	const MAPROUTE110_EDWARD
	const MAPROUTE110_DALE
	const MAPROUTE110_FRUIT_TREE_1
	const MAPROUTE110_FRUIT_TREE_2

Route110_MapScripts:
	def_scene_scripts

	def_callbacks	

Route110IsabelScript:
	trainer POKEFANF, ROUTE110_ISABEL, EVENT_BEAT_ROUTE110_ISABEL, Route110IsabelSeenText, Route110IsabelBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route110IsabelAfterBattleText
	waitbutton
	closetext
	end

Route110IsabelSeenText:
	text "Ahahaha!"

	para "I would go"
	line "anywhere to show"
	cont "off my #mon."
	done

Route110IsabelBeatenText:
	text "Oh dear."
	line "this won't do."
	done

Route110IsabelAfterBattleText:
	text "Maybe I should"
	line "just join a"
	cont "fan club?"
	done


Route110KalebScript:
	trainer POKEFANM, ROUTE110_KALEB, EVENT_BEAT_ROUTE110_KALEB, Route110KalebSeenText, Route110KalebBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route110KalebAfterBattleText
	waitbutton
	closetext
	end

Route110KalebSeenText:
	text "Cute, adorable"
	line "#mon!"
	done

Route110KalebBeatenText:
	text "Have you no pity?"
	done

Route110KalebAfterBattleText:
	text "Well done, my"
	line "pretties!"
	done


Route110TimmyScript:
	trainer YOUNGSTER, ROUTE110_TIMMY, EVENT_BEAT_ROUTE110_TIMMY, Route110TimmySeenText, Route110TimmyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route110TimmyAfterBattleText
	waitbutton
	closetext
	end

Route110TimmySeenText:
	text "I found some cool"
	line "#mon in the"
	cont "grass!"
	done

Route110TimmyBeatenText:
	text "Being cool isn't"
	line "enough."
	done

Route110TimmyAfterBattleText:
	text "It's hard to win"
	line "with #mon"
	cont "this fresh."
	done


Route110EdwinScript:
	trainer POKEFANM, ROUTE110_EDWIN, EVENT_BEAT_ROUTE110_EDWIN, Route110EdwinSeenText, Route110EdwinBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route110EdwinAfterBattleText
	waitbutton
	closetext
	end

Route110EdwinSeenText:
	text "Can I see your"
	line "#mon?"
	done

Route110EdwinBeatenText:
	text "I wanted to"
	line "finish my"
	cont "collection."
	done

Route110EdwinAfterBattleText:
	text "I'll catch em"
	line "all one day."
	done


Route110JosephScript:
	trainer GUITARIST, ROUTE110_JOSEPH, EVENT_BEAT_ROUTE110_JOSEPH, Route110JosephSeenText, Route110JosephBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route110JosephAfterBattleText
	waitbutton
	closetext
	end

Route110JosephSeenText:
	text "Okay!"
	line "Full-throttle!"
	done

Route110JosephBeatenText:
	text "You got into"
	line "the groove all"
	cont "right!"
	done

Route110JosephAfterBattleText:
	text "This isn't going"
	line "to bring me down!"
	done


Route110EdwardScript:
	trainer PSYCHIC_T, ROUTE110_EDWARD, EVENT_BEAT_ROUTE110_EDWARD, Route110EdwardSeenText, Route110EdwardBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route110EdwardAfterBattleText
	waitbutton
	closetext
	end

Route110EdwardSeenText:
	text "I have foreseen"
	line "your intentions!"

	para "I cannot possibly"
	line "lose!"
	done

Route110EdwardBeatenText:
	text "I failed to"
	line "prophesize my"
	cont "own demise!"
	done

Route110EdwardAfterBattleText:
	text "I see your future."

	para "Hmm..."
	done


Route110DaleScript:
	trainer FISHER, ROUTE110_DALE, EVENT_BEAT_ROUTE110_DALE, Route110DaleSeenText, Route110DaleBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route110DaleAfterBattleText
	waitbutton
	closetext
	end

Route110DaleSeenText:
	text "Hey!"
	done

Route110DaleBeatenText:
	text "Ugh!"
	done

Route110DaleAfterBattleText:
	text "Buzz off."
	done

Route110FruitTree1:
	fruittree FRUITTREE_ROUTE_110_1

Route110FruitTree2:
	fruittree FRUITTREE_ROUTE_110_2

Route110Sign:
	jumptext Route110SignText

Route110SignText:
	text "Route 110"

	para "South: Slateport"
	line "North: Mauville"
	cont "West: Oldale"
	done

Route110NewMauvilleSign:
	jumptext Route110NewMauvilleSignText

Route110NewMauvilleSignText:
	text "New Mauville"
	done

Route110CyclingRoadSign:
	jumptext Route110CyclingRoadSignText

Route110CyclingRoadSignText:
	text "Cycling Road"
	line "(Closed)"
	done

Route110RareCandy:
	itemball RARE_CANDY

Route110Lemonade:
	itemball LEMONADE

Route110_MapEvents:
	db 0, 0 ; filler

	def_warp_events		
	warp_event  33, 15, NEW_MAUVILLE, 1

	def_coord_events

	def_bg_events
	bg_event  05, 43, BGEVENT_READ, Route110Sign
	bg_event  17, 07, BGEVENT_READ, Route110Sign
	bg_event  32, 16, BGEVENT_READ, Route110NewMauvilleSign
	bg_event  21, 51, BGEVENT_READ, Route110CyclingRoadSign
	bg_event  17, 15, BGEVENT_READ, Route110CyclingRoadSign

	def_object_events
	object_event 02, 47, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route110IsabelScript, -1
	object_event 09, 47, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route110KalebScript, -1
	object_event 02, 51, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route110TimmyScript, -1
	object_event 12, 31, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route110EdwinScript, -1
	object_event 35, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route110JosephScript, -1
	object_event 06, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route110EdwardScript, -1
	object_event 27, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, Route110DaleScript, -1
	object_event 06, 08, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route110FruitTree1, -1
	object_event 07, 08, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route110FruitTree2, -1
	object_event 06, 36, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route110RareCandy, EVENT_ROUTE_110_RARE_CANDY
	object_event 30, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route110Lemonade, EVENT_ROUTE_110_LEMONADE
