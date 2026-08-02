	object_const_def
	const MAPROUTEDESERT_HEIDI
	const MAPROUTEDESERT_BECKY
	const MAPROUTEDESERT_CELIA
	const MAPROUTEDESERT_BEAU
	const MAPROUTEDESERT_DREW
	const MAPROUTEDESERT_BRANDEN
	const MAPROUTEDESERT_DUSTY
	const MAPROUTEDESERT_BRYAN
	const MAPROUTEDESERT_ROCKET_GUARD
	const MAPROUTEDESERT_BALL1
	const MAPROUTEDESERT_BALL2
	const MAPROUTEDESERT_JANE
	const MAPROUTEDESERT_LATIAS
	const MAPROUTEDESERT_LATIOS


LavaridgeDesert_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_OBJECTS, DesertCallback

DesertCallback:
	checkevent EVENT_BEAT_DESERT_SHRINE_UNOWN
	iffalse .NotBeatShrine
	checkevent EVENT_TALKED_TO_DESERT_JANE
	iftrue .latias
	appear MAPROUTEDESERT_JANE
.latias
	checkevent EVENT_GOT_LATIAS
	iftrue .latios
	appear MAPROUTEDESERT_LATIAS
.latios
	checkevent EVENT_GOT_LATIOS
	iftrue .done
	appear MAPROUTEDESERT_LATIOS
.done
	endcallback

.NotBeatShrine:
	
	disappear MAPROUTEDESERT_JANE
	disappear MAPROUTEDESERT_LATIOS
	disappear MAPROUTEDESERT_LATIAS
	endcallback

DesertHeidiScript:
	trainer PICNICKER, DESERT_HEIDI, EVENT_BEAT_DESERT_HEIDI, DesertHeidiSeenText, DesertHeidiBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DesertHeidiAfterBattleText
	waitbutton
	closetext
	end

DesertHeidiSeenText:
	text "Ahh, we're totally"
	line "lost."
	done

DesertHeidiBeatenText:
	text "Oh wow..."
	done

DesertHeidiAfterBattleText:
	text "Ok, so South"
	line "to Mauville?"
	done


DesertBeckyScript:
	trainer PICNICKER, DESERT_BECKY, EVENT_BEAT_DESERT_BECKY, DesertBeckySeenText, DesertBeckyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DesertBeckyAfterBattleText
	waitbutton
	closetext
	end

DesertBeckySeenText:
	text "There's so much"
	line "sand here..."

	para "And people used"
	line "to live here."
	done

DesertBeckyBeatenText:
	text "You're pretty"
	line "tough."
	done

DesertBeckyAfterBattleText:
	text "I guess it"
	line "wasn't so dry"
	cont "back in the day."
	done


DesertCeliaScript:
	trainer PICNICKER, DESERT_CELIA, EVENT_BEAT_DESERT_CELIA, DesertCeliaSeenText, DesertCeliaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DesertCeliaAfterBattleText
	waitbutton
	closetext
	end

DesertCeliaSeenText:
	text "I'm looking for"
	line "Trapinch."

	para "have you seen"
	line "one yet?"
	done

DesertCeliaBeatenText:
	text "Oh wow."
	done

DesertCeliaAfterBattleText:
	text "I'm trying to"
	line "round out my"
	cont "collection."
	done


DesertBeauScript:
	trainer CAMPER, DESERT_BEAU, EVENT_BEAT_DESERT_BEAU, DesertBeauSeenText, DesertBeauBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DesertBeauAfterBattleText
	waitbutton
	closetext
	end

DesertBeauSeenText:
	text "We came from"
	line "Fallarbor, so"
	cont "home is West?"
	done

DesertBeauBeatenText:
	text "I hate being"
	line "lost!"
	done

DesertBeauAfterBattleText:
	text "I think we need"
	line "To go South."
	done


DesertDrewScript:
	trainer CAMPER, DESERT_DREW, EVENT_BEAT_DESERT_DREW, DesertDrewSeenText, DesertDrewBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DesertDrewAfterBattleText
	waitbutton
	closetext
	end

DesertDrewSeenText:
	text "We learned about"
	line "these ruins in"
	cont "school."
	done

DesertDrewBeatenText:
	text "I was hoping"
	line "to win again."
	done

DesertDrewAfterBattleText:
	text "Lots of people"
	line "used to live"
	cont "here."
	done


DesertBrandenScript:
	trainer CAMPER, DESERT_BRANDEN, EVENT_BEAT_DESERT_BRANDEN, DesertBrandenSeenText, DesertBrandenBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DesertBrandenAfterBattleText
	waitbutton
	closetext
	end

DesertBrandenSeenText:
	text "I'm gonna catch"
	line "a Trapinch."

	para "Then train it"
	line "like Drake did."
	done

DesertBrandenBeatenText:
	text "That's not"
	line "helping..."
	done

DesertBrandenAfterBattleText:
	text "Drake is the"
	line "best Dragon"
	cont "trainer."
	done


DesertDustyScript:
	trainer EXPLORER, DESERT_DUSTY, EVENT_BEAT_DESERT_DUSTY, DesertDustySeenText, DesertDustyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DesertDustyAfterBattleText
	waitbutton
	closetext
	end

DesertDustySeenText:
	text "Ever seen a"
	line "Ruin like this?"
	done

DesertDustyBeatenText:
	text "Wow."
	line "Now bad, kid."
	done

DesertDustyAfterBattleText:
	text "There are three"
	line "of these ruins"
	cont "around Hoenn."
	
	para "No idea what"
	line "they're for"
	cont "though..."
	done


DesertBryanScript:
	trainer EXPLORER, DESERT_BRYAN, EVENT_BEAT_DESERT_BRYAN, DesertBryanSeenText, DesertBryanBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext DesertBryanAfterBattleText
	waitbutton
	closetext
	end

DesertBryanSeenText:
	text "AH!"
	line "You startled me!"
	done

DesertBryanBeatenText:
	text "Whew!"
	done

DesertBryanAfterBattleText:
	text "It's kinda spooky"
	line "inside there!"
	done


DesertRocketBlocksRuinsScript:
	jumptextfaceplayer DesertRocketText

DesertRocketText:
	text "Sorry, no one"
	line "gets past here."

	para "Not until the"
	line "Boss gets here."
	done

DesertJaneScript:
	setevent EVENT_TALKED_TO_DESERT_JANE	
	jumptextfaceplayer DesertJaneText

DesertJaneText:
	text "You saved my life"
	line "back in the"
	cont "shrine..."

	para "Our plan never"
	line "really had a"
	cont "chance."

	para "Latias and Latios"
	line "were supposed to"
	cont "be the key, but..."

	para "Seeing them"
	line "captive, it"
	
	para "drove the guardian"
	line "into a frightful"
	cont "rage."

	para "I think it was"
	line "right; I am"
	cont "unworthy to"
	cont "tame such a"
	cont "majestic #mon."

	para "You, however,"
	line "may just have"
	cont "what it takes."
	done

DesertLatiasScript:
	opentext
	writetext DesertLatiasAttacksText
	pause 15
	cry LATIAS
	closetext
	loadwildmon LATIAS, 10
	startbattle
	reloadmapafterbattle
	ifequal LOSE, .NotBeaten
	setevent EVENT_GOT_LATIAS
	disappear MAPROUTEDESERT_LATIAS
	disappear MAPROUTEDESERT_JANE
.NotBeaten
	end

DesertLatiasAttacksText:
	text "The majestic"
	line "beast regards you"
	cont "with joy."
	done

DesertLatiosScript:
	opentext
	writetext DesertLatiasAttacksText
	pause 15
	cry LATIOS
	closetext
	loadwildmon LATIOS, 10
	startbattle
	reloadmapafterbattle
	disappear MAPROUTEDESERT_LATIOS
	setevent EVENT_GOT_LATIOS	
	end

DesertTMSandstorm:
	itemball TM_SANDSTORM

DesertSoftSand:
	itemball SOFT_SAND

LavaridgeDesert_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  8, 37, ROUTE_111, 1
	warp_event  9, 37, ROUTE_111, 1
	warp_event  15, 09, ROUTE_113, 1
	warp_event  43, 43, DESERT_RUIN_1F, 1
	warp_event 31, 27, DESERT_SHRINE, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 06, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, DesertHeidiScript, -1
	object_event 10, 24, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, DesertBeckyScript, -1
	object_event 25, 32, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, DesertCeliaScript, -1
	object_event 07, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, DesertBeauScript, -1
	object_event 09, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, DesertDrewScript, -1
	object_event 23, 35, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, DesertBrandenScript, -1
	object_event 42, 39, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, DesertDustyScript, -1
	object_event 27, 22, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, DesertBryanScript, -1
	object_event 43, 44, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DesertRocketBlocksRuinsScript, EVENT_BEAT_PYRE_ROCKETS
	object_event 45, 08, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertTMSandstorm, EVENT_DESERT_TM_SANDSTORM
	object_event 48, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertSoftSand, EVENT_GOT_HOENN_SOFT_SAND
	object_event 40, 10, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DesertJaneScript, EVENT_HIDE_DESERT_JANE
	object_event 41, 10, SPRITE_LATIOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DesertLatiasScript, EVENT_HIDE_LATIAS
	object_event 12, 50, SPRITE_LATIOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DesertLatiosScript, EVENT_HIDE_LATIOS

