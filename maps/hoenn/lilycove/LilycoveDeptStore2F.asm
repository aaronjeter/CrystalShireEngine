	object_const_def
	const LILYCOVEDEPTSTORE2F_CLERK1
	const LILYCOVEDEPTSTORE2F_CLERK2

LilycoveDeptStore2F_MapScripts:
	def_scene_scripts

	def_callbacks

LilycoveDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_LILYCOVE_2F_POKEBALLS
	closetext
	end

LilycoveDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_LILYCOVE_2F_GEAR
	closetext
	end

LilycoveDeptStore2FDirectory:
	jumptext LilycoveDeptStore2FDirectoryText

LilycoveDeptStore2FElevatorButton:
	jumpstd ElevatorButtonScript

LilycoveDeptStore2FDirectoryText:
	text "Top Grade Items"
	line "for Trainers!"

	para "2F: Trainer's"
	line "    Market"
	done

LilycoveDeptStore2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, LILYCOVE_DEPT_STORE_3F, 1
	warp_event 15,  0, LILYCOVE_DEPT_STORE_1F, 3
	warp_event  2,  0, LILYCOVE_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, LilycoveDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, LilycoveDeptStore2FElevatorButton

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveDeptStore2FClerk1Script, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LilycoveDeptStore2FClerk2Script, -1
