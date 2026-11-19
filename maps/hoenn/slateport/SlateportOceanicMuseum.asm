	object_const_def
	const SLATEPORTOCEANICMUSEUM_CURATOR
	const SLATEPORTOCEANICMUSEUM_VISITOR1
	const SLATEPORTOCEANICMUSEUM_VISITOR2

SlateportOceanicMuseum_MapScripts:
	def_scene_scripts

	def_callbacks

SlateportOceanicMuseumCuratorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SLATEPORT_BIG_PEARL
	iftrue .Got
	writetext SlateportOceanicMuseumCuratorOfferText
	promptbutton
	verbosegiveitem BIG_PEARL
	iffalse .Done
	setevent EVENT_GOT_SLATEPORT_BIG_PEARL
.Got:
	writetext SlateportOceanicMuseumCuratorAfterText
	waitbutton
.Done:
	closetext
	end

SlateportOceanicMuseumVisitor1Script:
	jumptextfaceplayer SlateportOceanicMuseumVisitor1Text

SlateportOceanicMuseumVisitor2Script:
	jumptextfaceplayer SlateportOceanicMuseumVisitor2Text

SlateportOceanicMuseumExhibit:
	jumptext SlateportOceanicMuseumExhibitText

SlateportOceanicMuseumCuratorOfferText:
	text "Welcome to the"
	line "Oceanic Museum!"

	para "Hoenn is mostly"
	line "sea, you know."

	para "Currents, tides,"
	line "the deep sea..."

	para "Here, a gift for"
	line "our visitor. It"
	cont "washed up on the"
	cont "beach out front."
	done

SlateportOceanicMuseumCuratorAfterText:
	text "The sea gives us"
	line "so much. Treasure"
	cont "it, and it will"
	cont "treasure you."
	done

SlateportOceanicMuseumVisitor1Text:
	text "The old stories"
	line "say a great sea"
	cont "#mon made"
	cont "Hoenn's oceans."

	para "Do you think it's"
	line "still out there?"
	done

SlateportOceanicMuseumVisitor2Text:
	text "Look at this model"
	line "of the S.S. Aqua!"

	para "It was built in"
	line "Stern's shipyard"
	cont "right here in"
	cont "Slateport."
	done

SlateportOceanicMuseumExhibitText:
	text "Exhibits on sea"
	line "currents, tides"
	cont "and the #mon"
	cont "of the deep."
	done

SlateportOceanicMuseum_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, SLATEPORT_CITY, 5
	warp_event  5, 11, SLATEPORT_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  7,  1, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  8,  1, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  9,  1, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  0,  7, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  1,  7, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  2,  7, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  3,  7, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  6,  7, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  7,  7, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  8,  7, BGEVENT_READ, SlateportOceanicMuseumExhibit
	bg_event  9,  7, BGEVENT_READ, SlateportOceanicMuseumExhibit

	def_object_events
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlateportOceanicMuseumCuratorScript, -1
	object_event  1,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SlateportOceanicMuseumVisitor1Script, -1
	object_event  8,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlateportOceanicMuseumVisitor2Script, -1
