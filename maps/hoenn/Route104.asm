	object_const_def
	const MAPROUTE104_BILLY
	const MAPROUTE104_DARIAN
	const MAPROUTE104_CINDY
	const MAPROUTE104_WINSTON
	const MAPROUTE104_HALEY
	const MAPROUTE104_GINA
	const MAPROUTE104_MIA
	const MAPROUTE104_IVAN

Route104_MapScripts:
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
	text "I just love"
	line "the beach."
	done

Route104BillyBeatenText:
	text "Oof!"
	done

Route104BillyAfterBattleText:
	text "South of here"
	line "is DEWFORD"
	cont "CITY."
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

	para "How about"
	line "a break?"
	done

Route104DarianBeatenText:
	text "I needed that!"
	done

Route104DarianAfterBattleText:
	text "I'm really"
	line "excited to go"
	cont "fishing."

	para "It's been a long"
	line "walk."
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
	text "I love coming"
	line "to the beach with"
	cont "my family!"
	done


Route104WinstonScript:
	trainer CAMPER, ROUTE104_WINSTON, EVENT_BEAT_ROUTE104_WINSTON, Route104WinstonSeenText, Route104WinstonBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route104WinstonAfterBattleText
	waitbutton
	closetext
	end

Route104WinstonSeenText:
	text "I love to walk"
	line "out here."

	para "It's a nice"
	line "break from the"
	cont "city."
	done

Route104WinstonBeatenText:
	text "You're pretty"
	line "good!"
	done

Route104WinstonAfterBattleText:
	text "It's a shame"
	line "you can't just"
	cont "buy talent..."
	done


Route104HaleyScript:
	trainer LASS, ROUTE104_HALEY, EVENT_BEAT_ROUTE104_HALEY, Route104HaleySeenText, Route104HaleyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route104HaleyAfterBattleText
	waitbutton
	closetext
	end

Route104HaleySeenText:
	text "Are you going"
	line "to RUSTBORO?"
	done

Route104HaleyBeatenText:
	text "Yikes!"
	line "Take it easy!"
	done

Route104HaleyAfterBattleText:
	text "I'm trying to"
	line "get to PETALBURG"
	cont "CITY."

	para "It's over the"
	line "river and"
	cont "through the"
	cont "woods."
	done


Route104GinaScript:
	trainer TWINS, ROUTE104_GINAMIA, EVENT_BEAT_ROUTE104_GINAMIA, Route104GinaMiaSeenText, Route104GinaMiaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route104GinaMiaAfterBattleText
	waitbutton
	closetext
	end

Route104MiaScript:
	trainer TWINS, ROUTE104_GINAMIA, EVENT_BEAT_ROUTE104_GINAMIA, Route104GinaMiaSeenText, Route104GinaMiaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route104GinaMiaAfterBattleText
	waitbutton
	closetext
	end

Route104GinaMiaSeenText:
	text "Me and my sister"
	line "love battling"
	cont "together!"
	done

Route104GinaMiaBeatenText:
	text "You're really"
	line "good at this!"
	done

Route104GinaMiaAfterBattleText:
	text "We hope our"
	line "bond will make"
	cont "our #MON"
	cont "stronger too."
	done


Route104IvanScript:
	trainer FISHER, ROUTE104_IVAN, EVENT_BEAT_ROUTE104_IVAN, Route104IvanSeenText, Route104IvanBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route104IvanAfterBattleText
	waitbutton
	closetext
	end

Route104IvanSeenText:
	text "Hey! Watch it!"
	done

Route104IvanBeatenText:
	text "You made me"
	line "lose that FEEBAS!"
	done

Route104IvanAfterBattleText:
	text "I love fishing"
	line "out here!"

	para "It's so serene."
	done


Route104_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 27, PETALBURG_WOODS, 1
	warp_event  3, 27, PETALBURG_WOODS, 2
	warp_event 10, 30, PETALBURG_WOODS, 3
	warp_event 11, 30, PETALBURG_WOODS, 4
	warp_event 24, 32, PETALBURG_WOODS, 5
	warp_event 25, 32, PETALBURG_WOODS, 6
	warp_event 11, 43, MR_BRINEY_HOUSE, 2
	warp_event  5, 15, ROUTE_104_FLOWER_HOUSE, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  22,  51, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route104BillyScript, -1
	object_event  06,  45, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route104DarianScript, -1
	object_event  15,  48, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, Route104CindyScript, -1
	object_event  11,  22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route104WinstonScript, -1
	object_event  24,  20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route104HaleyScript, -1
	object_event  20,  12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, Route104GinaScript, -1
	object_event  21,  12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, Route104MiaScript, -1
	object_event  22,   7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, Route104IvanScript, -1
	