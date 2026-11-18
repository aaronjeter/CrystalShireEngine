Route125_MapScripts:
	def_scene_scripts

	def_callbacks

Route125Lamar:
	trainer SWIMMERM, ROUTE125_LAMAR, EVENT_BEAT_ROUTE125_LAMAR, Route125LamarSeenText, Route125LamarBeatenText, 0, .Script

.Script:
	trainerafter Route125LamarAfterBattleText

Route125LamarSeenText:
	text "My #mon is as"
	line "big as an island!"
	done

Route125LamarBeatenText:
	text "Sunk by a little"
	line "guy like you?"
	done

Route125LamarAfterBattleText:
	text "Wailord can dive"
	line "deeper than any"
	cont "other #mon."
	done

Route125Tanya:
	trainer SWIMMERF, ROUTE125_TANYA, EVENT_BEAT_ROUTE125_TANYA, Route125TanyaSeenText, Route125TanyaBeatenText, 0, .Script

.Script:
	trainerafter Route125TanyaAfterBattleText

Route125TanyaSeenText:
	text "The tide is going"
	line "out. Perfect time"
	cont "for a battle!"
	done

Route125TanyaBeatenText:
	text "Washed up!"
	done

Route125TanyaAfterBattleText:
	text "The cave on that"
	line "islet is full of"
	cont "ice inside."
	done

Route125Rudy:
	trainer SAILOR, ROUTE125_RUDY, EVENT_BEAT_ROUTE125_RUDY, Route125RudySeenText, Route125RudyBeatenText, 0, .Script

.Script:
	trainerafter Route125RudyAfterBattleText

Route125RudySeenText:
	text "Ahoy! Nobody gets"
	line "into Shoal Cave"
	cont "without a battle!"
	done

Route125RudyBeatenText:
	text "Abandon ship!"
	done

Route125RudyAfterBattleText:
	text "Shoal Cave is cold"
	line "and slippery."

	para "The deepest floor"
	line "is solid ice!"
	done

Route125StarPiece:
	itemball STAR_PIECE

Route125_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  9, SHOAL_CAVE_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 24, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, Route125Lamar, -1
	object_event 12, 30, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, Route125Tanya, -1
	object_event 14, 10, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route125Rudy, -1
	object_event 30, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route125StarPiece, EVENT_ROUTE_125_STAR_PIECE
