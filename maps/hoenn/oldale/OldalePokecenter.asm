	object_const_def
	const OLDALEPOKECENTER_NURSE
	const OLDALEPOKECENTER_CHANSEY
	const OLDALEPOKECENTER_FISHER

OldalePokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

OldalePokecenterNurseScript:
	jumpstd PokecenterNurseScript

OldalePokecenterChanseyScript:
	cry CHANSEY
	end

OldalePokecenterFisherScript:
	jumptextfaceplayer OldalePokecenterFisherText

OldalePokecenterFisherText:
	text "It's great. I can"
	line "store any number"

	para "of #mon, and"
	line "it's all free."
	done

OldalePokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, OLDALE_TOWN, 1
	warp_event  5,  7, OLDALE_TOWN, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  05,  01, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, OldalePokecenterNurseScript, -1
	object_event  07,  01, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, OldalePokecenterChanseyScript, -1
	object_event  12,  03, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldalePokecenterFisherScript, -1
