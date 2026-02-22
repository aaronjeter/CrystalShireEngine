	object_const_def
	const VERDANTURFTRADEHOUSE_GREG

VerdanturfTradeHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

VerdanturfTradeHouse_Ryan:
	faceplayer
	opentext
	trade NPC_TRADE_RYAN
	waitbutton
	closetext
	end

VerdanturfTradeHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, VERDANTURF_TOWN, 5
	warp_event  3, 7, VERDANTURF_TOWN, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  05,  04, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VerdanturfTradeHouse_Ryan, -1
