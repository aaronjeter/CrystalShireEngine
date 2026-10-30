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

;Macro for randomlist mon moves. Four 16-bit move Ids followed by a $fe termination character
MACRO rmoves
	dw \1
	dw \2
	dw \3
	dw \4
	db \5
ENDM

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

	;LITTLE_CUP_EASY_KANTO
	db 36 ;count
	dbww 5, BULBASAUR, ORAN_BERRY
		rmoves VINE_WHIP, LEECH_SEED, STUN_SPORE, GROWL, $fe
	dbww 5, CHARMANDER, ORAN_BERRY
		rmoves EMBER, METAL_CLAW, WILLOWISP, TAIL_WHIP,	$fe
	dbww 5, SQUIRTLE, ORAN_BERRY
		rmoves BUBBLE, WITHDRAW, FROSTBITE, GROWL, $fe
	dbww 5, RATTATA, ORAN_BERRY
		rmoves TAIL_WHIP, GROWL, DIG, POISON_FANG, $fe
	dbww 5, SPEAROW, ORAN_BERRY
		rmoves FLY, SAND_ATTACK, GROWL, PECK, $fe
	dbww 5, EKANS, ORAN_BERRY
		rmoves POISON_FANG, DIG, BITE, TAIL_WHIP, $fe
	dbww 5, CLEFAIRY, ORAN_BERRY
		rmoves SING, SWIFT, GROWL, DEFENSE_CURL, $fe
	dbww 5, JIGGLYPUFF, ORAN_BERRY
		rmoves SING, SWIFT, ROLLOUT, DEFENSE_CURL, $fe
	dbww 5, ZUBAT, ORAN_BERRY
		rmoves BITE, LEECH_LIFE, SUPERSONIC, FLY, $fe
	dbww 5, ODDISH, ORAN_BERRY
		rmoves STUN_SPORE, MEGA_DRAIN, LEECH_SEED, ACID, $fe
	dbww 5, PARAS, ORAN_BERRY
		rmoves STUN_SPORE, CUT, LEECH_SEED, STRING_SHOT, $fe
	dbww 5, VENONAT, ORAN_BERRY
		rmoves STUN_SPORE, CONFUSION, LEECH_SEED, STRING_SHOT, $fe

	dbww 5, DIGLETT, ORAN_BERRY
		rmoves DIG, CUT, GROWL, METAL_CLAW, $fe
	dbww 5, MEOWTH, ORAN_BERRY
		rmoves BITE, METAL_CLAW, TAIL_WHIP, PAY_DAY, $fe
	dbww 5, PSYDUCK, ORAN_BERRY
		rmoves BUBBLE, CONFUSION, FROSTBITE, GROWL, $fe
	dbww 5, MANKEY, ORAN_BERRY
		rmoves STRENGTH, GROWL, DIG, KARATE_CHOP, $fe
	dbww 5, GROWLITHE, ORAN_BERRY
		rmoves EMBER, SAND_ATTACK, GROWL, BITE,	$fe
	dbww 5, POLIWAG, ORAN_BERRY
		rmoves BUBBLE, HYPNOSIS, TACKLE, BELLY_DRUM, $fe
	dbww 5, ABRA, ORAN_BERRY
		rmoves CONFUSION, FLASH, PSYCH_UP, CALM_MIND, $fe
	dbww 5, MACHOP, ORAN_BERRY
		rmoves STRENGTH, BULK_UP, MACH_PUNCH, ROCK_THROW, $fe
	dbww 5, BELLSPROUT, ORAN_BERRY
		rmoves VINE_WHIP, CUT, STUN_SPORE, ACID, $fe
	dbww 5, TENTACOOL, ORAN_BERRY
		rmoves BUBBLE, FROSTBITE, ACID, REST, $fe
	dbww 5, GEODUDE, ORAN_BERRY
		rmoves ROCK_THROW, DEFENSE_CURL, ROLLOUT, SAND_ATTACK, $fe
	dbww 5, PONYTA, ORAN_BERRY
		rmoves EMBER, TACKLE, WILLOWISP, SUNNY_DAY, $fe

	dbww 5, SLOWPOKE, ORAN_BERRY
		rmoves WATER_GUN, RAIN_DANCE, CONFUSION, REST, $fe
	dbww 5, MAGNEMITE, ORAN_BERRY
		rmoves THUNDERSHOCK, THUNDER_WAVE, METAL_CLAW, SUPERSONIC, $fe
	dbww 5, DODUO, ORAN_BERRY
		rmoves FLY, SAND_ATTACK, WHIRLWIND, GROWL, $fe
	dbww 5, SEEL, ORAN_BERRY
		rmoves BUBBLE, FROSTBITE, AURORA_BEAM, TACKLE, $fe
	dbww 5, GRIMER, ORAN_BERRY
		rmoves ACID, DISABLE, CURSE, MUD_SLAP, $fe
	dbww 5, SHELLDER, ORAN_BERRY
		rmoves WATER_GUN, AURORA_BEAM, FROSTBITE, WITHDRAW, $fe
	dbww 5, GASTLY, ORAN_BERRY
		rmoves HYPNOSIS, NIGHT_SHADE, DREAM_EATER, ACID, $fe
	dbww 5, ONIX, ORAN_BERRY
		rmoves DIG, TACKLE, BIDE, ROCK_TOMB, $fe
	dbww 5, DROWZEE, ORAN_BERRY
		rmoves CONFUSION, DREAM_EATER, HYPNOSIS, POUND, $fe
	dbww 5, KRABBY, ORAN_BERRY
		rmoves STRENGTH, BUBBLE, METAL_CLAW, ROLLOUT, $fe
	dbww 5, VOLTORB, ORAN_BERRY
		rmoves THUNDER_WAVE, THUNDERSHOCK, TACKLE, EXPLOSION, $fe
	dbww 5, EXEGGCUTE, ORAN_BERRY
		rmoves STUN_SPORE, CONFUSION, LEECH_SEED, MEGA_DRAIN, $fe
	db -1 ; end


	;STANDARD_CUP
	db 36 ;count
	dbww 5, AERODACTYL, SCOPE_LENS
		rmoves STONE_EDGE, ROCK_TOMB, MUD_SLAP, EARTHQUAKE, $fe
	dbww 5, ESPEON, LUM_BERRY
		rmoves PSYCHIC_M, SHADOW_BALL, POWER_GEM, MEDITATE, $fe
	dbww 5, UMBREON, LEFTOVERS
		rmoves TOXIC, REST, SNARL, CONFUSE_RAY, $fe
	dbww 5, LAPRAS, QUICK_CLAW
		rmoves BLIZZARD, HAIL, SURF, THUNDERBOLT, $fe
	dbww 5, HERACROSS, FOCUS_BAND
		rmoves SUBMISSION, STONE_EDGE, COUNTER, STRENGTH, $fe
	dbww 5, MISMAGIUS, SITRUS_BERRY
		rmoves HEX, TOXIC, PERISH_SONG, MEAN_LOOK, $fe
	dbww 5, CLEFABLE, LUM_BERRY
		rmoves WILLOWISP, MOONBLAST, PSYCHIC_M, RECOVER, $fe
	dbww 5, HARCANINE, CHARCOAL
		rmoves SACRED_FIRE, EXTREMESPEED, STONE_EDGE, DIG, $fe
	dbww 5, MR__RIME, LEFTOVERS
		rmoves HAIL, REFLECT, BLIZZARD, FUTURE_SIGHT, $fe
	dbww 5, NIDOKING, SOFT_SAND
		rmoves FISSURE, POISON_JAB, SURF, BULK_UP, $fe
	dbww 5, KLEAVOR, HARD_STONE
		rmoves STONE_EDGE, CUT, AGILITY, FURY_CUTTER, $fe
	dbww 5, HOUNDOOM, SITRUS_BERRY
		rmoves FIRE_BLAST, DARK_PULSE, MEDITATE, LIGHT_SCREEN, $fe

	dbww 5, POLITOED, MAGNET
		rmoves RAIN_DANCE, THUNDER, SURF, DYNAMICPUNCH, $fe
	dbww 5, GWEEZING, LEFTOVERS
		rmoves SHADOW_BALL, WILLOWISP, AMNESIA, SLUDGE_WAVE, $fe
	dbww 5, STEELIX, QUICK_CLAW
		rmoves ROCK_TOMB, EARTHQUAKE, IRON_TAIL, CRUNCH, $fe
	dbww 5, LEAFEON, MIRACLE_SEED
		rmoves LEAF_BLADE, STRENGTH, LEECH_SEED, MUD_SLAP, $fe
	dbww 5, WYRDEER, SITRUS_BERRY
		rmoves BODY_SLAM, EARTHQUAKE, GROWL, FROSTBITE, $fe
	dbww 5, PELIPPER, SITRUS_BERRY
		rmoves BUBBLEBEAM, THUNDER, HURRICANE, PROTECT, $fe
	dbww 5, METAGROSS, LUM_BERRY
		rmoves PSYCHIC_M, METEOR_MASH, FIRE_PUNCH, ICE_PUNCH, $fe
	dbww 5, GARDEVOIR, KINGS_ROCK
		rmoves MOONBLAST, SHOCK_WAVE, HYPNOSIS, DREAM_EATER, $fe
	dbww 5, INCINEROAR, KINGS_ROCK
		rmoves BEAT_UP, FLAME_WHEEL, CROSS_CHOP, SWORDS_DANCE, $fe
	dbww 5, SKARMORY, LUM_BERRY
		rmoves AGILITY, STEEL_WING, DRILL_PECK, RECOVER, $fe
	dbww 5, MILOTIC, ASPEAR_BERRY
		rmoves RAIN_DANCE, SURF, RECOVER, WILLOWISP, $fe
	dbww 5, CROBAT, LEFTOVERS
		rmoves SKY_ATTACK, HAZE, GIGA_DRAIN, EXTREMESPEED, $fe

	dbww 5, SALAMENCE, CHARCOAL
		rmoves DRAGON_CLAW, FIRE_BLAST, EARTHQUAKE, ROCK_TOMB, $fe
	dbww 5, PORYGONZ, SITRUS_BERRY
		rmoves THUNDER, THUNDER_WAVE, TRI_ATTACK, RECOVER, $fe
	dbww 5, ADUGTRIO, KINGS_ROCK
		rmoves DIG, ROCK_TOMB, SPIKES, MUDDY_WATER, $fe
	dbww 5, STARMIE, LEFTOVERS
		rmoves SURF, ICE_BEAM, PSYCHIC_M, POWER_GEM, $fe
	dbww 5, DODRIO, RAWST_BERRY
		rmoves TRI_ATTACK, MUD_SLAP, DRILL_PECK, DOUBLE_EDGE, $fe
	dbww 5, CLOYSTER, LUM_BERRY
		rmoves FROSTBITE, SPIKES, BLIZZARD, REST, $fe
	dbww 5, VENOMOTH, QUICK_CLAW
		rmoves TOXIC, VENOSHOCK, REFLECT, BATON_PASS, $fe
	dbww 5, DONPHAN, SITRUS_BERRY
		rmoves RAPID_SPIN, DOUBLE_EDGE, COUNTER, ROCK_TOMB, $fe
	dbww 5, WHISCASH, SITRUS_BERRY
		rmoves MUD_SHOT, RAIN_DANCE, SURF, BODY_SLAM, $fe
	dbww 5, PARASECT, SITRUS_BERRY
		rmoves STUN_SPORE, LEAF_BLADE, CUT, SHADOWSNEAK, $fe
	dbww 5, ANNIHILAPE, SITRUS_BERRY
		rmoves MACH_PUNCH, CROSS_CHOP, SHADOWSNEAK, THUNDERPUNCH, $fe
	dbww 5, AGGRON, LEFTOVERS
		rmoves COSMIC_POWER, STRENGTH, ROCK_TOMB, VICEGRIP, $fe
	db -1 ; end


;SINGLETON_CUP
	db 36 ;count
	dbww 5, AERODACTYL, SCOPE_LENS
		rmoves STONE_EDGE, ROCK_TOMB, MUD_SLAP, EARTHQUAKE, $fe
	dbww 5, JYNX, LUM_BERRY
		rmoves PSYCHIC_M, SHADOW_BALL, BLIZZARD, REFLECT, $fe
	dbww 5, MR__MIME, LEFTOVERS
		rmoves REFLECT, LIGHT_SCREEN, THUNDERBOLT, DIZZY_PUNCH, $fe
	dbww 5, LAPRAS, QUICK_CLAW
		rmoves BLIZZARD, HAIL, SURF, THUNDERBOLT, $fe
	dbww 5, HERACROSS, FOCUS_BAND
		rmoves SUBMISSION, STONE_EDGE, COUNTER, STRENGTH, $fe
	dbww 5, UNOWN, SITRUS_BERRY
		rmoves HEX, TOXIC, COSMIC_POWER, MEAN_LOOK, $fe
	dbww 5, CORSOLA, LUM_BERRY
		rmoves FROSTBITE, SURF, RECOVER, ANCIENTPOWER, $fe
	dbww 5, DELIBIRD, FOCUS_BAND
		rmoves BLIZZARD, SKY_ATTACK, SPIKES, REFLECT, $fe
	dbww 5, QWILFISH, LEFTOVERS
		rmoves TOXIC, SURF, SLUDGE_WAVE, SPIKES, $fe
	dbww 5, MILTANK, SOFT_SAND
		rmoves EARTHQUAKE, DEFENSE_CURL, ROLLOUT, DOUBLE_EDGE, $fe
	dbww 5, STANTLER, PINK_BOW
		rmoves BODY_SLAM, EARTHQUAKE, HYPNOSIS, DREAM_EATER, $fe
	dbww 5, MANTINE, SITRUS_BERRY
		rmoves HYDRO_PUMP, SKY_ATTACK, RAIN_DANCE, THUNDER, $fe

	dbww 5, TORKOAL, CHARCOAL
		rmoves SACRED_FIRE, SUNNY_DAY, CURSE, REST, $fe
	dbww 5, SPINDA, LEFTOVERS
		rmoves DIZZY_PUNCH, DOUBLE_EDGE, BELLY_DRUM, EXTREMESPEED, $fe
	dbww 5, SEVIPER, QUICK_CLAW
		rmoves POISON_JAB, CRUNCH, IRON_TAIL, TOXIC, $fe
	dbww 5, ROSELIA, MIRACLE_SEED
		rmoves GIGA_DRAIN, SLUDGE_WAVE, LEECH_SEED, STUN_SPORE, $fe
	dbww 5, SOLROCK, SITRUS_BERRY
		rmoves POWER_GEM, SUNNY_DAY, WILLOWISP, FIRE_BLAST, $fe
	dbww 5, MAWILE, SITRUS_BERRY
		rmoves VICEGRIP, DIZZY_PUNCH, SANDSTORM, REST, $fe
	dbww 5, CHIMECHO, LUM_BERRY
		rmoves PSYCHIC_M, FLASHCANNON, RECOVER, CALM_MIND, $fe
	dbww 5, ABSOL, KINGS_ROCK
		rmoves SKY_ATTACK, SWORDS_DANCE, EXTREMESPEED, BEAT_UP, $fe
	dbww 5, TROPIUS, LEFTOVERS
		rmoves GIGA_DRAIN, SKY_ATTACK, LEECH_SEED, STUN_SPORE, $fe
	dbww 5, SKARMORY, LUM_BERRY
		rmoves AGILITY, STEEL_WING, DRILL_PECK, RECOVER, $fe
	dbww 5, LUVDISC, MYSTIC_WATER
		rmoves RAIN_DANCE, SURF, RECOVER, DRAININGKISS, $fe
	dbww 5, RELICANTH, LEFTOVERS
		rmoves SURF, FROSTBITE, ROCK_TOMB, RECOVER, $fe

	dbww 5, PORYGON, MAGNET
		rmoves THUNDER, TRI_ATTACK, THUNDER_WAVE, RECOVER, $fe
	dbww 5, GLIGAR, SITRUS_BERRY
		rmoves EARTHQUAKE, POISON_FANG, MUD_SLAP, BULK_UP, $fe
	dbww 5, SHUCKLE, LEFTOVERS
		rmoves DEFENSE_CURL, ROCK_TOMB, SPIKES, ROLLOUT, $fe
	dbww 5, AIPOM, LEFTOVERS
		rmoves MUD_SLAP, DIG, BODY_SLAM, ROCK_TOMB, $fe
	dbww 5, ELECTABUZZ, MAGNET
		rmoves FIRE_PUNCH, MUD_SLAP, THUNDERBOLT, REFLECT, $fe
	dbww 5, MAGMAR, CHARCOAL
		rmoves FIRE_BLAST, PSYCHIC_M, WILLOWISP, LIGHT_SCREEN, $fe
	dbww 5, TANGELA, QUICK_CLAW
		rmoves SLEEP_POWDER, GIGA_DRAIN, LEECH_SEED, AMNESIA, $fe
	dbww 5, HITMONCHAN, SITRUS_BERRY
		rmoves FIRE_PUNCH, ICE_PUNCH, DIZZY_PUNCH, MACH_PUNCH, $fe
	dbww 5, HITMONLEE, SITRUS_BERRY
		rmoves MEGA_KICK, BLAZE_KICK, HI_JUMP_KICK, PURSUIT, $fe
	dbww 5, CHANSEY, LEFTOVERS
		rmoves SOFTBOILED, EGG_BOMB, TOXIC, LIGHT_SCREEN, $fe
	dbww 5, WOBBUFFET, SITRUS_BERRY
		rmoves COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND, $fe
	dbww 5, SNEASEL, LEFTOVERS
		rmoves ICICLE_CRASH, PURSUIT, PSYCHO_CUT, MACH_PUNCH, $fe
	db -1 ; end