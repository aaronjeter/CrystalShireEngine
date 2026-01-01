	object_const_def
	const CENTRALCITYPOKECENTER_NURSE
	const CENTRALCITYPOKECENTER_CHANSEY

CentralCityPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

CentralCityPokecenterNurseScript:
	jumpstd PokecenterNurseScript

CentralCityPokecenterChanseyScript:
	cry CHANSEY
	end

CentralCityPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  04,  07, CENTRAL_CITY, 14
	warp_event  05,  07, CENTRAL_CITY, 14

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CentralCityPokecenterNurseScript, -1
	object_event  7,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CentralCityPokecenterChanseyScript, -1
	