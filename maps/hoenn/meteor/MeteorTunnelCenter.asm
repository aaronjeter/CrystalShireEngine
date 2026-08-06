	object_const_def
	const METEORCENTER_MOON_STONE
	const METEORCENTER_ESCAPE_ROPE
	const METEORCENTER_STAR_PIECE
	const METEORCENTER_ROOT_FOSSIL
	const METEORCENTER_LUNATONE
	const METEORCENTER_SOLROCK

MeteorTunnelCenter_MapScripts:
	def_scene_scripts

	def_callbacks	

MeteorTunnelCenterEnableBridgeScript:
	;bridge 1
	changeblock 12, 20, $c0 ; LeftBridge
	changeblock 14, 20, $98 ; Bridge
	changeblock 16, 20, $98 ; Bridge
	changeblock 18, 20, $c1 ; RightBridge

	;bridge 2
	changeblock 12, 06, $c0 ; LeftBridge
	changeblock 14, 06, $98 ; Bridge
	changeblock 16, 06, $98 ; Bridge
	changeblock 18, 06, $c1 ; RightBridge
	end


MeteorTunnelCenterDisableBridgeScript:
	;bridge 1
	changeblock 12, 20, $bc ; LeftBridge
	changeblock 14, 20, $c2 ; Bridge
	changeblock 16, 20, $c2 ; Bridge
	changeblock 18, 20, $bd ; RightBridge

	;bridge 2
	changeblock 12, 06, $bc ; LeftBridge
	changeblock 14, 06, $c2 ; Bridge
	changeblock 16, 06, $c2 ; Bridge
	changeblock 18, 06, $bd ; RightBridge
	end

MeteorTunnelCenterMoonStone:
	itemball MOON_STONE

MeteorTunnelCenterEscapeRope:
	itemball ESCAPE_ROPE

MeteorTunnelCenterStarPiece:
	itemball STAR_PIECE

MeteorTunnelCenterRootFossil:
	itemball ROOT_FOSSIL

MeteorTunnelCenterLunatone:
	cry LUNATONE
	loadwildmon LUNATONE, 8
	startbattle
	reloadmapafterbattle
	disappear METEORCENTER_LUNATONE
	end

MeteorTunnelCenterSolrock:
	cry SOLROCK
	loadwildmon SOLROCK, 8
	startbattle
	reloadmapafterbattle
	disappear METEORCENTER_SOLROCK
	end


MeteorTunnelCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 19, 37, METEOR_FALLS, 3
	warp_event 02, 17, METEOR_TUNNEL_WEST, 1
	warp_event 37, 05, METEOR_TUNNEL_EAST, 1

	def_coord_events
	;enable bridge 1
	coord_event 24, 21, -1, MeteorTunnelCenterEnableBridgeScript
	coord_event 06, 17, -1, MeteorTunnelCenterEnableBridgeScript

	;disable bridge 1
	coord_event 24, 24, -1, MeteorTunnelCenterDisableBridgeScript

	def_bg_events	

	def_object_events
	object_event 09, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelCenterMoonStone, EVENT_METEOR_TUNNEL_CENTER_MOON_STONE
	object_event 20, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelCenterEscapeRope, EVENT_METEOR_TUNNEL_CENTER_ESCAPE_ROPE
	object_event 37, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelCenterStarPiece, EVENT_METEOR_TUNNEL_CENTER_STAR_PIECE
	object_event 37, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelCenterRootFossil, EVENT_GOT_FOSSIL_ROOT_METEOR_CENTER
	object_event 02, 27, SPRITE_LUNATONE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MeteorTunnelCenterLunatone, -1
	object_event 21, 12, SPRITE_SOLROCK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MeteorTunnelCenterSolrock, -1
	