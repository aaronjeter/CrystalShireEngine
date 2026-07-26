	object_const_def
	const LILYCOVEDEPTSTORE4F_CLERK

LilycoveDeptStore4F_MapScripts:
	def_scene_scripts

	def_callbacks

LilycoveDeptStore4FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_4F
	closetext
	end

LilycoveDeptStore4FDirectory:
	jumptext LilycoveDeptStore4FDirectoryText

LilycoveDeptStore4FElevatorButton:
	jumpstd ElevatorButtonScript

LilycoveDeptStore4FDirectoryText:
	text "Express Yourself"
	line "With Gifts!"

	para "4F: Wiseman Gifts"
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
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveDeptStore4FClerkScript, -1
