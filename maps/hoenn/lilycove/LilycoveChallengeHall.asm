	object_const_def
	const LILYCOVECHALLENGEHALL_RECEPTIONIST
	const LILYCOVECHALLENGEHALL_OPPONENT
	const LILYCOVECHALLENGEHALL_CLERK
	const LILYCOVECHALLENGEHALL_NPC1
	const LILYCOVECHALLENGEHALL_CLERK2

LilycoveChallengeHall_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, LilycoveChallengeHallOpponentCallback

LilycoveChallengeHallOpponentCallback:
	variablesprite SPRITE_BATTLE_TOWER_OPPONENT, SPRITE_LASS
	endcallback

LilycoveChallengeHallReceptionistScript:
; Hoenn's hard challenge facility (FACILITY_HARD_HOENN): doubles, any 4
; Pokémon, 3 trainers in a row
	faceplayer
	opentext
	checkevent EVENT_FACILITY_HALL_HOENN
	iffalse .Locked
	checkevent EVENT_FACILITY_HARD_HOENN
	iftrue .AlreadyCleared
	writetext LilycoveChallengeHallIntroText
	sjump .Ask

.AlreadyCleared:
	writetext LilycoveChallengeHallWelcomeBackText
.Ask:
	yesorno
	iffalse .Declined
	checkevent EVENT_FACILITY_HARD_HOENN
	iftrue .PrizeRoomOK
	facility_hall_prize_room SHELL_BELL
	iffalse .PackFull
.PrizeRoomOK:
	setval FACILITY_HARD_HOENN
	special FacilitySetup
	ifless FACILITY_TEAM_SIZE, .NotEnough
	writetext LilycoveChallengeHallChooseText
	waitbutton
	special FacilityChooseTeam
	iffalse .Declined
	writetext LilycoveChallengeHallGoText
	waitbutton
	closetext
	applymovement PLAYER, LilycoveChallengeHallEnterFloorMovement
	facility_battles LILYCOVECHALLENGEHALL_OPPONENT, LilycoveChallengeHallOpponentBeatenText, LilycoveChallengeHallOpponentWonText, LilycoveChallengeHallNextText, .Won, .Lost

.Won:
	applymovement PLAYER, LilycoveChallengeHallLeaveFloorMovement
	opentext
	writetext LilycoveChallengeHallWonText
	waitbutton
	checkevent EVENT_FACILITY_HARD_HOENN
	iftrue .Done
	setevent EVENT_FACILITY_HARD_HOENN
	writetext LilycoveChallengeHallPrizeText
	promptbutton
	setval 5
	special GiveBattlePoints
	writetext LilycoveChallengeHallGotBPText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	verbosegiveitem SHELL_BELL
	verbosegiveitem RARE_CANDY, 3
	verbosegiveitem ABILITY_CAPSULE, 2
	verbosegiveitem ABILITY_PATCH
	writetext LilycoveChallengeHallAfterPrizeText
	waitbutton
	sjump .Done

.Lost:
	applymovement PLAYER, LilycoveChallengeHallLeaveFloorMovement
	opentext
	writetext LilycoveChallengeHallLostText
	waitbutton
.Done:
	closetext
	end

.Locked:
	writetext LilycoveChallengeHallLockedText
	waitbutton
	closetext
	end

.PackFull:
	writetext LilycoveChallengeHallPackFullText
	waitbutton
	closetext
	end

.NotEnough:
	writetext LilycoveChallengeHallNotEnoughText
	waitbutton
.Declined:
	writetext LilycoveChallengeHallDeclinedText
	waitbutton
	closetext
	end

LilycoveChallengeHallClerkScript:
	faceplayer
	opentext
	writetext LilycoveChallengeHallClerkText
	waitbutton
	setval BPSHOP_TIER1
	special BPShop
	writetext LilycoveChallengeHallClerkByeText
	waitbutton
	closetext
	end

LilycoveChallengeHallOpponentScript:
	jumptextfaceplayer LilycoveChallengeHallOpponentWaitingText

LilycoveChallengeHallNpc1Script:
	jumptextfaceplayer LilycoveChallengeHallNpc1Text

LilycoveChallengeHallClerk2Script:
	faceplayer
	opentext
	writetext LilycoveChallengeHallClerk2Text
	waitbutton
	setval BPSHOP_TIER2
	special BPShop
	writetext LilycoveChallengeHallClerkByeText
	waitbutton
	closetext
	end

LilycoveChallengeHallEnterFloorMovement:
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

LilycoveChallengeHallLeaveFloorMovement:
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

LilycoveChallengeHallIntroText:
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

LilycoveChallengeHallWelcomeBackText:
	text "Welcome back! Will"
	line "you take the"
	cont "challenge again?"
	done

LilycoveChallengeHallChooseText:
	text "Pick your 4"
	line "#mon in the"
	cont "order they should"
	cont "go."
	done

LilycoveChallengeHallGoText:
	text "No Pack items, no"
	line "Exp. Your team is"
	cont "healed after each"
	cont "win, and goes back"
	cont "to how it was."

	para "Step onto the"
	line "floor, please!"
	done

LilycoveChallengeHallNextText:
	text "Healed and ready!"
	line "Here comes the"
	cont "next trainer!"
	done

LilycoveChallengeHallOpponentBeatenText:
	text "Well fought!"
	done

LilycoveChallengeHallOpponentWonText:
	text "Better luck next"
	line "time!"
	done

LilycoveChallengeHallOpponentWaitingText:
	text "I'm waiting for a"
	line "challenger! Talk"
	cont "to the"
	cont "receptionist to"
	cont "battle."
	done

LilycoveChallengeHallWonText:
	text "Congratulations!"
	line "You beat all"
	cont "three!"
	done

LilycoveChallengeHallPrizeText:
	text "Here are your"
	line "prizes for your"
	cont "first win."
	done

LilycoveChallengeHallGotBPText:
	text "<PLAYER>"
	line "received 5 BP!"
	done

LilycoveChallengeHallAfterPrizeText:
	text "A Shell Bell"
	line "restores HP as"
	cont "its holder deals"
	cont "damage."

	para "Spend BP at the"
	line "counter here."

	para "Come back and"
	line "test your skill"
	cont "any time!"
	done

LilycoveChallengeHallLostText:
	text "Too bad! Your team"
	line "is back as it was."
	cont "Try again any"
	cont "time."
	done

LilycoveChallengeHallLockedText:
	text "Sorry! This hall"
	line "is for trainers"
	cont "with more"
	cont "experience."

	para "Please clear the"
	line "Challenge Hall in"
	cont "Mauville first!"
	done

LilycoveChallengeHallPackFullText:
	text "Your Pack is too"
	line "full for the"
	cont "prizes. Please"
	cont "make some room!"
	done

LilycoveChallengeHallNotEnoughText:
	text "You'll need at"
	line "least 4 #mon"
	cont "that aren't Eggs."
	done

LilycoveChallengeHallDeclinedText:
	text "Come back when"
	line "you're ready!"
	done

LilycoveChallengeHallClerkText:
	text "This is the BP"
	line "counter. Trade"
	cont "your BP for"
	cont "prizes!"
	done

LilycoveChallengeHallClerkByeText:
	text "Come again!"
	done

LilycoveChallengeHallNpc1Text:
	text "After the"
	line "contests, the best"
	cont "trainers in town"
	cont "come here!"
	done

LilycoveChallengeHallClerk2Text:
	text "I have held items"
	line "for more BP. Take"
	cont "a look!"
	done

LilycoveChallengeHall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, LILYCOVE_CITY, 7
	warp_event  6, 13, LILYCOVE_CITY, 7
	warp_event  4, 13, LILYCOVE_CITY, 7
	warp_event  7, 13, LILYCOVE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LilycoveChallengeHallReceptionistScript, -1
	object_event  7,  4, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveChallengeHallOpponentScript, -1
	object_event  9, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LilycoveChallengeHallClerkScript, -1
	object_event  2,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LilycoveChallengeHallNpc1Script, -1
	object_event  9,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveChallengeHallClerk2Script, -1
