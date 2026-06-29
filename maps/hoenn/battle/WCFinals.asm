	object_const_def
	const WCFINALS_TROPHY
	const WCFINALS_OAK

WCFinals_MapScripts:
	def_scene_scripts

	def_callbacks

WCFinalsEventScript:	
	opentext
	writetext WCFinalsOakIntroText
	waitbutton
	closetext

	follow WCFINALS_OAK, PLAYER
	applymovement WCFINALS_OAK, WCFinals_WalkUpWithOak
	stopfollow
	turnobject PLAYER, RIGHT

	opentext
	writetext WCFinalsOakChallengeText
	waitbutton
	closetext

	winlosstext WCFinalsOakBeatenText, 0
	loadtrainer POKEMON_PROF, WC_OAK

	startbattle
	reloadmapafterbattle
	special HealParty
	setevent EVENT_DECO_GOLD_TROPHY

	opentext 
	writetext WCFinalsOakAfterBattleText
	waitbutton
	closetext

	setevent EVENT_WORLD_CUP_CHAMPION
	
	halloffame
	end

WCFinals_WalkUpWithOak:
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end


WCFinalsOakIntroText:
	text "<PLAY_G>!"
	line "Congratulations!"

	para "I knew you were"
	line "something special"
	cont "the day we met!"

	para "As the last"
	line "standing challen-"
	cont "ger, you may"
	cont "now face the Cup."

	para "Your skill, your"
	line "training, your"
	cont "unbreakable bond"
	cont "with your #mon"
	cont "bring you here..."

	para "Standing here,"
	line "you join the"
	cont "elite few."

	para "You have won"
	line "renown that will"
	cont "last forever."

	para "Please follow"
	line "me."
	done

WCFinalsOakChallengeText:
	text "You see, the Cup"
	line "belongs to the"
	cont "#mon League"
	cont "World Champion."

	para "Which is to say"
	line "<PLAY_G>..."

	para "You have come to"
	line "to claim MY"
	cont "Trophy!"

	para "I, Samuel Oak,"
	line "Champion of"
	cont "The World #mon"
	cont "League, accept"
	cont "your challenge!"
	done

WCFinalsOakBeatenText:
	text "Extraordinary!"
	done

WCFinalsOakAfterBattleText:
	text "Ah, I'm filled"
	line "with pride to"
	cont "crown a new"
	cont "Champion!"

	para "May your reign"
	line "as Champion be"
	cont "as much a joy"
	cont "as mine!"

	para "Now, claim the"
	line "Cup, and go"
	cont "down in history!"
	done
	

WCFinals_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   06, 13, WC_ROUND_FOUR, 3
	warp_event   07, 13, WC_ROUND_FOUR, 4

	def_coord_events
	coord_event  06,  11, -1, WCFinalsEventScript
	coord_event  07,  11, -1, WCFinalsEventScript

	def_bg_events

	def_object_events
	object_event  06, 02, SPRITE_GOLD_TROPHY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WCFinalsEventScript, -1
	object_event  06, 10, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WCFinalsEventScript, -1
