	object_const_def
	const SILVERTOWNHOUSE_GRANNY

SilverTownHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SilverTownHouseGrannyScript:
	jumptextfaceplayer SilverTownHouseGrannyText

SilverTownHouseGrannyText:
	text "Silver Town sits"
	line "in the shadow of"
	cont "Mt. Silver."
	para "The League was"
	line "built up here so"
	cont "only the strongest"
	cont "could reach it."
	done

SilverTownHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SILVER_TOWN, 2
	warp_event  3,  7, SILVER_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SilverTownHouseGrannyScript, -1
