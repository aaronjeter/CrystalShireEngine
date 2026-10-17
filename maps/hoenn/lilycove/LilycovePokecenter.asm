	object_const_def
	const LILYCOVEPOKECENTER_NURSE
	const LILYCOVEPOKECENTER_CHANSEY

LilycovePokecenter_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, LilycovePokecenterMonSpritesCallback

LilycovePokecenterMonSpritesCallback:
	setmonsprite SPRITE_MON_1, CHANSEY
	endcallback

LilycovePokecenterNurseScript:
	jumpstd PokecenterNurseScript

LilycovePokecenterChanseyScript:
	cry CHANSEY
	end

LilycovePokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LILYCOVE_CITY, 1
	warp_event  5,  7, LILYCOVE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LilycovePokecenterNurseScript, -1
	object_event  7,  1, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LilycovePokecenterChanseyScript, -1
	