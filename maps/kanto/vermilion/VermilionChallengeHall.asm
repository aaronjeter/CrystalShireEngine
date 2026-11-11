	object_const_def
	const VERMILIONCHALLENGEHALL_RECEPTIONIST
	const VERMILIONCHALLENGEHALL_OPPONENT
	const VERMILIONCHALLENGEHALL_CLERK
	const VERMILIONCHALLENGEHALL_NPC1
	const VERMILIONCHALLENGEHALL_NPC2

VermilionChallengeHall_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionChallengeHallOpponentCallback

VermilionChallengeHallOpponentCallback:
	variablesprite SPRITE_BATTLE_TOWER_OPPONENT, SPRITE_SAILOR
	endcallback

VermilionChallengeHallReceptionistScript:
; Kanto's intermediate challenge facility (FACILITY_HALL_KANTO): doubles, any 4
; Pokémon, 3 trainers in a row
	faceplayer
	opentext
	checkevent EVENT_FACILITY_INTRO_KANTO
	iffalse .Locked
	checkevent EVENT_FACILITY_HALL_KANTO
	iftrue .AlreadyCleared
	writetext VermilionChallengeHallIntroText
	sjump .Ask

.AlreadyCleared:
	writetext VermilionChallengeHallWelcomeBackText
.Ask:
	yesorno
	iffalse .Declined
	checkevent EVENT_FACILITY_HALL_KANTO
	iftrue .PrizeRoomOK
	facility_hall_prize_room WIDE_LENS
	iffalse .PackFull
.PrizeRoomOK:
	setval FACILITY_HALL_KANTO
	special FacilitySetup
	ifless FACILITY_TEAM_SIZE, .NotEnough
	writetext VermilionChallengeHallChooseText
	waitbutton
	special FacilityChooseTeam
	iffalse .Declined
	writetext VermilionChallengeHallGoText
	waitbutton
	closetext
	applymovement PLAYER, VermilionChallengeHallEnterFloorMovement
	facility_battles VERMILIONCHALLENGEHALL_OPPONENT, VermilionChallengeHallOpponentBeatenText, VermilionChallengeHallOpponentWonText, VermilionChallengeHallNextText, .Won, .Lost

.Won:
	applymovement PLAYER, VermilionChallengeHallLeaveFloorMovement
	opentext
	writetext VermilionChallengeHallWonText
	waitbutton
	checkevent EVENT_FACILITY_HALL_KANTO
	iftrue .Done
	setevent EVENT_FACILITY_HALL_KANTO
	writetext VermilionChallengeHallPrizeText
	promptbutton
	setval 3
	special GiveBattlePoints
	writetext VermilionChallengeHallGotBPText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	verbosegiveitem WIDE_LENS
	verbosegiveitem RARE_CANDY, 3
	verbosegiveitem ABILITY_CAPSULE, 2
	verbosegiveitem ABILITY_PATCH
	writetext VermilionChallengeHallAfterPrizeText
	waitbutton
	sjump .Done

.Lost:
	applymovement PLAYER, VermilionChallengeHallLeaveFloorMovement
	opentext
	writetext VermilionChallengeHallLostText
	waitbutton
.Done:
	closetext
	end

.Locked:
	writetext VermilionChallengeHallLockedText
	waitbutton
	closetext
	end

.PackFull:
	writetext VermilionChallengeHallPackFullText
	waitbutton
	closetext
	end

.NotEnough:
	writetext VermilionChallengeHallNotEnoughText
	waitbutton
.Declined:
	writetext VermilionChallengeHallDeclinedText
	waitbutton
	closetext
	end

VermilionChallengeHallClerkScript:
	faceplayer
	opentext
	writetext VermilionChallengeHallClerkText
	waitbutton
	setval BPSHOP_TIER1
	special BPShop
	writetext VermilionChallengeHallClerkByeText
	waitbutton
	closetext
	end

VermilionChallengeHallOpponentScript:
	jumptextfaceplayer VermilionChallengeHallOpponentWaitingText

VermilionChallengeHallNpc1Script:
	jumptextfaceplayer VermilionChallengeHallNpc1Text

VermilionChallengeHallNpc2Script:
	jumptextfaceplayer VermilionChallengeHallNpc2Text

VermilionChallengeHallEnterFloorMovement:
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

VermilionChallengeHallLeaveFloorMovement:
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

VermilionChallengeHallIntroText:
	text "Welcome to the"
	line "Challenge Hall!"

	para "Enter 4 #mon"
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

VermilionChallengeHallWelcomeBackText:
	text "Welcome back! Will"
	line "you take the"
	cont "challenge again?"
	done

VermilionChallengeHallChooseText:
	text "Pick your 4"
	line "#mon in the"
	cont "order they should"
	cont "go."
	done

VermilionChallengeHallGoText:
	text "No Pack items, no"
	line "Exp. Your team is"
	cont "healed after each"
	cont "win, and goes back"
	cont "to how it was."

	para "Step onto the"
	line "floor, please!"
	done

VermilionChallengeHallNextText:
	text "Healed and ready!"
	line "Here comes the"
	cont "next trainer!"
	done

VermilionChallengeHallOpponentBeatenText:
	text "Well fought!"
	done

VermilionChallengeHallOpponentWonText:
	text "Better luck next"
	line "time!"
	done

VermilionChallengeHallOpponentWaitingText:
	text "I'm waiting for a"
	line "challenger! Talk"
	cont "to the"
	cont "receptionist to"
	cont "battle."
	done

VermilionChallengeHallWonText:
	text "Congratulations!"
	line "You beat all"
	cont "three!"
	done

VermilionChallengeHallPrizeText:
	text "Here are your"
	line "prizes for your"
	cont "first win."
	done

VermilionChallengeHallGotBPText:
	text "<PLAYER>"
	line "received 3 BP!"
	done

VermilionChallengeHallAfterPrizeText:
	text "A Wide Lens makes"
	line "its holder's moves"
	cont "a bit more sure."

	para "Spend BP at the"
	line "counter here."

	para "There are more"
	line "challenges across"
	cont "Kanto!"
	done

VermilionChallengeHallLostText:
	text "Too bad! Your team"
	line "is back as it was."
	cont "Try again any"
	cont "time."
	done

VermilionChallengeHallLockedText:
	text "Sorry! This hall"
	line "is for trainers"
	cont "with more"
	cont "experience."

	para "Please clear the"
	line "Trainer House in"
	cont "Viridian first!"
	done

VermilionChallengeHallPackFullText:
	text "Your Pack is too"
	line "full for the"
	cont "prizes. Please"
	cont "make some room!"
	done

VermilionChallengeHallNotEnoughText:
	text "You'll need at"
	line "least 4 #mon"
	cont "that aren't Eggs."
	done

VermilionChallengeHallDeclinedText:
	text "Come back when"
	line "you're ready!"
	done

VermilionChallengeHallClerkText:
	text "This is the BP"
	line "counter. Trade"
	cont "your BP for"
	cont "prizes!"
	done

VermilionChallengeHallClerkByeText:
	text "Come again!"
	done

VermilionChallengeHallNpc1Text:
	text "Sailors here love"
	line "a slugfest. Bring"
	cont "#mon that hit"
	cont "both foes!"
	done

VermilionChallengeHallNpc2Text:
	text "BP is a trainer's"
	line "reward for skill."
	cont "Spend it at the"
	cont "counter there."
	done

VermilionChallengeHall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, VERMILION_CITY, 11
	warp_event  6, 13, VERMILION_CITY, 11
	warp_event  4, 13, VERMILION_CITY, 11
	warp_event  7, 13, VERMILION_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionChallengeHallReceptionistScript, -1
	object_event  7,  4, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionChallengeHallOpponentScript, -1
	object_event  9, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionChallengeHallClerkScript, -1
	object_event  2,  8, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionChallengeHallNpc1Script, -1
	object_event  9,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionChallengeHallNpc2Script, -1
