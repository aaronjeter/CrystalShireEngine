	object_const_def
	const LILYCOVECITY_MOSSDEEPGUY
	const LILYCOVECITY_ESPEON
	const LILYCOVECITY_WINGULL1
	const LILYCOVECITY_WINGULL2
	const LILYCOVECITY_WINGULL3

LilycoveCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, LilycoveCityFlypointCallback

LilycoveCityFlypointCallback:
	setflag ENGINE_FLYPOINT_LILYCOVE	
	endcallback

LilycoveMossdeepGuyScript:
	faceplayer
	opentext
	setflag ENGINE_FLYPOINT_MOSSDEEP
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

	para "Here, I'll mark"
	line "it on your map."
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

LilycoveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 23, 15, LILYCOVE_POKECENTER, 2
	warp_event 53, 17, LILYCOVE_TRADE_HOUSE, 2
	warp_event 55, 05, LILYCOVE_PAINT_HOUSE, 2
	warp_event 13, 33, LILYCOVE_HARBOR, 2

	def_coord_events

	def_bg_events	
	bg_event  29, 15, BGEVENT_READ, LilycoveSign
	bg_event  53, 07, BGEVENT_READ, LilycoveCleaHouseSign
	bg_event  37, 07, BGEVENT_READ, LilycoveDeptStoreSign
	bg_event  11, 33, BGEVENT_READ, LilycoveHarborSign

	def_object_events
	object_event  46,  33, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LilycoveMossdeepGuyScript, -1
	object_event  46,  34, SPRITE_ESPEON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Lilycove_Espeon, -1
	object_event  66,  08, SPRITE_WINGULL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lilycove_Wingull, -1
	object_event  50,  31, SPRITE_WINGULL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lilycove_Wingull, -1
	object_event  22,  32, SPRITE_WINGULL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lilycove_Wingull, -1
	