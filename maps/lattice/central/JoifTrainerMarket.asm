	object_const_def
	const JOIFTRAINERMARKET_CLERK

JoifTrainerMarket_MapScripts:
	def_scene_scripts

	def_callbacks

JoifTrainerMarket_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

JoifTrainerMarket_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  04,  07, JOIF_ALLEY, 09
	warp_event  05,  07, JOIF_ALLEY, 09

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JoifTrainerMarket_Clerk, -1
