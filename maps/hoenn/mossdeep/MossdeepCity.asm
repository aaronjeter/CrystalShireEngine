	object_const_def
	const MOSSDEEPCITY_SPACE_FAN
	const MOSSDEEPCITY_KID
	const MOSSDEEPCITY_WINGULL
	const MOSSDEEPCITY_GARDENER
	const MOSSDEEPCITY_OLD_MAN
	const MOSSDEEPCITY_SAILOR

MossdeepCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, MossdeepCityFlypointCallback
	callback MAPCALLBACK_SPRITES, MossdeepCityMonSpritesCallback

MossdeepCityMonSpritesCallback:
	setmonsprite SPRITE_MON_1, WINGULL
	endcallback

MossdeepCityFlypointCallback:
	setflag ENGINE_FLYPOINT_MOSSDEEP
	endcallback

MossdeepSpaceFanScript:
	jumptextfaceplayer MossdeepSpaceFanText

MossdeepKidScript:
	jumptextfaceplayer MossdeepKidText

MossdeepWingullScript:
	cry WINGULL
	end

MossdeepGardenerScript:
	jumptextfaceplayer MossdeepGardenerText

MossdeepOldManScript:
	jumptextfaceplayer MossdeepOldManText

MossdeepSailorScript:
	jumptextfaceplayer MossdeepSailorText

MossdeepSpaceFanText:
	text "The Space Center"
	line "is the pride of"
	cont "Mossdeep!"

	para "Someday they'll"
	line "launch a real"
	cont "rocket."
	done

MossdeepKidText:
	text "My Wingull won't"
	line "let me catch up!"
	done

MossdeepGardenerText:
	text "Flowers grow well"
	line "in the sea breeze."
	done

MossdeepOldManText:
	text "See that white"
	line "rock? I've sat by"
	cont "it for 50 years."

	para "The sea changes,"
	line "but it never does."
	done

MossdeepSailorText:
	text "I sailed in from"
	line "Lilycove. Surfing"
	cont "works too!"

	para "Shoal Cave is just"
	line "north of here."
	done

MossdeepSign:
	jumptext MossdeepSignText

MossdeepSignText:
	text "Mossdeep City"

	para "Our Slogan:"
	line "Cherish Pokemon"
	done

MossdeepGymSign:
	jumptext MossdeepGymSignText

MossdeepGymSignText:
	text "Mossdeep City"
	line "#mon Gym"

	para "Leaders: "
	line "Tate & Liza"

	para "The Twin"
	line "Masters"
	done

MossdeepCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 31, 15, MOSSDEEP_POKECENTER, 2
	warp_event 39, 17, MOSSDEEP_MART, 2
	warp_event 40, 09, MOSSDEEP_GYM, 2
	warp_event 23,  9, MOSSDEEP_SAILOR_HOUSE, 1
	warp_event 31,  9, MOSSDEEP_STONE_HOUSE, 1
	warp_event 23, 15, MOSSDEEP_HINT_HOUSE, 1
	warp_event 62, 15, MOSSDEEP_SPACE_CENTER, 1
	warp_event 65, 23, MOSSDEEP_STEVENS_HOUSE, 1

	def_coord_events

	def_bg_events	
	bg_event 27, 19, BGEVENT_READ, MossdeepSign
	bg_event 41,  9, BGEVENT_READ, MossdeepGymSign

	def_object_events
	object_event 60, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MossdeepSpaceFanScript, -1
	object_event 24, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MossdeepKidScript, -1
	object_event 26, 19, SPRITE_MON_1, SPRITEMOVEDATA_WILDSPAWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, OW_PINNED | OW_SKITTISH, MossdeepWingullScript, -1
	object_event 28, 10, SPRITE_GRANNY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MossdeepGardenerScript, -1
	object_event 58, 22, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MossdeepOldManScript, -1
	object_event 40, 30, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MossdeepSailorScript, -1
