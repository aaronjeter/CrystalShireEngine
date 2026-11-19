	object_const_def
	const SLATEPORTSHIPYARD_STERN
	const SLATEPORTSHIPYARD_WORKER

SlateportShipyard_MapScripts:
	def_scene_scripts

	def_callbacks

SlateportShipyardSternScript:
	jumptextfaceplayer SlateportShipyardSternText

SlateportShipyardWorkerScript:
	jumptextfaceplayer SlateportShipyardWorkerText

SlateportShipyardBookshelf:
	jumptext SlateportShipyardBookshelfText

SlateportShipyardSternText:
	text "I'm Stern. I build"
	line "ships here."

	para "The S.S. Aqua was"
	line "built right in"
	cont "this yard!"

	para "She sails to Johto"
	line "and Kanto now."

	para "Someday I'll build"
	line "a ship that can"
	cont "dive to the sea"
	cont "floor itself!"
	done

SlateportShipyardWorkerText:
	text "We're drawing up"
	line "plans for a new"
	cont "hull."

	para "Stern never stops"
	line "dreaming up new"
	cont "ships!"
	done

SlateportShipyardBookshelfText:
	text "Ship plans and"
	line "sea charts fill"
	cont "the shelves."
	done

SlateportShipyard_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SLATEPORT_CITY, 6
	warp_event  3,  7, SLATEPORT_CITY, 6

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, SlateportShipyardBookshelf
	bg_event 1,  1, BGEVENT_READ, SlateportShipyardBookshelf

	def_object_events
	object_event 5,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlateportShipyardSternScript, -1
	object_event 2,  4, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlateportShipyardWorkerScript, -1
