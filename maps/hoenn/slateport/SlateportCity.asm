	object_const_def

SlateportCity_MapScripts:
	def_scene_scripts

	def_callbacks	

SlateportCitySign:
	jumptext SlateportCitySignText

SlateportCitySignText:
	text "Slateport City"

	para "The port where"
	line "people and #MON"
	
	para "cross paths with"
	line "Nature."
	done

SlateportCityHarborSign:
	jumptext SlateportCityHarborSignText

	SlateportCityHarborSignText:
	text "SLATEPORT HARBOR:"

	para "International"
	line "Voyages"
	done

SlateportShipyardSign:
	jumptext SlateportShipyardSignText

SlateportShipyardSignText:
	text "Slateport"
	line "Shipyard"
	done

SlateportCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  19, 21, SLATEPORT_POKECENTER, 2
	warp_event  15, 27, SLATEPORT_MART, 2
	warp_event  29, 13, SLATEPORT_HARBOR, 2

	def_coord_events

	def_bg_events	
	bg_event 13, 21, BGEVENT_READ, SlateportCitySign
	bg_event 28, 14, BGEVENT_READ, SlateportCityHarborSign
	bg_event 23, 37, BGEVENT_READ, SlateportShipyardSign

	def_object_events
	