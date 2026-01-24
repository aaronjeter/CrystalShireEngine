	object_const_def
	const SAFARIHOUSEEAST_ELI
	const SAFARIHOUSEEAST_RANDAL
	const SAFARIHOUSEEAST_ESPEON
	const SAFARIHOUSEEAST_UMBREON

SafariHouseEast_MapScripts:
	def_scene_scripts

	def_callbacks	

SafariEliScript:
	trainer RANGERM, SAFARI_ELI, EVENT_BEAT_SAFARI_ELI, SafariEliSeenText, SafariEliBeatenText, 0, .Script

.Script:
	opentext
	writetext SafariEliAfterBattleText
	waitbutton
	closetext
	end

SafariEliSeenText:
	text "Rockets!"

	para "Everyone get"
	line "back!"
	done

SafariEliBeatenText:
	text "Huh, how about"
	line "that."
	done

SafariEliAfterBattleText:
	text "Sorry about that."

	para "I thought you"
	line "were with the"
	cont "Rockets."
	done


SafariRandalScript:
	trainer RANGERM, SAFARI_RANDAL, EVENT_BEAT_SAFARI_RANDAL, SafariRandalSeenText, SafariRandalBeatenText, 0, .Script

.Script:
	opentext
	writetext SafariRandalAfterBattleText
	waitbutton
	closetext
	end

SafariRandalSeenText:
	text "You won't get"
	line "my #MON!"
	done

SafariRandalBeatenText:
	text "Oh, you're"
	line "just a kid."
	done

SafariRandalAfterBattleText:
	text "My apologies."
	done

SafariEastHouseEspeon:
	cry ESPEON
	end

SafariEastHouseUmbreon:
	cry UMBREON
	end

SafariHouseEast_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  04, 07, SAFARI_ZONE_EAST, 5
	warp_event  05, 07, SAFARI_ZONE_EAST, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  02, 06, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, SafariEliScript, -1
	object_event  07, 04, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, SafariRandalScript, -1
	object_event  00, 04, SPRITE_ESPEON, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SafariEastHouseEspeon, -1
	object_event  07, 01, SPRITE_UMBREON, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariEastHouseUmbreon, -1
