	object_const_def
	const PETALBURGMART_CLERK

PetalburgMart_MapScripts:
	def_scene_scripts

	def_callbacks

PetalburgMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIOLET
	closetext
	end

PetalburgMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, PETALBURG_CITY, 3
	warp_event  5,  7, PETALBURG_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MauvilleMart_Clerk, -1
