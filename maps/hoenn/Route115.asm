	object_const_def

Route115_MapScripts:
	def_scene_scripts

	def_callbacks	

Route115FruitTree1:
	fruittree FRUITTREE_ROUTE_115_1

Route115FruitTree2:
	fruittree FRUITTREE_ROUTE_115_2

Route115FruitTree3:
	fruittree FRUITTREE_ROUTE_115_3

Route115FruitTree4:
	fruittree FRUITTREE_ROUTE_115_4

Route115BlackBeltItem:
	itemball BLACKBELT_I

Route115PoisonFangItem:
	itemball TM_POISON_FANG


Route115ShadesScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_BLACKGLASSES
	iftrue Route115_AfterShades

	writetext Route115GiveShadesText
	waitbutton 
	verbosegiveitem BLACKGLASSES
	setevent EVENT_GOT_HOENN_BLACKGLASSES
	waitbutton
	closetext
	end

Route115_AfterShades:
	writetext Route115AlreadyGivenShadesText
	waitbutton
	closetext
	end

Route115GiveShadesText:
	text "Yo, welcome to"
	line "my secret spot!"

	para "Here, have some"
	line "cool shades like"
	cont "mine!"

	para "And maybe keep"
	line "our spot to"
	cont "yourself?"
	done

Route115AlreadyGivenShadesText:
	text "Yo! How's life"
	line "in the shade?" 
	done

Route115_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  29, 25, METEOR_FALLS, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 08, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route115FruitTree1, -1
	object_event 18, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route115FruitTree2, -1
	object_event 30, 50, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route115FruitTree3, -1
	object_event 31, 50, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route115FruitTree4, -1
	object_event 07, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route115BlackBeltItem, EVENT_GOT_HOENN_BLACKBELT_I
	object_event 14, 04, SPRITE_PHARMACIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route115ShadesScript, -1
	object_event 20, 58, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route115PoisonFangItem, EVENT_ROUTE_115_TM_POISON_FANG
