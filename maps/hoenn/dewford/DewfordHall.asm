	object_const_def
	const DEWFORDHALL_TRENDY
	const DEWFORDHALL_GIRL

DewfordHall_MapScripts:
	def_scene_scripts

	def_callbacks

DewfordHallTrendyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_AMULET_COIN
	iftrue .Got
	writetext DewfordHallTrendyOfferText
	promptbutton
	verbosegiveitem AMULET_COIN
	iffalse .Done
	setevent EVENT_GOT_HOENN_AMULET_COIN
.Got:
	writetext DewfordHallTrendyAfterText
	waitbutton
.Done:
	closetext
	end

DewfordHallGirlScript:
; one-time gift: Poison Barb
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_POISON_BARB
	iftrue .Gave
	writetext DewfordHallGirlGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse .NoRoom
	setevent EVENT_GOT_HOENN_POISON_BARB
	writetext DewfordHallGirlGiftAfterText
	waitbutton
.NoRoom:
	closetext
	end

.Gave:
	writetext DewfordHallGirlText
	waitbutton
	closetext
	end

DewfordHallGirlGiftText:
	text "This week fishing"
	line "is cool, so I"
	cont "went fishing!"

	para "I hooked a"
	line "Tentacool, and it"
	cont "left this behind."

	para "You can have it!"
	done

DewfordHallGirlGiftAfterText:
	text "A Poison Barb"
	line "powers up Poison-"
	cont "type moves."

	para "Next week, who"
	line "knows what's cool?"
	done


DewfordHallBookshelf:
	jumpstd MagazineBookshelfScript

DewfordHallTrendyOfferText:
	text "Welcome to Dewford"
	line "Hall! Here we talk"
	cont "about what's hot!"

	para "And the hottest"
	line "trend right now?"
	cont "Lucky charms!"

	para "Here, you can have"
	line "one. I've got my"
	cont "eye on the next"
	cont "big thing."
	done

DewfordHallTrendyAfterText:
	text "If the #mon"
	line "holding that coin"
	cont "battles, you earn"
	cont "double the prize"
	cont "money!"

	para "So trendy!"
	done

DewfordHallGirlText:
	text "Everyone in town"
	line "says something"
	cont "different is cool."

	para "Last week it was"
	line "Surf. This week"
	cont "it's fishing!"
	done

DewfordHall_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, DEWFORD_TOWN, 5
	warp_event  3,  7, DEWFORD_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, DewfordHallBookshelf
	bg_event 1,  1, BGEVENT_READ, DewfordHallBookshelf

	def_object_events
	object_event 5,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DewfordHallTrendyScript, -1
	object_event 2,  4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DewfordHallGirlScript, -1
