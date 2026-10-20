	object_const_def
	const REGISTEELLAIR_REGISTEEL

RegisteelLair_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, RegisteelLairMonSpritesCallback

RegisteelLairMonSpritesCallback:
	setmonsprite SPRITE_MON_1, REGISTEEL
	endcallback

RegisteelScript:
	cry REGISTEEL
	loadwildmon REGISTEEL, 16
	startbattle
	reloadmapafterbattle
	disappear REGISTEELLAIR_REGISTEEL
	end

RegisteelLair_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  11, 19, ROUTE_120, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 11, 05, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegisteelScript, -1
