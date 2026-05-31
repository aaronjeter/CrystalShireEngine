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
	