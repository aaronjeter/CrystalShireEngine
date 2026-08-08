;Due to the use of index numbers $fe and $ff as control values,
;No instances of those values can be used for Pokemon data
;Inside the RandomPartyLists structure.

;This includes Pokemon, Items, or Moves with those indexes

;This includes
;Torchic (fe)
;Sceptile (ff)

;Fae Voice (fe)
;Uproar (ff)

;possibly others

RandomPartyLists::   

	;PSYCHIC_EASY
	db 12 ;count
	dbwb 7, ABRA, $fe
	dbwb 7, ABRA2,$fe
	dbwb 7, NATU, $fe
	dbwb 7, EXEGGCUTE, $fe
	dbwb 7, RALTS, $fe
	dbwb 7, SPOINK, $fe
	dbwb 7, GPONYTA, $fe
	dbwb 7, GIRAFARIG, $fe
	dbwb 7, HOOTHOOT, $fe
	dbwb 7, MEDITITE, $fe
	dbwb 7, DROWZEE, $fe
	dbwb 7, SLOWPOKE, $fe
	db -1 ; end

	;PSYCHIC_MEDIUM
	db 12 ;count
	dbwb 7, KADABRA, $fe
	dbwb 7, KADABRA2, $fe
	dbwb 7, XATU, $fe
	dbwb 7, EXEGGCUTE, $fe
	dbwb 7, KIRLIA, $fe
	dbwb 7, GRUMPIG, $fe
	dbwb 7, GPONYTA, $fe
	dbwb 7, GIRAFARIG, $fe
	dbwb 7, NOCTOWL, $fe
	dbwb 7, MEDICHAM, $fe
	dbwb 7, ARAICHU, $fe
	dbwb 7, SLOWKING, $fe
	db -1 ; end

	;PSYCHIC_HARD
	db 12 ;count
	dbwb 8, KADABRA, $fe
	dbwb 8, KADABRA2, $fe
	dbwb 8, XATU, $fe
	dbwb 8, EXEGGUTOR, $fe
	dbwb 8, KIRLIA, $fe
	dbwb 8, GRUMPIG, $fe
	dbwb 8, GRAPIDASH, $fe
	dbwb 8, CHIMECHO, $fe
	dbwb 8, NOCTOWL, $fe
	dbwb 8, MEDICHAM, $fe
	dbwb 8, ARAICHU, $fe
	dbwb 8, SLOWKING, $fe
	db -1 ; end


	;TRIAL_EASY
	db 36 ;count
	dbwb 11, VENUSAUR, $fe
	dbwb 11, CHARIZARD, $fe
	dbwb 11, BLASTOISE, $fe
	dbwb 11, BUTTERFREE, $fe
	dbwb 11, PIDGEOT, $fe
	dbwb 11, RAICHU, $fe
	dbwb 11, NIDOQUEEN, $fe
	dbwb 11, CLEFABLE, $fe
	dbwb 11, PARASECT, $fe
	dbwb 11, GOLDUCK, $fe
	dbwb 11, ARCANINE, $fe
	dbwb 11, POLIWRATH, $fe

	dbwb 11, MEGANIUM, $fe
	dbwb 11, TYPHLOSION, $fe
	dbwb 11, FERALIGATR, $fe
	dbwb 11, NOCTOWL, $fe
	dbwb 11, ARIADOS, $fe
	dbwb 11, LANTURN, $fe
	dbwb 11, SUDOWOODO, $fe
	dbwb 11, SUNFLORA, $fe
	dbwb 11, QUAGSIRE, $fe
	dbwb 11, UNOWN, $fe
	dbwb 11, FORRETRESS, $fe
	dbwb 11, DELIBIRD, $fe

	dbwb 11, JYNX, $fe
	dbwb 11, BLAZIKEN, $fe
	dbwb 11, SWAMPERT, $fe
	dbwb 11, DUSTOX, $fe
	dbwb 11, SHIFTRY, $fe
	dbwb 11, PELIPPER, $fe
	dbwb 11, GARDEVOIR, $fe
	dbwb 11, LINOONE, $fe
	dbwb 11, AGGRON, $fe
	dbwb 11, VOLBEAT, $fe
	dbwb 11, GRUMPIG, $fe
	dbwb 11, BANETTE, $fe
	db -1 ; end


	;ROCKET_EASY
	db 30 ;count
	dbwb 7, PIDGEY, $fe
	dbwb 7, RATTATA, $fe
	dbwb 7, SPEAROW, $fe
	dbwb 7, EKANS, $fe
	dbwb 7, NIDORAN_M, $fe
	dbwb 7, ZUBAT, $fe
	dbwb 7, PARAS, $fe
	dbwb 7, VENONAT, $fe
	dbwb 7, TENTACOOL, $fe
	dbwb 7, SLOWPOKE, $fe
	dbwb 7, SEEL, $fe
	dbwb 7, GRIMER, $fe	
	dbwb 7, VOLTORB, $fe
	dbwb 7, CUBONE, $fe	
	dbwb 7, KOFFING, $fe
	dbwb 7, SENTRET, $fe
	dbwb 7, HOOTHOOT, $fe
	dbwb 7, SPINARAK, $fe
	dbwb 7, WOOPER, $fe
	dbwb 7, MURKROW, $fe	
	dbwb 7, HOUNDOUR, $fe	
	dbwb 7, POOCHYENA, $fe
	dbwb 7, ZIGZAGOON, $fe
	dbwb 7, SEEDOT, $fe
	dbwb 7, SHROOMISH, $fe
	dbwb 7, ELECTRIKE, $fe
	dbwb 7, GULPIN, $fe
	dbwb 7, CARVANHA, $fe
	dbwb 7, MAKUHITA, $fe
	dbwb 7, NUMEL, $fe
	db -1 ; end

	;ROCKET_MEDIUM
	db 30 ;count
	dbwb 7, NIDORINO, $fe
	dbwb 7, GOLBAT, $fe
	dbwb 7, FEAROW, $fe	
	dbwb 7, HOUNDOUR, $fe
	dbwb 7, MURKROW, $fe
	dbwb 7, MIGHTYENA, $fe
	dbwb 7, LINOONE, $fe
	dbwb 7, PIDGEOTTO, $fe
	dbwb 7, RATICATE, $fe
	dbwb 7, CUBONE, $fe		
	dbwb 7, TANGELA, $fe
	dbwb 7, TAUROS, $fe
	dbwb 7, PINSIR, $fe	
	dbwb 7, NUZLEAF, $fe	
	dbwb 7, GRUMPIG, $fe
	dbwb 7, ZANGOOSE, $fe
	dbwb 7, MUK, $fe	
	dbwb 7, ELECTRODE, $fe	
	dbwb 7, FURRET, $fe
	dbwb 7, NOCTOWL, $fe
	dbwb 7, ARIADOS, $fe
	dbwb 7, QUAGSIRE, $fe	
	dbwb 7, SEVIPER, $fe	
	dbwb 7, MAGMAR, $fe	
	dbwb 7, BRELOOM, $fe
	dbwb 7, ELECTRIKE, $fe
	dbwb 7, SWALOT, $fe
	dbwb 7, SHARPEDO, $fe
	dbwb 7, MAKUHITA, $fe
	dbwb 7, NUMEL, $fe
	db -1 ; end

	;ROCKET_HARD
	db 30 ;count
	dbwb 7, FEAROW, $fe
	dbwb 7, RATICATE, $fe
	dbwb 7, SWELLOW, $fe
	dbwb 7, ARBOK, $fe
	dbwb 7, NIDOKING, $fe
	dbwb 7, GOLBAT, $fe
	dbwb 7, PARASECT, $fe
	dbwb 7, VENOMOTH, $fe
	dbwb 7, TENTACRUEL, $fe
	dbwb 7, SLOWBRO, $fe
	dbwb 7, DEWGONG, $fe
	dbwb 7, MUK, $fe	
	dbwb 7, ELECTRODE, $fe
	dbwb 7, MAROWAK, $fe	
	dbwb 7, WEEZING, $fe
	dbwb 7, DONPHAN, $fe
	dbwb 7, DUSCLOPS, $fe
	dbwb 7, ARIADOS, $fe
	dbwb 7, QUAGSIRE, $fe
	dbwb 7, HONCHKROW, $fe	
	dbwb 7, HOUNDOOM, $fe	
	dbwb 7, MIGHTYENA, $fe
	dbwb 7, LINOONE, $fe
	dbwb 7, SHIFTRY, $fe
	dbwb 7, BRELOOM, $fe
	dbwb 7, AMUK, $fe
	dbwb 7, SWALOT, $fe
	dbwb 7, SHARPEDO, $fe
	dbwb 7, HARIYAMA, $fe
	dbwb 7, MAGMAR, $fe
	db -1 ; end