	object_const_def
	const EVERGRANDE_WALLY
	const EVERGRANDE_GREETER
	const EVERGRANDE_FAN
	const EVERGRANDE_ACE_TRAINER
	const EVERGRANDE_VETERAN
	const EVERGRANDE_NURSE_HELPER

EvergrandeCity_MapScripts:
	def_scene_scripts

	def_callbacks

EvergrandeCity_WallySpotsPlayer:
	checkevent EVENT_FOUND_VICTORY_ROAD_WALLY
	iftrue EvergrandeCity_WallyDone
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	showemote EMOTE_SHOCK, EVERGRANDE_WALLY, 30
	applymovement EVERGRANDE_WALLY, EvergrandeWally_ApproachMovement
	turnobject PLAYER, RIGHT
	sjump EvergrandeCity_WallyBattle

Evergrande_Wally:
	faceplayer
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	; fallthrough

EvergrandeCity_WallyBattle:
	opendialog WALLY
	writetext EvergrandeWallySeenText
	waitbutton
	closedialog
	winlosstext EvergrandeWallyBeatenText, EvergrandeWallyWinText
	loadtrainer WALLY, WALLY6
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	iftrue .WallyWon
	opendialog WALLY
	writetext EvergrandeWallyAfterBattleText
	sjump .WallyLeaves

.WallyWon
	special HealParty
	opendialog WALLY
	writetext EvergrandeWallyWonText

.WallyLeaves
	waitbutton
	closedialog
	setevent EVENT_FOUND_VICTORY_ROAD_WALLY
	turnobject PLAYER, RIGHT
	applymovement EVERGRANDE_WALLY, EvergrandeWally_WalkToLeagueMovement
	disappear EVERGRANDE_WALLY
EvergrandeCity_WallyDone:
	end

EvergrandeWally_ApproachMovement:
	step LEFT
	step LEFT
	step_end

; Wally heads right along the path toward the Pokemon League until he's off-screen
EvergrandeWally_WalkToLeagueMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

EvergrandeWallySeenText:
	text "I knew it!"
	line "I knew you'd"
	cont "make it!"

	para "This is it!"
	line "The championship"
	cont "awaits."

	para "One last match?"
	line "For all the"
	cont "marbles?"
	done

EvergrandeWallyBeatenText:
	text "Oof!"
	done

EvergrandeWallyWinText:
	text "HA! Gotcha!"
	done

EvergrandeWallyWonText:
	text "Well, that was"
	line "exciting!"

	para "Good luck against"
	line "the League!"
	done

EvergrandeWallyAfterBattleText:
	text "You're amazing"
	line "<PLAY_G>."

	para "You're gonna be"
	line "a great champ."

	para "I'm really"
	line "proud of you..."

	para "Good luck in"
	line "there!"
	done

EvergrandeGreeterScript:
	jumptextfaceplayer EvergrandeGreeterText

EvergrandeFanScript:
	jumptextfaceplayer EvergrandeFanText

EvergrandeAceTrainerScript:
	jumptextfaceplayer EvergrandeAceTrainerText

EvergrandeVeteranScript:
	jumptextfaceplayer EvergrandeVeteranText

EvergrandeNurseHelperScript:
	jumptextfaceplayer EvergrandeNurseHelperText

EvergrandeGreeterText:
	text "Welcome to the"
	line "Hoenn #mon"
	cont "League!"

	para "Only trainers with"
	line "all eight Hoenn"
	cont "badges come this"
	cont "far."
	done

EvergrandeFanText:
	text "I'm waiting for"
	line "the Champion to"
	cont "come outside!"

	para "I've been here"
	line "since morning..."
	done

EvergrandeAceTrainerText:
	text "Victory Road was"
	line "just a warm-up."

	para "One more round of"
	line "training, then I'm"
	cont "going in!"
	done

EvergrandeVeteranText:
	text "I made it to the"
	line "Elite Four once."

	para "Lost to the very"
	line "first one!"

	para "Heal up and stock"
	line "up before you go."
	done

EvergrandeNurseHelperText:
	text "I help out at the"
	line "#mon Center."

	para "Trainers come out"
	line "of Victory Road"
	cont "worn out!"
	done

EvergrandeCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 29, 43, EVERGRANDE_POKECENTER, 2
	warp_event 16, 05, HOENN_POKELEAGUE, 2
	warp_event 17, 35, EVERGRANDE_DUNGEON, 1
	warp_event 15, 19, EVERGRANDE_DUNGEON, 2
	def_coord_events
	coord_event 15, 20, -1, EvergrandeCity_WallySpotsPlayer

	def_bg_events	

	def_object_events
	object_event  18, 20, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Evergrande_Wally, EVENT_FOUND_VICTORY_ROAD_WALLY
	object_event 14,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EvergrandeGreeterScript, -1
	object_event 19,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EvergrandeFanScript, -1
	object_event 23, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EvergrandeAceTrainerScript, -1
	object_event 12, 37, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EvergrandeVeteranScript, -1
	object_event 31, 45, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EvergrandeNurseHelperScript, -1
