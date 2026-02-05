	object_const_def

FallarborTown_MapScripts:
	def_scene_scripts

	def_callbacks	

FallarborTownSign:
	jumptext FallarborTownSignText

FallarborTownSignText:
	text "Fallarbor Town"

	para "A community"
	line "with small"
	cont "gardens."
	done

FallarborTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 13,  09, FALLARBOR_POKECENTER, 2
	warp_event 15,  17, FALLARBOR_MART, 2

	def_coord_events

	def_bg_events	
	bg_event  10, 10, BGEVENT_READ, FallarborTownSign

	def_object_events
	