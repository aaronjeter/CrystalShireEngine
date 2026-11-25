	object_const_def
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5
	const VICTORYROAD_ROCK1
	const VICTORYROAD_ROCK2
	const VICTORYROAD_ROCK3
	const VICTORYROAD_PLAYTESTER_MARINA
	const VICTORYROAD_PLAYTESTER_BARTO
	const VICTORYROAD_PLAYTESTER_AMAYA
	const VICTORYROAD_PLAYTESTER_CHAOS
	const VICTORYROAD_PLAYTESTER_KYLE

VictoryRoad_MapScripts:
	def_scene_scripts
	scene_script VictoryRoadNoop1Scene, SCENE_VICTORYROAD_RIVAL_BATTLE
	scene_script VictoryRoadNoop2Scene, SCENE_VICTORYROAD_NOOP

	def_callbacks

VictoryRoadNoop1Scene:
	end

VictoryRoadNoop2Scene:
	end

VictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoadMaxRevive:
	itemball MAX_REVIVE

VictoryRoadFullRestore:
	itemball FULL_RESTORE

VictoryRoadExpCandyL:
	itemball EXP_CANDY_L

VictoryRoadHPUp:
	itemball HP_UP

VictoryRoadHiddenAssaultVest:
	hiddenitem ASSAULT_VEST, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION

VictoryRoadHiddenExpCandyL:
	hiddenitem EXP_CANDY_L, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL

TrainerPlaytesterMarina:
	trainer COOLTRAINERF, MARINA2, EVENT_BEAT_PLAYTESTER_MARINA, CooltrainerFMarinaVRSeenText, CooltrainerFMarinaVRBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerFMarinaVRAfterBattleText

CooltrainerFMarinaVRSeenText:
	text "Victory Road is"
	line "where I polish my"
	cont "team."
	para "Want to be my"
	line "next whetstone?"
	done

CooltrainerFMarinaVRBeatenText:
	text "Sharper than me"
	line "today!"
	done

CooltrainerFMarinaVRAfterBattleText:
	text "I'll keep training"
	line "here until the"
	cont "World Cup."
	done

TrainerPlaytesterBarto:
	trainer COOLTRAINERM, BARTO_VR, EVENT_BEAT_PLAYTESTER_BARTO, CooltrainerMBartoVRSeenText, CooltrainerMBartoVRBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerMBartoVRAfterBattleText

CooltrainerMBartoVRSeenText:
	text "My team's a bit of"
	line "everything."
	para "Let's see if you"
	line "can handle it!"
	done

CooltrainerMBartoVRBeatenText:
	text "Everything wasn't"
	line "enough!"
	done

CooltrainerMBartoVRAfterBattleText:
	text "One day they'll"
	line "all evolve. Then"
	cont "watch out!"
	done

TrainerPlaytesterAmaya:
	trainer GRUNTF, AMAYA2, EVENT_BEAT_PLAYTESTER_AMAYA, GruntFAmayaVRSeenText, GruntFAmayaVRBeatenText, 0, .Script

.Script:
	trainerafter GruntFAmayaVRAfterBattleText

GruntFAmayaVRSeenText:
	text "Team Rocket? No,"
	line "I just like the"
	cont "outfit."
	para "My team's the real"
	line "deal, though!"
	done

GruntFAmayaVRBeatenText:
	text "Okay, okay, you"
	line "win!"
	done

GruntFAmayaVRAfterBattleText:
	text "Metang will be a"
	line "Metagross soon."
	cont "Then you'll see."
	done

TrainerPlaytesterChaos:
	trainer COOLTRAINERM, CHAOS_VR, EVENT_BEAT_PLAYTESTER_CHAOS, CooltrainerMChaosVRSeenText, CooltrainerMChaosVRBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerMChaosVRAfterBattleText

CooltrainerMChaosVRSeenText:
	text "They call me Chaos"
	line "for a reason."
	para "Nobody can predict"
	line "my team!"
	done

CooltrainerMChaosVRBeatenText:
	text "Didn't see that"
	line "coming!"
	done

CooltrainerMChaosVRAfterBattleText:
	text "Order beat chaos"
	line "this time."
	para "Not next time!"
	done

TrainerPlaytesterKyle:
	trainer COOLTRAINERM, KYLE_VR, EVENT_BEAT_PLAYTESTER_KYLE, CooltrainerMKyleVRSeenText, CooltrainerMKyleVRBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerMKyleVRAfterBattleText

CooltrainerMKyleVRSeenText:
	text "Three starters and"
	line "a sleepy giant."
	para "Think you can wake"
	line "Snorlax up?"
	done

CooltrainerMKyleVRBeatenText:
	text "Snorlax slept"
	line "through it!"
	done

CooltrainerMKyleVRAfterBattleText:
	text "Snorlax is the"
	line "heart of my team,"
	cont "even when it naps."
	done

VictoryRoad_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 67, VICTORY_ROAD_GATE, 3
	warp_event  1, 49, VICTORY_ROAD, 3
	warp_event  1, 35, VICTORY_ROAD, 2
	warp_event 13, 31, VICTORY_ROAD, 5
	warp_event 13, 17, VICTORY_ROAD, 4
	warp_event 17, 33, VICTORY_ROAD, 7
	warp_event 17, 19, VICTORY_ROAD, 6
	warp_event  0, 11, VICTORY_ROAD, 9
	warp_event  0, 27, VICTORY_ROAD, 8
	warp_event 13,  5, ROUTE_23, 3

	def_coord_events

	def_bg_events
	bg_event  3, 29, BGEVENT_ITEM, VictoryRoadHiddenAssaultVest
	bg_event  3, 65, BGEVENT_ITEM, VictoryRoadHiddenExpCandyL

	def_object_events
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadExpCandyL, EVENT_VICTORY_ROAD_FULL_HEAL
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP
	object_event 11,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadWildRock, -1
	object_event 10, 50, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadWildRock, -1
	object_event  6,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadWildRock, -1
	object_event 12, 52, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPlaytesterMarina, -1
	object_event 16, 38, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPlaytesterBarto, -1
	object_event 11, 43, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPlaytesterAmaya, -1
	object_event  2, 26, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPlaytesterChaos, -1
	object_event  7, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPlaytesterKyle, -1
