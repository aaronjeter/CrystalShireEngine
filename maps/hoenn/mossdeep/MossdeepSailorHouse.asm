	object_const_def
	const MOSSDEEPSAILORHOUSE_SAILOR

MossdeepSailorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MossdeepSailorHouseSailorScript:
	jumptextfaceplayer MossdeepSailorHouseSailorText

MossdeepSailorHouseSailorText:
	text "I sailed these"
	line "waters for years."

	para "North of Mossdeep"
	line "there's an islet"
	cont "with a cave."

	para "Shoal Cave! It's"
	line "cold and slippery"
	cont "inside."

	para "Spheal live there."
	line "They roll around"
	cont "on the ice!"
	done

MossdeepSailorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MOSSDEEP_CITY, 4
	warp_event  3,  7, MOSSDEEP_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MossdeepSailorHouseSailorScript, -1
