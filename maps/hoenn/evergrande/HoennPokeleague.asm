	object_const_def
	const HOENNPOKELEAGUE_NURSE
	const HOENNPOKELEAGUE_CHANSEY

HoennPokeleague_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, HoennPokeleagueFlypointCallback

HoennPokeleagueFlypointCallback:
	setflag ENGINE_FLYPOINT_EVERGRANDE
	endcallback

HoennPokeleagueNurseScript:
	jumpstd PokecenterNurseScript

HoennPokeleagueChanseyScript:
	cry CHANSEY
	end

HoennPokeleague_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, EVERGRANDE_CITY, 2
	warp_event  7,  7, EVERGRANDE_CITY, 2
	warp_event  8,  0, SIDNEYS_ROOM, 1
	warp_event  9,  0, SIDNEYS_ROOM, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  03, 01, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HoennPokeleagueNurseScript, -1
	object_event  04, 01, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, HoennPokeleagueChanseyScript, -1
	