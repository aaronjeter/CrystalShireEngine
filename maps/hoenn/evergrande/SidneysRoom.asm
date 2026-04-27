	object_const_def

SidneysRoom_MapScripts:
	def_scene_scripts

	def_callbacks


SidneyRoomDoorLocksBehindYouScript:
	; Reset Elite 4
	clearevent EVENT_BEAT_ELITE_4_SIDNEY
	clearevent EVENT_BEAT_ELITE_4_PHOEBE
	clearevent EVENT_BEAT_ELITE_4_GLACIA
	clearevent EVENT_BEAT_ELITE_4_DRAKE
	applymovement PLAYER, SidneysRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 14, $14 ; wall
	refreshmap
	closetext
	waitsfx
	end

SidneysRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end


SidneyScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_SIDNEY
	iftrue SidneyScript_AfterBattle
	writetext SidneyScript_SidneyBeforeText
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 15, .Hard
	sjump .Easy

.Hard
	winlosstext SidneyScript_SidneyBeatenText, 0
	loadtrainer ELITESIDNEY, SIDNEY2
	sjump .Fight

.Easy
	winlosstext SidneyScript_SidneyBeatenText, 0
	loadtrainer ELITESIDNEY, SIDNEY1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_SIDNEY
	opentext
	writetext SidneyScript_SidneyDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 6, 2, $4f ; open door
	changeblock 6, 14, $14 ; wall
	refreshmap
	closetext
	waitsfx
	special HealParty
	end

SidneyScript_AfterBattle:
	writetext SidneyScript_SidneyDefeatText
	waitbutton
	closetext
	end


SidneyScript_SidneyBeforeText:
	text "Welcome,"
	line "<PLAYER>!"

	para "I'm Sidney of"
	line "the Elite Four."

	para "I like that look"
	line "you're giving me."

	para "I guess you'll"
	line "give me a good"
	cont "match."

	para "That's good!"
	line "Looking real good!"

	para "All right! You and"
	line "me, let's enjoy"

	para "a battle that can"
	line "only be staged"

	para "here in the"
	line "#MON League!"
	done

SidneyScript_SidneyBeatenText:
	text "Well, how do you"
	line "like that? I lost!"

	para "Eh, it was fun, so"
	line "it doesn't matter."
	done

SidneyScript_SidneyDefeatText:
	text "Well, listen to"
	line "what this loser"
	cont "has to say."

	para "You've got what it"
	line "takes to go far."

	para "Now, go on to the"
	line "next room and"

	para "enjoy your next"
	line "battle!"
	done

SidneysRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 07, 17, HOENN_POKELEAGUE, 3
	warp_event 06, 02, PHOEBES_ROOM, 1
	warp_event 07, 02, PHOEBES_ROOM, 2

	def_coord_events
	coord_event  06,  16, -1, SidneyRoomDoorLocksBehindYouScript
	coord_event  07,  16, -1, SidneyRoomDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  7,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SidneyScript_Battle, -1
