	object_const_def
	const LAVARIDGEEGGHOUSE_GRANNY
	const LAVARIDGEEGGHOUSE_HUSBAND

LavaridgeEggHouse_MapScripts:
	def_scene_scripts

	def_callbacks

LavaridgeEggHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LAVARIDGE_WYNAUT_EGG
	iftrue .Got
	writetext LavaridgeEggHouseGrannyOfferText
	yesorno
	iffalse .Refused
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg WYNAUT, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .GiveEgg
	setevent EVENT_GOT_LAVARIDGE_WYNAUT_EGG
	writetext LavaridgeEggHouseGrannyGotText
	waitbutton
	closetext
	end

.Got:
	writetext LavaridgeEggHouseGrannyAfterText
	waitbutton
	closetext
	end

.Refused:
	writetext LavaridgeEggHouseGrannyRefusedText
	waitbutton
	closetext
	end

.PartyFull:
	writetext LavaridgeEggHouseGrannyFullText
	waitbutton
	closetext
	end

.eggname
	db "Egg@"

.GiveEgg:
	jumpstd ReceiveTogepiEggScript
	end

LavaridgeEggHouseHusbandScript:
	jumptextfaceplayer LavaridgeEggHouseHusbandText

LavaridgeEggHouseBookshelf:
	jumpstd PictureBookshelfScript

LavaridgeEggHouseGrannyOfferText:
	text "Oh my, a young"
	line "trainer!"

	para "I raised this Egg"
	line "with love, but I'm"
	cont "too old to care"
	cont "for a baby now."

	para "Would you take it"
	line "with you?"
	done

LavaridgeEggHouseGrannyGotText:
	text "Take good care of"
	line "it, dear. It will"
	cont "hatch into a"
	cont "cheerful baby."
	done

LavaridgeEggHouseGrannyAfterText:
	text "Has my Egg"
	line "hatched yet?"

	para "Keep it in your"
	line "party while you"
	cont "walk. It will"
	cont "hatch soon."
	done

LavaridgeEggHouseGrannyRefusedText:
	text "Oh... Come back if"
	line "you change your"
	cont "mind, dear."
	done

LavaridgeEggHouseGrannyFullText:
	text "Your party is"
	line "full, dear. Make"
	cont "some room first."
	done

LavaridgeEggHouseHusbandText:
	text "My wife's #mon"
	line "are always laying"
	cont "Eggs."

	para "She loves to give"
	line "them to trainers"
	cont "passing through."
	done

LavaridgeEggHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVARIDGE_TOWN, 4
	warp_event  3,  7, LAVARIDGE_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, LavaridgeEggHouseBookshelf
	bg_event 1,  1, BGEVENT_READ, LavaridgeEggHouseBookshelf

	def_object_events
	object_event 5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavaridgeEggHouseGrannyScript, -1
	object_event 2,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavaridgeEggHouseHusbandScript, -1
