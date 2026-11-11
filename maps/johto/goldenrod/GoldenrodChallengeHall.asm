	object_const_def
	const GOLDENRODCHALLENGEHALL_RECEPTIONIST
	const GOLDENRODCHALLENGEHALL_OPPONENT
	const GOLDENRODCHALLENGEHALL_CLERK
	const GOLDENRODCHALLENGEHALL_NPC1
	const GOLDENRODCHALLENGEHALL_NPC2

GoldenrodChallengeHall_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, GoldenrodChallengeHallOpponentCallback

GoldenrodChallengeHallOpponentCallback:
	variablesprite SPRITE_BATTLE_TOWER_OPPONENT, SPRITE_SUPER_NERD
	endcallback

GoldenrodChallengeHallReceptionistScript:
; Johto's intermediate challenge facility (FACILITY_HALL_JOHTO): doubles, any 4
; Pokémon, 3 trainers in a row
	faceplayer
	opentext
	checkevent EVENT_FACILITY_HALL_JOHTO
	iftrue .AlreadyCleared
	writetext GoldenrodChallengeHallIntroText
	sjump .Ask

.AlreadyCleared:
	writetext GoldenrodChallengeHallWelcomeBackText
.Ask:
	yesorno
	iffalse .Declined
	checkevent EVENT_FACILITY_HALL_JOHTO
	iftrue .PrizeRoomOK
	facility_hall_prize_room BIG_ROOT
	iffalse .PackFull
.PrizeRoomOK:
	setval FACILITY_HALL_JOHTO
	special FacilitySetup
	ifless FACILITY_TEAM_SIZE, .NotEnough
	writetext GoldenrodChallengeHallChooseText
	waitbutton
	special FacilityChooseTeam
	iffalse .Declined
	writetext GoldenrodChallengeHallGoText
	waitbutton
	closetext
	applymovement PLAYER, GoldenrodChallengeHallEnterFloorMovement
	facility_battles GOLDENRODCHALLENGEHALL_OPPONENT, GoldenrodChallengeHallOpponentBeatenText, GoldenrodChallengeHallOpponentWonText, GoldenrodChallengeHallNextText, .Won, .Lost

.Won:
	applymovement PLAYER, GoldenrodChallengeHallLeaveFloorMovement
	opentext
	writetext GoldenrodChallengeHallWonText
	waitbutton
	checkevent EVENT_FACILITY_HALL_JOHTO
	iftrue .Done
	setevent EVENT_FACILITY_HALL_JOHTO
	writetext GoldenrodChallengeHallPrizeText
	promptbutton
	setval 3
	special GiveBattlePoints
	writetext GoldenrodChallengeHallGotBPText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	verbosegiveitem BIG_ROOT
	verbosegiveitem RARE_CANDY, 3
	verbosegiveitem ABILITY_CAPSULE, 2
	verbosegiveitem ABILITY_PATCH
	writetext GoldenrodChallengeHallAfterPrizeText
	waitbutton
	sjump .Done

.Lost:
	applymovement PLAYER, GoldenrodChallengeHallLeaveFloorMovement
	opentext
	writetext GoldenrodChallengeHallLostText
	waitbutton
.Done:
	closetext
	end

.PackFull:
	writetext GoldenrodChallengeHallPackFullText
	waitbutton
	closetext
	end

.NotEnough:
	writetext GoldenrodChallengeHallNotEnoughText
	waitbutton
.Declined:
	writetext GoldenrodChallengeHallDeclinedText
	waitbutton
	closetext
	end

GoldenrodChallengeHallClerkScript:
	faceplayer
	opentext
	writetext GoldenrodChallengeHallClerkText
	waitbutton
	setval BPSHOP_TIER1
	special BPShop
	writetext GoldenrodChallengeHallClerkByeText
	waitbutton
	closetext
	end

GoldenrodChallengeHallOpponentScript:
	jumptextfaceplayer GoldenrodChallengeHallOpponentWaitingText

GoldenrodChallengeHallNpc1Script:
	jumptextfaceplayer GoldenrodChallengeHallNpc1Text

GoldenrodChallengeHallNpc2Script:
	jumptextfaceplayer GoldenrodChallengeHallNpc2Text

GoldenrodChallengeHallEnterFloorMovement:
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

GoldenrodChallengeHallLeaveFloorMovement:
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

GoldenrodChallengeHallIntroText:
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

GoldenrodChallengeHallWelcomeBackText:
	text "Welcome back! Will"
	line "you take the"
	cont "challenge again?"
	done

GoldenrodChallengeHallChooseText:
	text "Pick your 4"
	line "#MON in the"
	cont "order they should"
	cont "go."
	done

GoldenrodChallengeHallGoText:
	text "No PACK items, no"
	line "EXP. Your team is"
	cont "healed after each"
	cont "win, and goes back"
	cont "to how it was."

	para "Step onto the"
	line "floor, please!"
	done

GoldenrodChallengeHallNextText:
	text "Healed and ready!"
	line "Here comes the"
	cont "next trainer!"
	done

GoldenrodChallengeHallOpponentBeatenText:
	text "Well fought!"
	done

GoldenrodChallengeHallOpponentWonText:
	text "Better luck next"
	line "time!"
	done

GoldenrodChallengeHallOpponentWaitingText:
	text "I'm waiting for a"
	line "challenger! Talk"
	cont "to the"
	cont "receptionist to"
	cont "battle."
	done

GoldenrodChallengeHallWonText:
	text "Congratulations!"
	line "You beat all"
	cont "three!"
	done

GoldenrodChallengeHallPrizeText:
	text "Here are your"
	line "prizes for your"
	cont "first win."
	done

GoldenrodChallengeHallGotBPText:
	text "<PLAYER>"
	line "received 3 BP!"
	done

GoldenrodChallengeHallAfterPrizeText:
	text "A BIG ROOT makes"
	line "draining moves"
	cont "heal even more."

	para "Spend BP at the"
	line "counter here."

	para "There are more"
	line "challenges across"
	cont "JOHTO!"
	done

GoldenrodChallengeHallLostText:
	text "Too bad! Your team"
	line "is back as it was."
	cont "Try again any"
	cont "time."
	done

GoldenrodChallengeHallPackFullText:
	text "Your PACK is too"
	line "full for the"
	cont "prizes. Please"
	cont "make some room!"
	done

GoldenrodChallengeHallNotEnoughText:
	text "You'll need at"
	line "least 4 #MON"
	cont "that aren't EGGS."
	done

GoldenrodChallengeHallDeclinedText:
	text "Come back when"
	line "you're ready!"
	done

GoldenrodChallengeHallClerkText:
	text "This is the BP"
	line "counter. Trade"
	cont "your BP for"
	cont "prizes!"
	done

GoldenrodChallengeHallClerkByeText:
	text "Come again!"
	done

GoldenrodChallengeHallNpc1Text:
	text "Speed matters in"
	line "double battles."
	cont "Who moves first"
	cont "can win it all!"
	done

GoldenrodChallengeHallNpc2Text:
	text "BP is a trainer's"
	line "reward for skill."
	cont "Spend it at the"
	cont "counter there."
	done

GoldenrodChallengeHall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, GOLDENROD_CITY, 16
	warp_event  6, 13, GOLDENROD_CITY, 16
	warp_event  4, 13, GOLDENROD_CITY, 16
	warp_event  7, 13, GOLDENROD_CITY, 16

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodChallengeHallReceptionistScript, -1
	object_event  7,  4, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodChallengeHallOpponentScript, -1
	object_event  9, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodChallengeHallClerkScript, -1
	object_event  2,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodChallengeHallNpc1Script, -1
	object_event  9,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodChallengeHallNpc2Script, -1
