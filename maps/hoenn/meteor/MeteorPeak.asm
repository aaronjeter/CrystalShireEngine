	object_const_def
	const METEORPEAK_RAYQUAZA

MeteorPeak_MapScripts:
	def_scene_scripts

	def_callbacks

RayquazaScript:
	cry RAYQUAZA
	loadwildmon RAYQUAZA, 11
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_RAYQUAZA
	disappear METEORPEAK_RAYQUAZA
	end

MeteorPeak_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 51, 53, METEOR_FALLS, 4
	warp_event 09, 53, METEOR_FALLS, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  42,  18, SPRITE_RAYQUAZA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RayquazaScript, EVENT_GOT_RAYQUAZA
	