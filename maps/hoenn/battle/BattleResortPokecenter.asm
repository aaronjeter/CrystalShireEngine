	object_const_def
	const BATTLERESORTPOKECENTER_NURSE
	const BATTLERESORTPOKECENTER_CHANSEY

BattleResortPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

BattleResortPokecenterNurseScript:
	jumpstd PokecenterNurseScript

BattleResortPokecenterChanseyScript:
	cry CHANSEY
	end

BattleResortPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, BATTLE_RESORT, 1
	warp_event  5,  7, BATTLE_RESORT, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, BattleResortPokecenterNurseScript, -1
	object_event  7,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, BattleResortPokecenterChanseyScript, -1
	