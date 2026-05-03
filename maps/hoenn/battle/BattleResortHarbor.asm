	object_const_def
	const BATTLEHARBOR_LILYCOVEAGENT

BattleResortHarbor_MapScripts:
	def_scene_scripts

	def_callbacks

BattleHarborLilycoveAgentScript:
    faceplayer
	opentext
	writetext BattleHarborLilycoveAgentScriptText
	yesorno
	iffalse BattleHarborNotRidingScript
	writetext BattleHarborSailingText
	promptbutton
	closetext
	special FadeOutToWhite
	waitsfx
	warp LILYCOVE_HARBOR, 12, 07
	end


BattleHarborNotRidingScript:
	writetext BattleHarborNotRidingText
	waitbutton
	closetext
	end

BattleHarborSailingText:
	text "Alright, let's"
	line "get sailing!"
	done


BattleHarborLilycoveAgentScriptText:
	text "Hi, welcome to"
	line "Resort Seaways!"

	para "I can take you"
	line "back to Lilycove."

	para "Shall we depart?"
	done

BattleHarborNotRidingText:
	text "OK."
	line "I'll just be here."
	done

BattleResortHarbor_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   08, 02, BATTLE_RESORT, 8
	warp_event   09, 02, BATTLE_RESORT, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  03, 12, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleHarborLilycoveAgentScript, -1
