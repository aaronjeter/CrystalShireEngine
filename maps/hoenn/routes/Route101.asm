	object_const_def

Route101_MapScripts:
	def_scene_scripts

	def_callbacks

Route101Sign:
	jumptext Route101SignText

Route101SignText:
	text "Route 101"

	para "North: Oldale"
	line "South: Littleroot"
	done

Route101_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	def_coord_events

	def_bg_events	
	bg_event  9,  8, BGEVENT_READ, Route101Sign

	def_object_events
	