	object_const_def
	const NEWMAUVILLE_MAGNET
	const NEWMAUVILLE_THUNDERSTONE
	const NEWMAUVILLE_ELIXER
	const NEWMAUVILLE_WALLY

NewMauville_MapScripts:
	def_scene_scripts

	def_callbacks

NewMauville_Wally:
	checkevent EVENT_FOUND_NEW_MAUVILLE_WALLY
	iftrue .done

	faceplayer
	opendialog WALLY
	checkevent EVENT_START_HOENN
	iffalse .notHoenn
	writetext NewMauvilleWallyIntroText
	sjump .fight

.notHoenn
	writetext NewMauvilleWallyNotHoennText
	sjump .fight

.fight
	waitbutton
	closedialog
	winlosstext NewMauvilleWallyLossText, NewMauvilleWallyWinText
	loadtrainer WALLY, WALLY4
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	iftrue .WallyWon
	opendialog WALLY
	writetext NewMauvilleWallyAfterBattleText
	waitbutton
	closedialog
	special HealParty
	sjump .WallyLeaves

.WallyWon
	special HealParty
	opendialog WALLY
	writetext NewMauvilleWallyWonText
	waitbutton
	closedialog

.WallyLeaves
	setevent EVENT_FOUND_NEW_MAUVILLE_WALLY
	applymovement PLAYER, NewMauville_PlayerStepAsideMovement
	turnobject PLAYER, DOWN
	applymovement NEWMAUVILLE_WALLY, NewMauville_WallyWalkAwayMovement
	playsound SFX_EXIT_BUILDING
	disappear NEWMAUVILLE_WALLY
	waitsfx
.done
	end

NewMauville_PlayerStepAsideMovement:
	step UP
	step_end

; Wally heads back out the entrance to Route 110
NewMauville_WallyWalkAwayMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

NewMauvilleWallyAfterBattleText:
	text "I don't think I'm"
	line "ready..."

	para "Someone has to"
	line "stop Team Rocket"
	cont "though."

	para "You're really"
	line "tough <PLAY_G>."

	para "I think you can"
	line "put a stop to"
	cont "their scheme!"

	para "Here, let me give"
	line "your #mon"
	cont "some medicine."
	done

NewMauvilleWallyWonText:
	text "I don't think"
	line "we're ready..."

	para "Someone has to"
	line "stop Team Rocket"
	cont "though."

	para "Please be careful"
	line "<PLAY_G>, if you"
	cont "face them..."

	para "Here, let me give"
	line "your #mon"
	cont "some medicine."
	done

NewMauvilleWallyLossText:
	text "Awww, I'm not"
	line "ready..."
	done

NewMauvilleWallyWinText:
	text "Ha, Gotcha!"
	done

NewMauvilleWallyIntroText:
	text "Oh, hi <PLAY_G>!"
	line "I'm glad to see"
	cont "you!"

	para "Team Rocket's"
	line "base is in here"
	cont "somewhere..."

	para "I hate what"
	line "they're doing"
	cont "to my town..."

	para "Maybe...we could"
	line "have a warmup"
	cont "match?"
	done

NewMauvilleWallyNotHoennText:
	text "Oh, hi..."
	line "I'm glad to see"
	cont "you!"

	para "Team Rocket's"
	line "base is in here"
	cont "somewhere..."

	para "I hate what"
	line "they're doing"
	cont "to my town..."

	para "Maybe...we could"
	line "have a warmup"
	cont "match?"
	done

NewMauvilleMagnet:
	itemball MAGNET

NewMauvilleThunderstone:
	itemball THUNDERSTONE

NewMauvilleElixer:
	itemball ELIXER

NewMauville_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  25,  40, ROUTE_110, 1
	warp_event  37,  04, NEW_MAUVILLE_BASEMENT, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  20, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NewMauvilleMagnet, EVENT_GOT_HOENN_MAGNET
	object_event  19, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NewMauvilleThunderstone, EVENT_NEW_MAUVILLE_THUNDERSTONE
	object_event  33, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NewMauvilleElixer, EVENT_NEW_MAUVILLE_ELIXER
	object_event  23, 42, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewMauville_Wally, EVENT_FOUND_NEW_MAUVILLE_WALLY
