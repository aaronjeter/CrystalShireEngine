	object_const_def

SlateportCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, SlateportCityFlypointCallback

SlateportCityFlypointCallback:
	setflag ENGINE_FLYPOINT_SLATEPORT
	endcallback

SlateportCitySign:
	jumptext SlateportCitySignText

SlateportCitySignText:
	text "Slateport City"

	para "The port where"
	line "people and #mon"
	
	para "cross paths with"
	line "nature."
	done

SlateportCityHarborSign:
	jumptext SlateportCityHarborSignText

	SlateportCityHarborSignText:
	text "Slateport Harbor:"

	para "International"
	line "Voyages"
	done

SlateportShipyardSign:
	jumptext SlateportShipyardSignText

SlateportShipyardSignText:
	text "Slateport"
	line "Shipyard"
	done


SlateportSailorScript:
	jumptextfaceplayer SlateportSailorText

SlateportSailorText:
	text "Whew, I just"
	line "sailed here from"
	cont "Kanto."
	done

SlateportBugCatcherScript:
	jumptextfaceplayer SlateportBugCatcherText

SlateportBugCatcherText:
	text "I'm actually from"
	line "Pewter City."

	para "I came to catch"
	line "bugs you can only"
	cont "find in Hoenn."
	done

SlateportCityBerryVendorScript:
	faceplayer
	opentext
	writetext SlateportCityBerryVendorText
	waitbutton
	pokemart MARTTYPE_STANDARD, MART_SLATEPORT_MARKET
	closetext
	end

SlateportCityBerryVendorText:
	text "Fresh Berries!"
	line "Picked this"
	cont "morning!"
	done

SlateportCityVendorScript:
	jumptextfaceplayer SlateportCityVendorText

SlateportCityVendorText:
	text "Welcome to the"
	line "Slateport market!"

	para "The Berry lady"
	line "next door has"
	cont "the best prices."
	done

SlateportCityDockSailorScript:
	jumptextfaceplayer SlateportCityDockSailorText

SlateportCityDockSailorText:
	text "The S.S. Aqua"
	line "docks at the"
	cont "harbor."

	para "With a ticket, she"
	line "takes you to Johto"
	cont "or Kanto!"
	done

SlateportCityMuseumFanScript:
	jumptextfaceplayer SlateportCityMuseumFanText

SlateportCityMuseumFanText:
	text "The Oceanic Museum"
	line "is free to visit!"

	para "I go every week to"
	line "learn about the"
	cont "sea."
	done

SlateportCityBeachFisherScript:
	jumptextfaceplayer SlateportCityBeachFisherText

SlateportCityBeachFisherText:
	text "The beach here is"
	line "great for fishing"
	cont "and swimming!"
	done

SlateportCityTwinScript:
	jumptextfaceplayer SlateportCityTwinText

SlateportCityTwinText:
	text "Mom's buying"
	line "Berries at the"
	cont "market. I want"
	cont "an Oran Berry!"
	done

SlateportCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  19, 21, SLATEPORT_POKECENTER, 2
	warp_event  15, 27, SLATEPORT_MART, 2
	warp_event 30, 13, SLATEPORT_HARBOR, 2
	warp_event  05, 21, SLATEPORT_TRADE_HOUSE, 2
	warp_event  7, 13, SLATEPORT_OCEANIC_MUSEUM, 1
	warp_event 29, 27, SLATEPORT_SHIPYARD, 1

	def_coord_events

	def_bg_events	
	bg_event 13, 21, BGEVENT_READ, SlateportCitySign
	bg_event 27, 13, BGEVENT_READ, SlateportCityHarborSign
	bg_event 23, 37, BGEVENT_READ, SlateportShipyardSign

	def_object_events
	object_event  25,  12, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlateportSailorScript, -1
	object_event 19, 36, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SlateportBugCatcherScript, -1
	object_event  5, 36, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SlateportCityBerryVendorScript, -1
	object_event 11, 40, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SlateportCityVendorScript, -1
	object_event 33, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlateportCityDockSailorScript, -1
	object_event  9, 15, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlateportCityMuseumFanScript, -1
	object_event 33, 57, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SlateportCityBeachFisherScript, -1
	object_event 20, 30, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SlateportCityTwinScript, -1
