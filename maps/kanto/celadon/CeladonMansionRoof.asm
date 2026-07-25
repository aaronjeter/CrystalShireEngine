	object_const_def
	const CELADONMANSIONROOF_FISHER
	const CELADONMANSIONROOF_WISP

CeladonMansionRoof_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofFisherScript:
	jumptextfaceplayer CeladonMansionRoofFisherText

CeladonMansionRoofGraffiti:
	jumptext CeladonMansionRoofGraffitiText

CeladonMansionRoofFisherText:
	text "High places--I do"
	line "love them so!"

	para "I'd say the only"
	line "thing that loves"

	para "heights as much as"
	line "me is smoke!"
	done

CeladonMansionRoofGraffitiText:
	text "There's graffiti"
	line "on the wall…"

	para "<PLAYER> added a"
	line "moustache!"
	done

Djinn_WispScript:
	cry JUPITER
	opentext
	writetext Djinn_WispText
	yesorno
	iffalse .Done
	givepoke JUPITER, 24, KINGS_ROCK, Djinn_WispName, Djinn_WispOTName
	setevent EVENT_GOT_WISP
	disappear CELADONMANSIONROOF_WISP
	.Done
	closetext	
	end

Djinn_WispName:
	db "Wisp@"

Djinn_WispOTName:
	db "Sheba@" 

Djinn_WispText:
	text "Hi there, fellow"
	line "kid! I'm totally"
	cont "a #mon."

	para "You should put"
	line "me in a # ball"
	cont "and tell me to"
	cont "kill stuff."

	para "That's how this"
	line "works, right?"

	para "Invite Wisp to"
	line "join your party?"
	done

CeladonMansionRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_LEFT, CeladonMansionRoofGraffiti

	def_object_events
	object_event 07, 05, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofFisherScript, -1
	object_event 04, 01, SPRITE_JUPITER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Djinn_WispScript, EVENT_GOT_WISP
