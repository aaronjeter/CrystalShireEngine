	object_const_def
	const EVERGRANDE_WALLY

EvergrandeCity_MapScripts:
	def_scene_scripts

	def_callbacks

Evergrande_Wally:
	trainer WALLY, WALLY6, EVENT_FOUND_VICTORY_ROAD_WALLY, EvergrandeWallySeenText, EvergrandeWallyBeatenText, 0, .Script

.Script:
	opentext
	writetext EvergrandeWallyAfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear EVERGRANDE_WALLY
	special FadeInFromBlack
	end

EvergrandeWallySeenText:
	text "I knew it!"
	line "I knew you'd"
	cont "make it!"

	para "This is it!"
	line "The championship"
	cont "awaits."

	para "One last match?"
	line "For all the"
	cont "marbles?"
	done

EvergrandeWallyBeatenText:
	text "Oof!"
	done

EvergrandeWallyAfterBattleText:
	text "You're amazing"
	line "<PLAY_G>."

	para "You're gonna be"
	line "a great champ."

	para "I'm really"
	line "proud of you..."

	para "Good luck in"
	line "there!"
	done

EvergrandeCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 29, 43, EVERGRANDE_POKECENTER, 2
	warp_event 16, 05, HOENN_POKELEAGUE, 2
	warp_event 17, 35, EVERGRANDE_DUNGEON, 1
	warp_event 15, 19, EVERGRANDE_DUNGEON, 2
	def_coord_events

	def_bg_events	

	def_object_events
	object_event  18, 20, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Evergrande_Wally, EVENT_FOUND_VICTORY_ROAD_WALLY
