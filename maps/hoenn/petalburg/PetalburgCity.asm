	object_const_def
	const PETALBURGCITY_FISHER
	const PETALBURGCITY_GRANNY
	const PETALBURGCITY_COOLTRAINER_F
	const PETALBURGCITY_RARE_CANDY
	const PETALBURGCITY_POKEBALL
	const PETALBURGCITY_CORONA
	const PETALBURGCITY_YOUNGSTER
	const PETALBURGCITY_LASS
	const PETALBURGCITY_FISHER2

PetalburgCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, PetalburgCityFlypointCallback
	callback MAPCALLBACK_SPRITES, PetalburgCityMonSpritesCallback

PetalburgCityMonSpritesCallback:
	setmonsprite SPRITE_MON_1, MARS
	endcallback

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

PetalburgExpCandyM:
	itemball EXP_CANDY_M

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


PetalburgCityYoungsterScript:
	jumptextfaceplayer PetalburgCityYoungsterText

PetalburgCityYoungsterText:
	text "Norman's Gym is"
	line "tough! He uses"
	cont "Normal types."

	para "Fighting moves"
	line "hit them hard."
	cont "Bring some!"
	done

PetalburgCityLassScript:
	jumptextfaceplayer PetalburgCityLassText

PetalburgCityLassText:
	text "That house up"
	line "there is Wally's."

	para "He's a sweet kid."
	line "He left town with"
	cont "his first #mon."
	done

PetalburgCityFisher2Script:
	jumptextfaceplayer PetalburgCityFisher2Text

PetalburgCityFisher2Text:
	text "The pond here is"
	line "calm, so it's a"
	cont "good place to"
	cont "learn to fish."

	para "Just don't fall"
	line "in. I did once!"
	done

PetalburgCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  14,  9, PETALBURG_GYM,  1
	warp_event  19, 17, PETALBURG_POKECENTER,  2
	warp_event 25, 15, PETALBURG_MART,  2
	warp_event  9, 17, PETALBURG_HOUSE1,  2
	warp_event  19, 23, PETALBURG_HOUSE2,  2
	warp_event  7,  5, PETALBURG_WALLYS_HOUSE, 1

	def_coord_events

	def_bg_events	
	bg_event 13, 15, BGEVENT_READ, PetalburgCitySign
	bg_event 15,  9, BGEVENT_READ, PetalburgGymSign

	def_object_events
	object_event 19, 02, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgFisherScript, -1
	object_event 23, 23, SPRITE_GRANNY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PetalburgGrannyScript, -1
	object_event 14, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PetalburgCooltrainerFScript, -1
	object_event 06, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgRareCandy, EVENT_PETALBURG_CITY_RARE_CANDY
	object_event 27, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgExpCandyM, EVENT_PETALBURG_CITY_POKE_BALL
	object_event 05, 28, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Djinn_CoronaScript, EVENT_GOT_CORONA
	object_event 10, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgCityYoungsterScript, -1
	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgCityLassScript, -1
	object_event  6, 21, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgCityFisher2Script, -1
