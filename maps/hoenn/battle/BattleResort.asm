	object_const_def

BattleResort_MapScripts:
	def_scene_scripts

	def_callbacks

AshGauntletSign:
	jumptext AshGauntletSignText

AshGauntletSignText:
	text "Ashen Gauntlet"

	para "Burn away your"
	line "weakness."
	done


TreetopTrialSign:
	jumptext TreetopTrialSignText

TreetopTrialSignText:
	text "Treetop Trial"

	para "Learn to Thrive."
	line "Learn to Survive."
	done

BattleResort_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   19, 37, BATTLE_RESORT_POKECENTER, 2
	warp_event   29, 37, BATTLE_RESORT_MART, 2
	;warp_event  05, 13, GRANITE_CAVE_B1F, 1
	;warp_event  17, 23, DEWFORD_BRINEY_HOUSE, 2

	def_coord_events

	def_bg_events	
	bg_event  14, 29, BGEVENT_READ, AshGauntletSign
	bg_event  41, 29, BGEVENT_READ, TreetopTrialSign

	def_object_events
