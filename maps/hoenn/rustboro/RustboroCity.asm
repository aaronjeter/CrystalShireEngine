	object_const_def
	const RUSTBORO_FISHER
	const RUSTBORO_GRAMPS

RustboroCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, RustboroCityFlypointCallback

RustboroCityFlypointCallback:
	setflag ENGINE_FLYPOINT_RUSTBORO
	endcallback

RustboroCitySign:
	jumptext RustboroCitySignText

RustboroCitySignText:
	text "Rustboro City"

	para "The city of"
	line "Nature and Science"
	done

RustboroCutterHouseSign:
	jumptext RustboroCutterHouseSignText

RustboroCutterHouseSignText:
	text "Cutter's House"
	done

RustboroGymSign:
	jumptext RustboroGymSignText

RustboroGymSignText:
	text "Rustboro City"
	line "#mon Gym"
	cont "Leader: Roxanne"

	para "Rock and"
	line "Stone"
	done

RustboroDevonSign:
	jumptext RustboroDevonSignText

RustboroDevonSignText:
	text "Devon Institute of"
	line "Genetic Science."

	para "Our business is"
	line "life itself!"
	done

RustboroFisherScript:
	jumptextfaceplayer RustboroFisherText

RustboroFisherText:
	text "I really want"
	line "to hike North"
	cont "to Meteor Falls."

	para "You can't get"
	line "up there from"
	cont "this side though."
	done


RustboroGrampsScript:
	jumptextfaceplayer RustboroGrampsText

RustboroGrampsText:
	text "It used to be"
	line "easier to get"

	para "around in the"
	line "Petalburg Woods."

	para "But then the"
	line "Cutter retired."
	done

RustboroBugCatcherScript:
	jumptextfaceplayer RustboroBugCatcherText

RustboroBugCatcherText:
	text "Rustboro's gym"
	line "leader is tough."

	para "I don't know how"
	line "my bugs are going"
	cont "to beat her..."
	done


RustboroTwinScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_POLKADOT_BOW
	iftrue RustboroTwin_AfterBow

	writetext RustboroTwinGiveBowText
	waitbutton 
	verbosegiveitem POLKADOT_BOW
	setevent EVENT_GOT_HOENN_POLKADOT_BOW
	waitbutton
	closetext
	end

RustboroTwin_AfterBow:
	writetext RustboroTwinAlreadyGivenBowText
	waitbutton
	closetext
	end

RustboroTwinGiveBowText:
	text "Hi! My mommy"
	line "says I'm a"
	cont "pretty, pretty"
	cont "princess!"

	para "Here, have a bow."
	line "Now you can be"
	cont "too!"
	done

RustboroTwinAlreadyGivenBowText:
	text "La La La..."
	line "I'm a pretty," 
	cont "pretty princess!"
	done

RustboroCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  26, 15, RUSTBORO_GYM, 1
	warp_event  13, 35, RUSTBORO_POKECENTER, 2
	warp_event  13, 43, RUSTBORO_MART, 2
	warp_event  07, 35, RUSTBORO_CUTTER_HOUSE, 2
	warp_event  29, 49, RUSTBORO_TRADE_HOUSE, 2
	warp_event  08, 15, RUSTBORO_DEVON_LAB, 1
	warp_event  09, 15, RUSTBORO_DEVON_LAB, 2

	def_coord_events

	def_bg_events	
	bg_event  16, 46, BGEVENT_READ, RustboroCitySign
	bg_event  10, 34, BGEVENT_READ, RustboroCutterHouseSign
	bg_event  27, 15, BGEVENT_READ, RustboroGymSign
	bg_event  12, 18, BGEVENT_READ, RustboroDevonSign

	def_object_events
	object_event  16,  09, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RustboroFisherScript, -1
	object_event  15,  39, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RustboroGrampsScript, -1
	object_event  23,  18, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RustboroBugCatcherScript, -1
	object_event 29, 26, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, RustboroTwinScript, -1
