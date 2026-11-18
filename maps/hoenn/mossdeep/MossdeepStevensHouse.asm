	object_const_def
	const MOSSDEEPSTEVENSHOUSE_STEVEN

MossdeepStevensHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MossdeepStevensHouseStevenCallback

MossdeepStevensHouseStevenCallback:
	checkevent EVENT_BEAT_HOENN_LEAGUE
	iftrue .Home
	setevent EVENT_MOSSDEEP_STEVEN_AWAY
	endcallback

.Home:
	clearevent EVENT_MOSSDEEP_STEVEN_AWAY
	endcallback

MossdeepStevensHouseStevenScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_STEVENS_BELDUM
	iftrue .AlreadyGave
	writetext MossdeepStevenOfferText
	promptbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext MossdeepStevenReceivedText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BELDUM, 5
	special MakeLastPartyMonShiny
	setevent EVENT_GOT_STEVENS_BELDUM
	writetext MossdeepStevenTakeCareText
	waitbutton
	closetext
	end

.NoRoom:
	writetext MossdeepStevenNoRoomText
	waitbutton
	closetext
	end

.AlreadyGave:
	writetext MossdeepStevenAfterText
	waitbutton
	closetext
	end

MossdeepStevensHouseNote:
	checkevent EVENT_BEAT_HOENN_LEAGUE
	iftrue .Home
	jumptext MossdeepStevensHouseAwayText

.Home:
	jumptext MossdeepStevensHouseRocksText

MossdeepStevenOfferText:
	text "Steven: <PLAYER>!"
	line "Welcome to my"
	cont "home."

	para "Our battle at the"
	line "League was one I"
	cont "won't forget."

	para "I'd like you to"
	line "have this Beldum."

	para "Its color is rare."
	line "I found it deep in"
	cont "a cave, alone."

	para "I think it will"
	line "grow strong with"
	cont "you."
	done

MossdeepStevenReceivedText:
	text "<PLAYER> received"
	line "Beldum!"
	done

MossdeepStevenTakeCareText:
	text "Steven: Beldum"
	line "becomes Metagross"
	cont "with time."

	para "I look forward to"
	line "seeing it!"
	done

MossdeepStevenNoRoomText:
	text "Steven: Your party"
	line "is full. Make room"
	cont "and come back."
	done

MossdeepStevenAfterText:
	text "Steven: How is"
	line "Beldum doing?"

	para "Rare stones and"
	line "rare #mon..."

	para "Both shine when"
	line "they're cared for."
	done

MossdeepStevensHouseAwayText:
	text "A note on the"
	line "table..."

	para "Off to the League."
	line "Back when someone"
	cont "beats me. -Steven"
	done

MossdeepStevensHouseRocksText:
	text "Rare stones are"
	line "lined up neatly."
	done

MossdeepStevensHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MOSSDEEP_CITY, 8
	warp_event  3,  7, MOSSDEEP_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, MossdeepStevensHouseNote

	def_object_events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, MossdeepStevensHouseStevenScript, EVENT_MOSSDEEP_STEVEN_AWAY
