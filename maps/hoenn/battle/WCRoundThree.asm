	object_const_def

WCRoundThree_MapScripts:
	def_scene_scripts

	def_callbacks

WCRoundThreeDoorLocksBehindYouScript:
	applymovement PLAYER, WCRoundThree_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 14, $14 ; wall
	refreshmap
	closetext
	waitsfx
	end

WCRoundThree_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end


WCSilverScript:
	faceplayer
	opentext
	checkevent EVENT_WORLD_CUP_BEAT_ROUND_THREE
	iftrue SilverScript_AfterBattle
	writetext SilverScript_BeforeText
	waitbutton
	closetext

	winlosstext SilverScript_BeatenText, 0
	loadtrainer RIVAL2, RIVAL2_WC

	startbattle
	reloadmapafterbattle
	setevent EVENT_WORLD_CUP_BEAT_ROUND_THREE
	opentext
	writetext SilverScript_DefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 6, 2, $4f ; open door
	refreshmap
	closetext
	waitsfx
	special HealParty
	end

SilverScript_AfterBattle:
	writetext SilverScript_DefeatText
	waitbutton
	closetext
	end

SilverScript_BeforeText:
	text "Hey, <PLAY_G>."

	para "I took some time"
	line "after our last"
	cont "battle..."

	para "Sorted some stuff"
	line "out along the"
	cont "way..."

	para "Finally beat that"
	line "Dragon trainer"
	cont "even."

	para "I feel like I've"
	line "got my head on"
	cont "straight finally."

	para "Which brings me"
	line "back to you..."

	para "You've beaten me"
	line "enough times"
	cont "already."

	para "Now...It's my"
	line "turn!"
	done

SilverScript_BeatenText:
	text "Well then..."
	done

SilverScript_DefeatText:
	text "Huh, I guess"
	line "that's that then."

	para "I can't say I'm"
	line "happy for you, but"
	cont "you earned this."

	para "Good luck in"
	line "the final."
	done


WCRoundThree_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   06, 17, WC_ROUND_TWO, 3
	warp_event   07, 17, WC_ROUND_TWO, 4
	warp_event   06, 02, WC_ROUND_FOUR, 1
	warp_event   07, 02, WC_ROUND_FOUR, 2

	def_coord_events
	coord_event  06,  16, -1, WCRoundThreeDoorLocksBehindYouScript
	coord_event  07,  16, -1, WCRoundThreeDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  7,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WCSilverScript, -1
