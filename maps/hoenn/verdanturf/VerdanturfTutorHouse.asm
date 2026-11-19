DEF VERDANTURF_TUTOR_PRICE EQU 8000

	object_const_def
	const VERDANTURFTUTORHOUSE_TUTOR

VerdanturfTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VerdanturfTutorHouseTutorScript:
	faceplayer
	opentext
	writetext VerdanturfTutorIntroText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, VERDANTURF_TUTOR_PRICE
	ifequal HAVE_LESS, .NoMoney
	writetext VerdanturfTutorWhichText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .HealBell
	ifequal 2, .Safeguard
	sjump .Refused

.HealBell:
	setval MOVETUTOR_HEAL_BELL
	sjump .Teach

.Safeguard:
	setval MOVETUTOR_SAFEGUARD
.Teach:
	writetext VerdanturfTutorBlankText
	special MoveTutor
	ifequal FALSE, .Taught
.Refused:
	writetext VerdanturfTutorRefusedText
	waitbutton
	closetext
	end

.Taught:
	takemoney YOUR_MONEY, VERDANTURF_TUTOR_PRICE
	waitsfx
	playsound SFX_TRANSACTION
	writetext VerdanturfTutorTaughtText
	waitbutton
	closetext
	end

.NoMoney:
	writetext VerdanturfTutorNoMoneyText
	waitbutton
	closetext
	end

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 12, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Heal Bell@"
	db "Safeguard@"
	db "Cancel@"

VerdanturfTutorHouseBookshelfScript:
	jumptext VerdanturfTutorBookshelfText

VerdanturfTutorIntroText:
	text "Verdanturf is a"
	line "town for resting."

	para "I teach moves that"
	line "keep a team well."

	para "Heal Bell or"
	line "Safeguard, for"
	cont "¥{d:VERDANTURF_TUTOR_PRICE}."

	para "Would you like"
	line "to learn one?"
	done

VerdanturfTutorWhichText:
	text "Which move?"
	done

VerdanturfTutorBlankText:
	text_start
	done

VerdanturfTutorRefusedText:
	text "Rest well, then."
	done

VerdanturfTutorTaughtText:
	text "Now your #mon"
	line "can look after"
	cont "each other."
	done

VerdanturfTutorNoMoneyText:
	text "You don't have"
	line "enough money."
	done

VerdanturfTutorBookshelfText:
	text "Books on herbs and"
	line "#mon care."
	done

VerdanturfTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERDANTURF_TOWN, 6
	warp_event  3,  7, VERDANTURF_TOWN, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, VerdanturfTutorHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, VerdanturfTutorHouseBookshelfScript

	def_object_events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VerdanturfTutorHouseTutorScript, -1
