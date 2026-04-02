	object_const_def

GlaciasRoom_MapScripts:
	def_scene_scripts

	def_callbacks


GlaciaRoomDoorLocksBehindYouScript:
	applymovement PLAYER, GlaciasRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 14, $14 ; wall
	refreshmap
	closetext
	waitsfx
	end

GlaciasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end


GlaciaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_GLACIA
	iftrue GlaciaScript_AfterBattle
	writetext GlaciaScript_GlaciaBeforeText
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 15, .Hard
	sjump .Easy

.Hard
	winlosstext GlaciaScript_GlaciaBeatenText, 0
	loadtrainer GLACIA, GLACIA2
	sjump .Fight

.Easy
	winlosstext GlaciaScript_GlaciaBeatenText, 0
	loadtrainer GLACIA, GLACIA1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_GLACIA
	opentext
	writetext GlaciaScript_GlaciaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 6, 2, $4f ; open door
	refreshmap
	closetext
	waitsfx
	special HealParty
	end

GlaciaScript_AfterBattle:
	writetext GlaciaScript_GlaciaDefeatText
	waitbutton
	closetext
	end

GlaciaScript_GlaciaBeforeText:
	text "Welcome, my name"
	line "is GLACIA of the"
	cont "ELITE FOUR."

	para "I've traveled from"
	line "afar to HOENN so"

	para "that I may hone my"
	line "ice skills."

	para "But all I have"
	line "seen are"

	para "challenges by"
	line "weak trainers and"
	cont "their #MON."

	para "What about you?"

	para "It would please me"
	line "to no end if I"

	para "could go all out"
	line "against you!"
	done

GlaciaScript_GlaciaBeatenText:
	text "You and your"
	line "#MON..."

	para "How hot your"
	line "spirits burn!"

	para "The all-consuming"
	line "heat overwhelms."

	para "It's no surprise"
	line "that my icy skills"

	para "failed to harm"
	line "you."
	done

GlaciaScript_GlaciaDefeatText:
	text "Advance to the"
	line "next room."

	para "And there, confirm"
	line "the truly fearsome"

	para "side of the"
	line "#MON league."
	done

GlaciasRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  17, PHOEBES_ROOM, 1
	warp_event  7,  17, PHOEBES_ROOM, 2
	warp_event  6,  02, DRAKES_ROOM, 1
	warp_event  7,  02, DRAKES_ROOM, 2

	def_coord_events
	coord_event  06,  16, -1, GlaciaRoomDoorLocksBehindYouScript
	coord_event  07,  16, -1, GlaciaRoomDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  7,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, GlaciaScript_Battle, -1
