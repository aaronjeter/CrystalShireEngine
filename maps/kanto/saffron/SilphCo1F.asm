	object_const_def
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER
	const SILPH_GREEN

SilphCo1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue .GotUpGrade
	writetext SilphCoOfficerText
	promptbutton
	verbosegiveitem UP_GRADE
	iffalse .NoRoom
	setevent EVENT_GOT_UP_GRADE
.GotUpGrade:
	writetext SilphCoOfficerText_GotUpGrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoReceptionistText:
	text "Welcome. This is"
	line "Silph Co.'s Head"
	cont "Office Building."
	done

SilphCoOfficerText:
	text "Only employees are"
	line "permitted to go"
	cont "upstairs."

	para "But since you came"
	line "such a long way,"

	para "have this neat"
	line "little souvenir."
	done

SilphCoOfficerText_GotUpGrade:
	text "It's Silph Co.'s"
	line "latest product."

	para "It's not for sale"
	line "anywhere yet."
	done


Silph_Green:
	faceplayer
	opendialog GREEN
	writetext SilphGreenIntroText
	waitbutton
	closedialog

	winlosstext SilphGreenLossText, SilphGreenWinText
	loadtrainer GREEN, GREEN4
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	iftrue .GreenWon

	opendialog GREEN
	writetext SilphGreenAfterBattleText
	waitbutton
	closedialog
	sjump .GreenLeaves

.GreenWon
	special HealParty
	opendialog GREEN
	writetext SilphGreenWonText
	waitbutton
	closedialog

.GreenLeaves
	setevent EVENT_FOUND_SILPH_GREEN
	setevent EVENT_SAFFRON_CITY_SAFE
	clearevent EVENT_SAFFRON_CITY_UNSAFE

	special FadeOutToBlack
	disappear SILPH_GREEN
	special FadeInFromBlack
	end

SilphGreenAfterBattleText:
	text "Ah well, I guess"
	line "I can't win them"
	cont "all."

	para "Maybe Oak was"
	line "right...You do"
	cont "have some skill."

	para "You should take"
	line "on the #mon"
	cont "League."

	para "Up on Indigo"
	line "Plateau, the Elite"
	cont "Four will happily"
	cont "put your skills to"
	cont "the test."

	para "Alright, I'm out!"
	line "I've got plenty"
	cont "more to do."

	para "Later, scrub!"
	done

SilphGreenWonText: 
	text "Well, you still"
	line "have some room for"
	cont "improvement!"

	para "Don't worry, I'll"
	line "heal your #mon."

	para "..."

	para "Maybe Oak was"
	line "right...You do"
	cont "have some skill."

	para "You should take"
	line "on the #mon"
	cont "League."

	para "Up on Indigo"
	line "Plateau, the Elite"
	cont "Four will happily"
	cont "put your skills to"
	cont "the test."

	para "Alright, I'm out!"
	line "I've got plenty"
	cont "more to do."

	para "Later, scrub!"
	done

SilphGreenLossText:
	text "Ugh, lucky!"
	done

SilphGreenWinText:
	text "Ha! Suck it,"
	line "loser!"
	done

SilphGreenIntroText:
	text "Whew, that was..."
	line "a lot..."

	para "I think if I"
	line "never see another"
	cont "Porygon, it'll be"
	cont "too soon..."

	para "I got an interest-"
	line "ing call from the"
	cont "Safari Warden..."

	para "Apparently I sent"
	line "you into a bit of"
	cont "a mess as well."

	para "It sounds like you"
	line "handled yourself"
	cont "quite well though!"

	para "I'll be honest, I"
	line "didn't have high"
	cont "hopes for you, but"
	cont "I was wrong."

	para "Maybe you'll be a"
	line "mediocre trainer"
	cont "one day after all!"

	para "There's only one"
	line "way to be sure"
	cont "though..."

	para "Get ready,"
	line "<PLAY_G>!"
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 7
	warp_event  3,  7, SAFFRON_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event 04, 04, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Silph_Green, EVENT_FOUND_SILPH_GREEN
