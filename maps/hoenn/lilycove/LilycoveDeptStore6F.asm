DEF LILYCOVEDEPTSTORE6F_FRESH_WATER_PRICE EQU 200
DEF LILYCOVEDEPTSTORE6F_SODA_POP_PRICE    EQU 300
DEF LILYCOVEDEPTSTORE6F_LEMONADE_PRICE    EQU 350

	object_const_def

LilycoveDeptStore6F_MapScripts:
	def_scene_scripts

	def_callbacks	

LilycoveDeptStore6FVendingMachine:
	opentext
	writetext LilycoveVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, LILYCOVEDEPTSTORE6F_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, LILYCOVEDEPTSTORE6F_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, LILYCOVEDEPTSTORE6F_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, LILYCOVEDEPTSTORE6F_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, LILYCOVEDEPTSTORE6F_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, LILYCOVEDEPTSTORE6F_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
; fallthrough
.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext LilycoveClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext LilycoveVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext LilycoveVendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Fresh Water  ¥{d:LILYCOVEDEPTSTORE6F_FRESH_WATER_PRICE}@"
	db "Soda Pop     ¥{d:LILYCOVEDEPTSTORE6F_SODA_POP_PRICE}@"
	db "Lemonade     ¥{d:LILYCOVEDEPTSTORE6F_LEMONADE_PRICE}@"
	db "Cancel@"

LilycoveDeptStore6FDirectory:
	jumptext LilycoveDeptStore6FDirectoryText

LilycoveVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

LilycoveClangText:
	text "Clang!"

	para "@"
	text_ram wStringBuffer3
	text_start
	line "popped out."
	done

LilycoveVendingNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

LilycoveVendingNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done

LilycoveDeptStore6FDirectoryText:
	text "6F: Rooftop Square"
	line "Vending Machines"
	done

LilycoveDeptStore6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  0, LILYCOVE_DEPT_STORE_5F, 2	
	warp_event 13,  0, LILYCOVE_DEPT_STORE_ROOF, 1
	warp_event  2,  0, LILYCOVE_DEPT_STORE_ELEVATOR, 1


	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, LilycoveDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, LilycoveDeptStore1FElevatorButton
	bg_event  8,  1, BGEVENT_UP, LilycoveDeptStore6FVendingMachine
	bg_event  9,  1, BGEVENT_UP, LilycoveDeptStore6FVendingMachine
	bg_event 10,  1, BGEVENT_UP, LilycoveDeptStore6FVendingMachine
	bg_event 11,  1, BGEVENT_UP, LilycoveDeptStore6FVendingMachine

	def_object_events
