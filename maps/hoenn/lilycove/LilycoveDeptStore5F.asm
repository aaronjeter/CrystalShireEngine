	object_const_def
	const LILYCOVEDEPTSTORE5F_CLERK1
	const LILYCOVEDEPTSTORE5F_CLERK2

LilycoveDeptStore5F_MapScripts:
	def_scene_scripts

	def_callbacks

LilycoveDeptStore5FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_LILYCOVE_5F_MEDICINE
	closetext
	end

LilycoveDeptStore5FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_LILYCOVE_5F_DRUGS
	closetext
	end

LilycoveDeptStore5FDirectory:
	jumptext LilycoveDeptStore5FDirectoryText

LilycoveDeptStore5FElevatorButton:
	jumpstd ElevatorButtonScript

LilycoveDeptStore5FDirectoryText:
	text "5F: Drug Store"
	done

LilycoveDeptStore5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, LILYCOVE_DEPT_STORE_4F, 1
	warp_event 15,  0, LILYCOVE_DEPT_STORE_6F, 1
	warp_event  2,  0, LILYCOVE_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, LilycoveDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, LilycoveDeptStore5FElevatorButton

	def_object_events
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveDeptStore5FClerk1Script, -1
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveDeptStore5FClerk2Script, -1
