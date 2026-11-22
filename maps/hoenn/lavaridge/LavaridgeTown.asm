	object_const_def

LavaridgeTown_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, LavaridgeTownFlypointCallback

LavaridgeTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LAVARIDGE
	endcallback

LavaridgeTownSign:
	jumptext LavaridgeTownSignText

LavaridgeTownSignText:
	text "Lavaridge Town"

	para "An excellent"
	line "place for"
	cont "relaxing."
	done

LavaridgeGymSign:
	jumptext LavaridgeGymSignText

LavaridgeGymSignText:
	text "Lavaridge Town"
	line "#mon Gym"
	cont "Leader: Flannery"

	para "One with"
	line "fiery passion"
	cont "that burns."
	done

LavaridgeGrannyScript:
	jumptextfaceplayer LavaridgeGrannyText

LavaridgeGrannyText:
	text "This hot spring"
	line "feels great on"
	cont "my old joints."
	done

LavaridgeAceScript:
	jumptextfaceplayer LavaridgeAceText

LavaridgeAceText:
	text "Ugh, my team"
	line "got smoked."

	para "I thought Flannery"
	line "would just fold"
	cont "to a water type."
	done

LavaridgeTownHotSpring:
	opentext
	writetext LavaridgeTownHotSpringText
	yesorno
	iffalse .No
	closetext
	special FadeOutToWhite
	special LoadMapPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes_EnableDynNoApply
	special RestartMapMusic
	opentext
	writetext LavaridgeTownSoakedText
	waitbutton
.No:
	closetext
	end

LavaridgeTownHotSpringText:
	text "It's a hot spring!"
	line "Take a soak?"
	done

LavaridgeTownSoakedText:
	text "Your #mon are"
	line "all warmed up and"
	cont "feel great!"
	done

LavaridgeTownHikerScript:
; one-time gift: Charcoal
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_CHARCOAL
	iftrue .Gave
	writetext LavaridgeTownHikerGiftText
	promptbutton
	verbosegiveitem CHARCOAL
	iffalse .NoRoom
	setevent EVENT_GOT_HOENN_CHARCOAL
	writetext LavaridgeTownHikerGiftAfterText
	waitbutton
.NoRoom:
	closetext
	end

.Gave:
	writetext LavaridgeTownHikerText
	waitbutton
	closetext
	end

LavaridgeTownHikerGiftText:
	text "Mt. Chimney's heat"
	line "bakes the wood on"
	cont "its slopes black."

	para "Here, a lump of"
	line "Charcoal for you!"
	done

LavaridgeTownHikerGiftAfterText:
	text "Charcoal powers up"
	line "Fire-type moves."

	para "Give it to a Fire"
	line "#mon to hold!"
	done


LavaridgeTownHikerText:
	text "Mt. Chimney looms"
	line "right over town."

	para "The heat from it"
	line "warms the springs."
	cont "Lucky us!"
	done

LavaridgeTownTwinScript:
	jumptextfaceplayer LavaridgeTownTwinText

LavaridgeTownTwinText:
	text "Grandma in that"
	line "little house gives"
	cont "Eggs to trainers!"
	done

LavaridgeTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 11,  7, LAVARIDGE_POKECENTER, 2
	warp_event 17,  7, LAVARIDGE_MART, 2
	warp_event  6, 13, LAVARIDGE_GYM, 2
	warp_event 17, 13, LAVARIDGE_EGG_HOUSE, 1

	def_coord_events

	def_bg_events	
	bg_event 13, 11, BGEVENT_READ, LavaridgeTownSign
	bg_event  7, 13, BGEVENT_READ, LavaridgeGymSign
	bg_event  7,  5, BGEVENT_UP, LavaridgeTownHotSpring
	bg_event  8,  5, BGEVENT_UP, LavaridgeTownHotSpring

	def_object_events
	object_event 07, 07, SPRITE_GRANNY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavaridgeGrannyScript, -1
	object_event 12, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LavaridgeAceScript, -1
	object_event 14, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LavaridgeTownHikerScript, -1
	object_event 18, 15, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavaridgeTownTwinScript, -1
