	object_const_def
	const EVERGRANDEPOKECENTER_NURSE
	const EVERGRANDEPOKECENTER_CHANSEY

EvergrandePokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

EvergrandePokecenterNurseScript:
	jumpstd PokecenterNurseScript

EvergrandePokecenterChanseyScript:
	cry CHANSEY
	end

EvergrandePokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, EVERGRANDE_CITY, 1
	warp_event  5,  7, EVERGRANDE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, EvergrandePokecenterNurseScript, -1
	object_event  7,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, EvergrandePokecenterChanseyScript, -1
	