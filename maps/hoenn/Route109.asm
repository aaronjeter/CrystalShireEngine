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
	text "Hey!"
	done

Route109HueyBeatenText:
	text "Ugh!"
	done

Route109HueyAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route109EdmondBeatenText:
	text "Ugh!"
	done

Route109EdmondAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route109HaileyBeatenText:
	text "Ugh!"
	done

Route109HaileyAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route109RickyBeatenText:
	text "Ugh!"
	done

Route109RickyAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route109LolaBeatenText:
	text "Ugh!"
	done

Route109LolaAfterBattleText:
	text "Buzz off."
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
	text "Hey!"
	done

Route109ChandlerBeatenText:
	text "Ugh!"
	done

Route109ChandlerAfterBattleText:
	text "Buzz off."
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
	