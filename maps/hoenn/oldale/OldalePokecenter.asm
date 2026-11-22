	object_const_def
	const OLDALEPOKECENTER_NURSE
	const OLDALEPOKECENTER_CHANSEY
	const OLDALEPOKECENTER_FISHER
	const OLDALEPOKECENTER_AIDE
	const OLDALEPOKECENTER_LASS

OldalePokecenter_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, OldalePokecenterMonSpritesCallback

OldalePokecenterMonSpritesCallback:
	setmonsprite SPRITE_MON_1, CHANSEY
	endcallback

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

OldalePokecenterAideScript:
	jumptextfaceplayer OldalePokecenterAideText

OldalePokecenterAideText:
	text "I'm one of Prof."
	line "Birch's aides."

	para "On Route 101 you"
	line "can find Wurmple,"
	cont "Zigzagoon and"
	cont "Poochyena."

	para "Catch a few to"
	line "fill your #dex!"
	done

OldalePokecenterLassScript:
	jumptextfaceplayer OldalePokecenterLassText

OldalePokecenterLassText:
	text "Hurt #mon?"
	line "The nurse here"
	cont "heals them for"
	cont "free!"

	para "Rest up before"
	line "you head out."
	done

OldalePokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, OLDALE_TOWN, 1
	warp_event  6,  7, OLDALE_TOWN, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  05,  01, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, OldalePokecenterNurseScript, -1
	object_event  6,  1, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePokecenterChanseyScript, -1
	object_event  12,  03, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldalePokecenterFisherScript, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OldalePokecenterAideScript, -1
	object_event  8,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePokecenterLassScript, -1
