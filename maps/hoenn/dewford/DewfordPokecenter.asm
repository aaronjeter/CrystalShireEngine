	object_const_def
	const DEWFORDPOKECENTER_NURSE
	const DEWFORDPOKECENTER_CHANSEY
	const DEWFORDPOKECENTER_YOUNGSTER
	const DEWFORDPOKECENTER_VULPIX

DewfordPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

DewfordPokecenterNurseScript:
	jumpstd PokecenterNurseScript

DewfordPokecenterChanseyScript:
	cry CHANSEY
	end

DewfordPokecenterVulpixScript:
	cry VULPIX
	end

DewfordPokecenterYoungsterScript:
	jumptextfaceplayer DewfordPokecenterYoungsterText

DewfordPokecenterYoungsterText:
	text "I saw Brawly"
	line "heading down"

	para "into the cave"
	line "North of town."

	para "I wonder why"
	line "he trains down"
	cont "there..."
	done

DewfordPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, DEWFORD_TOWN, 2
	warp_event  5,  7, DEWFORD_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  05, 01, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DewfordPokecenterNurseScript, -1
	object_event  07, 01, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DewfordPokecenterChanseyScript, -1
	object_event  09, 05, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DewfordPokecenterYoungsterScript, -1
	object_event  09, 06, SPRITE_VULPIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DewfordPokecenterVulpixScript, -1
	