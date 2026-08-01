	object_const_def
	const RUSTBORO_DEVON_LAB_UPSTAIRS_SCIENTIST
	const RUSTBORO_DEVON_LAB_UPSTAIRS_NERD
	const RUSTBORO_DEVON_LAB_UPSTAIRS_FOSSIL_CLERK

RustboroDevonLabUpstairs_MapScripts:
	def_scene_scripts

	def_callbacks

RustboroFossilClerk:
	faceplayer
	opentext
	writetext RustboroFossilClerkIntro
	waitbutton

	loadmenu .FossilMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RootFossil
	ifequal 2, .ClawFossil
	ifequal 3, .FangFossil
	ifequal 4, .FinFossil

	sjump .No
	
.RootFossil:
	checkitem ROOT_FOSSIL
	iffalse .No
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	takeitem ROOT_FOSSIL
	getmonname STRING_BUFFER_3, LILEEP
	playsound SFX_CAUGHT_MON
	waitsfx	
	writetext RustboroFossilClerkMonText
	waitbutton
	givepoke LILEEP, 10
	closetext
	end

.ClawFossil:
	checkitem CLAW_FOSSIL
	iffalse .No
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	takeitem CLAW_FOSSIL
	getmonname STRING_BUFFER_3, ANORITH
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext RustboroFossilClerkMonText
	waitbutton
	givepoke ANORITH, 10
	closetext
	end

.FangFossil:
	checkitem FANG_FOSSIL
	iffalse .No
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	takeitem FANG_FOSSIL
	getmonname STRING_BUFFER_3, KOTORA
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext RustboroFossilClerkMonText
	waitbutton
	givepoke KOTORA, 10
	closetext
	end

.FinFossil:
	checkitem FIN_FOSSIL
	iffalse .No
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom

	takeitem FIN_FOSSIL
	getmonname STRING_BUFFER_3, KURUSU
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext RustboroFossilClerkMonText
	waitbutton
	givepoke KURUSU, 10
	closetext
	end
	
.No
	writetext RustboroFossilClerkNoText
	waitbutton
	closetext
	end

.NoRoom:
	writetext RustboroFossilClerkPartyFullText
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
	db "Root Fossil@"
	db "Claw Fossil@"	
	db "Fang Fossil@"
	db "Fin  Fossil@"

RustboroFossilClerkMonText:
	text "Oh! That is"
	line "a fossil of"
	cont "@"
	text_ram wStringBuffer3
	text "!"

	para "We have several"
	line "of those. Here"
	cont "you go!"
	done

RustboroFossilClerkIntro:
	text "Welcome Trainer!"
	line "Here we exchange"
	cont "fossils for"
	cont "#mon!"

	para "If you have a"
	line "fossil that"
	cont "matches one of"
	cont "our herd, anyways."
	done

RustboroFossilClerkPartyFullText:
	text "I'm sorry, you"
	line "have no room for"
	cont "#mon."
	done

RustboroFossilClerkNoText:
	text "Oh well, maybe"
	line "next time?"
	done

RustboroLabUpstairsScientistScript:
	jumptextfaceplayer RustboroLabUpstairsScientistText

RustboroLabUpstairsScientistText:
	text "Every morning I"
	line "remind myself..."

	para "If we can do it,"
	line "we should do it!"
	done

RustboroLabUpstairsNerdScript:
	jumptextfaceplayer RustboroLabUpstairsNerdText

RustboroLabUpstairsNerdText:
	text "We're bringing old"
	line "#mon back to"
	cont "life!"

	para "Suck it, Arceus!"
	done

RustboroUpstairsCaseSign:
	jumptext RustboroUpstairsCaseText

RustboroUpstairsCaseText:
	text "Fossils from"
	line "aroud Hoenn."

	para "Mostly found"
	line "at Meteor Falls"
	cont "and Lavaridge"
	cont "Desert."
	done

RustboroDevonLabUpstairs_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  07, 07, RUSTBORO_DEVON_LAB, 3

	def_coord_events

	def_bg_events
	bg_event 02, 03, BGEVENT_READ, RustboroUpstairsCaseSign

	def_object_events
	object_event 02, 04, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RustboroLabUpstairsScientistScript, -1
	object_event 11, 02, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, RustboroLabUpstairsNerdScript, -1
	object_event 16, 05, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RustboroFossilClerk, -1
