	object_const_def
	const LILYCOVEMUSEUM_CURATOR
	const LILYCOVEMUSEUM_VISITOR1
	const LILYCOVEMUSEUM_VISITOR2

LilycoveMuseum_MapScripts:
	def_scene_scripts

	def_callbacks

LilycoveMuseumCuratorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_DRAGON_SCALE
	iftrue .Got
	writetext LilycoveMuseumCuratorOfferText
	promptbutton
	verbosegiveitem DRAGON_SCALE
	iffalse .Done
	setevent EVENT_GOT_HOENN_DRAGON_SCALE
.Got:
	writetext LilycoveMuseumCuratorAfterText
	waitbutton
.Done:
	closetext
	end

LilycoveMuseumVisitor1Script:
	jumptextfaceplayer LilycoveMuseumVisitor1Text

LilycoveMuseumVisitor2Script:
	jumptextfaceplayer LilycoveMuseumVisitor2Text

LilycoveMuseumPainting:
	jumptext LilycoveMuseumPaintingText

LilycoveMuseumCuratorOfferText:
	text "Welcome to the"
	line "Lilycove Museum."

	para "Our paintings show"
	line "#mon from all"
	cont "over Hoenn."

	para "An artist left"
	line "this behind. It"
	cont "shimmers like"
	cont "fresh paint."

	para "Please, take it."
	line "Art is meant to"
	cont "be shared!"
	done

LilycoveMuseumCuratorAfterText:
	text "A Dragon Scale"
	line "makes Dragon-type"
	cont "moves stronger."

	para "Some #mon even"
	line "evolve with it"
	cont "when traded!"
	done

LilycoveMuseumVisitor1Text:
	text "This painting of"
	line "a Wailord is so"
	cont "big it fills the"
	cont "whole wall!"
	done

LilycoveMuseumVisitor2Text:
	text "I came all the"
	line "way from Slateport"
	cont "to see the art."
	done

LilycoveMuseumPaintingText:
	text "A painting of"
	line "#mon at the"
	cont "seashore. It"
	cont "feels calm."
	done

LilycoveMuseum_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, LILYCOVE_CITY, 8
	warp_event  5, 11, LILYCOVE_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  7,  1, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  8,  1, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  9,  1, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  0,  7, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  1,  7, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  2,  7, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  3,  7, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  6,  7, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  7,  7, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  8,  7, BGEVENT_READ, LilycoveMuseumPainting
	bg_event  9,  7, BGEVENT_READ, LilycoveMuseumPainting

	def_object_events
	object_event  4,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LilycoveMuseumCuratorScript, -1
	object_event  7,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LilycoveMuseumVisitor1Script, -1
	object_event  1,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LilycoveMuseumVisitor2Script, -1
