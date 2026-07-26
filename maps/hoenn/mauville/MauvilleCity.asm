	object_const_def
	const MAUVILLECITY_ROCKER
	const MAUVILLECITY_ROCKET1
	const MAUVILLECITY_ROCKET2
	const MAUVILLECITY_ROCKET3
	const MAUVILLECITY_ROCKET_GIRL
	const MAUVILLECITY_WALLY

MauvilleCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, MauvilleCityFlypointCallback

MauvilleCityFlypointCallback:
	setflag ENGINE_FLYPOINT_MAUVILLE
	endcallback

MauvilleCity_Wally:
	checkevent EVENT_FOUND_MAUVILLE_WALLY
	iftrue .done

	applymovement MAUVILLECITY_WALLY, MauvilleCityWally_StepDownMovement
	faceplayer
	checkevent EVENT_START_HOENN
	iffalse .notHoenn		
	opentext
	writetext MauvilleCityWallyIntroText
	waitbutton
	closetext

	winlosstext MauvilleCityWallyLossText, MauvilleCityWallyWinText
	loadtrainer WALLY, WALLY3
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	opentext
	writetext MauvilleCityWallyAfterBattleText
	sjump .WallyExit
	end

.notHoenn
	opentext
	writetext MauvilleCityWallyNotHoennText
	waitbutton 

.WallyExit
	closetext
	setevent EVENT_FOUND_MAUVILLE_WALLY
	applymovement MAUVILLECITY_WALLY, MauvilleCityWally_StepUpMovement	
	disappear MAUVILLECITY_WALLY
.done
	end

MauvilleCityWallyAfterBattleText:
	text "Prof Birch asked"
	line "me to go check"
	cont "in on his research"
	cont "partner."

	para "Dr Lanette lives"
	line "in a cottage up"
	cont "by Meteor Falls."

	para "You should swing"
	line "by too. She can"
	cont "be really helpful."

	para "I think I'm going"
	line "to stop by the"
	cont "Gym in Lavaridge"
	cont "as well."
	done

MauvilleCityWallyLossText:
	text "Awww, I thought"
	line "that would go"
	cont "my way..."
	done

MauvilleCityWallyWinText:
	text "Ha, Gotcha!"
	done

MauvilleCityWallyIntroText:
	text "Oh, hi <PLAY_G>!"
	line "I'm glad to see"
	cont "you!"

	para "Mauville doesn't"
	line "seem very nice"
	cont "with Team Rocket"
	cont "around..."

	para "Maybe we could"
	line "have a rematch"
	cont "though?"
	done

MauvilleCityWallyNotHoennText:
	text "Oh, um...hi?"

	para "Sorry, I'm really"
	line "late!"
	done

MauvilleCityWally_StepDownMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MauvilleCityWally_StepUpMovement:
	step UP
	step UP
	step UP
	step UP
	step_end


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
	setevent EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	verbosegiveitem COIN_CASE

.done
	closetext
	end

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
	coord_event  16,  05, -1, MauvilleCity_Wally
	coord_event  17,  05, -1, MauvilleCity_Wally

	def_bg_events	
	bg_event  21, 07, BGEVENT_READ, MauvilleCitySign
	bg_event  07, 05, BGEVENT_READ, MauvilleGymSign
	bg_event  03, 15, BGEVENT_READ, MauvilleGameCornerSign
	bg_event  31, 05, BGEVENT_READ, MauvilleBikeShopSign

	def_object_events
	object_event  02, 14, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MauvilleAngryGuyScript, -1
	object_event  36, 08, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleRocketBlockerScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event  36, 09, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleRocketBlockerScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event  29, 05, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleRocketBikerScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event  07, 16, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleRocketGirlScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event  16, 00, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MauvilleCity_Wally, EVENT_FOUND_MAUVILLE_WALLY
