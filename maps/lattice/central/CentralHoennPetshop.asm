	DEF CHP_LOW     EQU 10
	DEF CHP_MID     EQU 15
	DEF CHP_HIGH    EQU 25
	
	object_const_def
	const CENTRALHOENNPETSHOP_VENDOR
	const CENTRALHOENNPETSHOP_TORCHIC
	const CENTRALHOENNPETSHOP_MUDKIP
	const CENTRALHOENNPETSHOP_TREECKO

CentralHoennPetshop_MapScripts:
	def_scene_scripts

	def_callbacks

CentralHoennPetshopVendor:
	faceplayer
	opentext
	writetext CentralHoennPetshop_VendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Torchic
	ifequal 2, .Mudkip
	ifequal 3, .Treecko
	ifequal 4, .Aron
	ifequal 5, .Ralts
	sjump CentralHoennPetshop_CancelPurchaseScript

.Torchic:
	checkcoins CKP_MID
	ifequal HAVE_LESS, CentralHoennPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke TORCHIC, 3
	takecoins CKP_MID
	sjump .loop

.Mudkip:
	checkcoins CKP_MID
	ifequal HAVE_LESS, CentralHoennPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke MUDKIP, 3
	takecoins CKP_MID
	sjump .loop

.Treecko:
	checkcoins CKP_MID
	ifequal HAVE_LESS, CentralHoennPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke TREECKO, 3
	takecoins CKP_MID
	sjump .loop

.Aron:
	checkcoins CKP_LOW
	ifequal HAVE_LESS, CentralHoennPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke ARON, 3
	takecoins CKP_LOW
	sjump .loop

.Ralts:
	checkcoins SSP_HIGH
	ifequal HAVE_LESS, CentralHoennPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke RALTS, 3
	takecoins SSP_HIGH
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 6 ; items
	db "Torchic   {d:CJP_MID}@"
	db "Mudkip    {d:CJP_MID}@"
	db "Treecko   {d:CJP_MID}@"
	db "Aron      {d:CJP_LOW}@"
	db "Ralts     {d:CHP_HIGH}@"
	db "CANCEL@"

CentralHoennPetshop_VendorIntroText:
	text "Welcome!"

	para "Hoenn Exotic"
	line "Pets has the"
	cont "#MON for you!"
	done

CentralHoennPetshop_notenoughcoins:
	writetext CentralHoennPetshop_NotEnoughCoinsText
	waitbutton
	closetext
	end


CentralHoennPetshop_CancelPurchaseScript:
	writetext CentralHoennPetshop_ComeAgainText
	waitbutton
	closetext
	end


CentralHoennPetshop_HereYouGoText:
	text "Here you go!"
	done

CentralHoennPetshop_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

CentralHoennPetshop_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done


CentralHoennPetshopTorchic:
	cry TORCHIC
	end

CentralHoennPetshopMudkip:
	cry MUDKIP
	end

CentralHoennPetshopTreecko:
	cry TREECKO
	end

CentralHoennPetshop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  06,  07, CENTRAL_CITY, 18
	warp_event  07,  07, CENTRAL_CITY, 18

	def_coord_events

	def_bg_events

	def_object_events
	object_event  03, 01, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, CentralHoennPetshopVendor, -1
	object_event  07, 03, SPRITE_TORCHIC, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CentralHoennPetshopTorchic, -1
	object_event  00, 06, SPRITE_MUDKIP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CentralHoennPetshopMudkip, -1
	object_event  10, 02, SPRITE_TREECKO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CentralHoennPetshopTreecko, -1
