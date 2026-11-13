	object_const_def
	const HALLOFFAME_AGATHA

HallOfFame_MapScripts:
	def_scene_scripts
	scene_script HallOfFameEnterScene, SCENE_HALLOFFAME_ENTER
	scene_script HallOfFameNoopScene,  SCENE_HALLOFFAME_NOOP

	def_callbacks

HallOfFameEnterScene:
	sdefer HallOfFameEnterScript
	end

HallOfFameNoopScene:
	end

HallOfFameEnterScript:
	setevent EVENT_BEAT_INDIGO_LEAGUE
	scall HallOfFameLevelcap
	follow HALLOFFAME_AGATHA, PLAYER
	applymovement HALLOFFAME_AGATHA, HallOfFame_WalkUpWithAgatha
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext HallOfFame_AgathaText
	waitbutton
	closetext
	turnobject HALLOFFAME_AGATHA, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	setscene SCENE_HALLOFFAME_NOOP
	pause 15
	setval HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	loadmem wEliteFourXpBoost, 1
	setevent EVENT_TELEPORT_GUY
	special HealParty
	halloffame LEAGUE_KANTO
	end

HallOfFameLevelcap:
	;clear kanto/johto legendary mons events
	clearevent EVENT_GOT_ARTICUNO
	clearevent EVENT_GOT_ZAPDOS
	clearevent EVENT_GOT_MOLTRES
	clearevent EVENT_GOT_MEWTWO
	clearevent EVENT_GOT_MEW
	clearevent EVENT_GOT_CELEBI_EGG

	jumpstd UpdateWorldLevelsScript
	end

HallOfFame_WalkUpWithAgatha:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_AgathaText:
	text "Agatha: This is"
	line "the Hall of Fame."
	para "Champions and"
	line "their #mon are"
	cont "honored here for"
	cont "all time."
	para "I've seen a great"
	line "many trainers come"
	cont "through that door."
	para "Few of them fought"
	line "like you did."
	para "<PLAY_G>, step up."
	line "Let's register you"
	cont "and your partners"
	cont "as Champions!"
	done

HallOfFame_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 12, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
