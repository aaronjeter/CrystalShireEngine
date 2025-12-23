	object_const_def

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

	def_coord_events

	def_bg_events	
	bg_event 38,  42, BGEVENT_READ, CitySouthPlayersHouseSign
	bg_event 25,  14, BGEVENT_READ, CitySouthGymSign
	bg_event 26,  46, BGEVENT_READ, CitySouthApartmentsSign
	bg_event 10,  46, BGEVENT_READ, CitySouthPetStoreSign
	bg_event 41,  14, BGEVENT_READ, CitySouthPlantMarketSign

	def_object_events
	