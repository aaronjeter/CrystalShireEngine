	object_const_def
	const SILVERTOWNHOUSE2_BLACKBELT

SilverTownHouse2_MapScripts:
	def_scene_scripts

	def_callbacks

SilverTownHouse2BlackBeltScript:
	jumptextfaceplayer SilverTownHouse2BlackBeltText

SilverTownHouse2BlackBeltText:
	text "Ice types are"
	line "everywhere in"
	cont "these mountains."
	para "Bring a good Fire"
	line "type if you have"
	cont "one!"
	done

SilverTownHouse2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SILVER_TOWN, 3
	warp_event  3,  7, SILVER_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverTownHouse2BlackBeltScript, -1
