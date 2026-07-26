	object_const_def

LilycoveDeptStoreRoof_MapScripts:
	def_scene_scripts

	def_callbacks

LilycoveBinoculars1:
	jumptext LilycoveBinoculars1Text

LilycoveBinoculars2:
	setflag ENGINE_FLYPOINT_SOOTOPOLIS
	jumptext LilycoveBinoculars2Text

LilycoveBinoculars3:
	jumptext LilycoveBinoculars3Text

LilycovePokeDollVendingMachine:
	jumptext LilycovePokeDollVendingMachineText

LilycoveBinoculars1Text:
	text "You see a huge"
	line "green serpent soar"
	cont "lazily through the"
	cont "sky..."		
	done

LilycoveBinoculars2Text:
	text "You see a tiny"
	line "white city on"
	cont "an island."

	para "You could probably"
	line "fly right over!"
	done

LilycoveBinoculars3Text:
	text "You see a chilly"
	line "looking cove in"
	cont "the middle of the"
	cont "sea..."
	done

LilycovePokeDollVendingMachineText:
	text "A vending machine"
	line "for #mon dolls?"

	para "Insert money, then"
	line "turn the crank…"

	para "But it's empty…"
	done

LilycoveDeptStoreRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  1, LILYCOVE_DEPT_STORE_6F, 2

	def_coord_events

	def_bg_events
	bg_event 15, 03, BGEVENT_RIGHT, LilycoveBinoculars1
	bg_event 15, 05, BGEVENT_RIGHT, LilycoveBinoculars2
	bg_event 15, 06, BGEVENT_RIGHT, LilycoveBinoculars3
	bg_event 03, 00, BGEVENT_UP, LilycovePokeDollVendingMachine

	def_object_events
	