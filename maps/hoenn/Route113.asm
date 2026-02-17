	object_const_def
	const MAPROUTE113_LAO
	const MAPROUTE113_DILLON
	const MAPROUTE113_COBY
	const MAPROUTE113_WYATT
	const MAPROUTE113_MADELINE
	const MAPROUTE113_SOPHIE
	const MAPROUTE113_JAYLEN
	const MAPROUTE113_LUNG
	const MAPROUTE113_LAWRENCE
	const MAPROUTE113_TORI
	const MAPROUTE113_TIA
	const MAPROUTE113_FRUITTREE1
	const MAPROUTE113_FRUITTREE2

Route113_MapScripts:
	def_scene_scripts

	def_callbacks	

Route113LaoScript:
	trainer YOUNGSTER, ROUTE113_LAO, EVENT_BEAT_ROUTE113_LAO, Route113LaoSeenText, Route113LaoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113LaoAfterBattleText
	waitbutton
	closetext
	end

Route113LaoSeenText:
	text "Hyaa!"
	done

Route113LaoBeatenText:
	text "I thought the"
	line "ash would help"
	cont "me surprise you."
	done

Route113LaoAfterBattleText:
	text "It's fun to hide"
	line "in the Ash!"
	done

Route113DillonScript:
	trainer YOUNGSTER, ROUTE113_DILLON, EVENT_BEAT_ROUTE113_DILLON, Route113DillonSeenText, Route113DillonBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113DillonAfterBattleText
	waitbutton
	closetext
	end

Route113DillonSeenText:
	text "Hey there!"

	para "I'm collecting"
	line "Ash to make"
	cont "glass."
	done

Route113DillonBeatenText:
	text "Ash in my eye!"
	done

Route113DillonAfterBattleText:
	text "The ash from"
	line "Mt Chimney"
	cont "gets everywhere!"
	done

Route113CobyScript:
	trainer BIRD_KEEPER, ROUTE113_COBY, EVENT_BEAT_ROUTE113_COBY, Route113CobySeenText, Route113CobyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113CobyAfterBattleText
	waitbutton
	closetext
	end

Route113CobySeenText:
	text "Go, birdies!"
	done

Route113CobyBeatenText:
	text "That sucks!"
	done

Route113CobyAfterBattleText:
	text "The ash makes"
	line "flying weird."
	done

Route113MadelineScript:
	trainer PICNICKER, ROUTE113_MADELINE, EVENT_BEAT_ROUTE113_MADELINE, Route113MadelineSeenText, Route113MadelineBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113MadelineAfterBattleText
	waitbutton
	closetext
	end

Route113MadelineSeenText:
	text "Hi, got time"
	line "for a snack?"
	done

Route113MadelineBeatenText:
	text "Lunch time?"
	done

Route113MadelineAfterBattleText:
	text "It's hard to keep"
	line "ash out of my"
	cont "food."
	done

Route113SophieScript:
	trainer PICNICKER, ROUTE113_SOPHIE, EVENT_BEAT_ROUTE113_SOPHIE, Route113SophieSeenText, Route113SophieBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113SophieAfterBattleText
	waitbutton
	closetext
	end

Route113SophieSeenText:
	text "Traveling makes"
	line "me hungry!"
	done

Route113SophieBeatenText:
	text "Whew!"
	done

Route113SophieAfterBattleText:
	text "It's a long"
	line "walk from"
	cont "Mauville."
	done

Route113WyattScript:
	trainer POKEMANIAC, ROUTE113_WYATT, EVENT_BEAT_ROUTE113_WYATT, Route113WyattSeenText, Route113WyattBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113WyattAfterBattleText
	waitbutton
	closetext
	end

Route113WyattSeenText:
	text "Behold, my"
	line "beautiful #MON"
	done

Route113WyattBeatenText:
	text "So sad!"
	done

Route113WyattAfterBattleText:
	text "My #MON"
	line "will win one day!"
	done

Route113JaylenScript:
	trainer CAMPER, ROUTE113_JAYLEN, EVENT_BEAT_ROUTE113_JAYLEN, Route113JaylenSeenText, Route113JaylenBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113JaylenAfterBattleText
	waitbutton
	closetext
	end

Route113JaylenSeenText:
	text "I'm bored!"

	para "Let's fight!"
	done

Route113JaylenBeatenText:
	text "Nice job!"
	done

Route113JaylenAfterBattleText:
	text "I got smoked."
	done

Route113LungScript:
	trainer CAMPER, ROUTE113_LUNG, EVENT_BEAT_ROUTE113_LUNG, Route113LungSeenText, Route113LungBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113LungAfterBattleText
	waitbutton
	closetext
	end

Route113LungSeenText:
	text "Let's kill"
	line "some time!"
	done

Route113LungBeatenText:
	text "Good grief."
	done

Route113LungAfterBattleText:
	text "Wow, you're"
	line "tough!"
	done

Route113LawrenceScript:
	trainer CAMPER, ROUTE113_LAWRENCE, EVENT_BEAT_ROUTE113_LAWRENCE, Route113LawrenceSeenText, Route113LawrenceBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113LawrenceAfterBattleText
	waitbutton
	closetext
	end

Route113LawrenceSeenText:
	text "Hey there!"

	para "Headed to"
	line "Fallarbor?"
	done

Route113LawrenceBeatenText:
	text "Aww!"
	done

Route113LawrenceAfterBattleText:
	text "We're almost"
	line "there."
	done

Route113ToriTiaScript:
	trainer TWINS, ROUTE113_TORITIA, EVENT_BEAT_ROUTE113_TORITIA, Route113ToriTiaSeenText, Route113ToriTiaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route113ToriTiaAfterBattleText
	waitbutton
	closetext
	end

Route113ToriTiaSeenText:
	text "Hi!"
	done

Route113ToriTiaBeatenText:
	text "Woah!"
	done

Route113ToriTiaAfterBattleText:
	text "You're way"
	line "better than us!"
	done

Route113FruitTree1:
	fruittree FRUITTREE_ROUTE_113_1

Route113FruitTree2:
	fruittree FRUITTREE_ROUTE_113_2

Route113_MapEvents:
	db 0, 0 ; filler

	def_warp_events		
	warp_event  93, 11, LAVARIDGE_DESERT, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 04, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, Route113LaoScript, -1
	object_event 12, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, Route113DillonScript, -1
	object_event 40, 05, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route113CobyScript, -1
	object_event 60, 09, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route113WyattScript, -1
	object_event 28, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route113MadelineScript, -1
	object_event 32, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route113SophieScript, -1
	object_event 28, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, Route113JaylenScript, -1
	object_event 32, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, Route113LungScript, -1
	object_event 77, 04, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route113LawrenceScript, -1
	object_event 66, 15, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_TRAINER, 1, Route113ToriTiaScript, -1
	object_event 67, 15, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_TRAINER, 1, Route113ToriTiaScript, -1
	object_event 92, 04, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route113FruitTree1, -1
	object_event 93, 04, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route113FruitTree2, -1
	