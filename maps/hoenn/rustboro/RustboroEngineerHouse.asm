	object_const_def
	const RUSTBOROENGINEERHOUSE_ENGINEER
	const RUSTBOROENGINEERHOUSE_KID

RustboroEngineerHouse_MapScripts:
	def_scene_scripts

	def_callbacks

RustboroEngineerHouseEngineerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_METAL_COAT
	iftrue .Got
	writetext RustboroEngineerHouseOfferText
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .Done
	setevent EVENT_GOT_HOENN_METAL_COAT
.Got:
	writetext RustboroEngineerHouseAfterText
	waitbutton
.Done:
	closetext
	end

RustboroEngineerHouseKidScript:
	jumptextfaceplayer RustboroEngineerHouseKidText

RustboroEngineerHouseBookshelf:
	jumpstd PictureBookshelfScript

RustboroEngineerHouseOfferText:
	text "I build parts for"
	line "Devon all day."

	para "This coating came"
	line "out a little too"
	cont "thick. Devon won't"
	cont "use it."

	para "Maybe your #mon"
	line "can. Take it!"
	done

RustboroEngineerHouseAfterText:
	text "A Metal Coat makes"
	line "Steel-type moves"
	cont "stronger."

	para "Some #mon even"
	line "evolve with it"
	cont "when traded!"
	done

RustboroEngineerHouseKidText:
	text "My dad works at"
	line "Devon! He says"
	cont "they make the best"
	cont "gadgets in Hoenn."
	done

RustboroEngineerHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUSTBORO_CITY, 11
	warp_event  3,  7, RUSTBORO_CITY, 11

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, RustboroEngineerHouseBookshelf
	bg_event 1,  1, BGEVENT_READ, RustboroEngineerHouseBookshelf

	def_object_events
	object_event 5,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RustboroEngineerHouseEngineerScript, -1
	object_event 2,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RustboroEngineerHouseKidScript, -1
