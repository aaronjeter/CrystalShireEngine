	object_const_def
	const SAFARIHOUSESOUTH_MONICA
	const SAFARIHOUSESOUTH_NURSE
	const SAFARIHOUSESOUTH_TWIN
	const SAFARIHOUSESOUTH_JIGGLYPUFF

SafariHouseSouth_MapScripts:
	def_scene_scripts

	def_callbacks	

SafariMonicaScript:
	trainer RANGERF, SAFARI_MONICA, EVENT_BEAT_SAFARI_MONICA, SafariMonicaSeenText, SafariMonicaBeatenText, 0, .Script

.Script:
	opentext
	writetext SafariMonicaAfterBattleText
	waitbutton
	closetext
	end

SafariMonicaSeenText:
	text "Rockets!"

	para "Everyone get"
	line "back!"
	done

SafariMonicaBeatenText:
	text "Oh!"
	done

SafariMonicaAfterBattleText:
	text "Sorry, we're all"
	line "a bit jumpy with"

	para "the Rockets"
	line "invading."
	done

SafariSouthHouseTwin:
	jumptextfaceplayer Text_SafariSouthHouseTwin

Text_SafariSouthHouseTwin:
	text "Hi there!"

	para "Do you like my"
	line "Jigglypuff"
	done

SafariSouthHouseJigglypuff:
	cry JIGGLYPUFF
	end

SafariSouthHouseNurseScript:
	opentext
	writetext Text_SafariSouthHouseNurse
	waitbutton
	closetext
	special FadeOutToBlack
	pause 12
	special HealParty
	special FadeInFromBlack	
	end

Text_SafariSouthHouseNurse:
	text "You look"
	line "exhausted."

	para "Let me heal up"
	line "your party."
	done


SafariHouseSouth_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  04, 07, SAFARI_ZONE_SOUTH, 9
	warp_event  05, 07, SAFARI_ZONE_SOUTH, 9

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  02, 07, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, SafariMonicaScript, -1
	object_event  09, 04, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SafariSouthHouseNurseScript, -1
	object_event  02, 01, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SafariSouthHouseTwin, -1
	object_event  03, 01, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SafariSouthHouseJigglypuff, -1
