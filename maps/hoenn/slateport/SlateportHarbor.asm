	object_const_def
	const SLATEPORTHARBOR_SAILOR1
	const SLATEPORTHARBOR_SAILOR2

SlateportHarbor_MapScripts:
	def_scene_scripts

	def_callbacks

SlateportHarborDockSailorScript:
	jumptextfaceplayer SlateportHarborDockSailorText

SlateportHarborFastShipSailorScript:
	faceplayer
	opentext
	writetext SlateportHarborAskBoardText
	yesorno
	iffalse SlateportHarborNotRidingScript
	writetext SlateportHarborAskTicketText
	promptbutton
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext SlateportHarborFlashTicketText
	promptbutton
	farscall FastShipFromSlateportScript
	iffalse SlateportHarborNotRidingScript
	writetext SlateportHarborGetOnBoardText
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end

.NoTicket:
	writetext SlateportHarborNoTicketText
	waitbutton
	closetext
	end

SlateportHarborNotRidingScript:
	writetext SlateportHarborComeAgainText
	waitbutton
	closetext
	end

SlateportHarborDockSailorText:
	text "The Fast Ship"
	line "S.S.Aqua docks at"
	cont "the other pier."

	para "It sails to Johto"
	line "and Kanto."
	done

SlateportHarborAskBoardText:
	text "Welcome to Fast"
	line "Ship S.S.Aqua."

	para "Will you be board-"
	line "ing today?"
	done

SlateportHarborAskTicketText:
	text "May I see your"
	line "S.S.Ticket?"
	done

SlateportHarborFlashTicketText:
	text "<PLAYER> flashed"
	line "the S.S.Ticket."

	para "That's it."
	line "Thank you!"
	done

SlateportHarborNoTicketText:
	text "<PLAYER> tried to"
	line "show the S.S."
	cont "Ticket…"

	para "…But no Ticket!"

	para "Sorry!"
	line "You may board only"

	para "if you have an"
	line "S.S.Ticket."
	done

SlateportHarborGetOnBoardText:
	text "We're departing"
	line "soon. Please get"
	cont "on board."
	done

SlateportHarborComeAgainText:
	text "We hope to see you"
	line "again!"
	done

SlateportHarbor_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  15, SLATEPORT_CITY, 3
	warp_event  5,  15, SLATEPORT_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  13, 1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlateportHarborDockSailorScript, -1
	object_event  13, 9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlateportHarborFastShipSailorScript, -1