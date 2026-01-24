	object_const_def
	const SAFARISOUTH_GRUNT1
	const SAFARISOUTH_GRUNTF1
	const SAFARISOUTH_GRUNT6
	const SAFARISOUTH_GRUNT7
	const SAFARINORTH_CHANSEY

SafariZoneSouth_MapScripts:
	def_scene_scripts

	def_callbacks	


SafariGrunt1Script:
	trainer GRUNTM, SAFARI_GRUNT1, EVENT_BEAT_SAFARI_GRUNT1, SafariGrunt1SeenText, SafariGrunt1BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGrunt1AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARISOUTH_GRUNT1
	special FadeInFromBlack
	end

SafariGrunt1SeenText:
	text "Oh, what's this?"

	para "Safari Zone"
	line "Is closed."

	para "Scram!"
	done

SafariGrunt1BeatenText:
	text "Oof!"
	done

SafariGrunt1AfterBattleText:
	text "This could be"
	line "a problem."

	para "I'd better"
	line "report in!"
	done


SafariGruntf1Script:
	trainer GRUNTF, SAFARI_GRUNTF1, EVENT_BEAT_SAFARI_GRUNTF1, SafariGruntf1SeenText, SafariGruntf1BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGruntf1AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARISOUTH_GRUNTF1
	special FadeInFromBlack
	end

SafariGruntf1SeenText:
	text "Huh, a kid."
	done

SafariGruntf1BeatenText:
	text "What the heck?"
	done

SafariGruntf1AfterBattleText:
	text "Too strong."

	para "I'd better"
	line "get help!"
	done


SafariGrunt6Script:
	trainer GRUNTM, SAFARI_GRUNT6, EVENT_BEAT_SAFARI_GRUNT6, SafariGrunt6SeenText, SafariGrunt6BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGrunt6AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARISOUTH_GRUNT6
	special FadeInFromBlack
	end

SafariGrunt6SeenText:
	text "Lost?"

	para "Let me send"
	line "you home."
	done

SafariGrunt6BeatenText:
	text "Arg!"
	done

SafariGrunt6AfterBattleText:
	text "This could be"
	line "a problem."

	para "I'd better"
	line "report in!"
	done


SafariGrunt7Script:
	trainer GRUNTM, SAFARI_GRUNT7, EVENT_BEAT_SAFARI_GRUNT7, SafariGrunt7SeenText, SafariGrunt7BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGrunt7AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARISOUTH_GRUNT7
	special FadeInFromBlack
	end

SafariGrunt7SeenText:
	text "Well, well, well."

	para "I heard we had"
	line "a guest..."
	done

SafariGrunt7BeatenText:
	text "Dang!"
	done

SafariGrunt7AfterBattleText:
	text "Stronger than"
	line "you look..."

	para "I'd better"
	line "report in!"
	done


SafariZoneSouth_Chansey:
	cry CHANSEY
	loadwildmon CHANSEY, 7
	startbattle
	reloadmapafterbattle
	disappear SAFARINORTH_CHANSEY
	end


SafariZoneSouth_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  18, 33, FUCHSIA_CITY, 7
	warp_event  19, 33, FUCHSIA_CITY, 7

	warp_event  35, 14, SAFARI_ZONE_EAST, 1
	warp_event  35, 15, SAFARI_ZONE_EAST, 2

	warp_event  20, 04, SAFARI_ZONE_NORTH, 1
	warp_event  21, 04, SAFARI_ZONE_NORTH, 2 

	warp_event  04, 14, SAFARI_ZONE_WEST, 1
	warp_event  04, 15, SAFARI_ZONE_WEST, 2 

	warp_event  25, 27, SAFARI_HOUSE_SOUTH, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  17, 29, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, SafariGrunt1Script, EVENT_BEAT_SAFARI_GRUNT1
	object_event  20, 29, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, SafariGruntf1Script, EVENT_BEAT_SAFARI_GRUNTF1
	object_event  19, 05, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, SafariGrunt6Script, EVENT_BEAT_SAFARI_GRUNT6
	object_event  05, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, SafariGrunt7Script, EVENT_BEAT_SAFARI_GRUNT7
	object_event  31, 07, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SafariZoneSouth_Chansey, -1
