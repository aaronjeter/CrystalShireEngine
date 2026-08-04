	object_const_def
	;const METEORWEST_TM_SWIFT
	;const METEORWEST_STAR_PIECE
	;const METEORWEST_RARE_CANDY
	;const METEORWEST_PP_UP

MeteorTunnelEast_MapScripts:
	def_scene_scripts

	def_callbacks	

MeteorTunnelEastEnableBridgeScript:
	;vertical bridges work a bit differently

	;bridge 1
	changeblock 28, 12, $97 ; Bridge
	changeblock 28, 14, $97 ; Bridge
	changeblock 28, 16, $97 ; Bridge
	changeblock 28, 18, $97 ; Bridge
	changeblock 28, 20, $c5 ; CliffTopBridge

	;bridge 2
	changeblock 20, 20, $97 ; Bridge
	changeblock 20, 22, $97 ; Bridge
	changeblock 20, 24, $c5 ; CliffTopBridge
	end


MeteorTunnelEastDisableBridgeScript:
	;bridge 1
	changeblock 28, 12, $98 ; Cliff
	changeblock 28, 14, $c2 ; Bridge 
	changeblock 28, 16, $c2 ; Bridge 
	changeblock 28, 18, $c2 ; Bridge 
	changeblock 28, 20, $c4 ; CliffTopBridge

	;bridge 2
	changeblock 20, 20, $98 ; Cliff
	changeblock 20, 22, $c2 ; Bridge 
	changeblock 20, 24, $c4 ; CliffTopBridge
	end

MeteorTunnelEastTmSwift:
	itemball TM_SWIFT

MeteorTunnelEastStarPiece:
	itemball STAR_PIECE

MeteorTunnelEastRareCandy:
	itemball RARE_CANDY

MeteorTunnelEastPpUp:
	itemball PP_UP


MeteorTunnelEast_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 02, 05, METEOR_TUNNEL_CENTER, 3

	def_coord_events
	;enable bridge 1
	coord_event 34, 09, -1, MeteorTunnelEastEnableBridgeScript

	;disable bridge 1
	coord_event 34, 13, -1, MeteorTunnelEastDisableBridgeScript

	def_bg_events	

	def_object_events
	;object_event 08, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestTmSwift, EVENT_METEOR_TUNNEL_WEST_TM_SWIFT
	;object_event 29, 09, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestStarPiece, EVENT_METEOR_TUNNEL_WEST_STAR_PIECE
	;object_event 33, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestRareCandy, EVENT_METEOR_TUNNEL_WEST_RARE_CANDY
	;object_event 36, 02, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestPpUp, EVENT_METEOR_TUNNEL_WEST_PP_UP
