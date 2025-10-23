	object_const_def
	const MAPROUTE116_JOEY
	const MAPROUTE116_JOHNSON
	const MAPROUTE116_KAREN
	const MAPROUTE116_JANICE
	const MAPROUTE116_JOSE
	const MAPROUTE116_CLARK
	const MAPROUTE116_DEVAN

Route116_MapScripts:
	def_scene_scripts

	def_callbacks	

Route116JoeyScript:
	trainer YOUNGSTER, ROUTE116_JOEY, EVENT_BEAT_ROUTE116_JOEY, Route116JoeySeenText, Route116JoeyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route116JoeyAfterBattleText
	waitbutton
	closetext
	end

Route116JoeySeenText:
	text "My #MON rule!"
	done

Route116JoeyBeatenText:
	text "Ouch! A scrape!"
	done

Route116JoeyAfterBattleText:
	text "Bandages are"
	line "signs of"
	cont "toughness!"
	done


Route116JohnsonScript:
	trainer YOUNGSTER, ROUTE116_JOHNSON, EVENT_BEAT_ROUTE116_JOHNSON, Route116JohnsonSeenText, Route116JohnsonBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route116JohnsonAfterBattleText
	waitbutton
	closetext
	end

Route116JohnsonSeenText:
	text "It's a dead end"
	line "up here."

	para "I'm bored, so can"
	line "we battle?"
	done

Route116JohnsonBeatenText:
	text "That was fun even"
	line "though I lost."
	done

Route116JohnsonAfterBattleText:
	text "Want to stay here"
	line "and keep me"
	cont "company?"
	done


Route116KarenScript:
	trainer LASS, ROUTE116_KAREN, EVENT_BEAT_ROUTE116_KAREN, Route116KarenSeenText, Route116KarenBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route116KarenAfterBattleText
	waitbutton
	closetext
	end

Route116KarenSeenText:
	text "I'm looking to"
	line "practice what I"

	para "learned at"
	line "school."
	done

Route116KarenBeatenText:
	text "I'm in shock."
	
	para "I lost again?"
	done

Route116KarenAfterBattleText:
	text "I can't beat you,"
	line "then. Not yet."
	done


Route116JaniceScript:
	trainer LASS, ROUTE116_JANICE, EVENT_BEAT_ROUTE116_JANICE, Route116JaniceSeenText, Route116JaniceBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route116JaniceAfterBattleText
	waitbutton
	closetext
	end

Route116JaniceSeenText:
	text "Let me teach you "
	line "how strong my"

	para "adorable #MON"
	line "is."
	done

Route116JaniceBeatenText:
	text "You're a notch"
	line "above me."
	done

Route116JaniceAfterBattleText:
	text "#MON that "
	line "possess cuteness"

	para "and power..."

	para "That's"
	line "ideal, I think."
	done


Route116JoseScript:
	trainer BUG_CATCHER, ROUTE116_JOSE, EVENT_BEAT_ROUTE116_JOSE, Route116JoseSeenText, Route116JoseBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route116JoseAfterBattleText
	waitbutton
	closetext
	end

Route116JoseSeenText:
	text "My BUG #MON"
	line "are tough!"

	para "Let's battle!"
	done

Route116JoseBeatenText:
	text "I lost!"

	para "I thought I"
	line "had you!"
	done

Route116JoseAfterBattleText:
	text "BUG #MON evolve"
	line "quickly."

	para "So they get"
	line "strong quickly,"
	cont "too."
	done


Route116ClarkScript:
	trainer HIKER, ROUTE116_CLARK, EVENT_BEAT_ROUTE116_CLARK, Route116ClarkSeenText, Route116ClarkBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route116ClarkAfterBattleText
	waitbutton
	closetext
	end

Route116ClarkSeenText:
	text "If the tunnel"
	line "doesn't go"

	para "through, then"
	line "I'll just go"
	cont "over the top."
	done

Route116ClarkBeatenText:
	text "Gasp... Gasp..."

	para "Losing made me"
	line "tired..."
	done

Route116ClarkAfterBattleText:
	text "It's no big deal"
	line "if there's no"
	cont "tunnel."

	para "To a HIKER,"
	line "mountains are"
	cont "roads!"
	done


Route116DevanScript:
	trainer HIKER, ROUTE116_DEVAN, EVENT_BEAT_ROUTE116_DEVAN, Route116DevanSeenText, Route116DevanBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route116DevanAfterBattleText
	waitbutton
	closetext
	end

Route116DevanSeenText:
	text "I'll rock you"
	line "hard!"
	done

Route116DevanBeatenText:
	text "Aiyiyi!"

	para "No contest!"
	done

Route116DevanAfterBattleText:
	text "I should try"
	line "different #MON"

	para "types, that's"
	line "what I ought"
	cont "to do."
	done

Route116_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 49, 09, RUSTURF_TUNNEL, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  07, 07, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route116JoeyScript, -1
	object_event  06, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route116JohnsonScript, -1
	object_event  20, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route116KarenScript, -1
	object_event  23, 05, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route116JaniceScript, -1
	object_event  31, 02, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route116JoseScript, -1
	object_event  28, 02, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route116ClarkScript, -1
	object_event  50, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route116DevanScript, -1
	