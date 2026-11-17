	object_const_def
	const MTCHIMNEYCHAMBER_GROUDON

MtChimneyChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, MtChimneyChamberMonSpritesCallback

MtChimneyChamberMonSpritesCallback:
	setmonsprite SPRITE_MON_1, GROUDON
	endcallback

GroudonScript:
	cry GROUDON
	loadwildmon GROUDON, 11
	loadboss BOSS_GROUDON
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_GROUDON
	disappear MTCHIMNEYCHAMBER_GROUDON
	end

MtChimneyChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, MT_CHIMNEY_DEPTHS, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  7, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GroudonScript, EVENT_GOT_GROUDON
