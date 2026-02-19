	object_const_def	
	const MAPROUTE119_DONALD
	const MAPROUTE119_TAYLOR
	const MAPROUTE119_BRENT
	const MAPROUTE119_KENT
	const MAPROUTE119_GREG
	const MAPROUTE119_DOUG
	const MAPROUTE119_CHRIS
	const MAPROUTE119_FRUITTREE1
	const MAPROUTE119_FRUITTREE2
	const MAPROUTE119_FRUITTREE3
	const MAPROUTE119_FRUITTREE4

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
	text "..."
	done

Route119DonaldBeatenText:
	text "..."
	done

Route119DonaldAfterBattleText:
	text "..."
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
	text "..."
	done

Route119TaylorBeatenText:
	text "..."
	done

Route119TaylorAfterBattleText:
	text "..."
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
	text "..."
	done

Route119BrentBeatenText:
	text "..."
	done

Route119BrentAfterBattleText:
	text "..."
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
	text "..."
	done

Route119KentBeatenText:
	text "..."
	done

Route119KentAfterBattleText:
	text "..."
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
	text "..."
	done

Route119GregBeatenText:
	text "..."
	done

Route119GregAfterBattleText:
	text "..."
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
	text "..."
	done

Route119DougBeatenText:
	text "..."
	done

Route119DougAfterBattleText:
	text "..."
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
	text "..."
	done

Route119ChrisBeatenText:
	text "..."
	done

Route119ChrisAfterBattleText:
	text "..."
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
	

	object_event 10, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree1, -1
	object_event 11, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree2, -1
	object_event 07, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree3, -1
	object_event 26, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree4, -1
	