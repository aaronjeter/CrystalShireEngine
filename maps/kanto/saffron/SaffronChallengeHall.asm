	object_const_def
	const SAFFRONCHALLENGEHALL_RECEPTIONIST
	const SAFFRONCHALLENGEHALL_OPPONENT
	const SAFFRONCHALLENGEHALL_CLERK
	const SAFFRONCHALLENGEHALL_NPC1
	const SAFFRONCHALLENGEHALL_CLERK2

SaffronChallengeHall_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SaffronChallengeHallOpponentCallback

SaffronChallengeHallOpponentCallback:
	variablesprite SPRITE_BATTLE_TOWER_OPPONENT, SPRITE_YOUNGSTER
	endcallback

SaffronChallengeHallReceptionistScript:
; Kanto's hard challenge facility (FACILITY_HARD_KANTO): doubles, any 4
; Pokémon, 3 trainers in a row
	faceplayer
	opentext
	checkevent EVENT_FACILITY_HALL_KANTO
	iffalse .Locked
	checkevent EVENT_FACILITY_HARD_KANTO
	iftrue .AlreadyCleared
	writetext SaffronChallengeHallIntroText
	sjump .Ask

.AlreadyCleared:
	writetext SaffronChallengeHallWelcomeBackText
.Ask:
	yesorno
	iffalse .Declined
	checkevent EVENT_FACILITY_HARD_KANTO
	iftrue .PrizeRoomOK
	facility_hall_prize_room EXPERT_BELT
	iffalse .PackFull
.PrizeRoomOK:
	setval FACILITY_HARD_KANTO
	special FacilitySetup
	ifless FACILITY_TEAM_SIZE, .NotEnough
	writetext SaffronChallengeHallChooseText
	waitbutton
	special FacilityChooseTeam
	iffalse .Declined
	writetext SaffronChallengeHallGoText
	waitbutton
	closetext
	applymovement PLAYER, SaffronChallengeHallEnterFloorMovement
	facility_battles SAFFRONCHALLENGEHALL_OPPONENT, SaffronChallengeHallOpponentBeatenText, SaffronChallengeHallOpponentWonText, SaffronChallengeHallNextText, .Won, .Lost

.Won:
	applymovement PLAYER, SaffronChallengeHallLeaveFloorMovement
	opentext
	writetext SaffronChallengeHallWonText
	waitbutton
	checkevent EVENT_FACILITY_HARD_KANTO
	iftrue .Done
	setevent EVENT_FACILITY_HARD_KANTO
	writetext SaffronChallengeHallPrizeText
	promptbutton
	setval 5
	special GiveBattlePoints
	writetext SaffronChallengeHallGotBPText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	verbosegiveitem EXPERT_BELT
	verbosegiveitem RARE_CANDY, 3
	verbosegiveitem ABILITY_CAPSULE, 2
	verbosegiveitem ABILITY_PATCH
	writetext SaffronChallengeHallAfterPrizeText
	waitbutton
	sjump .Done

.Lost:
	applymovement PLAYER, SaffronChallengeHallLeaveFloorMovement
	opentext
	writetext SaffronChallengeHallLostText
	waitbutton
.Done:
	closetext
	end

.Locked:
	writetext SaffronChallengeHallLockedText
	waitbutton
	closetext
	end

.PackFull:
	writetext SaffronChallengeHallPackFullText
	waitbutton
	closetext
	end

.NotEnough:
	writetext SaffronChallengeHallNotEnoughText
	waitbutton
.Declined:
	writetext SaffronChallengeHallDeclinedText
	waitbutton
	closetext
	end

SaffronChallengeHallClerkScript:
	faceplayer
	opentext
	writetext SaffronChallengeHallClerkText
	waitbutton
	setval BPSHOP_TIER1
	special BPShop
	writetext SaffronChallengeHallClerkByeText
	waitbutton
	closetext
	end

SaffronChallengeHallOpponentScript:
	jumptextfaceplayer SaffronChallengeHallOpponentWaitingText

SaffronChallengeHallNpc1Script:
	jumptextfaceplayer SaffronChallengeHallNpc1Text

SaffronChallengeHallClerk2Script:
	faceplayer
	opentext
	writetext SaffronChallengeHallClerk2Text
	waitbutton
	setval BPSHOP_TIER2
	special BPShop
	writetext SaffronChallengeHallClerkByeText
	waitbutton
	closetext
	end

SaffronChallengeHallEnterFloorMovement:
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

SaffronChallengeHallLeaveFloorMovement:
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

SaffronChallengeHallIntroText:
	text "Welcome to the"
	line "Challenge Hall!"

	para "Enter 4 #mon"
	line "and battle 3"
	cont "expert trainers"
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

SaffronChallengeHallWelcomeBackText:
	text "Welcome back! Will"
	line "you take the"
	cont "challenge again?"
	done

SaffronChallengeHallChooseText:
	text "Pick your 4"
	line "#mon in the"
	cont "order they should"
	cont "go."
	done

SaffronChallengeHallGoText:
	text "No Pack items, no"
	line "Exp. Your team is"
	cont "healed after each"
	cont "win, and goes back"
	cont "to how it was."

	para "Step onto the"
	line "floor, please!"
	done

SaffronChallengeHallNextText:
	text "Healed and ready!"
	line "Here comes the"
	cont "next trainer!"
	done

SaffronChallengeHallOpponentBeatenText:
	text "Well fought!"
	done

SaffronChallengeHallOpponentWonText:
	text "Better luck next"
	line "time!"
	done

SaffronChallengeHallOpponentWaitingText:
	text "I'm waiting for a"
	line "challenger! Talk"
	cont "to the"
	cont "receptionist to"
	cont "battle."
	done

SaffronChallengeHallWonText:
	text "Congratulations!"
	line "You beat all"
	cont "three!"
	done

SaffronChallengeHallPrizeText:
	text "Here are your"
	line "prizes for your"
	cont "first win."
	done

SaffronChallengeHallGotBPText:
	text "<PLAYER>"
	line "received 5 BP!"
	done

SaffronChallengeHallAfterPrizeText:
	text "An Expert Belt"
	line "powers up moves"
	cont "that are super-"
	cont "effective."

	para "Spend BP at the"
	line "counter here."

	para "Come back and"
	line "test your skill"
	cont "any time!"
	done

SaffronChallengeHallLostText:
	text "Too bad! Your team"
	line "is back as it was."
	cont "Try again any"
	cont "time."
	done

SaffronChallengeHallLockedText:
	text "Sorry! This hall"
	line "is for trainers"
	cont "with more"
	cont "experience."

	para "Please clear the"
	line "Challenge Hall in"
	cont "Vermilion first!"
	done

SaffronChallengeHallPackFullText:
	text "Your Pack is too"
	line "full for the"
	cont "prizes. Please"
	cont "make some room!"
	done

SaffronChallengeHallNotEnoughText:
	text "You'll need at"
	line "least 4 #mon"
	cont "that aren't Eggs."
	done

SaffronChallengeHallDeclinedText:
	text "Come back when"
	line "you're ready!"
	done

SaffronChallengeHallClerkText:
	text "This is the BP"
	line "counter. Trade"
	cont "your BP for"
	cont "prizes!"
	done

SaffronChallengeHallClerkByeText:
	text "Come again!"
	done

SaffronChallengeHallNpc1Text:
	text "Trainers from the"
	line "Dojo and Silph"
	cont "train here. Plan"
	cont "for both foes!"
	done

SaffronChallengeHallClerk2Text:
	text "I have held items"
	line "for more BP. Take"
	cont "a look!"
	done

SaffronChallengeHall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, SAFFRON_CITY, 16
	warp_event  6, 13, SAFFRON_CITY, 16
	warp_event  4, 13, SAFFRON_CITY, 16
	warp_event  7, 13, SAFFRON_CITY, 16

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronChallengeHallReceptionistScript, -1
	object_event  7,  4, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronChallengeHallOpponentScript, -1
	object_event  9, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronChallengeHallClerkScript, -1
	object_event  2,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronChallengeHallNpc1Script, -1
	object_event  9,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronChallengeHallClerk2Script, -1
