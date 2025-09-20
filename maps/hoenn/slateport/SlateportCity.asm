	object_const_def

SlateportCity_MapScripts:
	def_scene_scripts

	def_callbacks	

	SlateportCityHarborSign:
	jumptext SlateportCityHarborSignText

	SlateportCityHarborSignText:
	text "SLATEPORT HARBOR:"

	para "International"
	line "Voyages"
	done

SlateportCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  19, 21, SLATEPORT_POKECENTER, 2
	warp_event  15, 27, SLATEPORT_MART, 2

	def_coord_events

	def_bg_events	
	bg_event 28, 28, BGEVENT_READ, SlateportCityHarborSign

	def_object_events
	