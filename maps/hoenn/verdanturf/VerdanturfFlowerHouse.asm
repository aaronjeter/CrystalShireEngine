	object_const_def
	const VERDANTURFFLOWERHOUSE_LADY
	const VERDANTURFFLOWERHOUSE_GIRL

VerdanturfFlowerHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VerdanturfFlowerHouseLadyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_VERDANTURF_MIRACLE_SEED
	iftrue .Got
	writetext VerdanturfFlowerHouseOfferText
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse .Done
	setevent EVENT_GOT_VERDANTURF_MIRACLE_SEED
.Got:
	writetext VerdanturfFlowerHouseAfterText
	waitbutton
.Done:
	closetext
	end

VerdanturfFlowerHouseGirlScript:
	jumptextfaceplayer VerdanturfFlowerHouseGirlText

VerdanturfFlowerHouseOfferText:
	text "Flowers grow so"
	line "well in this clean"
	cont "air!"

	para "My best plant gave"
	line "me this seed."
	cont "Please take it."
	done

VerdanturfFlowerHouseAfterText:
	text "When a #mon"
	line "holds a Miracle"
	cont "Seed, its Grass-"
	cont "type moves get"
	cont "stronger."
	done

VerdanturfFlowerHouseGirlText:
	text "Mom's flowers"
	line "smell so nice!"

	para "The ones outside"
	line "are hers too."
	done

VerdanturfFlowerHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERDANTURF_TOWN, 7
	warp_event  3,  7, VERDANTURF_TOWN, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VerdanturfFlowerHouseLadyScript, -1
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VerdanturfFlowerHouseGirlScript, -1
