	object_const_def
	const SAFARIEAST_GRUNT2
	const SAFARIEAST_GRUNTF2

SafariZoneEast_MapScripts:
	def_scene_scripts

	def_callbacks	

SafariGrunt2Script:
	trainer GRUNTM, SAFARI_GRUNT2, EVENT_BEAT_SAFARI_GRUNT2, SafariGrunt2SeenText, SafariGrunt2BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGrunt2AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARIEAST_GRUNT2
	special FadeInFromBlack
	end

SafariGrunt2SeenText:
	text "Seen any rare"
	line "Pokemon?"

	para "If so,"
	line "hand them over."
	done

SafariGrunt2BeatenText:
	text "Ugh!"
	done

SafariGrunt2AfterBattleText:
	text "How is a kid"
	line "so tough..."

	para "I'd better"
	line "report to base!"
	done


SafariGruntf2Script:
	trainer GRUNTF, SAFARI_GRUNTF2, EVENT_BEAT_SAFARI_GRUNTF2, SafariGruntf2SeenText, SafariGruntf2BeatenText, 0, .Script

.Script:
	opentext
	writetext SafariGruntf2AfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARISOUTH_GRUNTF1
	special FadeInFromBlack
	end

SafariGruntf2SeenText:
	text "Hey, some fun!"

	para "Give me your"
	line "money, brat!"
	done

SafariGruntf2BeatenText:
	text "Whoa!"
	done

SafariGruntf2AfterBattleText:
	text "That was rough."

	para "I'd better"
	line "get help!"
	done


SafariZoneEast_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  04, 34, SAFARI_ZONE_SOUTH, 3
	warp_event  04, 35, SAFARI_ZONE_SOUTH, 4

	warp_event  04, 06, SAFARI_ZONE_NORTH, 3
	warp_event  04, 07, SAFARI_ZONE_NORTH, 4

	warp_event  31, 11, SAFARI_HOUSE_EAST, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  22, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 6, SafariGrunt2Script, EVENT_BEAT_SAFARI_GRUNT2
	object_event  20, 08, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, SafariGruntf2Script, EVENT_BEAT_SAFARI_GRUNTF2
