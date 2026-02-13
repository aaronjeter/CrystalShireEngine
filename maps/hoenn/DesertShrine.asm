	object_const_def
	const DESERTSHRINE_UNOWN

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
	setevent EVENT_BEAT_DESERT_SHRINE_UNOWN
	opentext
	writetext DesertShrineUnownDefeatText
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

	para "..."

	para "..."

	para "The beast attacks!"
	done

DesertShrineUnownDefeatText:
	text "As the beast"
	line "is subdued,"

	para "you hear a"
	line "sound of"
	cont "sands shifting."
	done

DesertShrine_MapEvents: 
	db 0, 0 ; filler

	def_warp_events	

	warp_event  10, 21, DESERT_RUIN_B1F, 3
	warp_event  09, 23, LAVARIDGE_DESERT, 5
	warp_event  10, 23, LAVARIDGE_DESERT, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 13, 02, SPRITE_UNOWN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DesertShrineUnown, EVENT_BEAT_DESERT_SHRINE_UNOWN
