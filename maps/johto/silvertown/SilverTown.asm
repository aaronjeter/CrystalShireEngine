	object_const_def
	const SILVERTOWN_COOLTRAINERF
	const SILVERTOWN_GRAMPS

SilverTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SilverTownFlypointCallback

SilverTownFlypointCallback:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	endcallback

SilverTownCooltrainerFScript:
	jumptextfaceplayer SilverTownCooltrainerFText

SilverTownCooltrainerFText:
	text "The Elite Four"
	line "here fight with"
	cont "everything they"
	cont "have."
	para "Stock up in the"
	line "lobby before you"
	cont "go in!"
	done

SilverTownGrampsScript:
	jumptextfaceplayer SilverTownGrampsText

SilverTownGrampsText:
	text "Long ago, only"
	line "the bravest"
	cont "trainers dared to"
	cont "cross the pass."
	para "Now look! A whole"
	line "town has grown up"
	cont "around the League!"
	done

SilverTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20, 13, SILVER_LEAGUE_LOBBY, 1
	warp_event  7, 13, SILVER_TOWN_HOUSE, 1
	warp_event 35, 13, SILVER_TOWN_HOUSE_2, 1
	warp_event 21, 13, SILVER_LEAGUE_LOBBY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 30, 22, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverTownCooltrainerFScript, -1
	object_event  5, 24, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilverTownGrampsScript, -1
