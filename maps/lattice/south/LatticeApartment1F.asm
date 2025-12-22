	object_const_def
	const MAPROUTE104_BILLY
	const MAPROUTE104_DARIAN
	const MAPROUTE104_CINDY

LatticeApartment1F_MapScripts:
	def_scene_scripts

	def_callbacks

Route104BillyScript:
	trainer YOUNGSTER, ROUTE104_BILLY, EVENT_BEAT_ROUTE104_BILLY, Route104BillySeenText, Route104BillyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route104BillyAfterBattleText
	waitbutton
	closetext
	end

Route104BillySeenText:
	text "Ah!"
	line "Who are you?"
	done

Route104BillyBeatenText:
	text "Oof!"
	done

Route104BillyAfterBattleText:
	text "Go away!"
	done


Route104DarianScript:
	trainer FISHER, ROUTE104_DARIAN, EVENT_BEAT_ROUTE104_DARIAN, Route104DarianSeenText, Route104DarianBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route104DarianAfterBattleText
	waitbutton
	closetext
	end

Route104DarianSeenText:
	text "It's a long"
	line "walk to the beach"

	para "We should get"
	line "started."
	done

Route104DarianBeatenText:
	text "I needed that!"
	done

Route104DarianAfterBattleText:
	text "I'm really"
	line "excited to go"
	cont "fishing."
	done


Route104CindyScript:
	trainer BEAUTY, ROUTE104_CINDY, EVENT_BEAT_ROUTE104_CINDY, Route104CindySeenText, Route104CindyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route104CindyAfterBattleText
	waitbutton
	closetext
	end

Route104CindySeenText:
	text "I love sand!"
	
	para "Even if it does"
	line "get everywhere."
	done

Route104CindyBeatenText:
	text "That was fun!"
	done

Route104CindyAfterBattleText:
	text "I love going"
	line "to the beach with"
	cont "my family!"
	done

LatticeApartment1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  9, CITY_SOUTH, 7
	warp_event  7,  9, CITY_SOUTH, 7
	warp_event  7,  0, LATTICE_APARTMENT_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  02,  07, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, Route104BillyScript, -1
	object_event  00,  05, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route104DarianScript, -1
	object_event  02,  06, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, Route104CindyScript, -1
