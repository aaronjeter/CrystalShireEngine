	object_const_def
	const LILYCOVEDEPTSTORE1F_RECEPTIONIST

LilycoveDeptStore1F_MapScripts:
	def_scene_scripts

	def_callbacks

LilycoveDeptStore1FReceptionistScript:
	jumptextfaceplayer LilycoveDeptStore1FReceptionistText

LilycoveDeptStore1FDirectory:
	jumptext LilycoveDeptStore1FDirectoryText

LilycoveDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

LilycoveDeptStore1FReceptionistText:
	text "Hello! Welcome to"
	line "Lilycove Dept."
	cont "Store!"

	para "The directory is"
	line "on the wall."
	done

LilycoveDeptStore1FDirectoryText:
	text "1F: Service"
	line "    Counter"

	para "2F: Trainer's"
	line "    Market"

	para "3F: TM Shop"

	para "4F: Wiseman Stones"

	para "5F: Drug Store"

	para "6F: Rooftop"
	line "    Square"
	done

LilycoveDeptStore1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  07, 07, LILYCOVE_CITY, 5
	warp_event  08, 07, LILYCOVE_CITY, 6
	warp_event  15, 00, LILYCOVE_DEPT_STORE_2F, 2
	warp_event  02, 00, LILYCOVE_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14, 00, BGEVENT_READ, LilycoveDeptStore1FDirectory
	bg_event 03, 00, BGEVENT_READ, LilycoveDeptStore1FElevatorButton

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LilycoveDeptStore1FReceptionistScript, -1
