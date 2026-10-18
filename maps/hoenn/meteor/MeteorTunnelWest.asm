	object_const_def
	const METEORWEST_TM_SWIFT
	const METEORWEST_STAR_PIECE
	const METEORWEST_RARE_CANDY
	const METEORWEST_PP_UP
	const METEORWEST_BAGON
	const METEORWEST_DUSCLOPS

MeteorTunnelWest_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_OBJECTS, MeteorTunnelWestMonSpritesCallback

MeteorTunnelWestMonSpritesCallback:
	setmonsprite SPRITE_MON_1, BAGON
	setmonsprite SPRITE_MON_2, DUSCLOPS
	endcallback

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

MeteorTunnelDusclops:
	cry DUSCLOPS
	loadwildmon DUSCLOPS, 9
	startbattle
	reloadmapafterbattle
	disappear METEORWEST_DUSCLOPS
	end


MeteorTunnelWest_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 37, 17, METEOR_TUNNEL_CENTER, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 08, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestTmSwift, EVENT_METEOR_TUNNEL_WEST_TM_SWIFT
	object_event 29, 09, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestStarPiece, EVENT_METEOR_TUNNEL_WEST_STAR_PIECE
	object_event 33, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestRareCandy, EVENT_METEOR_TUNNEL_WEST_RARE_CANDY
	object_event 36, 02, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorTunnelWestPpUp, EVENT_METEOR_TUNNEL_WEST_PP_UP
	object_event 04, 03, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MeteorTunnelWestBagon, -1
	object_event 18, 26, SPRITE_MON_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MeteorTunnelDusclops, -1
