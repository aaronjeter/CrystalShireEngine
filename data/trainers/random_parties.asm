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

	;BIRDS_EASY
	db 12 ;count
	dbwb 3, PIDGEY, $fe
	dbwb 4, SPEAROW,$fe
	dbwb 2, ZUBAT, $fe
	dbwb 4, DODUO, $fe
	dbwb 3, HOOTHOOT, $fe
	dbwb 4, NATU, $fe
	dbwb 2, HOPPIP, $fe
	dbwb 4, TAILLOW, $fe
	dbwb 2, WINGULL, $fe
	dbwb 5, ROWLET, $fe
	dbwb 3, SWABLU, $fe
	dbwb 5, PIDGEOTTO, $fe
	db -1 ; end

	;Battle Tower

	;LITTLE_CUP_EASY
	db 144 ;count
	dbwb 7, BULBASAUR, $fe
	dbwb 7, CHARMANDER,$fe
	dbwb 7, SQUIRTLE, $fe
	dbwb 7, RATTATA, $fe
	dbwb 7, SPEAROW, $fe
	dbwb 7, EKANS, $fe
	dbwb 7, CLEFAIRY, $fe
	dbwb 7, JIGGLYPUFF, $fe
	dbwb 7, ZUBAT, $fe
	dbwb 7, ODDISH, $fe
	dbwb 7, PARAS, $fe
	dbwb 7, VENONAT, $fe

	dbwb 7, DIGLETT, $fe
	dbwb 7, MEOWTH,$fe
	dbwb 7, PSYDUCK, $fe
	dbwb 7, MANKEY, $fe
	dbwb 7, GROWLITHE, $fe
	dbwb 7, POLIWAG, $fe
	dbwb 7, ABRA, $fe
	dbwb 7, MACHOP, $fe
	dbwb 7, BELLSPROUT, $fe
	dbwb 7, TENTACOOL, $fe
	dbwb 7, GEODUDE, $fe
	dbwb 7, PONYTA, $fe

	dbwb 7, SLOWPOKE, $fe
	dbwb 7, MAGNEMITE,$fe
	dbwb 7, DODUO, $fe
	dbwb 7, SEEL, $fe
	dbwb 7, GRIMER, $fe
	dbwb 7, SHELLDER, $fe
	dbwb 7, GASTLY, $fe
	dbwb 7, ONIX, $fe
	dbwb 7, DROWZEE, $fe
	dbwb 7, KRABBY, $fe
	dbwb 7, VOLTORB, $fe
	dbwb 7, EXEGGCUTE, $fe

	dbwb 7, CUBONE, $fe
	dbwb 7, KOFFING,$fe
	dbwb 7, RHYHORN, $fe
	dbwb 7, HORSEA, $fe
	dbwb 7, GOLDEEN, $fe
	dbwb 7, STARYU, $fe
	dbwb 7, EEVEE, $fe
	dbwb 7, PORYGON, $fe
	dbwb 7, OMANYTE, $fe
	dbwb 7, KABUTO, $fe
	dbwb 7, DRATINI, $fe
	dbwb 7, MUNCHLAX, $fe

	dbwb 7, CHIKORITA, $fe
	dbwb 7, CYNDAQUIL,$fe
	dbwb 7, TOTODILE, $fe
	dbwb 7, SENTRET, $fe
	dbwb 7, HOOTHOOT, $fe
	dbwb 7, LEDYBA, $fe
	dbwb 7, SPINARAK, $fe
	dbwb 7, CHINCHOU, $fe
	dbwb 7, TOGEPI, $fe
	dbwb 7, NATU, $fe
	dbwb 7, MAREEP, $fe
	dbwb 7, MARILL, $fe

	dbwb 7, HOPPIP, $fe
	dbwb 7, SUNKERN,$fe
	dbwb 7, WOOPER, $fe
	dbwb 7, PINECO, $fe
	dbwb 7, SNUBBULL, $fe
	dbwb 7, TEDDIURSA, $fe
	dbwb 7, SLUGMA, $fe
	dbwb 7, SWINUB, $fe
	dbwb 7, REMORAID, $fe
	dbwb 7, HOUNDOUR, $fe
	dbwb 7, PHANPY, $fe
	dbwb 7, TYROGUE, $fe

	dbwb 7, SMOOCHUM, $fe
	dbwb 7, ELEKID,$fe
	dbwb 7, MAGBY, $fe
	dbwb 7, LARVITAR, $fe
	dbwb 7, TREECKO, $fe
	dbwb 7, MUDKIP, $fe
	dbwb 7, POOCHYENA, $fe
	dbwb 7, ZIGZAGOON, $fe
	dbwb 7, LOTAD, $fe
	dbwb 7, SEEDOT, $fe
	dbwb 7, TAILLOW, $fe
	dbwb 7, WINGULL, $fe

	dbwb 7, RALTS, $fe
	dbwb 7, SURSKIT,$fe
	dbwb 7, SHROOMISH, $fe
	dbwb 7, ROWLET, $fe
	dbwb 7, LITTEN, $fe
	dbwb 7, POPPLIO, $fe
	dbwb 7, MAKUHITA, $fe
	dbwb 7, SKITTY, $fe
	dbwb 7, ARON, $fe
	dbwb 7, MEDITITE, $fe
	dbwb 7, ELECTRIKE, $fe
	dbwb 7, GULPIN, $fe

	dbwb 7, CARVANHA, $fe
	dbwb 7, WAILMER,$fe
	dbwb 7, NUMEL, $fe
	dbwb 7, SPOINK, $fe
	dbwb 7, TRAPINCH, $fe
	dbwb 7, CACNEA, $fe
	dbwb 7, SWABLU, $fe
	dbwb 7, BARBOACH, $fe
	dbwb 7, CORPHISH, $fe
	dbwb 7, BALTOY, $fe
	dbwb 7, LILEEP, $fe
	dbwb 7, ANORITH, $fe

	dbwb 7, SHUPPET, $fe
	dbwb 7, DUSKULL,$fe
	dbwb 7, WYNAUT, $fe
	dbwb 7, SNORUNT, $fe
	dbwb 7, SPHEAL, $fe
	dbwb 7, CLAMPERL, $fe
	dbwb 7, BAGON, $fe
	dbwb 7, BELDUM, $fe
	dbwb 7, AGRIMER, $fe
	dbwb 7, ASANDSHREW, $fe
	dbwb 7, AVULPIX, $fe
	dbwb 7, AGEODUDE, $fe

	dbwb 7, HVOLTORB, $fe
	dbwb 7, HGROWLITHE,$fe
	dbwb 7, GPONYTA, $fe
	dbwb 7, ADIGLETT, $fe
	dbwb 7, VOLTORB2, $fe
	dbwb 7, EXEGGCUTE2, $fe
	dbwb 7, TENTACOOL2, $fe
	dbwb 7, PONYTA2, $fe
	dbwb 7, VULPIX2, $fe
	dbwb 7, ABRA2, $fe
	dbwb 7, TOTODILE2, $fe
	dbwb 7, CYNDAQUIL2, $fe

	dbwb 7, HONOBEA, $fe
	dbwb 7, KURUSU,$fe
	dbwb 7, CHIKORITA2, $fe
	dbwb 7, KOTORA, $fe
	dbwb 7, SUNBOU, $fe
	dbwb 7, CLAMPERL, $fe
	dbwb 7, BAGON, $fe
	dbwb 7, BELDUM, $fe
	dbwb 7, AGRIMER, $fe
	dbwb 7, ASANDSHREW, $fe
	dbwb 7, AVULPIX, $fe
	dbwb 7, AGEODUDE, $fe
	db -1 ; end