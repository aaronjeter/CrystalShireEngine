	object_const_def
	const MAUVILLEBIKESHOP_CLERK

MauvilleBikeShop_MapScripts:
	def_scene_scripts

	def_callbacks

MauvilleBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext MauvilleBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext MauvilleBikeShopClerkAgreedText
	promptbutton
	waitsfx
	giveitem BICYCLE
	writetext MauvilleBorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext MauvilleBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext MauvilleBikeShopClerkRefusedText
	waitbutton
	closetext
	end

MauvilleBikeShopBicycle:
	jumptext MauvilleBikeShopBicycleText

MauvilleBikeShopClerkIntroText:
	text "…sigh… I moved"
	line "here, but I can't"

	para "sell my BICYCLES."
	line "Why is that?"

	para "Could you ride a"
	line "BICYCLE and adver-"
	cont "tise for me?"
	done

MauvilleBikeShopClerkAgreedText:
	text "Really? Great!"

	para "Give me your name"
	line "and phone number,"

	para "and I'll loan you"
	line "a BICYCLE."
	done

MauvilleBorrowedABicycleText:
	text "<PLAYER> borrowed a"
	line "BICYCLE."
	done

MauvilleBikeShopClerkFirstRateBikesText:
	text "My BICYCLES are"
	line "first-rate! You"

	para "can ride them"
	line "anywhere."
	done

MauvilleBikeShopClerkRefusedText:
	text "…sigh… Oh, for"
	line "the kindness of"
	cont "people…"
	done

MauvilleBikeShopBicycleText:
	text "It's a shiny new"
	line "BICYCLE!"
	done

MauvilleBikeShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MAUVILLE_CITY, 5
	warp_event  3,  7, MAUVILLE_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_READ, MauvilleBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, MauvilleBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, MauvilleBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, MauvilleBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, MauvilleBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, MauvilleBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, MauvilleBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, MauvilleBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, MauvilleBikeShopBicycle

	def_object_events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleBikeShopClerkScript, -1
