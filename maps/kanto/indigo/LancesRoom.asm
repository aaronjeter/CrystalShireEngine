	object_const_def
	const LANCESROOM_AGATHA
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoom_MapScripts:
	def_scene_scripts
	scene_script LancesRoomLockDoorScene, SCENE_LANCESROOM_LOCK_DOOR
	scene_script LancesRoomNoopScene,     SCENE_LANCESROOM_APPROACH_LANCE

	def_callbacks
	callback MAPCALLBACK_TILES, LancesRoomDoorsCallback

LancesRoomLockDoorScene:
	sdefer LancesRoomDoorLocksBehindYouScript
	end

LancesRoomNoopScene:
	end

LancesRoomDoorsCallback:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	endcallback

LancesRoomDoorLocksBehindYouScript:
	applymovement PLAYER, LancesRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	refreshmap
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachAgathaFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachAgathaFromLeft
	sjump LancesRoomAgathaScript

Script_ApproachAgathaFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachAgathaFromRight
LancesRoomAgathaScript:
	turnobject LANCESROOM_AGATHA, LEFT
	opendialog AGATHA
	writetext AgathaBattleIntroText
	waitbutton
	closedialog

	checkevent EVENT_BEAT_INDIGO_LEAGUE
	iftrue .Rematch
	winlosstext AgathaWarmupText, 0
	setlasttalked LANCESROOM_AGATHA
	loadtrainer AGATHA, AGATHA1
	sjump .Fight

.Fight	
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle

	opendialog AGATHA	
	writetext AgathaTruePowerText
	waitbutton
	closedialog

	winlosstext AgathaBattleWinText, 0
	setlasttalked LANCESROOM_AGATHA
	loadtrainer AGATHA, AGATHA3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle

	setevent EVENT_BEAT_CHAMPION_AGATHA
	sjump .Won

.Rematch:
	winlosstext AgathaBattleWinText, 0
	setlasttalked LANCESROOM_AGATHA
	loadtrainer AGATHA, AGATHA2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_AGATHA
	setevent EVENT_BEAT_INDIGO_LEAGUE_REMATCH
	setval LEAGUE_KANTO
	special AddLeagueRematchWin
.Won:
	opendialog AGATHA
	writetext AgathaBattleAfterText
	waitbutton
	closedialog
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	refreshmap
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_AGATHA, 15
	turnobject LANCESROOM_AGATHA, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRushesIn
	opentext
	writetext LancesRoomMaryOhNoOakText
	waitbutton
	closetext
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryYieldsToOak
	stopfollow
	turnobject LANCESROOM_OAK, UP
	turnobject LANCESROOM_AGATHA, LEFT
	opentext
	writetext LancesRoomOakCongratulationsText
	waitbutton
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryInterviewChampion
	turnobject PLAYER, LEFT
	opentext
	writetext LancesRoomMaryInterviewText
	waitbutton
	closetext
	applymovement LANCESROOM_AGATHA, LancesRoomMovementData_AgathaPositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext LancesRoomNoisyText
	waitbutton
	closetext
	follow LANCESROOM_AGATHA, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applymovement LANCESROOM_AGATHA, LancesRoomMovementData_AgathaLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_AGATHA
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryTriesToFollow
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext LancesRoomMaryNoInterviewText
	pause 30
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRunsBackAndForth
	special FadeOutToWhite
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachAgathaFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachAgathaFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryRushesIn:
	big_step UP
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_AgathaPositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_AgathaLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_MaryTriesToFollow:
	step UP
	step RIGHT
	turn_head UP
	step_end

LancesRoomMovementData_MaryRunsBackAndForth:
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

AgathaBattleIntroText:
	text "I am Agatha,"
	line "Champion of the"
	cont "Kanto League."
	para "Oak's taken quite"
	line "an interest in"
	cont "you, child."
	para "That old duff was"
	line "once tough and"
	cont "handsome."
	para "Now he just wants"
	line "to fiddle with"
	cont "his #dex!"
	para "He's wrong."
	line "#mon are for"
	cont "battling!"
	para "<PLAY_G>! I'll"
	line "show you how a"
	cont "real trainer"
	cont "fights!"
	done

AgathaWarmupText:
	text "Oh ho! You're"
	line "something special,"
	cont "child!"
	done

AgathaTruePowerText:
	text "But I'm not done"
	line "yet."
	para "Meet my oldest"
	line "partner in its"
	cont "true form!"
	done

AgathaBattleWinText:
	text "Hmph… So that's"
	line "why Oak dotes on"
	cont "you."
	done

AgathaBattleAfterText:
	text "You win, child."
	para "You and your"
	line "#mon fought"
	cont "as one."
	para "From today, you"
	line "are the Champion"
	cont "of the Kanto"
	cont "League!"
	done

LancesRoomMaryOhNoOakText:
	text "Mary: Oh, no!"
	line "It's all over!"

	para "Prof.Oak, if you"
	line "weren't so slow…"
	done

LancesRoomOakCongratulationsText:
	text "Prof.Oak: Ah,"
	line "<PLAY_G>!"

	para "It's been a long"
	line "while."

	para "You certainly look"
	line "more impressive."

	para "Your conquest of"
	line "the League is just"
	cont "fantastic!"

	para "Your dedication,"
	line "trust and love for"

	para "your #mon made"
	line "this happen."

	para "Your #mon were"
	line "outstanding too."

	para "Because they be-"
	line "lieved in you as a"

	para "trainer, they per-"
	line "severed."

	para "Congratulations,"
	line "<PLAY_G>!"
	done

LancesRoomMaryInterviewText:
	text "Mary: Let's inter-"
	line "view the brand new"
	cont "Champion!"
	done

LancesRoomNoisyText:
	text "Agatha: Too much"
	line "fuss for my old"
	cont "ears…"
	para "<PLAY_G>, come"
	line "along with me."
	done

LancesRoomMaryNoInterviewText:
	text "Mary: Oh, wait!"
	line "We haven't done"
	cont "the interview!"
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 23, KARENS_ROOM, 3
	warp_event  5, 23, KARENS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachAgathaFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachAgathaFromRight

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LancesRoomAgathaScript, -1
	object_event  4,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  4,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
