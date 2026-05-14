	object_const_def

AshenGauntlet_MapScripts:
	def_scene_scripts

	def_callbacks

AshenGauntletRound1:
	trainer COOLTRAINERM, ASHEN_GAUNTLET1, EVENT_BEAT_ASH_ROUND1, AshenGauntletSeenText, AshenGauntletBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext AshenGauntletAfterBattleText
	waitbutton
	closetext
	end

AshenGauntletRound2:
	trainer COOLTRAINERM, ASHEN_GAUNTLET1, EVENT_BEAT_ASH_ROUND2, AshenGauntletSeenText, AshenGauntletBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext AshenGauntletAfterBattleText
	waitbutton
	closetext
	end

AshenGauntletRound3:
	trainer COOLTRAINERM, ASHEN_GAUNTLET1, EVENT_BEAT_ASH_ROUND3, AshenGauntletSeenText, AshenGauntletBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext AshenGauntletAfterBattleText
	waitbutton
	closetext
	end

AshenGauntletRound4:
	trainer COOLTRAINERM, ASHEN_GAUNTLET1, EVENT_BEAT_ASH_ROUND4, AshenGauntletSeenText, AshenGauntletBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext AshenGauntletAfterBattleText
	waitbutton
	closetext
	end

AshenGauntletRound5:
	trainer COOLTRAINERM, ASHEN_GAUNTLET1, EVENT_BEAT_ASH_ROUND5, AshenGauntletSeenText, AshenGauntletBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext AshenGauntletAfterBattleText
	waitbutton
	closetext
	end

AshenGauntletRound6:
	trainer COOLTRAINERM, ASHEN_GAUNTLET1, EVENT_BEAT_ASH_ROUND6, AshenGauntletSeenText, AshenGauntletBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext AshenGauntletAfterBattleText
	waitbutton
	closetext
	end

AshenGauntletRound7:
	trainer COOLTRAINERM, ASHEN_GAUNTLET1, EVENT_BEAT_ASH_ROUND7, AshenGauntletSeenText, AshenGauntletBeatenText, 0, .Script

.Script:
	special HealParty
	endifjustbattled
	opentext
	writetext AshenGauntletAfterBattleText
	waitbutton
	closetext
	end

AshenGauntletAdminScript:
	opentext
	writetext AshenGauntletIntroText
	yesorno
	iffalse .Done

	readvar VAR_PARTYCOUNT
	ifequal 6, .SixMons

	writetext PartyNotFullText
	waitbutton
	closetext
	end
	

.SixMons
	clearevent EVENT_BEAT_ASH_ROUND1
	clearevent EVENT_BEAT_ASH_ROUND2
	clearevent EVENT_BEAT_ASH_ROUND3
	clearevent EVENT_BEAT_ASH_ROUND4
	clearevent EVENT_BEAT_ASH_ROUND5
	clearevent EVENT_BEAT_ASH_ROUND6
	clearevent EVENT_BEAT_ASH_ROUND7
	special FadeOutToWhite
	waitsfx
	warpfacing UP, ASHEN_GAUNTLET, 25, 20

	.Done
	closetext	
	end


AshenGauntletExitScript:
	opentext
	writetext AshenGauntletExitText
	waitbutton
	verbosegiveitem MARVEL_SCALE
	closetext
	special FadeOutToWhite
	waitsfx
	warp ASHEN_GAUNTLET, 12, 23
	end

AshenGauntletIntroText:
	text "Welcome to the"
	line "Ashen Gauntlet!"

	para "Pick six"
	line "#mon and"
	cont "prove yourself!"

	para "There's a prize"
	line "waiting at the"
	cont "end!"

	para "Would you like"
	line "to compete?"
	done

PartyNotFullText:
	text "Please come back"
	line "with exactly"
	cont "six #mon."
	done

AshenGauntletSeenText:
	text "Good luck!"
	done

AshenGauntletBeatenText:
	text "Aww!"
	done

AshenGauntletAfterBattleText:
	text "Good luck!"
	done

AshenGauntletExitText:
	text "Great Job!"
	done

AshenGauntlet_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 18, 35, BATTLE_RESORT, 5
	warp_event 19, 35, BATTLE_RESORT, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event 19, 24, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AshenGauntletAdminScript, -1
	object_event 13, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, AshenGauntletRound1, -1
	object_event 13, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, AshenGauntletRound2, -1
	object_event 24, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, AshenGauntletRound3, -1
	object_event 24, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, AshenGauntletRound4, -1
	object_event 13, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, AshenGauntletRound5, -1
	object_event 13, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, AshenGauntletRound6, -1
	object_event 24,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, AshenGauntletRound7, -1
	object_event 12,  4, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AshenGauntletExitScript, -1
	
