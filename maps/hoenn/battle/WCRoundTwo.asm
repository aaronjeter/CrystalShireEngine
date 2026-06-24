	object_const_def

WCRoundTwo_MapScripts:
	def_scene_scripts

	def_callbacks

WCRoundTwoDoorLocksBehindYouScript:
	applymovement PLAYER, WCRoundTwo_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 14, $14 ; wall
	refreshmap
	closetext
	waitsfx
	end

WCRoundTwo_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end


WCFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_WORLD_CUP_BEAT_ROUND_TWO
	iftrue FalknerScript_AfterBattle
	writetext FalknerScript_BeforeText
	waitbutton
	closetext

	winlosstext FalknerScript_BeatenText, 0
	loadtrainer FALKNER, WCFALKNER

	startbattle
	reloadmapafterbattle
	setevent EVENT_WORLD_CUP_BEAT_ROUND_TWO
	opentext
	writetext FalknerScript_DefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 6, 2, $4f ; open door
	refreshmap
	closetext
	waitsfx
	special HealParty
	end

FalknerScript_AfterBattle:
	writetext FalknerScript_DefeatText
	waitbutton
	closetext
	end

FalknerScript_BeforeText:
	text "Yo, <PLAY_G>!"
	line "It's been a ways"
	cont "since Violet City!"

	para "I don't suppose"
	line "you thought you'd"

	para "see me again,"
	line "huh?"

	para "I haven't always"
	line "been Falker of"
	cont "the little"
	cont "leages though."

	para "Before I settled"
	line "down as a Gym"
	cont "Leader..."

	para "I traveled far"
	line "and wide; learning"	

	para "training, and"
	line "collecting my"
	cont "beloved birds!"

	para "You won't hold"
	line "the Cup unless"
	cont "you can take me!"

	para "Now! Prepare for"
	line "an all out"
	cont "aerial assault!"
	done

FalknerScript_BeatenText:
	text "Woah!"
	done

FalknerScript_DefeatText:
	text "That was crazy!"

	para "You've really"
	line "become something"
	cont "special!"

	para "Good luck next"
	line "round!"
	done


WCRoundTwo_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   06, 17, WC_ROUND_ONE, 3
	warp_event   07, 17, WC_ROUND_ONE, 4
	warp_event   06, 02, WC_ROUND_THREE, 1
	warp_event   07, 02, WC_ROUND_THREE, 2

	def_coord_events
	coord_event  06,  16, -1, WCRoundTwoDoorLocksBehindYouScript
	coord_event  07,  16, -1, WCRoundTwoDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  7,  7, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WCFalknerScript, -1
