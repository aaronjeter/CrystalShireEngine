	object_const_def
	const PYRE_ROCKET1
	const PYRE_ROCKET2
	const PYRE_ROCKET3
	const PYRE_ROCKET4
	const PYRE_ROCKETF1
	const PYRE_ROCKETF2
	const PYRE_ROCKETF3
	const PYRE_ROCKETF4
	const PYRE_JANE
	const PYRE_LATIAS


MtPyre_MapScripts:
	def_scene_scripts

	def_callbacks	

PyreRocket1Script:
	trainer GRUNTM, PYRE_GRUNT1, EVENT_BEAT_PYRE_ROCKET1, PyreRocket1SeenText, PyreRocket1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PyreRocket1AfterBattleText
	waitbutton
	closetext
	end

PyreRocket1SeenText:
	text "We're the Team"
	line "Rocket Elites!"

	para "Prepare for"
	line "trouble!"
	done

PyreRocket1BeatenText:
	text "Make it double..."
	done

PyreRocket1AfterBattleText:
	text "Team Rocket Elites"
	line "are unstoppable!"

	para "You should just"
	line "go home now."
	done

PyreRocket2Script:
	trainer GRUNTM, PYRE_GRUNT2, EVENT_BEAT_PYRE_ROCKET2, PyreRocket2SeenText, PyreRocket2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PyreRocket2AfterBattleText
	waitbutton
	closetext
	end

PyreRocket2SeenText:
	text "We Elites are"
	line "Team Rocket's"

	para "top tier fighting"
	line "force!"
	done

PyreRocket2BeatenText:
	text "Dang you!"
	done

PyreRocket2AfterBattleText:
	text "We Elites just"
	line "don't lose."

	para "You won't get"
	line "away with this!"
	done

PyreRocket3Script:
	trainer GRUNTM, PYRE_GRUNT3, EVENT_BEAT_PYRE_ROCKET3, PyreRocket3SeenText, PyreRocket3BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PyreRocket3AfterBattleText
	waitbutton
	closetext
	end

PyreRocket3SeenText:
	text "We're here to"
	line "make sure no"

	para "runts like you"
	line "cause trouble!"
	done

PyreRocket3BeatenText:
	text "Huh, how about it?"
	done

PyreRocket3AfterBattleText:
	text "You stupid kid."
	line "Why can't you"
	cont "just stop?"
	done


PyreRocket4Script:
	trainer GRUNTM, PYRE_GRUNT4, EVENT_BEAT_PYRE_ROCKET4, PyreRocket4SeenText, PyreRocket4BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PyreRocket4AfterBattleText
	waitbutton
	closetext
	end

PyreRocket4SeenText:
	text "We're Team"
	line "Rocket's Executive"
	cont "fixers."

	para "We make problems"
	line "like you go away!"
	done

PyreRocket4BeatenText:
	text "You're a problem!"
	done

PyreRocket4AfterBattleText:
	text "Ugh. The rest will"
	line "have to deal with"
	cont "you."
	done


PyreRocketF1Script:
	trainer GRUNTF, PYRE_GRUNTF1, EVENT_BEAT_PYRE_ROCKETF1, PyreRocketF1SeenText, PyreRocketF1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PyreRocketF1AfterBattleText
	waitbutton
	closetext
	end

PyreRocketF1SeenText:
	text "I'm gonna squash"
	line "you like a bug!"
	done

PyreRocketF1BeatenText:
	text "Squashed..."
	done

PyreRocketF1AfterBattleText:
	text "Surely you don't"
	line "think you can beat"
	cont "all of us."

	para "You should just"
	line "leave."
	done


PyreRocketF2Script:
	trainer GRUNTF, PYRE_GRUNTF2, EVENT_BEAT_PYRE_ROCKETF2, PyreRocketF2SeenText, PyreRocketF2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PyreRocketF2AfterBattleText
	waitbutton
	closetext
	end

PyreRocketF2SeenText:
	text "We're here, and"
	line "we're not going"
	cont "anywhere."

	para "Not until we"
	line "catch some"
	cont "cool #mon."
	done

PyreRocketF2BeatenText:
	text "Yikes..."
	done

PyreRocketF2AfterBattleText:
	text "The legendary"
	line "#mon of Mt Pyre"
	cont "will be ours!"
	done


PyreRocketF3Script:
	trainer GRUNTF, PYRE_GRUNTF3, EVENT_BEAT_PYRE_ROCKETF3, PyreRocketF3SeenText, PyreRocketF3BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PyreRocketF3AfterBattleText
	waitbutton
	closetext
	end

PyreRocketF3SeenText:
	text "Latios...and"
	line "Latias."

	para "We're coming for"
	line "you!"
	done

PyreRocketF3BeatenText:
	text "I hate you..."
	done

PyreRocketF3AfterBattleText:
	text "Team Rocket Elites"
	line "are unstoppable!"

	para "You should just"
	line "go home now."
	done


PyreRocketF4Script:
	trainer GRUNTF, PYRE_GRUNTF4, EVENT_BEAT_PYRE_ROCKETF4, PyreRocketF4SeenText, PyreRocketF4BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PyreRocketF4AfterBattleText
	waitbutton
	closetext
	end

PyreRocketF4SeenText:
	text "We're the Team"
	line "Rocket Elites!"

	para "And you're just"
	line "some scrub!"
	done

PyreRocketF4BeatenText:
	text "Ugh..."
	done

PyreRocketF4AfterBattleText:
	text "Team Rocket Elites"
	line "are unstoppable!"

	para "Well, in theory"
	line "at least."
	done

PyreRocketJaneScript:
	checkevent EVENT_BEAT_PYRE_ROCKETS
	iftrue .done

	opentext 
	writetext PyreJaneUsesMasterBallText
	waitbutton
	playsound SFX_WARP_TO
	disappear PYRE_LATIAS

	writetext PyreJaneTauntsPlayerText
	waitbutton

	playsound SFX_WARP_TO
	applymovement PYRE_JANE, PyreJaneFliesAwayMovement
	disappear PYRE_JANE
	setevent EVENT_BEAT_PYRE_ROCKETS

	writetext MtPyreFoundWaterfallText
	setevent EVENT_GOT_HM07_WATERFALL
	verbosegiveitem HM_WATERFALL

	closetext
.done	
	end

PyreJaneFliesAwayMovement:
	teleport_from
	step_end

PyreJaneUsesMasterBallText:
	text "Team Rocket Jane"
	line "uses the Master"
	cont "Ball!"

	para "Latias struggles,"
	line "but cannot escape."
	done

PyreJaneTauntsPlayerText:
	text "Ah ha ha haaa!"
	line "You're too late"
	cont "child!"

	para "The Legendary"
	line "Twins belong to"
	cont "Team Rocket now!"

	para "And now, on to"
	line "the Desert Shrine"

	para "for an even"
	line "greater prize!"
	done

MtPyreFoundWaterfallText:
	text "In her rush out,"
	line "it looks like she"

	para "left something"
	line "valuable..."
	done


MtPyre_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  07, 53, ROUTE_122, 1

	def_coord_events
	coord_event  20, 09, -1, PyreRocketJaneScript
	coord_event  21, 09, -1, PyreRocketJaneScript

	def_bg_events	

	def_object_events
	object_event 05, 54, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, PyreRocket1Script, EVENT_BEAT_PYRE_ROCKETS
	object_event 14, 38, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PyreRocket2Script, EVENT_BEAT_PYRE_ROCKETS
	object_event 20, 30, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PyreRocket3Script, EVENT_BEAT_PYRE_ROCKETS
	object_event 26, 24, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PyreRocket4Script, EVENT_BEAT_PYRE_ROCKETS
	object_event 18, 51, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PyreRocketF1Script, EVENT_BEAT_PYRE_ROCKETS
	object_event 19, 21, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PyreRocketF2Script, EVENT_BEAT_PYRE_ROCKETS
	object_event 19, 20, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PyreRocketF3Script, EVENT_BEAT_PYRE_ROCKETS
	object_event 12, 24, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PyreRocketF4Script, EVENT_BEAT_PYRE_ROCKETS
	object_event 20, 06, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PyreRocketF1Script, EVENT_BEAT_PYRE_ROCKETS
	object_event 21, 06, SPRITE_LATIOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PyreRocketF1Script, EVENT_BEAT_PYRE_ROCKETS
