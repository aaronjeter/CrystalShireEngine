	object_const_def
	const TOHJOFALLS_POKE_BALL
	const TOHJOFALLS_BAGON

TohjoFalls_MapScripts:
	def_scene_scripts

	def_callbacks

TohjoFallsMoonStone:
	itemball MOON_STONE

TohjoFallsBagon:
	cry BAGON
	loadwildmon BAGON, 1
	startbattle
	reloadmapafterbattle
	disappear TOHJOFALLS_BAGON
	end

TohjoFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 15, ROUTE_27, 2
	warp_event 25, 15, ROUTE_27, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TohjoFallsMoonStone, EVENT_TOHJO_FALLS_MOON_STONE
	object_event  3,  6, SPRITE_BAGON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TohjoFallsBagon, -1
