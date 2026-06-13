	object_const_def
	const ROUTE103_ZIGZAGOON
	const ROUTE103_WINGULL
	const MAPROUTE103_FRUIT_TREE_1
	const MAPROUTE103_FRUIT_TREE_2

Route103_MapScripts:
	def_scene_scripts

	def_callbacks	

Route103_Zigzagoon:
	cry ZIGZAGOON
	loadwildmon ZIGZAGOON, 2
	startbattle
	reloadmapafterbattle
	disappear ROUTE103_ZIGZAGOON
	end

Route103_Wingull:
	cry WINGULL
	loadwildmon WINGULL, 3
	startbattle
	reloadmapafterbattle
	disappear ROUTE103_WINGULL
	end

Route103FruitTree1:
	fruittree FRUITTREE_ROUTE_103_1

Route103FruitTree2:
	fruittree FRUITTREE_ROUTE_103_2

Route103Sign:
	jumptext Route103SignText

Route103SignText:
	text "Route 103"

	para "South: Oldale"
	line "East: Slateport"
	done

Route103Potion:
	itemball POTION

Route103NerdScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_SHARP_BEAK
	iftrue Route103Nerd_AfterBeak

	writetext Route103NerdGiveBeakText
	waitbutton 
	verbosegiveitem SHARP_BEAK
	setevent EVENT_GOT_HOENN_SHARP_BEAK
	waitbutton
	closetext
	end

Route103Nerd_AfterBeak:
	writetext Route103NerdAlreadyGivenBeakText
	waitbutton
	closetext
	end

Route103NerdGiveBeakText:
	text "Birds are pretty"
	line "cool, aye?"

	para "Try giving one"
	line "this!"
	done

Route103NerdAlreadyGivenBeakText:
	text "A sharp beak"
	line "is all the better" 
	cont "to peck you with!"
	done

Route103_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	def_coord_events

	def_bg_events	
	bg_event  11, 15, BGEVENT_READ, Route103Sign

	def_object_events
	object_event  17, 08, SPRITE_ZIGZAGOON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route103_Zigzagoon, -1
	object_event  15, 04, SPRITE_WINGULL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route103_Wingull, -1
	object_event  32, 02, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route103FruitTree1, -1
	object_event  33, 02, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route103FruitTree2, -1
	object_event  08, 02, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route103Potion, EVENT_ROUTE_103_POTION
	object_event  31, 07, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route103NerdScript, -1
	