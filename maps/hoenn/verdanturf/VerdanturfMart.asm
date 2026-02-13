	object_const_def
	const VERDATURFMART_CLERK

VerdanturfMart_MapScripts:
	def_scene_scripts

	def_callbacks

VerdanturfMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AZALEA
	closetext
	end

VerdanturfMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, VERDANTURF_TOWN, 3
	warp_event  5,  7, VERDANTURF_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VerdanturfMart_Clerk, -1
