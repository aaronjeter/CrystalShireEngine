	object_const_def
	const WCLOBBY_QUALIFIER_CLERK
	const WCLOBBY_REGISTRATION_CLERK

WorldCupLobby_MapScripts:
	def_scene_scripts

	def_callbacks

WorldCupQualifierRoomScript:
	checkevent EVENT_WORLD_CUP_REGISTERED
	iffalse .notRegistered

	checkevent EVENT_BEAT_QUALIFIER_ROUND_ONE
	iffalse .roundOne

	checkevent EVENT_BEAT_QUALIFIER_ROUND_TWO
	iffalse .roundTwo

	checkevent EVENT_BEAT_QUALIFIER_ROUND_THREE
	iffalse .roundThree

	setevent EVENT_WORLD_CUP_QUALIFIED
	opentext
	writetext WCQualifierClerkQualifiedText
	waitbutton
	closetext
	applymovement PLAYER, WCLobby_NotRegisteredMovement
	end


.roundOne
	opentext
	writetext WCQualifierClerkRoundOneText
	waitbutton
	closetext
	applymovement PLAYER, WCLobby_RoundOneMovement
	special FadeOutToWhite
	waitsfx
	warpfacing UP, WC_QUALIFIER_1, 06, 10
	end

.roundTwo
	opentext
	writetext WCQualifierClerkRoundTwoText
	waitbutton
	closetext
	applymovement PLAYER, WCLobby_RoundTwoMovement
	special FadeOutToWhite
	waitsfx
	warpfacing UP, WC_QUALIFIER_2, 06, 10
	end

.roundThree
	opentext
	writetext WCQualifierClerkRoundThreeText
	waitbutton
	closetext
	applymovement PLAYER, WCLobby_RoundThreeMovement
	special FadeOutToWhite
	waitsfx
	warpfacing UP, WC_QUALIFIER_3, 06, 10
	end

	
.notRegistered
	opentext
	writetext WorldCupQualifierNotRegisteredText
	waitbutton
	closetext
	applymovement PLAYER, WCLobby_NotRegisteredMovement
	end

WorldCupQualifierNotRegisteredText:
	text "Hi <PLAY_G>!"

	para "I'm sorry, but"
	line "you need to"
	cont "register first."

	para "Please see the"
	line "clerk behind"
	cont "the desk."
	done

WCQualifierClerkRoundOneText:
	text "Hi <PLAY_G>!"

	para "Good luck"
	line "in your first"
	cont "qualifier round!"
	done

WCQualifierClerkRoundTwoText:
	text "Hi <PLAY_G>!"

	para "One down,"
	line "two to go!"
	done

WCQualifierClerkRoundThreeText:
	text "Hey <PLAY_G>!"

	para "Last round!"
	line "Good Luck!"
	done

WCQualifierClerkQualifiedText:
	text "Hey <PLAY_G>!"

	para "You're already"
	line "qualified!"
	done

WCLobby_NotRegisteredMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

WCLobby_RoundOneMovement:
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

WCLobby_RoundTwoMovement:
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step UP
	step_end

WCLobby_RoundThreeMovement:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

WorldCupLobbyQualifierClerkScript:
	faceplayer
	opentext
	writetext WorldCupQualifierEntranceTalkText
	promptbutton
	closetext
	end

WorldCupQualifierEntranceTalkText:
	text "Hi <PLAY_G>!"

	para "The World Cup"
	line "Qualifiers are"

	para "right past here."
	done

WorldCupLobbyRegistrationClerkScript:
	checkevent EVENT_WORLD_CUP_REGISTERED
	iffalse .notRegistered

	opentext
	writetext WorldCupRegistrationAlreadyRegisteredText
	waitbutton
	closetext
	end

.notRegistered
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .notWorthy
	setevent EVENT_WORLD_CUP_REGISTERED
	opentext 
	writetext WorldCupRegistrationText
	promptbutton
	closetext
	end

.notWorthy
	opentext
	writetext WorldCupRegistrationNotWorthyText
	promptbutton
	closetext
	end

WorldCupRegistrationText:
	text "Welcome Trainer!"

	para "Welcome to the"
	line "World Cup!"

	para "Let's see if"
	line "we can get"
	cont "you registered."

	para "..."
	line "..."

	para "Your records..."
	line "..."

	para "Oh, very nice"
	line "<PLAY_G>."

	para "You're exactly"
	line "what we're "
	cont "looking for."

	para "I'll add you"
	line "to the list!"
	done

WorldCupRegistrationAlreadyRegisteredText:
	text "Hi <PLAY_G>!"

	para "You're already"
	line "registered."

	para "Please enjoy the"
	line "event. Good Luck!"
	done

WorldCupRegistrationNotWorthyText:
	text "Welcome Trainer!"

	para "Welcome to the"
	line "World Cup!"

	para "Let's see if"
	line "we can get"
	cont "you registered."

	para "..."
	line "..."

	para "Your records..."
	line "..."

	para "Oh, I'm sorry"
	line "<PLAY_G>."

	para "You show promise,"
	line "but you're just"
	cont "not ready."

	para "You're welcome to"
	line "prove me wrong."

	para "Come back after"
	line "taking down the"

	para "Indigo League in"
	line "Kanto, and we can"
	cont "reconsider..."
	done

WorldCupLobby_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   08, 19, BATTLE_RESORT, 7
	warp_event   09, 19, BATTLE_RESORT, 7

	def_coord_events
	coord_event  09,  08, -1, WorldCupQualifierRoomScript

	def_bg_events

	def_object_events
	object_event  08,  08, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WorldCupLobbyQualifierClerkScript, -1
	object_event  12,  11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WorldCupLobbyRegistrationClerkScript, -1
	