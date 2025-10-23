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
	text "Hi!"
	done

Route116JoeyBeatenText:
	text "Aww."
	done

Route116JoeyAfterBattleText:
	text "Bye!"
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
	text "Hi!"
	done

Route116JohnsonBeatenText:
	text "Aww."
	done

Route116JohnsonAfterBattleText:
	text "Bye!"
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
	text "Hi!"
	done

Route116KarenBeatenText:
	text "Aww."
	done

Route116KarenAfterBattleText:
	text "Bye!"
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
	text "Hi!"
	done

Route116JaniceBeatenText:
	text "Aww."
	done

Route116JaniceAfterBattleText:
	text "Bye!"
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
	text "Hi!"
	done

Route116JoseBeatenText:
	text "Aww."
	done

Route116JoseAfterBattleText:
	text "Bye!"
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
	text "Hi!"
	done

Route116ClarkBeatenText:
	text "Aww."
	done

Route116ClarkAfterBattleText:
	text "Bye!"
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
	text "Hi!"
	done

Route116DevanBeatenText:
	text "Aww."
	done

Route116DevanAfterBattleText:
	text "Bye!"
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
	