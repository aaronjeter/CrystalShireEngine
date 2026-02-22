	object_const_def
	const MAUVILLETRADEHOUSE_GREG

MauvilleTradeHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

MauvilleTradeHouse_Lily:
	faceplayer
	opentext
	trade NPC_TRADE_LILY
	waitbutton
	closetext
	end

MauvilleTradeHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, MAUVILLE_CITY, 4
	warp_event  3, 7, MAUVILLE_CITY, 4

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  05,  03, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MauvilleTradeHouse_Lily, -1
