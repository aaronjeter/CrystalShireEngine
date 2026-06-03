	object_const_def

MauvilleCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, MauvilleCityFlypointCallback

MauvilleCityFlypointCallback:
	setflag ENGINE_FLYPOINT_MAUVILLE
	endcallback

MauvilleCitySign:
	jumptext MauvilleCitySignText

MauvilleCitySignText:
	text "Mauville City"

	para "The bright and"
	line "shiny city of"
	cont "fun!"
	done

MauvilleGymSign:
	jumptext MauvilleGymSignText

MauvilleGymSignText:
	text "Mauville City"
	line "#mon Gym"
	cont "Leader: Wattson"

	para "The cheerfully"
	line "electrifying man!"
	done

MauvilleGameCornerSign:
	jumptext MauvilleGameCornerSignText

MauvilleGameCornerSignText:
	text "Mauville"
	line "Game Corner"
	done

MauvilleBikeShopSign:
	jumptext MauvilleBikeShopSignText

MauvilleBikeShopSignText:
	text "Mauville Bikes!"
	done

MauvilleAngryGuyScript:
	opentext
	writetext MauvilleAngryGuyText
	waitbutton

	checkevent EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	iftrue .done

	writetext MauvilleAngryGuyGivesCaseText
	waitbutton
	verbosegiveitem COIN_CASE

.done
	closetext
	end

	jumptextfaceplayer MauvilleAngryGuyText

MauvilleAngryGuyText:
	text "Kick me out"
	line "will you!"

	para "Fine!"

	para "I'll make my own"
	line "Game Corner!"

	para "With Voltorb Flip!"
	line "And Gardevoirs!"

	para "..."

	para "And maybe a few"
	line "Jynx too..."
	done

MauvilleAngryGuyGivesCaseText:
	text "I guess I won't"
	line "need a Coin"
	cont "Case anymore."

	para "You'd better"
	line "take this."
	done


MauvilleRocketBlockerScript:
	jumptext MauvilleRocketBlockerText


MauvilleRocketBlockerText:
	text "Sorry, no one"
	line "gets through"

	para "until the boss"
	line "Rocket is ready."
	done

MauvilleRocketBikerScript:
	jumptext MauvilleRocketBikerText

MauvilleRocketBikerText:
	text "Man, I really"
	line "wanna buy a"
	cont "bike..."
	done


MauvilleRocketGirlScript:
	jumptext MauvilleRocketGirlText

MauvilleRocketGirlText:
	text "Ugh...I hate"
	line "waiting out"
	cont "here..."

	para "If I could swim"
	line "I'd wait inside"
	cont "the base..."
	done

MauvilleCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  6, 5, MAUVILLE_GYM, 1
	warp_event 23, 5, MAUVILLE_POKECENTER, 2
	warp_event 23, 13, MAUVILLE_MART, 2
	warp_event 37, 13, MAUVILLE_TRADE_HOUSE, 2
	warp_event 33, 05, MAUVILLE_BIKE_SHOP, 2
	warp_event 06, 13, MAUVILLE_GAME_CORNER, 1

	def_coord_events

	def_bg_events	
	bg_event  21, 07, BGEVENT_READ, MauvilleCitySign
	bg_event  05, 07, BGEVENT_READ, MauvilleGymSign
	bg_event  03, 15, BGEVENT_READ, MauvilleGameCornerSign
	bg_event  34, 07, BGEVENT_READ, MauvilleBikeShopSign

	def_object_events
	object_event  02, 14, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MauvilleAngryGuyScript, -1
	object_event  36, 08, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleRocketBlockerScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event  36, 09, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleRocketBlockerScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event  29, 05, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleRocketBikerScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event  07, 16, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleRocketGirlScript, EVENT_BEAT_MAUVILLE_ROCKETS
