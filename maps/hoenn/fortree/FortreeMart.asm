	object_const_def
	const FORTREEMART_CLERK
	const FORTREEMART_SPECIALTY_CLERK

FortreeMart_MapScripts:
	def_scene_scripts

	def_callbacks

FortreeMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_STANDARD
	closetext
	end

FortreeMart_SpecialtyClerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_FORTREE
	closetext
	end

FortreeMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, FORTREE_CITY, 2
	warp_event  5,  7, FORTREE_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FortreeMart_Clerk, -1
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FortreeMart_SpecialtyClerk, -1
