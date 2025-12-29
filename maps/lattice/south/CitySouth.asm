	object_const_def
	const CITYSOUTH_LASS
	const CITYSOUTH_PIKACHU
	const CITYSOUTH_OFFICER
	const CITYSOUTH_GROWLITHE
	const CITYSOUTH_PICHU

CitySouth_MapScripts:
	def_scene_scripts

	def_callbacks	

CitySouthPlayersHouseSign:
	jumptext CitySouthPlayersHouseSignText

CitySouthPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

CitySouthGymSign:
	jumptext CitySouthGymSignText

CitySouthGymSignText:
	text "RODNEY's"
	line "RODENTORIUM"
	done

CitySouthApartmentsSign:
	jumptext CitySouthApartmentsSignText

CitySouthApartmentsSignText:
	text "South-Side"
	line "Trainer Flats"
	done

CitySouthPetStoreSign:
	jumptext CitySouthPetStoreSignText

CitySouthPetStoreSignText:
	text "South-Side"
	line "Pet Store"
	done

CitySouthPlantMarketSign:
	jumptext CitySouthPlantMarketSignText

CitySouthPlantMarketSignText:
	text "South-Side"
	line "Plant Market"
	done


CitySouthLass:
    opentext
	writetext CitySouthLassText
	waitbutton
	closetext	
	end

CitySouthLassText:
	text "Have you seen"
	line "those trainers"
	cont "upstairs?"

	para "They're tough..."

	para "But they're also"
	line "really loud."
	done

CitySouthPikachu:
	cry PIKACHU
	end


CitySouthGateGuard:
    opentext
	writetext CitySouthGateGuardText
	waitbutton
	closetext
	end

CitySouthGateGuardText:
	text "This gate goes"
	line "all the way"

	para "to the Central"
	line "City District."

	para "But you're not"
	line "really ready."

	para "Maybe if you"
	line "beat a Gym..."
	done

CitySouthGrowlithe:
	cry GROWLITHE
	end


CitySouthPichu:
	cry PICHU
	opentext
	writetext CitySouthPichuSearchingText
	waitbutton

	checkitem BERRY
	iftrue .Berry
	
	closetext
	end
.Berry
	writetext CitySouthPichuOfferBerryText
	yesorno
	iffalse .Done
	takeitem BERRY
	writetext CitySouthPichuJoinPartyText
	yesorno
	waitbutton
	iffalse .Done

	setflag GOT_CITY_SOUTH_PICHU
	givepoke PICHU, 2
	disappear CITYSOUTH_PICHU

.Done
	closetext
	end


CitySouthPichuSearchingText:
	text "It seems to be"
	line "searching the"

	para "tree for a"
	line "Berry."
	done

CitySouthPichuOfferBerryText:
	text "You have a"
	line "Berry in your"

	para "pack. Offer it"
	line "to the Pichu?"
	done

CitySouthPichuJoinPartyText:
	text "It hungrily"
	line "snaps up the"
	cont "Berry."


	para "It looks up at"
	line "you thankfully."

	para "Invite it to"
	line "join your party?"
	done




CitySouth_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  39,  41, PLAYERS_HOUSE_1F, 1
	warp_event  24,  13, SOUTH_GYM, 1
	warp_event  23,  27, CITY_SOUTH_POKECENTER, 2
	warp_event  27,  27, CITY_SOUTH_POKEMART, 2
	warp_event  43,  26, SOUTH_PARK, 1
	warp_event  44,  26, SOUTH_PARK, 2
	warp_event  27,  45, LATTICE_APARTMENT_1F, 1
	warp_event  11,  45, SOUTHSIDE_PET_SHOP, 1
	warp_event  28,  38, SOUTHSIDE_ALLEY, 1
	warp_event  28,  39, SOUTHSIDE_ALLEY, 2
	warp_event  39,  13, SOUTHSIDE_PLANT_MARKET, 1
	warp_event  20,  19, SOUTHSIDE_NORTH_ALLEY, 1
	warp_event  21,  19, SOUTHSIDE_NORTH_ALLEY, 2
	warp_event  27,  03, CENTRAL_CITY, 1

	def_coord_events

	def_bg_events	
	bg_event 38,  42, BGEVENT_READ, CitySouthPlayersHouseSign
	bg_event 25,  14, BGEVENT_READ, CitySouthGymSign
	bg_event 26,  46, BGEVENT_READ, CitySouthApartmentsSign
	bg_event 10,  46, BGEVENT_READ, CitySouthPetStoreSign
	bg_event 38,  14, BGEVENT_READ, CitySouthPlantMarketSign

	def_object_events
	object_event 28, 46, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, CitySouthLass, -1
	object_event 29, 46, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CitySouthPikachu, -1
	object_event 27, 04, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLACK, OBJECTTYPE_SCRIPT, 0, CitySouthGateGuard, EVENT_BEAT_SOUTH_GYM_RODNEY
	object_event 26, 04, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, CitySouthGrowlithe, EVENT_BEAT_SOUTH_GYM_RODNEY
	object_event 18, 35, SPRITE_PICHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CitySouthPichu, GOT_CITY_SOUTH_PICHU