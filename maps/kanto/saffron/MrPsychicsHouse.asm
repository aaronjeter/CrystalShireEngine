	object_const_def
	const MRPSYCHICSHOUSE_FISHING_GURU

MrPsychicsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue .AlreadyGotItem
	writetext MrPsychicText1
	promptbutton
	verbosegiveitem TM_PSYCHIC_M
	iffalse .Done
	setevent EVENT_GOT_TM29_PSYCHIC
.AlreadyGotItem:
	writetext MrPsychicText2
	waitbutton
.Done:
	closetext
	end

MrPsychicsHouseBookshelf:
	jumpstd DifficultBookshelfScript

MrPsychicText1:
	text "…"

	para "…"

	para "…"

	para "…I got it!"

	para "You wanted this!"
	done

MrPsychicText2:
	text "TM29 is Psychic."

	para "It may lower the"
	line "target's Spcl.Def."
	done


MrsPsychic:
	faceplayer
	opentext

	writetext MrsPsychicOfferServiceText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney

	loadmem wPartyMon1DVs+0, HP_MAX_PSYCHIC
	loadmem wPartyMon1DVs+1, $fe

	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 1000
	special PlaceMoneyTopRight
	writetext MrsPsychicAfterServiceText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext MrsPsychicNoMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext MrsPsychicRefusedText
	waitbutton
	closetext
	end

MrsPsychicOfferServiceText:
	text "Welcome to our"
	line "home, trainer."

	para "I can imbue your"
	line "first #mon with"
	cont "Psychic Power."

	para "This isn't free"
	line "though, I'm not"
	cont "my husband..."
	done


MrsPsychicAfterServiceText:
	text "And...it is"
	line "complete!"

	para "Your #mon is"
	line "filled with Hidden"
	cont "Psychic Power."

	para "And has taken on"
	line "a lovely shade of"
	cont "lavender..."
	done
	
MrsPsychicNoMoneyText:
	text "I'm sorry, but"
	line "you haven't got"
	cont "enough money."
	done

MrsPsychicRefusedText:
	text "Oh, alright."
	line "It isn't for"
	cont "just anyone."
	done

MrPsychicsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 5
	warp_event  3,  7, SAFFRON_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPsychicsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MrPsychicsHouseBookshelf

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1
	object_event  2,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MrsPsychic, -1
