	object_const_def
	const PETALBURGGYM_NORMAN
	const PETALBURGGYM_RANDALL
	const PETALBURGGYM_MARY
	const PETALBURGGYM_PARKER
	const PETALBURGGYM_LORI
	const PETALBURGGYM_GEORGE
	const PETALBURGGYM_JODY

PetalburgGym_MapScripts:
	def_scene_scripts

	def_callbacks	

PetalburgGymNormanScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_NORMAN
	iftrue .FightDone
	writetext NormanText_PreFight
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 3, .Hard
	sjump .Easy

.Hard
	winlosstext NormanWinLossText, 0
	loadtrainer LEADERNORMAN, NORMAN2
	sjump .Fight

.Easy
	winlosstext NormanWinLossText, 0
	loadtrainer LEADERNORMAN, NORMAN1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_NORMAN
	opentext
	writetext NormanText_ExplainBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BALANCEBADGE
	readvar VAR_BADGES
	scall PetalburgGymActivateRockets

	;disable gym trainers
	setevent EVENT_BEAT_PETALBURG_RANDALL
	setevent EVENT_BEAT_PETALBURG_MARY
	setevent EVENT_BEAT_PETALBURG_PARKER
	setevent EVENT_BEAT_PETALBURG_LORI
	setevent EVENT_BEAT_PETALBURG_GEORGE
	setevent EVENT_BEAT_PETALBURG_JODY

	readmem wBaseLevel
	addval 3
	writemem wBaseLevel

	checkevent EVENT_LEVELCAPS_ENABLED
	iffalse .SkipLevelCaps 
	readmem wLevelCap
	addval 3
	writemem wLevelCap

.SkipLevelCaps:
	readmem wWildLevel
	addval 3
	writemem wWildLevel

	closetext
	end

.FightDone:
	writetext NormanRematchText
	yesorno
	iffalse .FightDoneText

	readvar VAR_BADGES
	ifgreater 3, .HardRematch
	sjump .EasyRematch

.HardRematch
	winlosstext NormanRematchWinLossText, 0
	loadtrainer LEADERNORMAN, NORMAN2
	sjump .Rematch

.EasyRematch
	winlosstext NormanRematchWinLossText, 0
	loadtrainer LEADERNORMAN, NORMAN1
	sjump .Rematch

.Rematch	
	startbattle
	reloadmapafterbattle
	opentext
.FightDoneText
	writetext NormanPostBattleText
	waitbutton
	closetext
	end

PetalburgGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript


PetalburgRandall:
	trainer COOLTRAINERM, PETALBURG_RANDALL, EVENT_BEAT_PETALBURG_RANDALL, PetalburgRandallSeenText, PetalburgRandallBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PetalburgRandallAfterBattleText
	waitbutton
	closetext
	end

PetalburgRandallSeenText:
	text "I'll show you"
	line "just how scary"
	cont "NORMAL types are!"
	done

PetalburgRandallBeatenText:
	text "Ouch!"

	para "You're good!"
	done

PetalburgRandallAfterBattleText:
	text "I really thought"
	line "I had you there."
	done


PetalburgMary:
	trainer COOLTRAINERF, PETALBURG_MARY, EVENT_BEAT_PETALBURG_MARY, PetalburgMarySeenText, PetalburgMaryBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PetalburgMaryAfterBattleText
	waitbutton
	closetext
	end

PetalburgMarySeenText:
	text "I'm going to"
	line "send you home"
	cont "crying!"
	done

PetalburgMaryBeatenText:
	text "Dang it!"

	para "You're too strong!"
	done

PetalburgMaryAfterBattleText:
	text "I really thought"
	line "I had a chance..."
	done

PetalburgParker:
	trainer COOLTRAINERM, PETALBURG_PARKER, EVENT_BEAT_PETALBURG_PARKER, PetalburgParkerSeenText, PetalburgParkerBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PetalburgParkerAfterBattleText
	waitbutton
	closetext
	end

PetalburgParkerSeenText:
	text "I'm just here"
	line "for fun."

	para "Let's do this!"
	done

PetalburgParkerBeatenText:
	text "Woah!"

	para "Good Fight!"
	done

PetalburgParkerAfterBattleText:
	text "Thanks!"
	line "I learned a lot!"
	done

PetalburgLori:
	trainer COOLTRAINERF, PETALBURG_LORI, EVENT_BEAT_PETALBURG_LORI, PetalburgLoriSeenText, PetalburgLoriBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PetalburgLoriAfterBattleText
	waitbutton
	closetext
	end

PetalburgLoriSeenText:
	text "Ok..."
	line "I'm ready."
	done

PetalburgLoriBeatenText:
	text "Oh well..."
	done

PetalburgLoriAfterBattleText:
	text "I need practice..."
	done


PetalburgGeorge:
	trainer COOLTRAINERM, PETALBURG_GEORGE, EVENT_BEAT_PETALBURG_GEORGE, PetalburgGeorgeSeenText, PetalburgGeorgeBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PetalburgGeorgeAfterBattleText
	waitbutton
	closetext
	end

PetalburgGeorgeSeenText:
	text "NORMAN is"
	line "counting on me!"
	done

PetalburgGeorgeBeatenText:
	text "I'm a failure..."
	done

PetalburgGeorgeAfterBattleText:
	text "Maybe one day..."
	done


PetalburgJody:
	trainer COOLTRAINERF, PETALBURG_JODY, EVENT_BEAT_PETALBURG_JODY, PetalburgJodySeenText, PetalburgJodyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PetalburgJodyAfterBattleText
	waitbutton
	closetext
	end

PetalburgJodySeenText:
	text "Beat you?"

	para "Nah! I'm gonna"
	line "kill you!"
	done

PetalburgJodyBeatenText:
	text "I was just "
	line "kidding!"
	done

PetalburgJodyAfterBattleText:
	text "I just wanted"
	line "you to take me"
	cont "seriously..."
	done


NormanText_PreFight:
	text "Greetings!"
	line "my name is"
	cont "NORMAN."

	para "In my gym, we"
	line "focus what others"
	cont "overlook."

	para "You may learn"
	line "to fear the"
	cont "ordinary."
	done

NormanWinLossText:
	text "Well done!"

	para "You have proven"
	line "yourself truly"
	cont "mighty!"
	done

NormanText_ExplainBadge:
	text "You have earned"
	line "my BALANCE badge!"

	para "It proves your"
	line "appreciation"
	cont "of the NORMAL."
	done

NormanRematchText:
	text "Rematch?"
	done

NormanRematchWinLossText:
	text "Well Done!"
	done

NormanPostBattleText:
	text "I've always found"
	line "the power of"
	cont "'ordinary' NORMAL"
	
	para "types to be"
	line "quite special"
	cont "indeed."
	done

PetalburgGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 79, PETALBURG_CITY, 1	    ;petalburg city
	warp_event  0, 72, PETALBURG_GYM,  4	    ;room 1 left to room 2 entrance
	warp_event  9, 72, PETALBURG_GYM,  5        ;room 1 right to room 3 entrance
	warp_event  4, 67, PETALBURG_GYM,  2	    ;room 2 entrance to room 1 left
	warp_event  4, 55, PETALBURG_GYM,  3	    ;room 3 entrance to room 1 right

	warp_event  9, 60, PETALBURG_GYM,  8		; room 2 exit to room 4 left entrance
	warp_event  0, 48, PETALBURG_GYM,  9		; room 3 exit to room 4 right entrance
	warp_event  2, 43, PETALBURG_GYM,  6		; room 4 left entrance to room 2 exit
	warp_event  8, 43, PETALBURG_GYM,  7		; room 4 right entrance to room 3 exit

	warp_event  0, 36, PETALBURG_GYM,  13		; room 4 left exit to room 6 entrance
	warp_event  2, 31, PETALBURG_GYM,  12		; room 5 entrance to room 4 right exit
	warp_event  9, 36, PETALBURG_GYM,  11		; room 4 right exit to room 5 entrance
	warp_event  8, 19, PETALBURG_GYM,  10		; room 6 entrance to room 4 left exit

	warp_event  0, 24, PETALBURG_GYM,  17		; room 5 exit to room 7 right entrance
	warp_event  9, 12, PETALBURG_GYM,  16		; room 6 exit to room 7 left entrance
	warp_event  2,  7, PETALBURG_GYM,  15		; room 7 left entrance to room 6 exit
	warp_event  8,  7, PETALBURG_GYM,  14		; room 7 right entrance to room 5 exit

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  4,  2, SPRITE_KURT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgGymNormanScript, -1
	object_event  4, 74, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PetalburgRandall, -1
	object_event  4, 62, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, PetalburgMary, -1
	object_event  4, 50, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PetalburgParker, -1
	object_event  4, 38, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, PetalburgLori, -1
	object_event  4, 26, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PetalburgGeorge, -1
	object_event  4, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, PetalburgJody, -1
