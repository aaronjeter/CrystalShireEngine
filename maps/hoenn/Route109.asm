	object_const_def
	const MAPROUTE109_HUEY
	const MAPROUTE109_EDMOND
	const MAPROUTE109_HAILEY
	const MAPROUTE109_RICKY
	const MAPROUTE109_LOLA
	const MAPROUTE109_CHANDLER

Route109_MapScripts:
	def_scene_scripts

	def_callbacks	

Route109HueyScript:
	trainer SAILOR, ROUTE109_HUEY, EVENT_BEAT_ROUTE109_HUEY, Route109HueySeenText, Route109HueyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route109HueyAfterBattleText
	waitbutton
	closetext
	end

Route109HueySeenText:
	text "I've been to"
	line "ports all over."

	para "But Slateport"
	line "is the best!"
	done

Route109HueyBeatenText:
	text "You're the best!"
	done

Route109HueyAfterBattleText:
	text "Best trainer in"
	line "the best port!"
	done


Route109EdmondScript:
	trainer SAILOR, ROUTE109_EDMOND, EVENT_BEAT_ROUTE109_EDMOND, Route109EdmondSeenText, Route109EdmondBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route109EdmondAfterBattleText
	waitbutton
	closetext
	end

Route109EdmondSeenText:
	text "Urrrrppp!"
	done

Route109EdmondBeatenText:
	text "Ooooooohhhhhh!"
	done

Route109EdmondAfterBattleText:
	text "I usually haven't"
	line "had so much to"
	cont "drink..."
	done


Route109HaileyScript:
	trainer BEAUTY, ROUTE109_HAILEY, EVENT_BEAT_ROUTE109_HAILEY, Route109HaileySeenText, Route109HaileyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route109HaileyAfterBattleText
	waitbutton
	closetext
	end

Route109HaileySeenText:
	text "I can't swim,"
	line "so I'm just"
	cont "lounging."
	done

Route109HaileyBeatenText:
	text "I thought so."
	done

Route109HaileyAfterBattleText:
	text "Once I learn to"
	line "swim..."

	para "Maybe my #mon"
	line "will improve."
	done


Route109RickyScript:
	trainer SAILOR, ROUTE109_RICKY, EVENT_BEAT_ROUTE109_RICKY, Route109RickySeenText, Route109RickyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route109RickyAfterBattleText
	waitbutton
	closetext
	end

Route109RickySeenText:
	text "I'm so thirsty!"
	done

Route109RickyBeatenText:
	text "Groan!"
	done

Route109RickyAfterBattleText:
	text "I'm so hungry I"
	line "could eat a"
	cont "life vest!"
	done


Route109LolaScript:
	trainer BEAUTY, ROUTE109_LOLA, EVENT_BEAT_ROUTE109_LOLA, Route109LolaSeenText, Route109LolaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route109LolaAfterBattleText
	waitbutton
	closetext
	end

Route109LolaSeenText:
	text "Doesn't a beach"
	line "umbrella look like"
	cont "a big flower?"
	done

Route109LolaBeatenText:
	text "What a shame."
	done

Route109LolaAfterBattleText:
	text "From the sky,"
	line "this must be"
	cont "beautiful."
	done


Route109ChandlerScript:
	trainer SAILOR, ROUTE109_CHANDLER, EVENT_BEAT_ROUTE109_CHANDLER, Route109ChandlerSeenText, Route109ChandlerBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route109ChandlerAfterBattleText
	waitbutton
	closetext
	end

Route109ChandlerSeenText:
	text "Tada!"
	line "Look at my"
	cont "outfit!"
	done

Route109ChandlerBeatenText:
	text "Oh! Too bad!"
	done

Route109ChandlerAfterBattleText:
	text "I just can't"
	line "get ahead..."
	done

Route109_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 25, 31, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, Route109HueyScript, -1
	object_event 30, 50, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route109EdmondScript, -1
	object_event 31, 50, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route109HaileyScript, -1
	object_event 12, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route109RickyScript, -1
	object_event 19, 16, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route109LolaScript, -1
	object_event 22, 10, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route109ChandlerScript, -1
	