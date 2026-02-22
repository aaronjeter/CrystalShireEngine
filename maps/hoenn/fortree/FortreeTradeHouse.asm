	object_const_def
	const FORTREETRADEHOUSE_ROBERT

FortreeTradeHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

FortreeTradeHouse_Robert:
	faceplayer
	opentext
	trade NPC_TRADE_ROBERT
	waitbutton
	closetext
	end

FortreeTradeHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, FORTREE_CITY, 4
	warp_event  3, 7, FORTREE_CITY, 4

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  05,  04, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, FortreeTradeHouse_Robert, -1
