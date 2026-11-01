	object_const_def
	const PEWTERPOKECENTER1F_NURSE
	const PEWTERPOKECENTER1F_TEACHER
	const PEWTERPOKECENTER1F_JIGGLYPUFF
	const PEWTERPOKECENTER1F_BUG_CATCHER
	const PEWTERPOKECENTER1F_CHRIS
	const PEWTERPOKECENTER1F_AIDE

PewterPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, PewterPokecenter1FMonSpritesCallback
	callback MAPCALLBACK_OBJECTS, PewterPokecenter1FAideCallback

PewterPokecenter1FMonSpritesCallback:
	setmonsprite SPRITE_MON_1, JIGGLYPUFF
	endcallback

PewterPokecenter1FAideCallback:
	checkevent EVENT_START_KANTO
	iffalse .hide
	checkflag ENGINE_BOULDERBADGE
	iffalse .hide
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE
	iftrue .hide
	appear PEWTERPOKECENTER1F_AIDE
	endcallback

.hide
	disappear PEWTERPOKECENTER1F_AIDE
	endcallback

PewterPokecenter1FAideScript:
	faceplayer
	opentext
	writetext PewterPokecenter1FAideFavorText
	yesorno
	iffalse .Refused
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE
	writetext PewterPokecenter1FAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .WalkAroundPlayer
	turnobject PLAYER, DOWN
	applymovement PEWTERPOKECENTER1F_AIDE, PewterPokecenter1FAideLeavesMovement
	sjump .Gone

.WalkAroundPlayer:
	applymovement PEWTERPOKECENTER1F_AIDE, PewterPokecenter1FAideStepAsideMovement
	turnobject PLAYER, DOWN
	applymovement PEWTERPOKECENTER1F_AIDE, PewterPokecenter1FAideFinishesLeavingMovement
.Gone:
	playsound SFX_EXIT_BUILDING
	disappear PEWTERPOKECENTER1F_AIDE
	waitsfx
	end

.eggname
	db "Egg@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext PewterPokecenter1FAideFullPartyText
	waitbutton
	closetext
	end

.Refused:
	writetext PewterPokecenter1FAideRefusedText
	waitbutton
	closetext
	end

PewterPokecenter1FAideLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

PewterPokecenter1FAideStepAsideMovement:
	step LEFT
	step DOWN
	step_end

PewterPokecenter1FAideFinishesLeavingMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

PewterPokecenter1FAideFavorText:
	text "<PLAY_G>! There"
	line "you are!"

	para "I'm one of Prof."
	line "Oak's aides."

	para "He heard you beat"
	line "Brock. Congrats!"

	para "He has a favor to"
	line "ask. Would you"
	cont "take this Egg?"
	done

PewterPokecenter1FAideGiveEggText:
	text "Someone gave this"
	line "Egg to the Prof.,"
	cont "but nobody knows"
	cont "what will hatch."

	para "It won't hatch"
	line "unless it travels"
	cont "with active #-"
	cont "mon like yours."

	para "Please take good"
	line "care of it!"
	done

PewterPokecenter1FAideFullPartyText:
	text "Oh, you can't"
	line "carry any more"
	cont "#mon."

	para "I'll wait here"
	line "while you make"
	cont "room for the Egg."
	done

PewterPokecenter1FAideRefusedText:
	text "Oh… The Prof.'ll"
	line "be disappointed."

	para "I'll be here if"
	line "you change your"
	cont "mind."
	done
PewterPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

PewterPokecenter1FTeacherScript:
	jumptextfaceplayer PewterPokecenter1FTeacherText

PewterJigglypuff:
	opentext
	writetext PewterJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

PewterPokecenter1FBugCatcherScript:
	jumptextfaceplayer PewterPokecenter1FBugCatcherText

Chris:
	faceplayer
	opentext
	trade NPC_TRADE_CHRIS
	waitbutton
	closetext
	end

PewterPokecenter1FTeacherText:
	text "…Yeah, and the"
	line "Gym in Cinnabar's"

	para "gone. I was really"
	line "amazed."

	para "…Yes? I'm on the"
	line "phone. Go away!"
	done

PewterJigglypuffText:
	text "Jigglypuff: Puu"
	line "pupuu."
	done

PewterPokecenter1FBugCatcherText:
	text "Most #mon get"
	line "drowsy if they"

	para "hear a Jigglypuff"
	line "singing."

	para "There are several"
	line "moves that can be"

	para "used only while a"
	line "#mon is asleep."
	done

PewterPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, PEWTER_CITY, 4
	warp_event  4,  7, PEWTER_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FNurseScript, -1
	object_event  8,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FTeacherScript, -1
	object_event  1,  3, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterJigglypuff, -1
	object_event  2,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FBugCatcherScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Chris, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FAideScript, EVENT_OAKS_AIDE_IN_PEWTER_POKECENTER
