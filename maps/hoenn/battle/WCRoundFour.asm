	object_const_def

WCRoundFour_MapScripts:
	def_scene_scripts

	def_callbacks

WCRoundFourDoorLocksBehindYouScript:
	applymovement PLAYER, WCRoundFour_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 08, $2e ; Dragon Door
	refreshmap
	closetext
	waitsfx
	end

WCRoundFour_EnterMovement:
	step UP
	step UP
	step_end


WCGiovanniScript:
	faceplayer
	opentext
	checkevent EVENT_WORLD_CUP_BEAT_ROUND_FOUR
	iftrue GiovanniScript_AfterBattle
	writetext GiovanniScript_BeforeText
	waitbutton
	closetext

	winlosstext GiovanniScript_BeatenText, 0
	loadtrainer GIOVANNI, WC_GIOVANNI

	startbattle
	reloadmapafterbattle
	setevent EVENT_WORLD_CUP_BEAT_ROUND_FOUR
	opentext
	writetext GiovanniScript_DefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 6, 0, $0b ; open gate
	refreshmap
	closetext
	waitsfx
	special HealParty
	end

GiovanniScript_AfterBattle:
	writetext GiovanniScript_DefeatText
	waitbutton
	closetext
	end

GiovanniScript_BeforeText:
	text "Giovanni: Well,"
	line "well, well..."

	para "It's nice to"
	line "finally put a face"
	cont "to the name"
	cont "<PLAY_G>!"
	
	para "Nice to finally"
	line "meet the trainer"
	
	para "responsible for"
	line "my poor Rockets'"
	cont "tales of woe."

	para "In a way, I'm"
	line "proud of you."

	para "Overcoming the"
	line "organization I"
	cont "spent so much"
	cont "of my life"
	cont "to build..."

	para "Well, that"
	line "doesn't matter"
	cont "today."

	para "Today, I've come"
	line "for the cup."

	para "Stand and fight,"
	line "or run and hide."

	para "It doesn't matter"
	line "to me at all."

	para "I mean to crush"
	line "anyone who gets"
	cont "in my way!"
	done

GiovanniScript_BeatenText:
	text "Ah..."

	para "I suppose I owe"
	line "my Rockets an"
	cont "apology."
	done

GiovanniScript_DefeatText:
	text "I really thought"
	line "I had it this"
	cont "year..."

	para "Well, I won't"
	line "be a sore loser"
	cont "about it."	

	para "The Cup is yours,"
	line "kid."
	done


WCRoundFour_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   06, 15, WC_ROUND_THREE, 3
	warp_event   07, 15, WC_ROUND_THREE, 4

	def_coord_events
	coord_event  06,  09, -1, WCRoundFourDoorLocksBehindYouScript
	coord_event  07,  09, -1, WCRoundFourDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WCGiovanniScript, -1
