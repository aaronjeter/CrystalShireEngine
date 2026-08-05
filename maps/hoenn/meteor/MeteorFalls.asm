	object_const_def

MeteorFalls_MapScripts:
	def_scene_scripts

	def_callbacks	

MeteorFallsEnableBridgeScript:
	;bridge 1
	changeblock 16, 20, $c0 ; LeftBridge
	changeblock 18, 20, $98 ; Bridge
	changeblock 20, 20, $98 ; Bridge
	changeblock 22, 20, $c1 ; RightBridge
	end


MeteorFallsDisableBridgeScript:
	;bridge 1
	changeblock 16, 20, $bc ; LeftBridge
	changeblock 18, 20, $c2 ; Bridge
	changeblock 20, 20, $c2 ; Bridge
	changeblock 22, 20, $bd ; RightBridge
	end

MeteorFallsMoonStone:
	itemball MOON_STONE

MeteorFallsSunStone:
	itemball SUN_STONE

MeteorFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 29, 25, ROUTE_114, 1
	warp_event 09, 41, ROUTE_115, 1
	warp_event 27, 29, METEOR_TUNNEL_CENTER, 1
	warp_event 13, 05, METEOR_PEAK, 1
	warp_event 05, 03, METEOR_PEAK, 2

	def_coord_events
	;enable bridge 1
	coord_event 29, 22, -1, MeteorFallsEnableBridgeScript
	coord_event 10, 20, -1, MeteorFallsEnableBridgeScript

	;disable bridge 1
	coord_event 29, 24, -1, MeteorFallsDisableBridgeScript
	coord_event 10, 22, -1, MeteorFallsDisableBridgeScript

	def_bg_events	

	def_object_events
	object_event 03, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorFallsMoonStone, EVENT_METEOR_FALLS_MOON_STONE
	object_event 29, 04, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorFallsSunStone, EVENT_METEOR_FALLS_SUN_STONE
	