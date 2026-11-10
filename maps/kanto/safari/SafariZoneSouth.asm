	object_const_def
	const SAFARISOUTH_GRUNT1
	const SAFARISOUTH_GRUNTF1
	const SAFARISOUTH_GRUNT6
	const SAFARISOUTH_GRUNT7
	const SAFARISOUTH_FAKE_MEW

SafariZoneSouth_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, SafariZoneSouthMonSpritesCallback

SafariZoneSouthMonSpritesCallback:
	setmonsprite SPRITE_MON_2, MEW
	endcallback

SafariGrunt1Script:
	trainer GRUNTS, GRUNTS_SAFARI_S, EVENT_BEAT_GRUNTS_SAFARI_SOUTH, GruntsSafariSSeenText, GruntsSafariSBeatenText, 0, .Script

.Script:
	opentrainerdialog
	writetext GruntsSafariSAfterBattleText
	waitbutton
	closedialog
	special FadeOutToBlack
	disappear SAFARISOUTH_GRUNT1
	disappear SAFARISOUTH_GRUNTF1
	special FadeInFromBlack
	end


SafariGruntf1Script:
	trainer GRUNTS, GRUNTS_SAFARI_S, EVENT_BEAT_GRUNTS_SAFARI_SOUTH, GruntsSafariSSeenText, GruntsSafariSBeatenText, 0, .Script

.Script:
	opentrainerdialog
	writetext GruntsSafariSAfterBattleText
	waitbutton
	closedialog
	special FadeOutToBlack
	disappear SAFARISOUTH_GRUNT1
	disappear SAFARISOUTH_GRUNTF1
	special FadeInFromBlack
	end


SafariGrunt6Script:
	trainer GRUNTM, SAFARI_GRUNT6, EVENT_BEAT_SAFARI_GRUNT6, SafariGrunt6SeenText, SafariGrunt6BeatenText, 0, .Script

.Script:
	opentrainerdialog
	writetext SafariGrunt6AfterBattleText
	waitbutton
	closedialog
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
	opentrainerdialog
	writetext SafariGrunt7AfterBattleText
	waitbutton
	closedialog
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


SafariZoneSouth_FakeMew:
	cry MEW
	disappear SAFARISOUTH_FAKE_MEW
	setevent EVENT_SAFARI_SOUTH_FAKE_MEW
	opentext 
	writetext SafariZoneSouthMewText
	waitbutton
	closetext
	end

SafariZoneSouthMewText:
	text "It's just a"
	line "trick of the"
	cont "light..."
	done


GruntsSafariSSeenText:
	text "Oh, a kid?"

	para "The Safari Zone"
	line "is closed. Scram!"
	done

GruntsSafariSBeatenText:
	text "What the heck?"
	done

GruntsSafariSAfterBattleText:
	text "This is a problem."
	line "We'd better"
	cont "report in!"
	done

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
	object_event 18, 29, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, SafariGrunt1Script, EVENT_BEAT_GRUNTS_SAFARI_SOUTH
	object_event 19, 29, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, SafariGruntf1Script, EVENT_BEAT_GRUNTS_SAFARI_SOUTH
	object_event  19, 05, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, SafariGrunt6Script, EVENT_BEAT_SAFARI_GRUNT6
	object_event  05, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, SafariGrunt7Script, EVENT_BEAT_SAFARI_GRUNT7
	object_event  18, 15, SPRITE_MON_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneSouth_FakeMew, EVENT_SAFARI_SOUTH_FAKE_MEW
