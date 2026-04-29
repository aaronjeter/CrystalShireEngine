	object_const_def
	const MTMOON_KENT
	const MTMOON_IRIS
	const MTMOON_JOVAN
	const MTMOON_ROBBY
	const MTMOON_MIRIAM
	const MTMOON_JOSH
	const MTMOON_MARCOS

MtMoon1F_MapScripts:
	def_scene_scripts

	def_callbacks


TrainerMoonKent:
	trainer BUG_CATCHER, MOON_KENT, EVENT_BEAT_MOON_KENT, TrainerMoonKentSeenText, TrainerMoonKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonKentAfterBattleText
	waitbutton
	closetext
	end

TrainerMoonKentSeenText:
	text "Dang it!"

	para "I hate Zubat"
	line "so much!"
	done

TrainerMoonKentBeatenText:
	text "Ugh!"
	done

TrainerMoonKentAfterBattleText:
	text "I just want to"
	line "catch a stuid"

	para "Jigglypuff..."
	done


TrainerMoonIris:
	trainer LASS, MOON_IRIS, EVENT_BEAT_MOON_IRIS, TrainerMoonIrisSeenText, TrainerMoonIrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonIrisAfterBattleText
	waitbutton
	closetext
	end

TrainerMoonIrisSeenText:
	text "Hey, have you"
	line "seen Mount"
	cont "Moon Square yet?"
	done

TrainerMoonIrisBeatenText:
	text "That was fun!"
	done

TrainerMoonIrisAfterBattleText:
	text "I just saw a"
	line "Clefairy in"
	cont "the square!"
	done


TrainerMoonJovan:
	trainer SUPER_NERD, MOON_JOVAN, EVENT_BEAT_MOON_JOVAN, TrainerMoonJovanSeenText, TrainerMoonJovanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonJovanAfterBattleText
	waitbutton
	closetext
	end

TrainerMoonJovanSeenText:
	text "Hey, who goes"
	line "there!"
	done

TrainerMoonJovanBeatenText:
	text "Ouch!"
	done

TrainerMoonJovanAfterBattleText:
	text "Sorry about"
	line "that, I just"
	cont "got startled."
	done


TrainerMoonRobby:
	trainer BUG_CATCHER, MOON_ROBBY, EVENT_BEAT_MOON_ROBBY, TrainerMoonRobbySeenText, TrainerMoonRobbyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonRobbyAfterBattleText
	waitbutton
	closetext
	end

TrainerMoonRobbySeenText:
	text "I heard there"
	line "are wild Paras"

	para "in here somewhere."
	line "Seen one yet?"
	done

TrainerMoonRobbyBeatenText:
	text "Good practice!"
	done

TrainerMoonRobbyAfterBattleText:
	text "I think Paras"
	line "might be deeper."
	done


TrainerMoonMiriam:
	trainer LASS, MOON_MIRIAM, EVENT_BEAT_MOON_MIRIAM, TrainerMoonMiriamSeenText, TrainerMoonMiriamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonMiriamAfterBattleText
	waitbutton
	closetext
	end

TrainerMoonMiriamSeenText:
	text "Clefairy is so"
	line "freaking cute!"
	done

TrainerMoonMiriamBeatenText:
	text "Awww..."
	done

TrainerMoonMiriamAfterBattleText:
	text "I'm gonna catch"
	line "a Clefairy."
	done


TrainerMoonJosh:
	trainer YOUNGSTER, MOON_JOSH, EVENT_BEAT_MOON_JOSH, TrainerMoonJoshSeenText, TrainerMoonJoshBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonJoshAfterBattleText
	waitbutton
	closetext
	end

TrainerMoonJoshSeenText:
	text "These Geodude"
	line "are good training."
	done

TrainerMoonJoshBeatenText:
	text "Huh."
	done

TrainerMoonJoshAfterBattleText:
	text "I need to train"
	line "more, I guess."
	done


TrainerMoonMarcos:
	trainer HIKER, MOON_MARCOS, EVENT_BEAT_MOON_MARCOS, TrainerMoonMarcosSeenText, TrainerMoonMarcosBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TrainerMoonMarcosAfterBattleText
	waitbutton
	closetext
	end

TrainerMoonMarcosSeenText:
	text "Yo, you like"
	line "Hiking too?"
	done

TrainerMoonMarcosBeatenText:
	text "Ha ha ha!"
	done

TrainerMoonMarcosAfterBattleText:
	text "I'm on my way"
	line "from Cerulean"
	cont "City."
	done


MtMoon1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  15, 33, ROUTE_3, 1
	warp_event  09, 33, MOUNT_MOON_SQUARE, 1
	warp_event  19, 21, MT_MOON_B1F, 1
	warp_event  07, 07, MT_MOON_B1F, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  05, 24, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerMoonKent, -1
	object_event  16, 24, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerMoonIris, -1
	object_event  27, 34, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerMoonJovan, -1
	object_event  23, 19, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerMoonRobby, -1
	object_event  29, 05, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerMoonMiriam, -1
	object_event  14, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerMoonJosh, -1
	object_event  08, 06, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerMoonMarcos, -1
	