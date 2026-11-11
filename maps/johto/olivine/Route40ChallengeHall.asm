	object_const_def
	const ROUTE40CHALLENGEHALL_RECEPTIONIST
	const ROUTE40CHALLENGEHALL_OPPONENT
	const ROUTE40CHALLENGEHALL_CLERK
	const ROUTE40CHALLENGEHALL_NPC1
	const ROUTE40CHALLENGEHALL_CLERK2

Route40ChallengeHall_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route40ChallengeHallOpponentCallback

Route40ChallengeHallOpponentCallback:
	variablesprite SPRITE_BATTLE_TOWER_OPPONENT, SPRITE_SAILOR
	endcallback

Route40ChallengeHallReceptionistScript:
; Johto's hard challenge facility (FACILITY_HARD_JOHTO): doubles, any 4
; Pokémon, 3 trainers in a row
	faceplayer
	opentext
	checkevent EVENT_FACILITY_HALL_JOHTO
	iffalse .Locked
	checkevent EVENT_FACILITY_HARD_JOHTO
	iftrue .AlreadyCleared
	writetext Route40ChallengeHallIntroText
	sjump .Ask

.AlreadyCleared:
	writetext Route40ChallengeHallWelcomeBackText
.Ask:
	yesorno
	iffalse .Declined
	checkevent EVENT_FACILITY_HARD_JOHTO
	iftrue .PrizeRoomOK
	facility_hall_prize_room ROCKY_HELMET
	iffalse .PackFull
.PrizeRoomOK:
	setval FACILITY_HARD_JOHTO
	special FacilitySetup
	ifless FACILITY_TEAM_SIZE, .NotEnough
	writetext Route40ChallengeHallChooseText
	waitbutton
	special FacilityChooseTeam
	iffalse .Declined
	writetext Route40ChallengeHallGoText
	waitbutton
	closetext
	applymovement PLAYER, Route40ChallengeHallEnterFloorMovement
	facility_battles ROUTE40CHALLENGEHALL_OPPONENT, Route40ChallengeHallOpponentBeatenText, Route40ChallengeHallOpponentWonText, Route40ChallengeHallNextText, .Won, .Lost

.Won:
	applymovement PLAYER, Route40ChallengeHallLeaveFloorMovement
	opentext
	writetext Route40ChallengeHallWonText
	waitbutton
	checkevent EVENT_FACILITY_HARD_JOHTO
	iftrue .Done
	setevent EVENT_FACILITY_HARD_JOHTO
	writetext Route40ChallengeHallPrizeText
	promptbutton
	setval 5
	special GiveBattlePoints
	writetext Route40ChallengeHallGotBPText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	verbosegiveitem ROCKY_HELMET
	verbosegiveitem RARE_CANDY, 3
	verbosegiveitem ABILITY_CAPSULE, 2
	verbosegiveitem ABILITY_PATCH
	writetext Route40ChallengeHallAfterPrizeText
	waitbutton
	sjump .Done

.Lost:
	applymovement PLAYER, Route40ChallengeHallLeaveFloorMovement
	opentext
	writetext Route40ChallengeHallLostText
	waitbutton
.Done:
	closetext
	end

.Locked:
	writetext Route40ChallengeHallLockedText
	waitbutton
	closetext
	end

.PackFull:
	writetext Route40ChallengeHallPackFullText
	waitbutton
	closetext
	end

.NotEnough:
	writetext Route40ChallengeHallNotEnoughText
	waitbutton
.Declined:
	writetext Route40ChallengeHallDeclinedText
	waitbutton
	closetext
	end

Route40ChallengeHallClerkScript:
	faceplayer
	opentext
	writetext Route40ChallengeHallClerkText
	waitbutton
	setval BPSHOP_TIER1
	special BPShop
	writetext Route40ChallengeHallClerkByeText
	waitbutton
	closetext
	end

Route40ChallengeHallOpponentScript:
	jumptextfaceplayer Route40ChallengeHallOpponentWaitingText

Route40ChallengeHallNpc1Script:
	jumptextfaceplayer Route40ChallengeHallNpc1Text

Route40ChallengeHallClerk2Script:
	faceplayer
	opentext
	writetext Route40ChallengeHallClerk2Text
	waitbutton
	setval BPSHOP_TIER2
	special BPShop
	writetext Route40ChallengeHallClerkByeText
	waitbutton
	closetext
	end

Route40ChallengeHallEnterFloorMovement:
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

Route40ChallengeHallLeaveFloorMovement:
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

Route40ChallengeHallIntroText:
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

Route40ChallengeHallWelcomeBackText:
	text "Welcome back! Will"
	line "you take the"
	cont "challenge again?"
	done

Route40ChallengeHallChooseText:
	text "Pick your 4"
	line "#mon in the"
	cont "order they should"
	cont "go."
	done

Route40ChallengeHallGoText:
	text "No Pack items, no"
	line "Exp. Your team is"
	cont "healed after each"
	cont "win, and goes back"
	cont "to how it was."

	para "Step onto the"
	line "floor, please!"
	done

Route40ChallengeHallNextText:
	text "Healed and ready!"
	line "Here comes the"
	cont "next trainer!"
	done

Route40ChallengeHallOpponentBeatenText:
	text "Well fought!"
	done

Route40ChallengeHallOpponentWonText:
	text "Better luck next"
	line "time!"
	done

Route40ChallengeHallOpponentWaitingText:
	text "I'm waiting for a"
	line "challenger! Talk"
	cont "to the"
	cont "receptionist to"
	cont "battle."
	done

Route40ChallengeHallWonText:
	text "Congratulations!"
	line "You beat all"
	cont "three!"
	done

Route40ChallengeHallPrizeText:
	text "Here are your"
	line "prizes for your"
	cont "first win."
	done

Route40ChallengeHallGotBPText:
	text "<PLAYER>"
	line "received 5 BP!"
	done

Route40ChallengeHallAfterPrizeText:
	text "A Rocky Helmet"
	line "hurts foes that"
	cont "touch its holder."

	para "Spend BP at the"
	line "counter here."

	para "Come back and"
	line "test your skill"
	cont "any time!"
	done

Route40ChallengeHallLostText:
	text "Too bad! Your team"
	line "is back as it was."
	cont "Try again any"
	cont "time."
	done

Route40ChallengeHallLockedText:
	text "Sorry! This hall"
	line "is for trainers"
	cont "with more"
	cont "experience."

	para "Please clear the"
	line "Challenge Hall in"
	cont "Goldenrod first!"
	done

Route40ChallengeHallPackFullText:
	text "Your Pack is too"
	line "full for the"
	cont "prizes. Please"
	cont "make some room!"
	done

Route40ChallengeHallNotEnoughText:
	text "You'll need at"
	line "least 4 #mon"
	cont "that aren't Eggs."
	done

Route40ChallengeHallDeclinedText:
	text "Come back when"
	line "you're ready!"
	done

Route40ChallengeHallClerkText:
	text "This is the BP"
	line "counter. Trade"
	cont "your BP for"
	cont "prizes!"
	done

Route40ChallengeHallClerkByeText:
	text "Come again!"
	done

Route40ChallengeHallNpc1Text:
	text "The Battle Tower"
	line "is gone, but its"
	cont "spirit lives on"
	cont "in this hall!"
	done

Route40ChallengeHallClerk2Text:
	text "I have held items"
	line "for more BP. Take"
	cont "a look!"
	done

Route40ChallengeHall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  6, 13, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  4, 13, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  7, 13, ROUTE_40_BATTLE_TOWER_GATE, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40ChallengeHallReceptionistScript, -1
	object_event  7,  4, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40ChallengeHallOpponentScript, -1
	object_event  9, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40ChallengeHallClerkScript, -1
	object_event  2,  8, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40ChallengeHallNpc1Script, -1
	object_event  9,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40ChallengeHallClerk2Script, -1
