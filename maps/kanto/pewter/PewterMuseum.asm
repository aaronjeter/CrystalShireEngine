	object_const_def
	const PEWTERMUSEUM_RECEPTIONIST
	const PEWTERMUSEUM_MOON_STONE
	const PEWTERMUSEUM_OLD_AMBER
	const PEWTERMUSEUM_FOSSIL_FIN
	const PEWTERMUSEUM_SCIENTIST
	const PEWTERMUSEUM_TEACHER

PewterMuseum_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseumReceptionistScript:
	jumptextfaceplayer PewterMuseumReceptionistText

PewterMuseumReceptionistText:
	text "Hello! Welcome to"
	line "the Pewter Museum"
	cont "of Science!"

	para "Exhibits are on"
	line "the ground floor."

	para "Fossils are now"
	line "handled upstairs."
	done

PewterMuseumScientistScript:
	jumptextfaceplayer PewterMuseumScientistText

PewterMuseumScientistText:
	text "Oh, hey trainer."
	line "Here at the"
	cont "Science Center, we"
	cont "clone #mon from"
	cont "ancient DNA."

	para "We're trying to"
	line "breed a stable"
	cont "population, so"
	cont "every bit of DNA"
	cont "helps!"

	para "Some species we"
	line "process upstairs."

	para "Others are handled"
	line "by our partners"
	cont "in Rustboro City."
	done

PewterMuseumTeacherScript:
	jumptextfaceplayer PewterMuseumTeacherText

PewterMuseumTeacherText:
	text "Dome Fossils are"
	line "from Kabuto, and"
	cont "Helix are from"
	cont "Omanyte."

	para "The scientists"
	line "here are always"
	cont "looking for more"
	cont "fossils."

	para "Trainers often"
	line "bring fossils to"
	cont "trade for #mon."
	done

PewterMuseumCaseSign:
	jumptext PewterMuseumCaseText

PewterMuseumCaseText:
	text "Dome and Helix"
	line "Fossils. "

	para "Unearthed locally"
	line "at Mt Moon."
	done

PewterMuseumMoonstoneSign:
	jumptext PewterMuseumMoonstoneText

PewterMuseumMoonstoneText:
	text "A Moon stone that"
	line "fell from the sky."

	para "Unearthed locally"
	line "at Mt Moon."
	done

PewterMuseumOldAmberSign:
	jumptext PewterMuseumOldAmberText

PewterMuseumOldAmberText:
	text "Ancient Resin with"
	line "trace DNA of an"
	cont "ancient #mon."

	para "Unearthed locally"
	line "during construct-"
	cont "ion of Pewter Gym."
	done

PewterMuseumFinFossilSign:
	opentext
	writetext PewterMuseumFinFossilText
	showemote EMOTE_SHOCK, PEWTERMUSEUM_SCIENTIST, 15
	turnobject PEWTERMUSEUM_SCIENTIST, DOWN
	writetext PewterMuseumTakeFinText
	waitbutton
	verbosegiveitem FIN_FOSSIL
	setevent EVENT_GOT_FOSSIL_FIN_PEWTER_MUSEUM
	disappear PEWTERMUSEUM_FOSSIL_FIN
	closetext
	end

PewterMuseumTakeFinText:
	text "You're a trainer!"

	para "Could you transit"
	line "this Fossil sample"
	cont "for us?"

	para "It contains a DNA"
	line "sample that could"
	cont "be used to clone"
	cont "a #mon!"

	para "Please take it to"
	line "Rustboro City in"
	cont "Hoenn."
	done

PewterMuseumFinFossilText:
	text "Fossilized remains"
	line "of an aquatic"
	cont "#mon."

	para "Extremely rare,"
	line "to be shipped to"
	cont "Rustboro for"
	cont "further study."
	done

PewterMuseum_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  10, 07, PEWTER_CITY, 6
	warp_event  11, 07, PEWTER_CITY, 6
	warp_event  16, 07, PEWTER_CITY, 7
	warp_event  17, 07, PEWTER_CITY, 7

	def_coord_events

	def_bg_events
	bg_event 02, 03, BGEVENT_READ, PewterMuseumCaseSign

	def_object_events
	object_event 12, 04, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseumReceptionistScript, -1
	object_event 01, 06, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseumMoonstoneSign, -1
	object_event 04, 06, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseumOldAmberSign, -1
	object_event 16, 02, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseumFinFossilSign, EVENT_GOT_FOSSIL_FIN_PEWTER_MUSEUM
	object_event 17, 02, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseumScientistScript, -1
	object_event 06, 02, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterMuseumTeacherScript, -1
