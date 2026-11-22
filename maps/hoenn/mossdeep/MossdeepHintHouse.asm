	object_const_def
	const MOSSDEEPHINTHOUSE_GRANNY

MossdeepHintHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MossdeepHintHouseGrannyScript:
; one-time gift: TwistedSpoon
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_TWISTEDSPOON
	iftrue .Gave
	writetext MossdeepHintHouseGrannyGiftText
	promptbutton
	verbosegiveitem TWISTEDSPOON
	iffalse .NoRoom
	setevent EVENT_GOT_HOENN_TWISTEDSPOON
	writetext MossdeepHintHouseGrannyGiftAfterText
	waitbutton
.NoRoom:
	closetext
	end

.Gave:
	writetext MossdeepHintHouseGrannyText
	waitbutton
	closetext
	end

MossdeepHintHouseGrannyGiftText:
	text "My grandson bent"
	line "this spoon with"
	cont "his mind!"

	para "I can't eat with"
	line "it now. Take it,"
	cont "dearie."
	done

MossdeepHintHouseGrannyGiftAfterText:
	text "A TwistedSpoon"
	line "powers up Psychic"
	cont "moves."

	para "Mossdeep is full"
	line "of strange gifts!"
	done


MossdeepHintHouseGrannyText:
	text "Long ago, a great"
	line "sky dragon calmed"

	para "the fight between"
	line "the sea and land."

	para "They say it rests"
	line "high above Meteor"
	cont "Falls."

	para "And a small star"
	line "#mon sleeps in"

	para "a tunnel nearby,"
	line "waiting for a"
	cont "wish..."
	done

MossdeepHintHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MOSSDEEP_CITY, 6
	warp_event  3,  7, MOSSDEEP_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MossdeepHintHouseGrannyScript, -1
