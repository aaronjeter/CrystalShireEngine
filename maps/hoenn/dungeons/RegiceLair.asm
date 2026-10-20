	object_const_def
	const REGICELAIR_REGICE

RegiceLair_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, RegiceLairMonSpritesCallback

RegiceLairMonSpritesCallback:
	setmonsprite SPRITE_MON_1, REGICE
	endcallback

RegiceScript:
	cry REGICE
	loadwildmon REGICE, 16
	startbattle
	reloadmapafterbattle
	disappear REGICELAIR_REGICE
	end

RegiceLair_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  8, 15, ROUTE_105, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 10, 7, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegiceScript, -1
