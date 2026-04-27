	object_const_def
	const SLATEPORTHARBOR_SAILOR1
	const SLATEPORTHARBOR_SAILOR2

SlateportHarbor_MapScripts:
	def_scene_scripts

	def_callbacks

	SlateportHarborJohtoSailorScript:
	faceplayer
	opentext
	writetext SlateportHarborJohtoText
	yesorno
	iffalse SlateportHarborNotRidingScript
	writetext SlateportHarborSailingText
	promptbutton
	closetext
	special FadeOutToWhite
	waitsfx
	warp OLIVINE_PORT, 15, 15
	end

	SlateportHarborKantoSailorScript:
	faceplayer
	opentext
	writetext SlateportHarborKantoText
	yesorno
	iffalse SlateportHarborNotRidingScript
	writetext SlateportHarborSailingText
	promptbutton
	closetext
	special FadeOutToWhite
	waitsfx
	warp VERMILION_PORT, 15, 11
	end
	

	SlateportHarborNotRidingScript:
	writetext SlateportHarborNotRidingText
	waitbutton
	closetext
	end

	SlateportHarborJohtoText:
	text "Do you want to"
	line "sail to Johto?"
	done

	SlateportHarborKantoText:
	text "Do you want to"
	line "sail to Kanto?"
	done

	SlateportHarborNotRidingText:
	text "OK."
	line "Have a nice day!"
	done

	SlateportHarborSailingText:
	text "Alright, have a"
	line "nice voyage."
	done


SlateportHarbor_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  15, SLATEPORT_CITY, 3
	warp_event  5,  15, SLATEPORT_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  13, 1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlateportHarborJohtoSailorScript, -1
	object_event  13, 9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlateportHarborKantoSailorScript, -1