	object_const_def
	const LILYCOVEDEPTSTORE3F_CLERK

LilycoveDeptStore3F_MapScripts:
	def_scene_scripts

	def_callbacks

LilycoveDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_LILYCOVE_3F_TMS
	closetext
	end

LilycoveDeptStore3FElevatorButton:
	jumpstd ElevatorButtonScript

LilycoveDeptStore3FDirectory:
	jumptext LilycoveDeptStore3FDirectoryText

LilycoveDeptStore3FDirectoryText:
	text "3F: TM Shop"

	para "Make Your #mon"
	line "Stronger!"
	done

LilycoveDeptStore3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, LILYCOVE_DEPT_STORE_2F, 1
	warp_event 15,  0, LILYCOVE_DEPT_STORE_4F, 2
	warp_event  2,  0, LILYCOVE_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, LilycoveDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, LilycoveDeptStore3FElevatorButton

	def_object_events
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveDeptStore3FClerkScript, -1
