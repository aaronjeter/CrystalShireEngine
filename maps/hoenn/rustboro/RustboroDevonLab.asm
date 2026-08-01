	object_const_def
	const RUSTBORODEVONLAB_RECEPTIONIST
	const RUSTBORODEVONLAB_FOSSIL_URSA
	const RUSTBORODEVONLAB_SCIENTIST
	const RUSTBORODEVONLAB_TEACHER

RustboroDevonLab_MapScripts:
	def_scene_scripts

	def_callbacks

RustboroDevonLabReceptionistScript:
	jumptextfaceplayer RustboroDevonLabReceptionistText

RustboroDevonLabReceptionistText:
	text "Hello! Welcome to"
	line "the Devon Science"
	cont "Center!"

	para "Our business is"
	line "life itself!"

	para "The ground floor"
	line "is for public"
	cont "research."

	para "Fossil intake is"
	line "handled upstairs."
	done

RustboroDevonLabScientistScript:
	jumptextfaceplayer RustboroDevonLabScientistText

RustboroDevonLabScientistText:
	text "Oh, hey trainer."
	line "Here at the Devon"
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
	cont "in Pewter City."
	done

RustboroDevonLabTeacherScript:
	jumptextfaceplayer RustboroDevonLabTeacherText

RustboroDevonLabTeacherText:
	text "Root Fossils are"
	line "from Lileep, and"
	cont "Claw are from"
	cont "Anorith."

	para "The scientists"
	line "here are always"
	cont "looking for more"
	cont "fossils."

	para "Trainers often"
	line "bring fossils to"
	cont "trade for #mon."
	done

RustboroDevonLabUrsaFossilSign:
	opentext
	writetext RustboroDevonLabUrsaFossilText
	showemote EMOTE_SHOCK, RUSTBORODEVONLAB_SCIENTIST, 15
	turnobject RUSTBORODEVONLAB_SCIENTIST, DOWN
	writetext RustboroDevonLabTakeUrsaText
	waitbutton
	verbosegiveitem URSA_FOSSIL
	setevent EVENT_GOT_FOSSIL_URSA_RUSTBORO
	disappear RUSTBORODEVONLAB_FOSSIL_URSA
	closetext
	end

RustboroDevonLabTakeUrsaText:
	text "You're a trainer!"

	para "Could you transit"
	line "this Fossil sample"
	cont "for us?"

	para "It contains a DNA"
	line "sample that could"
	cont "be used to clone"
	cont "a #mon!"

	para "Please take it to"
	line "Pewter City in"
	cont "Kanto."
	done

RustboroDevonLabUrsaFossilText:
	text "Fossilized jawbone"
	line "of an ancient"
	cont "ursine #mon."

	para "Extremely rare,"
	line "to be shipped to"
	cont "Pewter for"
	cont "further study."
	done

RustboroDevonLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  10, 07, RUSTBORO_CITY, 6
	warp_event  11, 07, RUSTBORO_CITY, 7
	warp_event  07, 07, RUSTBORO_DEVON_LAB_UPSTAIRS, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12, 04, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RustboroDevonLabReceptionistScript, -1
	object_event 00, 07, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RustboroDevonLabUrsaFossilSign, EVENT_GOT_FOSSIL_URSA_RUSTBORO
	object_event 01, 06, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RustboroDevonLabScientistScript, -1
	object_event 06, 02, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RustboroDevonLabTeacherScript, -1
