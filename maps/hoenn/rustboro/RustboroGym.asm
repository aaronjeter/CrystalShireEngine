	object_const_def
	const RUSTBOROGYM_ROXANNE
	const RUSTBOROGYM_JOSH
	const RUSTBOROGYM_TOMMY
	const RUSTBOROGYM_MARC

RustboroGym_MapScripts:
	def_scene_scripts

	def_callbacks	

RustboroJosh:
	trainer YOUNGSTER, RUSTBORO_JOSH, EVENT_BEAT_RUSTBORO_JOSH, RustboroJoshSeenText, RustboroJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext RustboroJoshAfterBattleText
	waitbutton
	closetext
	end

RustboroJoshSeenText:
	text "Don't take us"
	line "lightly."

	para "Gym Trainers are"
	line "built different!"
	done

RustboroJoshBeatenText:
	text "You were too"
	line "good for me."
	done

RustboroJoshAfterBattleText:
	text "You haven't seen"
	line "anything of the"
	cont "Rock type's"
	cont "terrifying power!"
	done


RustboroTommy:
	trainer YOUNGSTER, RUSTBORO_TOMMY, EVENT_BEAT_RUSTBORO_TOMMY, RustboroTommySeenText, RustboroTommyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext RustboroTommyAfterBattleText
	waitbutton
	closetext
	end

RustboroTommySeenText:
	text "If you can't beat"
	line "me you don't"
	cont "stand a chance"
	cont "against Roxanne!"
	done

RustboroTommyBeatenText:
	text "Wow! You've got"
	line "potential."
	done

RustboroTommyAfterBattleText:
	text "Roxanne is many"
	line "times stronger"
	cont "than I am."
	done


RustboroMarc:
	trainer HIKER, RUSTBORO_MARC, EVENT_BEAT_RUSTBORO_MARC, RustboroMarcSeenText, RustboroMarcBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext RustboroMarcAfterBattleText
	waitbutton
	closetext
	end

RustboroMarcSeenText:
	text "My Rock types"
	line "need to rampage!"
	done

RustboroMarcBeatenText:
	text "Oh man, you're"
	line "feisty!"
	done

RustboroMarcAfterBattleText:
	text "I have to hand"
	line "it to our leader."

	para "It took guts to"
	line "pick Rock types."

	para "Especially for"
	line "someone so young."
	done

RustboroGymRoxanneScript:
	faceplayer	
	checkflag ENGINE_STONEBADGE
	iftrue .FightDone
	opentext
	writetext RoxanneText_PreFight
	promptbutton
	closetext
	scall RoxanneFight
	opentext
	scall RoxanneGiveBadge
	scall RoxanneGiveTm
	writetext RoxannePostBattleText
	promptbutton
	closetext
	end

.FightDone:	
	opentext
	scall RoxanneGiveTm
	closetext
	scall RoxanneRematch
	end


RoxanneRematch:
	opentext
	writetext RoxanneRematchText
	yesorno
	iffalse .FightDoneText
	closetext
	scall RoxanneFight
	opentext
.FightDoneText:	
	writetext RoxannePostBattleText
	promptbutton
.EndRematch:
	closetext
	end

RoxanneGiveTm:
	checkitem TM_ROCK_TOMB
	iftrue .Done
	writetext RoxanneExplainTMText
	promptbutton
	verbosegiveitem TM_ROCK_TOMB
.Done	
	end

RoxanneGiveBadge:	
	setevent EVENT_BEAT_ROXANNE	
	writetext RoxanneText_ExplainBadge	
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STONEBADGE
	scall RustboroGymLevelcap

	;disable gym trainers
	setevent EVENT_BEAT_RUSTBORO_JOSH
	setevent EVENT_BEAT_RUSTBORO_TOMMY
	setevent EVENT_BEAT_RUSTBORO_MARC	
	end

RoxanneFight:
	readvar VAR_BADGES
	ifgreater 13, .Hard
	ifgreater 3, .Medium
	sjump .Easy

.Hard
	winlosstext RoxanneWinLossText, 0
	loadtrainer LEADERROXANNE, ROXANNE3
	sjump .Fight

.Medium
	winlosstext RoxanneWinLossText, 0
	loadtrainer LEADERROXANNE, ROXANNE2
	sjump .Fight


.Easy
	winlosstext RoxanneWinLossText, 0
	loadtrainer LEADERROXANNE, ROXANNE1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	end

RustboroGymLevelcap:
	jumpstd UpdateWorldLevelsScript
	end


RoxanneText_PreFight:
	text "Hello, I am"
	line "Roxanne, the"
	cont "Gym Leader of"
	cont "Rustboro City."

	para "I became a "
	line "trainer to apply"
	cont "what I learned"
	cont "at the Trainer"
	cont "School."

	para "Please, show"
	line "me what you"
	cont "can do."
	done

RoxanneWinLossText:
	text "So...I lost..."

	para "It seems I have"
	line "yet more to"
	cont "learn."
	done

RoxanneText_ExplainBadge:
	text "Please accept the"
	line "Stone Badge."

	para "It serves as"
	line "proof of your"
	cont "victory today."
	done

RoxanneRematchText:
	text "Rematch?"
	done

RoxanneRematchWinLossText:
	text "Well Done!"
	done

RoxannePostBattleText:
	text "Since you are"
	line "so strong, you"
	cont "should challenge"
	
	para "other Gym"
	line "Leaders. I'm"
	cont "sure you will"
	cont "learn from them."
	done

RoxanneExplainTMText:
	text "Rock Tomb is"
	line "my favorite move."

	para "Please use this"
	line "TM to teach your"
	cont "#mon."
	done

RustboroGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 19, RUSTBORO_CITY, 1
	warp_event  5, 19, RUSTBORO_CITY, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  7,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RustboroGymRoxanneScript, -1
	object_event  7, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, RustboroJosh, -1
	object_event  3, 08, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, RustboroTommy, -1
	object_event 11, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, RustboroMarc, -1
	