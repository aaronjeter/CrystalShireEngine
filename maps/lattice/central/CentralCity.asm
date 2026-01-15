	object_const_def

CentralCity_MapScripts:
	def_scene_scripts

	def_callbacks	

CentralCityMintHouseSign:
	jumptext CentralCityMintHouseSignText

CentralCityMintHouseSignText:
	text "MINT's House"
	done

CentralCityGymSign:
	jumptext CentralCityGymSignText

CentralCityGymSignText:
	text "CLEA's Cosmic"
	line "Cafe."

	para "No Rockets"
	line "allowed!"
	done

CentralCityHoennPetsSign:
	jumptext CentralCityHoennPetsSignText

CentralCityHoennPetsSignText:
	text "Exotic Pets"
	line "- HOENN -"
	done

CentralCityJohtoPetsSign:
	jumptext CentralCityJohtoPetsSignText

CentralCityJohtoPetsSignText:
	text "Exotic Pets"
	line "- JOHTO -"
	done

CentralCityKantoPetsSign:
	jumptext CentralCityKantoPetsSignText

CentralCityKantoPetsSignText:
	text "Exotic Pets"
	line "- KANTO -"
	done


CentralCity_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  29,  55, CITY_SOUTH, 14
	warp_event  30,  55, CITY_SOUTH, 14
	warp_event  40,  39, CENTRAL_CAFE, 1
	warp_event  17,  27, CENTRAL_RADIO_1F, 1
	warp_event  09,  25, JOIF_ALLEY, 2
	warp_event  09,  24, JOIF_ALLEY, 1
	warp_event  09,  13, JOIF_ALLEY, 4
	warp_event  09,  12, JOIF_ALLEY, 3
	warp_event  18,  11, JOIF_ALLEY, 5
	warp_event  19,  11, JOIF_ALLEY, 6
	warp_event  26,  16, JOIF_ALLEY, 7
	warp_event  26,  17, JOIF_ALLEY, 8
	warp_event  47,  47, MINT_HOUSE, 1
	warp_event  37,  29, CENTRAL_CITY_POKECENTER, 2
	warp_event  41,  29, CENTRAL_CITY_POKEMART, 2
	warp_event  47,  29, CENTRAL_KANTO_PETSHOP, 2
	warp_event  15,  39, CENTRAL_JOHTO_PETSHOP, 2
	warp_event  19,  47, CENTRAL_HOENN_PETSHOP, 2
	warp_event  36,  11, ETTERN_ALLEY, 1
	warp_event  37,  11, ETTERN_ALLEY, 2
	warp_event  50,  18, ETTERN_ALLEY, 3
	warp_event  50,  19, ETTERN_ALLEY, 4

	def_coord_events

	def_bg_events	
	bg_event 46,  48, BGEVENT_READ, CentralCityMintHouseSign
	bg_event 38,  40, BGEVENT_READ, CentralCityGymSign
	bg_event 18,  48, BGEVENT_READ, CentralCityHoennPetsSign
	bg_event 14,  40, BGEVENT_READ, CentralCityJohtoPetsSign
	bg_event 46,  30, BGEVENT_READ, CentralCityKantoPetsSign
	

	def_object_events
