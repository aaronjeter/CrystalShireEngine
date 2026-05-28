	object_const_def
	const MAPROUTE119_FISHER
	const MAPROUTE119_HEALER

Route119FisherHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

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


Route119HealerScript:
	faceplayer
	opentext
	writetext Route119HealerRestAWhileText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInFromBlack
	special RestartMapMusic
	opentext
	writetext Route119HealerHouseKeepAtItText
	waitbutton
	closetext
	end

Route119HealerRestAWhileText:
	text "Your #mon look"
	line "a little tired."

	para "You should rest"
	line "them a while."
	done

Route119HealerHouseKeepAtItText:
	text "There!"

	para "Your #mon are"
	line "looking good!"

	para "Keep at it!"
	done

Route119FisherHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, ROUTE_119_SOUTH, 1
	warp_event  3, 7, ROUTE_119_SOUTH, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 02, 04, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route119GoodRodGuru, -1
	object_event 05, 03, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route119HealerScript, -1
