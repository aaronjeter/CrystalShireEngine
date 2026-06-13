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

SlateportCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  19, 21, SLATEPORT_POKECENTER, 2
	warp_event  15, 27, SLATEPORT_MART, 2
	warp_event  29, 13, SLATEPORT_HARBOR, 2
	warp_event  05, 21, SLATEPORT_TRADE_HOUSE, 2

	def_coord_events

	def_bg_events	
	bg_event 13, 21, BGEVENT_READ, SlateportCitySign
	bg_event 27, 13, BGEVENT_READ, SlateportCityHarborSign
	bg_event 23, 37, BGEVENT_READ, SlateportShipyardSign

	def_object_events
	object_event  25,  12, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlateportSailorScript, -1
	object_event  20,  34, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SlateportBugCatcherScript, -1
	