	object_const_def
	const TRAINERHOUSEB1F_RECEPTIONIST
	const TRAINERHOUSEB1F_OPPONENT

TrainerHouseB1F_MapScripts:
	def_scene_scripts
	scene_script TrainerHouseB1FNoopScene, SCENE_TRAINERHOUSEB1F_ASK_BATTLE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TrainerHouseB1FOpponentCallback

TrainerHouseB1FOpponentCallback:
	variablesprite SPRITE_BATTLE_TOWER_OPPONENT, SPRITE_YOUNGSTER
	endcallback

TrainerHouseB1FNoopScene:
	end

TrainerHouseReceptionistScript:
; Kanto's introductory challenge facility (FACILITY_INTRO_KANTO): doubles,
; any 4 Pokémon, 3 trainers in a row
	turnobject PLAYER, UP
	opentext
	checkevent EVENT_FACILITY_INTRO_KANTO
	iftrue .AlreadyCleared
	writetext TrainerHouseB1FIntroText
	sjump .AskChallenge

.AlreadyCleared:
	writetext TrainerHouseB1FWelcomeBackText
.AskChallenge:
	yesorno
	iffalse .Declined
	checkevent EVENT_FACILITY_INTRO_KANTO
	iftrue .PrizeRoomOK
	facility_intro_prize_room
	iffalse .PackFull
.PrizeRoomOK:
	setval FACILITY_INTRO_KANTO
	special FacilitySetup
	ifless FACILITY_TEAM_SIZE, .NotEnough
	writetext TrainerHouseB1FChooseText
	waitbutton
	special FacilityChooseTeam
	iffalse .Declined
	writetext TrainerHouseB1FGoRightInText
	waitbutton
	closetext
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	facility_battles TRAINERHOUSEB1F_OPPONENT, TrainerHouseB1FOpponentBeatenText, TrainerHouseB1FOpponentWonText, TrainerHouseB1FNextText, .Won, .Lost

.Won:
	applymovement PLAYER, Movement_ExitTrainerHouseBattleRoom
	turnobject PLAYER, UP
	opentext
	writetext TrainerHouseB1FWonText
	waitbutton
	checkevent EVENT_FACILITY_INTRO_KANTO
	iftrue .Done
	setevent EVENT_FACILITY_INTRO_KANTO
	writetext TrainerHouseB1FPrizeText
	promptbutton
	verbosegiveitem RARE_CANDY, 3
	verbosegiveitem ABILITY_CAPSULE, 2
	verbosegiveitem ABILITY_PATCH
	writetext TrainerHouseB1FAfterPrizeText
	waitbutton
	sjump .Done

.Lost:
	applymovement PLAYER, Movement_ExitTrainerHouseBattleRoom
	turnobject PLAYER, UP
	opentext
	writetext TrainerHouseB1FLostText
	waitbutton
.Done:
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

.PackFull:
	writetext TrainerHouseB1FPackFullText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

.NotEnough:
	writetext TrainerHouseB1FNotEnoughText
	waitbutton
.Declined:
	writetext TrainerHouseB1FPleaseComeAgainText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

TrainerHouseB1FOpponentScript:
	jumptextfaceplayer TrainerHouseB1FOpponentWaitingText

TrainerHouseB1FOpponentWaitingText:
	text "I'm waiting for a"
	line "challenger!"

	para "Talk to the"
	line "receptionist if"
	cont "you want to"
	cont "battle."
	done

Movement_EnterTrainerHouseBattleRoom:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	turn_head RIGHT
	step_end

Movement_ExitTrainerHouseBattleRoom:
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Movement_TrainerHouseTurnBack:
	step RIGHT
	turn_head LEFT
	step_end

TrainerHouseB1FIntroText:
	text "Welcome to the"
	line "Training Hall!"

	para "This is where new"
	line "trainers learn how"
	cont "a challenge works."

	para "You enter 4 #-"
	line "mon and face 3"
	cont "trainers in a row,"
	cont "all in double"
	cont "battles."

	para "Every #mon on"
	line "both sides fights"
	cont "at the same level."

	para "Would you like to"
	line "take the"
	cont "challenge?"
	done

TrainerHouseB1FWelcomeBackText:
	text "Welcome back! You"
	line "can practice here"
	cont "any time you like."

	para "Would you like to"
	line "take the"
	cont "challenge?"
	done

TrainerHouseB1FChooseText:
	text "Choose your 4"
	line "#mon, in the"
	cont "order they'll go."

	para "The first two lead"
	line "off the battle."
	done

TrainerHouseB1FGoRightInText:
	text "No items from your"
	line "Pack in battle,"
	cont "and no Exp."

	para "Your #mon are"
	line "healed after each"
	cont "win."

	para "Win or lose, your"
	line "team goes back to"
	cont "how it was."

	para "Please go right"
	line "through!"
	done

TrainerHouseB1FNextText:
	text "Your #mon are"
	line "healed. Here comes"
	cont "the next trainer!"
	done

TrainerHouseB1FOpponentBeatenText:
	text "You got me!"
	done

TrainerHouseB1FOpponentWonText:
	text "I win this time!"
	done

TrainerHouseB1FWonText:
	text "Congratulations!"
	line "You beat all three"
	cont "trainers!"
	done

TrainerHouseB1FPrizeText:
	text "Here are prizes"
	line "for your first"
	cont "win."
	done

TrainerHouseB1FAfterPrizeText:
	text "Rare Candy raises"
	line "a #mon's level."

	para "Ability Capsules"
	line "and Patches change"
	cont "a #mon's"
	cont "ability."

	para "Now you know how a"
	line "challenge works."

	para "There are more of"
	line "them across Kanto!"
	done

TrainerHouseB1FLostText:
	text "Too bad! Your team"
	line "is back as it was."

	para "Come try again any"
	line "time."
	done

TrainerHouseB1FPackFullText:
	text "Your Pack is too"
	line "full for the"
	cont "prize."

	para "Please make some"
	line "room, then come"
	cont "back!"
	done

TrainerHouseB1FNotEnoughText:
	text "You'll need at"
	line "least 4 #mon"
	cont "that aren't Eggs."
	done

TrainerHouseB1FPleaseComeAgainText:
	text "Sorry. Only those"
	line "trainers who will"

	para "be battling are"
	line "allowed to go in."
	done

TrainerHouseB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  4, TRAINER_HOUSE_1F, 3

	def_coord_events
	coord_event  7,  3, SCENE_TRAINERHOUSEB1F_ASK_BATTLE, TrainerHouseReceptionistScript

	def_bg_events

	def_object_events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 11, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouseB1FOpponentScript, -1
