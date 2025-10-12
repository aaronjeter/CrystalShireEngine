	object_const_def
	const LITTLEROOTTOWN_TREECKO
	const LITTLEROOTTOWN_TORCHIC
	const LITTLEROOTTOWN_MUDKIP

LittlerootTown_MapScripts:
	def_scene_scripts

	def_callbacks	

Littleroot_Treecko:
	cry TREECKO
	end

Littleroot_Torchic:
	cry TORCHIC
	end
	
Littleroot_Mudkip:
	cry MUDKIP
	end	

LittlerootTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event 10, 15, PLAYERS_HOUSE_2F, 2
	warp_event 11, 15, PLAYERS_HOUSE_2F, 2
	warp_event 04, 13, BIRCHS_LAB, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  1,  4, SPRITE_TREECKO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Littleroot_Treecko, -1
	object_event 14,  4, SPRITE_TORCHIC, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Littleroot_Torchic, -1
	object_event  1, 15, SPRITE_MUDKIP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Littleroot_Mudkip, -1
	