	object_const_def
	const SOOTOPOLIS_FISHER

SootopolisFisherHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SootopolisFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext SootopolisFisherOfferSuperRodText
	yesorno
	iffalse .Refused
	writetext SootopolisFisherGiveSuperRodText
	promptbutton
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext SootopolisFisherGaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext SootopolisFisherDontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SootopolisFisherOfferSuperRodText:
	text "I can see that you"
	line "like fishing."

	para "There's no doubt"
	line "in my mind at all!"

	para "So? I know I'm"
	line "right."
	done

SootopolisFisherGiveSuperRodText:
	text "Yes, yes. Just as"
	line "I thought!"

	para "Here, fishing fan!"
	line "Take this--it's a"
	cont "Super Rod."
	done

SootopolisFisherGaveSuperRodText:
	text "Try your hand at"
	line "fishing wherever"
	cont "there is water."

	para "Remember--you can"
	line "catch different"

	para "#mon using"
	line "different Rods."
	done

SootopolisFisherDontWantSuperRodText:
	text "Huh? My own eyes"
	line "deceived me?"
	done

SootopolisFisherHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SOOTOPOLIS_CITY, 4
	warp_event  3,  7, SOOTOPOLIS_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  02, 03, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SootopolisFisherScript, -1
