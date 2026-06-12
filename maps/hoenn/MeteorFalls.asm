	object_const_def

MeteorFalls_MapScripts:
	def_scene_scripts

	def_callbacks	

MeteorFallsMoonStone:
	itemball MOON_STONE

MeteorFallsSunStone:
	itemball SUN_STONE

MeteorFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  25, 17, ROUTE_114, 1
	warp_event  09, 37, ROUTE_115, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 04, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorFallsMoonStone, EVENT_METEOR_FALLS_MOON_STONE
	object_event 11, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorFallsSunStone, EVENT_METEOR_FALLS_SUN_STONE
	