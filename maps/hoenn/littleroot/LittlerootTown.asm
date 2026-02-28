	object_const_def
	const LITTLEROOTTOWN_TREECKO
	const LITTLEROOTTOWN_TORCHIC
	const LITTLEROOTTOWN_MUDKIP
	const LITTLEROOTTOWN_TEACHER

LittlerootTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LittlerootTownFlypointCallback

LittlerootTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LITTLEROOT
	endcallback

LittlerootTownConditionalWarpScript:
	checkevent EVENT_START_HOENN
	iffalse .notHoenn
	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	warp PLAYERS_HOUSE_1F, 07, 06
	sjump .done
	
.notHoenn
.done
	end

LittlerootTown_TeacherStopsYouScene1:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .done
	playmusic MUSIC_MOM
	turnobject LITTLEROOTTOWN_TEACHER, UP
	opentext
	writetext Littleroot_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	opentext
	writetext Littleroot_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	applymovement PLAYER, LittlerootTown_StepBackMovement
	opentext
	writetext Littleroot_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
.done
	end

LittlerootTown_StepBackMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

LittlerootTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Littleroot_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Littleroot_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Littleroot_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Littleroot_CallMomOnGear
	waitbutton
	closetext
	end

Littleroot_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

Littleroot_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Littleroot_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

Littleroot_YourMonIsAdorable:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Littleroot_TellMomIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Littleroot_CallMomOnGear:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

Littleroot_GearIsImpressive:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Littleroot_Treecko:
	cry TREECKO
	end

Littleroot_Torchic:
	cry TORCHIC
	end
	
Littleroot_Mudkip:
	cry MUDKIP
	end	

LittlerootTownSign:
	jumptext LittlerootTownSignText

LittlerootTownSignText:
	text "Littleroot Town"

	para "A town that can't"
	line "be shaded any hue."
	done

BirchLabSign:
	jumptext BirchLabSignText

BirchLabSignText:
	text "Birch's Lab"
	done

LittlerootTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event 10, 15, PLAYERS_HOUSE_2F, 2
	warp_event 11, 15, PLAYERS_HOUSE_2F, 2
	warp_event 04, 13, BIRCHS_LAB, 2

	def_coord_events
	coord_event  13,  07, -1, LittlerootTownConditionalWarpScript
	coord_event  10,  01, -1, LittlerootTown_TeacherStopsYouScene1
	coord_event  11,  01, -1, LittlerootTown_TeacherStopsYouScene1

	def_bg_events	
	bg_event  12, 11, BGEVENT_READ, LittlerootTownSign
	bg_event  08, 13, BGEVENT_READ, BirchLabSign

	def_object_events
	object_event  1,  4, SPRITE_TREECKO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Littleroot_Treecko, -1
	object_event 14,  4, SPRITE_TORCHIC, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Littleroot_Torchic, -1
	object_event  1, 15, SPRITE_MUDKIP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Littleroot_Mudkip, -1
	object_event 10, 05, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootTownTeacherScript, -1
	