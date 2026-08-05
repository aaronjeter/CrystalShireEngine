	object_const_def
	const JIRACHINEST_JIRACHI

JirachiNest_MapScripts:
	def_scene_scripts

	def_callbacks

JirachiScript:
	cry JIRACHI
	loadwildmon JIRACHI, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_JIRACHI
	disappear JIRACHINEST_JIRACHI
	end

JirachiNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 05, 13, METEOR_TUNNEL_EAST, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  04,  00, SPRITE_JIRACHI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, JirachiScript, EVENT_GOT_JIRACHI
	