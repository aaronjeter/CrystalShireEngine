	object_const_def

FortreeHouse2_MapScripts:
	def_scene_scripts

	def_callbacks

FortreeHouse2TeacherScript:
	jumptextfaceplayer FortreeHouse2TeacherText

FortreeHouse2TeacherText:
	text "Oh, you must be"
	line "a trainer..."

	para "If you've come"
	line "for Winona's,"
	cont "badge beware..."

	para "She doesn't just"
	line "train Birds..."
	done

FortreeVulpixScript:	
	cry VULPIX
	end

FortreeHouse2_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 7, FORTREE_CITY, 7
	warp_event  5, 7, FORTREE_CITY, 7

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  7,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FortreeHouse2TeacherScript, -1
	object_event  9,  5, SPRITE_VULPIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_WHITE, OBJECTTYPE_SCRIPT, 0, FortreeVulpixScript, -1
	object_event  4,  1, SPRITE_VULPIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FortreeVulpixScript, -1
