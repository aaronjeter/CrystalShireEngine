	object_const_def
	const MTMOON_MIGUEL
	const MTMOON_GRUNT1
	const MTMOON_GRUNT2
	const MTMOON_GRUNT3
	const MTMOON_GRUNT4
	const MTMOON_LUNATONE
	const MTMOON_CLEFAIRY

MtMoonB2F_MapScripts:
	def_scene_scripts

	def_callbacks	

TrainerMoonMiguel:
	trainer SUPER_NERD, MOON_MIGUEL, EVENT_BEAT_MOON_MIGUEL, TrainerMoonMiguelSeenText, TrainerMoonMiguelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonMiguelAfterBattleText
	waitbutton
	closetext
	end

TrainerMoonMiguelSeenText:
	text "Hey, do you"
	line "see any Fossils?"
	done

TrainerMoonMiguelBeatenText:
	text "Whew!"
	done

TrainerMoonMiguelAfterBattleText:
	text "I found some"
	line "Fossils here"
	cont "a while back."
	done


TrainerMoonGrunt1:
	trainer GRUNTM, MOON_GRUNT1, EVENT_BEAT_MOON_GRUNT1, TrainerMoonGrunt1SeenText, TrainerMoonGrunt1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonGrunt1AfterBattleText
	waitbutton
	closetext
	end

TrainerMoonGrunt1SeenText:
	text "What's a little"
	line "kid doing here?"
	done

TrainerMoonGrunt1BeatenText:
	text "Dang you!"
	done

TrainerMoonGrunt1AfterBattleText:
	text "We're looking for"
	line "Fossils here."

	para "You'd better give"
	line "us any you find."
	done


TrainerMoonGrunt2:
	trainer GRUNTM, MOON_GRUNT2, EVENT_BEAT_MOON_GRUNT2, TrainerMoonGrunt2SeenText, TrainerMoonGrunt2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonGrunt2AfterBattleText
	waitbutton
	closetext
	end

TrainerMoonGrunt2SeenText:
	text "Give me all"
	line "your cash!"
	done

TrainerMoonGrunt2BeatenText:
	text "You brat!"
	done

TrainerMoonGrunt2AfterBattleText:
	text "We're looking for"
	line "Fossils here."

	para "You'd better give"
	line "us any you find."
	done


TrainerMoonGrunt3:
	trainer GRUNTM, MOON_GRUNT3, EVENT_BEAT_MOON_GRUNT3, TrainerMoonGrunt3SeenText, TrainerMoonGrunt3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonGrunt3AfterBattleText
	waitbutton
	closetext
	end

TrainerMoonGrunt3SeenText:
	text "Get out of"
	line "my way!"
	done

TrainerMoonGrunt3BeatenText:
	text "Dang it!"
	done

TrainerMoonGrunt3AfterBattleText:
	text "We're looking for"
	line "Fossils here."

	para "You'd better give"
	line "us any you find."
	done


TrainerMoonGrunt4:
	trainer GRUNTM, MOON_GRUNT4, EVENT_BEAT_MOON_GRUNT4, TrainerMoonGrunt4SeenText, TrainerMoonGrunt4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonGrunt4AfterBattleText
	waitbutton
	closetext
	end

TrainerMoonGrunt4SeenText:
	text "Ooo, a trainer!"
	done

TrainerMoonGrunt4BeatenText:
	text "Dang it!"
	done

TrainerMoonGrunt4AfterBattleText:
	text "We're looking for"
	line "Fossils here."

	para "You'd better give"
	line "us any you find."
	done


MoonLunatone:
	cry LUNATONE
	loadwildmon LUNATONE, 10
	startbattle
	reloadmapafterbattle
	disappear MTMOON_LUNATONE
	closetext
	end

MoonClefairy:
	cry CLEFAIRY
	loadwildmon CLEFAIRY, 7
	startbattle
	reloadmapafterbattle
	disappear MTMOON_CLEFAIRY
	end


MtMoonB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  25, 15, MT_MOON_B1F, 2
	warp_event  23, 27, MT_MOON_B1F, 4
	warp_event  06, 11, MT_MOON_B1F, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  15, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerMoonMiguel, -1
	object_event  31, 12, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerMoonGrunt1, -1
	object_event  27, 27, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerMoonGrunt2, -1
	object_event  06, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerMoonGrunt3, -1
	object_event  16, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerMoonGrunt4, -1
	object_event  29, 08, SPRITE_LUNATONE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoonLunatone, -1
	object_event  19, 30, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MoonClefairy, -1
