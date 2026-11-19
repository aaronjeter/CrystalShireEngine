	object_const_def
	const ROUTE117DAYCARE_DAY_CARE_MAN
	const ROUTE117DAYCARE_DAY_CARE_LADY

Route117DayCare_MapScripts:
	def_scene_scripts

	def_callbacks

Route117DayCareManScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .FoundEgg
	checkevent EVENT_GOT_HOENN_DAY_CARE_EGG
	iftrue .DayCare
	writetext Route117DayCareManIntroText
	yesorno
	iffalse .Refused
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg AZURILL, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .GiveEgg
	setevent EVENT_GOT_HOENN_DAY_CARE_EGG
	writetext Route117DayCareManGotEggText
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
	writetext Route117DayCareManRefusedText
	waitbutton
	closetext
	end

.PartyFull:
	writetext Route117DayCareManPartyFullText
	waitbutton
	closetext
	end

.eggname
	db "Egg@"

.GiveEgg:
	jumpstd ReceiveTogepiEggScript
	end

Route117DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandHasEgg
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandHasEgg:
	writetext Route117DayCareLadyHusbandText
	waitbutton
	closetext
	end

Route117DayCareManIntroText:
	text "Welcome! We run"
	line "the Day-Care here."

	para "My cousin runs"
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

Route117DayCareManGotEggText:
	text "We don't know what"
	line "will hatch. Take"
	cont "good care of it!"
	done

Route117DayCareManRefusedText:
	text "Oh? Come back if"
	line "you change your"
	cont "mind."
	done

Route117DayCareManPartyFullText:
	text "Your party is"
	line "full. Make some"
	cont "room first."
	done

Route117DayCareLadyHusbandText:
	text "My husband has"
	line "something for you."
	done

Route117DayCareBookshelf:
	jumpstd DifficultBookshelfScript

Route117DayCare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_117, 1
	warp_event  3,  7, ROUTE_117, 1

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, Route117DayCareBookshelf
	bg_event 1,  1, BGEVENT_READ, Route117DayCareBookshelf

	def_object_events
	object_event 2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route117DayCareManScript, -1
	object_event 5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route117DayCareLadyScript, -1
