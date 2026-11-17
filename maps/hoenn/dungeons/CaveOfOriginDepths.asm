	object_const_def
	const CAVEOFORIGINDEPTHS_KYOGRE

CaveOfOriginDepths_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, CaveOfOriginDepthsMonSpritesCallback

CaveOfOriginDepthsMonSpritesCallback:
	setmonsprite SPRITE_MON_1, KYOGRE
	endcallback

KyogreScript:
	cry KYOGRE
	loadwildmon KYOGRE, 11
	loadboss BOSS_KYOGRE
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_KYOGRE
	disappear CAVEOFORIGINDEPTHS_KYOGRE
	end

CaveOfOriginDepths_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 19, CAVE_OF_ORIGIN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13,  8, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KyogreScript, EVENT_GOT_KYOGRE
