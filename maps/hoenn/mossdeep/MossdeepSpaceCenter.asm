	object_const_def
	const MOSSDEEPSPACECENTER_DIRECTOR
	const MOSSDEEPSPACECENTER_TELESCOPE
	const MOSSDEEPSPACECENTER_COUNTDOWN

MossdeepSpaceCenter_MapScripts:
	def_scene_scripts

	def_callbacks

MossdeepSpaceCenterDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_IRON_BUNDLE
	iftrue .AlreadyGave
	checkevent EVENT_BEAT_HOENN_LEAGUE
	iftrue .Offer
	writetext MossdeepSpaceCenterSignalText
	waitbutton
	closetext
	end

.Offer:
	writetext MossdeepSpaceCenterOfferText
	promptbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext MossdeepSpaceCenterReceivedText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke IRONBUNDLE, 50
	setevent EVENT_GOT_IRON_BUNDLE
	writetext MossdeepSpaceCenterTakeCareText
	waitbutton
	closetext
	end

.NoRoom:
	writetext MossdeepSpaceCenterNoRoomText
	waitbutton
	closetext
	end

.AlreadyGave:
	writetext MossdeepSpaceCenterAfterText
	waitbutton
	closetext
	end

MossdeepSpaceCenterTelescopeScript:
	jumptextfaceplayer MossdeepSpaceCenterTelescopeText

MossdeepSpaceCenterCountdownScript:
	jumptextfaceplayer MossdeepSpaceCenterCountdownText

MossdeepSpaceCenterBookshelf:
	jumptext MossdeepSpaceCenterBookshelfText

MossdeepSpaceCenterSignalText:
	text "We've been picking"
	line "up a strange"
	cont "signal lately."

	para "It's coming from"
	line "something that"
	cont "fell from the sky."

	para "Only the League"
	line "Champion would be"

	para "strong enough to"
	line "help us with it..."
	done

MossdeepSpaceCenterOfferText:
	text "The Champion!"
	line "Perfect timing."

	para "The signal came"
	line "from a #mon"
	cont "inside a capsule."

	para "Its body is made"
	line "of metal parts..."

	para "Is it from the"
	line "future? We can't"
	cont "tell!"

	para "We think it would"
	line "be happier with a"
	cont "strong trainer."

	para "Please, take it!"
	done

MossdeepSpaceCenterReceivedText:
	text "<PLAYER> received"
	line "Iron Bundle!"
	done

MossdeepSpaceCenterTakeCareText:
	text "Take good care of"
	line "it. And tell us"

	para "if it ever says"
	line "where it came"
	cont "from!"
	done

MossdeepSpaceCenterNoRoomText:
	text "Oh, your party is"
	line "full. Come back"
	cont "with room for it."
	done

MossdeepSpaceCenterAfterText:
	text "How's Iron Bundle"
	line "doing?"

	para "The signal has"
	line "stopped since it"
	cont "left with you."
	done

MossdeepSpaceCenterTelescopeText:
	text "I watch the sky"
	line "every night."

	para "Sometimes a star"
	line "seems to fall"

	para "toward the tunnels"
	line "near Meteor Falls."

	para "They say a #mon"
	line "that grants wishes"
	cont "sleeps there..."
	done

MossdeepSpaceCenterCountdownText:
	text "T minus..."
	line "Oh, sorry!"

	para "I practice the"
	line "launch countdown"
	cont "every day."

	para "One day we'll"
	line "send a rocket up"
	cont "for real!"
	done

MossdeepSpaceCenterBookshelfText:
	text "Books about stars"
	line "and planets."
	done

MossdeepSpaceCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, MOSSDEEP_CITY, 7
	warp_event  5, 11, MOSSDEEP_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  7,  1, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  8,  1, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  9,  1, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  0,  7, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  1,  7, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  2,  7, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  3,  7, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  6,  7, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  7,  7, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  8,  7, BGEVENT_READ, MossdeepSpaceCenterBookshelf
	bg_event  9,  7, BGEVENT_READ, MossdeepSpaceCenterBookshelf

	def_object_events
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MossdeepSpaceCenterDirectorScript, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MossdeepSpaceCenterTelescopeScript, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MossdeepSpaceCenterCountdownScript, -1
