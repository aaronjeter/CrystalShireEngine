	object_const_def
	const LITTLEROOTTOWN_TREECKO
	const LITTLEROOTTOWN_TORCHIC
	const LITTLEROOTTOWN_MUDKIP
	const LITTLEROOTTOWN_TEACHER
	const LITTLEROOTTOWN_YOUNGSTER
	const LITTLEROOTTOWN_TWIN
	const LITTLEROOTTOWN_GRAMPS
	const LITTLEROOTTOWN_SCIENTIST

LittlerootTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LittlerootTownFlypointCallback
	callback MAPCALLBACK_SPRITES, LittlerootTownMonSpritesCallback

LittlerootTownMonSpritesCallback:
	setmonsprite SPRITE_MON_1, TREECKO
	setmonsprite SPRITE_MON_2, TORCHIC
	setmonsprite SPRITE_MON_3, MUDKIP
	endcallback

LittlerootTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LITTLEROOT
	endcallback

LittlerootTown_TeacherStopsYouScene1:
	checkevent EVENT_GOT_A_POKEMON
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
	checkevent EVENT_GOT_A_POKEMON
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
	cont "#mon!"

	para "Wild #mon"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

Littleroot_YourMonIsAdorable:
	text "Oh! Your #mon"
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
	line "your #gear to"

	para "let her know how"
	line "you're doing."
	done

Littleroot_GearIsImpressive:
	text "Wow, your #gear"
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

LittlerootTownYoungsterScript:
	jumptextfaceplayer LittlerootTownYoungsterText

LittlerootTownYoungsterText:
	text "Norman, the Gym"
	line "Leader in Petal-"
	cont "burg, is so cool!"

	para "Someday I'll get"
	line "his Badge. Just"
	cont "you watch!"
	done

LittlerootTownTwinScript:
	jumptextfaceplayer LittlerootTownTwinText

LittlerootTownTwinText:
	text "Prof. Birch's"
	line "#mon play all"
	cont "over town!"

	para "Treecko naps in"
	line "the trees. Torchic"
	cont "likes the sun!"
	done

LittlerootTownGrampsScript:
	jumptextfaceplayer LittlerootTownGrampsText

LittlerootTownGrampsText:
	text "Littleroot isn't"
	line "much of a town."

	para "But every great"
	line "trainer has to"
	cont "start somewhere,"
	cont "eh?"
	done

LittlerootTownScientistScript:
	jumptextfaceplayer LittlerootTownScientistText

LittlerootTownScientistText:
	text "I'm one of Prof."
	line "Birch's aides."

	para "The professor's in"
	line "his lab today."

	para "He still loves"
	line "fieldwork, though."
	cont "He says you can't"
	cont "learn about"
	cont "#mon from a desk!"
	done

LittlerootTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  4, 13, BIRCHS_LAB, 2
	cond_warp_event 13,  7, LittlerootHomeDoorWarps
	warp_event  5,  7, LITTLEROOT_NEIGHBOR_HOUSE, 1

	def_coord_events
	coord_event  10,  01, -1, LittlerootTown_TeacherStopsYouScene1
	coord_event  11,  01, -1, LittlerootTown_TeacherStopsYouScene1

	def_bg_events	
	bg_event  12, 11, BGEVENT_READ, LittlerootTownSign
	bg_event  08, 13, BGEVENT_READ, BirchLabSign

	def_object_events
	object_event  1,  6, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Littleroot_Treecko, -1
	object_event 14,  4, SPRITE_MON_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Littleroot_Torchic, -1
	object_event  1, 15, SPRITE_MON_3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Littleroot_Mudkip, -1
	object_event 10, 05, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootTownTeacherScript, -1
	object_event  3,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LittlerootTownYoungsterScript, -1
	object_event 12,  9, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LittlerootTownTwinScript, -1
	object_event  3, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootTownGrampsScript, -1
	object_event 11, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LittlerootTownScientistScript, -1
