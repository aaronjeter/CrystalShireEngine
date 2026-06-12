	object_const_def

PetalburgCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, PetalburgCityFlypointCallback

PetalburgCityFlypointCallback:
	setflag ENGINE_FLYPOINT_PETALBURG
	endcallback

PetalburgCitySign:
	jumptext PetalburgCitySignText

PetalburgCitySignText:
	text "Petalburg City"

	para "Where people "
	line "mingle with"
	cont "nature."
	done

PetalburgGymSign:
	jumptext PetalburgGymSignText

PetalburgGymSignText:
	text "Petalburg City"
	line "#mon Gym"
	cont "Leader: Norman"

	para "The Ordinary"
	line "Master"
	done

PetalburgFisherScript:
	jumptextfaceplayer PetalburgFisherText

PetalburgFisherText:
	text "Yo, welcome to"
	line "my little corner"
	cont "of town."

	para "Pull up some"
	line "grass and enjoy"
	cont "the fishing!"
	done


PetalburgGrannyScript:
	jumptextfaceplayer PetalburgGrannyText

PetalburgGrannyText:
	text "Hi there sweetie."
	line "Please don't step"
	cont "on the flowers."
	done

PetalburgCooltrainerFScript:
	jumptextfaceplayer PetalburgCooltrainerFText

PetalburgCooltrainerFText:
	text "I don't think"
	line "I'm ready for"
	cont "Petalburg Gym."

	para "I think there's"
	line "another gym in"
	cont "Rustboro."

	para "I heard it's a"
	line "lot easier."
	done

PetalburgRareCandy:
	itemball RARE_CANDY

PetalburgPokeball:
	itemball POKE_BALL


PetalburgCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  14,  9, PETALBURG_GYM,  1
	warp_event  19, 17, PETALBURG_POKECENTER,  2
	warp_event  25, 13, PETALBURG_MART,  2
	warp_event  9, 17, PETALBURG_HOUSE1,  2
	warp_event  19, 23, PETALBURG_HOUSE2,  2

	def_coord_events

	def_bg_events	
	bg_event  15, 17, BGEVENT_READ, PetalburgCitySign
	bg_event  13, 11, BGEVENT_READ, PetalburgGymSign

	def_object_events
	object_event 19, 02, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgFisherScript, -1
	object_event 23, 23, SPRITE_GRANNY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PetalburgGrannyScript, -1
	object_event 14, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PetalburgCooltrainerFScript, -1
	object_event 06, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgRareCandy, EVENT_PETALBURG_CITY_RARE_CANDY
	object_event 27, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgPokeball, EVENT_PETALBURG_CITY_POKE_BALL
