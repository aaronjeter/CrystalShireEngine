	object_const_def
	const FALLARBORCOZMOSHOUSE_COZMO
	const FALLARBORCOZMOSHOUSE_WIFE

FallarborCozmosHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FallarborCozmosHouseCozmoScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_DRAGON_FANG
	iftrue .Got
	writetext FallarborCozmosHouseCozmoOfferText
	promptbutton
	verbosegiveitem DRAGON_FANG
	iffalse .Done
	setevent EVENT_GOT_HOENN_DRAGON_FANG
.Got:
	writetext FallarborCozmosHouseCozmoAfterText
	waitbutton
.Done:
	closetext
	end

FallarborCozmosHouseWifeScript:
	jumptextfaceplayer FallarborCozmosHouseWifeText

FallarborCozmosHouseBookshelf:
	jumpstd DifficultBookshelfScript

FallarborCozmosHouseCozmoOfferText:
	text "I'm Prof. Cozmo."
	line "I study meteors."

	para "West of town, past"
	line "Route 114, lies"
	cont "Meteor Falls."

	para "Long ago, rocks"
	line "from space fell"
	cont "there. Some say a"
	cont "dragon came too."

	para "It still rests on"
	line "Meteor Peak, high"
	cont "above the falls."

	para "I found this near"
	line "the falls. Take it"
	cont "with you!"
	done

FallarborCozmosHouseCozmoAfterText:
	text "A Dragon Fang"
	line "powers up Dragon-"
	cont "type moves."

	para "Maybe it came from"
	line "the sky dragon"
	cont "itself... Ha ha!"
	done

FallarborCozmosHouseWifeText:
	text "My husband spends"
	line "more nights at"
	cont "Meteor Falls than"
	cont "at home!"
	done

FallarborCozmosHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FALLARBOR_TOWN, 4
	warp_event  3,  7, FALLARBOR_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, FallarborCozmosHouseBookshelf
	bg_event 1,  1, BGEVENT_READ, FallarborCozmosHouseBookshelf

	def_object_events
	object_event 5,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FallarborCozmosHouseCozmoScript, -1
	object_event 2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FallarborCozmosHouseWifeScript, -1
