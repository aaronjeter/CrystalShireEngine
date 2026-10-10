	object_const_def

FortreeHouse1_MapScripts:
	def_scene_scripts

	def_callbacks	

FortreeHouse1GentlemanScript:
	jumptextfaceplayer FortreeHouse1GentlemanText

FortreeHouse1GentlemanText:
	text "Fortree is a nice"
	line "place to live..."

	para "The constant rain"
	line "does get old,"
	cont "however."
	done

FortreeTreeckoScript:	
	cry TREECKO
	end

FortreeHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 7, FORTREE_CITY, 6
	warp_event  5, 7, FORTREE_CITY, 6

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  7,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FortreeHouse1GentlemanScript, -1
	object_event  8,  1, SPRITE_TREECKO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FortreeTreeckoScript, -1
