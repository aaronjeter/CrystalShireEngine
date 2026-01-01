	object_const_def
	const CENTRALCITYPOKEMART_CLERK

CentralCityPokemart_MapScripts:
	def_scene_scripts

	def_callbacks

CentralCityPokemart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

CentralCityPokemart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  04,  07, CENTRAL_CITY, 15
	warp_event  05,  07, CENTRAL_CITY, 15

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CentralCityPokemart_Clerk, -1
