	object_const_def	
	const MAPROUTE119_DONALD
	const MAPROUTE119_TAYLOR
	const MAPROUTE119_BRENT
	const MAPROUTE119_KENT
	const MAPROUTE119_GREG
	const MAPROUTE119_DOUG
	const MAPROUTE119_CHRIS
	const MAPROUTE119_JACKSON
	const MAPROUTE119_TAKASHI
	const MAPROUTE119_CATHERINE
	const MAPROUTE119_FRUITTREE1
	const MAPROUTE119_FRUITTREE2
	const MAPROUTE119_FRUITTREE3
	const MAPROUTE119_FRUITTREE4
	const MAPROUTE119_FISHER

Route119South_MapScripts:
	def_scene_scripts

	def_callbacks
	
Route119DonaldScript:
	trainer POKEMANIAC, ROUTE119_DONALD, EVENT_BEAT_ROUTE119_DONALD, Route119DonaldSeenText, Route119DonaldBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119DonaldAfterBattleText
	waitbutton
	closetext
	end

Route119DonaldSeenText:
	text "So, we finally"
	line "meet!"

	para "My bug #mon"
	line "will keep you"
	cont "company!"
	done

Route119DonaldBeatenText:
	text "I wish we'd never"
	line "met..."
	done

Route119DonaldAfterBattleText:
	text "Can you hurry up"
	line "and move?"
	done

Route119TaylorScript:
	trainer POKEMANIAC, ROUTE119_TAYLOR, EVENT_BEAT_ROUTE119_TAYLOR, Route119TaylorSeenText, Route119TaylorBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119TaylorAfterBattleText
	waitbutton
	closetext
	end

Route119TaylorSeenText:
	text "Buzz Buzz!"
	done

Route119TaylorBeatenText:
	text "If you win,"
	line "I lose!"
	done

Route119TaylorAfterBattleText:
	text "That's just"
	line "impossible..."
	done

Route119BrentScript:
	trainer POKEMANIAC, ROUTE119_BRENT, EVENT_BEAT_ROUTE119_BRENT, Route119BrentSeenText, Route119BrentBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119BrentAfterBattleText
	waitbutton
	closetext
	end

Route119BrentSeenText:
	text "I'm a bug master!"
	done

Route119BrentBeatenText:
	text "Whoopsie!"
	line "I lost!"
	done

Route119BrentAfterBattleText:
	text "You'll never"
	line "understand..."
	done

Route119KentScript:
	trainer BUG_CATCHER, ROUTE119_KENT, EVENT_BEAT_ROUTE119_KENT, Route119KentSeenText, Route119KentBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119KentAfterBattleText
	waitbutton
	closetext
	end

Route119KentSeenText:
	text "A battle starts"
	line "the instant we"
	cont "meet!"
	done

Route119KentBeatenText:
	text "I give up!"
	done

Route119KentAfterBattleText:
	text "Won't you join us?"
	done

Route119GregScript:
	trainer BUG_CATCHER, ROUTE119_GREG, EVENT_BEAT_ROUTE119_GREG, Route119GregSeenText, Route119GregBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119GregAfterBattleText
	waitbutton
	closetext
	end

Route119GregSeenText:
	text "You don't know who"
	line "I am, do you?"

	para "Well, I don't"
	line "know you either!"
	done

Route119GregBeatenText:
	text "You're pretty"
	line "strong!"
	done

Route119GregAfterBattleText:
	text "Bye now! Have a"
	line "nice life!"
	done

Route119DougScript:
	trainer BUG_CATCHER, ROUTE119_DOUG, EVENT_BEAT_ROUTE119_DOUG, Route119DougSeenText, Route119DougBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119DougAfterBattleText
	waitbutton
	closetext
	end

Route119DougSeenText:
	text "Yep, you've"
	line "finally caught me!"
	done

Route119DougBeatenText:
	text "Whoop, that was a"
	line "great match!"
	done

Route119DougAfterBattleText:
	text "I think I'm lost."
	done

Route119ChrisScript:
	trainer FISHER, ROUTE119_CHRIS, EVENT_BEAT_ROUTE119_CHRIS, Route119ChrisSeenText, Route119ChrisBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119ChrisAfterBattleText
	waitbutton
	closetext
	end

Route119ChrisSeenText:
	text "Sure! I'll try out"
	line "the #mon I"
	cont "caught fishing!"
	done

Route119ChrisBeatenText:
	text "I don't have a"
	line "clue how to win."
	done

Route119ChrisAfterBattleText:
	text "This is the life."
	done


Route119JacksonScript:
	trainer RANGERM, ROUTE119_JACKSON, EVENT_BEAT_ROUTE119_JACKSON, Route119JacksonSeenText, Route119JacksonBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119JacksonAfterBattleText
	waitbutton
	closetext
	end

Route119JacksonSeenText:
	text "Who has the"
	line "knowledge and"

	para "the technique"
	line "for survival?"

	para "#mon Rangers!"
	done

Route119JacksonBeatenText:
	text "I didn't have"
	line "enough #mon."
	done

Route119JacksonAfterBattleText:
	text "It's just nice"
	line "to get away from"
	cont "it all!"
	done

Route119TakashiScript:
	trainer RANGERM, ROUTE119_TAKASHI, EVENT_BEAT_ROUTE119_TAKASHI, Route119TakashiSeenText, Route119TakashiBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119TakashiAfterBattleText
	waitbutton
	closetext
	end

Route119TakashiSeenText:
	text "If you're not on"
	line "your guard,"

	para "you're in for"
	line "some pain!"
	done

Route119TakashiBeatenText:
	text "You're"
	line "surprisingly good!"
	done

Route119TakashiAfterBattleText:
	text "I think I still"
	line "have a lot to"
	cont "learn."
	done

Route119CatherineScript:
	trainer RANGERF, ROUTE119_CATHERINE, EVENT_BEAT_ROUTE119_CATHERINE, Route119CatherineSeenText, Route119CatherineBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119CatherineAfterBattleText
	waitbutton
	closetext
	end

Route119CatherineSeenText:
	text "Oh? Look at you."

	para "For someone on"
	line "an adventure,"

	para "you're traveling"
	line "awfully light."
	done

Route119CatherineBeatenText:
	text "Accidents happen"
	line "when you're not"
	cont "prepared!"
	done

Route119CatherineAfterBattleText:
	text "You're on top"
	line "of things!"
	done


Route119GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext Route119OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext Route119GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext Route119GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext Route119DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext Route119HaveGoodRodText
	waitbutton
	closetext
	end

Route119OfferGoodRodText:
	text "River fishing"
	line "is the best!"

	para "It winds and"
	line "flows, there are"
	cont "bound to be fish!"

	para "I've fished here"
	line "for 30 years."

	para "Would you like to"
	line "give it a try?"
	done

Route119GiveGoodRodText:
	text "Ah, hahah!"
	line "We have ourselves"
	cont "a new angler!"
	done

Route119GaveGoodRodText:
	text "Fish aren't found"
	line "in the sea alone."

	para "They go wherever"
	line "there is water."
	done

Route119DontWantGoodRodText:
	text "Whaaat? You don't"
	line "like to fish!?"
	cont "Incomprehensible!"
	done

Route119HaveGoodRodText:
	text "How are things?"
	line "Land the big one?"
	done

Route119FruitTree1:
	fruittree FRUITTREE_ROUTE_119_1

Route119FruitTree2:
	fruittree FRUITTREE_ROUTE_119_2

Route119FruitTree3:
	fruittree FRUITTREE_ROUTE_119_3

Route119FruitTree4:
	fruittree FRUITTREE_ROUTE_119_4


Route119South_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 15, 69, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119DonaldScript, -1
	object_event 12, 67, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route119TaylorScript, -1
	object_event 25, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, Route119BrentScript, -1
	object_event 21, 60, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, Route119KentScript, -1
	object_event 28, 59, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119GregScript, -1
	object_event 09, 32, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, Route119DougScript, -1
	object_event 17, 18, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, Route119ChrisScript, -1
	object_event 29, 06, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119JacksonScript, -1
	object_event 07, 04, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119TakashiScript, -1
	object_event 32, 20, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119CatherineScript, -1
	object_event 10, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree1, -1
	object_event 11, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree2, -1
	object_event 07, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree3, -1
	object_event 26, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree4, -1
	object_event 17, 41, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route119GoodRodGuru, -1
	