	object_const_def
	const FORTREEHIDDENPOWERHOUSE_MOM
	const FORTREEHIDDENPOWERHOUSE_GIRL
	const FORTREEHIDDENPOWERHOUSE_JIGGLYPUFF


FortreeHiddenPowerHouse_MapScripts:
	def_scene_scripts

	def_callbacks

HiddenPowerGirl:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGirlText1
	promptbutton
	verbosegiveitem TM_HIDDEN_POWER
	iffalse .Done
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGirlText2
	waitbutton
	closetext
	end
.AlreadyGotItem:
	writetext HiddenPowerGirlText3
	waitbutton
.Done:
	closetext
	end

HiddenPowerGirlText1:
	text "Ahh...a traveler"
	line "from far away..."

	para "Here I have medi-"
	line "tated. Among the"
	cont "windswept trees,"

	para "a new power has"
	line "been awakened."

	para "Let me share my"
	line "power with your"

	para "#mon."
	line "Take this, child."
	done

HiddenPowerGirlText2:
	text "Do you see it? It"
	line "is Hidden Power!"

	para "It draws out the"
	line "power of #mon"
	cont "for attacking."

	para "Remember this: its"
	line "type and power de-"
	cont "pend on the #-"
	cont "mon using it."
	done

HiddenPowerGirlText3:
	text "I am meditating..."

	para "Leave me, child."
	done

FortreeHiddenPowerHouseChildScript:
	jumptextfaceplayer FortreeHiddenPowerHouseChildText

FortreeHiddenPowerHouseChildText:
	text "Mom is weird."
	line "She makes good"
	cont "cookies though!"
	done

FortreeJigglypuffScript:
	opentext
	writetext FortreeJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

FortreeJigglypuffText:
	text "Jiig-uhh-lee-puff!"
	done

FortreeHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 7, FORTREE_CITY, 5
	warp_event  5, 7, FORTREE_CITY, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  8,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_AZURE, OBJECTTYPE_SCRIPT, 0, HiddenPowerGirl, -1
	object_event  1,  5, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, FortreeHiddenPowerHouseChildScript, -1
	object_event  3,  4, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, FortreeJigglypuffScript, -1
