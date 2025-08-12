	object_const_def
	const PETALBURGGYM_WATTSON
	const PETALBURGGYM_VIVIAN
	const PETALBURGGYM_KIRK
	const PETALBURGGYM_BEN
	const PETALBURGGYM_ANGELO
	const PETALBURGGYM_SHAWN

MauvilleGym_MapScripts:
	def_scene_scripts

	def_callbacks	

MauvilleVivian:
	trainer LASS, MAUVILLE_VIVIAN, EVENT_BEAT_MAUVILLE_VIVIAN, MauvilleVivianSeenText, MauvilleVivianBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleVivianAfterBattleText
	waitbutton
	closetext
	end

MauvilleVivianSeenText:
	text "With my charm"
	line "and moves,"
	cont "you'll be"
	cont "shocked!"
	done

MauvilleVivianBeatenText:
	text "I'm shocked"
	line "by your power!"
	done

MauvilleVivianAfterBattleText:
	text "I've heard that "
	line "MAUVILLE was"
	cont "founded by"
	cont "WATTSON."

	para "He was a TRAINER"
	line "long before us."

	para "He must know"
	line "all sorts of"
	cont "things!"
	done

MauvilleKirk:
	trainer GUITARIST, MAUVILLE_KIRK, EVENT_BEAT_MAUVILLE_KIRK, MauvilleKirkSeenText, MauvilleKirkBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleKirkAfterBattleText
	waitbutton
	closetext
	end

MauvilleKirkSeenText:
	text "I'll shatter"
	line "your dreams!"

	para "Whoa-yeahah!!"
	done

MauvilleKirkBeatenText:
	text "That was plugged "
	line "in, amped up,"
	cont "over-driven "
	cont "electric, man!!"
	done

MauvilleKirkAfterBattleText:
	text "It's all about"
	line "heart."

	para "Whoa-yeah!"
	done

MauvilleShawn:
	trainer GUITARIST, MAUVILLE_SHAWN, EVENT_BEAT_MAUVILLE_SHAWN, MauvilleShawnSeenText, MauvilleShawnBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleShawnAfterBattleText
	waitbutton
	closetext
	end

MauvilleShawnSeenText:
	text "I trained"
	line "under WATTSON!"

	para "There ain't no"
	line "way I'll lose!"
	done

MauvilleShawnBeatenText:
	text "Unplugged and"
	line "turned off..."
	done

MauvilleShawnAfterBattleText:
	text "WATTSON, our"
	line "GYM LEADER,"
	cont "has been around"
	cont "a long time."

	para "He was battling"
	line "before your"
	cont "daddy was born!"
	done

MauvilleBen:
	trainer SCHOOLBOY, MAUVILLE_BEN, EVENT_BEAT_MAUVILLE_BEN, MauvilleBenSeenText, MauvilleBenBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleBenAfterBattleText
	waitbutton
	closetext
	end

MauvilleBenSeenText:
	text "This GYM"
	line "used to"
	cont "have puzzles."

	para "I hope they"
	line "get fixed soon!"
	done

MauvilleBenBeatenText:
	text "It's no fun"
	line "to lose..."
	done

MauvilleBenAfterBattleText:
	text "WATTSON says"
	line "he likes setting"
	cont "up traps."
	done


MauvilleAngelo:
	trainer BUG_CATCHER, MAUVILLE_ANGELO, EVENT_BEAT_MAUVILLE_ANGELO, MauvilleAngeloSeenText, MauvilleAngeloBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleAngeloAfterBattleText
	waitbutton
	closetext
	end

MauvilleAngeloSeenText:
	text "I love shiny "
	line "things!"
	done

MauvilleAngeloBeatenText:
	text "Oh...my eyes."
	done

MauvilleAngeloAfterBattleText:
	text "WATTSON has "
	line "a shiny forehead."
	done



MauvilleGymWattsonScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WATTSON
	iftrue .FightDone
	writetext WattsonText_PreFight
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 3, .Hard
	sjump .Easy

.Hard
	winlosstext WattsonWinLossText, 0
	loadtrainer WATTSON, WATTSON2
	sjump .Fight

.Easy
	winlosstext WattsonWinLossText, 0
	loadtrainer WATTSON, WATTSON1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WATTSON
	opentext
	writetext WattsonText_ExplainBadge
	playsound SFX_GET_BADGE
	waitsfx
	;setflag ENGINE_DYNAMOBADGE
	readvar VAR_BADGES
	scall MauvilleGymActivateRockets

	;disable gym trainers
	setevent EVENT_BEAT_MAUVILLE_VIVIAN
	setevent EVENT_BEAT_MAUVILLE_KIRK
	setevent EVENT_BEAT_MAUVILLE_SHAWN
	setevent EVENT_BEAT_MAUVILLE_BEN
	setevent EVENT_BEAT_MAUVILLE_ANGELO

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
	writetext WattsonRematchText
	yesorno
	iffalse .FightDoneText

	readvar VAR_BADGES
	ifgreater 3, .HardRematch
	sjump .EasyRematch

.HardRematch
	winlosstext WattsonRematchWinLossText, 0
	loadtrainer WATTSON, WATTSON2
	sjump .Rematch

.EasyRematch
	winlosstext WattsonRematchWinLossText, 0
	loadtrainer WATTSON, WATTSON1
	sjump .Rematch

.Rematch	
	startbattle
	reloadmapafterbattle
	opentext
.FightDoneText
	writetext WattsonPostBattleText
	waitbutton
	closetext
	end

MauvilleGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript


WattsonText_PreFight:
	text "I've given up"
	line "on my plans"
	cont "for the city."
	
	para "Now I just"
	line "live to fry"
	cont "little sprouts"
	cont "like you."

	para "I'm glad you"
	line "made it this"
	cont "far."

	para "I, WATTSON,"
	line "the LEADER of"
	cont "MAUVILLE GYM,"
	cont "shall electrify"
	cont "you!"
	done

WattsonWinLossText:
	text "Wahahahah!"

	para "Fine, I lost!"

	para "You ended up"
	line "giving me a"
	cont "thrill!"
	done

WattsonText_ExplainBadge:
	text "Take this BADGE!"

	para "The DYNAMO BADGE"
	line "marks your"
	cont "victory here"
	cont "today!"
	done

WattsonRematchText:
	text "Rematch?"
	done

WattsonRematchWinLossText:
	text "Well Done!"
	done

WattsonPostBattleText:
	text "I swell with"
	line "optimism, seeing"
	cont "a promising"
	cont "young TRAINER"
	cont "like you!"
	
	para "Wahahahah!"

	para "Go forth and"
	line "endeavor,"
	cont "youngster!"
	done

MauvilleGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 23, MAUVILLE_CITY, 1
	warp_event  5, 23, MAUVILLE_CITY, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  5,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MauvilleGymWattsonScript, -1
	object_event  1, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, MauvilleVivian, -1
	object_event  8, 15, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, MauvilleKirk, -1
	object_event  4, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, MauvilleBen, -1
	object_event  7, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, MauvilleAngelo, -1
	object_event  2, 07, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, MauvilleShawn, -1
	