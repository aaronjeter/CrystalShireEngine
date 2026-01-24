	object_const_def
	const SAFARIHOUSENORTH_RACHAEL
	const SAFARIHOUSENORTH_NURSE

SafariHouseNorth_MapScripts:
	def_scene_scripts

	def_callbacks	

SafariRachaelScript:
	trainer RANGERF, SAFARI_RACHAEL, EVENT_BEAT_SAFARI_RACHAEL, SafariRachaelSeenText, SafariRachaelBeatenText, 0, .Script

.Script:
	opentext
	writetext SafariRachaelAfterBattleText
	waitbutton
	closetext
	end

SafariRachaelSeenText:
	text "Fresh Meat!"
	done

SafariRachaelBeatenText:
	text "Oh, you aren't"
	line "the new recruit."
	done

SafariRachaelAfterBattleText:
	text "Rockets?"

	para "I don't think"
	line "They've made"

	para "it this far"
	line "North yet."
	done


SafariHouseNorthNurseScript:
    faceplayer
	opentext
	writetext Text_SafariHouseNorthNurse
	waitbutton
	closetext
	special FadeOutToBlack
	pause 12
	special HealParty
	special FadeInFromBlack	
	end

Text_SafariHouseNorthNurse:
	text "You look"
	line "exhausted."

	para "Let me heal up"
	line "your party."
	done


SafariHouseNorth_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  04, 07, SAFARI_ZONE_NORTH, 9
	warp_event  05, 07, SAFARI_ZONE_NORTH, 9

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  04, 04, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, SafariRachaelScript, -1
	object_event  00, 03, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariHouseNorthNurseScript, -1
	