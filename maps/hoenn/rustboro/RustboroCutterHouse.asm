	object_const_def
	const RUSTBOROCUTTERHOUSE_MRCUT

RustboroCutterHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrCutScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HATCHET
	iftrue MrCutScript_AfterHatchet

	writetext MrCutGiveHatchetText
	waitbutton 
	verbosegiveitem HATCHET
	setevent EVENT_GOT_HATCHET
	waitbutton
	closetext
	end

MrCutScript_AfterHatchet:
	writetext MrCutAlreadyGivenHatchetText
	waitbutton
	closetext
	end

MrCutGiveHatchetText:
	text "You look like"
	line "you traveled"
	cont "a ways to get"
	cont "here."

	para "I used to"
	line "clear trees"
	cont "to keep the"
	cont "roads clear."

	para "Since I've"
	line "retired, it's"
	cont "gotten a little"
	cont "harder to get"
	cont "around."

	para "Here, take"
	line "my spare HATCHET."

	para "It'll let you"
	line "clear small"
	cont "trees."

	para "Should be nice"
	line "in PETALBURG"
	cont "WOODS."
	done

MrCutAlreadyGivenHatchetText:
	text "I hope that"
	line "HATCHET of"
	cont "mine serves"
	cont "you well."
	done

RustboroCutterHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUSTBORO_CITY, 4
	warp_event  3,  7, RUSTBORO_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrCutScript, -1
