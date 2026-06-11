	object_const_def
	const FALLARBORMART_CLERK

FallarborMart_MapScripts:
	def_scene_scripts

	def_callbacks

FallarborMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end

FallarborMartGrampsScript:
	jumptextfaceplayer FallarborMartGrampsText

FallarborMartGrampsText:
	text "There isn't much"
	line "to see here in"
	cont "Fallarbor."

	para "Most people just"
	line "stock up here"
	cont "and move along."
	done

FallarborMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, FALLARBOR_TOWN, 2
	warp_event  5,  7, FALLARBOR_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 05, 01, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FallarborMart_Clerk, -1
	object_event 06, 04, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, FallarborMartGrampsScript, -1
