	object_const_def
	const MOSSDEEPHINTHOUSE_GRANNY

MossdeepHintHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MossdeepHintHouseGrannyScript:
	jumptextfaceplayer MossdeepHintHouseGrannyText

MossdeepHintHouseGrannyText:
	text "Long ago, a great"
	line "sky dragon calmed"

	para "the fight between"
	line "the sea and land."

	para "They say it rests"
	line "high above Meteor"
	cont "Falls."

	para "And a small star"
	line "#mon sleeps in"

	para "a tunnel nearby,"
	line "waiting for a"
	cont "wish..."
	done

MossdeepHintHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MOSSDEEP_CITY, 6
	warp_event  3,  7, MOSSDEEP_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MossdeepHintHouseGrannyScript, -1
