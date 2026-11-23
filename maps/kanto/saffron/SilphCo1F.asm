	object_const_def
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER
	const SILPH_GREEN
	const SILPHCO1F_PORYGONZ
	const SILPHCO1F_SCIENTIST

SilphCo1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, SilphCo1FMonSpritesCallback
	callback MAPCALLBACK_OBJECTS, SilphCo1FHideGreenCallback

SilphCo1FMonSpritesCallback:
	setmonsprite SPRITE_MON_1, PORYGONZ
	endcallback

SilphCo1FHideGreenCallback:
; Green only comes down the stairs during the Porygon-Z scene
	setevent EVENT_SILPH_CO_1F_GREEN
	endcallback

SilphCoReceptionistScript:
	checkevent EVENT_FOUND_SILPH_GREEN
	iftrue .calm
	jumptextfaceplayer SilphCoReceptionistPanicText

.calm
	jumptextfaceplayer SilphCoReceptionistText

SilphCoScientistScript:
	jumptextfaceplayer SilphCoScientistText

SilphCoPorygonZScript:
	cry PORYGONZ
	opentext
	writetext SilphCoPorygonZText
	closetext
	loadwildmon PORYGONZ, 9
	loadboss BOSS_SILPH_PORYGONZ
	startbattle
	reloadmapafterbattle
	disappear SILPHCO1F_PORYGONZ
	pause 15
	applymovement SILPHCO1F_OFFICER, SilphCoOfficerStepAsideMovement
	playsound SFX_EXIT_BUILDING
	appear SILPH_GREEN
	applymovement SILPH_GREEN, SilphCoGreenComesDownMovement
	faceobject SILPH_GREEN, PLAYER
	sjump SilphCoGreenScene

SilphCoPorygonZText:
	text "Porygon-Z's code"
	line "is scrambled!"

	para "It attacks!"
	done

SilphCoOfficerStepAsideMovement:
	step RIGHT
	turn_head LEFT
	step_end

SilphCoOfficerStepBackMovement:
	step LEFT
	turn_head DOWN
	step_end

SilphCoGreenComesDownMovement:
	step DOWN
	step DOWN
	step_end

SilphCoReceptionistPanicText:
	text "P-please stay"
	line "calm!"

	para "A Porygon got"
	line "loose from the"
	cont "labs upstairs, and"
	cont "it's gone haywire!"
	done
	done

SilphCoScientistText:
	text "Every lab lock"
	line "opened at once,"
	cont "from the inside."

	para "That was no"
	line "glitch. Someone"
	cont "did it on purpose!"
	done

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue .GotUpGrade
	writetext SilphCoOfficerText
	promptbutton
	verbosegiveitem UP_GRADE
	iffalse .NoRoom
	setevent EVENT_GOT_UP_GRADE
.GotUpGrade:
	writetext SilphCoOfficerText_GotUpGrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoReceptionistText:
	text "Welcome. This is"
	line "Silph Co.'s Head"
	cont "Office Building."
	done

SilphCoOfficerText:
	text "Only employees are"
	line "permitted to go"
	cont "upstairs."

	para "But since you came"
	line "such a long way,"

	para "have this neat"
	line "little souvenir."
	done

SilphCoOfficerText_GotUpGrade:
	text "It's Silph Co.'s"
	line "latest product."

	para "It's not for sale"
	line "anywhere yet."
	done


SilphCoGreenScene:
	opendialog GREEN
	writetext SilphGreenIntroText
	waitbutton
	closedialog

	winlosstext SilphGreenLossText, SilphGreenWinText
	loadtrainer GREEN, GREEN4
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	iftrue .GreenWon

	opendialog GREEN
	writetext SilphGreenAfterBattleText
	waitbutton
	closedialog
	sjump .GreenLeaves

.GreenWon
	special HealParty
	opendialog GREEN
	writetext SilphGreenWonText
	waitbutton
	closedialog

.GreenLeaves
	setevent EVENT_FOUND_SILPH_GREEN
	setevent EVENT_SAFFRON_CITY_SAFE
	clearevent EVENT_SAFFRON_CITY_UNSAFE

	special FadeOutToBlack
	disappear SILPH_GREEN
	special FadeInFromBlack
	applymovement SILPHCO1F_OFFICER, SilphCoOfficerStepBackMovement
	end

SilphGreenAfterBattleText:
	text "Ah well, I guess"
	line "I can't win them"
	cont "all."

	para "Maybe Oak was"
	line "right...You do"
	cont "have some skill."

	para "You should take"
	line "on the #mon"
	cont "League."

	para "Up on Indigo"
	line "Plateau, the Elite"
	cont "Four will happily"
	cont "put your skills to"
	cont "the test."

	para "Alright, I'm out!"
	line "I've got plenty"
	cont "more to do."

	para "Later, scrub!"
	done

SilphGreenWonText: 
	text "Well, you still"
	line "have some room for"
	cont "improvement!"

	para "Don't worry, I'll"
	line "heal your #mon."

	para "..."

	para "Maybe Oak was"
	line "right...You do"
	cont "have some skill."

	para "You should take"
	line "on the #mon"
	cont "League."

	para "Up on Indigo"
	line "Plateau, the Elite"
	cont "Four will happily"
	cont "put your skills to"
	cont "the test."

	para "Alright, I'm out!"
	line "I've got plenty"
	cont "more to do."

	para "Later, scrub!"
	done

SilphGreenLossText:
	text "Ugh, lucky!"
	done

SilphGreenWinText:
	text "Ha! Suck it,"
	line "loser!"
	done

SilphGreenIntroText:
	text "Whew! Sorry about"
	line "that, <PLAY_G>."

	para "We rounded up all"
	line "the Porygon in the"
	cont "labs, but that one"
	cont "slipped right past"
	cont "me."

	para "I think if I"
	line "never see another"
	cont "Porygon, it'll be"
	cont "too soon..."

	para "I got an interest-"
	line "ing call from the"
	cont "Safari Warden..."

	para "Apparently I sent"
	line "you into a bit of"
	cont "a mess as well."

	para "A Rocket named"
	line "Petra opened the"
	cont "Porygon labs on"
	cont "purpose?"

	para "All that, just to"
	line "keep me busy..."

	para "It sounds like you"
	line "handled yourself"
	cont "quite well though!"

	para "I'll be honest, I"
	line "didn't have high"
	cont "hopes for you, but"
	cont "I was wrong."

	para "Maybe you'll be a"
	line "mediocre trainer"
	cont "one day after all!"

	para "There's only one"
	line "way to be sure"
	cont "though..."

	para "Get ready,"
	line "<PLAY_G>!"
	done
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 7
	warp_event  3,  7, SAFFRON_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event 13,  0, SPRITE_GREEN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SILPH_CO_1F_GREEN
	object_event 13,  2, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCoPorygonZScript, EVENT_FOUND_SILPH_GREEN
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoScientistScript, EVENT_FOUND_SILPH_GREEN
