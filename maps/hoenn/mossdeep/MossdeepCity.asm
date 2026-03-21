	object_const_def

MossdeepCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, MossdeepCityFlypointCallback

MossdeepCityFlypointCallback:
	setflag ENGINE_FLYPOINT_MOSSDEEP
	endcallback

MossdeepSign:
	jumptext MossdeepSignText

MossdeepSignText:
	text "Mossdeep City"

	para "Our Slogan:"
	line "Cherish Pokemon"
	done

MossdeepGymSign:
	jumptext MossdeepGymSignText

MossdeepGymSignText:
	text "Mossdeep City"
	line "#MON Gym"

	para "Leaders: "
	line "Tate & Liza"

	para "The Twin"
	line "Masters"
	done

MossdeepCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 31, 15, MOSSDEEP_POKECENTER, 2
	warp_event 39, 17, MOSSDEEP_MART, 2
	warp_event 40, 09, MOSSDEEP_GYM, 2

	def_coord_events

	def_bg_events	
	bg_event  27, 17, BGEVENT_READ, MossdeepSign
	bg_event  37, 09, BGEVENT_READ, MossdeepGymSign

	def_object_events
	