	object_const_def

DesertRuin1F_MapScripts:
	def_scene_scripts

	def_callbacks	

DesertRuin1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  05, 15, LAVARIDGE_DESERT, 4
	warp_event  15, 05, DESERT_RUIN_B1F, 1
	warp_event  15, 15, DESERT_RUIN_B1F, 2

	def_coord_events

	def_bg_events	

	def_object_events
