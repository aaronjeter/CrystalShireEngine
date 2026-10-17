	object_const_def
	const REGIROCKLAIR_REGIROCK

RegirockLair_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_OBJECTS, RegirockLairMonSpritesCallback

RegirockLairMonSpritesCallback:
	setmonsprite SPRITE_MON_1, REGIROCK
	endcallback

RegirockScript:
	cry REGIROCK
	loadwildmon REGIROCK, 16
	startbattle
	reloadmapafterbattle
	disappear REGIROCKLAIR_REGIROCK
	end

RegirockLair_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  11, 19, DESERT_RUIN_B1F, 4

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 12, 06, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegirockScript, -1
