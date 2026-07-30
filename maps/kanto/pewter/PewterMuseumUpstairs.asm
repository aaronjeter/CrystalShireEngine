	object_const_def
	const PEWTERMUSEUMUSTAIRS_GRAMPS
	const PEWTERMUSEUMUSTAIRS_NERD
	const PEWTERMUSEUMUSTAIRS_FOSSIL_CLERK

PewterMuseumUpstairs_MapScripts:
	def_scene_scripts

	def_callbacks

PewterFossilClerk:
	faceplayer
	opentext
	writetext PewterFossilClerkIntro
	waitbutton

	loadmenu .FossilMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .DomeFossil
	ifequal 2, .HelixFossil
	ifequal 3, .UrsaFossil
	ifequal 4, .OldAmber

	sjump .No
	
.DomeFossil:
	checkitem DOME_FOSSIL
	iffalse .No
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	takeitem DOME_FOSSIL
	getmonname STRING_BUFFER_3, KABUTO
	playsound SFX_CAUGHT_MON
	waitsfx	
	writetext PewterFossilClerkMonText
	waitbutton
	givepoke KABUTO, 10
	closetext
	end

.HelixFossil:
	checkitem HELIX_FOSSIL
	iffalse .No
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	takeitem HELIX_FOSSIL
	getmonname STRING_BUFFER_3, OMANYTE
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext PewterFossilClerkMonText
	waitbutton
	givepoke OMANYTE, 10
	closetext
	end

.UrsaFossil:
	checkitem URSA_FOSSIL
	iffalse .No
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	takeitem URSA_FOSSIL
	getmonname STRING_BUFFER_3, HONOBEA
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext PewterFossilClerkMonText
	waitbutton
	givepoke HONOBEA, 10
	closetext
	end

.OldAmber:
	checkitem OLD_AMBER
	iffalse .No
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	takeitem OLD_AMBER
	getmonname STRING_BUFFER_3, AERODACTYL
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext PewterFossilClerkMonText
	waitbutton
	givepoke AERODACTYL, 10
	closetext
	end
	
.No
	writetext PewterFossilClerkNoText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PewterFossilClerkPartyFullText
	waitbutton
	closetext
	end


.FossilMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items	
	db "Dome Fossil@"
	db "Helix Fossil@"	
	db "Ursa Fossil@"
	db "Old Amber@"

PewterFossilClerkMonText:
	text "Oh! That is"
	line "a fossil of"
	cont "@"
	text_ram wStringBuffer3
	text "!"

	para "We have several"
	line "of those. Here"
	cont "you go!"
	done

PewterFossilClerkIntro:
	text "Welcome Trainer!"
	line "Here we exchange"
	cont "fossils for"
	cont "#mon!"

	para "If you have a"
	line "fossil that"
	cont "matches one of"
	cont "our herd, anyways."
	done

PewterFossilClerkPartyFullText:
	text "I'm sorry, you"
	line "have no room for"
	cont "#mon."
	done

PewterFossilClerkNoText:
	text "Oh well, maybe"
	line "next time?"
	done

PewterMuseumUpstairsGrampsScript:
	jumptextfaceplayer PewterMuseumUpstairsGrampsText

PewterMuseumUpstairsGrampsText:
	text "Why, I remember"
	line "when this shuttle"
	cont "first went up to"
	cont "space!"

	para "My dad bought a"
	line "new TV to watch"
	cont "it in color!"
	done

PewterMuseumUpstairsNerdScript:
	jumptextfaceplayer PewterMuseumUpstairsNerdText

PewterMuseumUpstairsNerdText:
	text "I love rocks and"
	line "fossils!"

	para "One day I'm gonna"
	line "go to Mt Moon and"
	cont "find my own!"

	para "Then I'm gonna"
	line "bring it here"
	cont "and trade for an"
	cont "Aerodactyl!"
	done

PewterMuseumUpstairsCaseSign:
	jumptext PewterMuseumUpstairsCaseText

PewterMuseumUpstairsCaseText:
	text "Meteorites from"
	line "aroud Kanto."

	para "Mostly found"
	line "at Mt Moon."
	done

PewterMuseumUpstairs_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  07, 07, PEWTER_MUSEUM, 5

	def_coord_events

	def_bg_events
	bg_event 02, 05, BGEVENT_READ, PewterMuseumUpstairsCaseSign

	def_object_events
	object_event 16, 06, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseumUpstairsGrampsScript, -1
	object_event 03, 03, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PewterMuseumUpstairsNerdScript, -1
	object_event 10, 02, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterFossilClerk, -1
