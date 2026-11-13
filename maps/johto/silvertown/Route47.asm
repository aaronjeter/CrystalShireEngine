	object_const_def
	const ROUTE47_COOLTRAINERM_DALTON
	const ROUTE47_BOARDER_BRODY
	const ROUTE47_COOLTRAINERF_HELENA
	const ROUTE47_SKIER_MIRA
	const ROUTE47_COOLTRAINERM_ROWAN
	const ROUTE47_COOLTRAINERF_IVY
	const ROUTE47_POKE_BALL1
	const ROUTE47_POKE_BALL2
	const ROUTE47_POKE_BALL3

Route47_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainerMDalton:
	trainer COOLTRAINERM, DALTON, EVENT_BEAT_ROUTE47_DALTON, CooltrainerMDaltonSeenText, CooltrainerMDaltonBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerMDaltonAfterBattleText

TrainerBoarderBrody:
	trainer BOARDER, BRODY, EVENT_BEAT_ROUTE47_BRODY, BoarderBrodySeenText, BoarderBrodyBeatenText, 0, .Script

.Script:
	trainerafter BoarderBrodyAfterBattleText

TrainerCooltrainerFHelena:
	trainer COOLTRAINERF, HELENA, EVENT_BEAT_ROUTE47_HELENA, CooltrainerFHelenaSeenText, CooltrainerFHelenaBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerFHelenaAfterBattleText

TrainerSkierMira:
	trainer SKIER, MIRA, EVENT_BEAT_ROUTE47_MIRA, SkierMiraSeenText, SkierMiraBeatenText, 0, .Script

.Script:
	trainerafter SkierMiraAfterBattleText

TrainerCooltrainerMRowan:
	trainer COOLTRAINERM, ROWAN, EVENT_BEAT_ROUTE47_ROWAN, CooltrainerMRowanSeenText, CooltrainerMRowanBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerMRowanAfterBattleText

TrainerCooltrainerFIvy:
	trainer COOLTRAINERF, IVY, EVENT_BEAT_ROUTE47_IVY, CooltrainerFIvySeenText, CooltrainerFIvyBeatenText, 0, .Script

.Script:
	trainerafter CooltrainerFIvyAfterBattleText

CooltrainerMDaltonSeenText:
	text "Only trainers with"
	line "eight Badges get"
	cont "past that gate."
	para "Show me you earned"
	line "yours!"
	done

CooltrainerMDaltonBeatenText:
	text "You earned them,"
	line "all right."
	done

CooltrainerMDaltonAfterBattleText:
	text "The road to the"
	line "League only gets"
	cont "tougher from here."
	done

BoarderBrodySeenText:
	text "This slope is the"
	line "best powder in"
	cont "Johto!"
	para "Try and keep up!"
	done

BoarderBrodyBeatenText:
	text "Wiped out!"
	done

BoarderBrodyAfterBattleText:
	text "I came for the"
	line "snow, but the"
	cont "trainers here are"
	cont "no joke."
	done

CooltrainerFHelenaSeenText:
	text "My team is all"
	line "grace and power."
	para "Can you handle"
	line "both?"
	done

CooltrainerFHelenaBeatenText:
	text "You handled it"
	line "beautifully."
	done

CooltrainerFHelenaAfterBattleText:
	text "A strong team and"
	line "a pretty one can"
	cont "be the same team."
	done

SkierMiraSeenText:
	text "The cold doesn't"
	line "bother my #mon"
	cont "one bit!"
	done

SkierMiraBeatenText:
	text "Brr! That was a"
	line "chilly loss."
	done

SkierMiraAfterBattleText:
	text "Ice types love it"
	line "up here. I think"
	cont "I do too."
	done

CooltrainerMRowanSeenText:
	text "Nothing gets"
	line "through my wall of"
	cont "steel!"
	done

CooltrainerMRowanBeatenText:
	text "You found a way"
	line "through."
	done

CooltrainerMRowanAfterBattleText:
	text "Steel holds firm,"
	line "but fire melts it."
	cont "I need to plan for"
	cont "that."
	done

CooltrainerFIvySeenText:
	text "Even in the snow,"
	line "my garden blooms!"
	done

CooltrainerFIvyBeatenText:
	text "My flowers have"
	line "wilted…"
	done

CooltrainerFIvyAfterBattleText:
	text "Grass types are"
	line "tougher than they"
	cont "look. So am I."
	done

Route47MaxRevive:
	itemball MAX_REVIVE

Route47UltraBall:
	itemball ULTRA_BALL

Route47FullHeal:
	itemball FULL_HEAL

Route47HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_47_HIDDEN_MAX_ETHER

Route47_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 57, ROUTE_47_GATE, 1
	warp_event 30, 57, ROUTE_47_GATE, 2
	warp_event 48, 15, SILVER_PASS, 1

	def_coord_events

	def_bg_events
	bg_event  4, 55, BGEVENT_ITEM, Route47HiddenMaxEther

	def_object_events
	object_event 33, 37, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMDalton, -1
	object_event 49, 39, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBoarderBrody, -1
	object_event 38, 47, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFHelena, -1
	object_event 24, 40, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSkierMira, -1
	object_event 12, 41, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMRowan, -1
	object_event 19, 28, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerFIvy, -1
	object_event 17, 55, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47MaxRevive, EVENT_ROUTE_47_MAX_REVIVE
	object_event 41, 55, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47UltraBall, EVENT_ROUTE_47_ULTRA_BALL
	object_event 45, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47FullHeal, EVENT_ROUTE_47_FULL_HEAL
