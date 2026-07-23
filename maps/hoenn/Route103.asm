	object_const_def
	const ROUTE103_ZIGZAGOON
	const ROUTE103_WINGULL
	const MAPROUTE103_FRUIT_TREE_1
	const MAPROUTE103_FRUIT_TREE_2
	const ROUTE_103_POTION
	const ROUTE_103_SHARP_BEAK_GUY
	const ROUTE103_WALLY

Route103_MapScripts:
	def_scene_scripts

	def_callbacks	

Route103_Wally:
	faceplayer
	checkevent EVENT_START_HOENN
	iffalse .notHoenn	
	opentext
	writetext Route103WallyIntroText
	waitbutton
	closetext

	winlosstext Route103WallyLossText, Route103WallyWinText
	loadtrainer WALLY, WALLY1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	opentext
	writetext Route103WallyAfterBattleText
	sjump .WallyExit
	end

.notHoenn
	opentext
	writetext Route103WallyNotHoennText
	waitbutton 

.WallyExit
	closetext
	setevent EVENT_FOUND_ROUTE103_WALLY
	special FadeOutToBlack
	disappear ROUTE103_WALLY
	special FadeInFromBlack
	end

Route103WallyAfterBattleText:
	text "That was exciting!"
	line "Well, time to head"
	cont "back home!"
	done

Route103WallyLossText:
	text "Oh, um..."
	line "That didn't go"
	cont "well for me."
	done

Route103WallyWinText:
	text "Oh, um..."
	line "I didn't think"
	cont "I could win."
	done

Route103WallyIntroText:
	text "Oh, um...hi?"
	line "Oh! You're"
	cont "<PLAY_G>!"

	para "I'm Wally! I help"
	line "Prof Birch out"
	cont "sometimes."

	para "Oh, I was going"
	line "to go see him"
	cont "today..."

	para "Since you're"
	line "here though..."

	para "How about a"
	line "#mon battle?"
	done

Route103WallyNotHoennText:
	text "Oh, um...hi?"

	para "Sorry, I'm really"
	line "late!"
	done

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
	bg_event 11, 14, BGEVENT_READ, Route103Sign

	def_object_events
	object_event 17, 13, SPRITE_ZIGZAGOON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route103_Zigzagoon, -1
	object_event 15, 04, SPRITE_WINGULL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route103_Wingull, -1
	object_event 32, 02, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route103FruitTree1, -1
	object_event 33, 02, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route103FruitTree2, -1
	object_event 08, 02, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route103Potion, EVENT_ROUTE_103_POTION
	object_event 31, 07, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route103NerdScript, -1
	object_event 15, 08, SPRITE_BUGSY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103_Wally, EVENT_FOUND_ROUTE103_WALLY

	