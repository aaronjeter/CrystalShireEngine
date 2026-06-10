	object_const_def
	const LAVARIDGEPOKECENTER_NURSE
	const LAVARIDGEPOKECENTER_CHANSEY

LavaridgePokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

LavaridgePokecenterNurseScript:
	jumpstd PokecenterNurseScript

LavaridgePokecenterChanseyScript:
	cry CHANSEY
	end	

LavaridgePokecenterMareepScript:
	cry MAREEP
	end	

LavaridgePokecenterGrampsScript:
	jumptextfaceplayer LavaridgePokecenterGrampsText

LavaridgePokecenterGrampsText:
	text "People and"
	line "#mon both come"

	para "from far and wide"
	line "to enjoy the"
	cont "Lavaridge Springs."
	done

LavaridgePokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVARIDGE_TOWN, 1
	warp_event  5,  7, LAVARIDGE_TOWN, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 05, 01, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LavaridgePokecenterNurseScript, -1
	object_event 07, 01, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LavaridgePokecenterChanseyScript, -1
	object_event 08, 06, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, LavaridgePokecenterGrampsScript, -1
	object_event 02, 06, SPRITE_MAREEP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, LavaridgePokecenterMareepScript, -1
