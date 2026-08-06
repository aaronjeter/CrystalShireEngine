	object_const_def
	const METEOREAST_TM_SWIFT
	const METEOREAST_STAR_PIECE
	const METEOREAST_RARE_CANDY
	const METEOREAST_PP_UP
	const METEOREAST_BANETTE


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

MeteorTunnelEastTmThief:
	itemball TM_THIEF

MeteorTunnelEastStarPiece:
	itemball STAR_PIECE

MeteorTunnelEastRareCandy:
	itemball RARE_CANDY

MeteorTunnelEastClawFossil:
	itemball CLAW_FOSSIL

MeteorTunnelEastBanette:
	cry BANETTE
	loadwildmon BANETTE, 9
	startbattle
	reloadmapafterbattle
	disappear METEOREAST_BANETTE
	end


MeteorTunnelEast_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 02, 05, METEOR_TUNNEL_CENTER, 3
	warp_event 19,  3, JIRACHI_NEST, 1


	def_coord_events
	;enable bridge 1
	coord_event 34, 09, -1, MeteorTunnelEastEnableBridgeScript

	;disable bridge 1
	coord_event 34, 13, -1, MeteorTunnelEastDisableBridgeScript

	def_bg_events	

	def_object_events
	object_event 22, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelEastTmThief, EVENT_METEOR_TUNNEL_EAST_TM_THIEF
	object_event 08, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelEastStarPiece, EVENT_METEOR_TUNNEL_EAST_STAR_PIECE
	object_event 31, 02, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelEastRareCandy, EVENT_METEOR_TUNNEL_EAST_RARE_CANDY
	object_event 06, 03, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelEastClawFossil, EVENT_GOT_FOSSIL_CLAW_METEOR_EAST
	object_event 15, 34, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, MeteorTunnelEastBanette, -1
