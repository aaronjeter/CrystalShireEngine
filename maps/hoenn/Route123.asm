	object_const_def	

Route123_MapScripts:
	def_scene_scripts

	def_callbacks	

Route123FruitTree1:
	fruittree FRUITTREE_ROUTE_123_1

Route123FruitTree2:
	fruittree FRUITTREE_ROUTE_123_2

Route123FruitTree3:
	fruittree FRUITTREE_ROUTE_123_3

Route123FruitTree4:
	fruittree FRUITTREE_ROUTE_123_4

Route123FruitTree5:
	fruittree FRUITTREE_ROUTE_123_5

Route123FruitTree6:
	fruittree FRUITTREE_ROUTE_123_6

Route123RareCandy:
	itemball RARE_CANDY

Route123PpUp:
	itemball PP_UP

Route123TeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_MIRACLE_SEED
	iftrue Route123Teacher_AfterSeed

	writetext Route123TeacherGiveSeedText
	waitbutton 
	verbosegiveitem MIRACLE_SEED
	setevent EVENT_GOT_HOENN_MIRACLE_SEED
	waitbutton
	closetext
	end

Route123Teacher_AfterSeed:
	writetext Route123TeacherAlreadyGivenSeedText
	waitbutton
	closetext
	end

Route123TeacherGiveSeedText:
	text "Oh, hi there,"
	line "trainer."

	para "It's always nice"
	line "to see people"

	para "take an interest"
	line "in gardening."

	para "Here, take this"
	line "as a gift."

	para "It will let your"
	line "#mon hit a"

	para "little harder with"
	line "Grass type moves."
	done

Route123TeacherAlreadyGivenSeedText:
	text "The world is a"
	line "garden."

	para "And like a garden,"
	line "some things need"
	cont "pruning."
	done


Route123_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 32, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree1, -1
	object_event 33, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree2, -1
	object_event 08, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree3, -1
	object_event 09, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree4, -1
	object_event 12, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree5, -1
	object_event 13, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree6, -1
	object_event 27, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route123RareCandy, EVENT_ROUTE_123_RARE_CANDY
	object_event 39, 04, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route123PpUp, EVENT_ROUTE_123_PP_UP
	object_event 10, 07, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route123TeacherScript, -1
	
