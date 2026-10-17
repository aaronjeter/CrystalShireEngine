	object_const_def

OldaleHouse1_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_OBJECTS, OldaleHouse1MonSpritesCallback

OldaleHouse1MonSpritesCallback:
	setmonsprite SPRITE_MON_1, VULPIX
	endcallback

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
	object_event  4,  1, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_WHITE, OBJECTTYPE_SCRIPT, 0, OldaleHouse1VulpixScript, -1