	object_const_def
	const SEAFOAMISLANDS1F_JYNX

SeafoamIslands1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, SeafoamIslands1FMonSpritesCallback

SeafoamIslands1FMonSpritesCallback:
	setmonsprite SPRITE_MON_1, JYNX
	endcallback

SeafoamIslands1F_Jynx:
	cry JYNX
	loadwildmon JYNX, 7
	startbattle
	reloadmapafterbattle
	disappear SEAFOAMISLANDS1F_JYNX
	end

SeafoamIslands1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 19, ROUTE_20, 2
	warp_event 19,  3, SEAFOAM_ISLANDS_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_MON_1, SPRITEMOVEDATA_WILDSPAWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslands1F_Jynx, -1
