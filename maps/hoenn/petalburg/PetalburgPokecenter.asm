	object_const_def
	const PETALBURGPOKECENTER_NURSE
	const PETALBURGPOKECENTER_CHANSEY
	const PETALBURGPOKECENTER_TEACHER
	const PETALBURGPOKECENTER_PIKACHU

PetalburgPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

PetalburgPokecenterNurseScript:
	jumpstd PokecenterNurseScript

PetalburgPokecenterChanseyScript:
	cry CHANSEY
	end

PetalburgPokecenterPikachuScript:
	cry PIKACHU
	end

PetalburgPokecenterTeacherScript:
	jumptextfaceplayer PetalburgPokecenterTeacherText

PetalburgPokecenterTeacherText:
	text "Hi <PLAY_G>!"

	para "You're a long"
	line "way from home!"
	done


PetalburgPokecenterCooltrainerScript:
	jumptextfaceplayer PetalburgPokecenterCooltrainerText

PetalburgPokecenterCooltrainerText:
	text "I think I"
	line "pushed my #mon"
	cont "too hard."

	para "The Gym leader"
	line "in this town is"
	cont "really tough!"
	done

PetalburgPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, PETALBURG_CITY, 2
	warp_event  5,  7, PETALBURG_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 05, 01, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PetalburgPokecenterNurseScript, -1
	object_event 07, 01, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PetalburgPokecenterChanseyScript, -1
	object_event 01, 05, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgPokecenterTeacherScript, -1
	object_event 08, 06, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PetalburgPokecenterPikachuScript, -1
	object_event 09, 03, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgPokecenterCooltrainerScript, -1
	