	object_const_def

WCRoundOne_MapScripts:
	def_scene_scripts

	def_callbacks

WCRoundOneDoorLocksBehindYouScript:
	applymovement PLAYER, WCRoundOne_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 14, $14 ; wall
	refreshmap
	closetext
	waitsfx
	end

WCRoundOne_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end


LoreleiScript:
	faceplayer
	opentext
	checkevent EVENT_WORLD_CUP_BEAT_ROUND_ONE
	iftrue LoreleiScript_AfterBattle
	writetext LoreleiScript_LoreleiBeforeText
	waitbutton
	closetext

	winlosstext LoreleiScript_LoreleiBeatenText, 0
	loadtrainer LORELEI, LORELEI1

	startbattle
	reloadmapafterbattle
	setevent EVENT_WORLD_CUP_BEAT_ROUND_ONE
	opentext
	writetext LoreleiScript_LoreleiDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 6, 2, $4f ; open door
	refreshmap
	closetext
	waitsfx
	special HealParty
	end

LoreleiScript_AfterBattle:
	writetext LoreleiScript_LoreleiDefeatText
	waitbutton
	closetext
	end

LoreleiScript_LoreleiBeforeText:
	text "Well then, I"
	line "ought introduce"
	cont "myself."

	para "My name is"
	line "Lorelei."

	para "Once, I served as"
	line "a member of the"
	cont "Elite Four in"
	cont "Kanto."

	para "But those duels"
	line "never sat well"
	cont "with me."

	para "The Elite Four,"
	line "you see, is meant"
	cont "to be fair."

	para "Defeatable, even."
	line "By exceptional"
	cont "trainers, no"
	cont "doubt."

	para "Losing does not"
	line "sit well with"
	cont "me, <PLAY_G>."

	para "So..."
	line "Show me..."

	para "Show how one"
	line "so young comes"
	cont "to stand here"
	cont "today."

	para "Hold nothing back."

	para "No regrets,"
	line "<PLAY_G>."	
	done

LoreleiScript_LoreleiBeatenText:
	text "Oh, my... "

	para "Exceptional, truly"
	line "exceptional."
	done

LoreleiScript_LoreleiDefeatText:
	text "I regret nothing."

	para "You have proven"
	line "yourself against"
	cont "my every effort."

	para "Go on to"
	line "victory!"
	done


WCRoundOne_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   06, 17, WC_CHALLENGER_LOBBY, 3
	warp_event   07, 17, WC_CHALLENGER_LOBBY, 4
	warp_event   06, 02, WC_ROUND_TWO, 1
	warp_event   07, 02, WC_ROUND_TWO, 2

	def_coord_events
	coord_event  06,  16, -1, WCRoundOneDoorLocksBehindYouScript
	coord_event  07,  16, -1, WCRoundOneDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  7,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoreleiScript, -1
