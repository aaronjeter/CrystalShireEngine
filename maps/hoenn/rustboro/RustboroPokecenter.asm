	object_const_def
	const RUSTBOROPOKECENTER_NURSE
	const RUSTBOROPOKECENTER_CHANSEY
	const RUSTBOROPOKECENTER_HIKER
	const RUSTBOROPOKECENTER_MACHOKE
	const RUSTBOROPOKECENTER_TEACHER
	const RUSTBOROPOKECENTER_AIDE

RustboroPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, RustboroPokecenterMonSpritesCallback
	callback MAPCALLBACK_OBJECTS, RustboroPokecenterAideCallback

RustboroPokecenterMonSpritesCallback:
	setmonsprite SPRITE_MON_1, CHANSEY
	setmonsprite SPRITE_MON_2, MACHOKE
	endcallback

RustboroPokecenterAideCallback:
	checkevent EVENT_START_HOENN
	iffalse .hide
	checkflag ENGINE_STONEBADGE
	iffalse .hide
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_BIRCHS_AIDE
	iftrue .hide
	appear RUSTBOROPOKECENTER_AIDE
	endcallback

.hide
	disappear RUSTBOROPOKECENTER_AIDE
	endcallback

RustboroPokecenterAideScript:
	faceplayer
	opentext
	writetext RustboroPokecenterAideFavorText
	yesorno
	iffalse .Refused
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_BIRCHS_AIDE
	writetext RustboroPokecenterAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .WalkAroundPlayer
	turnobject PLAYER, DOWN
	applymovement RUSTBOROPOKECENTER_AIDE, RustboroPokecenterAideLeavesMovement
	sjump .Gone

.WalkAroundPlayer:
	applymovement RUSTBOROPOKECENTER_AIDE, RustboroPokecenterAideStepAsideMovement
	turnobject PLAYER, DOWN
	applymovement RUSTBOROPOKECENTER_AIDE, RustboroPokecenterAideFinishesLeavingMovement
.Gone:
	playsound SFX_EXIT_BUILDING
	disappear RUSTBOROPOKECENTER_AIDE
	waitsfx
	end

.eggname
	db "Egg@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext RustboroPokecenterAideFullPartyText
	waitbutton
	closetext
	end

.Refused:
	writetext RustboroPokecenterAideRefusedText
	waitbutton
	closetext
	end

RustboroPokecenterAideLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

RustboroPokecenterAideStepAsideMovement:
	step RIGHT
	step DOWN
	step_end

RustboroPokecenterAideFinishesLeavingMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

RustboroPokecenterAideFavorText:
	text "<PLAY_G>! There"
	line "you are!"

	para "I'm one of Prof."
	line "Birch's aides."

	para "He heard you beat"
	line "Roxanne. Congrats!"

	para "He has a favor to"
	line "ask. Would you"
	cont "take this Egg?"
	done

RustboroPokecenterAideGiveEggText:
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

RustboroPokecenterAideFullPartyText:
	text "Oh, you can't"
	line "carry any more"
	cont "#mon."

	para "I'll wait here"
	line "while you make"
	cont "room for the Egg."
	done

RustboroPokecenterAideRefusedText:
	text "Oh… The Prof.'ll"
	line "be disappointed."

	para "I'll be here if"
	line "you change your"
	cont "mind."
	done
RustboroPokecenterNurseScript:
	jumpstd PokecenterNurseScript

RustboroPokecenterChanseyScript:
	cry CHANSEY
	end

RustboroPokecenterMachokeScript:
	cry MACHOKE
	end

RustboroPokecenterTeacherScript:
	jumptextfaceplayer RustboroPokecenterTeacherText

RustboroPokecenterTeacherText:
	text "I've heard Team"
	line "Rocket has been"

	para "seen around"
	line "Mauville City."

	para "I had hoped they"
	line "were gone for"
	cont "good!"
	done

RustboroPokecenterHikerScript:
	jumptextfaceplayer RustboroPokecenterHikerText

RustboroPokecenterHikerText:
	text "Rusturf Tunnel"
	line "is totally blocked"
	cont "now."

	para "I just tried to"
	line "go to Verdanturf."
	done

RustboroPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, RUSTBORO_CITY, 2
	warp_event  5,  7, RUSTBORO_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 05, 01, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterNurseScript, -1
	object_event 07, 01, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterChanseyScript, -1
	object_event 12, 05, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterHikerScript, -1
	object_event 12, 06, SPRITE_MON_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterMachokeScript, -1
	object_event 07, 04, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterTeacherScript, -1
	
	object_event 04, 03, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterAideScript, EVENT_BIRCHS_AIDE_IN_RUSTBORO_POKECENTER
