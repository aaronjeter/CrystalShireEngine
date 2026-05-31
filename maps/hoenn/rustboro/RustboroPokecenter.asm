	object_const_def
	const RUSTBOROPOKECENTER_NURSE
	const RUSTBOROPOKECENTER_CHANSEY
	const RUSTBOROPOKECENTER_HIKER
	const RUSTBOROPOKECENTER_MACHOKE
	const RUSTBOROPOKECENTER_TEACHER

RustboroPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

RustboroPokecenterNurseScript:
	jumpstd PokecenterNurseScript

RustboroPokecenterChanseyScript:
	cry CHANSEY
	end

RustboroPokecenterMachokeScript:
	cry MACHOKE
	end

RustboroPokecenterTeacherScript:
	jumptextfaceplayer RustboroPokecenterTeacherText

RustboroPokecenterTeacherText:
	text "I've heard Team"
	line "Rocket has been"

	para "seen around"
	line "Mauville City."

	para "I had hoped they"
	line "were gone for"
	cont "good!"
	done

RustboroPokecenterHikerScript:
	jumptextfaceplayer RustboroPokecenterHikerText

RustboroPokecenterHikerText:
	text "Rusturf Tunnel"
	line "is totally blocked"
	cont "now."

	para "I just tried to"
	line "go to Verdanturf."
	done

RustboroPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, RUSTBORO_CITY, 2
	warp_event  5,  7, RUSTBORO_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 05, 01, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterNurseScript, -1
	object_event 07, 01, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterChanseyScript, -1
	object_event 12, 05, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterHikerScript, -1
	object_event 12, 06, SPRITE_MACHOKE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterMachokeScript, -1
	object_event 07, 04, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RustboroPokecenterTeacherScript, -1
	