	object_const_def
	const LILYCOVEHARBOR_TOURIST1
	const LILYCOVEHARBOR_TOURIST2
	const LILYCOVEHARBOR_AGENT

LilycoveHarbor_MapScripts:
	def_scene_scripts

	def_callbacks

LilycoveHarborTourist1Script:
	jumptextfaceplayer LilycoveHarborTourist1Text

LilycoveHarborTourist1Text:
	text "I'm going to"
	line "take on the"
	cont "Battle Resort."

	para "They only let"
	line "the best of the"
	cont "best in..."
	done


LilycoveHarborTourist2Script:
	jumptextfaceplayer LilycoveHarborTourist2Text

LilycoveHarborTourist2Text:
	text "I've beaten a"
	line "lot of gyms"
	cont "over the years."

	para "I hope 22"
	line "badges is"
	cont "enough..."
	done


LilycoveHarborAgentScript:
	jumptextfaceplayer LilycoveHarborAgentScriptText

LilycoveHarborAgentScriptText:
	text "Hi, welcome to"
	line "Resort Seaways!"

	para "We take eligible"
	line "trainers to"

	para "compete in the"
	line "Battle Resort."

	para "..."

	para "Sorry, we don't"
	line "take scrubs."
	done

LilycoveHarbor_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   04, 15, LILYCOVE_CITY, 4
	warp_event   05, 15, LILYCOVE_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  03, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LilycoveHarborTourist1Script, -1
	object_event  05, 05, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LilycoveHarborTourist2Script, -1
	object_event  13, 07, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LilycoveHarborAgentScript, -1
