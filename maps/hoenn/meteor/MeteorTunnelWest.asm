	object_const_def
	const METEORWEST_TM_SWIFT
	const METEORWEST_STAR_PIECE
	const METEORWEST_RARE_CANDY
	const METEORWEST_PP_UP
	const METEORWEST_BAGON

MeteorTunnelWest_MapScripts:
	def_scene_scripts

	def_callbacks	

MeteorTunnelWestEnableBridgeScript:
	;bridge 1
	changeblock 10, 12, $c0 ; LeftBridge
	changeblock 12, 12, $98 ; Bridge
	changeblock 14, 12, $98 ; Bridge
	changeblock 16, 12, $98 ; Bridge
	changeblock 18, 12, $c1 ; RightBridge
	end


MeteorTunnelWestDisableBridgeScript:
	;bridge 1
	changeblock 10, 12, $bc ; LeftBridge
	changeblock 12, 12, $c2 ; Bridge
	changeblock 14, 12, $c2 ; Bridge
	changeblock 16, 12, $c2 ; Bridge
	changeblock 18, 12, $bd ; RightBridge	
	end

MeteorTunnelWestTmSwift:
	itemball TM_SWIFT

MeteorTunnelWestStarPiece:
	itemball STAR_PIECE

MeteorTunnelWestRareCandy:
	itemball RARE_CANDY

MeteorTunnelWestPpUp:
	itemball PP_UP

MeteorTunnelWestBagon:
	cry BAGON
	loadwildmon BAGON, 1
	startbattle
	reloadmapafterbattle
	disappear METEORWEST_BAGON
	end


MeteorTunnelWest_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 37, 17, METEOR_TUNNEL_CENTER, 2

	def_coord_events
	;enable bridge 1
	coord_event 04, 18, -1, MeteorTunnelWestEnableBridgeScript
	coord_event 24, 14, -1, MeteorTunnelWestEnableBridgeScript

	;disable bridge 1
	coord_event 24, 18, -1, MeteorTunnelWestDisableBridgeScript

	def_bg_events	

	def_object_events
	object_event 08, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestTmSwift, EVENT_METEOR_TUNNEL_WEST_TM_SWIFT
	object_event 29, 09, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestStarPiece, EVENT_METEOR_TUNNEL_WEST_STAR_PIECE
	object_event 33, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestRareCandy, EVENT_METEOR_TUNNEL_WEST_RARE_CANDY
	object_event 36, 02, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestPpUp, EVENT_METEOR_TUNNEL_WEST_PP_UP
	object_event 04, 03, SPRITE_BAGON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MeteorTunnelWestBagon, -1
