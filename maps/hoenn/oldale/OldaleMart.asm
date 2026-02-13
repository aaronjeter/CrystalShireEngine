	object_const_def
	const OLDALEMART_CLERK

OldaleMart_MapScripts:
	def_scene_scripts

	def_callbacks

OldaleMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

OldaleMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, OLDALE_TOWN, 2
	warp_event  5,  7, OLDALE_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleMart_Clerk, -1
