	object_const_def
	const LILYCOVETRADEHOUSE_DANI
	const LILYCOVETRADEHOUSE_PARKER

LilycoveTradeHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

LilycoveTradeHouse_Dani:
	faceplayer
	opentext
	trade NPC_TRADE_DANI
	waitbutton
	closetext
	end

LilycoveTradeHouse_Parker:
	faceplayer
	opentext
	trade NPC_TRADE_PARKER
	waitbutton
	closetext
	end

LilycoveTradeHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, LILYCOVE_CITY, 2
	warp_event  3, 7, LILYCOVE_CITY, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  02,  04, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LilycoveTradeHouse_Dani, -1
	object_event  05,  03, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveTradeHouse_Parker, -1
