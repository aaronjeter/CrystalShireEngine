	object_const_def
	const LITTLEROOTNEIGHBORHOUSE_MAN
	const LITTLEROOTNEIGHBORHOUSE_BOY

LittlerootNeighborHouse_MapScripts:
	def_scene_scripts

	def_callbacks

LittlerootNeighborHouseManScript:
	jumptextfaceplayer LittlerootNeighborHouseManText

LittlerootNeighborHouseBoyScript:
	jumptextfaceplayer LittlerootNeighborHouseBoyText

LittlerootNeighborHouseBookshelf:
	jumpstd PictureBookshelfScript

LittlerootNeighborHouseManText:
	text "Prof. Birch hands"
	line "out Treecko,"
	cont "Torchic and Mudkip"
	cont "to new trainers."

	para "Over in Johto,"
	line "Prof. Elm in New"
	cont "Bark Town does the"
	cont "same job."

	para "And in Kanto, it's"
	line "Prof. Oak in"
	cont "Pallet Town."

	para "Every region has"
	line "its own starters."
	cont "Seeing them all"
	cont "is quite a trip!"
	done

LittlerootNeighborHouseBoyText:
	text "When I grow up,"
	line "I'm picking"
	cont "Mudkip!"

	para "No wait, Torchic!"
	line "No, Treecko!"

	para "Ugh, it's too hard"
	line "to choose!"
	done

LittlerootNeighborHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LITTLEROOT_TOWN, 3
	warp_event  3,  7, LITTLEROOT_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, LittlerootNeighborHouseBookshelf
	bg_event 1,  1, BGEVENT_READ, LittlerootNeighborHouseBookshelf

	def_object_events
	object_event 5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootNeighborHouseManScript, -1
	object_event 2,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LittlerootNeighborHouseBoyScript, -1
