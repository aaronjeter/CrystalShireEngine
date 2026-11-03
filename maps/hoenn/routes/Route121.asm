	object_const_def	

Route121_MapScripts:
	def_scene_scripts

	def_callbacks	

Route121FruitTree1:
	fruittree FRUITTREE_ROUTE_121_1

Route121FruitTree2:
	fruittree FRUITTREE_ROUTE_121_2

Route121SafariSign:
	jumptext Route121SafariText

Route121SafariText:
	text "Safari Zone"
	line "(Closed)"
	done


Route121RyanScript:
	trainer GRUNTS, GRUNTS_ROUTE121, EVENT_BEAT_GRUNTS_ROUTE_121, GruntsRoute121SeenText, GruntsRoute121BeatenText, 0, .Script

.Script:
	trainerafter GruntsRoute121AfterBattleText

Route121AlexScript:
	trainer GRUNTM, ROUTE121_GRUNT2, EVENT_BEAT_ROUTE121_ROCKET2, Route121AlexSeenText, Route121AlexBeatenText, 0, .AfterScript

.AfterScript:
	trainerafter Route121AlexAfterBattleText

Route121AlexSeenText:
	text "Boss said"
	line "no one gets"
	cont "through!"
	done

Route121AlexBeatenText:
	text "So strong..."
	done

Route121AlexAfterBattleText:
	text "I wish I knew"
	line "what they were"

	para "doing up on"
	line "Mt Pyre."
	done


Route121LisaScript:
	trainer GRUNTS, GRUNTS_ROUTE121, EVENT_BEAT_GRUNTS_ROUTE_121, GruntsRoute121SeenText, GruntsRoute121BeatenText, 0, .Script

.Script:
	trainerafter GruntsRoute121AfterBattleText


Route121JamieScript:
	trainer GRUNTF, ROUTE121_GRUNTF2, EVENT_BEAT_ROUTE121_ROCKETF2, Route121JamieSeenText, Route121JamieBeatenText, 0, .AfterScript

.AfterScript:
	trainerafter Route121JamieAfterBattleText

Route121JamieSeenText:
	text "Again? I'm glad"
	line "Boss brought"
	cont "reinforcements."
	done

Route121JamieBeatenText:
	text "Ugh..."
	done

Route121JamieAfterBattleText:
	text "Maybe I can't"
	line "beat you, but"

	para "Team Rocket is"
	line "eternal!"
	done

Route121SafariRocketScript:
	jumptextfaceplayer Route121SafariRocketText

Route121SafariRocketText:
	text "I was hoping"
	line "to hit up the"

	para "Safari Zone"
	line "while I'm"
	cont "posted here."

	para "Shame it isn't"
	line "open."
	done


GruntsRoute121SeenText:
	text "Ryan: You! We'll"
	line "get you this time!"

	para "Lisa: I've been"
	line "itching for some"
	cont "payback!"
	done

GruntsRoute121BeatenText:
	text "Ryan: Not again…"
	done

GruntsRoute121AfterBattleText:
	text "Lisa: Once Mt Pyre"
	line "is done, the boss"
	cont "is unstoppable!"
	done

Route121_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	
	bg_event 39,  4, BGEVENT_READ, Route121SafariSign

	def_object_events
	object_event 12, 08, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route121FruitTree1, -1
	object_event 13, 08, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route121FruitTree2, -1
	object_event 30, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route121RyanScript, EVENT_BEAT_PYRE_ROCKETS
	object_event 33, 19, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route121AlexScript, EVENT_BEAT_PYRE_ROCKETS
	object_event 30, 17, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route121LisaScript, EVENT_BEAT_PYRE_ROCKETS
	object_event 42, 13, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route121JamieScript, EVENT_BEAT_PYRE_ROCKETS
	object_event 41, 05, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route121SafariRocketScript, EVENT_BEAT_PYRE_ROCKETS
	
