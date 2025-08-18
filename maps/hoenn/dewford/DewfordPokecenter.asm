	object_const_def
	const DEWFORDPOKECENTER_NURSE
	const DEWFORDPOKECENTER_CHANSEY

DewfordPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

DewfordPokecenterNurseScript:
	jumpstd PokecenterNurseScript

DewfordPokecenterChanseyScript:
	cry CHANSEY
	end

DewfordPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, DEWFORD_TOWN, 2
	warp_event  5,  7, DEWFORD_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DewfordPokecenterNurseScript, -1
	object_event  7,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DewfordPokecenterChanseyScript, -1
	