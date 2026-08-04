	object_const_def	
	const MAPROUTE118_DALE
	const MAPROUTE118_CHESTER
	const MAPROUTE118_PERRY
	const MAPROUTE118_SALLY
	const MAPROUTE118_ANNIE
	const MAPROUTE118_BARNY

Route118_MapScripts:
	def_scene_scripts

	def_callbacks	

Route118DaleScript:
	trainer SCHOOLBOY, ROUTE118_DALE, EVENT_BEAT_ROUTE118_DALE, Route118DaleSeenText, Route118DaleBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route118DaleAfterBattleText
	waitbutton
	closetext
	end

Route118DaleSeenText:
	text "Hey there!"

	para "Wanna join us?"
	done

Route118DaleBeatenText:
	text "Awww!"
	done

Route118DaleAfterBattleText:
	text "We're just out"
	line "for a picnic."
	done


Route118ChesterScript:
	trainer BIRD_KEEPER, ROUTE118_CHESTER, EVENT_BEAT_ROUTE118_CHESTER, Route118ChesterSeenText, Route118ChesterBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route118ChesterAfterBattleText
	waitbutton
	closetext
	end

Route118ChesterSeenText:
	text "Sure is windy"
	line "today. Great"
	cont "for my fliers!"
	done

Route118ChesterBeatenText:
	text "Dang it!"
	done

Route118ChesterAfterBattleText:
	text "I'm gonna keep"
	line "training here!"
	done


Route118PerryScript:
	trainer BIRD_KEEPER, ROUTE118_PERRY, EVENT_BEAT_ROUTE118_PERRY, Route118PerrySeenText, Route118PerryBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route118PerryAfterBattleText
	waitbutton
	closetext
	end

Route118PerrySeenText:
	text "I'm going North"
	line "to meet Winona."

	para "She's the flying"
	line "type Master in"
	cont "Fortree City."
	done

Route118PerryBeatenText:
	text "Yeah, I need"
	line "practice..."
	done

Route118PerryAfterBattleText:
	text "One day I hope"
	line "to be a gym"
	cont "trainer."
	done


Route118SallyScript:
	trainer LASS, ROUTE118_SALLY, EVENT_BEAT_ROUTE118_SALLY, Route118SallySeenText, Route118SallyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route118SallyAfterBattleText
	waitbutton
	closetext
	end

Route118SallySeenText:
	text "The water is"
	line "too deep to"
	cont "walk across."
	done

Route118SallyBeatenText:
	text "Fun! Want"
	line "to stick around?"
	done

Route118SallyAfterBattleText:
	text "Still waiting"
	line "on Dad to catch"
	cont "some fish..."
	done


Route118AnnieScript:
	trainer LASS, ROUTE118_ANNIE, EVENT_BEAT_ROUTE118_ANNIE, Route118AnnieSeenText, Route118AnnieBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route118AnnieAfterBattleText
	waitbutton
	closetext
	end

Route118AnnieSeenText:
	text "I hate sand."

	para "But I love"
	line "fish!"
	done

Route118AnnieBeatenText:
	text "I can't wait"
	line "to eat some fish!"
	done

Route118AnnieAfterBattleText:
	text "I hope dad catches"
	line "lots of Goldeen!"
	done


Route118BarnyScript:
	trainer FISHER, ROUTE118_BARNY, EVENT_BEAT_ROUTE118_BARNY, Route118BarnySeenText, Route118BarnyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route118BarnyAfterBattleText
	waitbutton
	closetext
	end

Route118BarnySeenText:
	text "Hey there!"

	para "Don't scare away"
	line "my lunch!"
	done

Route118BarnyBeatenText:
	text "Oof. Thought I"
	line "was better."
	done

Route118BarnyAfterBattleText:
	text "Wonder what I'll"
	line "catch for lunch?"
	done

Route118FruitTree1:
	fruittree FRUITTREE_ROUTE_118_1

Route118FruitTree2:
	fruittree FRUITTREE_ROUTE_118_2

Route118Elixer:
	itemball ELIXER

Route118_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 13, 06, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route118DaleScript, -1
	object_event 55, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, Route118ChesterScript, -1
	object_event 52, 05, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route118PerryScript, -1
	object_event 22, 07, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, Route118SallyScript, -1
	object_event 18, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route118AnnieScript, -1
	object_event 31, 15, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, Route118BarnyScript, -1
	object_event 65, 04, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route118FruitTree1, -1
	object_event 76, 04, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route118FruitTree2, -1
	object_event 09, 05, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route118Elixer, EVENT_ROUTE_118_ELIXER


