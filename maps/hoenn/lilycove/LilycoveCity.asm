	object_const_def
	const LILYCOVECITY_MOSSDEEPGUY
	const LILYCOVECITY_ESPEON
	const LILYCOVECITY_WINGULL1
	const LILYCOVECITY_WINGULL2
	const LILYCOVECITY_WINGULL3
	const LILYCOVECITY_TWIN1
	const LILYCOVECITY_TWIN2
	const LILYCOVECITY_SAILOR
	const LILYCOVECITY_BEAUTY
	const LILYCOVECITY_WALLY

LilycoveCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, LilycoveCityFlypointCallback

LilycoveCityFlypointCallback:
	setflag ENGINE_FLYPOINT_LILYCOVE	
	endcallback

Lilycove_Wally:
	faceplayer
	opentext
	writetext LilycoveWallyIntroText
	waitbutton
	closetext
	winlosstext LilycoveWallyLossText, LilycoveWallyWinText
	loadtrainer WALLY, WALLY5
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	opentext
	writetext LilycoveWallyAfterBattleText
	waitbutton
	closetext
	special HealParty
	setevent EVENT_FOUND_LILYCOVE_WALLY
	setflag ENGINE_FLYPOINT_MOSSDEEP
	special FadeOutToBlack
	disappear LILYCOVECITY_WALLY
	special FadeInFromBlack
	end

LilycoveWallyAfterBattleText:
	text "Wow, every time."
	line "I think you have"
	cont "my number,"
	cont "<PLAY_G>."

	para "Here, I'll mark"
	line "Mossdeep on your"
	cont "flymap."

	para "You should be able"
	line "to fly right over."

	para "...You're really"
	line "good at this"
	cont "<PLAY_G>."

	para "Good enough to"
	line "take on the Elite"
	cont "Four even, maybe."

	para "Once you have all"
	line "eight badges from"
	cont "Hoenn, you should"
	cont "face them!"

	para "Well, it's a dream"
	line "at least. Good"
	cont "luck!"
	done

LilycoveWallyLossText:
	text "Woah, you're"
	line "amazing!"
	done

LilycoveWallyWinText:
	text "Ha, Gotcha!"
	done

LilycoveWallyIntroText:
	text "Oh, hi <PLAY_G>!"
	line "I'm glad to see"
	cont "you!"

	para "I got the route"
	line "to Mossdeep City!"

	para "You can't really"
	line "swim there"
	cont "anymore, but..."

	para "Maybe...we could"
	line "have a rematch"
	cont "first?"
	done

LilycoveMossdeepGuyScript:
	faceplayer
	opentext	
	writetext LilycoveMossdeepGuyText
	promptbutton
	closetext
	end

LilycoveMossdeepGuyText:
	text "You can see"
	line "Mossdeep City"
	cont "from here."

	para "It really doesn't"
	line "look far..."

	para "Your Pokemon"
	line "could probably"

	para "just Fly you"
	line "right over!"
	done


Lilycove_Espeon:
	cry ESPEON
	end

Lilycove_Wingull:
	cry WINGULL
	end

LilycoveSign:
	jumptext LilycoveSignText

LilycoveSignText:
	text "Lilycove City"

	para "Where land ends"
	line "and sea begins."
	done

LilycoveCleaHouseSign:
	jumptext LilycoveCleaHouseSignText

LilycoveCleaHouseSignText:
	text "Clea's Paintshop"
	done

LilycoveDeptStoreSign:
	jumptext LilycoveDeptStoreSignText

LilycoveDeptStoreSignText:
	text "Lilycove City"
	line "Department Store"
	done

LilycoveHarborSign:
	jumptext LilycoveHarborSignText

LilycoveHarborSignText:
	text "Lilycove Voyages"
	done

LilycoveTwinScript:
	jumptextfaceplayer LilycoveTwinText

LilycoveTwinText:
	text "Hi!"
	done

LilycoveSailorScript:
	jumptextfaceplayer LilycoveSailorText

LilycoveSailorText:
	text "Lilycove is the"
	line "end of the road"
	cont "for Hoenn."

	para "Literally! From"
	line "here you Fly"
	cont "or catch a Boat."
	done

LilycoveBeautyScript:
	jumptextfaceplayer LilycoveBeautyText

LilycoveBeautyText:
	text "Hi, welcome to"
	line "Lilycove!"

	para "You should check"
	line "out the Sea view."
	done

LilycoveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 23, 15, LILYCOVE_POKECENTER, 2
	warp_event 53, 17, LILYCOVE_TRADE_HOUSE, 2
	warp_event 55, 05, LILYCOVE_PAINT_HOUSE, 2
	warp_event 13, 33, LILYCOVE_HARBOR, 2
	warp_event 39, 05, LILYCOVE_DEPT_STORE_1F, 1
	warp_event 40, 05, LILYCOVE_DEPT_STORE_1F, 2

	def_coord_events

	def_bg_events	
	bg_event  29, 15, BGEVENT_READ, LilycoveSign
	bg_event  53, 07, BGEVENT_READ, LilycoveCleaHouseSign
	bg_event 42,  5, BGEVENT_READ, LilycoveDeptStoreSign
	bg_event  11, 33, BGEVENT_READ, LilycoveHarborSign

	def_object_events
	object_event  46,  33, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LilycoveMossdeepGuyScript, -1
	object_event  46,  34, SPRITE_ESPEON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Lilycove_Espeon, -1
	object_event  66,  04, SPRITE_WINGULL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lilycove_Wingull, -1
	object_event  50,  31, SPRITE_WINGULL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lilycove_Wingull, -1
	object_event  22,  32, SPRITE_WINGULL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lilycove_Wingull, -1
	object_event  39,  22, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LilycoveTwinScript, -1
	object_event  42,  23, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, LilycoveTwinScript, -1
	object_event  31,  29, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveSailorScript, -1
	object_event  07,  18, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveBeautyScript, -1
	object_event  34,  34, SPRITE_BUGSY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Lilycove_Wally, EVENT_FOUND_LILYCOVE_WALLY
