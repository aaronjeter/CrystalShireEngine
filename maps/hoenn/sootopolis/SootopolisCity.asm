	object_const_def
	const SOOTOPOLISCITY_CAVE_GUARD
	const SOOTOPOLISCITY_CAVE_GUARD_2
	const SOOTOPOLISCITY_DIVER
	const SOOTOPOLISCITY_SIGHTSEER
	const SOOTOPOLISCITY_KID1
	const SOOTOPOLISCITY_KID2
	const SOOTOPOLISCITY_GRANNY
	const SOOTOPOLISCITY_GYM_FAN
	const SOOTOPOLISCITY_STARGAZER

SootopolisCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, SootopolisCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, SootopolisCityCaveGuardCallback

SootopolisCityFlypointCallback:
	setflag ENGINE_FLYPOINT_SOOTOPOLIS
	endcallback

SootopolisCityCaveGuardCallback:
	checkflag ENGINE_RAINBADGE
	iffalse .Done
	moveobject SOOTOPOLISCITY_CAVE_GUARD, 34, 18
.Done:
	endcallback

SootopolisCaveGuardScript:
	checkflag ENGINE_RAINBADGE
	iftrue .Open
	jumptextfaceplayer SootopolisCaveGuardClosedText

.Open:
	jumptextfaceplayer SootopolisCaveGuardOpenText

SootopolisCaveGuard2Script:
	jumptextfaceplayer SootopolisCaveGuard2Text

SootopolisCaveGuardClosedText:
	text "This is the Cave"
	line "of Origin."

	para "Only a trainer"
	line "who holds the"
	cont "Rain Badge may"
	cont "enter."
	done

SootopolisCaveGuardOpenText:
	text "You hold the Rain"
	line "Badge."

	para "The Cave of Origin"
	line "is open to you."
	done

SootopolisCaveGuard2Text:
	text "The #mon that"
	line "made the seas is"

	para "said to sleep deep"
	line "inside the cave."
	done

SootopolisSign:
	jumptext SootopolisSignText

SootopolisSignText:
	text "Sootopolis City"

	para "The mystical city"
	line "where history"
	cont "slumbers."
	done

SootopolisGymSign:
	jumptext SootopolisGymSignText

SootopolisGymSignText:
	text "Sootopolis City"
	line "#mon Gym"

	para "Leader: Wallace"
	done

SootopolisDiverScript:
	jumptextfaceplayer SootopolisDiverText

SootopolisSightseerScript:
	jumptextfaceplayer SootopolisSightseerText

SootopolisKid1Script:
	jumptextfaceplayer SootopolisKid1Text

SootopolisKid2Script:
	jumptextfaceplayer SootopolisKid2Text

SootopolisGrannyScript:
	jumptextfaceplayer SootopolisGrannyText

SootopolisGymFanScript:
	jumptextfaceplayer SootopolisGymFanText

SootopolisStargazerScript:
	jumptextfaceplayer SootopolisStargazerText

SootopolisDiverText:
	text "The lake is so"
	line "deep, nobody's"
	cont "seen the bottom!"
	done

SootopolisSightseerText:
	text "I came all the way"
	line "from Lilycove to"
	cont "see this crater."

	para "It was made by a"
	line "falling star, they"
	cont "say."
	done

SootopolisKid1Text:
	text "Let's see who can"
	line "skip a stone the"
	cont "farthest!"
	done

SootopolisKid2Text:
	text "I'm going to learn"
	line "Surf and swim to"
	cont "the Gym!"
	done

SootopolisGrannyText:
	text "I feed the Luvdisc"
	line "in the lake every"
	cont "morning."

	para "They come up to"
	line "say hello!"
	done

SootopolisGymFanText:
	text "Our Gym Leader"
	line "uses Water types."

	para "Grass and Electric"
	line "moves are your"
	cont "best bet!"
	done

SootopolisStargazerText:
	text "The sky looks"
	line "close up here."

	para "Some nights a"
	line "green shape flies"

	para "toward Meteor"
	line "Falls..."
	done

SootopolisCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 45, 21, SOOTOPOLIS_POKECENTER, 2
	warp_event 13, 21, SOOTOPOLIS_MART, 2
	warp_event 30, 29, SOOTOPOLIS_GYM, 2
	warp_event 07, 19, SOOTOPOLIS_FISHER_HOUSE, 2
	warp_event 33, 17, CAVE_OF_ORIGIN, 1
	warp_event 51, 25, SOOTOPOLIS_ELDERS_HOUSE, 1
	warp_event 45,  7, SOOTOPOLIS_LEGEND_HOUSE, 1
	warp_event 45, 13, SOOTOPOLIS_BERRY_HOUSE, 1
	warp_event 51, 13, SOOTOPOLIS_TUTOR_HOUSE, 1

	def_coord_events

	def_bg_events	
	bg_event 48, 20, BGEVENT_READ, SootopolisSign
	bg_event 31, 29, BGEVENT_READ, SootopolisGymSign

	def_object_events
	object_event 33, 18, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SootopolisCaveGuardScript, -1
	object_event 32, 18, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SootopolisCaveGuard2Script, -1
	object_event 30, 38, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SootopolisDiverScript, -1
	object_event 26, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SootopolisSightseerScript, -1
	object_event 10, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SootopolisKid1Script, -1
	object_event 11, 30, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SootopolisKid2Script, -1
	object_event 13, 27, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SootopolisGrannyScript, -1
	object_event 34, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SootopolisGymFanScript, -1
	object_event 47, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SootopolisStargazerScript, -1
