	object_const_def

DrakesRoom_MapScripts:
	def_scene_scripts

	def_callbacks

DrakesRoomDoorLocksBehindYouScript:
	applymovement PLAYER, DrakesRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 14, $14 ; wall
	refreshmap
	closetext
	waitsfx
	end

DrakesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end


DrakeScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_DRAKE
	iftrue DrakeScript_AfterBattle
	writetext DrakeScript_DrakeBeforeText
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 15, .Hard
	sjump .Easy

.Hard
	winlosstext DrakeScript_DrakeBeatenText, 0
	loadtrainer DRAKE, DRAKE2
	sjump .Fight

.Easy
	winlosstext DrakeScript_DrakeBeatenText, 0
	loadtrainer DRAKE, DRAKE1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_DRAKE
	opentext
	writetext DrakeScript_DrakeDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 6, 2, $4f ; open door
	refreshmap
	closetext
	;setevent EVENT_DRAKE_ROOM_EXIT_OPEN
	waitsfx
	special HealParty
	end

DrakeScript_AfterBattle:
	writetext DrakeScript_DrakeDefeatText
	waitbutton
	closetext
	end

DrakeScript_DrakeBeforeText:
	text "I am the last of"
	line "the #mon league"

	para "Elite Four, Drake"
	line "the Dragon master!"

	para "In their natural"
	line "state, #mon"

	para "are wild living"
	line "things."

	para "They are free."

	para "At times, they"
	line "hinder us."

	para "At times, they"
	line "help us."

	para "For us to battle"
	line "with #mon as"

	para "partners, do you"
	line "know what it"
	cont "takes?"

	para "Do you know what"
	line "is needed?"

	para "If you don't, then"
	line "you will never"

	para "prevail over me!"
	done

DrakeScript_DrakeBeatenText:
	text "Superb, it should"
	line "be said."
	done

DrakeScript_DrakeDefeatText:
	text "You deserve every"
	line "credit for coming"

	para "this far as a"
	line "trainer of"
	cont "#mon."

	para "You do seem to"
	line "know what is"
	cont "needed."

	para "Yes, what a"
	line "trainer needs is a"
	cont "virtuous heart."

	para "#mon touch"
	line "the good hearts of"

	para "trainers and learn"
	line "good from wrong."

	para "They touch the"
	line "good hearts of"

	para "trainers and"
	line "grow strong."

	para "Go! Go onwards!"

	para "The Champion is"
	line "waiting!"
	done

DrakesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  17, GLACIAS_ROOM, 1
	warp_event  7,  17, GLACIAS_ROOM, 2
	warp_event  6,  02, STEVENS_ROOM, 1
	warp_event  7,  02, STEVENS_ROOM, 2

	def_coord_events
	coord_event  06,  16, -1, DrakesRoomDoorLocksBehindYouScript
	coord_event  07,  16, -1, DrakesRoomDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  7,  7, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, DrakeScript_Battle, -1
