	object_const_def

OldaleHouse2_MapScripts:
	def_scene_scripts

	def_callbacks	

OldaleHouse2PoochScript:
	cry POOCHYENA
	end

OldaleHouse2_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, OLDALE_TOWN, 4
	warp_event  3, 7, OLDALE_TOWN, 4

	def_coord_events

	def_bg_events	

	def_object_events
	
	object_event  4,  1, SPRITE_POOCHYENA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_WHITE, OBJECTTYPE_SCRIPT, 0, OldaleHouse2PoochScript, -1