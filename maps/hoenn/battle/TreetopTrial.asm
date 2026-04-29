	object_const_def

TreetopTrial_MapScripts:
	def_scene_scripts

	def_callbacks

TreetopTrialRound1:
	trainer RANGERM, TREETOP_TRIAL1, EVENT_BEAT_TREETOP_ROUND1, TreetopTrialSeenText, TreetopTrialBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext TreetopTrialAfterBattleText
	waitbutton
	closetext
	end

TreetopTrialRound2:
	trainer RANGERM, TREETOP_TRIAL1, EVENT_BEAT_TREETOP_ROUND2, TreetopTrialSeenText, TreetopTrialBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext TreetopTrialAfterBattleText
	waitbutton
	closetext
	end

TreetopTrialRound3:
	trainer RANGERM, TREETOP_TRIAL1, EVENT_BEAT_TREETOP_ROUND3, TreetopTrialSeenText, TreetopTrialBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext TreetopTrialAfterBattleText
	waitbutton
	closetext
	end

TreetopTrialRound4:
	trainer RANGERM, TREETOP_TRIAL1, EVENT_BEAT_TREETOP_ROUND4, TreetopTrialSeenText, TreetopTrialBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext TreetopTrialAfterBattleText
	waitbutton
	closetext
	end

TreetopTrialRound5:
	trainer RANGERM, TREETOP_TRIAL1, EVENT_BEAT_TREETOP_ROUND5, TreetopTrialSeenText, TreetopTrialBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext TreetopTrialAfterBattleText
	waitbutton
	closetext
	end

TreetopTrialRound6:
	trainer RANGERM, TREETOP_TRIAL1, EVENT_BEAT_TREETOP_ROUND6, TreetopTrialSeenText, TreetopTrialBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext TreetopTrialAfterBattleText
	waitbutton
	closetext
	end

TreetopTrialRound7:
	trainer RANGERM, TREETOP_TRIAL1, EVENT_BEAT_TREETOP_ROUND7, TreetopTrialSeenText, TreetopTrialBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext TreetopTrialAfterBattleText
	waitbutton
	closetext
	end

TreetopTrialAdminScript:
	opentext
	writetext TreetopTrialIntroText
	yesorno
	iffalse .Done

	readvar VAR_PARTYCOUNT
	ifequal 3, .ThreeMons

	writetext PartyFullText
	waitbutton
	closetext
	end
	

.ThreeMons
	clearevent EVENT_BEAT_TREETOP_ROUND1
	clearevent EVENT_BEAT_TREETOP_ROUND2
	clearevent EVENT_BEAT_TREETOP_ROUND3
	clearevent EVENT_BEAT_TREETOP_ROUND4
	clearevent EVENT_BEAT_TREETOP_ROUND5
	clearevent EVENT_BEAT_TREETOP_ROUND6
	clearevent EVENT_BEAT_TREETOP_ROUND7
	warp TREETOP_TRIAL, 24, 18

	.Done
	closetext	
	end


TreetopTrialExitScript:
	opentext
	writetext TreetopTrialExitText
	waitbutton
	verbosegiveitem MARVEL_SCALE
	closetext

	warp TREETOP_TRIAL, 13, 24
	end

TreetopTrialIntroText:
	text "Welcome to the"
	line "Treetop Trial!"

	para "Pick three"
	line "#mon and"
	cont "prove yourself!"

	para "There's a prize"
	line "waiting at the"
	cont "end!"

	para "Would you like"
	line "to compete?"
	done

PartyFullText:
	text "Please come back"
	line "with exactly"
	cont "three #mon."
	done

TreetopTrialSeenText:
	text "Good luck!"
	done

TreetopTrialBeatenText:
	text "Aww!"
	done

TreetopTrialAfterBattleText:
	text "Good luck!"
	done

TreetopTrialExitText:
	text "Great Job!"
	done

TreetopTrial_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   18, 33, BATTLE_RESORT, 3
	warp_event   19, 33, BATTLE_RESORT, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 19, 24, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TreetopTrialAdminScript, -1
	object_event 32, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TreetopTrialRound1, -1
	object_event 25, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TreetopTrialRound2, -1
	object_event 32, 06, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TreetopTrialRound3, -1
	object_event 24, 04, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TreetopTrialRound4, -1
	object_event 07, 06, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TreetopTrialRound5, -1
	object_event 14, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TreetopTrialRound6, -1
	object_event 07, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TreetopTrialRound7, -1
	object_event 15, 18, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TreetopTrialExitScript, -1
	
