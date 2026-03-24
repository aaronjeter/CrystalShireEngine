	object_const_def
	const SOOTOPOLISGYM_WALLACE
	const SOOTOPOLISGYM_CONNIE
	const SOOTOPOLISGYM_ANDREA
	const SOOTOPOLISGYM_DAPHNE
	const SOOTOPOLISGYM_ANNIKA
	const SOOTOPOLISGYM_TIFFANY
	const SOOTOPOLISGYM_CRISSY
	const SOOTOPOLISGYM_BETHANY
	const SOOTOPOLISGYM_OLIVIA
	const SOOTOPOLISGYM_BRIANNA
	const SOOTOPOLISGYM_BRIDGET

SootopolisGym_MapScripts:
	def_scene_scripts

	def_callbacks	

SootopolisGymWallaceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WALLACE
	iftrue .FightDone
	writetext WallaceText_PreFight
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 13, .Hard
	sjump .Medium

.Hard
	winlosstext WallaceWinLossText, 0
	loadtrainer WALLACE, WALLACE2
	sjump .Fight

.Medium
	winlosstext WallaceWinLossText, 0
	loadtrainer WALLACE, WALLACE1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WALLACE
	opentext
	writetext WallaceText_ExplainBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBADGE
	scall SootopolisGymLevelcap

	;disable gym trainers
	

	closetext
	end

.FightDone:
	writetext WallaceRematchText
	yesorno
	iffalse .FightDoneText

	readvar VAR_BADGES
	ifgreater 13, .HardRematch
	sjump .MediumRematch

.HardRematch
	winlosstext WallaceRematchWinLossText, 0
	loadtrainer WALLACE, WALLACE2
	sjump .Rematch

.MediumRematch
	winlosstext WallaceRematchWinLossText, 0
	loadtrainer WALLACE, WALLACE1
	sjump .Rematch

.Rematch	
	startbattle
	reloadmapafterbattle
	opentext
.FightDoneText
	writetext WallacePostBattleText
	waitbutton
	closetext
	end

SootopolisGymLevelcap:
	jumpstd UpdateWorldLevelsScript
	end


WallaceText_PreFight:
	text "Well, hello"
	line "<PLAY_G>."

	para "Oak told me"
	line "you would make"
	
	para "it here one"
	line "day."

	para "My name is"
	line "Wallace!"

	para "I am the"
	line "true Master"

	para "of Water type"
	line "Pokemon!"

	para "For a while, I"
	line "was even the"
	cont "League Champion!"

	para "..."

	para "Don't worry,"
	line "you don't face"
	cont "THAT team today."

	para "My Gym team"
	line "will be more"
	cont "than enough!"

	para "Good luck,"
	line "<PLAY_G>!"
	done

WallaceWinLossText:
	text "Ha! Well done"
	line "kid!"

	para "I didn't think"
	line "you had it in"
	cont "you!"
	done

WallaceText_ExplainBadge:
	text "Alright, I'm"
	line "impressed."

	para "You're worthy to"
	line "wear my"
	cont "RAIN BADGE!"

	para "You're almost"
	line "ready to face the"
	cont "Elite Four."

	para "Head for"
	line "Evergrande City."

	para "Victory road will"
	line "prove your"
	cont "strength!"
	done

WallaceRematchText:
	text "Shall we go"
	line "again?"
	done

WallaceRematchWinLossText:
	text "Good job kid!"
	done

WallacePostBattleText:
	text "You're ready"
	line "for the Elite"
	cont "Four."

	para "You should head"
	line "to Evergrande."
	done


SootopolisConnieScript:
	trainer BEAUTY, SOOTOPOLIS_CONNIE, EVENT_BEAT_SOOTOPOLIS_CONNIE, SootopolisConnieSeenText, SootopolisConnieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisConnieAfterBattleText
	waitbutton
	closetext
	end

SootopolisConnieSeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisConnieBeatenText:
	text "Aha!"
	done

SootopolisConnieAfterBattleText:
	text "Well done kid."
	done


SootopolisTiffanyScript:
	trainer BEAUTY, SOOTOPOLIS_TIFFANY, EVENT_BEAT_SOOTOPOLIS_TIFFANY, SootopolisTiffanySeenText, SootopolisTiffanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisTiffanyAfterBattleText
	waitbutton
	closetext
	end

SootopolisTiffanySeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisTiffanyBeatenText:
	text "Aha!"
	done

SootopolisTiffanyAfterBattleText:
	text "Well done kid."
	done


SootopolisOliviaScript:
	trainer BEAUTY, SOOTOPOLIS_OLIVIA, EVENT_BEAT_SOOTOPOLIS_OLIVIA, SootopolisOliviaSeenText, SootopolisOliviaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisOliviaAfterBattleText
	waitbutton
	closetext
	end

SootopolisOliviaSeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisOliviaBeatenText:
	text "Aha!"
	done

SootopolisOliviaAfterBattleText:
	text "Well done kid."
	done


SootopolisBridgetScript:
	trainer BEAUTY, SOOTOPOLIS_BRIDGET, EVENT_BEAT_SOOTOPOLIS_BRIDGET, SootopolisBridgetSeenText, SootopolisBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisBridgetAfterBattleText
	waitbutton
	closetext
	end

SootopolisBridgetSeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisBridgetBeatenText:
	text "Aha!"
	done

SootopolisBridgetAfterBattleText:
	text "Well done kid."
	done


SootopolisAndreaScript:
	trainer LASS, SOOTOPOLIS_ANDREA, EVENT_BEAT_SOOTOPOLIS_ANDREA, SootopolisAndreaSeenText, SootopolisAndreaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisAndreaAfterBattleText
	waitbutton
	closetext
	end

SootopolisAndreaSeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisAndreaBeatenText:
	text "Aha!"
	done

SootopolisAndreaAfterBattleText:
	text "Well done kid."
	done


SootopolisCrissyScript:
	trainer LASS, SOOTOPOLIS_CRISSY, EVENT_BEAT_SOOTOPOLIS_CRISSY, SootopolisCrissySeenText, SootopolisCrissyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisCrissyAfterBattleText
	waitbutton
	closetext
	end

SootopolisCrissySeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisCrissyBeatenText:
	text "Aha!"
	done

SootopolisCrissyAfterBattleText:
	text "Well done kid."
	done


SootopolisDaphneScript:
	trainer TEACHER, SOOTOPOLIS_DAPHNE, EVENT_BEAT_SOOTOPOLIS_DAPHNE, SootopolisDaphneSeenText, SootopolisDaphneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisDaphneAfterBattleText
	waitbutton
	closetext
	end

SootopolisDaphneSeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisDaphneBeatenText:
	text "Aha!"
	done

SootopolisDaphneAfterBattleText:
	text "Well done kid."
	done


SootopolisBriannaScript:
	trainer TEACHER, SOOTOPOLIS_BRIANNA, EVENT_BEAT_SOOTOPOLIS_BRIANNA, SootopolisBriannaSeenText, SootopolisBriannaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisBriannaAfterBattleText
	waitbutton
	closetext
	end

SootopolisBriannaSeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisBriannaBeatenText:
	text "Aha!"
	done

SootopolisBriannaAfterBattleText:
	text "Well done kid."
	done


SootopolisAnnikaScript:
	trainer POKEFANF, SOOTOPOLIS_ANNIKA, EVENT_BEAT_SOOTOPOLIS_ANNIKA, SootopolisAnnikaSeenText, SootopolisAnnikaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisAnnikaAfterBattleText
	waitbutton
	closetext
	end

SootopolisAnnikaSeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisAnnikaBeatenText:
	text "Aha!"
	done

SootopolisAnnikaAfterBattleText:
	text "Well done kid."
	done


SootopolisBethanyScript:
	trainer POKEFANF, SOOTOPOLIS_BETHANY, EVENT_BEAT_SOOTOPOLIS_BETHANY, SootopolisBethanySeenText, SootopolisBethanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SootopolisBethanyAfterBattleText
	waitbutton
	closetext
	end

SootopolisBethanySeenText:
	text "Thinking with"
	line "Portals yet?"
	done

SootopolisBethanyBeatenText:
	text "Aha!"
	done

SootopolisBethanyAfterBattleText:
	text "Well done kid."
	done

SootopolisGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 10, 39, SOOTOPOLIS_CITY, 3
	warp_event 11, 39, SOOTOPOLIS_CITY, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 11, 02, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SootopolisGymWallaceScript, -1
	object_event 09, 33, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, SootopolisConnieScript, -1
	object_event 11, 21, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, SootopolisAndreaScript, -1
	object_event 08, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, SootopolisDaphneScript, -1
	object_event 12, 10, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, SootopolisAnnikaScript, -1
	object_event 23, 35, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, SootopolisTiffanyScript, -1
	object_event 00, 35, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, SootopolisCrissyScript, -1
	object_event 22, 21, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, SootopolisBethanyScript, -1
	object_event 07, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, SootopolisOliviaScript, -1
	object_event 02, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, SootopolisBriannaScript, -1
	object_event 14, 31, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, SootopolisBridgetScript, -1
	