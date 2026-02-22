	object_const_def
	const PETALBURGHOUSE1_FRANK

PetalburgHouse1_MapScripts:
	def_scene_scripts

	def_callbacks	

PetalburgHouse1_Frank:
	faceplayer
	opentext
	trade NPC_TRADE_FRANK
	waitbutton
	closetext
	end

PetalburgHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, PETALBURG_CITY, 4
	warp_event  3, 7, PETALBURG_CITY, 4

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  05,  04, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgHouse1_Frank, -1
