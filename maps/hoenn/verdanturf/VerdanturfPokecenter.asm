	object_const_def
	const VERDANTURFPOKECENTER_NURSE
	const VERDANTURFPOKECENTER_CHANSEY

VerdanturfPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

VerdanturfPokecenterNurseScript:
	jumpstd PokecenterNurseScript

VerdanturfPokecenterChanseyScript:
	cry CHANSEY
	end

VerdanturfPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, VERDANTURF_TOWN, 2
	warp_event  5,  7, VERDANTURF_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, VerdanturfPokecenterNurseScript, -1
	object_event  7,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, VerdanturfPokecenterChanseyScript, -1
	