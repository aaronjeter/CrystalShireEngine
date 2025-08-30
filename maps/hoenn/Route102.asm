	object_const_def
	const MAPROUTE102_CALVIN
	const MAPROUTE102_ALLEN
	const MAPROUTE102_RICK
	const MAPROUTE102_TIANA


Route102_MapScripts:
	def_scene_scripts

	def_callbacks	

Route102CalvinScript:
	trainer YOUNGSTER, ROUTE102_CALVIN, EVENT_BEAT_ROUTE102_CALVIN, Route102CalvinSeenText, Route102CalvinBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route102CalvinAfterBattleText
	waitbutton
	closetext
	end

Route102CalvinSeenText:
	text "Hi! I'm Calvin!"
	done

Route102CalvinBeatenText:
	text "Trainer battles"
	line "are fun!"
	done

Route102CalvinAfterBattleText:
	text "It's always fun"
	line "to practice"
	cont "on someone good!"
	done


Route102AllenScript:
	trainer YOUNGSTER, ROUTE102_ALLEN, EVENT_BEAT_ROUTE102_ALLEN, Route102AllenSeenText, Route102AllenBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route102AllenAfterBattleText
	waitbutton
	closetext
	end

Route102AllenSeenText:
	text "Shh!"

	para "I'm trying to"
	line "catch a #MON!"
	done

Route102AllenBeatenText:
	text "I guess it"
	line "ran away."
	done

Route102AllenAfterBattleText:
	text "Sometimes they"
	line "run away."

	para "So annoying..."
	done


Route102RickScript:
	trainer BUG_CATCHER, ROUTE102_RICK, EVENT_BEAT_ROUTE102_RICK, Route102RickSeenText, Route102RickBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route102RickAfterBattleText
	waitbutton
	closetext
	end

Route102RickSeenText:
	text "Bug #MON evolve"
	line "young. So they get"

	para "stronger that much"
	line "faster."
	done

Route102RickBeatenText:
	text "Just evolving"
	line "isn't enough!"
	done

Route102RickAfterBattleText:
	text "#MON become"
	line "stronger if they"
	cont "evolve. Really!"
	done


Route102TianaScript:
	trainer LASS, ROUTE102_TIANA, EVENT_BEAT_ROUTE102_TIANA, Route102TianaSeenText, Route102TianaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route102TianaAfterBattleText
	waitbutton
	closetext
	end

Route102TianaSeenText:
	text "I'm tired of"
	line "all these bugs."

	para "Let's do this!"
	done

Route102TianaBeatenText:
	text "Ugh..."
	done

Route102TianaAfterBattleText:
	text "I thought I"
	line "was ready for"
	cont "trainer battles."
	done

Route102_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  32,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route102CalvinScript, -1
	object_event  19, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route102AllenScript, -1
	object_event  12, 11, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route102RickScript, -1
	object_event   6,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, Route102TianaScript, -1
	