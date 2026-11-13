	object_const_def
	const SILVERLEAGUELANCESROOM_LANCE

SilverLeagueLancesRoom_MapScripts:
	def_scene_scripts

	def_callbacks

SilverLeagueLancesRoomDoorLocksBehindYouScript:
	applymovement PLAYER, SilverLeagueLancesRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	refreshmap
	closetext
	waitsfx
	end

SilverLeagueLancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SilverLeagueLancesRoomLanceScript:
	faceplayer
	special FadeOutMusic
	opendialog CHAMPION
	writetext SilverLeagueLancesRoomIntroText
	waitbutton
	closedialog
	checkevent EVENT_BEAT_JOHTO_LEAGUE
	iftrue .Rematch
	winlosstext SilverLeagueLancesRoomWarmupText, 0
	loadtrainer CHAMPION, LANCE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opendialog CHAMPION
	writetext SilverLeagueLancesRoomTruePowerText
	waitbutton
	closedialog
	winlosstext SilverLeagueLancesRoomWinText, 0
	loadtrainer CHAMPION, LANCE3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .Won

.Rematch:
	winlosstext SilverLeagueLancesRoomWinText, 0
	loadtrainer CHAMPION, LANCE2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_JOHTO_LEAGUE_REMATCH
	setval LEAGUE_JOHTO
	special AddLeagueRematchWin
.Won:
	opendialog CHAMPION
	writetext SilverLeagueLancesRoomAfterText
	waitbutton
	closedialog
	special HealParty
	loadmem wEliteFourXpBoost, 1
	setevent EVENT_BEAT_JOHTO_LEAGUE
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_RIVAL_SPROUT_TOWER
	clearevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setmapscene SPROUT_TOWER_3F, SCENE_SPROUTTOWER3F_NOOP
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
.SkipPhoneCall:
	callstd UpdateWorldLevelsScript
	halloffame LEAGUE_JOHTO
	end

SilverLeagueLancesRoomIntroText:
	text "Lance: I've been"
	line "waiting for you."

	para "<PLAY_G>!"

	para "I knew that you,"
	line "with your skills,"

	para "would eventually"
	line "reach me here."

	para "There's no need"
	line "for words now."

	para "We will battle to"
	line "determine who is"

	para "the stronger of"
	line "the two of us."

	para "As the most power-"
	line "ful trainer and as"

	para "the #mon League"
	line "Champion…"

	para "I, Lance the drag-"
	line "on master, accept"
	cont "your challenge!"
	done

SilverLeagueLancesRoomWarmupText:
	text "That wasn't a"
	line "bad warmup,"
	cont "<PLAY_G>!"
	done

SilverLeagueLancesRoomTruePowerText:
	text "Now, <PLAY_G>!"
	
	para "I shall show you"
	line "true power!"
	done

SilverLeagueLancesRoomWinText:
	text "…It's over."

	para "But it's an odd"
	line "feeling."

	para "I'm not angry that"
	line "I lost. In fact, I"
	cont "feel happy."

	para "Happy that I"
	line "witnessed the rise"

	para "of a great new"
	line "Champion!"
	done

SilverLeagueLancesRoomAfterText:
	text "…Whew."

	para "You have become"
	line "truly powerful,"
	cont "<PLAY_G>."

	para "Your #mon have"
	line "responded to your"

	para "strong and up-"
	line "standing nature."

	para "As a trainer, you"
	line "will continue to"

	para "grow strong with"
	line "your #mon."
	done

SilverLeagueLancesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 23, SILVER_LEAGUE_KARENS_ROOM, 3
	warp_event  5, 23, SILVER_LEAGUE_KARENS_ROOM, 4

	def_coord_events
	coord_event  4, 22, -1, SilverLeagueLancesRoomDoorLocksBehindYouScript
	coord_event  5, 22, -1, SilverLeagueLancesRoomDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverLeagueLancesRoomLanceScript, -1
