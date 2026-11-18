	object_const_def
	const SOOTOPOLISBERRYHOUSE_LADY

SootopolisBerryHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SootopolisBerryHouseLadyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SOOTOPOLIS_LUM_BERRY
	iftrue .Got
	writetext SootopolisBerryHouseOfferText
	promptbutton
	verbosegiveitem LUM_BERRY
	iffalse .Done
	setevent EVENT_GOT_SOOTOPOLIS_LUM_BERRY
.Got:
	writetext SootopolisBerryHouseAfterText
	waitbutton
.Done:
	closetext
	end

SootopolisBerryHouseOfferText:
	text "My garden is tiny,"
	line "but this Berry"
	cont "grew so well!"

	para "Please take it."
	done

SootopolisBerryHouseAfterText:
	text "A Lum Berry cures"
	line "any status problem"
	cont "in a pinch."
	done

SootopolisBerryHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SOOTOPOLIS_CITY, 8
	warp_event  3,  7, SOOTOPOLIS_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SootopolisBerryHouseLadyScript, -1
