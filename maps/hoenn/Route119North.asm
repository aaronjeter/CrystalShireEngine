	object_const_def
	const MAPROUTE119_PHIL
	const MAPROUTE119_HUGH
	const MAPROUTE119_FABIAN
	const MAPROUTE119_DAYTON
	const MAPROUTE119_YASU
	const MAPROUTE119_HIDEO
	const MAPROUTE119_RACHEL
	const MAPROUTE119_DANI
	const MAPROUTE119_FRUITREEE5
	const MAPROUTE119_FRUITREEE6

Route119North_MapScripts:
	def_scene_scripts

	def_callbacks	

Route119PhilScript:
	trainer BIRD_KEEPER, ROUTE119_PHIL, EVENT_BEAT_ROUTE119_PHIL, Route119PhilSeenText, Route119PhilBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119PhilAfterBattleText
	waitbutton
	closetext
	end

Route119PhilSeenText:
	text "I'll show you the"
	line "true potential of"
	cont "my bird #mon!"
	done

Route119PhilBeatenText:
	text "We lacked"
	line "potential."
	done

Route119PhilAfterBattleText:
	text "Ever since I was"
	line "a little kid,"

	para "I always admired"
	line "bird #mon."
	done

Route119HughScript:
	trainer BIRD_KEEPER, ROUTE119_HUGH, EVENT_BEAT_ROUTE119_HUGH, Route119HughSeenText, Route119HughBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119HughAfterBattleText
	waitbutton
	closetext
	end

Route119HughSeenText:
	text "The vast sky holds"
	line "untold promise!"
	done

Route119HughBeatenText:
	text "Down and out!"
	done

Route119HughAfterBattleText:
	text "My bird #mon"
	line "made my dreams"

	para "of flying come"
	line "true!"
	done

Route119FabianScript:
	trainer GUITARIST, ROUTE119_FABIAN, EVENT_BEAT_ROUTE119_FABIAN, Route119FabianSeenText, Route119FabianBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119FabianAfterBattleText
	waitbutton
	closetext
	end

Route119FabianSeenText:
	text "Victory is mine!"
	done

Route119FabianBeatenText:
	text "You showed me"
	line "who's the boss!"

	para "We'll have to"
	line "take the loss!"
	done

Route119FabianAfterBattleText:
	text "Leave me alone!"
	done

Route119DaytonScript:
	trainer FIREBREATHER, ROUTE119_DAYTON, EVENT_BEAT_ROUTE119_DAYTON, Route119DaytonSeenText, Route119DaytonBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119DaytonAfterBattleText
	waitbutton
	closetext
	end

Route119DaytonSeenText:
	text "Hohoho!"

	para "Let's have a"
	line "good one!"
	done

Route119DaytonBeatenText:
	text "You're pretty"
	line "amazing!"
	done

Route119DaytonAfterBattleText:
	text "Hohoho!"
	done

Route119YasuScript:
	trainer RANGERM, ROUTE119_YASU, EVENT_BEAT_ROUTE119_YASU, Route119YasuSeenText, Route119YasuBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119YasuAfterBattleText
	waitbutton
	closetext
	end

Route119YasuSeenText:
	text "I emerge to"
	line "challenge you!"
	done

Route119YasuBeatenText:
	text "I admit defeat!"
	done

Route119YasuAfterBattleText:
	text "That, too,"
	line "is destiny..."
	done

Route119HideoScript:
	trainer RANGERM, ROUTE119_HIDEO, EVENT_BEAT_ROUTE119_HIDEO, Route119HideoSeenText, Route119HideoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119HideoAfterBattleText
	waitbutton
	closetext
	end

Route119HideoSeenText:
	text "To hide a tree,"
	line "use a forest!"
	done

Route119HideoBeatenText:
	text "I bow to your"
	line "superiority."
	done

Route119HideoAfterBattleText:
	text "To hide a tree,"
	line "use a forest!"

	para "To hide a #mon"
	line "use a #mon."
	done

Route119RachelScript:
	trainer RANGERF, ROUTE119_RACHEL, EVENT_BEAT_ROUTE119_RACHEL, Route119RachelSeenText, Route119RachelBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119RachelAfterBattleText
	waitbutton
	closetext
	end

Route119RachelSeenText:
	text "Wherever and"
	line "whenever!"
	done

Route119RachelBeatenText:
	text "Oh, but..."
	line "That's not fair."
	done

Route119RachelAfterBattleText:
	text "Your bag is full"
	line "of junk!"
	done

Route119DaniScript:
	trainer RANGERF, ROUTE119_DANI, EVENT_BEAT_ROUTE119_DANI, Route119DaniSeenText, Route119DaniBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route119DaniAfterBattleText
	waitbutton
	closetext
	end

Route119DaniSeenText:
	text "Let's do this!"
	done

Route119DaniBeatenText:
	text "Oh, please, no!"
	done

Route119DaniAfterBattleText:
	text "I got swept"
	line "away!"
	done

Route119FruitTree5:
	fruittree FRUITTREE_ROUTE_119_5

Route119FruitTree6:
	fruittree FRUITTREE_ROUTE_119_6

Route119MaxRevive:
	itemball MAX_REVIVE

Route119PpUp:
	itemball PP_UP

Route119TmRainDance:
	itemball TM_RAIN_DANCE


Route119North_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 22, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, Route119PhilScript, -1
	object_event 27, 09, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119HughScript, -1
	object_event 20, 31, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, Route119FabianScript, -1
	object_event 22, 42, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route119DaytonScript, -1
	object_event 09, 60, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119YasuScript, -1
	object_event 07, 46, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119HideoScript, -1
	object_event 30, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119RachelScript, -1
	object_event 12, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route119DaniScript, -1
	object_event 08, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree5, -1
	object_event 09, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree6, -1
	object_event 19, 49, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119MaxRevive, EVENT_ROUTE_119_MAX_REVIVE
	object_event 07, 09, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119PpUp, EVENT_ROUTE_119_PP_UP
	object_event 28, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119TmRainDance, EVENT_ROUTE_119_TM_RAIN_DANCE

