	object_const_def
	const PETALBURGHOUSE2_GRAMPS

PetalburgHouse2_MapScripts:
	def_scene_scripts

	def_callbacks	

PetalburgHouse2_GrampsScript:
	jumptextfaceplayer PetalburgHouse2_GrampsText

PetalburgHouse2_GrampsText:
	text "The gym leader"
	line "in town now is"
	cont "named Norman."

	para "He moved here"
	line "a while back,"

	para "and brought his"
	line "family along."
	done

PetalburgHouse2_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, PETALBURG_CITY, 5
	warp_event  3, 7, PETALBURG_CITY, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  05,  04, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, PetalburgHouse2_GrampsScript, -1
