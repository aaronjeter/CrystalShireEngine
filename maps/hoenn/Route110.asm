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
	text "Hey!"
	done

Route110IsabelBeatenText:
	text "Ugh!"
	done

Route110IsabelAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route110KalebBeatenText:
	text "Ugh!"
	done

Route110KalebAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route110TimmyBeatenText:
	text "Ugh!"
	done

Route110TimmyAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route110EdwinBeatenText:
	text "Ugh!"
	done

Route110EdwinAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route110JosephBeatenText:
	text "Ugh!"
	done

Route110JosephAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route110EdwardBeatenText:
	text "Ugh!"
	done

Route110EdwardAfterBattleText:
	text "Buzz off."
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

Route110_MapEvents:
	db 0, 0 ; filler

	def_warp_events		
	warp_event  33, 15, NEW_MAUVILLE, 1

	def_coord_events

	def_bg_events	

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