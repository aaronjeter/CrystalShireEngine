	object_const_def

RustboroCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, RustboroCityFlypointCallback

RustboroCityFlypointCallback:
	setflag ENGINE_FLYPOINT_RUSTBORO
	endcallback

RustboroCitySign:
	jumptext RustboroCitySignText

RustboroCitySignText:
	text "Rustboro City"

	para "The city of"
	line "Nature and Science"
	done

RustboroCutterHouseSign:
	jumptext RustboroCutterHouseSignText

RustboroCutterHouseSignText:
	text "Cutter's House"
	done

RustboroGymSign:
	jumptext RustboroGymSignText

RustboroGymSignText:
	text "Rustboro City"
	line "#mon Gym"
	cont "Leader: Roxanne"

	para "Rock and"
	line "Stone"
	done

RustboroDevonSign:
	jumptext RustboroDevonSignText

RustboroDevonSignText:
	text "Devon HQ"

	para "The heart of"
	line "Progress"
	done

RustboroCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  24, 19, RUSTBORO_GYM, 1
	warp_event  13, 35, RUSTBORO_POKECENTER, 2
	warp_event  13, 43, RUSTBORO_MART, 2
	warp_event   7, 35, RUSTBORO_CUTTER_HOUSE, 2
	warp_event  29, 49, RUSTBORO_TRADE_HOUSE, 2

	def_coord_events

	def_bg_events	
	bg_event  16, 46, BGEVENT_READ, RustboroCitySign
	bg_event  10, 34, BGEVENT_READ, RustboroCutterHouseSign
	bg_event  28, 18, BGEVENT_READ, RustboroGymSign
	bg_event 12, 20, BGEVENT_READ, RustboroDevonSign

	def_object_events
	