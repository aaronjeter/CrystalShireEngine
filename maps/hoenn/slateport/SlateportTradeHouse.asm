	object_const_def
	const SLATEPORTTRADEHOUSE_JOANNE

SlateportTradeHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

SlateportTradeHouse_Joanne:
	faceplayer
	opentext
	trade NPC_TRADE_JOANNE
	waitbutton
	closetext
	end

SlateportTradeHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, SLATEPORT_CITY, 4
	warp_event  3, 7, SLATEPORT_CITY, 4

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  05,  04, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SlateportTradeHouse_Joanne, -1
