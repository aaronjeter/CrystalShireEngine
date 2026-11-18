ShoalCaveB2F_MapScripts:
	def_scene_scripts

	def_callbacks

ShoalCaveB2FShellBell:
	itemball SHELL_BELL

ShoalCaveB2FIceStone:
	itemball ICE_STONE

ShoalCaveB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 23, SHOAL_CAVE_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 28, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ShoalCaveB2FShellBell, EVENT_SHOAL_CAVE_B2F_SHELL_BELL
	object_event 28, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ShoalCaveB2FIceStone, EVENT_SHOAL_CAVE_B2F_ICE_STONE
