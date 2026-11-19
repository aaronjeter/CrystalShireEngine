	object_const_def
	const ROUTE5CLEANSETAGHOUSE_GRANNY
	const ROUTE5CLEANSETAGHOUSE_TEACHER
	const ROUTE5CLEANSETAGHOUSE_DAY_CARE_MAN
	const ROUTE5CLEANSETAGHOUSE_DAY_CARE_LADY

Route5CleanseTagHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route5CleanseTagHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue .GotCleanseTag
	writetext Route5CleanseTagHouseGrannyText1
	promptbutton
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
.GotCleanseTag:
	writetext Route5CleanseTagHouseGrannyText2
	waitbutton
.NoRoom:
	closetext
	end

Route5CleanseTagHouseTeacherScript:
	jumptextfaceplayer Route5CleanseTagHouseTeacherText

Route5DayCareManScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .FoundEgg
	checkevent EVENT_GOT_KANTO_DAY_CARE_EGG
	iftrue .DayCare
	writetext Route5DayCareManIntroText
	yesorno
	iffalse .Refused
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg MUNCHLAX, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .GiveEgg
	setevent EVENT_GOT_KANTO_DAY_CARE_EGG
	writetext Route5DayCareManGotEggText
	waitbutton
	closetext
	end

.DayCare:
	special DayCareMan
	waitbutton
	closetext
	end

.FoundEgg:
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .KeptEgg
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
.KeptEgg:
	end

.Refused:
	writetext Route5DayCareManRefusedText
	waitbutton
	closetext
	end

.PartyFull:
	writetext Route5DayCareManPartyFullText
	waitbutton
	closetext
	end

.eggname
	db "Egg@"

.GiveEgg:
	jumpstd ReceiveTogepiEggScript
	end

Route5DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandHasEgg
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandHasEgg:
	writetext Route5DayCareLadyHusbandText
	waitbutton
	closetext
	end

Route5DayCareManIntroText:
	text "Welcome! We run"
	line "the Day-Care here."

	para "My brother runs"
	line "the one on Route"
	cont "34 in Johto."

	para "Our Day-Cares"
	line "share a PC link."

	para "Leave a #mon"
	line "with one of us,"
	cont "and it's with all"
	cont "of us."

	para "Oh, and we found"
	line "this Egg. Would"
	cont "you take it?"
	done

Route5DayCareManGotEggText:
	text "We don't know what"
	line "will hatch. Take"
	cont "good care of it!"
	done

Route5DayCareManRefusedText:
	text "Oh? Come back if"
	line "you change your"
	cont "mind."
	done

Route5DayCareManPartyFullText:
	text "Your party is"
	line "full. Make some"
	cont "room first."
	done

Route5DayCareLadyHusbandText:
	text "My husband has"
	line "something for you."
	done

HouseForSaleBookshelf:
	jumpstd DifficultBookshelfScript

Route5CleanseTagHouseGrannyText1:
	text "Eeyaaaah!"

	para "I sense a sinister"
	line "shadow hovering"
	cont "over you."

	para "Take this to ward"
	line "it off!"
	done

Route5CleanseTagHouseGrannyText2:
	text "You were in mortal"
	line "danger, but you"
	cont "are protected now."
	done

Route5CleanseTagHouseTeacherText:
	text "My grandma is into"
	line "warding off what"

	para "she believes to be"
	line "evil spirits."

	para "I'm sorry that she"
	line "startled you."
	done

Route5CleanseTagHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_5, 4
	warp_event  3,  7, ROUTE_5, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HouseForSaleBookshelf
	bg_event  1,  1, BGEVENT_READ, HouseForSaleBookshelf

	def_object_events
	object_event  2,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseGrannyScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseTeacherScript, -1
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5DayCareManScript, -1
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5DayCareLadyScript, -1
