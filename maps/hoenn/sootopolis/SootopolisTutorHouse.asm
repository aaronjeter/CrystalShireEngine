DEF SOOTOPOLIS_TUTOR_PRICE EQU 8000

	object_const_def
	const SOOTOPOLISTUTORHOUSE_TUTOR

SootopolisTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SootopolisTutorHouseTutorScript:
	faceplayer
	opentext
	writetext SootopolisTutorIntroText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, SOOTOPOLIS_TUTOR_PRICE
	ifequal HAVE_LESS, .NoMoney
	writetext SootopolisTutorWhichText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .AquaTail
	ifequal 2, .AquaRing
	sjump .Refused

.AquaTail:
	setval MOVETUTOR_AQUA_TAIL
	sjump .Teach

.AquaRing:
	setval MOVETUTOR_AQUA_RING
.Teach:
	writetext SootopolisTutorBlankText
	special MoveTutor
	ifequal FALSE, .Taught
.Refused:
	writetext SootopolisTutorRefusedText
	waitbutton
	closetext
	end

.Taught:
	takemoney YOUR_MONEY, SOOTOPOLIS_TUTOR_PRICE
	waitsfx
	playsound SFX_TRANSACTION
	writetext SootopolisTutorTaughtText
	waitbutton
	closetext
	end

.NoMoney:
	writetext SootopolisTutorNoMoneyText
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
	db "Aqua Tail@"
	db "Aqua Ring@"
	db "Cancel@"

SootopolisTutorIntroText:
	text "Sootopolis lives"
	line "with the water."

	para "I can teach your"
	line "#mon Aqua Tail"
	cont "or Aqua Ring"

	para "for ¥{d:SOOTOPOLIS_TUTOR_PRICE}."
	line "Interested?"
	done

SootopolisTutorWhichText:
	text "Which move?"
	done

SootopolisTutorBlankText:
	text_start
	done

SootopolisTutorRefusedText:
	text "Come back anytime."
	done

SootopolisTutorTaughtText:
	text "Your #mon flows"
	line "like water now!"
	done

SootopolisTutorNoMoneyText:
	text "You don't have"
	line "enough money."
	done

SootopolisTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SOOTOPOLIS_CITY, 9
	warp_event  3,  7, SOOTOPOLIS_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SootopolisTutorHouseTutorScript, -1
