	object_const_def

JoifAlley_MapScripts:
	def_scene_scripts

	def_callbacks	

	JoifTrainerMarketSign:
	jumptext JoifTrainerMarketSignText

	JoifTrainerMarketSignText:
	text "Joif Trainer"
	line "Market"
	done

JoifAlley_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  06,  32, CENTRAL_CITY, 6
	warp_event  06,  33, CENTRAL_CITY, 5
	warp_event  06,  06, CENTRAL_CITY, 8
	warp_event  06,  07, CENTRAL_CITY, 7
	warp_event  22,  06, CENTRAL_CITY, 9
	warp_event  23,  06, CENTRAL_CITY, 10
	warp_event  33,  12, CENTRAL_CITY, 11
	warp_event  33,  13, CENTRAL_CITY, 12
	warp_event  15,  15, JOIF_TRAINER_MARKET, 2

	def_coord_events

	def_bg_events	
	bg_event 14,  16, BGEVENT_READ, JoifTrainerMarketSign
	

	def_object_events
