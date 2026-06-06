	DEF SSP_LOW     EQU 3
	DEF SSP_MID     EQU 5
	DEF SSP_HIGH    EQU 10
	
	object_const_def
	const SOUTHSIDEPETSHOP_VENDOR1
	const SOUTHSIDEPETSHOP_VENDOR2
	const SOUTHSIDEPETSHOP_VENDOR3
	const SOUTHSIDEPETSHOP_VENDOR4
	const SOUTHSIDEPETSHOP_PIKACHU
	const SOUTHSIDEPETSHOP_ZIGZAGOON
	const SOUTHSIDEPETSHOP_DIGLETT
	

SouthsidePetShop_MapScripts:
	def_scene_scripts

	def_callbacks	

SouthsidePetShopRatVendor:
	faceplayer
	opentext
	writetext SouthsidePetShop_RatVendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Rattata
	ifequal 2, .Sentret
	ifequal 3, .Zigzagoon
	ifequal 4, .Sandshrew
	ifequal 5, .Pikachu
	sjump SouthsidePetShop_CancelPurchaseScript

.Rattata:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke RATTATA, 5
	takecoins SSP_LOW
	sjump .loop

.Sentret:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke SENTRET, 5
	takecoins SSP_LOW
	sjump .loop

.Zigzagoon:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke ZIGZAGOON, 5
	takecoins SSP_LOW
	sjump .loop

.Sandshrew:
	checkcoins SSP_MID
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke SANDSHREW, 5
	takecoins SSP_MID
	sjump .loop

.Pikachu:
	checkcoins SSP_HIGH
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke PIKACHU, 5
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
	db "Rattata     {d:SSP_LOW}@"
	db "Sentret     {d:SSP_LOW}@"
	db "Zigzagoon   {d:SSP_LOW}@"
	db "Sandshrew   {d:SSP_MID}@"
	db "Pikachu     {d:SSP_HIGH}@"
	db "Cancel@"



SouthsidePetShopFishVendor:
	faceplayer
	opentext
	writetext SouthsidePetShop_FishVendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Goldeen
	ifequal 2, .Wooper
	ifequal 3, .Lotad
	ifequal 4, .Horsea
	ifequal 5, .Tentacool
	sjump SouthsidePetShop_CancelPurchaseScript

.Goldeen:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke GOLDEEN, 5
	takecoins SSP_LOW
	sjump .loop

.Wooper:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke WOOPER, 5
	takecoins SSP_LOW
	sjump .loop

.Lotad:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke LOTAD, 5
	takecoins SSP_LOW
	sjump .loop

.Horsea:
	checkcoins SSP_MID
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke HORSEA, 5
	takecoins SSP_MID
	sjump .loop

.Tentacool:
	checkcoins SSP_MID
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke TENTACOOL, 5
	takecoins SSP_MID
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 6 ; items
	db "Goldeen     {d:SSP_LOW}@"
	db "Wooper      {d:SSP_LOW}@"
	db "Lotad       {d:SSP_LOW}@"
	db "Horsea      {d:SSP_MID}@"
	db "Tentacool   {d:SSP_MID}@"
	db "Cancel@"


SouthsidePetShopBirdVendor:
	faceplayer
	opentext
	writetext SouthsidePetShop_BirdVendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Pidgey
	ifequal 2, .Hoothoot
	ifequal 3, .Taillow
	ifequal 4, .Doduo
	ifequal 5, .Natu
	sjump SouthsidePetShop_CancelPurchaseScript

.Pidgey:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke PIDGEY, 5
	takecoins SSP_LOW
	sjump .loop

.Hoothoot:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke HOOTHOOT, 5
	takecoins SSP_LOW
	sjump .loop

.Taillow:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke TAILLOW, 5
	takecoins SSP_LOW
	sjump .loop

.Doduo:
	checkcoins SSP_MID
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke DODUO, 5
	takecoins SSP_MID
	sjump .loop

.Natu:
	checkcoins SSP_MID
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke NATU, 5
	takecoins SSP_MID
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 6 ; items
	db "Pidgey      {d:SSP_LOW}@"
	db "Hoothoot    {d:SSP_LOW}@"
	db "Taillow     {d:SSP_LOW}@"
	db "Doduo       {d:SSP_MID}@"
	db "Natu        {d:SSP_MID}@"
	db "Cancel@"


SouthsidePetShopBugVendor:
	faceplayer
	opentext
	writetext SouthsidePetShop_BugVendorIntroText
	waitbutton
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Caterpie
	ifequal 2, .Weedle
	ifequal 3, .Ledyba
	ifequal 4, .Spinarak
	ifequal 5, .Wurmple
	sjump SouthsidePetShop_CancelPurchaseScript

.Caterpie:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke CATERPIE, 5
	takecoins SSP_LOW
	sjump .loop

.Weedle:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke WEEDLE, 5
	takecoins SSP_LOW
	sjump .loop

.Ledyba:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke LEDYBA, 5
	takecoins SSP_LOW
	sjump .loop

.Spinarak:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke SPINARAK, 5
	takecoins SSP_LOW
	sjump .loop

.Wurmple:
	checkcoins SSP_LOW
	ifequal HAVE_LESS, SouthsidePetShop_notenoughcoins
	playsound SFX_TRANSACTION
	givepoke WURMPLE, 5
	takecoins SSP_LOW
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 6 ; items
	db "Caterpie    {d:SSP_LOW}@"
	db "Weedle      {d:SSP_LOW}@"
	db "Ledyba      {d:SSP_LOW}@"
	db "Spinarak    {d:SSP_LOW}@"
	db "Wurmple     {d:SSP_LOW}@"
	db "Cancel@"

SouthsidePetShopPikachu:
	cry PIKACHU
	end

SouthsidePetShopZigzagoon:
	cry ZIGZAGOON
	end

SouthsidePetShopDiglett:
	cry DIGLETT
	end

SouthsidePetShop_RatVendorIntroText:
	text "Welcome!"

	para "Wanna buy a rat?"
	done

SouthsidePetShop_FishVendorIntroText:
	text "Welcome!"

	para "Wanna buy a fish?"
	done

SouthsidePetShop_BirdVendorIntroText:
	text "Welcome!"

	para "Wanna buy a bird?"
	done

SouthsidePetShop_BugVendorIntroText:
	text "Welcome!"

	para "Wanna buy a bug?"
	done


SouthsidePetShop_notenoughcoins:
	writetext SouthsidePetShop_NotEnoughCoinsText
	waitbutton
	closetext
	end


SouthsidePetShop_CancelPurchaseScript:
	writetext SouthsidePetShop_ComeAgainText
	waitbutton
	closetext
	end


SouthsidePetShop_HereYouGoText:
	text "Here you go!"
	done

SouthsidePetShop_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

SouthsidePetShop_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done

SouthsidePetShop_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  07,  07, CITY_SOUTH, 8
	warp_event  08,  07, CITY_SOUTH, 8

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 07, 01, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SouthsidePetShopRatVendor, -1
	object_event 09, 01, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_AZURE, OBJECTTYPE_SCRIPT, 0, SouthsidePetShopFishVendor, -1
	object_event 08, 01, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, SouthsidePetShopBirdVendor, -1
	object_event 06, 01, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SouthsidePetShopBugVendor, -1
	object_event 12, 06, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SouthsidePetShopPikachu, -1
	object_event 05, 01, SPRITE_ZIGZAGOON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SouthsidePetShopZigzagoon, -1
	object_event 00, 07, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SouthsidePetShopDiglett, -1
