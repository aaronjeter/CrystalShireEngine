	object_const_def
	const SOOTOPOLISPOKECENTER_NURSE
	const SOOTOPOLISPOKECENTER_CHANSEY

SootopolisPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

SootopolisPokecenterNurseScript:
	jumpstd PokecenterNurseScript

SootopolisPokecenterChanseyScript:
	cry CHANSEY
	end

SootopolisPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, SOOTOPOLIS_CITY, 1
	warp_event  5,  7, SOOTOPOLIS_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, SootopolisPokecenterNurseScript, -1
	object_event  7,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, SootopolisPokecenterChanseyScript, -1
	