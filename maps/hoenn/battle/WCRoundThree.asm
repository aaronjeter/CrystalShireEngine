	object_const_def
	const WCROUNDTHREE_SILVER
	const WCROUNDTHREE_WALLY
	const WCROUNDTHREE_GREEN

WCRoundThree_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WCRoundThreeOpponentCallback

WCRoundThreeOpponentCallback:
; the round three opponent is the rival from the player's starting region
	checkevent EVENT_START_HOENN
	iftrue .Wally
	checkevent EVENT_START_KANTO
	iftrue .Green
	appear WCROUNDTHREE_SILVER
	disappear WCROUNDTHREE_WALLY
	disappear WCROUNDTHREE_GREEN
	endcallback

.Wally:
	disappear WCROUNDTHREE_SILVER
	appear WCROUNDTHREE_WALLY
	disappear WCROUNDTHREE_GREEN
	endcallback

.Green:
	disappear WCROUNDTHREE_SILVER
	disappear WCROUNDTHREE_WALLY
	appear WCROUNDTHREE_GREEN
	endcallback

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
	opendialog RIVAL2
	checkevent EVENT_WORLD_CUP_BEAT_ROUND_THREE
	iftrue SilverScript_AfterBattle
	writetext SilverScript_BeforeText
	waitbutton
	closedialog

	winlosstext SilverScript_BeatenText, 0
	loadtrainer RIVAL2, RIVAL2_WC

	startbattle
	reloadmapafterbattle
	setevent EVENT_WORLD_CUP_BEAT_ROUND_THREE
	opendialog RIVAL2
	writetext SilverScript_DefeatText
	waitbutton
	closedialog
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
	closedialog
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


WCWallyScript:
	faceplayer
	opendialog WALLY
	checkevent EVENT_WORLD_CUP_BEAT_ROUND_THREE
	iftrue WallyScript_AfterBattle
	writetext WallyScript_BeforeText
	waitbutton
	closedialog

	winlosstext WallyScript_BeatenText, 0
	loadtrainer WALLY, WC_WALLY

	startbattle
	reloadmapafterbattle
	setevent EVENT_WORLD_CUP_BEAT_ROUND_THREE
	opendialog WALLY
	writetext WallyScript_DefeatText
	waitbutton
	closedialog
	playsound SFX_ENTER_DOOR
	changeblock 6, 2, $4f ; open door
	refreshmap
	closetext
	waitsfx
	special HealParty
	end

WallyScript_AfterBattle:
	writetext WallyScript_DefeatText
	waitbutton
	closedialog
	end

WallyScript_BeforeText:
	text "<PLAY_G>!"
	line "I knew you'd make"
	cont "it this far!"

	para "I've been training"
	line "every day since"
	cont "the League."

	para "Win or lose, I"
	line "want to show you"
	cont "how far I've come!"
	done

WallyScript_BeatenText:
	text "Still amazing,"
	line "<PLAY_G>!"
	done

WallyScript_DefeatText:
	text "I gave it my all,"
	line "and I still came"
	cont "up short."

	para "But I'm not sad!"
	line "Battling you"
	cont "always makes me"
	cont "stronger."

	para "Go win the whole"
	line "thing, <PLAY_G>!"
	done


WCGreenScript:
	faceplayer
	opendialog GREEN
	checkevent EVENT_WORLD_CUP_BEAT_ROUND_THREE
	iftrue GreenScript_AfterBattle
	writetext GreenScript_BeforeText
	waitbutton
	closedialog

	winlosstext GreenScript_BeatenText, 0
	loadtrainer GREEN, WC_GREEN

	startbattle
	reloadmapafterbattle
	setevent EVENT_WORLD_CUP_BEAT_ROUND_THREE
	opendialog GREEN
	writetext GreenScript_DefeatText
	waitbutton
	closedialog
	playsound SFX_ENTER_DOOR
	changeblock 6, 2, $4f ; open door
	refreshmap
	closetext
	waitsfx
	special HealParty
	end

GreenScript_AfterBattle:
	writetext GreenScript_DefeatText
	waitbutton
	closedialog
	end

GreenScript_BeforeText:
	text "Well, well. Oak's"
	line "charity case made"
	cont "it to round three."

	para "Don't get cocky."
	line "I've been waiting"
	cont "for this rematch."

	para "No holding back"
	line "this time!"
	done

GreenScript_BeatenText:
	text "Tch... not bad,"
	line "scrub."
	done

GreenScript_DefeatText:
	text "Alright, alright."
	line "You win this one."

	para "Don't let it go"
	line "to your head."

	para "Now get out there"
	line "and take the"
	cont "whole thing!"
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
	object_event  7,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WCSilverScript, EVENT_WC_ROUND_THREE_SILVER
	object_event  7,  7, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WCWallyScript, EVENT_WC_ROUND_THREE_WALLY
	object_event  7,  7, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WCGreenScript, EVENT_WC_ROUND_THREE_GREEN
