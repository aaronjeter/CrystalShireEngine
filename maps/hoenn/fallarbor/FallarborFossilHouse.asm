	object_const_def
	const FALLARBORFOSSILHOUSE_MANIAC
	const FALLARBORFOSSILHOUSE_BOY

FallarborFossilHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FallarborFossilHouseManiacScript:
	jumptextfaceplayer FallarborFossilHouseManiacText

FallarborFossilHouseBoyScript:
	jumptextfaceplayer FallarborFossilHouseBoyText

FallarborFossilHouseBookshelf:
	jumptext FallarborFossilHouseBookshelfText

FallarborFossilHouseManiacText:
	text "Fossils! I love"
	line "fossils!"

	para "The tunnels under"
	line "Meteor Falls and"
	cont "the ruins out in"
	cont "the desert..."

	para "Both hold Root and"
	line "Claw Fossils!"

	para "Take any you find"
	line "to Devon in"
	cont "Rustboro. They can"
	cont "bring them back!"
	done

FallarborFossilHouseBoyText:
	text "My big brother"
	line "digs everywhere."

	para "He even dug up"
	line "Mom's garden once!"
	done

FallarborFossilHouseBookshelfText:
	text "Books about"
	line "fossils and old"
	cont "rocks."
	done

FallarborFossilHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FALLARBOR_TOWN, 5
	warp_event  3,  7, FALLARBOR_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, FallarborFossilHouseBookshelf
	bg_event 1,  1, BGEVENT_READ, FallarborFossilHouseBookshelf

	def_object_events
	object_event 5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FallarborFossilHouseManiacScript, -1
	object_event 2,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FallarborFossilHouseBoyScript, -1
