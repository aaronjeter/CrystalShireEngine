	object_const_def
	const KOGASROOM_LORELEI

KogasRoom_MapScripts:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_script KogasRoomNoopScene,     SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorsCallback

KogasRoomLockDoorScene:
	sdefer KogasRoomDoorLocksBehindYouScript
	end

KogasRoomNoopScene:
	end

KogasRoomDoorsCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

KogasRoomDoorLocksBehindYouScript:
	applymovement PLAYER, KogasRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

IndigoLorelei_Battle:
	faceplayer
	opendialog LORELEI
	checkevent EVENT_BEAT_ELITE_4_LORELEI
	iftrue IndigoLorelei_AfterBattle
	writetext IndigoLorelei_LoreleiBeforeText
	waitbutton
	closedialog

	checkevent EVENT_BEAT_INDIGO_LEAGUE
	iftrue .Hard
	sjump .Easy

.Hard
	winlosstext IndigoLorelei_LoreleiBeatenText, 0
	loadtrainer LORELEI, LORELEI3
	sjump .Fight

.Easy
	winlosstext IndigoLorelei_LoreleiBeatenText, 0
	loadtrainer LORELEI, LORELEI2
	sjump .Fight

.Fight
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_LORELEI
	opendialog LORELEI
	writetext IndigoLorelei_LoreleiDefeatText
	waitbutton
	closedialog
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	special HealParty
	end

IndigoLorelei_AfterBattle:
	writetext IndigoLorelei_LoreleiDefeatText
	waitbutton
	closetext
	end

KogasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

IndigoLorelei_LoreleiBeforeText:
	text "Welcome to the"
	line "#mon League."
	para "I am Lorelei of"
	line "the Elite Four."
	para "No one can best"
	line "me when it comes"
	cont "to icy #mon."
	para "Your #mon will"
	line "be at my mercy"
	cont "when they are"
	cont "frozen solid!"
	para "Hahaha!"
	line "Are you ready?"
	done

IndigoLorelei_LoreleiBeatenText:
	text "You're better"
	line "than I thought!"
	done

IndigoLorelei_LoreleiDefeatText:
	text "Go ahead."
	para "You'll find out"
	line "how terrifying"
	cont "the Elite Four"
	cont "truly is."
	done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IndigoLorelei_Battle, -1
