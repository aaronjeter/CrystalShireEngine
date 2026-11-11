	object_const_def
	const RUSTBOROTRAINERSSCHOOL_TEACHER
	const RUSTBOROTRAINERSSCHOOL_OPPONENT
	const RUSTBOROTRAINERSSCHOOL_YOUNGSTER
	const RUSTBOROTRAINERSSCHOOL_LASS
	const RUSTBOROTRAINERSSCHOOL_GAMEBOY_KID

RustboroTrainersSchool_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RustboroTrainersSchoolOpponentCallback

RustboroTrainersSchoolOpponentCallback:
	variablesprite SPRITE_BATTLE_TOWER_OPPONENT, SPRITE_YOUNGSTER
	endcallback

RustboroTrainersSchoolTeacherScript:
; Hoenn's introductory challenge facility (FACILITY_INTRO_HOENN): doubles,
; any 4 Pokémon, 3 trainers in a row
	faceplayer
	opentext
	checkevent EVENT_FACILITY_INTRO_HOENN
	iftrue .AlreadyCleared
	writetext SchoolTeacherIntroText
	sjump .Ask

.AlreadyCleared:
	writetext SchoolTeacherWelcomeBackText
.Ask:
	yesorno
	iffalse .Declined
	checkevent EVENT_FACILITY_INTRO_HOENN
	iftrue .PrizeRoomOK
	facility_intro_prize_room
	iffalse .PackFull
.PrizeRoomOK:
	setval FACILITY_INTRO_HOENN
	special FacilitySetup
	ifless FACILITY_TEAM_SIZE, .NotEnough
	writetext SchoolTeacherChooseText
	waitbutton
	special FacilityChooseTeam
	iffalse .Declined
	writetext SchoolTeacherGoText
	waitbutton
	closetext
	applymovement PLAYER, SchoolEnterFloorMovement
	facility_battles RUSTBOROTRAINERSSCHOOL_OPPONENT, SchoolOpponentBeatenText, SchoolOpponentWonText, SchoolTeacherNextText, .Won, .Lost

.Won:
	applymovement PLAYER, SchoolLeaveFloorMovement
	opentext
	writetext SchoolTeacherWonText
	waitbutton
	checkevent EVENT_FACILITY_INTRO_HOENN
	iftrue .Done
	setevent EVENT_FACILITY_INTRO_HOENN
	writetext SchoolTeacherPrizeText
	promptbutton
	verbosegiveitem RARE_CANDY, 3
	verbosegiveitem ABILITY_CAPSULE, 2
	verbosegiveitem ABILITY_PATCH
	writetext SchoolTeacherAfterPrizeText
	waitbutton
	sjump .Done

.Lost:
	applymovement PLAYER, SchoolLeaveFloorMovement
	opentext
	writetext SchoolTeacherLostText
	waitbutton
.Done:
	closetext
	end

.PackFull:
	writetext SchoolTeacherPackFullText
	waitbutton
	closetext
	end

.NotEnough:
	writetext SchoolTeacherNotEnoughText
	waitbutton
.Declined:
	writetext SchoolTeacherDeclinedText
	waitbutton
	closetext
	end

RustboroTrainersSchoolYoungsterScript:
	jumptextfaceplayer RustboroTrainersSchoolYoungsterText

RustboroTrainersSchoolLassScript:
	jumptextfaceplayer RustboroTrainersSchoolLassText

RustboroTrainersSchoolGameboyKidScript:
	jumptextfaceplayer RustboroTrainersSchoolGameboyKidText

RustboroTrainersSchoolBlackboard:
	jumptext RustboroTrainersSchoolBlackboardText

RustboroTrainersSchoolBookshelf:
	jumpstd DifficultBookshelfScript

SchoolOpponentScript:
	jumptextfaceplayer SchoolOpponentWaitingText

SchoolOpponentWaitingText:
	text "I'm waiting for a"
	line "challenger!"

	para "Talk to the"
	line "teacher if you"
	cont "want to battle."
	done

SchoolEnterFloorMovement:
	step DOWN
	step RIGHT
	turn_head RIGHT
	step_end

SchoolLeaveFloorMovement:
	step LEFT
	step UP
	turn_head LEFT
	step_end

SchoolTeacherIntroText:
	text "Welcome to the"
	line "Trainers' School!"

	para "Our practice floor"
	line "teaches how a"
	cont "challenge works."

	para "Enter 4 #mon"
	line "and battle 3"
	cont "students in a row,"
	cont "all in double"
	cont "battles."

	para "Every #mon"
	line "fights at the same"
	cont "level."

	para "Will you try it?"
	done

SchoolTeacherWelcomeBackText:
	text "Back for more"
	line "practice? Will you"
	cont "try it again?"
	done

SchoolTeacherChooseText:
	text "Pick your 4"
	line "#mon in the"
	cont "order they should"
	cont "go."

	para "The first two lead"
	line "off together."
	done

SchoolTeacherGoText:
	text "No Pack items in"
	line "battle, and no"
	cont "Exp."

	para "I'll heal your"
	line "team after each"
	cont "win."

	para "Win or lose, they"
	line "go back to how"
	cont "they were."

	para "Step onto the"
	line "floor, please!"
	done

SchoolTeacherNextText:
	text "Healed and ready!"
	line "Next student, up!"
	done

SchoolOpponentBeatenText:
	text "Wow, you're good!"
	done

SchoolOpponentWonText:
	text "All that studying"
	line "paid off!"
	done

SchoolTeacherWonText:
	text "Excellent! You"
	line "beat all three!"
	done

SchoolTeacherPrizeText:
	text "Please take these"
	line "for your first"
	cont "win."
	done

SchoolTeacherAfterPrizeText:
	text "Rare Candy raises"
	line "a #mon's level."

	para "Ability Capsules"
	line "and Patches change"
	cont "a #mon's"
	cont "ability."

	para "Now you know how a"
	line "challenge works."

	para "There are more of"
	line "them across Hoenn!"
	done

SchoolTeacherLostText:
	text "Good effort! Your"
	line "team is back as it"
	cont "was. Try again any"
	cont "time."
	done

SchoolTeacherPackFullText:
	text "Your Pack is too"
	line "full for the"
	cont "prize."

	para "Please make some"
	line "room, then come"
	cont "back!"
	done

SchoolTeacherNotEnoughText:
	text "You'll need at"
	line "least 4 #mon"
	cont "that aren't Eggs."
	done

SchoolTeacherDeclinedText:
	text "Come back when"
	line "you're ready!"
	done

RustboroTrainersSchoolYoungsterText:
	text "In a double"
	line "battle, a move"
	cont "that hits both"
	cont "foes can turn"
	cont "things around!"
	done

RustboroTrainersSchoolLassText:
	text "Everyone fights at"
	line "the same level on"
	cont "the practice"
	cont "floor."

	para "So bring the team"
	line "that works best"
	cont "together!"
	done

RustboroTrainersSchoolGameboyKidText:
	text "You can't use your"
	line "Pack in there, but"

	para "held items still"
	line "work. I'm learning"
	cont "so much!"
	done

RustboroTrainersSchoolBlackboardText:
	text "The blackboard"
	line "says:"

	para "Challenges: pick"
	line "4, 3 battles in a"
	cont "row, same level"
	cont "for all."
	done

RustboroTrainersSchool_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, RUSTBORO_CITY, 8
	warp_event  4, 15, RUSTBORO_CITY, 9

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, RustboroTrainersSchoolBookshelf
	bg_event  1,  1, BGEVENT_READ, RustboroTrainersSchoolBookshelf
	bg_event  3,  0, BGEVENT_READ, RustboroTrainersSchoolBlackboard
	bg_event  4,  0, BGEVENT_READ, RustboroTrainersSchoolBlackboard

	def_object_events
	object_event  0, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RustboroTrainersSchoolTeacherScript, -1
	object_event  5, 13, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SchoolOpponentScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RustboroTrainersSchoolYoungsterScript, -1
	object_event  4,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RustboroTrainersSchoolLassScript, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RustboroTrainersSchoolGameboyKidScript, -1
