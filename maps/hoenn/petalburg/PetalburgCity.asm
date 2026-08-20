	object_const_def
	const PETALBURGCITY_FISHER
	const PETALBURGCITY_GRANNY
	const PETALBURGCITY_COOLTRAINER_F
	const PETALBURGCITY_RARE_CANDY
	const PETALBURGCITY_POKEBALL
	const PETALBURGCITY_CORONA

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

Djinn_CoronaScript:
	cry MARS
	opentext
	writetext Djinn_CoronaText
	yesorno
	iffalse .Done
	givepoke MARS, 24, CHARCOAL, Djinn_CoronaName, Djinn_CoronaOTName
	setevent EVENT_GOT_CORONA
	disappear PETALBURGCITY_CORONA
	.Done
	closetext	
	end

Djinn_CoronaName:
	db "Corona@"

Djinn_CoronaOTName:
	db "Jenna@" 

Djinn_CoronaText:
	text "You know, I think"
	line "I could boil this"
	cont "whole lake."

	para "Like, all the way"
	line "to dry dirt..."

	para "Probably not so"
	line "good for the"
	cont "folks in town"
	cont "though, eh?"

	para "We should group"
	line "up, and go find"
	cont "something safer"
	cont "to set on fire!"

	para "Invite Corona to"
	line "join your party?"
	done


PetalburgCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  14,  9, PETALBURG_GYM,  1
	warp_event  19, 17, PETALBURG_POKECENTER,  2
	warp_event 25, 15, PETALBURG_MART,  2
	warp_event  9, 17, PETALBURG_HOUSE1,  2
	warp_event  19, 23, PETALBURG_HOUSE2,  2

	def_coord_events

	def_bg_events	
	bg_event 13, 15, BGEVENT_READ, PetalburgCitySign
	bg_event 15,  9, BGEVENT_READ, PetalburgGymSign

	def_object_events
	object_event 19, 02, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgFisherScript, -1
	object_event 23, 23, SPRITE_GRANNY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PetalburgGrannyScript, -1
	object_event 14, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PetalburgCooltrainerFScript, -1
	object_event 06, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgRareCandy, EVENT_PETALBURG_CITY_RARE_CANDY
	object_event 27, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgPokeball, EVENT_PETALBURG_CITY_POKE_BALL
	object_event 05, 28, SPRITE_MARS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Djinn_CoronaScript, EVENT_GOT_CORONA
