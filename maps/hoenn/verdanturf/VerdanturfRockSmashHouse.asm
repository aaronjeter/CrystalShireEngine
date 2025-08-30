	object_const_def
	const VERDANTURFROCKSMASHHOUSE_ROCKSMASHGUY
	const ROCKSMASHHOUSE_WIFE

VerdanturfRockSmashHouse_MapScripts:
	def_scene_scripts

	def_callbacks

RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PICKAXE
	iftrue RockSmashGuyScript_AfterPickaxe

	writetext GivePickaxeText
	waitbutton 
	verbosegiveitem PICKAXE
	setevent EVENT_GOT_PICKAXE
	waitbutton
	closetext
	end

RockSmashGuyScript_AfterPickaxe:
	writetext AlreadyGivenPickaxeText
	waitbutton
	closetext
	end

GivePickaxeText:
	text "Hi there."

	para "I dug the"
	line "RUSTURF Tunnel"
	cont "so I could"
	cont "visit my"
	cont "girlfriend."

	para "I used to"
	line "clear rocks"
	cont "to keep the"
	cont "path passable."

	para "But then we got"
	line "married and I"
	cont "moved in here."

	para "It's a lot"
	line "harder to find"
	cont "time to clear"
	cont "the tunnel now!"

	para "Here, take"
	line "my spare PICKAXE."

	para "It'll let you"
	line "clear small"
	cont "rocks."

	para "You can get"
	line "back to"
	cont "RUSTBORO in"
	cont "a pinch now."
	done

AlreadyGivenPickaxeText:
	text "I hope that"
	line "PICKAXE of"
	cont "mine serves"
	cont "you well."
	done


RockSmashWifeScript:
	faceplayer
	opentext
	writetext RockSmashWifeText
	waitbutton
	closetext
	end

RockSmashWifeText:
	text "My husband"
	line "dug a whole"
	cont "tunnel just to"
	cont "see me."

	para "Isn't that"
	line "romantic?"
	done

VerdanturfRockSmashHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERDANTURF_TOWN, 4
	warp_event  3,  7, VERDANTURF_TOWN, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSmashGuyScript, -1
	object_event  5,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSmashWifeScript, -1
