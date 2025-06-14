	object_const_def	
	const ILEXWEST_SUNFLORA
	const ILEXWEST_HYPNO

IlexWest_MapScripts:
	def_scene_scripts

	def_callbacks	

IlexWestBarrierWeakenedText:
	text "You feel the"
	line "shadows shift."
	done

IlexWest_Sunflora:
	cry SUNFLORA
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon SUNFLORA, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_SUNFLORA
	disappear ILEXWEST_SUNFLORA
	opentext
	writetext IlexWestBarrierWeakenedText
	waitbutton
	closetext
	end

IlexWest_Hypno:
	cry HYPNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon HYPNO, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_HYPNO
	disappear ILEXWEST_HYPNO
	opentext
	writetext IlexWestBarrierWeakenedText
	waitbutton
	closetext
	end

IlexWest_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  39, 34, ILEX_FOREST, 4
	warp_event  39, 35, ILEX_FOREST, 5

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  3,  0, SPRITE_SUNFLORA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexWest_Sunflora, EVENT_DEFEATED_CELEBI_GUARDIAN_SUNFLORA
	object_event 17, 36, SPRITE_HYPNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexWest_Hypno, EVENT_DEFEATED_CELEBI_GUARDIAN_HYPNO
	