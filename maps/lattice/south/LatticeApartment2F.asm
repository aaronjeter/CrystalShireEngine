	object_const_def
	const LATTICEAPARTMENT2F_POKEFAN_F
	const LATTICEAPARTMENT2F_POKEFAN_M
	const LATTICEAPARTMENT2F_GROWLITHE

LatticeApartment2F_MapScripts:
	def_scene_scripts

	def_callbacks

LatticeApartment2FPokefanFScript:
	faceplayer
	opentext
	writetext LatticeApartment2FPokefanFText
	waitbutton
	closetext
	turnobject LATTICEAPARTMENT2F_POKEFAN_F, UP
	end

LatticeApartment2FPokefanMScript:
	faceplayer
	opentext
	writetext LatticeApartment2FPokefanMText
	waitbutton
	closetext
	end

LatticeApartment2FGrowlithe:
	cry GROWLITHE
	end

LatticeApartment2FPokefanFText:
	text "Oh, hey."
	line "I'm busy right now."

	para "You should try"
	line "the trainers on"

	para "the roof."
	done

LatticeApartment2FPokefanMText:
	text "I tried facing"
	line "the trainers in"

	para "the park. I"
	line "had no chance!"
	done


LatticeApartment2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, LATTICE_APARTMENT_1F, 3
	warp_event  6,  0, LATTICE_APARTMENT_3F, 1	

	def_coord_events

	def_bg_events

	def_object_events
	object_event 00,  04, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LatticeApartment2FPokefanFScript, -1
	object_event 02,  04, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LatticeApartment2FPokefanMScript, -1
	object_event 04,  03, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LatticeApartment2FGrowlithe, -1