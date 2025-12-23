	DEF SSPM_LOW     EQU 3
	DEF SSPM_MID     EQU 5
	DEF SSPM_HIGH    EQU 10
	
	object_const_def
	const SOUTHSIDEPLANTMARKET_VENDOR1
	const SOUTHSIDEPLANTMARKET_VENDOR2
	const SOUTHSIDEPLANTMARKET_VENDOR3
	const SOUTHSIDEPLANTMARKET_VENDOR4
	const SOUTHSIDEPLANTMARKET_ODDISH
	const SOUTHSIDEPLANTMARKET_PARAS
	const SOUTHSIDEPLANTMARKET_BELLSPROUT
	const SOUTHSIDEPLANTMARKET_TREE1
	const SOUTHSIDEPLANTMARKET_TREE2	

SouthsidePlantMarket_MapScripts:
	def_scene_scripts

	def_callbacks	

SouthsidePlantMarketPlantVendor:
	faceplayer
	opentext
	writetext SouthsidePlantMarket_PlantVendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Oddish
	ifequal 2, .Bellsprout
	ifequal 3, .Hoppip
	ifequal 4, .Sunkern
	ifequal 5, .Shroomish
	sjump SouthsidePlantMarket_CancelPurchaseScript

.Oddish:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke ODDISH, 5
	takecoins SSPM_LOW
	sjump .loop

.Bellsprout:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke BELLSPROUT, 5
	takecoins SSPM_LOW
	sjump .loop

.Hoppip:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke HOPPIP, 5
	takecoins SSPM_LOW
	sjump .loop

.Sunkern:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke SUNKERN, 5
	takecoins SSPM_LOW
	sjump .loop

.Shroomish:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke SHROOMISH, 5
	takecoins SSPM_LOW
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 6 ; items
	db "Oddish      {d:SSPM_LOW}@"
	db "Bellsprout  {d:SSPM_LOW}@"
	db "Hoppip      {d:SSPM_LOW}@"
	db "Sunkern     {d:SSPM_LOW}@"
	db "Shroomish   {d:SSPM_LOW}@"
	db "CANCEL@"



SouthsidePlantMarketPlantVendor2:
	faceplayer
	opentext
	writetext SouthsidePlantMarket_PlantVendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Paras
	ifequal 2, .Seedot
	ifequal 3, .Cacnea
	ifequal 4, .Lileep
	ifequal 5, .Exeggcute
	sjump SouthsidePlantMarket_CancelPurchaseScript

.Paras:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke PARAS, 5
	takecoins SSPM_LOW
	sjump .loop

.Seedot:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke SEEDOT, 5
	takecoins SSPM_LOW
	sjump .loop

.Cacnea:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke CACNEA, 5
	takecoins SSPM_LOW
	sjump .loop

.Lileep:
	checkcoins SSPM_MID
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke LILEEP, 5
	takecoins SSPM_MID
	sjump .loop

.Exeggcute:
	checkcoins SSPM_MID
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke EXEGGCUTE, 5
	takecoins SSPM_MID
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 6 ; items
	db "Paras       {d:SSPM_LOW}@"
	db "Seedot      {d:SSPM_LOW}@"
	db "Cacnea      {d:SSPM_LOW}@"
	db "Lileep      {d:SSPM_MID}@"
	db "Exeggcute   {d:SSPM_MID}@"
	db "CANCEL@"


SouthsidePlantMarketRockVendor:
	faceplayer
	opentext
	writetext SouthsidePlantMarket_RockVendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Geodude
	ifequal 2, .Ageodude
	ifequal 3, .Aron
	ifequal 4, .Omanyte
	ifequal 5, .Kabuto
	sjump SouthsidePlantMarket_CancelPurchaseScript

.Geodude:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke GEODUDE, 5
	takecoins SSPM_LOW
	sjump .loop

.Ageodude:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke AGEODUDE, 5
	takecoins SSPM_LOW
	sjump .loop

.Aron:
	checkcoins SSPM_LOW
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke ARON, 5
	takecoins SSPM_LOW
	sjump .loop

.Omanyte:
	checkcoins SSPM_MID
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke OMANYTE, 5
	takecoins SSPM_MID
	sjump .loop

.Kabuto:
	checkcoins SSPM_MID
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke KABUTO, 5
	takecoins SSPM_MID
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 6 ; items
	db "Geodude     {d:SSPM_LOW}@"
	db "Geodude (A) {d:SSPM_LOW}@"
	db "Aron        {d:SSPM_LOW}@"
	db "Omanyte     {d:SSPM_MID}@"
	db "Kabuto      {d:SSPM_MID}@"
	db "CANCEL@"


SouthsidePlantMarketBugVendor:
	faceplayer
	opentext
	writetext SouthsidePlantMarket_BugVendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Venonat
	ifequal 2, .Pineco
	ifequal 3, .Surskit
	ifequal 4, .Anorith
	ifequal 5, .Yanma
	sjump SouthsidePlantMarket_CancelPurchaseScript

.Venonat:
	checkcoins SSPM_MID
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke VENONAT, 5
	takecoins SSPM_MID
	sjump .loop

.Pineco:
	checkcoins SSPM_MID
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke PINECO, 5
	takecoins SSPM_LOW
	sjump .loop

.Surskit:
	checkcoins SSPM_MID
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke SURSKIT, 5
	takecoins SSPM_LOW
	sjump .loop

.Anorith:
	checkcoins SSPM_MID
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke ANORITH, 5
	takecoins SSPM_MID
	sjump .loop

.Yanma:
	checkcoins SSPM_HIGH
	ifequal HAVE_LESS, SouthsidePlantMarket_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke YANMA, 5
	takecoins SSPM_HIGH
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 6 ; items
	db "Venonat     {d:SSPM_MID}@"
	db "Pineco      {d:SSPM_MID}@"
	db "Surskit     {d:SSPM_MID}@"
	db "Anorith     {d:SSPM_MID}@"
	db "Yanma       {d:SSPM_HIGH}@"
	db "CANCEL@"

SouthsidePlantMarketOddish:
	cry ODDISH
	end

SouthsidePlantMarketParas:
	cry PARAS
	end

SouthsidePlantMarketBellsprout:
	cry BELLSPROUT
	end

SouthsidePlantMarket_PlantVendorIntroText:
	text "Welcome!"

	para "Wanna buy a plant?"
	done

SouthsidePlantMarket_RockVendorIntroText:
	text "Welcome!"

	para "Wanna buy a rock?"
	done

SouthsidePlantMarket_BugVendorIntroText:
	text "Welcome!"

	para "Wanna buy a bug?"
	done


SouthsidePlantMarket_notenoughcoins:
	writetext SouthsidePlantMarket_NotEnoughCoinsText
	waitbutton
	closetext
	end


SouthsidePlantMarket_CancelPurchaseScript:
	writetext SouthsidePlantMarket_ComeAgainText
	waitbutton
	closetext
	end


SouthsidePlantMarket_HereYouGoText:
	text "Here you go!"
	done

SouthsidePlantMarket_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

SouthsidePlantMarket_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done

SouthsidePlantMakretFruitTree1:
	fruittree FRUITTREE_ROUTE_30_1

SouthsidePlantMakretFruitTree2:
	fruittree FRUITTREE_ROUTE_30_2

SouthsidePlantMarket_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  06,  15, CITY_SOUTH, 11
	warp_event  07,  15, CITY_SOUTH, 11

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  4,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SouthsidePlantMarketPlantVendor, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_AZURE, OBJECTTYPE_SCRIPT, 0, SouthsidePlantMarketPlantVendor2, -1
	object_event 10,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SouthsidePlantMarketRockVendor, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SouthsidePlantMarketBugVendor, -1
	object_event 10, 14, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SouthsidePlantMarketOddish, -1
	object_event 14,  1, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SouthsidePlantMarketParas, -1
	object_event 03, 14, SPRITE_BELLSPROUT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SouthsidePlantMarketBellsprout, -1
	object_event 10, 12, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SouthsidePlantMakretFruitTree1, -1
	object_event 11, 12, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SouthsidePlantMakretFruitTree2, -1
