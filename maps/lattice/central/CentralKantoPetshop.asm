	DEF CKP_LOW     EQU 10
	DEF CKP_MID     EQU 15
	DEF CKP_HIGH    EQU 25
	
	object_const_def
	const CENTRALKANTOPETSHOP_VENDOR
	const CENTRALKANTOPETSHOP_CHARMANDER
	const CENTRALKANTOPETSHOP_SQUIRTLE
	const CENTRALKANTOPETSHOP_BULBASAUR

CentralKantoPetshop_MapScripts:
	def_scene_scripts

	def_callbacks

CentralKantoPetshopVendor:
	faceplayer
	opentext
	writetext CentralKantoPetshop_VendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Charmander
	ifequal 2, .Squirtle
	ifequal 3, .Bulbasaur
	ifequal 4, .Pikachu
	ifequal 5, .Eevee
	sjump CentralKantoPetshop_CancelPurchaseScript

.Charmander:
	checkcoins CKP_MID
	ifequal HAVE_LESS, CentralKantoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke CHARMANDER, 3
	takecoins CKP_MID
	sjump .loop

.Squirtle:
	checkcoins CKP_MID
	ifequal HAVE_LESS, CentralKantoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke SQUIRTLE, 3
	takecoins CKP_MID
	sjump .loop

.Bulbasaur:
	checkcoins CKP_MID
	ifequal HAVE_LESS, CentralKantoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke BULBASAUR, 3
	takecoins CKP_MID
	sjump .loop

.Pikachu:
	checkcoins CKP_LOW
	ifequal HAVE_LESS, CentralKantoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke PIKACHU, 3
	takecoins CKP_LOW
	sjump .loop

.Eevee:
	checkcoins SSP_HIGH
	ifequal HAVE_LESS, CentralKantoPetshop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke EEVEE, 3
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
	db "Charmander   {d:CKP_MID}@"
	db "Squirtle     {d:CKP_MID}@"
	db "Bulbasaur    {d:CKP_MID}@"
	db "Pikachu      {d:CKP_LOW}@"
	db "Eevee        {d:CKP_HIGH}@"
	db "Cancel@"

CentralKantoPetshop_VendorIntroText:
	text "Welcome!"

	para "Kanto Exotic"
	line "Pets has the"
	cont "#mon for you!"
	done

CentralKantoPetshop_notenoughcoins:
	writetext CentralKantoPetshop_NotEnoughCoinsText
	waitbutton
	closetext
	end


CentralKantoPetshop_CancelPurchaseScript:
	writetext CentralKantoPetshop_ComeAgainText
	waitbutton
	closetext
	end


CentralKantoPetshop_HereYouGoText:
	text "Here you go!"
	done

CentralKantoPetshop_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

CentralKantoPetshop_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done


CentralKantoPetshopCharmander:
	cry CHARMANDER
	end

CentralKantoPetshopSquirtle:
	cry SQUIRTLE
	end

CentralKantoPetshopBulbasaur:
	cry BULBASAUR
	end


CentralKantoPetshop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  06,  07, CENTRAL_CITY, 16
	warp_event  07,  07, CENTRAL_CITY, 16

	def_coord_events

	def_bg_events

	def_object_events
	object_event  10, 01, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CentralKantoPetshopVendor, -1
	object_event  03, 06, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CentralKantoPetshopCharmander, -1
	object_event  00, 02, SPRITE_SQUIRTLE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CentralKantoPetshopSquirtle, -1
	object_event  13, 04, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CentralKantoPetshopBulbasaur, -1