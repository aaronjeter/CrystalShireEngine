	object_const_def
	const BIRCHSLAB_BIRCH

BirchsLab_MapScripts:
	def_scene_scripts

	def_callbacks	

ProfBirchScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENNITE_FROM_BIRCH
	iftrue BirchNormalScript

	sjump BirchGiveHoenniteScript

	closetext
	end

BirchGiveHoenniteScript:
	writetext BirchGiveHoenniteText
	promptbutton
	verbosegiveitem HOENNITE_X
	writetext BirchExplainsHoenniteText
	waitbutton
	setevent EVENT_GOT_HOENNITE_FROM_BIRCH
	closetext
	end	

BirchNormalScript:
	writetext BirchNormalText
	waitbutton
	closetext
	end

BirchGiveHoenniteText:
	text "Hey <PLAY_G>."

	para "Prof. Elm said"
	line "you might have a"
	cont "use for this."
	done

BirchExplainsHoenniteText:
	text "Certain #MON"
	line "from HOENN could"
	cont "use this."
	done

BirchNormalText:
	text "Hey <PLAY_G>."

	para "I hope you're"
	line "enjoying HOENN!"
	done

BirchsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event 04, 07, LITTLEROOT_TOWN, 3
	warp_event 05, 07, LITTLEROOT_TOWN, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfBirchScript, -1
