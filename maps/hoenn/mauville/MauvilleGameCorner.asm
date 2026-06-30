DEF MAUVILLE_500_COINS		EQU 500
DEF MAUVILLE_1000_COINS		EQU 1000
DEF MAUVILLE_1500_COINS		EQU 1500
DEF MAUVILLE_2000_COINS		EQU 2000

	object_const_def
	const MAUVILLE_GC_CLERK
	const MAUVILLE_GC_ITEM_VENDOR
	const MAUVILLE_GC_POKEMON_VENDOR1
	const MAUVILLE_GC_POKEMON_VENDOR2
	const MAUVILLE_GC_VIP_GUARD
	const MAUVILLE_GC_ROCKET_BOSS

MauvilleGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks

MauvilleGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript

MauvilleGameCornerSlotsMachineScript:
	random 6
	ifequal 0, MauvilleGameCornerLuckySlotsMachineScript
	reanchormap
	setval FALSE
	special SlotMachine
	closetext
	end

MauvilleGameCornerLuckySlotsMachineScript:
	reanchormap
	setval TRUE
	special SlotMachine
	closetext
	end

MauvilleGameCornerCardFlipMachineScript:
	reanchormap
	special CardFlip
	closetext
	end

MauvilleGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext MauvilleGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse MauvilleGameCornerPrizeVendor_NoCoinCaseScript
	writetext MauvilleGameCornerPrizeVendorWhichPrizeText
MauvilleGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu MauvilleGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RareCandy
	ifequal 2, .PpUp
	ifequal 3, .Thunder
	ifequal 4, .Blizzard
	ifequal 5, .FireBlast
	sjump MauvilleGameCornerPrizeVendor_CancelPurchaseScript


.RareCandy:
	checkcoins MAUVILLE_500_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, RARE_CANDY
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	giveitem RARE_CANDY
	iffalse MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins MAUVILLE_500_COINS
	sjump MauvilleGameCornerTMVendor_FinishScript

.PpUp:
	checkcoins MAUVILLE_500_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, PP_UP
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	giveitem PP_UP
	iffalse MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins MAUVILLE_500_COINS
	sjump MauvilleGameCornerTMVendor_FinishScript

.Thunder:
	checkcoins MAUVILLE_2000_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_THUNDER
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins MAUVILLE_2000_COINS
	sjump MauvilleGameCornerTMVendor_FinishScript

.Blizzard:
	checkcoins MAUVILLE_2000_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_BLIZZARD
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins MAUVILLE_2000_COINS
	sjump MauvilleGameCornerTMVendor_FinishScript

.FireBlast:
	checkcoins MAUVILLE_2000_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_FIRE_BLAST
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins MAUVILLE_2000_COINS
	sjump MauvilleGameCornerTMVendor_FinishScript



MauvilleGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext MauvilleGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse MauvilleGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext MauvilleGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Porygon
	ifequal 2, .Sneasel	
	ifequal 3, .Teddiursa
	ifequal 4, .Eevee
	sjump MauvilleGameCornerPrizeVendor_CancelPurchaseScript

.Porygon:
	checkcoins MAUVILLE_500_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, PORYGON
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext MauvilleGameCornerPrizeVendorHereYouGoText
	waitbutton
	loadmonindex 1, PORYGON
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON, 15
	takecoins MAUVILLE_500_COINS
	sjump .loop

.Sneasel:
	checkcoins MAUVILLE_500_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, SNEASEL
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext MauvilleGameCornerPrizeVendorHereYouGoText
	waitbutton
	loadmonindex 2, SNEASEL
	special GameCornerPrizeMonCheckDex
	givepoke SNEASEL, 15
	takecoins MAUVILLE_500_COINS
	sjump .loop

.Eevee:
	checkcoins MAUVILLE_1000_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, EEVEE
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext MauvilleGameCornerPrizeVendorHereYouGoText
	waitbutton
	loadmonindex 3, EEVEE
	special GameCornerPrizeMonCheckDex
	givepoke EEVEE, 15
	takecoins MAUVILLE_1000_COINS
	sjump .loop

.Teddiursa:
	checkcoins MAUVILLE_500_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, TEDDIURSA
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext MauvilleGameCornerPrizeVendorHereYouGoText
	waitbutton
	loadmonindex 3, TEDDIURSA
	special GameCornerPrizeMonCheckDex
	givepoke TEDDIURSA, 5
	takecoins MAUVILLE_500_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Porygon    {d:MAUVILLE_500_COINS}@"
	db "Sneasel    {d:MAUVILLE_500_COINS}@"
	db "Teddiursa  {d:MAUVILLE_500_COINS}@"
	db "Eevee      {d:MAUVILLE_1000_COINS}@"


MauvilleGameCornerPrizeMonVendorScript2:
	faceplayer
	opentext
	writetext MauvilleGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse MauvilleGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext MauvilleGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Munchlax
	ifequal 2, .Corsola	
	ifequal 3, .Delibird
	ifequal 4, .Beldum
	sjump MauvilleGameCornerPrizeVendor_CancelPurchaseScript

.Munchlax:
	checkcoins MAUVILLE_1000_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, MUNCHLAX
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext MauvilleGameCornerPrizeVendorHereYouGoText
	waitbutton
	loadmonindex 1, MUNCHLAX
	special GameCornerPrizeMonCheckDex
	givepoke MUNCHLAX, 15
	takecoins MAUVILLE_1000_COINS
	sjump .loop

.Corsola:
	checkcoins MAUVILLE_1500_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, CORSOLA
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext MauvilleGameCornerPrizeVendorHereYouGoText
	waitbutton
	loadmonindex 2, CORSOLA
	special GameCornerPrizeMonCheckDex
	givepoke CORSOLA, 15
	takecoins MAUVILLE_1500_COINS
	sjump .loop

.Delibird:
	checkcoins MAUVILLE_1500_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, DELIBIRD
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext MauvilleGameCornerPrizeVendorHereYouGoText
	waitbutton
	loadmonindex 3, DELIBIRD
	special GameCornerPrizeMonCheckDex
	givepoke DELIBIRD, 15
	takecoins MAUVILLE_1500_COINS
	sjump .loop

.Beldum:
	checkcoins MAUVILLE_2000_COINS
	ifequal HAVE_LESS, MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, BELDUM
	scall MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse MauvilleGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext MauvilleGameCornerPrizeVendorHereYouGoText
	waitbutton
	loadmonindex 3, BELDUM
	special GameCornerPrizeMonCheckDex
	givepoke BELDUM, 5
	takecoins MAUVILLE_2000_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Munchlax  {d:MAUVILLE_1000_COINS}@"
	db "Corsola   {d:MAUVILLE_1500_COINS}@"
	db "Delibird  {d:MAUVILLE_1500_COINS}@"
	db "Beldum    {d:MAUVILLE_2000_COINS}@"


MauvilleGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext MauvilleGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

MauvilleGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext MauvilleGameCornerPrizeVendorHereYouGoText
	waitbutton
	sjump MauvilleGameCornerTMVendor_LoopScript

MauvilleGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext MauvilleGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

MauvilleGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext MauvilleGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

MauvilleGameCornerPrizeVendor_CancelPurchaseScript:
	writetext MauvilleGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

MauvilleGameCornerPrizeVendor_NoCoinCaseScript:
	writetext MauvilleGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

MauvilleGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "Rarecndy {d:MAUVILLE_500_COINS}@"
	db "PP Up    {d:MAUVILLE_500_COINS}@"
	db "TM25    {d:MAUVILLE_2000_COINS}@"
	db "TM14    {d:MAUVILLE_2000_COINS}@"
	db "TM38    {d:MAUVILLE_2000_COINS}@"


MauvilleGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

MauvilleGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

MauvilleGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

MauvilleGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

MauvilleGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

MauvilleGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

MauvilleGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

MauvilleGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a Coin Case."
	done

MauvilleGameCornerLeftBossScript:
	checkevent EVENT_BEAT_MAUVILLE_ROCKETS
	iftrue .done
	turnobject PLAYER, RIGHT
	applymovement PLAYER, MauvilleGameCorner_StepRightMovement
	turnobject PLAYER, DOWN
	sjump MauvilleGameCornerRightBossScript
.done
	end

MauvilleGameCornerRightBossScript:
	checkevent EVENT_BEAT_MAUVILLE_ROCKETS
	iftrue .done
	playmusic MUSIC_ROCKET_ENCOUNTER	
	applymovement PLAYER, MauvilleGameCorner_ApproachBossMovement
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, MAUVILLE_GC_ROCKET_BOSS, 15
	turnobject MAUVILLE_GC_ROCKET_BOSS, RIGHT

	opentext
	writetext MauvilleRocketBossSeenText
	promptbutton
	closetext

	winlosstext MauvilleRocketBossWinLossText, 0
	loadtrainer EXECUTIVEF, MAUVILLE_EXECUTIVEF
	startbattle
	reloadmapafterbattle

	opentext
	writetext MauvilleRocketBossAfterBattleText
	promptbutton
	setevent EVENT_BEAT_MAUVILLE_ROCKETS	
	scall MauvilleRocketLevelcap

	special FadeOutToBlack
	disappear MAUVILLE_GC_ROCKET_BOSS
	special FadeInFromBlack

	writetext MauvilleFoundWaterfallText
	setevent EVENT_GOT_HM07_WATERFALL
	verbosegiveitem HM_WATERFALL
	closetext

.done
	end

MauvilleRocketLevelcap:
	jumpstd UpdateWorldLevelsScript
	end

MauvilleRocketBossSeenText:
	text "Huh. You got past"
	line "the guards..."

	para "You must be"
	line "pretty tough."

	para "Are you sure"
	line "you wouldn't"
	cont "rather join us?"

	para "No? Then you're"
	line "going down!"
	done

MauvilleRocketBossWinLossText:
	text "What! How?"
	done

MauvilleRocketBossAfterBattleText:
	text "This is bad..."
	line "No, boss will"
	cont "understand."

	para "We WILL meet"
	line "again runt."
	done

MauvilleFoundWaterfallText:
	text "In her rush out,"
	line "it looks like she"

	para "left something"
	line "valuable..."
	done

MauvilleGameCorner_StepRightMovement:
	step RIGHT
	step_end

MauvilleGameCorner_ApproachBossMovement:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end

MauvilleGameCorner_ClerkStopsYouScript:
	checkevent EVENT_BEAT_MAUVILLE_ROCKETS
	iftrue .done
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, MAUVILLE_GC_VIP_GUARD, 10
	opentext
	writetext MauvilleGameCorner_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	opentext
	writetext MauvilleGameCorner_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	applymovement PLAYER, MauvilleGameCorner_StepBackMovement
	opentext
	writetext MauvilleGameCorner_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
.done
	end

MauvilleGameCorner_StepBackMovement:
	step DOWN
	step DOWN
	step_end

MauvilleGameCorner_WaitPlayer:
	text "Wait!"
	done

MauvilleGameCorner_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

MauvilleGameCorner_ItsDangerousToGoAlone:
	text "Guests aren't"
	line "allowed back"
	cont "there!"
	done

MauvilleGameCornerHiddenLeftovers:
	hiddenitem LEFTOVERS, EVENT_GOT_HOENN_LEFTOVERS

MauvilleGameCornerHiddenSodaPop:
	hiddenitem SODA_POP, EVENT_MAUVILLE_GAME_CORNER_SODA_POP

MauvilleGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  16,  23, MAUVILLE_CITY, 6
	warp_event  17,  23, MAUVILLE_CITY, 6
	warp_event  19,  00, NEW_MAUVILLE_BASEMENT, 2

	def_coord_events
	coord_event  02, 06, -1, MauvilleGameCorner_ClerkStopsYouScript
	coord_event  03, 06, -1, MauvilleGameCorner_ClerkStopsYouScript
	coord_event  16, 04, -1, MauvilleGameCornerLeftBossScript
	coord_event  17, 04, -1, MauvilleGameCornerRightBossScript

	def_bg_events
	bg_event  06, 14, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  06, 15, BGEVENT_READ, MauvilleGameCornerLuckySlotsMachineScript
	bg_event  06, 16, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  06, 17, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  06, 18, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  06, 19, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  07, 14, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  07, 15, BGEVENT_READ, MauvilleGameCornerLuckySlotsMachineScript
	bg_event  07, 16, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  07, 17, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  07, 18, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  07, 19, BGEVENT_READ, MauvilleGameCornerSlotsMachineScript
	bg_event  01, 14, BGEVENT_READ, MauvilleGameCornerCardFlipMachineScript
	bg_event  01, 15, BGEVENT_READ, MauvilleGameCornerCardFlipMachineScript
	bg_event  01, 16, BGEVENT_READ, MauvilleGameCornerCardFlipMachineScript
	bg_event  01, 17, BGEVENT_READ, MauvilleGameCornerCardFlipMachineScript
	bg_event  01, 18, BGEVENT_READ, MauvilleGameCornerCardFlipMachineScript
	bg_event  01, 19, BGEVENT_READ, MauvilleGameCornerCardFlipMachineScript
	bg_event  19, 11, BGEVENT_ITEM, MauvilleGameCornerHiddenLeftovers
	bg_event  13, 23, BGEVENT_ITEM, MauvilleGameCornerHiddenSodaPop


	def_object_events
	object_event  16, 18, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleGameCornerCoinVendorScript, -1
	object_event  13, 18, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleGameCornerTMVendorScript, -1
	object_event  18, 18, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MauvilleGameCornerPrizeMonVendorScript, -1
	object_event  19, 18, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MauvilleGameCornerPrizeMonVendorScript2, -1
	object_event  00, 08, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MauvilleGameCornerCoinVendorScript, -1
	object_event  17, 10, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MauvilleGameCornerCoinVendorScript, EVENT_BEAT_MAUVILLE_ROCKETS
