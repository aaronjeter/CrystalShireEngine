	object_const_def
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

PalletTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PalletTownFlypointCallback

PalletTownFlypointCallback:
	setflag ENGINE_FLYPOINT_PALLET
	setflag ENGINE_FLYPOINT_GOLDENROD
	endcallback


PalletTownConditionalWarpScript:
	checkevent EVENT_START_KANTO
	iffalse .notHoenn
	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	warp PLAYERS_HOUSE_1F, 07, 06
	sjump .done
	
.notHoenn
.done
	end

PalletTown_TeacherStopsYouScene1:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .done
	playmusic MUSIC_MOM
	turnobject PALLETTOWN_TEACHER, UP
	opentext
	writetext PalletTown_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	opentext
	writetext PalletTown_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	applymovement PLAYER, PalletTown_StepBackMovement
	opentext
	writetext PalletTown_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
.done
	end

PalletTown_StepBackMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

PalletTown_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

PalletTown_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

PalletTown_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#mon!"

	para "Wild #mon"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done


PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

PalletTownTeacherText:
	text "I'm raising #-"
	line "mon too."

	para "They serve as my"
	line "private guards."
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "You can now trade"
	line "#mon across"
	cont "time like e-mail."
	done

PalletTownSignText:
	text "Pallet Town"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

RedsHouseSignText:
	text "Red's House"
	done

OaksLabSignText:
	text "Oak #mon"
	line "Research Lab"
	done

BluesHouseSignText:
	text "Blue's House"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 1

	def_coord_events
	coord_event  03, 11, -1, PalletTownConditionalWarpScript
	coord_event  08, 02, -1, PalletTown_TeacherStopsYouScene1
	coord_event  09, 02, -1, PalletTown_TeacherStopsYouScene1

	def_bg_events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event  3,  5, BGEVENT_READ, RedsHouseSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign
	bg_event 11,  5, BGEVENT_READ, BluesHouseSign

	def_object_events
	object_event  9,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
