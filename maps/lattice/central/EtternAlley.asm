	object_const_def
	const ETTERNALLEY_ROCKETM3
	const ETTERNALLEY_ROCKETM4
	const ETTERNALLEY_ROCKETM5
	const ETTERNALLEY_ROCKETM6
	const ETTERNALLEY_ROCKETF2

EtternAlley_MapScripts:
	def_scene_scripts

	def_callbacks	

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	disappear ETTERNALLEY_ROCKETM3
	end

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	disappear ETTERNALLEY_ROCKETM4
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	disappear ETTERNALLEY_ROCKETM5
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	disappear ETTERNALLEY_ROCKETM6
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	disappear ETTERNALLEY_ROCKETF2
	end


GruntM3SeenText:
	text "Oi!"

	para "Alley's closed!"
	done

GruntM3BeatenText:
	text "Too strong! We"
	line "must watch you."
	done

GruntM3AfterBattleText:
	text "You're too strong."

	para "Our plan could be"
	line "ruined. I must"
	cont "warn the others."
	done

GruntM4SeenText:
	text "Don't even think"
	line "about it!"
	done

GruntM4BeatenText:
	text "Gwah! Don't get"
	line "cute!"
	done

GruntM4AfterBattleText:
	text "We won't let you"
	line "ruin our plans!"
	done

GruntM5SeenText:
	text "We're TEAM ROCKET,"
	line "the exploiters of"
	cont "#MON!"

	para "We love being"
	line "evil! Scared?"
	done

GruntM5BeatenText:
	text "You think you're a"
	line "hero?"
	done

GruntM5AfterBattleText:
	text "We're not always"
	line "evil. We just do"
	cont "whatever we like."
	done

GruntM6SeenText:
	text "Hey, hey! Keep out"
	line "of our way!"
	done

GruntM6BeatenText:
	text "Arggh. I give up."
	done

GruntM6AfterBattleText:
	text "Our EXECUTIVES are"
	line "trying to take"
	cont "this place over."

	para "They have some big"
	line "plan. I wonder"
	cont "what that is?"
	done

GruntF2SeenText:
	text "Hahaha!"

	para "How boring."
	line "It was far too"

	para "easy to take over"
	line "this place!"

	para "Come on, keep me"
	line "amused!"
	done

GruntF2BeatenText:
	text "Wh-who are you?"
	done

GruntF2AfterBattleText:
	text "You beat me, and"
	line "I won't forget it!"
	done


EtternAlley_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  06,  04, CENTRAL_CITY, 19
	warp_event  07,  04, CENTRAL_CITY, 20
	warp_event  35,  16, CENTRAL_CITY, 21
	warp_event  35,  17, CENTRAL_CITY, 22

	def_coord_events

	def_bg_events	
	

	def_object_events
	object_event 04, 08, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM3, EVENT_BEAT_ROCKET_GRUNTM_3
	object_event 32, 19, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_BEAT_ROCKET_GRUNTM_4
	object_event 13, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM5, EVENT_BEAT_ROCKET_GRUNTM_5
	object_event 17, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM6, EVENT_BEAT_ROCKET_GRUNTM_6
	object_event 25, 14, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF2, EVENT_BEAT_ROCKET_GRUNTF_2
