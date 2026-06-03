	object_const_def

NewMauvilleBasement_MapScripts:
	def_scene_scripts

	def_callbacks

NewMauvilleBasement_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  35,  34, NEW_MAUVILLE, 2
	warp_event  05,  04, MAUVILLE_GAME_CORNER, 3

	def_coord_events

	def_bg_events

	def_object_events
