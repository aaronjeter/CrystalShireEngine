	object_const_def
	const RUSTBOROTRADEHOUSE_GREG

RustboroTradeHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

RustboroTradeHouse_Greg:
	faceplayer
	opentext
	trade NPC_TRADE_GREG
	waitbutton
	closetext
	end

RustboroTradeHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, RUSTBORO_CITY, 5
	warp_event  3, 7, RUSTBORO_CITY, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  05,  04, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, RustboroTradeHouse_Greg, -1
