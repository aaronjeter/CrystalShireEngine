	object_const_def
	const EVERGRANDE_WALLY

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
