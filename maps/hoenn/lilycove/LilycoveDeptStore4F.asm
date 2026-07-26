	object_const_def
	const LILYCOVEDEPTSTORE4F_CLERK
	const LILYCOVEDEPTSTORE4F_POKEFAN_F

LilycoveDeptStore4F_MapScripts:
	def_scene_scripts

	def_callbacks

LilycoveDeptStore4FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_LILYCOVE_4F_STONES
	closetext
	end

LilycoveDeptStore4FDirectory:
	jumptext LilycoveDeptStore4FDirectoryText

LilycoveDeptStore4FElevatorButton:
	jumpstd ElevatorButtonScript

LilycoveDeptStore4FDirectoryText:
	text "Express Yourself"
	line "With Shiny Rocks!"

	para "4F: Wiseman Stones"
	done

LilycoveDept4FPokefanFScript:
	jumptextfaceplayer LilycoveDept4FPokefanFText

LilycoveDept4FPokefanFText:
	text "Sun stone for"
	line "Espeon..."

	para "Moon stone for"
	line "Umberon..."

	para "Dawn stone for"
	line "Sylveon...I think?"
	done

LilycoveDept4FLassScript:
	jumptextfaceplayer LilycoveDept4FLassText

LilycoveDept4FLassText:
	text "I need to find a"
	line "Dawn Stone for my"
	cont "Snorunt..."

	para "Froslass is so "
	line "lovely!"

	para "Oh! And a Water"
	line "Stone for my"
	cont "Lotad!"
	done

LilycoveDeptStore4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, LILYCOVE_DEPT_STORE_5F, 1
	warp_event 15,  0, LILYCOVE_DEPT_STORE_3F, 2
	warp_event  2,  0, LILYCOVE_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, LilycoveDeptStore4FDirectory
	bg_event  3,  0, BGEVENT_READ, LilycoveDeptStore4FElevatorButton

	def_object_events
	object_event  13,  05, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveDeptStore4FClerkScript, -1
	object_event  06,  06, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LilycoveDept4FPokefanFScript, -1
	object_event  05,  02, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LilycoveDept4FLassScript, -1
