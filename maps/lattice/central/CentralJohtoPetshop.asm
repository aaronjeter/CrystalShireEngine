	DEF CJP_LOW     EQU 10
	DEF CJP_MID     EQU 15
	DEF CJP_HIGH    EQU 25
	
	object_const_def
	const CENTRALJOHTOPETSHOP_VENDOR
	const CENTRALJOHTOPETSHOP_CYNDAQUIL
	const CENTRALJOHTOPETSHOP_TOTODILE
	const CENTRALJOHTOPETSHOP_CHIKORITA

CentralJohtoPetshop_MapScripts:
	def_scene_scripts

	def_callbacks


CentralJohtoPetshopVendor:
	faceplayer
	opentext
	writetext CentralJohtoPetshop_VendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Cyndaquil
	ifequal 2, .Totodile
	ifequal 3, .Chikorita
	ifequal 4, .Marill
	ifequal 5, .Mareep
	sjump CentralJohtoPetshop_CancelPurchaseScript

.Cyndaquil:
	checkcoins CKP_MID
	ifequal HAVE_LESS, CentralJohtoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke CYNDAQUIL, 3
	takecoins CKP_MID
	sjump .loop

.Totodile:
	checkcoins CKP_MID
	ifequal HAVE_LESS, CentralJohtoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke TOTODILE, 3
	takecoins CKP_MID
	sjump .loop

.Chikorita:
	checkcoins CKP_MID
	ifequal HAVE_LESS, CentralJohtoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke CHIKORITA, 3
	takecoins CKP_MID
	sjump .loop

.Marill:
	checkcoins CKP_LOW
	ifequal HAVE_LESS, CentralJohtoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke MARILL, 3
	takecoins CKP_LOW
	sjump .loop

.Mareep:
	checkcoins SSP_HIGH
	ifequal HAVE_LESS, CentralJohtoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke MAREEP, 3
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
	db "Cyndaquil   {d:CJP_MID}@"
	db "Totodile    {d:CJP_MID}@"
	db "Chikorita   {d:CJP_MID}@"
	db "Marill      {d:CJP_LOW}@"
	db "Mareep      {d:CJP_LOW}@"
	db "CANCEL@"

CentralJohtoPetshop_VendorIntroText:
	text "Welcome!"

	para "Johto Exotic"
	line "Pets has the"
	cont "#MON for you!"
	done

CentralJohtoPetshop_notenoughcoins:
	writetext CentralJohtoPetshop_NotEnoughCoinsText
	waitbutton
	closetext
	end


CentralJohtoPetshop_CancelPurchaseScript:
	writetext CentralJohtoPetshop_ComeAgainText
	waitbutton
	closetext
	end


CentralJohtoPetshop_HereYouGoText:
	text "Here you go!"
	done

CentralJohtoPetshop_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

CentralJohtoPetshop_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done


CentralJohtoPetshopCyndaquil:
	cry CYNDAQUIL
	end

CentralJohtoPetshopTotodile:
	cry TOTODILE
	end

CentralJohtoPetshopChikorita:
	cry CHIKORITA
	end

CentralJohtoPetshop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  06,  07, CENTRAL_CITY, 17
	warp_event  07,  07, CENTRAL_CITY, 17

	def_coord_events

	def_bg_events

	def_object_events
	object_event  07, 01, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, CentralJohtoPetshopVendor, -1
	object_event  03, 06, SPRITE_CYNDAQUIL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CentralJohtoPetshopCyndaquil, -1
	object_event  03, 01, SPRITE_TOTODILE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CentralJohtoPetshopTotodile, -1
	object_event  10, 02, SPRITE_CHIKORITA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CentralJohtoPetshopChikorita, -1