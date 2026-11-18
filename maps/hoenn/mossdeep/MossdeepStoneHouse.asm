	object_const_def
	const MOSSDEEPSTONEHOUSE_COLLECTOR

MossdeepStoneHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MossdeepStoneHouseCollectorScript:
	faceplayer
	opentext
	checkflag ENGINE_MOSSDEEP_DAILY_STONE
	iftrue .GaveToday
	writetext MossdeepStoneHouseOfferText
	promptbutton
	random 8
	ifequal 0, .Fire
	ifequal 1, .Water
	ifequal 2, .Thunder
	ifequal 3, .Leaf
	ifequal 4, .Moon
	ifequal 5, .Sun
	ifequal 6, .Dawn
	verbosegiveitem ICE_STONE
	sjump .Given

.Fire:
	verbosegiveitem FIRE_STONE
	sjump .Given

.Water:
	verbosegiveitem WATER_STONE
	sjump .Given

.Thunder:
	verbosegiveitem THUNDERSTONE
	sjump .Given

.Leaf:
	verbosegiveitem LEAF_STONE
	sjump .Given

.Moon:
	verbosegiveitem MOON_STONE
	sjump .Given

.Sun:
	verbosegiveitem SUN_STONE
	sjump .Given

.Dawn:
	verbosegiveitem DAWN_STONE
.Given:
	iffalse .BagFull
	setflag ENGINE_MOSSDEEP_DAILY_STONE
	writetext MossdeepStoneHouseComeBackText
	waitbutton
	closetext
	end

.BagFull:
	writetext MossdeepStoneHouseBagFullText
	waitbutton
	closetext
	end

.GaveToday:
	writetext MossdeepStoneHouseTomorrowText
	waitbutton
	closetext
	end

MossdeepStoneHouseShelf:
	jumptext MossdeepStoneHouseShelfText

MossdeepStoneHouseOfferText:
	text "I collect stones"
	line "from all over"
	cont "Hoenn!"

	para "I find more than I"
	line "can keep. Here,"
	cont "take one!"
	done

MossdeepStoneHouseComeBackText:
	text "Come back"
	line "tomorrow. I'll"

	para "have found another"
	line "by then!"
	done

MossdeepStoneHouseBagFullText:
	text "Your Bag's full!"
	line "Make some room."
	done

MossdeepStoneHouseTomorrowText:
	text "I gave you today's"
	line "stone already."

	para "Come back"
	line "tomorrow!"
	done

MossdeepStoneHouseShelfText:
	text "Shelves full of"
	line "shiny stones."
	done

MossdeepStoneHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MOSSDEEP_CITY, 5
	warp_event  3,  7, MOSSDEEP_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MossdeepStoneHouseShelf
	bg_event  1,  1, BGEVENT_READ, MossdeepStoneHouseShelf

	def_object_events
	object_event  5,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MossdeepStoneHouseCollectorScript, -1
