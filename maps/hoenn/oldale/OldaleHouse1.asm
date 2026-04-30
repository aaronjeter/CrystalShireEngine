	object_const_def

OldaleHouse1_MapScripts:
	def_scene_scripts

	def_callbacks	

OldaleHouse1VulpixScript:
	cry VULPIX
	end

OldaleHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, OLDALE_TOWN, 3
	warp_event  3, 7, OLDALE_TOWN, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  4,  1, SPRITE_VULPIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_WHITE, OBJECTTYPE_SCRIPT, 0, OldaleHouse1VulpixScript, -1