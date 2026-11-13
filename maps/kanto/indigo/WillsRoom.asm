	object_const_def
	const WILLSROOM_GREEN

WillsRoom_MapScripts:
	def_scene_scripts
	scene_script WillsRoomLockDoorScene, SCENE_WILLSROOM_LOCK_DOOR
	scene_script WillsRoomNoopScene,     SCENE_WILLSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, WillsRoomDoorsCallback

WillsRoomLockDoorScene:
	sdefer WillsRoomDoorLocksBehindYouScript
	end

WillsRoomNoopScene:
	end

WillsRoomDoorsCallback:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

WillsRoomDoorLocksBehindYouScript:
	applymovement PLAYER, WillsRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_WILLSROOM_NOOP
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	setevent EVENT_PASSPORT_UNLOCKED
	waitsfx
	end

IndigoGreen_Battle:
	faceplayer
	opendialog GREEN
	checkevent EVENT_BEAT_ELITE_4_GREEN
	iftrue IndigoGreen_AfterBattle
	checkevent EVENT_START_KANTO
	iftrue .Familiar
	writetext IndigoGreen_GreenStrangerText
	sjump .Intro
.Familiar:
	writetext IndigoGreen_GreenBeforeText
.Intro:
	waitbutton
	closedialog

	checkevent EVENT_BEAT_INDIGO_LEAGUE
	iftrue .Hard
	sjump .Easy

.Hard
	winlosstext IndigoGreen_GreenBeatenText, 0
	loadtrainer GREEN, GREEN6
	sjump .Fight

.Easy
	winlosstext IndigoGreen_GreenBeatenText, 0
	loadtrainer GREEN, GREEN5
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_GREEN
	opendialog GREEN
	writetext IndigoGreen_GreenDefeatText
	waitbutton
	closedialog
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	waitsfx
	special HealParty
	end

IndigoGreen_AfterBattle:
	writetext IndigoGreen_GreenDefeatText
	waitbutton
	closedialog
	end

WillsRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

IndigoGreen_GreenBeforeText:
	text "Hey, <PLAYER>!"
	para "Remember me? The"
	line "teams you beat"
	cont "before were just"
	cont "trainees of mine."
	para "I'm the newest"
	line "member of the"
	cont "Elite Four now."
	para "This is my real"
	line "team. No holding"
	cont "back this time!"
	done

IndigoGreen_GreenStrangerText:
	text "So you're the new"
	line "challenger."
	para "I'm Green, the"
	line "newest member of"
	cont "the Elite Four."
	para "Newest doesn't"
	line "mean weakest."
	cont "Let's go!"
	done

IndigoGreen_GreenBeatenText:
	text "Ugh! I can't"
	line "believe it…"
	done

IndigoGreen_GreenDefeatText:
	text "Fine, you win"
	line "this one."
	para "But the others"
	line "are way tougher"
	cont "than me."
	para "Go on. Lorelei is"
	line "waiting."
	done

WillsRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 17, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_GREEN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IndigoGreen_Battle, -1
