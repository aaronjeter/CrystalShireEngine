	object_const_def
	const MOSSDEEPGYM_TATE
	const MOSSDEEPGYM_LIZA
	const MOSSDEEPGYM_CLIFF
	const MOSSDEEPGYM_NATE
	const MOSSDEEPGYM_PRESTON
	const MOSSDEEPGYM_BLAKE
	const MOSSDEEPGYM_NICHOLAS
	const MOSSDEEPGYM_VIRGIL
	const MOSSDEEPGYM_MAURA
	const MOSSDEEPGYM_SAMANTHA
	const MOSSDEEPGYM_MACEY
	const MOSSDEEPGYM_KATHLEEN
	const MOSSDEEPGYM_SYLVIA
	const MOSSDEEPGYM_HANNAH

MossdeepGym_MapScripts:
	def_scene_scripts

	def_callbacks	

MossdeepGymTateLizaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_TATELIZA
	iftrue .FightDone
	writetext TateLizaText_PreFight
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 13, .Hard
	ifgreater 3, .Medium
	sjump .Easy

.Hard
	winlosstext TateLizaWinLossText, 0
	loadtrainer TATELIZA, TATELIZA3
	sjump .Fight

.Medium
	winlosstext TateLizaWinLossText, 0
	loadtrainer TATELIZA, TATELIZA2
	sjump .Fight

.Easy
	winlosstext TateLizaWinLossText, 0
	loadtrainer TATELIZA, TATELIZA1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_TATELIZA
	opentext
	writetext TateLizaText_ExplainBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINDBADGE
	setflag ENGINE_FLYPOINT_SOOTOPOLIS
	scall MossdeepGymLevelcap

	;disable gym trainers
	

	closetext
	end

.FightDone:
	setflag ENGINE_FLYPOINT_SOOTOPOLIS
	writetext TateLizaRematchText
	yesorno
	iffalse .FightDoneText

	readvar VAR_BADGES
	ifgreater 13, .HardRematch
	ifgreater 3, .MediumRematch
	sjump .EasyRematch

.HardRematch
	winlosstext TateLizaRematchWinLossText, 0
	loadtrainer TATELIZA, TATELIZA3
	sjump .Rematch

.MediumRematch
	winlosstext TateLizaRematchWinLossText, 0
	loadtrainer TATELIZA, TATELIZA2
	sjump .Rematch

.EasyRematch
	winlosstext TateLizaRematchWinLossText, 0
	loadtrainer TATELIZA, TATELIZA1
	sjump .Rematch

.Rematch	
	startbattle
	reloadmapafterbattle
	opentext
.FightDoneText
	writetext TateLizaPostBattleText
	waitbutton
	closetext
	end

MossdeepGymLevelcap:
	jumpstd UpdateWorldLevelsScript
	end


TateLizaText_PreFight:
	text "I'm Tate!"

	para "And I'm Liza!"

	para "Both: And we're"
	line "the Leaders here!"

	para "Think you can"
	line "take us both?"

	para "At the same time?"

	para "Tate: Good luck!"
	line "Liza: You need it!"
	done

TateLizaWinLossText:
	text "Tate: Woah"
	line "Liza: Well Done!"
	done

TateLizaText_ExplainBadge:
	text "Both: Okay, you've"
	line "earned it."

	para "Liza: Take the"
	line "Mind Badge!"

	para "It's our"
	line "emblem!"

	para "Tate: It's shiny!"

	para "And you'll need"
	line "it if you ever"

	para "Liza: Want to"
	line "face the"
	cont "Elite Four."

	para "Now. Go on to"
	line "Sootopolis!"

	para "You'll find the"
	line "final Gym there!"

	para "Tate: Here, I"
	line "marked it on"
	cont "your flymap."

	done

TateLizaRematchText:
	text "Let's go?"
	done

TateLizaRematchWinLossText:
	text "Good Fight!"
	done

TateLizaPostBattleText:
	text "Tate: You're"
	line "close to ready"
	cont "for Evergrande."

	para "Liza: The Elite"
	line "Four live there."

	para "Both: They only"
	line "accept challenges"
	cont "from the best."
	done

MossdeepCliffScript:
	trainer GENTLEMAN, MOSSDEEP_CLIFF, EVENT_BEAT_MOSSDEEP_CLIFF, MossdeepCliffSeenText, MossdeepCliffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepCliffAfterBattleText
	waitbutton
	closetext
	end

MossdeepCliffSeenText:
	text "Thinking with"
	line "Portals yet?"
	done

MossdeepCliffBeatenText:
	text "Aha!"
	done

MossdeepCliffAfterBattleText:
	text "Well done kid."
	done

MossdeepNateScript:
	trainer GENTLEMAN, MOSSDEEP_NATE, EVENT_BEAT_MOSSDEEP_NATE, MossdeepNateSeenText, MossdeepNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepNateAfterBattleText
	waitbutton
	closetext
	end

MossdeepNateSeenText:
	text "Surprise?"
	done

MossdeepNateBeatenText:
	text "Not bad, kid!"
	done

MossdeepNateAfterBattleText:
	text "Warping around"
	line "never gets old."
	done


MossdeepPrestonScript:
	trainer PSYCHIC_T, MOSSDEEP_PRESTON, EVENT_BEAT_MOSSDEEP_PRESTON, MossdeepPrestonSeenText, MossdeepPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepPrestonAfterBattleText
	waitbutton
	closetext
	end

MossdeepPrestonSeenText:
	text "I saw this coming."
	done

MossdeepPrestonBeatenText:
	text "..."
	done

MossdeepPrestonAfterBattleText:
	text "I guess I didn't"
	line "see it after all."
	done


MossdeepBlakeScript:
	trainer PSYCHIC_T, MOSSDEEP_BLAKE, EVENT_BEAT_MOSSDEEP_BLAKE, MossdeepBlakeSeenText, MossdeepBlakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepBlakeAfterBattleText
	waitbutton
	closetext
	end

MossdeepBlakeSeenText:
	text "Portal Trap!"
	done

MossdeepBlakeBeatenText:
	text "Aww man."

	para "Thought we had"
	line "you."
	done

MossdeepBlakeAfterBattleText:
	text "You're really"
	line "good at this."

	para "Keep it up!"
	done


MossdeepNicholasScript:
	trainer PSYCHIC_T, MOSSDEEP_NICHOLAS, EVENT_BEAT_MOSSDEEP_NICHOLAS, MossdeepNicholasSeenText, MossdeepNicholasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepNicholasAfterBattleText
	waitbutton
	closetext
	end

MossdeepNicholasSeenText:
	text "I'll bet you've"
	line "never seen a"

	para "maze like this!"
	done

MossdeepNicholasBeatenText:
	text "Oh..."
	line "Well then..."
	done

MossdeepNicholasAfterBattleText:
	text "I guess Saffron"
	line "has a maze like"
	cont "this, actually."
	done


MossdeepVirgilScript:
	trainer PSYCHIC_T, MOSSDEEP_VIRGIL, EVENT_BEAT_MOSSDEEP_VIRGIL, MossdeepVirgilSeenText, MossdeepVirgilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepVirgilAfterBattleText
	waitbutton
	closetext
	end

MossdeepVirgilSeenText:
	text "Are you lost?"
	done

MossdeepVirgilBeatenText:
	text "Woah!"
	done

MossdeepVirgilAfterBattleText:
	text "It's easy to get"
	line "turned around"
	cont "in here."
	done


MossdeepMauraScript:
	trainer PSYCHIC_F, MOSSDEEP_MAURA, EVENT_BEAT_MOSSDEEP_MAURA, MossdeepMauraSeenText, MossdeepMauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepMauraAfterBattleText
	waitbutton
	closetext
	end

MossdeepMauraSeenText:
	text "Boo!"
	done

MossdeepMauraBeatenText:
	text "Aww"
	done

MossdeepMauraAfterBattleText:
	text "I guess it doesn't"
	line "work unless I"
	cont "go first..."
	done


MossdeepSamanthaScript:
	trainer PSYCHIC_F, MOSSDEEP_SAMANTHA, EVENT_BEAT_MOSSDEEP_SAMANTHA, MossdeepSamanthaSeenText, MossdeepSamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepSamanthaAfterBattleText
	waitbutton
	closetext
	end

MossdeepSamanthaSeenText:
	text "Having fun yet?"
	done

MossdeepSamanthaBeatenText:
	text "Fun!"
	done

MossdeepSamanthaAfterBattleText:
	text "You should stick"
	line "around..."

	para "We could use"
	line "more Gym"
	cont "Trainers."
	done


MossdeepMaceyScript:
	trainer PSYCHIC_F, MOSSDEEP_MACEY, EVENT_BEAT_MOSSDEEP_MACEY, MossdeepMaceySeenText, MossdeepMaceyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepMaceyAfterBattleText
	waitbutton
	closetext
	end

MossdeepMaceySeenText:
	text "Need a hint?"
	done

MossdeepMaceyBeatenText:
	text "Good fight!"
	done

MossdeepMaceyAfterBattleText:
	text "A lot of the"
	line "portals just"

	para "go back to"
	line "the entrance."
	done


MossdeepKathleenScript:
	trainer PSYCHIC_F, MOSSDEEP_KATHLEEN, EVENT_BEAT_MOSSDEEP_KATHLEEN, MossdeepKathleenSeenText, MossdeepKathleenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepKathleenAfterBattleText
	waitbutton
	closetext
	end

MossdeepKathleenSeenText:
	text "Fresh Meat!"
	done

MossdeepKathleenBeatenText:
	text "Dang it. I guess"
	line "you were ready!"
	done

MossdeepKathleenAfterBattleText:
	text "I just like"
	line "ambushes."
	done


MossdeepSylviaScript:
	trainer PSYCHIC_F, MOSSDEEP_SYLVIA, EVENT_BEAT_MOSSDEEP_SYLVIA, MossdeepSylviaSeenText, MossdeepSylviaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepSylviaAfterBattleText
	waitbutton
	closetext
	end

MossdeepSylviaSeenText:
	text "Oh! You look"
	line "like you've"

	para "seen a ghost."

	para "Well, you will"
	line "anyways!"
	done

MossdeepSylviaBeatenText:
	text "Spooky."
	done

MossdeepSylviaAfterBattleText:
	text "Bye!"
	done


MossdeepHannahScript:
	trainer PSYCHIC_F, MOSSDEEP_HANNAH, EVENT_BEAT_MOSSDEEP_HANNAH, MossdeepHannahSeenText, MossdeepHannahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MossdeepHannahAfterBattleText
	waitbutton
	closetext
	end

MossdeepHannahSeenText:
	text "Be not afraid!"
	done

MossdeepHannahBeatenText:
	text "Oh!"
	done

MossdeepHannahAfterBattleText:
	text "I guess you"
	line "really didn't"

	para "need to be"
	line "afraid."
	done


MossdeepGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 18, 39, MOSSDEEP_CITY, 3
	warp_event 19, 39, MOSSDEEP_CITY, 3
	warp_event 14, 36, MOSSDEEP_GYM, 5  ;#3 entrance left
	warp_event 23, 36, MOSSDEEP_GYM, 8  ;#4 entrance right
	warp_event 00, 38, MOSSDEEP_GYM, 3  ;#5 sw platform left
	warp_event 02, 34, MOSSDEEP_GYM, 11 ;#6 sw platform center
	warp_event 07, 34, MOSSDEEP_GYM, 13 ;#7 sw platform right
	warp_event 30, 34, MOSSDEEP_GYM, 4  ;#8 se platform left
	warp_event 34, 34, MOSSDEEP_GYM, 11 ;#9 se platform center
	warp_event 39, 34, MOSSDEEP_GYM, 16 ;#10 se platform right
	warp_event 18, 26, MOSSDEEP_GYM, 3  ;#11 south trap entrance
	warp_event 19, 30, MOSSDEEP_GYM, 3  ;#12 south trap exit
	warp_event 00, 16, MOSSDEEP_GYM, 6  ;#13 nw platform top
	warp_event 17, 20, MOSSDEEP_GYM, 21 ;#14 nw platform middle
	warp_event 09, 24, MOSSDEEP_GYM, 19 ;#15 nw platform bot
	warp_event 31, 16, MOSSDEEP_GYM, 10 ;#16 ne platform left
	warp_event 34, 06, MOSSDEEP_GYM, 13 ;#17 ne platform middle
	warp_event 38, 24, MOSSDEEP_GYM, 19 ;#18 ne platform right
	warp_event 23, 14, MOSSDEEP_GYM, 3  ;#19 north trap entrance
	warp_event 22, 18, MOSSDEEP_GYM, 3  ;#20 north trap exit
	warp_event 12, 06, MOSSDEEP_GYM, 3  ;#21 north platform entrance
	warp_event 21, 06, MOSSDEEP_GYM, 3  ;#22 north platform exit

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 16, 03, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MossdeepGymTateLizaScript, -1
	object_event 17, 03, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MossdeepGymTateLizaScript, -1
	object_event 18, 24, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 2, MossdeepCliffScript, -1
	object_event 23, 12, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 2, MossdeepNateScript, -1
	object_event 16, 26, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 2, MossdeepPrestonScript, -1
	object_event 20, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, MossdeepBlakeScript, -1
	object_event 08, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 2, MossdeepNicholasScript, -1
	object_event 38, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 2, MossdeepVirgilScript, -1
	object_event 21, 26, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, MossdeepMauraScript, -1
	object_event 25, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, MossdeepSamanthaScript, -1
	object_event 04, 38, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, MossdeepMaceyScript, -1
	object_event 39, 39, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, MossdeepKathleenScript, -1
	object_event 05, 24, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, MossdeepSylviaScript, -1
	object_event 31, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, MossdeepHannahScript, -1
