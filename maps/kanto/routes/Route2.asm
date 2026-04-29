	object_const_def
	

Route2_MapScripts:
	def_scene_scripts

	def_callbacks



Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_2_HIDDEN_MAX_ETHER

Route2HiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL

Route2HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE

Route2HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_2_HIDDEN_REVIVE


Route2SignText:
	text "Route 2"

	para "Viridian City -"
	line "Pewter City"
	done

Route2DiglettsCaveSignText:
	text "Diglett's Cave"
	done

Route2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 15, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 15, 31, ROUTE_2_GATE, 3
	warp_event 16, 27, ROUTE_2_GATE, 1
	warp_event 17, 27, ROUTE_2_GATE, 2
	warp_event 12,  7, DIGLETTS_CAVE, 3
	warp_event  4, 32, VIRIDIAN_FOREST, 1
	warp_event  2,  9, VIRIDIAN_FOREST, 3


	def_coord_events

	def_bg_events
	bg_event  7, 51, BGEVENT_READ, Route2Sign
	bg_event 11,  9, BGEVENT_READ, Route2DiglettsCaveSign
	bg_event  7, 23, BGEVENT_ITEM, Route2HiddenMaxEther
	bg_event  4, 14, BGEVENT_ITEM, Route2HiddenFullHeal
	bg_event  4, 27, BGEVENT_ITEM, Route2HiddenFullRestore
	bg_event 11, 30, BGEVENT_ITEM, Route2HiddenRevive

	def_object_events
