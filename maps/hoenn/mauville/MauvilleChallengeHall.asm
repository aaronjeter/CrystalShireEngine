	object_const_def
	const MAUVILLECHALLENGEHALL_RECEPTIONIST
	const MAUVILLECHALLENGEHALL_OPPONENT
	const MAUVILLECHALLENGEHALL_CLERK
	const MAUVILLECHALLENGEHALL_NPC1
	const MAUVILLECHALLENGEHALL_NPC2

MauvilleChallengeHall_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MauvilleChallengeHallOpponentCallback

MauvilleChallengeHallOpponentCallback:
	variablesprite SPRITE_BATTLE_TOWER_OPPONENT, SPRITE_ROCKER
	endcallback

MauvilleChallengeHallReceptionistScript:
; Hoenn's intermediate challenge facility (FACILITY_HALL_HOENN): doubles, any 4
; Pokémon, 3 trainers in a row
	faceplayer
	opentext
	checkevent EVENT_FACILITY_HALL_HOENN
	iftrue .AlreadyCleared
	writetext MauvilleChallengeHallIntroText
	sjump .Ask

.AlreadyCleared:
	writetext MauvilleChallengeHallWelcomeBackText
.Ask:
	yesorno
	iffalse .Declined
	checkevent EVENT_FACILITY_HALL_HOENN
	iftrue .PrizeRoomOK
	facility_hall_prize_room BINDING_BAND
	iffalse .PackFull
.PrizeRoomOK:
	setval FACILITY_HALL_HOENN
	special FacilitySetup
	ifless FACILITY_TEAM_SIZE, .NotEnough
	writetext MauvilleChallengeHallChooseText
	waitbutton
	special FacilityChooseTeam
	iffalse .Declined
	writetext MauvilleChallengeHallGoText
	waitbutton
	closetext
	applymovement PLAYER, MauvilleChallengeHallEnterFloorMovement
	facility_battles MAUVILLECHALLENGEHALL_OPPONENT, MauvilleChallengeHallOpponentBeatenText, MauvilleChallengeHallOpponentWonText, MauvilleChallengeHallNextText, .Won, .Lost

.Won:
	applymovement PLAYER, MauvilleChallengeHallLeaveFloorMovement
	opentext
	writetext MauvilleChallengeHallWonText
	waitbutton
	checkevent EVENT_FACILITY_HALL_HOENN
	iftrue .Done
	setevent EVENT_FACILITY_HALL_HOENN
	writetext MauvilleChallengeHallPrizeText
	promptbutton
	setval 3
	special GiveBattlePoints
	writetext MauvilleChallengeHallGotBPText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	verbosegiveitem BINDING_BAND
	verbosegiveitem RARE_CANDY, 3
	verbosegiveitem ABILITY_CAPSULE, 2
	verbosegiveitem ABILITY_PATCH
	writetext MauvilleChallengeHallAfterPrizeText
	waitbutton
	sjump .Done

.Lost:
	applymovement PLAYER, MauvilleChallengeHallLeaveFloorMovement
	opentext
	writetext MauvilleChallengeHallLostText
	waitbutton
.Done:
	closetext
	end

.PackFull:
	writetext MauvilleChallengeHallPackFullText
	waitbutton
	closetext
	end

.NotEnough:
	writetext MauvilleChallengeHallNotEnoughText
	waitbutton
.Declined:
	writetext MauvilleChallengeHallDeclinedText
	waitbutton
	closetext
	end

MauvilleChallengeHallClerkScript:
	faceplayer
	opentext
	writetext MauvilleChallengeHallClerkText
	waitbutton
	setval BPSHOP_TIER1
	special BPShop
	writetext MauvilleChallengeHallClerkByeText
	waitbutton
	closetext
	end

MauvilleChallengeHallOpponentScript:
	jumptextfaceplayer MauvilleChallengeHallOpponentWaitingText

MauvilleChallengeHallNpc1Script:
	jumptextfaceplayer MauvilleChallengeHallNpc1Text

MauvilleChallengeHallNpc2Script:
	jumptextfaceplayer MauvilleChallengeHallNpc2Text

MauvilleChallengeHallEnterFloorMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MauvilleChallengeHallLeaveFloorMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head UP
	step_end

MauvilleChallengeHallIntroText:
	text "Welcome to the"
	line "Challenge Hall!"

	para "Enter 4 #MON"
	line "and battle 3"
	cont "skilled trainers"
	cont "in a row, in"
	cont "double battles."

	para "Everyone fights at"
	line "the same level."

	para "Win, and you'll"
	line "earn BP: Battle"
	cont "Points for prizes."

	para "Will you take the"
	line "challenge?"
	done

MauvilleChallengeHallWelcomeBackText:
	text "Welcome back! Will"
	line "you take the"
	cont "challenge again?"
	done

MauvilleChallengeHallChooseText:
	text "Pick your 4"
	line "#MON in the"
	cont "order they should"
	cont "go."
	done

MauvilleChallengeHallGoText:
	text "No PACK items, no"
	line "EXP. Your team is"
	cont "healed after each"
	cont "win, and goes back"
	cont "to how it was."

	para "Step onto the"
	line "floor, please!"
	done

MauvilleChallengeHallNextText:
	text "Healed and ready!"
	line "Here comes the"
	cont "next trainer!"
	done

MauvilleChallengeHallOpponentBeatenText:
	text "Well fought!"
	done

MauvilleChallengeHallOpponentWonText:
	text "Better luck next"
	line "time!"
	done

MauvilleChallengeHallOpponentWaitingText:
	text "I'm waiting for a"
	line "challenger! Talk"
	cont "to the"
	cont "receptionist to"
	cont "battle."
	done

MauvilleChallengeHallWonText:
	text "Congratulations!"
	line "You beat all"
	cont "three!"
	done

MauvilleChallengeHallPrizeText:
	text "Here are your"
	line "prizes for your"
	cont "first win."
	done

MauvilleChallengeHallGotBPText:
	text "<PLAYER>"
	line "received 3 BP!"
	done

MauvilleChallengeHallAfterPrizeText:
	text "A BINDING BAND"
	line "makes moves like"
	cont "WRAP hurt more."

	para "Spend BP at the"
	line "counter here."

	para "There are more"
	line "challenges across"
	cont "HOENN!"
	done

MauvilleChallengeHallLostText:
	text "Too bad! Your team"
	line "is back as it was."
	cont "Try again any"
	cont "time."
	done

MauvilleChallengeHallPackFullText:
	text "Your PACK is too"
	line "full for the"
	cont "prizes. Please"
	cont "make some room!"
	done

MauvilleChallengeHallNotEnoughText:
	text "You'll need at"
	line "least 4 #MON"
	cont "that aren't EGGS."
	done

MauvilleChallengeHallDeclinedText:
	text "Come back when"
	line "you're ready!"
	done

MauvilleChallengeHallClerkText:
	text "This is the BP"
	line "counter. Trade"
	cont "your BP for"
	cont "prizes!"
	done

MauvilleChallengeHallClerkByeText:
	text "Come again!"
	done

MauvilleChallengeHallNpc1Text:
	text "Rock and roll!"
	line "Doubles are all"
	cont "about rhythm and"
	cont "teamwork!"
	done

MauvilleChallengeHallNpc2Text:
	text "BP is a trainer's"
	line "reward for skill."
	cont "Spend it at the"
	cont "counter there."
	done

MauvilleChallengeHall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, MAUVILLE_CITY, 7
	warp_event  6, 13, MAUVILLE_CITY, 7
	warp_event  4, 13, MAUVILLE_CITY, 7
	warp_event  7, 13, MAUVILLE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleChallengeHallReceptionistScript, -1
	object_event  7,  4, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MauvilleChallengeHallOpponentScript, -1
	object_event  9, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MauvilleChallengeHallClerkScript, -1
	object_event  2,  8, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MauvilleChallengeHallNpc1Script, -1
	object_event  9,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleChallengeHallNpc2Script, -1
