	object_const_def
	const ROUTE48_COOLTRAINERF_YVONNE
	const ROUTE48_SKIER_TASHA
	const ROUTE48_COOLTRAINERM_CORWIN
	const ROUTE48_BOARDER_PIKE
	const ROUTE48_COOLTRAINERM_EZRA
	const ROUTE48_COOLTRAINERF_NOELLE
	const ROUTE48_POKE_BALL1
	const ROUTE48_POKE_BALL2
	const ROUTE48_POKE_BALL3

Route48_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainerFYvonne:
	trainer COOLTRAINERF, YVONNE, EVENT_BEAT_ROUTE48_YVONNE, CooltrainerFYvonneSeenText, CooltrainerFYvonneBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerFYvonneAfterBattleText

TrainerSkierTasha:
	trainer SKIER, TASHA, EVENT_BEAT_ROUTE48_TASHA, SkierTashaSeenText, SkierTashaBeatenText, 0, .Script

.Script:
	trainerafter SkierTashaAfterBattleText

TrainerCooltrainerMCorwin:
	trainer COOLTRAINERM, CORWIN, EVENT_BEAT_ROUTE48_CORWIN, CooltrainerMCorwinSeenText, CooltrainerMCorwinBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerMCorwinAfterBattleText

TrainerBoarderPike:
	trainer BOARDER, PIKE, EVENT_BEAT_ROUTE48_PIKE, BoarderPikeSeenText, BoarderPikeBeatenText, 0, .Script

.Script:
	trainerafter BoarderPikeAfterBattleText

TrainerCooltrainerMEzra:
	trainer COOLTRAINERM, EZRA, EVENT_BEAT_ROUTE48_EZRA, CooltrainerMEzraSeenText, CooltrainerMEzraBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerMEzraAfterBattleText

TrainerCooltrainerFNoelle:
	trainer COOLTRAINERF, NOELLE, EVENT_BEAT_ROUTE48_NOELLE, CooltrainerFNoelleSeenText, CooltrainerFNoelleBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerFNoelleAfterBattleText

CooltrainerFYvonneSeenText:
	text "My fire #mon"
	line "keep me warm up"
	cont "here!"
	done

CooltrainerFYvonneBeatenText:
	text "My flames went"
	line "out…"
	done

CooltrainerFYvonneAfterBattleText:
	text "A good fire type"
	line "is worth more than"
	cont "any coat."
	done

SkierTashaSeenText:
	text "You made it out"
	line "of the pass?"
	para "Then let's race to"
	line "the bottom!"
	done

SkierTashaBeatenText:
	text "You win this run."
	done

SkierTashaAfterBattleText:
	text "Silver Town is up"
	line "the hill. The"
	cont "League is waiting."
	done

CooltrainerMCorwinSeenText:
	text "Cold air carries"
	line "a charge."
	para "Feel the shock!"
	done

CooltrainerMCorwinBeatenText:
	text "I'm all out of"
	line "juice."
	done

CooltrainerMCorwinAfterBattleText:
	text "Electric types"
	line "work great in the"
	cont "cold. Who knew?"
	done

BoarderPikeSeenText:
	text "Look out below!"
	para "I can't stop!"
	done

BoarderPikeBeatenText:
	text "Okay, now I"
	line "stopped."
	done

BoarderPikeAfterBattleText:
	text "I should really"
	line "learn to brake."
	done

CooltrainerMEzraSeenText:
	text "I've beaten every"
	line "trainer on this"
	cont "mountain."
	para "You're next!"
	done

CooltrainerMEzraBeatenText:
	text "Not every trainer,"
	line "I guess."
	done

CooltrainerMEzraAfterBattleText:
	text "Go on to Silver"
	line "Town. You've"
	cont "earned it."
	done

CooltrainerFNoelleSeenText:
	text "This is the last"
	line "stop before the"
	cont "League."
	para "I'm your final"
	line "test!"
	done

CooltrainerFNoelleBeatenText:
	text "You passed with"
	line "flying colors!"
	done

CooltrainerFNoelleAfterBattleText:
	text "The Elite Four"
	line "are on another"
	cont "level. Good luck!"
	done

Route48MaxPotion:
	itemball MAX_POTION

Route48MaxRepel:
	itemball MAX_REPEL

Route48NeverMeltIce:
	itemball NEVERMELTICE

Route48HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_48_HIDDEN_FULL_RESTORE

Route48_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 50, 53, SILVER_PASS, 2

	def_coord_events

	def_bg_events
	bg_event  6, 30, BGEVENT_ITEM, Route48HiddenFullRestore

	def_object_events
	object_event 26, 52, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFYvonne, -1
	object_event  4, 47, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSkierTasha, -1
	object_event 22, 33, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMCorwin, -1
	object_event 41, 40, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBoarderPike, -1
	object_event 50, 26, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMEzra, -1
	object_event 30, 20, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFNoelle, -1
	object_event 27, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route48MaxPotion, EVENT_ROUTE_48_MAX_POTION
	object_event 53,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route48MaxRepel, EVENT_ROUTE_48_MAX_REPEL
	object_event 45,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route48NeverMeltIce, EVENT_ROUTE_48_NEVERMELTICE
