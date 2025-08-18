	object_const_def
	const RUSTBOROPOKECENTER_NURSE
	const RUSTBOROPOKECENTER_CHANSEY

RustboroPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

RustboroPokecenterNurseScript:
	jumpstd PokecenterNurseScript

RustboroPokecenterChanseyScript:
	cry CHANSEY
	end

RustboroPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, RUSTBORO_CITY, 2
	warp_event  5,  7, RUSTBORO_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterNurseScript, -1
	object_event  7,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterChanseyScript, -1
	