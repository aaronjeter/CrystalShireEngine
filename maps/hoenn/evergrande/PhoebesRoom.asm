	object_const_def

PhoebesRoom_MapScripts:
	def_scene_scripts

	def_callbacks


PhoebeRoomDoorLocksBehindYouScript:
	applymovement PLAYER, PhoebesRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 14, $14 ; wall
	refreshmap
	closetext
	waitsfx
	end

PhoebesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end


PhoebeScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_PHOEBE
	iftrue PhoebeScript_AfterBattle
	writetext PhoebeScript_PhoebeBeforeText
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 15, .Hard
	sjump .Easy

.Hard
	winlosstext PhoebeScript_PhoebeBeatenText, 0
	loadtrainer PHOEBE, PHOEBE2
	sjump .Fight

.Easy
	winlosstext PhoebeScript_PhoebeBeatenText, 0
	loadtrainer PHOEBE, PHOEBE1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_PHOEBE
	opentext
	writetext PhoebeScript_PhoebeDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 6, 2, $4f ; open door
	refreshmap
	closetext
	waitsfx
	special HealParty
	end

PhoebeScript_AfterBattle:
	writetext PhoebeScript_PhoebeDefeatText
	waitbutton
	closetext
	end

PhoebeScript_PhoebeBeforeText:
	text "Ahahaha!"

	para "I'm PHOEBE of the"
	line "ELITE FOUR."

	para "I did my training"
	line "on MT. PYRE."

	para "While I trained,"
	line "I gained the"

	para "ability to commune"
	line "with GHOST-type"
	cont "#MON."

	para "Yes, the bond I"
	line "developed with"
	cont "#MON"

	para "is extremely"
	line "tight."

	para "So, come on, just"
	line "try and see if"
	
	para "you can even"
	line "inflict damage"
	cont "on my #MON!"
	done

PhoebeScript_PhoebeBeatenText:
	text "Oh, darn."
	line "I've gone and"
	cont "lost."
	done

PhoebeScript_PhoebeDefeatText:
	text "There's a definite"
	line "bond between you"

	para "and your #MON,"
	line "too."

	para "I didn't recognize"
	line "it, so it's only"

	para "natural that I"
	line "lost."

	para "Yup, I'd like to"
	line "see how far your"
	
	para "bond will carry"
	line "you."

	para "Go ahead, move on"
	line "to the next room."
	done

PhoebesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  17, SIDNEYS_ROOM, 2
	warp_event  7,  17, SIDNEYS_ROOM, 3
	warp_event  6,  02, GLACIAS_ROOM, 1
	warp_event  7,  02, GLACIAS_ROOM, 2

	def_coord_events
	coord_event  06,  16, -1, PhoebeRoomDoorLocksBehindYouScript
	coord_event  07,  16, -1, PhoebeRoomDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  7,  7, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PhoebeScript_Battle, -1
