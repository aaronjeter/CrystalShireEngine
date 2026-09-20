	object_const_def
	const MTMOON_MOONSTONE3


MtMoonB1F_MapScripts:
	def_scene_scripts

	def_callbacks	

MtMoonMoonstone3:
	itemball MOON_STONE

MtMoonB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  05, 35, MT_MOON_1F, 3
	warp_event  17, 27, MT_MOON_B2F, 1

	warp_event  27, 05, MT_MOON_1F, 4
	warp_event  33, 15, MT_MOON_B2F, 2

	warp_event  05, 05, MT_MOON_B2F, 3
	warp_event  11, 05, ROUTE_4, 1 ;

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  28, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtMoonMoonstone1, EVENT_MOUNT_MOON_MOONSTONE3
