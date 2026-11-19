	object_const_def
	const PETALBURGWALLYSHOUSE_DAD
	const PETALBURGWALLYSHOUSE_MOM

PetalburgWallysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PetalburgWallysHouseDadScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_PINK_BOW
	iftrue .Got
	writetext PetalburgWallysHouseDadOfferText
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse .Done
	setevent EVENT_GOT_HOENN_PINK_BOW
.Got:
	writetext PetalburgWallysHouseDadAfterText
	waitbutton
.Done:
	closetext
	end

PetalburgWallysHouseMomScript:
	jumptextfaceplayer PetalburgWallysHouseMomText

PetalburgWallysHouseBookshelf:
	jumpstd PictureBookshelfScript

PetalburgWallysHouseDadOfferText:
	text "Oh! You're a"
	line "trainer too?"

	para "Our son Wally set"
	line "out on his own"
	cont "journey not long"
	cont "ago."

	para "If you see him,"
	line "please be a good"
	cont "friend to him."

	para "Here, take this."
	line "He wanted to give"
	cont "it to a friend."
	done

PetalburgWallysHouseDadAfterText:
	text "A Pink Bow powers"
	line "up Normal-type"
	cont "moves."

	para "Norman taught"
	line "Wally that the"
	cont "plain moves are"
	cont "the strongest!"
	done

PetalburgWallysHouseMomText:
	text "Wally was so"
	line "sickly growing up."

	para "Now he's out"
	line "there battling"
	cont "with his #mon."

	para "I worry, but I've"
	line "never seen him"
	cont "so happy."
	done

PetalburgWallysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PETALBURG_CITY, 6
	warp_event  3,  7, PETALBURG_CITY, 6

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, PetalburgWallysHouseBookshelf
	bg_event 1,  1, BGEVENT_READ, PetalburgWallysHouseBookshelf

	def_object_events
	object_event 5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgWallysHouseDadScript, -1
	object_event 2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgWallysHouseMomScript, -1
