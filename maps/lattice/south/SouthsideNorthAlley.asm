	object_const_def
	const SOUTHSIDENORTHALLEY_ROCKETM29
	const SOUTHSIDENORTHALLEY_ROCKETM2
	const SOUTHSIDENORTHALLEY_ROCKET_GIRL
	const SOUTHSIDENORTHALLEY_VULPIX

SouthsideNorthAlley_MapScripts:
	def_scene_scripts

	def_callbacks	

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:	
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	disappear SOUTHSIDENORTHALLEY_ROCKETM2
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:	
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	disappear SOUTHSIDENORTHALLEY_ROCKET_GIRL
	end

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:	
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	disappear SOUTHSIDENORTHALLEY_ROCKETM29
	end


GruntM29SeenText:
	text "This stupid"
	line "Vulpix is the"

	para "wrong color."

	para "Let's get some"
	line "dirt on it!"
	done

GruntM29BeatenText:
	text "Arrgh! This is NOT"
	line "my day!"
	done

GruntM29AfterBattleText:
	text "Spoilsport!"

	para "Whatever. I'm"
	line "out of here."
	done


GruntM2SeenText:
	text "Hold it down!"

	para "I'll dump some"
	line "paint on it!"
	done

GruntM2BeatenText:
	text "Just..."
	line "Too strong..."
	done

GruntM2AfterBattleText:
	text "Dude, quit"
	line "messing with"
	cont "our fun!"

	para "It's tough being a"
	line "Rocket Grunt!"
	done

GruntF1SeenText:
	text "Hey! Someone"
	line "is coming!"
	done

GruntF1BeatenText:
	text "You rotten brat!"
	done

GruntF1AfterBattleText:
	text "You shouldn't"
	line "mess with Team"
	cont "Rocket."

	para "We'll mess you"
	line "up!"
	done

SouthsideNorthAlleyVulpix:
	cry VULPIX

	checkevent EVENT_BEAT_ROCKET_GRUNTM_29
	iffalse .Scared
	checkevent EVENT_BEAT_ROCKET_GRUNTM_2
	iffalse .Scared
	checkevent EVENT_BEAT_ROCKET_GRUNTF_1
	iffalse .Scared

	opentext
	writetext SouthsideNorthAlleyRecruitVulpixText	
	yesorno
	iffalse .Done
	givepoke AVULPIX, 5
	setevent GOT_SOUTHSIDE_VULPIX
	disappear SOUTHSIDENORTHALLEY_VULPIX
.Done
	closetext
	end	
.Scared
	opentext
	writetext SouthsideNorthAlleyVulpixScaredText
	promptbutton
	closetext
	end

SouthsideNorthAlleyRecruitVulpixText:
	text "Vulpix looks up"
	line "at you with"

	para "grateful eyes."

	para "Invite it to"
	line "join you?"
	done

SouthsideNorthAlleyVulpixScaredText:
	text "The poor Vulpix"
	line "is shaking with"
	cont "fear."
	done

SouthsideNorthAlley_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  06,  04, CITY_SOUTH, 12
	warp_event  07,  04, CITY_SOUTH, 13

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 05, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM29, EVENT_BEAT_ROCKET_GRUNTM_29
	object_event 06, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM2, EVENT_BEAT_ROCKET_GRUNTM_2
	object_event 07, 14, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_BEAT_ROCKET_GRUNTF_1
	object_event 04, 16, SPRITE_VULPIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_WHITE, OBJECTTYPE_SCRIPT, 0, SouthsideNorthAlleyVulpix, GOT_SOUTHSIDE_VULPIX
