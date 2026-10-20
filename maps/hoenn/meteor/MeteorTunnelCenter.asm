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
	callback MAPCALLBACK_SPRITES, MeteorTunnelCenterMonSpritesCallback

MeteorTunnelCenterMonSpritesCallback:
	setmonsprite SPRITE_MON_1, LUNATONE
	setmonsprite SPRITE_MON_2, SOLROCK
	endcallback

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

	def_bg_events	

	def_object_events
	object_event 09, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelCenterMoonStone, EVENT_METEOR_TUNNEL_CENTER_MOON_STONE
	object_event 20, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelCenterEscapeRope, EVENT_METEOR_TUNNEL_CENTER_ESCAPE_ROPE
	object_event 37, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelCenterStarPiece, EVENT_METEOR_TUNNEL_CENTER_STAR_PIECE
	object_event 37, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelCenterRootFossil, EVENT_GOT_FOSSIL_ROOT_METEOR_CENTER
	object_event 02, 27, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MeteorTunnelCenterLunatone, -1
	object_event 21, 12, SPRITE_MON_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MeteorTunnelCenterSolrock, -1
	