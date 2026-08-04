	object_const_def
	const DESERTSHRINE_UNOWN
	const DESERTSHRINE_JANE
	const DESERTSHRINE_ROCKET1
	const DESERTSHRINE_ROCKET2
	const DESERTSHRINE_ROCKET3

DesertShrine_MapScripts:
	def_scene_scripts

	def_callbacks	

DesertShrineUnown:
	opentext
	writetext DesertShrineUnownAttacksText
	pause 15
	cry UNOWNX
	closetext
	loadwildmon UNOWNX, 16
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCESHINY
	startbattle
	reloadmapafterbattle
	ifequal LOSE, .NotBeaten
	disappear DESERTSHRINE_UNOWN
	disappear DESERTSHRINE_JANE
	disappear DESERTSHRINE_ROCKET1
	disappear DESERTSHRINE_ROCKET2
	disappear DESERTSHRINE_ROCKET3
	setevent EVENT_BEAT_DESERT_SHRINE_UNOWN
	opentext
	writetext DesertShrineUnownDefeatText
	waitbutton
	verbosegiveitem HOENNITE_X
	waitbutton
.NotBeaten
	closetext
	end


DesertShrineUnownAttacksText:
	text "The great beast"
	line "roars!"

	para "You hear a voice"
	line "echo in you mind:"

	para "BE NO MORE!"

	para "The beast attacks!"
	done

DesertShrineUnownDefeatText:
	text "As the beast"
	line "is subdued,"

	para "you hear a"
	line "sound of"
	cont "sands shifting."

	para "Where it stood,"
	line "you see a small"
	cont "stone."

	para "You quickly"
	line "pick it up."
	done


DesertShrineJaneScript:
	checkevent EVENT_BEAT_DESERT_SHRINE_UNOWN
	iftrue .done

	checkevent EVENT_BEAT_SHRINE_JANE
	iftrue .afterBattle

	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, DESERTSHRINE_JANE, 10

	opentext 
	writetext DesertShrineJanePleaseHelpText
	waitbutton
	closetext

	winlosstext DesertShrineJaneWinLossText, 0
	loadtrainer EXECUTIVEF, DESERT_JANE
	startbattle
	reloadmapafterbattle	
	setevent EVENT_BEAT_SHRINE_JANE
	
.afterBattle	

	opentext 
	writetext DesertShrineJaneAfterBattleText
	waitbutton
	closetext

.done
	end

DesertShrineJaneTalkScript:
	jumptextfaceplayer DesertShrineJaneAfterBattleText


DesertShrineJanePleaseHelpText:
	text "..."
	line "..."

	para "Please..."
	line "Help me..."
	done


DesertShrineJaneWinLossText:
	text "Wha..."
	line "What's happening?"
	done

DesertShrineJaneAfterBattleText:
	text "I...couldn't"
	line "control myself."

	para "It's..."
	line "Too strong."

	para "Please, you"
	line "have to stop"
	cont "it!"
	done

DesertShrineRocket1Script:
	jumptextfaceplayer DesertShrineRocket1Text

DesertShrineRocket2Script:
	jumptextfaceplayer DesertShrineRocket2Text

DesertShrineRocket3Script:
	jumptextfaceplayer DesertShrineRocket3Text

DesertShrineRocket1Text:
	text "Khaaa..."
	
	para "The Rocket seems"
	line "to be in a trance."
	done

DesertShrineRocket2Text:
	text "Liiii..."
	
	para "The Rocket seems"
	line "to be in a trance."
	done

DesertShrineRocket3Text:
	text "Maaaa..."
	
	para "The Rocket seems"
	line "to be in a trance."
	done

DesertShrine_MapEvents: 
	db 0, 0 ; filler

	def_warp_events	

	warp_event  10, 21, DESERT_RUIN_B1F, 3
	warp_event  09, 23, LAVARIDGE_DESERT, 5
	warp_event  10, 23, LAVARIDGE_DESERT, 5

	def_coord_events
	coord_event  12,  07, -1, DesertShrineJaneScript


	def_bg_events	

	def_object_events
	object_event 13, 02, SPRITE_UNOWN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DesertShrineUnown, EVENT_BEAT_DESERT_SHRINE_UNOWN
	object_event 13, 07, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DesertShrineJaneTalkScript, EVENT_BEAT_DESERT_SHRINE_UNOWN
	object_event 03, 13, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DesertShrineRocket1Script, EVENT_BEAT_DESERT_SHRINE_UNOWN
	object_event 12, 16, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DesertShrineRocket2Script, EVENT_BEAT_DESERT_SHRINE_UNOWN
	object_event 15, 13, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DesertShrineRocket3Script, EVENT_BEAT_DESERT_SHRINE_UNOWN
