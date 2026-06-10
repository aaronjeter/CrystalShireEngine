	object_const_def
	const LAVARIDGEMART_CLERK

LavaridgeMart_MapScripts:
	def_scene_scripts

	def_callbacks

LavaridgeMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_OLIVINE
	closetext
	end

LavaridgeMartCooltrainerScript:
	jumptextfaceplayer LavaridgeMartCooltrainerText

LavaridgeMartCooltrainerText:
	text "Ugh, I need"
	line "a Burn Heal"

	para "after facing"
	line "Flannery."
	done

LavaridgeMartCooltrainerFScript:
	jumptextfaceplayer LavaridgeMartCooltrainerFText

LavaridgeMartCooltrainerFText:
	text "I need to stock"
	line "up if I want"

	para "to explore the"
	line "Lavaridge Desert."
	done

LavaridgeMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVARIDGE_TOWN, 2
	warp_event  5,  7, LAVARIDGE_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavaridgeMart_Clerk, -1
	object_event 09, 06, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavaridgeMartCooltrainerScript, -1
	object_event 01, 03, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavaridgeMartCooltrainerFScript, -1
