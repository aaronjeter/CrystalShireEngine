	object_const_def
	const CENTRALRADIO1F_RECEPTIONIST
	const CENTRALRADIO1F_REPORTER
	const CENTRALRADIO1F_INTERVIEWGUY
	const CENTRALRADIO1F_GUARD

CentralRadio1F_MapScripts:
	def_scene_scripts

	def_callbacks	

CentralRadio1FReceptionistScript:
	faceplayer
	opentext
	writetext CentralRadio1FReceptionistWelcomeText
	waitbutton
	closetext
	end

CentralRadio1FReceptionistWelcomeText:
	text "Welcome to"
	line "Central Radio!"
	done


CentralRadio1FReporterScript:
	opentext
	writetext CentralRadio1FReporterText
	waitbutton
	closetext
	end

CentralRadio1FReporterText:
	text "So, Mr. Rich,"
	line "what can you "

	para "tell us about"
	line "Devon's plans"

	para "for the Judge's"
	line "Cup?"
	done

CentralRadio1FInterviewguyScript:
	opentext
	writetext CentralRadio1FInterviewguyText
	waitbutton
	closetext
	end

CentralRadio1FInterviewguyText:
	text "Well miss,"
	line "you'll just have"
	cont "to wait and see!"
	done

CentralRadio1FGuardScript:
	opentext
	writetext CentralRadio1FGuardText
	waitbutton
	closetext
	end

CentralRadio1FGuardText:
	text "I'm sorry, but"
	line "employees only"
	cont "past here."
	done


CentralRadio1F_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  02,  07, CENTRAL_CITY, 4
	warp_event  03,  07, CENTRAL_CITY, 4

	def_coord_events

	def_bg_events	
	

	def_object_events
	object_event  05,  06, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CentralRadio1FReceptionistScript, -1
	object_event  14,  04, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CentralRadio1FReporterScript, -1
	object_event  16,  04, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CentralRadio1FInterviewguyScript, -1
	object_event  16,  01, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CentralRadio1FGuardScript, -1


