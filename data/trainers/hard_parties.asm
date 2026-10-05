; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    * for TRAINERTYPE_NORMAL:     db level, species
;    * for TRAINERTYPE_MOVES:      db level, species, 4 moves
;    * for TRAINERTYPE_ITEM:       db level, species, item
;    * for TRAINERTYPE_ITEM_MOVES: db level, species, item, 4 moves
; - end_party

SECTION "Hard Trainer Parties 1", ROMX

FalknerGroupHard:
	next_list_item ; FALKNER (1)
	db "Falkner@", TRAINERTYPE_MOVES
	mon 6, NATU
		moves TACKLE, CONFUSE_RAY, GUST, CONFUSION
	mon 7, PIDGEOTTO
		moves TACKLE, MUD_SLAP, GUST, LEER
	mon 8, NOCTOWL
		moves TACKLE, MUD_SLAP, GUST, CONFUSE_RAY
	end_party

	next_list_item ; FALKNER (2)
	db "Falkner@", TRAINERTYPE_MOVES
	mon 10, XATU
		moves PSYBEAM, CONFUSE_RAY, RAZOR_WIND, MUD_SLAP
	mon 9, GLIGAR
		moves MAGNITUDE, MUD_SLAP, SLASH, FAINT_ATTACK
	mon 10, FEAROW
		moves DRILL_PECK, MUD_SLAP, GUST, CONFUSION
	mon 12, NOCTOWL
		moves HYPNOSIS, MUD_SLAP, DREAM_EATER, CONFUSE_RAY
	end_party

	next_list_item ; FALKNER (3)
	db "Falkner@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, SKARMORY, LEFTOVERS
		moves DRILL_PECK, TOXIC, COSMIC_POWER, REST
	itemmon 10, XATU, TWISTEDSPOON
		moves PSYCHIC_M, CONFUSE_RAY, RAZOR_WIND, MUD_SLAP
	itemmon 10, GLISCOR, QUICK_CLAW
		moves FISSURE, MUD_SLAP, SLASH, PURSUIT
	itemmon 10, PELIPPER, LEFTOVERS
		moves HYDRO_PUMP, PROTECT, HURRICANE, RECOVER
	itemmon 10, DELIBIRD, NO_ITEM
		moves BLIZZARD, MUD_SLAP, SKY_ATTACK, CONFUSE_RAY
	itemmon 12, NOCTOWL2, TWISTEDSPOON
		moves WILLOWISP, MUD_SLAP, PSYCHIC_M, MOONBLAST
	end_party

	next_list_item ; FALKNER (4) ;World Cup Falkner
	db "Falkner@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, ARTICUNO, NO_ITEM
		moves DRILL_PECK, HURRICANE, BLIZZARD, PSYBEAM
	itemmon 11, ZAPDOS, NO_ITEM
		moves THUNDERBOLT, DRILL_PECK, RAZOR_WIND, JUMP_KICK
	itemmon 11, MOLTRES, QUICK_CLAW
		moves SKY_ATTACK, MUD_SLAP, FIRE_BLAST, PURSUIT
	itemmon 12, PELIPPER, LEFTOVERS
		moves HYDRO_PUMP, PROTECT, HURRICANE, RECOVER
	itemmon 12, DELIBIRD, NO_ITEM
		moves BLIZZARD, MUD_SLAP, SKY_ATTACK, CONFUSE_RAY
	itemmon 15, NOCTOWL, TWISTEDSPOON
		moves WILLOWISP, MUD_SLAP, PSYCHIC_M, SHADOW_BALL
	end_party

	end_list_items

WhitneyGroupHard:
	next_list_item ; WHITNEY (1)
	db "Whitney@", TRAINERTYPE_MOVES
	mon 10, CLEFAIRY
		moves POUND, MIMIC, ENCORE, METRONOME
	mon 10, JIGGLYPUFF
		moves POUND, SING, ENCORE, REST
	mon 12, MILTANK
		moves ROLLOUT, ATTRACT, STOMP, MILK_DRINK
	end_party
	
	next_list_item ; WHITNEY (2)
	db "Whitney@", TRAINERTYPE_MOVES	
	mon 10, WIGGLYTUFF
		moves WILLOWISP, COSMIC_POWER, DIZZY_PUNCH, REST
	mon 10, FURRET
		moves HYPER_FANG, BULK_UP, DIG, CRUNCH
	mon 10, RATICATE
		moves HYPER_FANG, SHARPEN, CRUNCH, QUICK_ATTACK
	mon 12, MILTANK
		moves ROLLOUT, BULK_UP, BODY_SLAM, MILK_DRINK
	end_party
	
	next_list_item ; WHITNEY (3)
	db "Whitney@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, FURRET2, DRAGON_FANG
		moves DRAGON_CLAW, DRAGON_DANCE, BODY_SLAM, CRUNCH
	itemmon 10, CLEFABLE, LEFTOVERS
		moves MOONBLAST, CALM_MIND, PSYCHIC_M, METEOR_MASH
	itemmon 10, WIGGLYTUFF, LEFTOVERS
		moves WILLOWISP, COSMIC_POWER, MOONBLAST, REST
	itemmon 10, RATICATE, PINK_BOW
		moves HYPER_FANG, SWORDS_DANCE, CRUNCH, EXTREMESPEED
	itemmon 10, TAUROS, PINK_BOW
		moves BODY_SLAM, SUBMISSION, EARTHQUAKE, OUTRAGE
	itemmon 12, MILTANK, LEFTOVERS
		moves ROLLOUT, COSMIC_POWER, BODY_SLAM, MILK_DRINK
	end_party

	end_list_items

BugsyGroupHard:
	next_list_item ; BUGSY (1)
	db "Bugsy@", TRAINERTYPE_MOVES
	mon 10, LEDYBA
		moves MACH_PUNCH, STRING_SHOT, ICE_PUNCH, LEECH_LIFE
	mon 10, PARAS
		moves STRING_SHOT, STUN_SPORE, POISONPOWDER, RAZOR_LEAF
	mon 12, SCYTHER
		moves QUICK_ATTACK, LEER, FURY_CUTTER, BITE
	end_party
	
	next_list_item ; BUGSY (2)
	db "Bugsy@", TRAINERTYPE_MOVES
	mon 10, MASQUERAIN
		moves SURF, CONFUSE_RAY, FURY_CUTTER, SIGNAL_BEAM
	mon 10, LEDIAN
		moves MACH_PUNCH, STRING_SHOT, ICE_PUNCH, LEECH_LIFE
	mon 10, PARASECT
		moves LEAF_BLADE, STUN_SPORE, SPORE, RAZOR_LEAF
	mon 12, SCYTHER
		moves SLASH, SCARY_FACE, FURY_CUTTER, NO_MOVE
	end_party

	next_list_item ; BUGSY (3)
	db "Bugsy@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, MASQUERAIN, QUICK_CLAW
		moves HYDRO_PUMP, CONFUSE_RAY, MEDITATE, SIGNAL_BEAM
	itemmon 10, LEDIAN, NO_ITEM
		moves MACH_PUNCH, FIRE_PUNCH, ICE_PUNCH, DIZZY_PUNCH
	itemmon 12, ARMALDO, QUICK_CLAW
		moves MEGAHORN, ROCK_TOMB, ROCK_SLIDE, SHADOW_CLAW
	itemmon 10, PARASECT, QUICK_CLAW
		moves LEAF_BLADE, STUN_SPORE, SPORE, SLASH
	itemmon 10, SCYTHER2, NO_ITEM
		moves SLASH, SWORDS_DANCE, FURY_CUTTER, PSYCHO_CUT
	itemmon 12, SCIZOR2, LEFTOVERS
		moves SLASH, VICEGRIP, SWORDS_DANCE, BULLET_PUNCH
	end_party

	end_list_items

MortyGroupHard:
	next_list_item ; MORTY (1)
	db "Morty@", TRAINERTYPE_MOVES
	mon 10, VULPIX
		moves LICK, HYPNOSIS, EMBER, WILLOWISP
	mon 10, HAUNTER
		moves LICK, SPITE, MEAN_LOOK, CURSE
	mon 10, MAROWAK
		moves BONEMERANG, HEADBUTT, LICK, FOCUS_ENERGY
	mon 12, MISDREAVUS
		moves LICK, WILLOWISP, CONFUSE_RAY, NIGHT_SHADE
	end_party
	
	next_list_item ; MORTY (2)
	db "Morty@", TRAINERTYPE_MOVES
	mon 10, NINETALES
		moves SHADOW_BALL, HYPNOSIS, FLAMETHROWER, WILLOWISP
	mon 10, HAUNTER
		moves LICK, THUNDERBOLT, SMOG, SHADOW_BALL
	mon 10, MAROWAK
		moves BONEMERANG, HEADBUTT, SHADOW_BALL, BONE_CLUB
	mon 10, AMAROWAK
		moves BONEMERANG, HEADBUTT, SHADOW_BALL, BONE_CLUB
	mon 12, MISDREAVUS
		moves SHADOW_BALL, WILLOWISP, CONFUSE_RAY, NIGHT_SHADE
	end_party
	
	next_list_item ; MORTY (3)
	db "Morty@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, PARASECT, QUICK_CLAW
		moves DESTINY_BOND, SHADOW_CLAW, GIGA_DRAIN, SPORE
	itemmon 10, NINETALES, LEFTOVERS
		moves SHADOW_BALL, LUSTER_PURGE, FIRE_BLAST, WILLOWISP
	itemmon 10, MAROWAK, THICK_CLUB
		moves EARTHQUAKE, HEADBUTT, SHADOW_CLAW, MUD_SHOT
	itemmon 10, WYRDEER, TWISTEDSPOON
		moves HYPNOSIS, BODY_SLAM, SHADOW_BALL, DREAM_EATER
	itemmon 10, MISMAGIUS, SPELL_TAG
		moves SHADOW_BALL, WILLOWISP, CONFUSE_RAY, CALM_MIND
	itemmon 12, GENGARX, SPELL_TAG
		moves PSYCHIC_M, THUNDERBOLT, SLUDGE_BOMB, SHADOW_BALL
	end_party

	end_list_items

PryceGroupHard:
	next_list_item ; PRYCE (1)
	db "Pryce@", TRAINERTYPE_MOVES
	mon 12, DELIBIRD
		moves ICY_WIND, GUST, AURORA_BEAM, SPIKES
	mon 10, JYNX
		moves PERISH_SONG, PSYBEAM, ICE_PUNCH, ICY_WIND
	mon 12, SNEASEL
		moves ICE_PUNCH, SLASH, AURORA_BEAM, PURSUIT
	end_party
	
	next_list_item ; PRYCE (2)
	db "Pryce@", TRAINERTYPE_MOVES
	mon 12, DELIBIRD
		moves BLIZZARD, RAZOR_WIND, ICY_WIND, SPIKES
	mon 10, JYNX
		moves PERISH_SONG, PSYBEAM, ICE_PUNCH, ICY_WIND
	mon 10, WEAVILE
		moves ICE_PUNCH, SLASH, MACH_PUNCH, PURSUIT
	mon 12, MAMOSWINE
		moves EARTHQUAKE, BLIZZARD, BULK_UP, BODY_SLAM
	end_party
	
	next_list_item ; PRYCE (3)
	db "Pryce@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, DELIBIRD, FOCUS_BAND
		moves BLIZZARD, RAZOR_WIND, ICY_WIND, SPIKES
	itemmon 10, WALREIN, LEFTOVERS
		moves SURF, HAIL, BLIZZARD, REST
	itemmon 10, JYNX, FOCUS_BAND
		moves HAIL, PSYCHIC_M, BLIZZARD, LOVELY_KISS
	itemmon 10, WEAVILE, FOCUS_BAND
		moves ICICLE_CRASH, SLASH, MACH_PUNCH, PURSUIT
	itemmon 12, MAMOSWINE, QUICK_CLAW
		moves EARTHQUAKE, ICICLE_CRASH, BULK_UP, BODY_SLAM
	itemmon 12, GLALIEX, NEVERMELTICE
		moves ICICLE_CRASH, CRUNCH, REST, COSMIC_POWER
	end_party

	end_list_items

JasmineGroupHard:
	next_list_item ; JASMINE (1)
	db "Jasmine@", TRAINERTYPE_MOVES
	mon 10, MAGNEMITE
		moves METAL_CLAW, SUPERSONIC, THUNDER_WAVE, THUNDERSHOCK
	mon 10, KRABBY
		moves BUBBLEBEAM, CUT, CRABHAMMER, HARDEN
	mon 12, SKARMORY
		moves SLASH, STEEL_WING, AGILITY, WING_ATTACK
	end_party
	
	next_list_item ; JASMINE (2)
	db "Jasmine@", TRAINERTYPE_MOVES
	mon 12, MAWILE
		moves SANDSTORM, VICEGRIP, CRUNCH, DIZZY_PUNCH
	mon 10, MAGNETON
		moves TRI_ATTACK, SWIFT, THUNDER_WAVE, SHOCK_WAVE
	mon 10, KINGLER
		moves CRUSH_CLAW, VICEGRIP, CRABHAMMER, PROTECT
	mon 12, SKARMORY
		moves SLASH, STEEL_WING, AGILITY, WING_ATTACK
	end_party
	
	next_list_item ; JASMINE (3)
	db "Jasmine@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, SKARMORY, QUICK_CLAW
		moves SLASH, VICEGRIP, SANDSTORM, SKY_ATTACK
	itemmon 12, MAWILE, QUICK_CLAW
		moves SANDSTORM, VICEGRIP, CRUNCH, DIZZY_PUNCH
	itemmon 10, MAGNEZONE, MAGNET
		moves TRI_ATTACK, CHARGE, FLASHCANNON, ZAP_CANNON
	itemmon 10, KINGLER, METAL_COAT
		moves CRUSH_CLAW, VICEGRIP, CRABHAMMER, PROTECT
	itemmon 12, AGGRON, MIRACLEBERRY
		moves GUILLOTINE, EARTHQUAKE, BULK_UP, SANDSTORM
	itemmon 13, STEELIXX, LEFTOVERS
		moves IRON_TAIL, FISSURE, COSMIC_POWER, SANDSTORM
	end_party

	end_list_items

ChuckGroupHard:
	next_list_item ; CHUCK (1)
	db "Chuck@", TRAINERTYPE_MOVES
	mon 12, HITMONCHAN
		moves MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	mon 12, HITMONLEE
		moves MEGA_KICK, JUMP_KICK, FAINT_ATTACK, HI_JUMP_KICK
	mon 12, HITMONTOP
		moves ROLLING_KICK, SLAM, MACH_PUNCH, FAINT_ATTACK
	end_party
	
	next_list_item ; CHUCK (2)
	db "Chuck@", TRAINERTYPE_MOVES
	mon 12, HITMONCHAN
		moves MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	mon 12, HITMONLEE
		moves MEGA_KICK, JUMP_KICK, FAINT_ATTACK, HI_JUMP_KICK
	mon 12, HITMONTOP
		moves ROLLING_KICK, SLAM, MACH_PUNCH, FAINT_ATTACK
	mon 12, BRELOOM
		moves LEAF_BLADE, SPORE, MACH_PUNCH, CROSS_CHOP
	end_party
	
	next_list_item ; CHUCK (3)
	db "Chuck@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, HITMONCHAN, BLACKBELT_I
		moves MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	itemmon 10, HITMONLEE, BLACKBELT_I
		moves BLAZE_KICK, EXTREMESPEED, PURSUIT, HI_JUMP_KICK
	itemmon 10, BRELOOM, QUICK_CLAW
		moves LEAF_BLADE, SPORE, MACH_PUNCH, SWORDS_DANCE
	itemmon 10, MEDICHAM, BLACKBELT_I
		moves BULLET_PUNCH, ZEN_HEADBUTT, BULK_UP, SHADOW_PUNCH
	itemmon 12, POLIWRATH, BLACKBELT_I
		moves SURF, DYNAMICPUNCH, MACH_PUNCH, HYPNOSIS
	itemmon 12, KINGLERX, QUICK_CLAW
		moves AQUA_JET, CURSE, CRABHAMMER, GUILLOTINE
	end_party

	end_list_items

ClairGroupHard:
	next_list_item ; CLAIR (1)
	db "Clair@", TRAINERTYPE_MOVES
	mon 12, GYARADOS
		moves DRAGONBREATH, WATERFALL, WHIRLPOOL, RAIN_DANCE
	mon 10, DRAGONAIR
		moves THUNDER_WAVE, SURF, SLAM, DRAGONBREATH
	mon 10, LAPRAS
		moves BLIZZARD, SURF, THUNDER, RAIN_DANCE
	end_party
	
	next_list_item ; CLAIR (1)
	db "Clair@", TRAINERTYPE_MOVES
	mon 12, GYARADOS
		moves DRAGONBREATH, WATERFALL, WHIRLPOOL, RAIN_DANCE
	mon 10, FLYGON
		moves EARTHQUAKE, SURF, MUD_SHOT, DRAGONBREATH
	mon 10, LAPRAS
		moves BLIZZARD, SURF, THUNDER, RAIN_DANCE
	mon 12, KINGDRA
		moves AGILITY, HYDRO_PUMP, THUNDER, OUTRAGE
	end_party
	
	next_list_item ; CLAIR (3)
	db "Clair@", TRAINERTYPE_ITEM_MOVES	
	itemmon 15, DRAGONITEY, LEFTOVERS
		moves DRAGONBREATH, SCALD, CALM_MIND, REST
	end_party

	end_list_items

Rival1GroupHard:
	next_list_item ; RIVAL1 (1)
	db "?@", TRAINERTYPE_NORMAL
	mon 2, TEDDIURSA
	end_party

	next_list_item ; RIVAL1 (2)
	db "?@", TRAINERTYPE_NORMAL
	mon 8, MAREEP
	mon 8, NATU
	mon 8, REMORAID
	mon 11, TEDDIURSA
	end_party

	next_list_item ; RIVAL1 (3)
	db "?@", TRAINERTYPE_NORMAL
	mon 6, PINECO
	mon 8, FLAAFFY
	mon 8, XATU
	mon 9, REMORAID
	mon 11, URSARING
	end_party

	next_list_item ; RIVAL1 (4)
	db "?@", TRAINERTYPE_NORMAL
	mon 7, FORRETRESS
	mon 8, SNEASEL
	mon 8, AMPHAROS
	mon 9, XATU
	mon 10, OCTILLERY
	mon 13, URSARING
	end_party

	next_list_item ; RIVAL1 (5)
	db "?@", TRAINERTYPE_NORMAL
	mon 12, FORRETRESS
	mon 12, WEAVILE
	mon 12, AMPHAROS
	mon 12, XATU
	mon 12, OCTILLERY
	mon 15, URSALUNA
	end_party

	end_list_items

OakGroupHard:
	next_list_item ; OAK (1)
	db "Oak@", TRAINERTYPE_ITEM_MOVES
	itemmon 15, TAUROS, QUICK_CLAW
		moves DOUBLE_EDGE, FISSURE, BULK_UP, RECOVER
	itemmon 15, NIDOKING, FOCUS_BAND
		moves COSMIC_POWER, ANCIENTPOWER, SLUDGE_BOMB, FISSURE
	itemmon 15, WYRDEER, KINGS_ROCK
		moves BODY_SLAM, HYPNOSIS, REFLECT, PSYCHIC_M
	itemmon 16, VENUSAURX, MIRACLEBERRY
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, EARTHQUAKE
	itemmon 16, CHARIZARDX, DRAGON_FANG
		moves DRAGON_CLAW, SACRED_FIRE, WILLOWISP, SKY_ATTACK
	itemmon 16, BLASTOISEX, LEFTOVERS
		moves SCALD, RAIN_DANCE, HYDRO_PUMP, COSMIC_POWER
	end_party

	end_list_items

WillGroupHard:
	next_list_item ; WILL (1)
	db "Will@", TRAINERTYPE_MOVES
	mon 12, GARDEVOIR
		moves PSYCHIC_M, SWIFT, CALM_MIND, HYPNOSIS
	mon 12, LUNATONE
		moves COSMIC_POWER, ANCIENTPOWER, FUTURE_SIGHT, PSYCHIC_M
	mon 12, EXEGGUTOR
		moves STUN_SPORE, LEECH_SEED, EGG_BOMB, PSYCHIC_M
	mon 12, GIRAFARIG
		moves PURSUIT, CALM_MIND, BODY_SLAM, PSYCHIC_M
	mon 12, SLOWKING
		moves SURF, CALM_MIND, FLAMETHROWER, PSYCHIC_M
	mon 12, ESPEON
		moves BODY_SLAM, REFLECT, SHADOW_BALL, PSYCHIC_M
	end_party
	
	next_list_item ; WILL (2)
	db "Will@", TRAINERTYPE_ITEM_MOVES
	itemmon 13, GARDEVOIR, QUICK_CLAW
		moves DREAM_EATER, MOONBLAST, CALM_MIND, HYPNOSIS
	itemmon 13, CLAYDOL, LEFTOVERS
		moves COSMIC_POWER, ANCIENTPOWER, REST, PSYCHIC_M
	itemmon 13, ESPEON, TWISTEDSPOON
		moves BODY_SLAM, REFLECT, SHADOW_BALL, PSYCHIC_M
	itemmon 13, WYRDEER, MIRACLEBERRY
		moves PURSUIT, EARTHQUAKE, HYPNOSIS, DREAM_EATER
	itemmon 15, XATU, MIRACLEBERRY
		moves SKY_ATTACK, HYPNOSIS, SHADOW_BALL, PSYCHIC_M
	itemmon 15, SLOWBROX, LEFTOVERS
		moves SCALD, COSMIC_POWER, REST, PSYCHIC_M
	end_party

	end_list_items

PKMNTrainerGroupHard:
	next_list_item ; CAL (1)
	db "Cal@", TRAINERTYPE_NORMAL
	mon 10, CHIKORITA
	mon 10, CYNDAQUIL
	mon 10, TOTODILE
	end_party

	next_list_item ; CAL (2)
	db "Cal@", TRAINERTYPE_NORMAL
	mon 10, BAYLEEF
	mon 10, QUILAVA
	mon 10, CROCONAW
	end_party

	next_list_item ; CAL (3)
	db "Cal@", TRAINERTYPE_NORMAL
	mon 10, MEGANIUM
	mon 10, TYPHLOSION
	mon 10, FERALIGATR
	end_party

	end_list_items

BrunoGroupHard:
	next_list_item ; BRUNO (1)
	db "Bruno@", TRAINERTYPE_MOVES
	mon 12, HITMONTOP
		moves PURSUIT, TRIPLE_KICK, DIG, DETECT
	mon 12, HITMONLEE
		moves SWAGGER, MEGA_KICK, HI_JUMP_KICK, FORESIGHT
	mon 12, HITMONCHAN
		moves THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, DYNAMICPUNCH
	mon 12, STEELIX
		moves IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	mon 12, MACHAMP
		moves ROCK_SLIDE, MACH_PUNCH, FISSURE, CROSS_CHOP
	mon 12, ANNIHILAPE
		moves MEGAHORN, CROSS_CHOP, SHADOW_PUNCH, EARTHQUAKE
	end_party
	
	next_list_item ; BRUNO (2)
	db "Bruno@", TRAINERTYPE_ITEM_MOVES
	itemmon 13, BLAZIKEN, BLACKBELT_I
		moves DRILL_PECK, BLAZE_KICK, HI_JUMP_KICK, DETECT
	itemmon 13, HITMONCHAN, QUICK_CLAW
		moves THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, DYNAMICPUNCH
	itemmon 13, STEELIX, LEFTOVERS
		moves IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	itemmon 13, MACHAMP, QUICK_CLAW
		moves ROCK_SLIDE, MACH_PUNCH, FISSURE, CROSS_CHOP
	itemmon 15, ANNIHILAPE, QUICK_CLAW
		moves MEGAHORN, CROSS_CHOP, SHADOW_PUNCH, EARTHQUAKE
	itemmon 13, HERACROSSX, QUICK_CLAW
		moves MEGAHORN, MACH_PUNCH, HI_JUMP_KICK, PURSUIT
	end_party

	end_list_items

KarenGroupHard:
	next_list_item ; KAREN (1)
	db "Karen@", TRAINERTYPE_MOVES
	mon 12, UMBREON
		moves CONFUSE_RAY, TOXIC, SNARL, REST
	mon 12, HOUNDOOM
		moves ROAR, SNARL, FLAMETHROWER, MUD_SLAP
	mon 12, VILEPLUME
		moves STUN_SPORE, SLUDGE_BOMB, SWIFT, PETAL_DANCE
	mon 12, DUSCLOPS
		moves SHADOW_BALL, HYPNOSIS, DREAM_EATER, ICY_WIND
	mon 12, ABSOL
		moves EXTREMESPEED, DRILL_PECK, PURSUIT, SKY_ATTACK
	mon 12, TYRANITAR
		moves CRUNCH, ROCK_SLIDE, EARTHQUAKE, OUTRAGE
	end_party
	
	next_list_item ; KAREN (2)
	db "Karen@", TRAINERTYPE_ITEM_MOVES
	itemmon 13, UMBREON, LEFTOVERS
		moves CONFUSE_RAY, TOXIC, SNARL, REST
	itemmon 13, UNOWN, LEFTOVERS
		moves GLARE, COSMIC_POWER, PURSUIT, DESTINY_BOND
	itemmon 13, DUSKNOIR, LEFTOVERS
		moves SHADOW_FORCE, HYPNOSIS, DREAM_EATER, ICY_WIND
	itemmon 13, GENGAR, POISON_BARB
		moves SHADOW_BALL, HYPNOSIS, DREAM_EATER, SLUDGE_WAVE
	itemmon 13, HONCHKROW, SHARP_BEAK
		moves EXTREMESPEED, DRILL_PECK, PURSUIT, SKY_ATTACK
	itemmon 15, TYRANITARX, FOCUS_BAND
		moves CRUNCH, STONE_EDGE, EARTHQUAKE, OUTRAGE
	end_party

	end_list_items

KogaGroupHard:
	next_list_item ; KOGA (1)
	db "Koga@", TRAINERTYPE_MOVES
	mon 12, FORRETRESS
		moves PROTECT, SWIFT, EXPLOSION, SPIKES
	mon 12, WEEZING
		moves FIRE_BLAST, SLUDGE_BOMB, EXPLOSION, TOXIC
	mon 12, BEEDRILL
		moves TWINEEDLE, SLUDGE_BOMB, TOXIC, EXTREMESPEED
	mon 12, VENOMOTH
		moves PSYCHIC_M, DOUBLE_TEAM, SHADOW_BALL, TOXIC
	mon 12, AMUK
		moves MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	mon 12, CROBAT
		moves EXTREMESPEED, SWIFT, SKY_ATTACK, SLUDGE_BOMB
	end_party
	
	next_list_item ; KOGA (2)
	db "Koga@", TRAINERTYPE_ITEM_MOVES
	itemmon 13, TENTACRUEL, LEFTOVERS
		moves COSMIC_POWER, SURF, ICY_WIND, POWER_GEM
	itemmon 13, WEEZING, FOCUS_BAND
		moves FIRE_BLAST, SLUDGE_BOMB, EXPLOSION, WILLOWISP
	itemmon 13, VENOMOTH, SPELL_TAG
		moves PSYCHIC_M, DOUBLE_TEAM, SHADOW_BALL, CONFUSE_RAY
	itemmon 13, AMUK, LEFTOVERS
		moves MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	itemmon 13, CROBAT, POISON_BARB
		moves EXTREMESPEED, CONFUSE_RAY, SKY_ATTACK, SLUDGE_BOMB
	itemmon 15, SWALOTX, LEFTOVERS
		moves COSMIC_POWER, TOXIC, GIGA_DRAIN, REST
	end_party

	end_list_items

ChampionGroupHard:
	next_list_item ; CHAMPION (1)
	db "Lance@", TRAINERTYPE_MOVES
	mon 13, GYARADOS
		moves THUNDER, RAIN_DANCE, HYDRO_PUMP, HYPER_BEAM
	mon 13, LAPRAS
		moves BLIZZARD, RAIN_DANCE, THUNDER, HYDRO_PUMP
	mon 13, REGISTEEL
		moves REST, CURSE, EARTHQUAKE, METEOR_MASH
	mon 13, AERODACTYL
		moves SKY_ATTACK, ANCIENTPOWER, STRENGTH, HYPER_BEAM
	mon 13, SALAMENCE
		moves FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, DRAGON_CLAW
	mon 15, DRAGONITE
		moves FIRE_BLAST, THUNDER, OUTRAGE, HYPER_BEAM
	end_party
	
	next_list_item ; CHAMPION (2)
	db "Lance@", TRAINERTYPE_ITEM_MOVES
	itemmon 15, GYARADOS, MYSTIC_WATER
		moves FIRE_FANG, OUTRAGE, WATERFALL, AQUA_JET
	itemmon 15, TOGEKISS, MINT_BERRY
		moves REST, MOONBLAST, MIST_BALL, OUTRAGE
	itemmon 15, DRAGONITE, MINT_BERRY
		moves WATERFALL, THUNDER, OUTRAGE, HYPER_BEAM
	itemmon 15, CHARIZARD, CHARCOAL
		moves FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, HYPER_BEAM
	itemmon 15, FLYGON, FOCUS_BAND
		moves DRAGON_CLAW, DRAGON_DANCE, EXTREMESPEED, EARTHQUAKE
	end_party

	next_list_item ; CHAMPION (3)
	db "Lance@", TRAINERTYPE_MOVES
	mon 20, DRAGONITEX
		moves WATERFALL, EXTREMESPEED, OUTRAGE, HYPER_BEAM
	end_party

	end_list_items

BrockGroupHard:
	next_list_item ; BROCK (1)
	db "Brock@", TRAINERTYPE_MOVES
	mon 4, GEODUDE
		moves ROCK_THROW, HARDEN, BIDE, SAND_ATTACK
	mon 5, OMANYTE
		moves BITE, BUBBLE, TACKLE, NO_MOVE
	mon 6, ONIX
		moves BIDE, SCREECH, WRAP, ROCK_THROW
	end_party

	next_list_item ; BROCK (2)
	db "Brock@", TRAINERTYPE_MOVES
	mon 8, GRAVELER
		moves ROCK_TOMB, DIG, ANCIENTPOWER, SANDSTORM
	mon 8, ONIX
		moves ROCK_TOMB, DIG, SLAM, SANDSTORM
	mon 9, RELICANTH
		moves ROCK_TOMB, BUBBLEBEAM, ROCK_SLIDE, SANDSTORM
	mon 10, KABUTOPS
		moves SLASH, ROCK_TOMB, ICE_PUNCH, SANDSTORM
	mon 10, OMASTAR
		moves CRUNCH, SURF, PROTECT, SPIKE_CANNON
	mon 12, RHYDON
		moves DRAGON_CLAW, EARTHQUAKE, BULK_UP, ROCK_TOMB
	end_party
	
	next_list_item ; BROCK (3)
	db "Brock@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, AGOLEM, MAGNET
		moves THUNDERBOLT, STONE_EDGE, SANDSTORM, EARTHQUAKE
	itemmon 9, STEELIX, NO_ITEM
		moves STONE_EDGE, EARTHQUAKE, VICEGRIP, SANDSTORM
	itemmon 10, KABUTOPS, NO_ITEM
		moves SLASH, ROCK_TOMB, ICE_PUNCH, SANDSTORM
	itemmon 10, OMASTAR, NO_ITEM
		moves CRUNCH, SURF, PROTECT, SPIKE_CANNON
	itemmon 11, RHYPERIOR, LEFTOVERS
		moves ROCK_TOMB, STONE_EDGE, DRAGON_CLAW, SANDSTORM
	itemmon 13, AERODACTYLX, KINGS_ROCK
		moves DRILL_PECK, DRAGON_CLAW, CRUNCH, STONE_EDGE
	end_party

	end_list_items

MistyGroupHard:
	next_list_item ; MISTY (1)
	db "Misty@", TRAINERTYPE_MOVES
	mon 8, PSYDUCK
		moves BUBBLEBEAM, DISABLE, SCRATCH, CONFUSION
	mon 8, CHINCHOU
		moves BUBBLEBEAM, THUNDERSHOCK, RAIN_DANCE, WHIRLPOOL
	mon 11, STARMIE
		moves BUBBLEBEAM, CONFUSION, RECOVER, ICY_WIND
	end_party
	
	next_list_item ; MISTY (2)
	db "Misty@", TRAINERTYPE_MOVES
	mon 8, PELIPPER
		moves SURF, THUNDER, RAIN_DANCE, WHIRLPOOL
	mon 8, SEAKING
		moves SURF, DRILL_PECK, RAIN_DANCE, WATERFALL
	mon 8, MASQUERAIN
		moves SURF, TWINEEDLE, SIGNAL_BEAM, RAIN_DANCE
	mon 11, GOLDUCK
		moves SURF, SLASH, CALM_MIND, PSYBEAM
	mon 12, STARMIE
		moves SURF, PSYCHIC_M, RECOVER, CALM_MIND
	end_party
	
	next_list_item ; MISTY (3)
	db "Misty@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, LUVDISC, NO_ITEM
		moves SURF, AQUA_JET, RAIN_DANCE, SCALD
	itemmon 9, SEAKING, NO_ITEM
		moves AQUA_JET, DRILL_PECK, RAIN_DANCE, WATERFALL
	itemmon 10, GOLDUCK, MIRACLEBERRY
		moves SURF, THUNDER, MEDITATE, PSYCHIC_M
	itemmon 10, MILOTIC, NO_ITEM
		moves SURF, BLIZZARD, WILLOWISP, RECOVER
	itemmon 11, LAPRAS, LEFTOVERS
		moves RAIN_DANCE, BLIZZARD, THUNDER, REST
	itemmon 13, STARMIE, KINGS_ROCK
		moves SURF, PSYCHIC_M, RECOVER, CALM_MIND
	end_party

	end_list_items

LtSurgeGroupHard:
	next_list_item ; LT_SURGE (1)
	db "Lt.Surge@", TRAINERTYPE_MOVES
	mon 8, MAGNEMITE
		moves METAL_CLAW, SHOCK_WAVE, SONICBOOM, THUNDER_WAVE
	mon 9, ELECTABUZZ
		moves REFLECT, THUNDERPUNCH, DIZZY_PUNCH, SHOCK_WAVE
	mon 11, RAICHU
		moves DIG, QUICK_ATTACK, SHOCK_WAVE, PIXIE_DUST
	end_party
	
	next_list_item ; LT_SURGE (2)
	db "Lt.Surge@", TRAINERTYPE_MOVES
	mon 8, LANTURN
		moves WATER_PULSE, THUNDERBOLT, ICE_BEAM, THUNDER_WAVE
	mon 8, JOLTEON
		moves THUNDERBOLT, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	mon 10, ELECTIVIRE
		moves REFLECT, THUNDERPUNCH, DIZZY_PUNCH, MACH_PUNCH
	mon 12, RAICHU
		moves DIG, SURF, THUNDERBOLT, CHARGE
	mon 12, ARAICHU
		moves SURF, EXTRASENSORY, CHARGE, THUNDERBOLT
	end_party
	
	next_list_item ; LT_SURGE (3)
	db "Lt.Surge@", TRAINERTYPE_ITEM_MOVES
	itemmon 8, LANTURN, NO_ITEM
		moves SURF, THUNDER, ICE_BEAM, RAIN_DANCE
	itemmon 8, JOLTEON, MAGNET
		moves THUNDER, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	itemmon 10, ELECTIVIRE, MAGNET
		moves ZAP_CANNON, THUNDERPUNCH, DIZZY_PUNCH, THUNDERBOLT
	itemmon 11, RAICHU, KINGS_ROCK
		moves THUNDER, BEAT_UP, VOLT_TACKLE, SURF
	itemmon 11, ARAICHU, KINGS_ROCK
		moves THUNDER, CHARGE, SURF, EXTRASENSORY
	itemmon 13, ZAPDOS, KINGS_ROCK
		moves DRILL_PECK, FLASHCANNON, VOLT_TACKLE, THUNDERBOLT
	end_party

	end_list_items

ScientistGroupHard:
	next_list_item ; SCIENTIST (1) Team Rocket Hideout - B3F
	db "Ross@", TRAINERTYPE_NORMAL
	mon 8, WEEZING
	mon 8, ARBOK
	end_party

	next_list_item ; SCIENTIST (2) Team Rocket Hideout - B3F
	db "Mitch@", TRAINERTYPE_NORMAL
	mon 15, DITTO
	end_party

	next_list_item ; SCIENTIST (3) Team Rocket Hideout - B1F
	db "Jed@", TRAINERTYPE_NORMAL
	mon 7, MAGNETON
	mon 7, ELECTRODE
	mon 7, ELECTRODE2
	end_party

	next_list_item ; SCIENTIST (4) Goldenrod City - Radio Tower
	db "Marc@", TRAINERTYPE_NORMAL
	mon 7, MAGNETON
	mon 7, PORYGON2
	mon 7, MINUN
	end_party

	next_list_item ; SCIENTIST (5) Goldenrod City - Radio Tower
	db "Rich@", TRAINERTYPE_MOVES
	mon 11, PORYGON2
		moves CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	end_party

	next_list_item ; SCIENTIST (6) New Mauville Basement Scientist 1
	db "Adam@", TRAINERTYPE_NORMAL
	mon 6, PORYGON2
	mon 7, AMUK
	end_party

	next_list_item ; SCIENTIST (7) New Mauville Basement Scientist 2
	db "James@", TRAINERTYPE_NORMAL
	mon 6, MUK
	mon 7, JOLTEON
	end_party

	next_list_item ; SCIENTIST (8) New Mauville Basement Scientist 3
	db "Jeffrey@", TRAINERTYPE_NORMAL
	mon 6, KIRLIA
	mon 7, HYPNO
	end_party

	next_list_item ; SCIENTIST (9) New Mauville Basement Scientist 4
	db "Bruce@", TRAINERTYPE_NORMAL
	mon 6, KADABRA
	mon 7, MAGNETON
	end_party

	end_list_items

ErikaGroupHard:
	next_list_item ; ERIKA (1)
	db "Erika@", TRAINERTYPE_MOVES
	mon 9, SKIPLOOM
		moves POISONPOWDER, VENOSHOCK, STUN_SPORE, MAGICAL_LEAF
	mon 9, TANGELA
		moves STUN_SPORE, REFLECT, MAGICAL_LEAF, SLEEP_POWDER
	mon 11, BELLOSSOM
		moves SUNNY_DAY, POISONPOWDER, VENOSHOCK, SOLARBEAM
	end_party

	next_list_item ; ERIKA (2)
	db "Erika@", TRAINERTYPE_MOVES
	mon 8, SUNFLORA
		moves FIRE_BLAST, REFLECT, GIGA_DRAIN, SUNNY_DAY
	mon 8, JUMPLUFF
		moves MAGICAL_LEAF, LEECH_SEED, STUN_SPORE, GIGA_DRAIN
	mon 9, VICTREEBEL
		moves SUNNY_DAY, NATURE_POWER, SLUDGE_BOMB, RAZOR_LEAF
	mon 9, LUDICOLO
		moves RAIN_DANCE, SOLARBEAM, GIGA_DRAIN, SURF
	mon 12, BELLOSSOM
		moves SUNNY_DAY, SYNTHESIS, GIGA_DRAIN, SOLARBEAM
	end_party

	next_list_item ; ERIKA (3)
	db "Erika@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, SUNFLORA, NO_ITEM
		moves STUN_SPORE, FIRE_BLAST, SOLARBEAM, SUNNY_DAY
	itemmon 10, JUMPLUFF, NO_ITEM
		moves SKY_ATTACK, LEECH_SEED, STUN_SPORE, SOLARBEAM
	itemmon 10, LUDICOLO, NO_ITEM
		moves RAIN_DANCE, NATURE_POWER, GIGA_DRAIN, SURF
	itemmon 10, TROPIUS, NO_ITEM
		moves SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SKY_ATTACK
	itemmon 12, BELLOSSOM, NO_ITEM
		moves SUNNY_DAY, SYNTHESIS, FAERIEGLEAM, SOLARBEAM
	itemmon 12, VICTREEBELX, LEFTOVERS
		moves SUNNY_DAY, SOLARBEAM, SLUDGE_BOMB, RAZOR_LEAF
	end_party

	end_list_items

SECTION "Hard Trainer Parties 1.5", ROMX

YoungsterGroupHard:
	next_list_item ; YOUNGSTER (1) Route 30 
	db "Joey@", TRAINERTYPE_NORMAL
	mon 2, RATTATA
	end_party

	next_list_item ; YOUNGSTER (2) Route 30
	db "Mikey@", TRAINERTYPE_NORMAL
	mon 2, PIDGEY
	mon 3, RATTATA
	end_party

	next_list_item ; YOUNGSTER (3) Route 32
	db "Albert@", TRAINERTYPE_NORMAL
	mon 5, RATTATA
	mon 5, ZUBAT
	end_party

	next_list_item ; YOUNGSTER (4) Route 32
	db "Gordon@", TRAINERTYPE_NORMAL
	mon 7, WOOPER
	mon 7, MUDKIP
	end_party

	next_list_item ; YOUNGSTER (5) Route 34
	db "Samuel@", TRAINERTYPE_NORMAL
	mon 5, RATTATA
	mon 5, SANDSHREW
	mon 5, TAILLOW
	mon 7, BRELOOM
	end_party

	next_list_item ; YOUNGSTER (6) Route 34
	db "Ian@", TRAINERTYPE_NORMAL
	mon 5, MANKEY
	mon 5, SWINUB
	mon 7, DUGTRIO
	end_party

	next_list_item ; YOUNGSTER (9) Route 03
	db "Warren@", TRAINERTYPE_NORMAL
	mon 3, SPEAROW
	mon 3, GULPIN
	end_party

	next_list_item ; YOUNGSTER (10) Route 03
	db "Jimmy@", TRAINERTYPE_NORMAL
	mon 3, RATTATA
	mon 4, EKANS
	end_party

	next_list_item ; YOUNGSTER (11) Route 11
	db "Owen@", TRAINERTYPE_NORMAL
	mon 5, GROWLITHE
	mon 5, PONYTA
	end_party

	next_list_item ; YOUNGSTER (12) Route 11
	db "Jason@", TRAINERTYPE_NORMAL
	mon 3, SANDSLASH
	mon 4, CROBAT
	end_party

	next_list_item ; YOUNGSTER (15) Ilex West (Contest placeholder team)
	db "Ronald@", TRAINERTYPE_NORMAL
	mon 10, GIRAFARIG
	mon 8, BALTOY
	mon 8, POLIWHIRL
	mon 5, FEEBAS
	mon 8, SKIPLOOM
	mon 12, ANINETALES
	end_party

	next_list_item ; YOUNGSTER (16) Johto Games (Contest placeholder team)
	db "Ronald@", TRAINERTYPE_NORMAL
	mon 10, GIRAFARIG
	mon 10, CLAYDOL
	mon 10, POLIWRATH
	mon 10, MILOTIC
	mon 10, JUMPLUFF
	mon 12, ANINETALES
	end_party

	next_list_item ; YOUNGSTER (17) Unreferenced (Contest placeholder team)
	db "Ronald@", TRAINERTYPE_NORMAL
	mon 10, GIRAFARIG
	mon 10, CLAYDOL
	mon 10, POLIWRATH
	mon 10, MILOTIC
	mon 10, JUMPLUFF
	mon 12, ANINETALES
	end_party

	next_list_item ; YOUNGSTER (18) Rustboro Gym
	db "Josh@", TRAINERTYPE_NORMAL
	mon 6, GEODUDE
	mon 6, AGEODUDE
	end_party

	next_list_item ; YOUNGSTER (19) Rustboro Gym
	db "Tommy@", TRAINERTYPE_NORMAL
	mon 6, SANDSHREW
	mon 6, ASANDSHREW
	end_party

	next_list_item ; YOUNGSTER (20) Route 102
	db "Calvin@", TRAINERTYPE_NORMAL
	mon 0, POOCHYENA
	mon 1, TAILLOW
	end_party

	next_list_item ; YOUNGSTER (21) Route 102
	db "Allen@", TRAINERTYPE_NORMAL
	mon 0, ZIGZAGOON
	mon 1, TAILLOW
	end_party

	next_list_item ; YOUNGSTER (21) Route 104
	db "Billy@", TRAINERTYPE_NORMAL
	mon 4, ZIGZAGOON
	mon 4, SEEDOT
	end_party

	next_list_item ; YOUNGSTER (23) Route 116
	db "Joey@", TRAINERTYPE_NORMAL
	mon 5, MACHOKE
	end_party

	next_list_item ; YOUNGSTER (24) Route 116
	db "Johnson@", TRAINERTYPE_NORMAL
	mon 5, BRELOOM
	mon 5, LOTAD
	end_party

	next_list_item ; YOUNGSTER (25) Route 110
	db "Timmy@", TRAINERTYPE_NORMAL
	mon 7, LAIRON
	mon 7, ELECTRIKE
	end_party

	next_list_item ; YOUNGSTER (26) Mount Moon
	db "Josh@", TRAINERTYPE_NORMAL
	mon 5, ARON
	mon 6, ELECTRIKE
	mon 7, RATTATA
	end_party

	next_list_item ; YOUNGSTER (27) Route 113
	db "Lao@", TRAINERTYPE_NORMAL
	mon 5, WEEZING
	mon 6, GRIMER
	mon 7, DUSTOX
	end_party

	next_list_item ; YOUNGSTER (28) Route 113
	db "Dillon@", TRAINERTYPE_NORMAL
	mon 5, AMUK
	mon 6, GULPIN
	mon 7, PARASECT
	end_party

	end_list_items

SECTION "Hard Trainer Parties 2", ROMX

SchoolboyGroupHard:
	next_list_item ; SCHOOLBOY (1) National Park 
	db "Jack@", TRAINERTYPE_NORMAL
	mon 5, ODDISH
	mon 5, SWABLU
	mon 7, ELECTRODE
	end_party

	next_list_item ; SCHOOLBOY (2) Route 15
	db "Kipp@", TRAINERTYPE_NORMAL 
	mon 3, VOLTORB
	mon 3, MAGNEMITE
	mon 4, VOLTORB
	mon 5, MAGNETON
	end_party

	next_list_item ; SCHOOLBOY (3) Route 36
	db "Alan@", TRAINERTYPE_NORMAL
	mon 9, TANGELA
	end_party

	next_list_item ; SCHOOLBOY (4) Route 15
	db "Johnny@", TRAINERTYPE_NORMAL
	mon 2, BELLSPROUT
	mon 4, WEEPINBELL
	mon 7, VICTREEBEL
	end_party

	next_list_item ; SCHOOLBOY (5) Viridian Forest
	db "Danny@", TRAINERTYPE_NORMAL	
	mon 1, RATTATA
	end_party

	next_list_item ; SCHOOLBOY (6) Route 15
	db "Tommy@", TRAINERTYPE_NORMAL
	mon 7, XATU
	mon 8, ALAKAZAM
	end_party

	next_list_item ; SCHOOLBOY (7) Route 24
	db "Dudley@", TRAINERTYPE_NORMAL
	mon 5, ODDISH
	mon 5, VULPIX
	end_party

	next_list_item ; SCHOOLBOY (8) Route 25
	db "Joe@", TRAINERTYPE_NORMAL
	mon 3, TANGELA
	mon 5, EEVEE
	end_party

	next_list_item ; SCHOOLBOY (9) Route 15
	db "Billy@", TRAINERTYPE_NORMAL
	mon 4, PARAS
	mon 4, PARAS
	mon 5, POLIWHIRL
	mon 7, DITTO
	end_party

	next_list_item ; SCHOOLBOY (10) Route 38
	db "Chad@", TRAINERTYPE_NORMAL
	mon 9, MR__MIME
	end_party

	next_list_item ; SCHOOLBOY (11) Fast Ship B1F
	db "Nate@", TRAINERTYPE_NORMAL
	mon 7, LEDIAN
	mon 7, EXEGGUTOR
	end_party

	next_list_item ; SCHOOLBOY (12) Fast Ship B1F
	db "Ricky@", TRAINERTYPE_NORMAL
	mon 7, AIPOM
	mon 7, DITTO
	end_party	

	next_list_item ; SCHOOLBOY (13) Mauville City Gym
	db "Ben@", TRAINERTYPE_NORMAL
	mon 9, RAICHU
	mon 9, LINOONE
	end_party

	next_list_item ; SCHOOLBOY (14) Route 118
	db "Dale@", TRAINERTYPE_NORMAL
	mon 5, MINUN
	mon 7, RAITORA
	end_party

	end_list_items

BirdKeeperGroupHard:
	next_list_item ; BIRD_KEEPER (1) Violet City Gym
	db "Rod@", TRAINERTYPE_RANDOM, 4, BIRDS_EASY
	end_party

	next_list_item ; BIRD_KEEPER (2) Violet City Gym
	db "Abe@", TRAINERTYPE_RANDOM, 4, BIRDS_EASY
	end_party

	next_list_item ; BIRD_KEEPER (3) Route 35
	db "Bryan@", TRAINERTYPE_NORMAL
	mon 4, PIDGEY
	mon 7, PIDGEOTTO
	mon 4, TAILLOW
	mon 7, SWELLOW
	end_party

	next_list_item ; BIRD_KEEPER (4) Glitter Lighthouse - 3F
	db "Theo@", TRAINERTYPE_NORMAL
	mon 4, PIDGEY
	mon 7, PIDGEOTTO
	mon 4, TAILLOW
	mon 7, SWELLOW
	end_party

	next_list_item ; BIRD_KEEPER (5) Route 38
	db "Toby@", TRAINERTYPE_NORMAL
	mon 5, DODUO
	mon 6, DODUO
	mon 7, DODRIO
	end_party

	next_list_item ; BIRD_KEEPER (6) Glitter Lighthouse - 5F
	db "Denis@", TRAINERTYPE_NORMAL
	mon 3, SPEAROW
	mon 7, FEAROW
	mon 3, SPEAROW
	end_party

	next_list_item ; BIRD_KEEPER (7) Route 44
	db "Vance@", TRAINERTYPE_NORMAL
	mon 4, PIDGEOTTO
	mon 5, PIDGEOTTO
	mon 7, FARFETCH_D
	end_party

	next_list_item ; BIRD_KEEPER (8) Route 04
	db "Hank@", TRAINERTYPE_RANDOM, 3, BIRDS_EASY
	end_party

	next_list_item ; BIRD_KEEPER (9) Route 14
	db "Roy@", TRAINERTYPE_NORMAL
	mon 4, FEAROW
	mon 5, FEAROW
	mon 7, FARFETCH_D
	end_party

	next_list_item ; BIRD_KEEPER (10) Route 18
	db "Boris@", TRAINERTYPE_NORMAL
	mon 2, DODUO
	mon 3, DODUO
	mon 5, DODRIO
	mon 7, FARFETCH_D
	end_party

	next_list_item ; BIRD_KEEPER (11) Route 18
	db "Bob@", TRAINERTYPE_NORMAL
	mon 7, NOCTOWL
	mon 7, FARFETCH_D
	end_party

	next_list_item ; BIRD_KEEPER (12) Route 27
	db "Jose@", TRAINERTYPE_NORMAL
	mon 9, SIRFETCH_D
	mon 9, CROBAT
	mon 9, FEAROW
	mon 11, AERODACTYL
	end_party

	next_list_item ; BIRD_KEEPER (13) Route 32
	db "Peter@", TRAINERTYPE_RANDOM, 3, BIRDS_EASY
	end_party

	next_list_item ; BIRD_KEEPER (15) Route 13
	db "Perry@", TRAINERTYPE_NORMAL
	mon 9, FARFETCH_D
	end_party

	next_list_item ; BIRD_KEEPER (16) Route 13
	db "Bret@", TRAINERTYPE_NORMAL
	mon 6, PIDGEOTTO
	mon 8, FEAROW
	end_party

	next_list_item ; BIRD_KEEPER (20) Route 105
	db "Josue@", TRAINERTYPE_NORMAL
	mon 7, FEAROW
	mon 7, TOGETIC
	mon 9, JUMPLUFF
	mon 11, SWELLOW
	end_party

	next_list_item ; BIRD_KEEPER (21) Fortree Gym
	db "Humbert@", TRAINERTYPE_NORMAL
	mon 9, SKARMORY
	mon 9, DODRIO
	end_party

	next_list_item ; BIRD_KEEPER (22) Fortree Gym
	db "Jared@", TRAINERTYPE_NORMAL
	mon 9, FEAROW
	mon 9, JUMPLUFF
	end_party

	next_list_item ; BIRD_KEEPER (23) Fortree Gym
	db "Edwardo@", TRAINERTYPE_NORMAL
	mon 9, PIDGEOT
	mon 9, NOCTOWL
	end_party

	next_list_item ; BIRD_KEEPER (24) Fortree Gym
	db "Darius@", TRAINERTYPE_NORMAL
	mon 9, FARFETCH_D
	mon 9, BEAUTIFLY
	end_party

	next_list_item ; BIRD_KEEPER (25) Route 118
	db "Chester@", TRAINERTYPE_NORMAL
	mon 5, FEAROW
	mon 7, DUSTOX
	end_party

	next_list_item ; BIRD_KEEPER (26) Route 118
	db "Perry@", TRAINERTYPE_NORMAL
	mon 5, GOLBAT
	mon 7, GLIGAR
	end_party

	next_list_item ; BIRD_KEEPER (27) Route 113
	db "Coby@", TRAINERTYPE_NORMAL
	mon 7, SKARMORY
	mon 7, SWELLOW
	end_party

	next_list_item ; BIRD_KEEPER (28) Route 119
	db "Phil@", TRAINERTYPE_NORMAL
	mon 6, FEAROW
	mon 7, SWELLOW
	end_party

	next_list_item ; BIRD_KEEPER (29) Route 119
	db "Hugh@", TRAINERTYPE_NORMAL
	mon 6, PELIPPER
	mon 7, TROPIUS
	end_party

	next_list_item ; BIRD_KEEPER (30) Route 120
	db "Robert@", TRAINERTYPE_NORMAL
	mon 6, ALTARIA
	mon 7, DODRIO
	end_party

	next_list_item ; BIRD_KEEPER (31) Route 120
	db "Colin@", TRAINERTYPE_NORMAL
	mon 6, PELIPPER
	mon 7, XATU
	end_party

	end_list_items

LassGroupHard:
	next_list_item ; LASS (1) Goldenrod City Gym
	db "Carrie@", TRAINERTYPE_NORMAL
	mon 7, SNUBBULL
	mon 7, PONYTA
	mon 7, LINOONE
	end_party

	next_list_item ; LASS (2) Goldenrod City Gym
	db "Bridget@", TRAINERTYPE_NORMAL 
	mon 7, JIGGLYPUFF
	mon 7, TEDDIURSA
	mon 7, LINOONE
	end_party

	next_list_item ; LASS (3) Fuschia City Gym
	db "Alice@", TRAINERTYPE_NORMAL
	mon 7, GLOOM
	mon 7, ARBOK
	mon 7, SWALOT
	end_party

	next_list_item ; LASS (4) National Park
	db "Krise@", TRAINERTYPE_NORMAL
	mon 7, ODDISH
	mon 7, CUBONE
	end_party

	next_list_item ; LASS (5) Glitter Lighthouse - 4F
	db "Connie@", TRAINERTYPE_NORMAL
	mon 7, AZUMARILL
	mon 7, TOGETIC
	mon 7, PLUSLE
	end_party

	next_list_item ; LASS (6) Fuschia City Gym
	db "Linda@", TRAINERTYPE_NORMAL
	mon 7, TANGELA
	mon 7, HYPNO
	mon 7, VENUSAUR
	end_party

	next_list_item ; LASS (7) Route 25
	db "Laura@", TRAINERTYPE_NORMAL
	mon 5, GLOOM
	mon 5, PIDGEOTTO
	mon 7, BELLOSSOM
	end_party

	next_list_item ; LASS (8) Route 25
	db "Shannon@", TRAINERTYPE_NORMAL
	mon 5, PARAS
	mon 5, PARAS
	mon 7, PARASECT
	end_party

	next_list_item ; LASS (9) Celadon City Gym
	db "Michelle@", TRAINERTYPE_NORMAL
	mon 5, PARAS
	mon 5, HOPPIP
	mon 7, SKIPLOOM
	end_party

	next_list_item ; LASS (10) Route 38
	db "Dana@", TRAINERTYPE_NORMAL
	mon 7, FLAAFFY
	mon 7, GOLDUCK
	end_party

	next_list_item ; LASS (11) Route 24
	db "Ellen@", TRAINERTYPE_NORMAL
	mon 5, JIGGLYPUFF
	mon 5, SNUBBULL
	end_party

	next_list_item ; LASS (18) Mauville City Gym
	db "Vivian@", TRAINERTYPE_NORMAL	
	mon 9, LANTURN
	mon 9, HITMONCHAN
	end_party

	next_list_item ; LASS (19) Route 102
	db "Tiana@", TRAINERTYPE_NORMAL	
	mon 1, ZIGZAGOON
	mon 2, SHROOMISH
	end_party

	next_list_item ; LASS (20) Route 104
	db "Haley@", TRAINERTYPE_NORMAL	
	mon 3, HOPPIP
	mon 4, LOTAD
	end_party

	next_list_item ; LASS (21) Route 116
	db "Karen@", TRAINERTYPE_NORMAL	
	mon 5, SHROOMISH
	mon 6, PIDGEOTTO
	end_party

	next_list_item ; LASS (22) Route 116
	db "Janice@", TRAINERTYPE_NORMAL	
	mon 5, MARILL
	mon 4, FEAROW
	end_party

	next_list_item ; LASS (23) Mount Moon
	db "Iris@", TRAINERTYPE_NORMAL	
	mon 5, CLEFAIRY
	mon 7, JIGGLYPUFF
	end_party

	next_list_item ; LASS (24) Mount Moon
	db "Miriam@", TRAINERTYPE_NORMAL	
	mon 5, GLOOM
	mon 7, ROSELIA
	end_party

	next_list_item ; LASS (25) Route 118
	db "Sally@", TRAINERTYPE_NORMAL	
	mon 5, GLOOM
	mon 6, VOLBEAT
	end_party

	next_list_item ; LASS (26) Route 118
	db "Annie@", TRAINERTYPE_NORMAL	
	mon 5, MUNCHLAX
	mon 7, ROSELIA
	end_party

	next_list_item ; LASS (27) Sootopolis Gym
	db "Andrea@", TRAINERTYPE_NORMAL	
	mon 8, LUVDISC
	mon 8, WAILORD
	end_party

	next_list_item ; LASS (28) Sootopolis Gym
	db "Crissy@", TRAINERTYPE_NORMAL	
	mon 8, SEAKING
	mon 8, BLASTOISE
	end_party

	end_list_items

JanineGroupHard:
	next_list_item ; JANINE (1)
	db "Janine@", TRAINERTYPE_MOVES
	mon 9, KOFFING
		moves ACID, EMBER, TOXIC, WILLOWISP
	mon 9, GRIMER
		moves ACID, TACKLE, HARDEN, TOXIC
	mon 11, ARIADOS
		moves TWINEEDLE, MEGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	end_party
	
	next_list_item ; JANINE (1)
	db "Janine@", TRAINERTYPE_MOVES
	mon 10, WEEZING
		moves SLUDGE, FIRE_SPIN, TOXIC, WILLOWISP
	mon 10, MUK
		moves ACID, RECOVER, HARDEN, TOXIC
	mon 10, SWALOT
		moves SLUDGE, MUD_SHOT, HARDEN, TOXIC
	mon 10, ARIADOS
		moves TWINEEDLE, MEGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	mon 15, NIDOQUEEN
		moves EARTHQUAKE, MEGAHORN, BULK_UP, SLUDGE_BOMB
	end_party
	
	next_list_item ; JANINE (3)
	db "Janine@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, WEEZING, LEFTOVERS
		moves SLUDGE_BOMB, FIRE_BLAST, AMNESIA, WILLOWISP
	itemmon 10, AMUK, LEFTOVERS
		moves SLUDGE_BOMB, RECOVER, ACID_ARMOR, TOXIC
	itemmon 10, SWALOT, LEFTOVERS
		moves SLUDGE_BOMB, MUD_SHOT, COSMIC_POWER, TOXIC
	itemmon 11, ARIADOS, SILVERPOWDER
		moves MEGAHORN, MEGA_DRAIN, PSYCHIC_M, NIGHT_SHADE
	itemmon 11, NIDOQUEEN, POISON_BARB
		moves EARTHQUAKE, MEGAHORN, BULK_UP, SLUDGE_BOMB
	itemmon 13, VENUSAURX, MINT_BERRY
		moves EARTHQUAKE, GIGA_DRAIN, REST, SLUDGE_BOMB
	end_party

	end_list_items

CooltrainerMGroupHard:
	next_list_item ; COOLTRAINERM (1) Union Cave - B2F
	db "Nick@", TRAINERTYPE_NORMAL
	mon 9, CHARIZARD
	mon 9, BLASTOISE
	mon 9, VENUSAUR
	mon 5, ARAICHU
	mon 5, SKARMORY2
	mon 4, OCTILLERY
	end_party

	next_list_item ; COOLTRAINERM (2) Lake of Rage
	db "Aaron@", TRAINERTYPE_NORMAL
	mon 6, IVYSAUR
	mon 6, CHARMELEON
	mon 6, WARTORTLE
	end_party

	next_list_item ; COOLTRAINERM (3) Blackthorn City Gym
	db "Paul@", TRAINERTYPE_NORMAL
	mon 9, DRAGONAIR
	mon 9, SEADRA
	mon 9, YANMA
	end_party

	next_list_item ; COOLTRAINERM (4) Blackthorn City Gym
	db "Cody@", TRAINERTYPE_NORMAL
	mon 7, HORSEA
	mon 9, SEADRA
	mon 7, YANMA
	mon 9, FURRET
	end_party

	next_list_item ; COOLTRAINERM (5) Blackthorn City Gym
	db "Mike@", TRAINERTYPE_NORMAL
	mon 9, CHARIZARD
	mon 9, VIBRAVA
	mon 9, DRAGONAIR
	end_party

	next_list_item ; COOLTRAINERM (6) Route 26
	db "Gaven@", TRAINERTYPE_NORMAL
	mon 9, VICTREEBEL
	mon 9, KINGLER
	mon 9, FLAREON
	mon 9, SEVIPER
	end_party

	next_list_item ; COOLTRAINERM (7) Route 45
	db "Ryan@", TRAINERTYPE_NORMAL
	mon 7, PIDGEOT
	mon 7, ELECTABUZZ
	mon 8, ALTARIA
	mon 8, JYNX
	end_party

	next_list_item ; COOLTRAINERM (8) Route 26
	db "Jake@", TRAINERTYPE_NORMAL
	mon 9, PARASECT
	mon 9, GOLDUCK
	mon 5, TRAPINCH
	mon 10, CAMERUPT
	end_party

	next_list_item ; COOLTRAINERM (9) Route 27
	db "Blake@", TRAINERTYPE_NORMAL
	mon 10, MAGNEZONE
	mon 10, QUAGSIRE
	mon 10, EXEGGUTOR2
	end_party

	next_list_item ; COOLTRAINERM (10) Route 27
	db "Brian@", TRAINERTYPE_NORMAL
	mon 10, ASANDSLASH
	mon 10, SWALOT
	mon 10, GRUMPIG
	end_party	

	next_list_item ; COOLTRAINERM (11) Fast Ship
	db "Sean@", TRAINERTYPE_NORMAL
	mon 10, FLAREON
	mon 10, TANGELA
	mon 10, TAUROS
	end_party

	next_list_item ; COOLTRAINERM (12) Route 25
	db "Kevin@", TRAINERTYPE_NORMAL
	mon 8, RHYHORN
	mon 5, CHARMELEON
	mon 5, WARTORTLE
	end_party

	next_list_item ; COOLTRAINERM (13) Route 44
	db "Allen@", TRAINERTYPE_MOVES
	mon 7, CHARMELEON
		moves EMBER, SMOKESCREEN, RAGE, SCARY_FACE
	end_party

	next_list_item ; COOLTRAINERM (14) Dragon's Den
	db "Darin@", TRAINERTYPE_MOVES
	mon 15, DRAGONAIR
		moves WRAP, SURF, DRAGON_RAGE, SLAM
	end_party

	next_list_item ; COOLTRAINERM (15) Petalburg Gym
	db "Randal@", TRAINERTYPE_NORMAL
	mon 11, DELCATTY
	mon 11, PERSIAN
	end_party

	next_list_item ; COOLTRAINERM (16) Petalburg Gym
	db "Parker@", TRAINERTYPE_NORMAL
	mon 11, WIGGLYTUFF
	mon 11, TAUROS
	end_party

	next_list_item ; COOLTRAINERM (17) Petalburg Gym
	db "George@", TRAINERTYPE_NORMAL
	mon 11, RATICATE
	mon 11, KANGASKHAN
	end_party

	next_list_item ; COOLTRAINERM (18) Lavaridge Gym
	db "Gerald@", TRAINERTYPE_NORMAL
	mon 11, AMAROWAK
	end_party

	next_list_item ; COOLTRAINERM (19) Daloric contest team #1
	db "Daloric@", TRAINERTYPE_NORMAL
	mon 11, CHARIZARD
	mon 11, AGGRON
	mon 11, TYRANITAR
	mon 11, KINGLER
	mon 11, GENGAR
	mon 11, AMPHAROS
	end_party

	next_list_item ; COOLTRAINERM (20) Daloric contest team #2
	db "Daloric@", TRAINERTYPE_NORMAL
	mon 11, CHARIZARDX
	mon 11, AGGRONX
	mon 11, TYRANITARX
	mon 11, KINGLERX
	mon 11, GENGARX
	mon 11, AMPHAROSX
	end_party

	next_list_item ; COOLTRAINERM (21) DominantDragon26 contest team #1
	db "Crystal@", TRAINERTYPE_NORMAL
	mon 11, NOCTOWL
	mon 11, SHARPEDO
	mon 11, RAITORA
	mon 11, DYNABEA
	mon 11, LUNATONE
	mon 11, SANDSLASH
	end_party

	next_list_item ; COOLTRAINERM (22) DominantDragon26 contest team #2
	db "Crystal@", TRAINERTYPE_NORMAL
	mon 11, NOCTOWL2
	mon 11, SHARPEDO
	mon 11, RAITORA
	mon 11, DYNABEA
	mon 11, LUNATONE
	mon 11, SANDSLASH
	end_party

	next_list_item ; COOLTRAINERM (23) Route 120
	db "Leonel@", TRAINERTYPE_NORMAL
	mon 9, MANECTRIC
	mon 9, MANTINE
	mon 9, PARASECT
	mon 9, AKUERIA
	end_party

	next_list_item; COOLTRAINERM (24) Ashen Gauntlet
	db "@", TRAINERTYPE_RANDOM, 6, TRIAL_EASY
	end_party

	next_list_item ; COOLTRAINERM (25) World Cup
	db "Wesley@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, FLAREON, BLACKBELT_I
		moves ROLLING_KICK, FIRE_FANG, DIG, BULK_UP
	itemmon 9, TAUROS, BLACKBELT_I
		moves SUBMISSION, DOUBLE_EDGE, EARTHQUAKE, OUTRAGE
	itemmon 9, DODRIO, BLACKBELT_I
		moves HI_JUMP_KICK, DRILL_PECK, SKY_ATTACK, WHIRLWIND
	itemmon 9, POLIWRATH, BLACKBELT_I
		moves SUBMISSION, HYDRO_PUMP, MACH_PUNCH, AQUA_JET
	itemmon 9, MEDICHAM, FOCUS_BAND
		moves FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, BULLET_PUNCH
	itemmon 11, GALLADE, QUICK_CLAW
		moves PSYCHO_CUT, LEAF_BLADE, DRAGON_DANCE, RAZORSHELL
	end_party

	next_list_item ; COOLTRAINERM (26) World Cup
	db "Arthur@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, KLEAVOR, HARD_STONE
		moves STONE_EDGE, ROCK_TOMB, DOUBLE_TEAM, GUILLOTINE
	itemmon 9, DONPHAN, HARD_STONE
		moves ROCK_SLIDE, DOUBLE_EDGE, EARTHQUAKE, OUTRAGE
	itemmon 9, SUDOWOODO, HARD_STONE
		moves SPIKES, ROCK_SLIDE, MIRROR_MOVE, PURSUIT
	itemmon 9, CRADILY, HARD_STONE
		moves ANCIENTPOWER, MAGICAL_LEAF, AMNESIA, GIGA_DRAIN
	itemmon 9, SOLROCK, HARD_STONE
		moves FLAMETHROWER, FUTURE_SIGHT, POWER_GEM, RECOVER
	itemmon 11, HARCANINE, HARD_STONE
		moves SACRED_FIRE, STONE_EDGE, AGILITY, PURSUIT
	end_party

	next_list_item ; COOLTRAINERM (27) World Cup
	db "Santos@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, SABLEYE, SPELL_TAG
		moves COSMIC_POWER, NIGHT_SHADE, BATON_PASS, PURSUIT
	itemmon 9, XATU, SPELL_TAG
		moves SHADOW_BALL, DRILL_PECK, FLY, PSYBEAM
	itemmon 9, ESPEON, SPELL_TAG
		moves SHADOW_BALL, PSYCHIC_M, SWIFT, MIST_BALL
	itemmon 9, NINETALES, QUICK_CLAW
		moves FIRE_BLAST, NIGHT_SHADE, DESTINY_BOND, FAE_VOICE
	itemmon 9, GENGAR, SPELL_TAG
		moves SHADOW_BALL, HYPNOSIS, DREAM_EATER, SLUDGE_WAVE
	itemmon 11, DUSKNOIR, SPELL_TAG
		moves DRAGON_DANCE, WILLOWISP, SHADOW_FORCE, PURSUIT
	end_party

	next_list_item ; COOLTRAINERM (28) Evergrande Dungeon Generic #1
	db "@", TRAINERTYPE_NORMAL
	mon 7, CHARIZARD
	mon 7, BLASTOISE
	mon 7, VENUSAUR
	mon 8, ELECTRODE
	end_party

	next_list_item ; COOLTRAINERM (29) Evergrande Dungeon Generic #2
	db "@", TRAINERTYPE_NORMAL
	mon 7, MEGANIUM
	mon 7, FERALIGATR
	mon 7, TYPHLOSION
	mon 8, HYPNO
	end_party

	next_list_item ; COOLTRAINERM (30) Evergrande Dungeon Generic #3
	db "@", TRAINERTYPE_NORMAL
	mon 7, SCEPTILE
	mon 7, BLAZIKEN
	mon 7, SWAMPERT
	mon 8, WIGGLYTUFF
	end_party

	next_list_item ; COOLTRAINERM (31) Evergrande Dungeon Generic #4
	db "@", TRAINERTYPE_NORMAL
	mon 7, RAPIDASH
	mon 7, GOLDUCK
	mon 7, LUDICOLO
	mon 8, SCYTHER
	end_party

	next_list_item ; COOLTRAINERM (32) Evergrande Dungeon Generic #5
	db "@", TRAINERTYPE_NORMAL
	mon 7, TAUROS
	mon 7, STEELIX
	mon 7, NOCTOWL
	mon 8, AGGRON
	end_party

	next_list_item ; COOLTRAINERM (33) Evergrande Dungeon Generic #6
	db "@", TRAINERTYPE_NORMAL
	mon 7, MAGMAR
	mon 7, JYNX
	mon 7, ELECTABUZZ
	mon 8, URSARING
	end_party

	next_list_item ; COOLTRAINERM (34) Evergrande Dungeon Generic #7
	db "@", TRAINERTYPE_NORMAL
	mon 7, AMUK
	mon 7, MUK
	mon 7, HARIYAMA
	mon 8, MAGNETON
	end_party

	next_list_item ; COOLTRAINERM (35) Evergrande Dungeon Generic #8
	db "@", TRAINERTYPE_NORMAL
	mon 7, PIDGEOT
	mon 7, GIRAFARIG
	mon 7, CORSOLA
	mon 8, MAGCARGO
	end_party

	next_list_item ; COOLTRAINERM (36) Evergrande Dungeon Generic #9
	db "@", TRAINERTYPE_NORMAL
	mon 7, AMPHAROS
	mon 7, CLEFABLE
	mon 7, HOUNDOOM
	mon 8, WAILORD
	end_party

	end_list_items

CooltrainerFGroupHard:
	next_list_item ; COOLTRAINERF (1) Union Cave - B2F
	db "Gwen@", TRAINERTYPE_NORMAL
	mon 7, EEVEE
	mon 10, SYLVEON
	mon 10, LEAFEON
	mon 10, GLACEON
	end_party

	next_list_item ; COOLTRAINERF (2) Lake of Rage
	db "Lois@", TRAINERTYPE_NORMAL
	mon 5, SKIPLOOM
	mon 7, NINETALES
	end_party

	next_list_item ; COOLTRAINERF (3) Blackthorn City Gym
	db "Fran@", TRAINERTYPE_NORMAL
	mon 7, SEADRA
	mon 7, WAILORD
	mon 7, YANMA
	mon 7, SNEASEL
	end_party

	next_list_item ; COOLTRAINERF (4) Blackthorn City Gym
	db "Lola@", TRAINERTYPE_NORMAL
	mon 4, DRATINI
	mon 6, DRAGONAIR
	end_party

	next_list_item ; COOLTRAINERF (5) Route 34
	db "Kate@", TRAINERTYPE_NORMAL
	mon 7, LUDICOLO
	mon 8, CLOYSTER
	end_party

	next_list_item ; COOLTRAINERF (6) Route 34
	db "Irene@", TRAINERTYPE_NORMAL
	mon 7, MASQUERAIN
	mon 8, SEAKING
	end_party

	next_list_item ; COOLTRAINERF (7) Route 45
	db "Kelly@", TRAINERTYPE_NORMAL
	mon 7, MARILL
	mon 4, WARTORTLE
	mon 4, WARTORTLE
	end_party

	next_list_item ; COOLTRAINERF (8) Route 26
	db "Joyce@", TRAINERTYPE_NORMAL
	mon 8, PIKACHU
	mon 9, BLASTOISE
	mon 8, RAICHU
	mon 10, SUNFLORA
	mon 11, URSARING
	mon 9, SKARMORY
	end_party

	next_list_item ; COOLTRAINERF (9) Route 26
	db "Beth@", TRAINERTYPE_NORMAL
	mon 9, RAPIDASH
	mon 9, RAPIDASH2
	mon 9, NINETALES
	mon 9, ANINETALES
	mon 9, NOCTOWL
	mon 9, EXEGGCUTE2
	end_party

	next_list_item ; COOLTRAINERF (10) Route 27
	db "Reena@", TRAINERTYPE_NORMAL
	mon 8, STARMIE
	mon 8, NIDOQUEEN
	mon 7, GLISCOR
	mon 8, LUNATONE
	mon 10, FROSLASS
	end_party

	next_list_item ; COOLTRAINERF (11) Route 27
	db "Megan@", TRAINERTYPE_NORMAL
	mon 7, FERALIGATR2
	mon 7, TYPHLOSION2
	mon 7, VENUSAUR
	mon 7, CACTURNE
	mon 11, TORKOAL
	end_party

	next_list_item ; COOLTRAINERF (13) Fast Ship
	db "Carol@", TRAINERTYPE_NORMAL
	mon 5, ELECTRODE
	mon 5, STARMIE
	mon 5, NINETALES
	end_party

	next_list_item ; COOLTRAINERF (14) Viridian Forest
	db "Quinn@", TRAINERTYPE_NORMAL
	mon 1, BULBASAUR
	end_party

	next_list_item ; COOLTRAINERF (15) Union Cave - B2F
	db "Emma@", TRAINERTYPE_NORMAL
	mon 9, POLITOED
	mon 9, SUDOWOODO
	mon 9, LEDIAN
	mon 9, GIRAFARIG
	end_party

	next_list_item ; COOLTRAINERF (16) Route 44
	db "Cybil@", TRAINERTYPE_NORMAL
	mon 7, BUTTERFREE
	mon 7, BELLOSSOM
	mon 7, SLOWKING
	mon 7, UMBREON
	end_party

	next_list_item ; COOLTRAINERF (17) Route 34
	db "Jenn@", TRAINERTYPE_NORMAL
	mon 8, GLACEON
	mon 8, STARMIE
	end_party

	next_list_item ; COOLTRAINERF (21) Dragon's Den
	db "Cara@", TRAINERTYPE_NORMAL
	mon 8, SHARPEDO
	mon 8, CAMERUPT
	mon 9, ALTARIA
	end_party

	next_list_item ; COOLTRAINERF (21) Ilex West (LelouchIsKing contest party #1)
	db "Marina@", TRAINERTYPE_NORMAL
	mon 9, GROWLITHE
	mon 9, SNORUNT
	mon 9, BRELOOM
	mon 9, QUAGSIRE
	mon 9, TOGETIC
	mon 10, ELECTRODE2
	end_party

	next_list_item ; COOLTRAINERF (21) Johto Games (LelouchIsKing contest party #2)
	db "Marina@", TRAINERTYPE_NORMAL
	mon 10, ARCANINE
	mon 10, FROSLASS
	mon 10, BRELOOM
	mon 10, QUAGSIRE
	mon 10, TOGEKISS
	mon 12, ELECTRODE2
	end_party

	next_list_item ; COOLTRAINERF (21) Unreferenced (LelouchIsKing contest party #3)
	db "Marina@", TRAINERTYPE_NORMAL
	mon 12, ARCANINE
	mon 12, FROSLASS
	mon 12, BRELOOM
	mon 12, QUAGSIRE
	mon 12, TOGEKISS
	mon 15, ELECTRODE2
	end_party

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "Mary@", TRAINERTYPE_NORMAL
	mon 11, FURRET
	mon 11, ZANGOOSE
	end_party

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "Mary@", TRAINERTYPE_NORMAL
	mon 11, DODRIO
	mon 11, FEAROW
	end_party

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "Mary@", TRAINERTYPE_NORMAL
	mon 11, SWELLOW
	mon 11, NOCTOWL
	end_party

	next_list_item ; COOLTRAINERF (23) Route 120
	db "Jenni@", TRAINERTYPE_NORMAL
	mon 9, SABLEYE
	mon 9, CORSOLA
	mon 9, RAITORA
	mon 10, MAWILE
	end_party

	next_list_item ; COOLTRAINERF (24) World Cup
	db "Monica@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, BUTTERFREE, SHARP_BEAK
		moves FAE_VOICE, STUN_SPORE, HURRICANE, PSYCHIC_M
	itemmon 9, FEAROW, SHARP_BEAK
		moves DRILL_PECK, FLY, DOUBLE_EDGE, MIRROR_MOVE
	itemmon 9, NOCTOWL, SHARP_BEAK
		moves DRILL_PECK, PSYCHIC_M, HYPNOSIS, DREAM_EATER
	itemmon 9, ABSOL, SHARP_BEAK
		moves SKY_ATTACK, CRUNCH, FUTURE_SIGHT, SLASH
	itemmon 9, YANMEGA, SHARP_BEAK
		moves FLAMETHROWER, SKY_ATTACK, CRUNCH, OUTRAGE
	itemmon 11, SEAKING, SHARP_BEAK
		moves DRILL_PECK, FLY, DRAGON_DANCE, RAZORSHELL
	end_party

	next_list_item ; COOLTRAINERF (25) World Cup
	db "Tuscany@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, WIGGLYTUFF, LEFTOVERS
		moves WILLOWISP, GLARE, DRAININGKISS, CALM_MIND
	itemmon 9, LINOONE, PINK_BOW
		moves HYPER_VOICE, HYPER_BEAM, SUPERSONIC, ROAR
	itemmon 9, PERSIAN, PINK_BOW
		moves SLASH, PURSUIT, CRUNCH, PSYCHO_CUT
	itemmon 9, RAPIDASH, PINK_BOW
		moves MEGA_KICK, FLAME_WHEEL, FIRE_SPIN, DOUBLE_KICK
	itemmon 9, DELCATTY, PINK_BOW
		moves PLAY_ROUGH, CHARM, GROWL, SLASH
	itemmon 11, URSALUNA, PINK_BOW
		moves DOUBLE_EDGE, FISSURE, REST, BULK_UP
	end_party

	next_list_item ; COOLTRAINERF (26) World Cup
	db "Frieda@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, TENTACRUEL, POISON_BARB
		moves SURF, GIGA_DRAIN, ICY_WIND, SLUDGE_BOMB
	itemmon 9, DUSTOX, POISON_BARB
		moves SLUDGE_BOMB, CONFUSE_RAY, STUN_SPORE, WHIRLWIND
	itemmon 9, AMUK, POISON_BARB
		moves SLUDGE_BOMB, PURSUIT, RECOVER, MINIMIZE
	itemmon 9, NIDOQUEEN, POISON_BARB
		moves SLUDGE_BOMB, EARTHQUAKE, BODY_SLAM, TOXIC
	itemmon 9, UMBREON, POISON_BARB
		moves TOXIC, RECOVER, GROWL, SNARL
	itemmon 11, GWEEZING, POISON_BARB
		moves SLUDGE_BOMB, PLAY_ROUGH, EXPLOSION, AMNESIA
	end_party

	next_list_item ; COOLTRAINERF (27) Evergrande Dungeon Generic F #1
	db "@", TRAINERTYPE_NORMAL
	mon 7, RHYDON
	mon 7, HITMONCHAN
	mon 7, TANGROWTH
	mon 8, ARCANINE
	end_party

	next_list_item ; COOLTRAINERF (28) Evergrande Dungeon Generic F #2
	db "@", TRAINERTYPE_NORMAL
	mon 7, NINETALES
	mon 7, HITMONLEE
	mon 7, JUMPLUFF
	mon 8, SLOWBRO
	end_party

	next_list_item ; COOLTRAINERF (29) Evergrande Dungeon Generic F #3
	db "@", TRAINERTYPE_NORMAL
	mon 7, POLITOED
	mon 7, WEAVILE
	mon 7, SABLEYE
	mon 8, MAWILE
	end_party

	next_list_item ; COOLTRAINERF (30) Evergrande Dungeon Generic F #4
	db "@", TRAINERTYPE_NORMAL
	mon 7, MR__RIME
	mon 7, LANTURN
	mon 7, HELECTRODE
	mon 8, PERSIAN
	end_party

	next_list_item ; COOLTRAINERF (31) Evergrande Dungeon Generic F #5
	db "@", TRAINERTYPE_NORMAL
	mon 7, LINOONE
	mon 7, GLALIE
	mon 7, HUNTAIL
	mon 8, MILTANK
	end_party

	next_list_item ; COOLTRAINERF (32) Evergrande Dungeon Generic F #6
	db "@", TRAINERTYPE_NORMAL
	mon 7, DELIBIRD
	mon 7, MANTINE
	mon 7, DUNSPARCE
	mon 8, TORKOAL
	end_party

	next_list_item ; COOLTRAINERF (33) Evergrande Dungeon Generic F #7
	db "@", TRAINERTYPE_NORMAL
	mon 7, ARAICHU
	mon 7, BLISSEY
	mon 7, DELCATTY
	mon 8, WHISCASH
	end_party

	next_list_item ; COOLTRAINERF (34) Evergrande Dungeon Generic F #8
	db "@", TRAINERTYPE_NORMAL
	mon 7, AMAROWAK
	mon 7, LICKILICKY
	mon 7, CLAYDOL
	mon 8, WALREIN
	end_party

	next_list_item ; COOLTRAINERF (34) Evergrande Dungeon Generic F #9
	db "@", TRAINERTYPE_NORMAL
	mon 7, DUSTOX
	mon 7, GRANBULL
	mon 7, SIRFETCH_D
	mon 8, SNORLAX
	end_party

	end_list_items

BeautyGroupHard:
	next_list_item ; BEAUTY (1) Goldenrod City Gym
	db "Victoria@", TRAINERTYPE_NORMAL
	mon 7, SENTRET
	mon 7, ZIGZAGOON
	mon 7, DELCATTY
	end_party

	next_list_item ; BEAUTY (2) Goldenrod City Gym
	db "Samantha@", TRAINERTYPE_NORMAL
	mon 9, MEOWTH
	mon 9, BEAUTIFLY
	end_party

	next_list_item ; BEAUTY (3) Fastship Cabins
	db "Cassie@", TRAINERTYPE_NORMAL
	mon 7, VILEPLUME
	mon 5, BUTTERFREE
	end_party

	next_list_item ; BEAUTY (4) Celadon City Gym
	db "Julia@", TRAINERTYPE_NORMAL
	mon 7, EXEGGCUTE2
	mon 7, EXEGGCUTE
	mon 7, PARASECT
	end_party

	next_list_item ; BEAUTY (5) Route 38
	db "Valerie@", TRAINERTYPE_NORMAL
	mon 5, SKIPLOOM
	mon 7, SUNFLORA
	end_party

	next_list_item ; BEAUTY (6) Route 38
	db "Olivia@", TRAINERTYPE_NORMAL
	mon 12, CORSOLA
	end_party

	next_list_item ; BEAUTY (7) Route 103
	db "Daisy@", TRAINERTYPE_NORMAL
	mon 5, FURRET
	end_party

	next_list_item ; BEAUTY (8) Route 104
	db "Cindy@", TRAINERTYPE_NORMAL
	mon 5, HOOTHOOT
	end_party

	next_list_item ; BEAUTY (9) Route 109
	db "Hailey@", TRAINERTYPE_NORMAL
	mon 6, NOCTOWL
	mon 7, AZUMARILL
	end_party

	next_list_item ; BEAUTY (10) Route 109
	db "Lola@", TRAINERTYPE_NORMAL
	mon 7, ANINETALES
	mon 7, ROSERADE
	end_party

	next_list_item ; BEAUTY (11) Route 112
	db "Shayla@", TRAINERTYPE_NORMAL
	mon 7, BRELOOM
	mon 7, ROSELIA
	end_party

	next_list_item ; BEAUTY (12) Route 120
	db "Clarissa@", TRAINERTYPE_NORMAL
	mon 7, ROSERADE
	mon 7, WAILORD
	end_party

	next_list_item ; BEAUTY (13) Route 120
	db "Angelica@", TRAINERTYPE_NORMAL
	mon 7, LEAFEON
	mon 7, SYLVEON
	end_party

	next_list_item ; BEAUTY (14) Sootopolis Gym
	db "Connie@", TRAINERTYPE_NORMAL
	mon 8, SEAKING
	mon 9, VAPOREON
	end_party

	next_list_item ; BEAUTY (15) Sootopolis Gym
	db "Tiffany@", TRAINERTYPE_NORMAL
	mon 8, SHARPEDO
	mon 9, MASQUERAIN
	end_party

	next_list_item ; BEAUTY (16) Sootopolis Gym
	db "Olivia@", TRAINERTYPE_NORMAL
	mon 8, HUNTAIL
	mon 8, GOREBYSS
	end_party

	next_list_item ; BEAUTY (17) Sootopolis Gym
	db "Bridget@", TRAINERTYPE_NORMAL
	mon 9, AZUMARILL
	mon 7, WAILMER
	end_party

	end_list_items

PokemaniacGroupHard:
	next_list_item ; POKEMANIAC (1) Union Cave - 1F
	db "Larry@", TRAINERTYPE_NORMAL
	mon 7, SLOWPOKE
	mon 7, UNOWN
	end_party

	next_list_item ; POKEMANIAC (2) Union Cave - B1F
	db "Andrew@", TRAINERTYPE_NORMAL
	mon 7, MAROWAK
	mon 7, AMAROWAK
	end_party

	next_list_item ; POKEMANIAC (3) Union Cave - B1F
	db "Calvin@", TRAINERTYPE_NORMAL
	mon 7, KANGASKHAN
	mon 7, TAUROS
	mon 7, TAUROS
	end_party

	next_list_item ; POKEMANIAC (4) Route 42
	db "Shane@", TRAINERTYPE_NORMAL
	mon 8, NIDOQUEEN
	mon 8, NIDOKING
	end_party

	next_list_item ; POKEMANIAC (5) Route 43
	db "Ben@", TRAINERTYPE_NORMAL
	mon 5, SLOWBRO
	mon 5, SUDOWOODO
	mon 6, QWILFISH
	end_party

	next_list_item ; POKEMANIAC (6) Route 43
	db "Brent@", TRAINERTYPE_NORMAL
	mon 5, LICKITUNG
	mon 7, MR__MIME
	mon 5, CHANSEY
	end_party

	next_list_item ; POKEMANIAC (7) Route 43
	db "Ron@", TRAINERTYPE_NORMAL
	mon 4, HITMONLEE
	mon 5, WOBBUFFET
	mon 9, NIDOKING
	end_party

	next_list_item ; POKEMANIAC (8) Fast Ship
	db "Ethan@", TRAINERTYPE_NORMAL
	mon 3, RHYHORN
	mon 7, RHYDON
	end_party

	next_list_item ; POKEMANIAC (11) Goldenrod Underground
	db "Issac@", TRAINERTYPE_MOVES
	mon 7, LICKITUNG
		moves LICK, SUPERSONIC, CUT, NO_MOVE
	end_party

	next_list_item ; POKEMANIAC (12) Goldenrod Underground
	db "Donald@", TRAINERTYPE_NORMAL
	mon 5, SLOWPOKE
	mon 5, DODUO
	end_party

	next_list_item ; POKEMANIAC (13) Route 44
	db "Zach@", TRAINERTYPE_NORMAL
	mon 7, RHYHORN
	mon 7, AERODACTYL
	mon 7, AIPOM
	end_party

	next_list_item ; POKEMANIAC (15) Mt. Mortar
	db "Miller@", TRAINERTYPE_NORMAL
	mon 9, NIDOKING
	mon 9, NIDOQUEEN
	end_party

	next_list_item ; POKEMANIAC (16) Route 113
	db "Wyatt@", TRAINERTYPE_NORMAL
	mon 7, MAGNETON
	mon 7, LAIRON
	end_party

	next_list_item ; POKEMANIAC (17) Route 114
	db "Wyatt@", TRAINERTYPE_NORMAL
	mon 6, LAIRON
	mon 7, VAPOREON
	end_party

	next_list_item ; POKEMANIAC (18) Route 119
	db "Donald@", TRAINERTYPE_NORMAL
	mon 7, BUTTERFREE
	mon 7, BEAUTIFLY
	end_party

	next_list_item ; POKEMANIAC (19) Route 119
	db "Taylor@", TRAINERTYPE_NORMAL
	mon 7, BEEDRILL
	mon 7, DUSTOX
	end_party

	next_list_item ; POKEMANIAC (20) Route 119
	db "Brent@", TRAINERTYPE_NORMAL
	mon 7, PINSIR
	mon 7, SCYTHER
	end_party

	next_list_item ; POKEMANIAC (21) Route 120
	db "Jeffrey@", TRAINERTYPE_NORMAL
	mon 5, MASQUERAIN
	mon 5, PORYGON2
	end_party

	end_list_items

GruntMGroupHard:
	next_list_item ; GRUNTM (1) GRUNTM_EASY 
	db "Grunt@", TRAINERTYPE_RANDOM, 3, ROCKET_EASY
	end_party

	next_list_item ; GRUNTM (2) GRUNTM_MEDIUM
	db "Enforcer@", TRAINERTYPE_RANDOM, 3, ROCKET_MEDIUM
	end_party

	next_list_item ; GRUNTM (3) GRUNTM_HARD 
	db "Soldier@", TRAINERTYPE_RANDOM, 3, ROCKET_HARD
	end_party

	next_list_item ; GRUNTM (4) Radio Tower 2F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, MUK
	mon 5, MIGHTYENA
	mon 5, NUZLEAF
	end_party

	next_list_item ; GRUNTM (5) Radio Tower 2F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, SHIFTRY
	mon 5, SWELLOW
	mon 5, FURRET
	end_party

	next_list_item ; GRUNTM (6) Radio Tower 2F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 6, GOLBAT
	mon 6, YANMA
	end_party

	next_list_item ; GRUNTM (7) Radio Tower 3F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, WEEZING
	mon 5, SEVIPER
	mon 6, GRUMPIG
	end_party

	next_list_item ; GRUNTM (8) Radio Tower 3F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, WEEZING
	mon 7, ZANGOOSE
	end_party

	next_list_item ; GRUNTM (9) Radio Tower 3F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, RATICATE
	mon 7, LINOONE
	end_party

	next_list_item ; GRUNTM (10) Radio Tower 4F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, ZUBAT
	mon 6, GOLBAT
	mon 7, SPINDA
	end_party

	next_list_item ; GRUNTM (11) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, AMUK
	mon 5, WEEZING
	mon 6, NOSEPASS
	end_party

	next_list_item ; GRUNTM (12) Unreferenced
	db "Executive@", TRAINERTYPE_NORMAL
	mon 10, HOUNDOUR
	end_party

	next_list_item ; GRUNTM (13) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, RATICATE
	mon 5, HARIYAMA
	end_party

	next_list_item ; GRUNTM (14) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 4, RATICATE
	mon 4, GOLBAT
	end_party

	next_list_item ; GRUNTM (15) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 4, AMUK
	mon 7, WEEZING
	end_party

	next_list_item ; GRUNTM (16) Team Rocket Base B1F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, PERSIAN
	mon 5, RATICATE
	mon 5, DUSTOX
	mon 5, FURRET
	end_party

	next_list_item ; GRUNTM (17) Team Rocket Base B2F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 8, GOLBAT
	mon 8, DUSTOX
	end_party

	next_list_item ; GRUNTM (18) Team Rocket Base B2F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, RATICATE
	mon 5, MIGHTYENA
	mon 5, CACTURNE
	end_party

	next_list_item ; GRUNTM (19) Team Rocket Base B2F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, VENOMOTH
	mon 7, GLALIE
	end_party

	next_list_item ; GRUNTM (20) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, HYPNO
	mon 5, GOLBAT
	end_party

	next_list_item ; GRUNTM (21) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 6, ZUBAT
	mon 7, GRIMER
	mon 6, RATTATA
	end_party

	next_list_item ; GRUNTM (22) Unreferenced
	db "Executive@", TRAINERTYPE_NORMAL
	mon 10, GOLBAT
	end_party

	next_list_item ; GRUNTM (23) Unreferenced
	db "Executive@", TRAINERTYPE_NORMAL
	mon 10, KOFFING
	end_party

	next_list_item ; GRUNTM (24) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, WEEZING
	mon 5, BANETTE
	end_party

	next_list_item ; GRUNTM (25) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, CACTURNE
	mon 4, MUK
	end_party

	next_list_item ; GRUNTM (26) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, RATTATA
	mon 5, RATTATA
	end_party

	next_list_item ; GRUNTM (27) Unreferenced
	db "Executive@", TRAINERTYPE_NORMAL
	mon 10, ZUBAT
	end_party

	next_list_item ; GRUNTM (28) Team Rocket Base B3F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 15, RATICATE
	end_party

	next_list_item ; GRUNTM (29) Slowpoke Well B1F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, SEEL
	mon 6, CUBONE
	end_party

	next_list_item ; GRUNTM (30) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, GOLBAT
	mon 5, GOLBAT
	mon 7, ARBOK
	end_party

	next_list_item ; GRUNTM (31) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, GOLBAT
	end_party

	next_list_item ; GRUNTM (32) Mount Moon 1
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, GOLBAT
	mon 5, SANDSHREW
	end_party

	next_list_item ; GRUNTM (33) Mount Moon 2
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, EKANS
	mon 7, SEVIPER
	end_party

	next_list_item ; GRUNTM (34) Mount Moon 3
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, RATICATE
	mon 7, HOOTHOOT
	end_party

	next_list_item ; GRUNTM (35) Mount Moon 4
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, GRIMER
	mon 7, GULPIN
	end_party

	next_list_item ; GRUNTM (36) Safari Grunt 1
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, MUK
	mon 7, ZANGOOSE
	end_party

	next_list_item ; GRUNTM (37) Safari Grunt 2
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, MAROWAK
	mon 7, EXEGGUTOR2
	end_party

	next_list_item ; GRUNTM (38) Safari Grunt 3
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, TENTACRUEL
	mon 7, TENTACRUEL2
	end_party

	next_list_item ; GRUNTM (39) Safari Grunt 4
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, LICKILICKY
	mon 7, AMAROWAK
	end_party

	next_list_item ; GRUNTM (40) Safari Grunt 5
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, HELECTRODE
	mon 7, ELECTRODE2
	end_party

	next_list_item ; GRUNTM (41) Safari Grunt 6
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, CRAWDAUNT
	mon 7, KINGLER
	end_party

	next_list_item ; GRUNTM (42) Safari Grunt 7
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, DUSCLOPS
	mon 7, VICTREEBEL
	end_party

	next_list_item ; GRUNTM (43) Rustturf Grunt 1
	db "Alex@", TRAINERTYPE_NORMAL
	mon 6, BALTOY
	mon 7, POOCHYENA
	end_party

	next_list_item ; GRUNTM (43) Rustturf Grunt 2
	db "Ryan@", TRAINERTYPE_NORMAL
	mon 6, LINOONE
	mon 7, CARVANHA
	end_party

	next_list_item ; GRUNTM (44) Mauville Grunt 1
	db "Ryan@", TRAINERTYPE_NORMAL
	mon 6, FURRET
	mon 9, SHARPEDO
	end_party

	next_list_item ; GRUNTM (45) Mauville Grunt 2
	db "Alex@", TRAINERTYPE_NORMAL
	mon 6, BALTOY
	mon 9, MIGHTYENA
	end_party

	next_list_item ; GRUNTM (46) Mauville Grunt 3
	db "Jordan@", TRAINERTYPE_NORMAL
	mon 6, NUMEL
	mon 9, ARIADOS
	end_party

	next_list_item ; GRUNTM (47) Mauville Grunt 4
	db "Frank@", TRAINERTYPE_NORMAL
	mon 8, MAGMAR
	mon 10, HUNTAIL
	end_party

	next_list_item ; GRUNTM (48) Route 121 Grunt 1
	db "Ryan@", TRAINERTYPE_NORMAL
	mon 7, LINOONE
	mon 8, SHARPEDO
	mon 9, DODRIO
	end_party

	next_list_item ; GRUNTM (49) Route 121 Grunt 2
	db "Alex@", TRAINERTYPE_NORMAL
	mon 7, MIGHTYENA
	mon 8, CAMERUPT
	mon 9, CLAYDOL
	end_party

	next_list_item ; GRUNTM (50) Mt Pyre Grunt 1
	db "Elite@", TRAINERTYPE_NORMAL
	mon 7, TORKOAL
	mon 7, CHARIZARD
	mon 10, DYNABEA
	end_party

	next_list_item ; GRUNTM (51) Mt Pyre Grunt 2
	db "Elite@", TRAINERTYPE_NORMAL
	mon 7, MANTINE
	mon 7, BLASTOISE
	mon 10, AKUERIA
	end_party

	next_list_item ; GRUNTM (52) Mt Pyre Grunt 3
	db "Elite@", TRAINERTYPE_NORMAL
	mon 7, DUNSPARCE
	mon 7, MAROWAK
	mon 10, GLISCOR
	end_party

	next_list_item ; GRUNTM (53) Mt Pyre Grunt 4
	db "Elite@", TRAINERTYPE_NORMAL
	mon 7, DELIBIRD
	mon 7, DEWGONG
	mon 10, GLACEON
	end_party

	end_list_items

GentlemanGroupHard:
	next_list_item ; GENTLEMAN (1) Glitter Lighthouse - 3F
	db "Preston@", TRAINERTYPE_NORMAL
	mon 7, ARCANINE
	mon 7, RAPIDASH
	end_party

	next_list_item ; GENTLEMAN (2) Fast Ship
	db "Edward@", TRAINERTYPE_NORMAL
	mon 7, PERSIAN
	end_party

	next_list_item ; GENTLEMAN (3) Vermilion City Gym
	db "Gregory@", TRAINERTYPE_NORMAL
	mon 7, PIKACHU
	mon 7, FLAAFFY
	end_party

	next_list_item ; GENTLEMAN (4) Glitter Lighthouse - 2F
	db "Alfred@", TRAINERTYPE_NORMAL
	mon 7, NOCTOWL
	mon 7, NOCTOWL
	end_party

	next_list_item ; GENTLEMAN (5) Mossdeep Gym
	db "Cliff@", TRAINERTYPE_NORMAL
	mon 8, GIRAFARIG
	mon 8, STANTLER
	mon 9, NOCTOWL
	end_party

	next_list_item ; GENTLEMAN (6) Mossdeep Gym
	db "Nate@", TRAINERTYPE_NORMAL
	mon 8, MR__MIME
	mon 8, GRUMPIG
	mon 9, XATU
	end_party

	end_list_items

SkierGroupHard:
	next_list_item ; SKIER (1) Mahogany Town Gym
	db "Roxanne@", TRAINERTYPE_NORMAL
	mon 7, JYNX
	mon 7, GLALIE
	end_party

	next_list_item ; SKIER (2) Mahogany Town Gym
	db "Clarissa@", TRAINERTYPE_NORMAL
	mon 7, DEWGONG
	mon 7, SNEASEL
	end_party

	end_list_items

TeacherGroupHard:
	next_list_item ; TEACHER (1) Route 15
	db "Colette@", TRAINERTYPE_NORMAL
	mon 7, CLEFAIRY
	end_party

	next_list_item ; TEACHER (2) Route 15
	db "Hillary@", TRAINERTYPE_NORMAL
	mon 5, AIPOM
	mon 6, CUBONE
	end_party

	next_list_item ; TEACHER (3) Fast Ship
	db "Shirley@", TRAINERTYPE_NORMAL
	mon 5, JIGGLYPUFF
	end_party

	next_list_item ; TEACHER (3) Ilex East (Jessadactyl contest party #1)
	db "Jess@", TRAINERTYPE_NORMAL
	mon 7, XATU
	mon 7, AGRIMER
	mon 7, LAIRON
	mon 7, TENTACRUEL
	mon 7, PRIMEAPE
	mon 9, GRANBULL
	end_party

	next_list_item ; TEACHER (3) Ilex East (Jessadactyl contest party #2)
	db "Jess@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, XATU, KINGS_ROCK
		moves PSYCHIC_M, DRILL_PECK, WILLOWISP, DARK_PULSE
	itemmon 10, AMUK, LEFTOVERS
		moves SLUDGE_BOMB, SHADOW_PUNCH, COSMIC_POWER, RECOVER
	itemmon 10, AGGRON, METAL_COAT
		moves IRON_TAIL, COSMIC_POWER, ROCK_SLIDE, GUILLOTINE
	itemmon 10, TENTACRUEL, MYSTIC_WATER
		moves SLUDGE_BOMB, HYDRO_PUMP, ICY_WIND, POWER_GEM
	itemmon 10, GRANBULL, QUICK_CLAW
		moves CRUNCH, SWORDS_DANCE, THUNDERPUNCH, PLAY_ROUGH
	itemmon 12, ANNIHILAPE, BLACKBELT_I
		moves CROSS_CHOP, SHADOW_PUNCH, FISSURE, BULK_UP
	end_party

	next_list_item ; TEACHER (6)  (Klutch contest party #1)
	db "Klutch@", TRAINERTYPE_NORMAL
	mon 7, RHYHORN
	mon 7, CHARMELEON
	mon 5, SWABLU
	mon 7, FURRET
	mon 7, HANAMOLE
	mon 8, GYARADOS
	end_party

	next_list_item ; TEACHER (7)  (Klutch contest party #2)
	db "Klutch@", TRAINERTYPE_NORMAL
	mon 9, RHYDON
	mon 9, CHARIZARD
	mon 9, ALTARIA
	mon 10, HANAMOLE
	mon 10, FURRET
	mon 11, GYARADOS
	end_party

	next_list_item ; TEACHER (8)  (Klutch contest party #3)
	db "Klutch@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, RHYPERIOR, QUICK_CLAW
		moves ROCK_SLIDE, DRAGON_CLAW, DRAGON_DANCE, EARTHQUAKE
	itemmon 10, CHARIZARDX, CHARCOAL
		moves FIRE_BLAST, OUTRAGE, EARTHQUAKE, AIR_CUTTER
	itemmon 10, ALTARIAX, DRAGON_FANG
		moves LUSTER_PURGE, OUTRAGE, RECOVER, PERISH_SONG
	itemmon 10, HANAMOLE, MIRACLE_SEED
		moves GIGA_DRAIN, DRAGONBREATH, STUN_SPORE, LEECH_SEED
	itemmon 10, FURRET2, LEFTOVERS
		moves HYPER_BEAM, CRUNCH, OUTRAGE, DRAGON_DANCE
	itemmon 11, GYARADOSX, AMULET_COIN
		moves WATERFALL, OUTRAGE, FIRE_FANG, THUNDER_FANG
	end_party

	next_list_item ; TEACHER (9) Sootopolis Gym
	db "Daphne@", TRAINERTYPE_NORMAL
	mon 8, GYARADOS
	mon 8, PELIPPER
	end_party

	next_list_item ; TEACHER (10) Sootopolis Gym
	db "Brianna@", TRAINERTYPE_NORMAL
	mon 8, GOREBYSS
	mon 8, CLOYSTER
	end_party

	end_list_items

SabrinaGroupHard:
	next_list_item ; SABRINA (1)
	db "Sabrina@", TRAINERTYPE_MOVES
	mon 9, SMOOCHUM
		moves POWDER_SNOW, CONFUSION, SWEET_KISS, DIZZY_PUNCH
	mon 9, MR__MIME
		moves BARRIER, REFLECT, BATON_PASS, CONFUSION
	mon 10, KADABRA
		moves CONFUSION, FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH
	end_party
	
	next_list_item ; SABRINA (2)
	db "Sabrina@", TRAINERTYPE_MOVES
	mon 10, JYNX
		moves ICY_WIND, PSYCHIC_M, DIZZY_PUNCH, CALM_MIND
	mon 10, MR__MIME
		moves BARRIER, REFLECT, BATON_PASS, PSYCHIC_M
	mon 12, WOBBUFFET
		moves COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	mon 10, LUNATONE
		moves CALM_MIND, ANCIENTPOWER, ROCK_TOMB, PSYCHIC_M
	mon 12, ALAKAZAM
		moves PSYCHIC_M, CALM_MIND, RECOVER, SHADOW_BALL
	end_party
	
	next_list_item ; SABRINA (3)
	db "Sabrina@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, JYNX, NEVERMELTICE
		moves ICY_WIND, PSYCHIC_M, DIZZY_PUNCH, CALM_MIND
	itemmon 11, MR__MIME, TWISTEDSPOON
		moves BARRIER, LIGHT_SCREEN, BATON_PASS, PSYCHIC_M
	itemmon 11, WOBBUFFET, LEFTOVERS
		moves COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	itemmon 11, LUNATONE, MINT_BERRY
		moves CALM_MIND, REST, ROCK_TOMB, PSYCHIC_M
	itemmon 11, HYPNO, MINT_BERRY
		moves CALM_MIND, REST, HYPNOSIS, DREAM_EATER
	itemmon 13, ALAKAZAMX, BLACKBELT_I
		moves PSYCHIC_M, CALM_MIND, RECOVER, FOCUS_PUNCH
	end_party

	end_list_items

BugCatcherGroupHard:
	next_list_item ; BUG_CATCHER (1) Route 30
	db "Don@", TRAINERTYPE_NORMAL
	mon 3, CATERPIE
	mon 3, SURSKIT
	end_party

	next_list_item ; BUG_CATCHER (2) Viridian Forest
	db "Rob@", TRAINERTYPE_NORMAL 
	mon 0, WEEDLE
	mon 0, CATERPIE
	end_party

	next_list_item ; BUG_CATCHER (3) Viridian Forest
	db "Ed@", TRAINERTYPE_NORMAL
	mon 0, WEEDLE
	mon 0, PIDGEY
	end_party

	next_list_item ; BUG_CATCHER (4) Route 31
	db "Wade@", TRAINERTYPE_NORMAL
	mon 2, CATERPIE
	mon 2, SURSKIT
	mon 3, WEEDLE
	mon 2, WURMPLE
	end_party

	next_list_item ; BUG_CATCHER (5) Azalea Town Gym
	db "Benny@", TRAINERTYPE_NORMAL
	mon 2, WEEDLE
	mon 4, KAKUNA
	mon 9, BEEDRILL
	end_party

	next_list_item ; BUG_CATCHER (6) Azalea Town Gym
	db "Al@", TRAINERTYPE_NORMAL
	mon 3, WURMPLE
	mon 3, SILCOON
	mon 5, BEAUTIFLY
	mon 5, DUSTOX
	end_party

	next_list_item ; BUG_CATCHER (7) Azalea Town Gym
	db "Josh@", TRAINERTYPE_NORMAL
	mon 7, PARAS
	mon 7, YANMA
	mon 7, TRAPINCH
	end_party

	next_list_item ; BUG_CATCHER (8) Route 35
	db "Arnie@", TRAINERTYPE_NORMAL
	mon 5, VENONAT
	mon 5, VENONAT
	end_party

	next_list_item ; BUG_CATCHER (9) Fast Ship
	db "Ken@", TRAINERTYPE_NORMAL
	mon 2, ARIADOS
	mon 4, PINSIR
	end_party	

	next_list_item ; BUG_CATCHER (12) Viridian Forest
	db "Doug@", TRAINERTYPE_NORMAL
	mon 0, SPINARAK
	end_party
	
	next_list_item ; BUG_CATCHER (19) Ilex Forest
	db "Wayne@", TRAINERTYPE_NORMAL
	mon 5, LEDYBA
	mon 6, PARAS
	end_party

	next_list_item ; BUG_CATCHER (20) Mauville City Gym
	db "Angelo@", TRAINERTYPE_NORMAL
	mon 10, ILLUMISE
	mon 10, VOLBEAT
	end_party

	next_list_item ; BUG_CATCHER (21) Route 102
	db "Rick@", TRAINERTYPE_NORMAL
	mon 1, WURMPLE
	mon 1, WEEDLE
	end_party

	next_list_item ; BUG_CATCHER (22) Petalburg Woods
	db "Lyle@", TRAINERTYPE_NORMAL
	mon 4, PARAS
	mon 5, SHROOMISH
	end_party

	next_list_item ; BUG_CATCHER (23) Petalburg Woods
	db "James@", TRAINERTYPE_NORMAL
	mon 4, WURMPLE
	mon 5, WURMPLE
	end_party

	next_list_item ; BUG_CATCHER (24) Route 116
	db "Jose@", TRAINERTYPE_NORMAL
	mon 5, DUSTOX
	mon 7, PARAS
	end_party

	next_list_item ; BUG_CATCHER (25) Route 117
	db "Derek@", TRAINERTYPE_NORMAL
	mon 7, DUSTOX
	mon 7, BEAUTIFLY
	mon 9, DUSTOX
	end_party

	next_list_item ; BUG_CATCHER (26) Mt Moon
	db "Kent@", TRAINERTYPE_NORMAL
	mon 5, BEEDRILL
	mon 5, BUTTERFREE
	end_party

	next_list_item ; BUG_CATCHER (27) Mt Moon
	db "Robby@", TRAINERTYPE_NORMAL
	mon 5, CATERPIE
	mon 4, WEEDLE
	mon 7, PARAS
	end_party

	next_list_item ; BUG_CATCHER (28) Route119
	db "Kent@", TRAINERTYPE_NORMAL
	mon 5, PARAS
	mon 8, DUSTOX
	end_party

	next_list_item ; BUG_CATCHER (29) Route119
	db "Greg@", TRAINERTYPE_NORMAL
	mon 6, VOLBEAT
	mon 6, ILLUMISE
	end_party

	next_list_item ; BUG_CATCHER (30) Route119
	db "Doug@", TRAINERTYPE_NORMAL
	mon 6, FORRETRESS
	mon 7, HERACROSS
	end_party

	end_list_items

FisherGroupHard:
	next_list_item ; FISHER (1) Route 32
	db "Justin@", TRAINERTYPE_NORMAL
	mon 5, MAGIKARP
	mon 5, MAGIKARP
	mon 9, MAGIKARP
	mon 5, MAGIKARP
	end_party

	next_list_item ; FISHER (2) Route 32
	db "Ralph@", TRAINERTYPE_NORMAL
	mon 7, GOLDEEN
	mon 7, CARVANHA
	mon 7, MAGNEMITE
	end_party

	next_list_item ; FISHER (3) Route 21
	db "Arnold@", TRAINERTYPE_NORMAL
	mon 4, TENTACRUEL
	mon 4, MAGNETON
	end_party

	next_list_item ; FISHER (4) Route 12
	db "Kyle@", TRAINERTYPE_NORMAL
	mon 3, SEAKING
	mon 5, MAGNETON
	mon 5, SEAKING
	end_party

	next_list_item ; FISHER (5) Route 32
	db "Henry@", TRAINERTYPE_NORMAL
	mon 5, POLIWAG
	mon 5, POLIWAG
	end_party

	next_list_item ; FISHER (6) Route 43
	db "Marvin@", TRAINERTYPE_NORMAL
	mon 5, MAGIKARP
	mon 5, GYARADOS
	mon 7, MAGIKARP
	mon 7, GYARADOS
	end_party

	next_list_item ; FISHER (7) Route 42
	db "Tully@", TRAINERTYPE_NORMAL
	mon 8, QWILFISH
	end_party

	next_list_item ; FISHER (8) Fast Ship
	db "Andre@", TRAINERTYPE_NORMAL
	mon 7, GYARADOS
	end_party

	next_list_item ; FISHER (9) Lake of Rage
	db "Raymond@", TRAINERTYPE_NORMAL
	mon 2, MAGIKARP
	mon 2, MAGIKARP
	mon 2, MAGIKARP
	mon 2, MAGIKARP
	end_party

	next_list_item ; FISHER (10) Route 44
	db "Wilton@", TRAINERTYPE_NORMAL
	mon 3, GOLDEEN
	mon 3, GOLDEEN
	mon 6, SEAKING
	end_party

	next_list_item ; FISHER (11) Route 44
	db "Edgar@", TRAINERTYPE_NORMAL
	mon 5, REMORAID
	mon 5, REMORAID
	end_party

	next_list_item ; FISHER (12) Fast Ship
	db "Jonah@", TRAINERTYPE_NORMAL
	mon 5, SHELLDER
	mon 9, OCTILLERY
	mon 5, REMORAID
	mon 9, CLOYSTER
	end_party

	next_list_item ; FISHER (13) Route 12
	db "Martin@", TRAINERTYPE_NORMAL
	mon 6, REMORAID
	mon 6, REMORAID
	end_party

	next_list_item ; FISHER (14) Route 12
	db "Stephen@", TRAINERTYPE_NORMAL
	mon 5, MAGIKARP
	mon 5, MAGIKARP
	mon 6, QWILFISH
	mon 7, TENTACRUEL
	end_party

	next_list_item ; FISHER (15) Route 12
	db "Barney@", TRAINERTYPE_NORMAL
	mon 2, GYARADOS
	mon 2, GYARADOS
	mon 4, GYARADOS
	end_party

	next_list_item ; FISHER (21) Route 26
	db "Scott@", TRAINERTYPE_NORMAL
	mon 2, QWILFISH
	mon 2, QWILFISH
	mon 6, SEAKING
	end_party

	next_list_item ; FISHER (26) Route 103
	db "Andrew@", TRAINERTYPE_NORMAL
	mon 7, QWILFISH
	mon 7, GOLDEEN
	end_party

	next_list_item ; FISHER (27) Route 104
	db "Darian@", TRAINERTYPE_NORMAL
	mon 3, FEEBAS
	mon 3, TENTACOOL
	end_party

	next_list_item ; FISHER (28) Route 104
	db "Ivan@", TRAINERTYPE_NORMAL
	mon 3, MAGNEMITE
	mon 4, STARYU
	end_party

	next_list_item ; FISHER (29) Route 105
	db "Ned@", TRAINERTYPE_NORMAL
	mon 7, MAGNETON
	mon 7, WALREIN
	mon 7, POLITOED
	end_party

	next_list_item ; FISHER (30) Route 105
	db "Elliot@", TRAINERTYPE_NORMAL
	mon 7, WAILORD
	mon 7, OMASTAR
	mon 10, DRAGONAIR
	end_party

	next_list_item ; FISHER (31) Route 110
	db "Dale@", TRAINERTYPE_NORMAL
	mon 7, MAGNETON
	mon 5, WHISCASH
	mon 7, SHARPEDO
	end_party

	next_list_item ; FISHER (32) Route 118
	db "Barney@", TRAINERTYPE_NORMAL
	mon 7, MAGNEMITE
	mon 5, BARBOACH
	mon 7, HUNTAIL
	end_party

	next_list_item ; FISHER (33) Route 114
	db "Nolan@", TRAINERTYPE_NORMAL	
	mon 6, WHISCASH
	mon 7, OCTILLERY
	end_party

	next_list_item ; FISHER (34) Route 114
	db "Kai@", TRAINERTYPE_NORMAL	
	mon 7, SHARPEDO
	mon 6, MARSHTOMP
	end_party

	next_list_item ; FISHER (34) Route 114
	db "Claude@", TRAINERTYPE_NORMAL	
	mon 7, SLOWBRO
	mon 7, WARTORTLE
	end_party

	next_list_item ; FISHER (35) Route 119
	db "Chris@", TRAINERTYPE_NORMAL	
	mon 7, MILOTIC
	mon 7, GYARADOS
	mon 7, TENTACRUEL
	mon 8, SHARPEDO
	end_party

	end_list_items

SwimmerMGroupHard:
	next_list_item ; SWIMMERM (1) Route 19
	db "Harold@", TRAINERTYPE_NORMAL
	mon 6, REMORAID
	mon 4, SEADRA
	end_party

	next_list_item ; SWIMMERM (2) Route 40
	db "Simon@", TRAINERTYPE_NORMAL
	mon 3, TENTACOOL
	mon 5, TENTACOOL
	end_party

	next_list_item ; SWIMMERM (3) Route 40
	db "Randal@", TRAINERTYPE_NORMAL
	mon 3, SHELLDER
	mon 5, WARTORTLE
	mon 3, SHELLDER
	end_party

	next_list_item ; SWIMMERM (4) Route 41
	db "Charlie@", TRAINERTYPE_NORMAL
	mon 5, SHELLDER
	mon 3, TENTACOOL
	mon 3, TENTACRUEL
	end_party

	next_list_item ; SWIMMERM (5) Route 41
	db "George@", TRAINERTYPE_NORMAL
	mon 1, TENTACOOL
	mon 2, TENTACOOL
	mon 1, TENTACOOL
	mon 4, STARYU
	mon 2, TENTACOOL
	mon 4, REMORAID
	end_party

	next_list_item ; SWIMMERM (6) Route 41
	db "Berke@", TRAINERTYPE_NORMAL
	mon 8, QWILFISH
	end_party

	next_list_item ; SWIMMERM (7) Route 41
	db "Kirk@", TRAINERTYPE_NORMAL
	mon 3, GYARADOS
	mon 3, GYARADOS
	end_party

	next_list_item ; SWIMMERM (8) Route 41
	db "Mathew@", TRAINERTYPE_NORMAL
	mon 7, KRABBY
	end_party

	next_list_item ; SWIMMERM (9) Route 19
	db "Jerome@", TRAINERTYPE_NORMAL
	mon 6, SEADRA
	mon 3, TENTACOOL
	mon 7, TENTACRUEL
	mon 6, GOLDEEN
	end_party

	next_list_item ; SWIMMERM (10) Route 19
	db "Tucker@", TRAINERTYPE_NORMAL
	mon 3, SHELLDER
	mon 6, CLOYSTER
	end_party

	next_list_item ; SWIMMERM (11) Route 20
	db "Cameron@", TRAINERTYPE_NORMAL
	mon 7, MARILL
	end_party

	next_list_item ; SWIMMERM (12) Route 21
	db "Seth@", TRAINERTYPE_NORMAL
	mon 4, QUAGSIRE
	mon 4, OCTILLERY
	mon 7, QUAGSIRE
	end_party

	next_list_item ; SWIMMERM (13) Cerulean City Gym
	db "Parker@", TRAINERTYPE_NORMAL
	mon 7, HORSEA
	mon 7, WARTORTLE
	mon 7, SEADRA
	end_party

	next_list_item ; SWIMMERM (14) Route105
	db "Luis@", TRAINERTYPE_NORMAL
	mon 10, LUVDISC
	mon 7, SEADRA
	mon 7, HUNTAIL
	end_party

	next_list_item ; SWIMMERM (15) Route108
	db "Tony@", TRAINERTYPE_NORMAL
	mon 8, LUVDISC
	mon 8, GOLDUCK
	mon 8, SLOWKING
	end_party

	next_list_item ; SWIMMERM (16) Route108
	db "Darrin@", TRAINERTYPE_NORMAL
	mon 8, WHISCASH
	mon 8, CRAWDAUNT
	mon 9, LINOONE
	end_party

	end_list_items

SwimmerFGroupHard:
	next_list_item ; SWIMMERF (1) Route 40
	db "Elaine@", TRAINERTYPE_NORMAL
	mon 6, STARYU
	end_party

	next_list_item ; SWIMMERF (2) Route 40
	db "Paula@", TRAINERTYPE_NORMAL
	mon 5, STARYU
	mon 5, SHELLDER
	end_party

	next_list_item ; SWIMMERF (3) Route 41
	db "Kaylee@", TRAINERTYPE_NORMAL
	mon 3, GOLDEEN
	mon 5, GOLDEEN
	mon 7, SEAKING
	end_party

	next_list_item ; SWIMMERF (4) Route 41
	db "Susie@", TRAINERTYPE_MOVES
	mon 5, PSYDUCK
		moves SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	mon 7, GOLDEEN
		moves PECK, TAIL_WHIP, SUPERSONIC, HORN_ATTACK
	end_party

	next_list_item ; SWIMMERF (5) Route 41
	db "Denise@", TRAINERTYPE_NORMAL
	mon 7, SEEL
	end_party

	next_list_item ; SWIMMERF (6) Route 41
	db "Kara@", TRAINERTYPE_NORMAL
	mon 4, STARYU
	mon 6, STARMIE
	end_party

	next_list_item ; SWIMMERF (7) Route 41
	db "Wendy@", TRAINERTYPE_MOVES
	mon 6, HORSEA
		moves BUBBLE, SMOKESCREEN, LEER, WATER_GUN
	mon 6, HORSEA
		moves DRAGON_RAGE, SMOKESCREEN, LEER, WATER_GUN
	end_party

	next_list_item ; SWIMMERF (8) Route 19
	db "Dawn@", TRAINERTYPE_NORMAL
	mon 8, SEAKING
	end_party

	next_list_item ; SWIMMERF (9) Route 20
	db "Nicole@", TRAINERTYPE_NORMAL
	mon 4, MARILL
	mon 4, MARILL
	mon 7, LAPRAS
	end_party

	next_list_item ; SWIMMERF (10) Route 20
	db "Lori@", TRAINERTYPE_NORMAL
	mon 2, STARMIE
	mon 2, STARMIE
	end_party

	next_list_item ; SWIMMERF (11) Route 21
	db "Nikki@", TRAINERTYPE_NORMAL
	mon 2, SEEL
	mon 2, SEEL
	mon 3, SEEL
	mon 5, DEWGONG
	end_party

	next_list_item ; SWIMMERF (12) Cerulean City Gym
	db "Diana@", TRAINERTYPE_NORMAL
	mon 7, GOLDUCK
	mon 7, CRAWDAUNT
	end_party

	next_list_item ; SWIMMERF (13) Cerulean City Gym
	db "Briana@", TRAINERTYPE_NORMAL
	mon 5, SEAKING
	mon 5, WHISCASH
	end_party

	next_list_item ; SWIMMERF (14) Route 105
	db "Imani@", TRAINERTYPE_NORMAL
	mon 7, MANTINE
	mon 7, GOREBYSS
	end_party

	next_list_item ; SWIMMERF (15) Route 108
	db "Denise@", TRAINERTYPE_NORMAL
	mon 7, PELIPPER
	mon 7, SEAKING
	end_party

	next_list_item ; SWIMMERF (16) Route 108
	db "Beth@", TRAINERTYPE_NORMAL
	mon 9, WAILORD
	mon 7, SEALEO
	end_party

	end_list_items

SailorGroupHard:
	next_list_item ; SAILOR (1) Route 39
	db "Eugene@", TRAINERTYPE_NORMAL
	mon 3, POLIWHIRL
	mon 5, RATICATE
	mon 6, KRABBY
	end_party

	next_list_item ; SAILOR (2) Glitter Lighthouse - 2F
	db "Huey@", TRAINERTYPE_NORMAL
	mon 10, POLITOED
	mon 7, POLIWHIRL
	end_party

	next_list_item ; SAILOR (3) Glitter Lighthouse - 3F
	db "Terrell@", TRAINERTYPE_NORMAL
	mon 8, POLIWHIRL
	mon 8, PELIPPER
	end_party

	next_list_item ; SAILOR (4) Glitter Lighthouse - 4F
	db "Kent@", TRAINERTYPE_MOVES
	mon 6, KRABBY
		moves BUBBLE, LEER, VICEGRIP, HARDEN
	mon 8, CORPHISH
		moves BUBBLEBEAM, LEER, VICEGRIP, HARDEN
	end_party

	next_list_item ; SAILOR (5) Glitter Lighthouse - 5F
	db "Ernest@", TRAINERTYPE_NORMAL
	mon 6, MACHOKE
	mon 7, PELIPPER
	mon 6, POLIWHIRL
	end_party

	next_list_item ; SAILOR (6) S.S. Aqua
	db "Jeff@", TRAINERTYPE_NORMAL
	mon 7, RATICATE
	mon 7, RATICATE
	end_party

	next_list_item ; SAILOR (7) Fast Ship
	db "Garrett@", TRAINERTYPE_NORMAL
	mon 7, KINGLER
	end_party

	next_list_item ; SAILOR (8) Fast Ship
	db "Kenneth@", TRAINERTYPE_NORMAL
	mon 3, MACHOP
	mon 3, MACHOP
	mon 8, POLIWRATH
	mon 3, MACHOP
	end_party

	next_list_item ; SAILOR (9) S.S. Aqua
	db "Stanly@", TRAINERTYPE_NORMAL
	mon 1, MACHOP
	mon 7, MACHOKE
	mon 6, PSYDUCK
	end_party

	next_list_item ; SAILOR (10) Route 38
	db "Harry@", TRAINERTYPE_NORMAL
	mon 7, WOOPER
	end_party

	next_list_item ; SAILOR (14) Dewford City Gym
	db "Brenden@", TRAINERTYPE_NORMAL	
	mon 7, POLIWHIRL
	end_party

	next_list_item ; SAILOR (15) Route 109
	db "Huey@", TRAINERTYPE_NORMAL	
	mon 8, MACHAMP
	mon 9, MANTINE
	end_party

	next_list_item ; SAILOR (16) Route 109
	db "Edmond@", TRAINERTYPE_NORMAL	
	mon 8, HITMONLEE
	mon 9, CORSOLA
	end_party

	next_list_item ; SAILOR (17) Route 109
	db "Ricky@", TRAINERTYPE_NORMAL	
	mon 7, DEWGONG
	mon 8, PROBOPASS
	end_party

	next_list_item ; SAILOR (18) Route 109
	db "Chandler@", TRAINERTYPE_NORMAL	
	mon 8, HITMONCHAN
	mon 8, BLASTOISE
	end_party

	end_list_items

SuperNerdGroupHard:
	next_list_item ; SUPER_NERD (1) Goldenrod Underground
	db "Eric@", TRAINERTYPE_NORMAL
	mon 4, GRIMER
	mon 6, GULPIN
	end_party

	next_list_item ; SUPER_NERD (2) Route 8
	db "Sam@", TRAINERTYPE_NORMAL
	mon 4, GRIMER
	mon 6, MUK
	end_party

	next_list_item ; SUPER_NERD (3) Route 8
	db "Tom@", TRAINERTYPE_NORMAL
	mon 4, MAGNEMITE
	mon 4, MAGNEMITE
	mon 4, MAGNEMITE
	end_party

	next_list_item ; SUPER_NERD (4) Route 25
	db "Pat@", TRAINERTYPE_NORMAL
	mon 7, PORYGON
	end_party

	next_list_item ; SUPER_NERD (5) Fast Ship
	db "Shawn@", TRAINERTYPE_NORMAL
	mon 2, MAGNEMITE
	mon 5, MUK
	mon 2, MAGNEMITE
	end_party

	next_list_item ; SUPER_NERD (6) Goldenrod Underground
	db "Teru@", TRAINERTYPE_NORMAL
	mon 4, ELECTRIKE
	mon 8, VOLTORB
	mon 3, MAGNEMITE
	mon 4, MAGNEMITE
	end_party

	next_list_item ; SUPER_NERD (7) Mt. Mortar
	db "Hugh@", TRAINERTYPE_MOVES
	mon 15, KINGDRA
		moves SMOKESCREEN, TWISTER, SURF, WATERFALL
	end_party

	next_list_item ; SUPER_NERD (8) Mt. Mortar
	db "Markus@", TRAINERTYPE_MOVES
	mon 15, SLOWPOKE
		moves CURSE, WATER_GUN, GROWL, STRENGTH
	end_party

	next_list_item ; SUPER_NERD (9) Mount Moon
	db "Jovan@", TRAINERTYPE_NORMAL
	mon 5, MAGNEMITE
	mon 7, HVOLTORB
	end_party

	next_list_item ; SUPER_NERD (10) Mount Moon
	db "Miguel@", TRAINERTYPE_NORMAL
	mon 5, GRIMER
	mon 7, VOLTORB
	mon 7, KOFFING
	end_party

	end_list_items

SECTION "Hard Trainer Parties 3", ROMX

Rival2GroupHard:
	next_list_item ; RIVAL2 (7) World Cup Rival
	db "?@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, FORRETRESS, QUICK_CLAW
		moves LEECH_SEED, TOXIC, RECOVER, EXPLOSION
	itemmon 12, WEAVILE, NEVERMELTICE
		moves ICICLE_CRASH, PURSUIT, MACH_PUNCH, PSYCHO_CUT
	itemmon 12, AMPHAROS, MAGNET
		moves THUNDERBOLT, FLASHCANNON, THUNDER_WAVE, DRAGONBREATH
	itemmon 13, XATU, TWISTEDSPOON
		moves SKY_ATTACK, PSYCHIC_M, HYPNOSIS, DREAM_EATER
	itemmon 13, OCTILLERY, CHARCOAL
		moves BLAST_BURN, HYDRO_PUMP, WILLOWISP, FIRE_BLAST
	itemmon 13, URSALUNA, LEFTOVERS
		moves BULK_UP, EARTHQUAKE, CRUNCH, THUNDER_FANG
	end_party

	end_list_items

GuitaristGroupHard:
	next_list_item ; GUITARIST (1) Fast Ship
	db "Clyde@", TRAINERTYPE_NORMAL
	mon 7, ELECTABUZZ
	end_party

	next_list_item ; GUITARIST (2) Vermilion City Gym
	db "Vincent@", TRAINERTYPE_NORMAL	
	mon 8, VOLBEAT
	mon 9, ILLUMISE
	end_party

	next_list_item ; GUITARIST (3) Mauville City Gym
	db "Kirk@", TRAINERTYPE_NORMAL
	mon 7, ELECTRIKE
	mon 7, VOLTORB2
	mon 9, HELECTRODE
	end_party

	next_list_item ; GUITARIST (4) Mauville City Gym
	db "Shawn@", TRAINERTYPE_NORMAL
	mon 9, MINUN
	mon 9, ELECTABUZZ
	mon 9, RAITORA
	end_party

	next_list_item ; GUITARIST (5) Route 103
	db "Marcos@", TRAINERTYPE_NORMAL
	mon 7, MINUN
	mon 7, PLUSLE
	end_party

	next_list_item ; GUITARIST (6) Route 110
	db "Joseph@", TRAINERTYPE_NORMAL
	mon 7, ELECTRODE
	mon 7, HELECTRODE
	end_party

	next_list_item ; GUITARIST (7) Route 119
	db "Fabian@", TRAINERTYPE_NORMAL
	mon 7, MANECTRIC
	mon 7, LINOONE
	end_party

	end_list_items

HikerGroupHard:
	next_list_item ; HIKER (1) Route 33
	db "Anthony@", TRAINERTYPE_NORMAL
	mon 6, GEODUDE
	mon 8, MACHOP
	end_party

	next_list_item ; HIKER (2) Union Cave - 1F
	db "Russell@", TRAINERTYPE_NORMAL
	mon 4, GRAVELER
	mon 6, SUDOWOODO
	mon 8, LAIRON
	end_party

	next_list_item ; HIKER (3) Union Cave - B1F
	db "Phillip@", TRAINERTYPE_NORMAL
	mon 3, GEODUDE
	mon 3, GEODUDE
	mon 5, GOLEM
	end_party

	next_list_item ; HIKER (4) Union Cave - B1F
	db "Leonard@", TRAINERTYPE_NORMAL
	mon 3, ARON
	mon 5, MAKUHITA
	end_party

	next_list_item ; HIKER (6) Route 42
	db "Benjamin@", TRAINERTYPE_NORMAL
	mon 4, DIGLETT
	mon 4, NOSEPASS
	mon 6, DUGTRIO
	end_party

	next_list_item ; HIKER (7) Route 45
	db "Erik@", TRAINERTYPE_NORMAL
	mon 4, MACHOP
	mon 7, GRAVELER
	mon 7, GRUMPIG
	end_party

	next_list_item ; HIKER (8) Route 45
	db "Michael@", TRAINERTYPE_NORMAL
	mon 3, GEODUDE
	mon 5, GRAVELER
	mon 5, GOLEM
	end_party

	next_list_item ; HIKER (9) Route 45
	db "Parry@", TRAINERTYPE_NORMAL
	mon 6, ONIX
	mon 5, PILOSWINE
	end_party

	next_list_item ; HIKER (10) Route 45
	db "Timothy@", TRAINERTYPE_MOVES
	mon 6, DIGLETT
		moves MAGNITUDE, DIG, SAND_ATTACK, SLASH
	mon 6, DUGTRIO
		moves MAGNITUDE, DIG, SAND_ATTACK, SLASH
	end_party

	next_list_item ; HIKER (11) Route 46
	db "Bailey@", TRAINERTYPE_NORMAL
	mon 3, GEODUDE
	mon 3, GEODUDE
	mon 4, GEODUDE
	mon 4, GEODUDE
	mon 5, GEODUDE
	end_party

	next_list_item ; HIKER (13) Route 9
	db "Tim@", TRAINERTYPE_NORMAL
	mon 3, GRAVELER
	mon 5, GRAVELER
	mon 6, GRAVELER
	end_party

	next_list_item ; HIKER (14) S.S. Aqua
	db "Noland@", TRAINERTYPE_NORMAL
	mon 4, SANDSLASH
	mon 6, GOLEM
	end_party

	next_list_item ; HIKER (15) Route 9
	db "Sidney@", TRAINERTYPE_NORMAL
	mon 6, DUGTRIO
	mon 4, ONIX
	end_party

	next_list_item ; HIKER (16) Route 13
	db "Kenny@", TRAINERTYPE_NORMAL
	mon 3, SANDSLASH
	mon 5, GRAVELER
	mon 6, GOLEM
	mon 4, GRAVELER
	end_party

	next_list_item ; HIKER (17) Route 10
	db "Jim@", TRAINERTYPE_NORMAL
	mon 8, MACHAMP
	end_party

	next_list_item ; HIKER (18) Union Cave - 1F
	db "Daniel@", TRAINERTYPE_NORMAL
	mon 6, ONIX
	mon 6, SMOOCHUM
	mon 6, SABLEYE
	end_party

	next_list_item ; HIKER (23) Rustboro Gym
	db "Marc@", TRAINERTYPE_NORMAL
	mon 7, LILEEP
	mon 7, ANORITH
	end_party

	next_list_item ; HIKER (24) Route 116
	db "Clark@", TRAINERTYPE_NORMAL
	mon 9, AGEODUDE
	end_party

	next_list_item ; HIKER (25) Route 116
	db "Devan@", TRAINERTYPE_NORMAL
	mon 7, GEODUDE
	mon 7, DUNSPARCE
	end_party

	next_list_item ; HIKER (26) Lavaridge Gym
	db "Eli@", TRAINERTYPE_NORMAL
	mon 8, FLAREON
	mon 8, SOLROCK
	end_party

	next_list_item ; HIKER (27) Mount Moon
	db "Marcos@", TRAINERTYPE_NORMAL
	mon 5, GEODUDE
	mon 5, SANDSHREW
	mon 5, LUNATONE
	end_party

	next_list_item ; HIKER (28) Route 112
	db "Trent@", TRAINERTYPE_NORMAL
	mon 5, GEODUDE
	mon 6, GRAVELER
	mon 7, AGOLEM
	end_party

	next_list_item ; HIKER (29) Route 112
	db "Brice@", TRAINERTYPE_NORMAL
	mon 5, CAMERUPT
	mon 6, MACHOKE
	mon 7, NOSEPASS
	end_party

	next_list_item ; HIKER (30) Route 114
	db "Lucas@", TRAINERTYPE_NORMAL
	mon 7, ONIX
	mon 7, MACHAMP
	mon 8, TAUROS
	end_party

	next_list_item ; HIKER (31) Route 114
	db "Lenny@", TRAINERTYPE_NORMAL
	mon 8, MAROWAK
	mon 7, PILOSWINE
	mon 8, DONPHAN
	end_party

	end_list_items

BikerGroupHard:
	next_list_item ; BIKER (1) Route 8
	db "Dwayne@", TRAINERTYPE_NORMAL
	mon 5, KOFFING
	mon 6, KOFFING
	mon 7, KOFFING
	mon 8, KOFFING
	end_party

	next_list_item ; BIKER (2) Route 8
	db "Harris@", TRAINERTYPE_NORMAL
	mon 7, FLAREON
	end_party

	next_list_item ; BIKER (3) Route 8
	db "Zeke@", TRAINERTYPE_NORMAL
	mon 6, KOFFING
	mon 6, KOFFING
	end_party

	next_list_item ; BIKER (4) Route 17
	db "Charles@", TRAINERTYPE_NORMAL
	mon 5, KOFFING
	mon 5, CHARMELEON
	mon 5, WEEZING
	end_party

	next_list_item ; BIKER (5) Route 17
	db "Riley@", TRAINERTYPE_NORMAL
	mon 7, WEEZING
	end_party

	next_list_item ; BIKER (6) Route 17
	db "Joel@", TRAINERTYPE_NORMAL
	mon 5, MAGMAR
	mon 5, MAGMAR
	end_party

	next_list_item ; BIKER (7) Route 17
	db "Glenn@", TRAINERTYPE_NORMAL
	mon 3, KOFFING
	mon 5, MAGMAR
	mon 7, WEEZING
	end_party

	end_list_items

BlaineGroupHard:
	next_list_item ; BLAINE (1)
	db "Blaine@", TRAINERTYPE_MOVES
	mon 7, MAGCARGO
		moves ROCK_SLIDE, FIRE_BLAST, FISSURE, CURSE
	mon 9, MAGMAR
		moves THUNDERPUNCH, FIRE_PUNCH, SUNNY_DAY, FLAMETHROWER
	mon 10, RAPIDASH
		moves SUNNY_DAY, MEGAHORN, SOLARBEAM, FIRE_BLAST
	end_party
	
	next_list_item ; BLAINE (2)
	db "Blaine@", TRAINERTYPE_MOVES
	mon 12, NINETALES
		moves SUNNY_DAY, SHADOW_BALL, SOLARBEAM, FIRE_BLAST
	mon 10, MAGCARGO
		moves ROCK_SLIDE, FIRE_BLAST, FISSURE, EARTHQUAKE
	mon 12, RAPIDASH
		moves SUNNY_DAY, MEGAHORN, SOLARBEAM, FIRE_BLAST
	mon 12, MAGMORTAR
		moves THUNDERPUNCH, SOLARBEAM, SUNNY_DAY, FLAMETHROWER
	mon 15, MOLTRES
		moves SUNNY_DAY, SKY_ATTACK, SOLARBEAM, FIRE_BLAST
	end_party
	
	next_list_item ; BLAINE (3)
	db "Blaine@", TRAINERTYPE_ITEM_MOVES	
	itemmon 10, NINETALES, LEFTOVERS
		moves SUNNY_DAY, SHADOW_BALL, SOLARBEAM, FIRE_BLAST
	itemmon 10, MAGCARGO, LEFTOVERS
		moves ROCK_SLIDE, FIRE_BLAST, FISSURE, COSMIC_POWER
	itemmon 10, FLAREON, CHARCOAL
		moves FLAME_WHEEL, DIG, TAKE_DOWN, BULK_UP
	itemmon 11, MAGMORTAR, CHARCOAL
		moves THUNDERPUNCH, ERUPTION, MACH_PUNCH, BRICK_BREAK
	itemmon 11, RAPIDASH, CHARCOAL
		moves SUNNY_DAY, FLAME_WHEEL, SOLARBEAM, FIRE_BLAST
	itemmon 13, MOLTRES, FOCUS_BAND
		moves PURSUIT, SKY_ATTACK, SOLARBEAM, FIRE_BLAST
	end_party

	end_list_items

BurglarGroupHard:
	next_list_item ; BURGLAR (1) Goldenrod City - Underground Warehouse
	db "Duncan@", TRAINERTYPE_NORMAL
	mon 3, GROWLITHE
	mon 5, MAGMAR
	mon 6, KADABRA
	end_party

	next_list_item ; BURGLAR (2) Goldenrod City - Underground Warehouse
	db "Eddie@", TRAINERTYPE_MOVES
	mon 6, GROWLITHE
		moves ROAR, EMBER, LEER, TAKE_DOWN
	mon 4, KOFFING
		moves TACKLE, SMOG, SLUDGE, SMOKESCREEN
	end_party

	next_list_item ; BURGLAR (3) Fast Ship
	db "Corey@", TRAINERTYPE_NORMAL
	mon 5, KOFFING
	mon 8, MAGMAR
	mon 5, KOFFING
	mon 3, KOFFING
	end_party

	end_list_items

FirebreatherGroupHard:
	next_list_item ; FIREBREATHER (1) Route 03
	db "Otis@", TRAINERTYPE_NORMAL
	mon 3, MAGBY
	mon 3, KOFFING
	end_party

	next_list_item ; FIREBREATHER (2) Route 03
	db "Burt@", TRAINERTYPE_NORMAL
	mon 3, KOFFING
	mon 4, SLUGMA
	end_party

	next_list_item ; FIREBREATHER (3) Union Cave - 1F
	db "Bill@", TRAINERTYPE_NORMAL
	mon 6, KOFFING
	mon 6, TORCHIC
	end_party

	next_list_item ; FIREBREATHER (4) Route 35
	db "Walt@", TRAINERTYPE_NORMAL
	mon 4, MAGMAR
	mon 6, MAGMAR
	end_party

	next_list_item ; FIREBREATHER (5) Union Cave - 1F
	db "Ray@", TRAINERTYPE_NORMAL
	mon 7, VULPIX
	mon 7, PONYTA
	end_party

	next_list_item ; FIREBREATHER (6) S.S. Aqua
	db "Lyle@", TRAINERTYPE_NORMAL
	mon 6, KOFFING
	mon 8, FLAREON
	mon 6, KOFFING
	end_party

	next_list_item ; FIREBREATHER (7) Lavaridge Gym
	db "Jeff@", TRAINERTYPE_NORMAL
	mon 7, SLUGMA
	mon 8, QUILAVA
	mon 8, KOFFING
	end_party

	next_list_item ; FIREBREATHER (8) Lavaridge Gym
	db "Jace@", TRAINERTYPE_NORMAL
	mon 7, PONYTA
	mon 7, MAGBY
	mon 8, CHARMELEON
	end_party

	next_list_item ; FIREBREATHER (9) Lavaridge Gym
	db "Cole@", TRAINERTYPE_NORMAL
	mon 6, MAGBY
	mon 8, VULPIX
	mon 8, NUMEL
	end_party

	next_list_item ; FIREBREATHER (10) Lavaridge Gym
	db "Axle@", TRAINERTYPE_NORMAL
	mon 8, MAGBY
	mon 9, VULPIX
	mon 10, COMBUSKEN
	end_party

	next_list_item ; FIREBREATHER (11) Lavaridge Gym
	db "Keegan@", TRAINERTYPE_NORMAL
	mon 7, SUNKERN
	mon 9, CYNDAQUIL2
	mon 9, BORUBEA
	end_party

	next_list_item ; FIREBREATHER (12) Route 111
	db "Hayden@", TRAINERTYPE_NORMAL
	mon 7, KANGASKHAN
	mon 8, SHUCKLE
	mon 9, VOLBEAT
	end_party

	next_list_item ; FIREBREATHER (13) Route 112
	db "Bryan@", TRAINERTYPE_NORMAL
	mon 7, MAGCARGO
	mon 6, NUMEL
	mon 6, QUILAVA
	end_party

	next_list_item ; FIREBREATHER (14) Route 114
	db "Berny@", TRAINERTYPE_NORMAL
	mon 5, MAGMAR
	mon 6, QUILAVA2
	mon 7, PELIPPER
	end_party

	next_list_item ; FIREBREATHER (15) Route 119
	db "Dayton@", TRAINERTYPE_NORMAL
	mon 5, MAGCARGO
	mon 6, CAMERUPT
	mon 7, SEAKING
	end_party

	end_list_items

JugglerGroupHard:
	next_list_item ; JUGGLER (1) Route 35
	db "Irwin@", TRAINERTYPE_NORMAL
	mon 2, VOLTORB
	mon 4, VOLTORB
	mon 6, VOLTORB
	mon 8, VOLTORB2
	end_party

	next_list_item ; JUGGLER (2) S.S. Aqua
	db "Fritz@", TRAINERTYPE_NORMAL
	mon 6, MR__MIME
	mon 6, MAGMAR
	mon 6, MACHOKE
	end_party

	next_list_item ; JUGGLER (3) Vermilion City Gym
	db "Horton@", TRAINERTYPE_NORMAL
	mon 8, VOLTORB
	mon 8, VOLTORB2
	mon 8, HVOLTORB
	end_party

	end_list_items

BlackbeltGroupHard:
	next_list_item ; BLACKBELT_T (1) Route 45
	db "Kenji@", TRAINERTYPE_NORMAL
	mon 7, MEDICHAM
	mon 7, HITMONLEE
	mon 4, ONIX
	mon 7, MACHOKE
	end_party

	next_list_item ; BLACKBELT_T (2) Cianwood City Gym
	db "Yoshi@", TRAINERTYPE_NORMAL
	mon 7, HITMONLEE
	mon 7, MEDITITE
	end_party

	next_list_item ; BLACKBELT_T (4) Cianwood City Gym
	db "Lao@", TRAINERTYPE_NORMAL
	mon 7, HITMONCHAN
	mon 7, MAKUHITA
	end_party

	next_list_item ; BLACKBELT_T (5) Cianwood City Gym
	db "Nob@", TRAINERTYPE_NORMAL
	mon 5, TAUROS
	mon 7, MACHOKE
	end_party

	next_list_item ; BLACKBELT_T (6) Mt. Mortar
	db "Kiyo@", TRAINERTYPE_NORMAL
	mon 10, HITMONLEE
	mon 10, HITMONCHAN
	mon 10, HITMONTOP
	mon 10, POLIWRATH
	mon 10, MEDICHAM
	mon 13, GALLADE
	end_party

	next_list_item ; BLACKBELT_T (7) Cianwood City Gym
	db "Lung@", TRAINERTYPE_NORMAL
	mon 5, MANKEY
	mon 5, FURRET
	mon 7, PRIMEAPE
	end_party

	next_list_item ; BLACKBELT_T (9) Fast Ship
	db "Wai@", TRAINERTYPE_NORMAL
	mon 2, MACHOKE
	mon 4, MACHOKE
	mon 6, MACHOKE
	end_party

	next_list_item ; BLACKBELT_T (10) Dewford City Gym
	db "Takao@", TRAINERTYPE_NORMAL
	mon 7, MACHOKE
	mon 7, TYROGUE
	end_party

	next_list_item ; BLACKBELT_T (11) Dewford City Gym
	db "Cristian@", TRAINERTYPE_NORMAL
	mon 7, MACHOKE
	mon 7, TYROGUE
	end_party

	next_list_item ; BLACKBELT_T (12) Route 103
	db "Marcos@", TRAINERTYPE_NORMAL
	mon 7, TYROGUE
	mon 7, COMBUSKEN
	end_party

	end_list_items

ExecutiveMGroupHard:
	next_list_item ; EXECUTIVEM (1) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_NORMAL
	mon 8, MIGHTYENA
	mon 8, WEEZING
	mon 10, SHIFTRY
	mon 8, DUSTOX
	mon 8, MANECTRIC
	mon 12, HOUNDOOM
	end_party

	next_list_item ; EXECUTIVEM (2) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_NORMAL
	mon 10, CROBAT
	mon 10, AGGRON
	mon 10, HARIYAMA
	end_party

	next_list_item ; EXECUTIVEM (3) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_NORMAL
	mon 7, ELECTRODE
	mon 7, MANTINE
	mon 8, MAGCARGO
	mon 8, GIRAFARIG
	mon 8, QUAGSIRE
	mon 9, SEVIPER
	end_party

	next_list_item ; EXECUTIVEM (4) Team Rocket Hideout - B3F
	db "Executive@", TRAINERTYPE_NORMAL
	mon 5, GOLBAT
	mon 9, RATICATE
	mon 7, SWALOT
	mon 7, NOCTOWL
	mon 11, HONCHKROW
	end_party

	next_list_item ; EXECUTIVEM (5) Goldenrod City - Radio Tower Mega
	db "Executive@", TRAINERTYPE_ITEM_MOVES	
	itemmon 15, HOUNDOOMX, LEFTOVERS
		moves FIRE_BLAST, SNARL, AGILITY, SHOCKSLAM
	end_party

	end_list_items

PsychicGroupHard:
	next_list_item ; PSYCHIC_T (1) Ruins of Alph
	db "Nathan@", TRAINERTYPE_NORMAL
	mon 6, GIRAFARIG
	mon 7, UNOWN
	mon 7, UNOWN
	mon 7, UNOWN
	end_party

	next_list_item; PSYCHIC_T (2) Saffron City Gym
	db "Franklin@", TRAINERTYPE_RANDOM, 3, PSYCHIC_EASY	
	end_party

	next_list_item ; PSYCHIC_T (3) Route 11
	db "Herman@", TRAINERTYPE_NORMAL
	mon 6, EXEGGCUTE
	mon 6, EXEGGCUTE
	mon 7, EXEGGUTOR
	end_party

	next_list_item ; PSYCHIC_T (4) Route 11
	db "Fidel@", TRAINERTYPE_NORMAL
	mon 6, XATU
	end_party

	next_list_item ; PSYCHIC_T (5) Route 37
	db "Greg@", TRAINERTYPE_MOVES
	mon 7, DROWZEE
		moves HYPNOSIS, DISABLE, DREAM_EATER, NO_MOVE
	end_party

	next_list_item ; PSYCHIC_T (6) Route 39
	db "Norman@", TRAINERTYPE_MOVES
	mon 4, SLOWPOKE
		moves TACKLE, GROWL, WATER_GUN, NO_MOVE
	mon 7, SLOWPOKE
		moves CURSE, BODY_SLAM, WATER_GUN, CONFUSION
	end_party

	next_list_item ; PSYCHIC_T (7) Route 36
	db "Mark@", TRAINERTYPE_MOVES
	mon 1, ABRA
		moves TELEPORT, FLASH, NO_MOVE, NO_MOVE
	mon 4, ABRA
		moves TELEPORT, FLASH, NO_MOVE, NO_MOVE
	mon 9, KADABRA
		moves TELEPORT, KINESIS, CONFUSION, NO_MOVE
	end_party

	next_list_item ; PSYCHIC_T (8) Route 44
	db "Phil@", TRAINERTYPE_MOVES
	mon 4, NATU
		moves LEER, NIGHT_SHADE, FUTURE_SIGHT, CONFUSE_RAY
	mon 6, KADABRA
		moves DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	end_party

	next_list_item ; PSYCHIC_T (9) Route 26
	db "Richard@", TRAINERTYPE_NORMAL
	mon 7, ESPEON
	end_party

	next_list_item ; PSYCHIC_T (10) Route 27
	db "Gilbert@", TRAINERTYPE_NORMAL
	mon 7, STARMIE
	mon 7, EXEGGCUTE
	mon 7, UNOWN
	mon 7, NOCTOWL
	mon 9, GIRAFARIG
	end_party

	next_list_item; PSYCHIC_T (11) Saffron City Gym
	db "Jared@", TRAINERTYPE_RANDOM, 3, PSYCHIC_EASY
	end_party

	next_list_item ; PSYCHIC_T (12) Fast Ship
	db "Rodney@", TRAINERTYPE_NORMAL
	mon 5, DROWZEE
	mon 8, HYPNO
	end_party

	next_list_item ; PSYCHIC_T (13) Route 110
	db "Edward@", TRAINERTYPE_NORMAL
	mon 9, MR__MIME
	mon 9, JYNX
	end_party

	next_list_item ; PSYCHIC_T (14) Mossdeep Gym
	db "Preston@", TRAINERTYPE_NORMAL
	mon 8, KADABRA
	mon 9, KIRLIA
	end_party

	next_list_item ; PSYCHIC_T (15) Mossdeep Gym
	db "Blake@", TRAINERTYPE_NORMAL
	mon 8, ARAICHU
	mon 9, VENOMOTH
	end_party

	next_list_item ; PSYCHIC_T (16) Mossdeep Gym
	db "Nicholas@", TRAINERTYPE_NORMAL
	mon 9, WOBBUFFET
	mon 9, UNOWN
	end_party

	next_list_item ; PSYCHIC_T (17) Mossdeep Gym
	db "Virgil@", TRAINERTYPE_NORMAL
	mon 8, PORYGON2
	mon 9, HYPNO
	end_party

	next_list_item; PSYCHIC_T (18) Saffron City Gym
	db "Franklin@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	end_party

	next_list_item; PSYCHIC_T (11) Saffron City Gym
	db "Jared@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	end_party

	end_list_items

PicnickerGroupHard:
	next_list_item ; PICNICKER (1) Route 32
	db "Liz@", TRAINERTYPE_NORMAL
	mon 5, NIDORAN_F
	mon 5, NIDORINA
	end_party

	next_list_item ; PICNICKER (2) Route 34
	db "Gina@", TRAINERTYPE_NORMAL
	mon 3, HOPPIP
	mon 3, ROSELIA
	mon 5, BULBASAUR
	end_party

	next_list_item ; PICNICKER (3) Route 35
	db "Brooke@", TRAINERTYPE_MOVES
	mon 6, PIKACHU
		moves THUNDERSHOCK, GROWL, QUICK_ATTACK, DOUBLE_TEAM
	end_party

	next_list_item ; PICNICKER (4) Route 35
	db "Kim@", TRAINERTYPE_NORMAL
	mon 5, VULPIX
	end_party

	next_list_item ; PICNICKER (5) Fuschia City Gym
	db "Cindy@", TRAINERTYPE_NORMAL
	mon 11, NIDOQUEEN
	end_party

	next_list_item ; PICNICKER (6) Route 04
	db "Hope@", TRAINERTYPE_NORMAL
	mon 7, FLAAFFY
	end_party

	next_list_item ; PICNICKER (7) Route 04
	db "Sharon@", TRAINERTYPE_NORMAL	
	mon 5, PONYTA
	mon 7, FURRET
	end_party

	next_list_item ; PICNICKER (8) S.S. Aqua
	db "Debra@", TRAINERTYPE_NORMAL
	mon 7, SEAKING
	end_party

	next_list_item ; PICNICKER (9) Route 46
	db "Erin@", TRAINERTYPE_NORMAL
	mon 6, VULPIX
	mon 6, PONYTA
	end_party

	next_list_item ; PICNICKER (10) Route 9
	db "Heidi@", TRAINERTYPE_NORMAL
	mon 5, SKIPLOOM
	mon 5, SKIPLOOM
	end_party

	next_list_item ; PICNICKER (11) Route 9
	db "Edna@", TRAINERTYPE_NORMAL
	mon 2, NIDORINA
	mon 6, RAICHU
	end_party

	next_list_item ; PICNICKER (12) Route 43
	db "Tiffany@", TRAINERTYPE_MOVES
	mon 12, CLEFABLE
		moves ENCORE, SING, MOONBLAST, MINIMIZE
	end_party

	next_list_item ; PICNICKER (13) Celadon City Gym
	db "Tanya@", TRAINERTYPE_NORMAL
	mon 7, EXEGGUTOR
	end_party

	next_list_item ; PICNICKER (14) Route 117
	db "Maria@", TRAINERTYPE_NORMAL
	mon 10, DELCATTY
	end_party

	next_list_item ; PICNICKER (15) Route 117
	db "Melina@", TRAINERTYPE_NORMAL
	mon 9, LINOONE
	mon 9, SWELLOW
	end_party

	next_list_item ; PICNICKER (16) Route 111
	db "Celina@", TRAINERTYPE_NORMAL
	mon 7, NIDOQUEEN
	mon 5, MILTANK
	end_party

	next_list_item ; PICNICKER (17) Route 111
	db "Bianca@", TRAINERTYPE_NORMAL
	mon 7, MEGANIUM
	mon 8, AMAROWAK
	end_party

	next_list_item ; PICNICKER (18) Route 111
	db "Gabby@", TRAINERTYPE_NORMAL
	mon 7, LINOONE
	mon 7, PINSIR
	end_party

	next_list_item ; PICNICKER (19) Route 111
	db "Irene@", TRAINERTYPE_NORMAL
	mon 7, MISDREAVUS
	mon 7, PILOSWINE
	end_party

	next_list_item ; PICNICKER (20) Fortree Gym
	db "Ashley@", TRAINERTYPE_NORMAL
	mon 9, SWABLU
	mon 9, DELIBIRD
	end_party

	next_list_item ; PICNICKER (21) Route 112
	db "Carol@", TRAINERTYPE_NORMAL
	mon 6, ALTARIA
	mon 7, LUDICOLO
	end_party

	next_list_item ; PICNICKER (22) Route 113
	db "Maddie@", TRAINERTYPE_NORMAL
	mon 6, ALTARIA
	mon 7, CAMERUPT
	end_party

	next_list_item ; PICNICKER (23) Route 113
	db "Sophie@", TRAINERTYPE_NORMAL
	mon 6, AZUMARILL
	mon 7, LUDICOLO
	end_party

	next_list_item ; PICNICKER (24) Route 114
	db "Charlote@", TRAINERTYPE_NORMAL
	mon 7, IVYSAUR
	mon 8, MEGANIUM
	end_party

	next_list_item ; PICNICKER (25) Route 114
	db "Nancy@", TRAINERTYPE_NORMAL
	mon 6, VOLBEAT
	mon 8, ROSELIA
	end_party

	next_list_item ; PICNICKER (26) Route 114
	db "Angelina@", TRAINERTYPE_NORMAL
	mon 6, FLAAFFY
	mon 8, ARAICHU
	end_party

	next_list_item ; PICNICKER (27) Lavaridge Desert
	db "Heidi@", TRAINERTYPE_NORMAL
	mon 6, CLAYDOL
	mon 7, SANDSLASH
	end_party

	next_list_item ; PICNICKER (28) Lavaridge Desert
	db "Becky@", TRAINERTYPE_NORMAL
	mon 7, NIDOQUEEN
	mon 6, AZUMARILL
	end_party

	next_list_item ; PICNICKER (29) Lavaridge Desert
	db "Celia@", TRAINERTYPE_NORMAL
	mon 7, AMAROWAK
	mon 7, MAROWAK
	end_party

	next_list_item ; PICNICKER (30) Pewter City Gym
	db "Amara@", TRAINERTYPE_NORMAL	
	mon 2, NIDORAN_F
	mon 3, GEODUDE
	end_party

	end_list_items

CamperGroupHard:
	next_list_item ; CAMPER (1) Route 32
	db "Roland@", TRAINERTYPE_NORMAL
	mon 3, NIDORAN_M
	mon 3, SENTRET
	end_party

	next_list_item ; CAMPER (2) Route 34
	db "Todd@", TRAINERTYPE_NORMAL
	mon 4, GOLDUCK
	mon 4, RALTS
	end_party

	next_list_item ; CAMPER (3) Route 35
	db "Ivan@", TRAINERTYPE_NORMAL
	mon 4, DIGLETT
	mon 4, ZUBAT
	mon 7, DIGLETT
	end_party

	next_list_item ; CAMPER (4) Route 35
	db "Elliot@", TRAINERTYPE_NORMAL
	mon 3, SANDSHREW
	mon 5, MARILL
	end_party

	next_list_item ; CAMPER (5) Fuschia City Gym
	db "Barry@", TRAINERTYPE_NORMAL
	mon 11, NIDOKING
	end_party

	next_list_item ; CAMPER (6) Route 25
	db "Lloyd@", TRAINERTYPE_NORMAL
	mon 6, NIDORINO
	end_party

	next_list_item ; CAMPER (7) Route 9
	db "Dean@", TRAINERTYPE_NORMAL
	mon 6, GOLDUCK
	mon 4, SANDSLASH
	end_party

	next_list_item ; CAMPER (8) Route 9
	db "Sid@", TRAINERTYPE_NORMAL
	mon 2, DUGTRIO
	mon 7, PRIMEAPE
	mon 7, POLIWRATH
	end_party

	next_list_item ; CAMPER (9) Route 46
	db "Ted@", TRAINERTYPE_NORMAL
	mon 7, MANKEY
	end_party

	next_list_item ; CAMPER (10) Pewter City Gym
	db "Jerry@", TRAINERTYPE_NORMAL
	mon 2, SANDSHREW
	mon 3, KABUTO
	end_party

	next_list_item ; CAMPER (11) Route 43
	db "Spencer@", TRAINERTYPE_NORMAL
	mon 3, SANDSHREW
	mon 5, SANDSLASH
	mon 4, ZUBAT
	end_party

	next_list_item ; CAMPER (12) Route 45
	db "Quentin@", TRAINERTYPE_NORMAL
	mon 2, FEAROW
	mon 3, PRIMEAPE
	mon 5, TAUROS
	end_party

	next_list_item ; CAMPER (13) Route 104
	db "Winston@", TRAINERTYPE_NORMAL
	mon 3, LINOONE
	end_party

	next_list_item ; CAMPER (14) Route 117
	db "Dylan@", TRAINERTYPE_NORMAL
	mon 7, DODRIO
	mon 7, CRAWDAUNT
	end_party

	next_list_item ; CAMPER (15) Route 108
	db "Dylan@", TRAINERTYPE_NORMAL
	mon 7, DONPHAN
	mon 7, GIRAFARIG
	mon 8, OCTILLERY
	end_party

	next_list_item ; CAMPER (16) Route 111
	db "Tyron@", TRAINERTYPE_NORMAL
	mon 7, TOGETIC
	mon 8, MURKROW
	end_party

	next_list_item ; CAMPER (17) Route 111
	db "Travis@", TRAINERTYPE_NORMAL
	mon 7, GLIGAR
	mon 9, CACTURNE
	end_party

	next_list_item ; CAMPER (18) Fortree Gym
	db "Flint@", TRAINERTYPE_NORMAL
	mon 9, CROBAT
	mon 9, XATU
	end_party

	next_list_item ; CAMPER (19) Route 112
	db "Larry@", TRAINERTYPE_NORMAL
	mon 7, SHIFTRY
	mon 6, SWELLOW
	end_party

	next_list_item ; CAMPER (20) Route 113
	db "Jaylen@", TRAINERTYPE_NORMAL
	mon 5, VIBRAVA
	mon 6, RATICATE
	end_party

	next_list_item ; CAMPER (21) Route 113
	db "Lung@", TRAINERTYPE_NORMAL
	mon 5, WEEZING
	mon 6, MAGMAR
	end_party

	next_list_item ; CAMPER (22) Route 113
	db "Lawry@", TRAINERTYPE_NORMAL
	mon 5, CLAYDOL
	mon 6, SANDSLASH
	end_party

	next_list_item ; CAMPER (23) Route 114
	db "Shane@", TRAINERTYPE_NORMAL
	mon 7, URSARING
	mon 7, ASANDSLASH
	end_party

	next_list_item ; CAMPER (24) Lavaridge Desert
	db "Beau@", TRAINERTYPE_NORMAL	
	mon 7, VIBRAVA
	mon 6, DUGTRIO
	end_party

	next_list_item ; CAMPER (25) Lavaridge Desert
	db "Drew@", TRAINERTYPE_NORMAL	
	mon 6, SUDOWOODO
	mon 7, NIDOKING
	end_party

	next_list_item ; CAMPER (26) Lavaridge Desert
	db "Branden@", TRAINERTYPE_NORMAL	
	mon 7, SKARMORY
	mon 7, STEELIX
	end_party

	next_list_item ; CAMPER (27) Pewter City Gym
	db "Liam@", TRAINERTYPE_NORMAL	
	mon 2, NIDORAN_M
	mon 3, AGEODUDE
	end_party

	end_list_items

ExecutiveFGroupHard:
	next_list_item ; EXECUTIVEF (1) Goldenrod City - Radio Tower
	db "Ariana@", TRAINERTYPE_MOVES
	mon 9, ARBOK
		moves CRUNCH, ICE_FANG, FIRE_FANG, GLARE
	mon 8, HYPNO
		moves POISON_FANG, PSYCHIC_M, HEX, HYPNOSIS
	mon 8, AMUK
		moves SLUDGE_BOMB, PURSUIT, STUN_SPORE, RECOVER
	mon 9, VILEPLUME
		moves GIGA_DRAIN, TOXIC, VENOSHOCK, MOONLIGHT
	mon 10, HONCHKROW
		moves DRILL_PECK, PURSUIT, HAZE, NIGHT_SHADE
	end_party

	next_list_item ; EXECUTIVEF (2) Team Rocket Mahogany
	db "Ariana@", TRAINERTYPE_MOVES
	mon 8, ARBOK
		moves POISON_FANG, ICE_FANG, FIRE_FANG, FAINT_ATTACK
	mon 7, DROWZEE
		moves POISON_FANG, PSYBEAM, SHADOW_PUNCH, FAINT_ATTACK
	mon 7, GRIMER
		moves POISON_FANG, MUD_SLAP, FIRE_FANG, MAGNITUDE
	mon 8, GLOOM
		moves MEGA_DRAIN, POISONPOWDER, SLEEP_POWDER, SLUDGE
	mon 10, MURKROW
		moves WING_ATTACK, PURSUIT, HAZE, MUD_SLAP
	end_party

	next_list_item ; EXECUTIVEF (3) Safari Zone Executive
	db "Executive@", TRAINERTYPE_NORMAL
	mon 9, RHYDON
	mon 9, VILEPLUME
	mon 9, EXEGGUTOR
	mon 9, DYNABEA
	mon 9, FERALIGATR2
	mon 12, ABSOLX
	end_party

	next_list_item ; EXECUTIVEF (4) Mauville Game Corner Executive
	db "Jane@", TRAINERTYPE_NORMAL
	mon 7, MURKROW
	mon 8, IVYSAUR
	mon 9, YANMA
	mon 9, GOREBYSS
	mon 12, OCTILLERY
	end_party

	next_list_item ; EXECUTIVEF (5) Desert Shrine Jane
	db "Jane@", TRAINERTYPE_NORMAL
	mon 8, HONCHKROW
	mon 9, VENUSAUR
	mon 9, YANMEGA
	mon 9, GOREBYSS
	mon 11, OCTILLERY
	mon 12, LATIAS
	end_party

	end_list_items

SageGroupHard:
	next_list_item ; SAGE (1) Sprout Tower - 1F
	db "Chow@", TRAINERTYPE_NORMAL
	mon 3, BELLSPROUT
	mon 3, BULBASAUR
	mon 3, CHIKORITA
	end_party

	next_list_item ; SAGE (2) Sprout Tower - 2F
	db "Nico@", TRAINERTYPE_NORMAL
	mon 3, BELLSPROUT
	mon 3, CHIKORITA
	mon 3, BELLSPROUT
	end_party

	next_list_item ; SAGE (3) Sprout Tower - 3F
	db "Jin@", TRAINERTYPE_NORMAL
	mon 6, BELLSPROUT
	end_party

	next_list_item ; SAGE (4) Sprout Tower - 3F
	db "Troy@", TRAINERTYPE_NORMAL
	mon 3, BELLSPROUT
	mon 5, HOOTHOOT
	end_party

	next_list_item ; SAGE (5) Ecruteak City Gym
	db "Jeffrey@", TRAINERTYPE_NORMAL
	mon 7, HAUNTER
	end_party

	next_list_item ; SAGE (6) Ecruteak City Gym
	db "Ping@", TRAINERTYPE_NORMAL
	mon 7, BELLSPROUT
	mon 7, CUBONE
	mon 7, VULPIX
	mon 7, GASTLY
	end_party

	next_list_item ; SAGE (7) Sprout Tower - 2F
	db "Edmond@", TRAINERTYPE_NORMAL
	mon 3, BELLSPROUT
	mon 3, HOPPIP
	mon 4, BELLSPROUT
	end_party

	next_list_item ; SAGE (8) Sprout Tower - 3F
	db "Neal@", TRAINERTYPE_NORMAL
	mon 7, BELLSPROUT
	end_party

	next_list_item ; SAGE (9) Sprout Tower - 3F
	db "Li@", TRAINERTYPE_NORMAL
	mon 4, BELLSPROUT
	mon 4, SPINARAK
	mon 5, BELLSPROUT
	mon 7, HOOTHOOT
	end_party

	next_list_item ; SAGE (10) Tin Tower 1F
	db "Gaku@", TRAINERTYPE_NORMAL
	mon 7, NOCTOWL
	mon 7, FLAREON
	end_party

	next_list_item ; SAGE (11) Tin Tower 1F
	db "Masa@", TRAINERTYPE_NORMAL
	mon 7, NOCTOWL
	mon 7, JOLTEON
	end_party

	next_list_item ; SAGE (12) Tin Tower 1F
	db "Koji@", TRAINERTYPE_NORMAL
	mon 7, NOCTOWL
	mon 7, VAPOREON
	end_party

	end_list_items

MediumGroupHard:
	next_list_item ; MEDIUM (1) Ecruteak City Gym
	db "Martha@", TRAINERTYPE_NORMAL
	mon 5, GASTLY
	mon 7, HAUNTER
	mon 7, UNOWN
	end_party

	next_list_item ; MEDIUM (2) Ecruteak City Gym
	db "Grace@", TRAINERTYPE_NORMAL
	mon 7, HAUNTER
	mon 7, HAUNTER
	end_party

	next_list_item; MEDIUM (3) Saffron City Gym
	db "Rebecca@", TRAINERTYPE_RANDOM, 3, PSYCHIC_EASY
	end_party

	next_list_item; MEDIUM (4) Saffron City Gym
	db "Doris@", TRAINERTYPE_RANDOM, 3, PSYCHIC_EASY
	end_party

	next_list_item ; MEDIUM (5) Route 117
	db "Brandi@", TRAINERTYPE_NORMAL
	mon 7, KIRLIA
	mon 8, GRUMPIG
	mon 8, XATU
	end_party

	next_list_item; MEDIUM (6) Saffron City Gym
	db "Rebecca@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	end_party

	next_list_item; MEDIUM (7) Saffron City Gym
	db "Doris@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	end_party

	end_list_items

BoarderGroupHard:
	next_list_item ; BOARDER (1) Mahogany Town Gym
	db "Ronald@", TRAINERTYPE_NORMAL
	mon 7, SEEL
	mon 7, DEWGONG
	mon 7, DELIBIRD
	end_party

	next_list_item ; BOARDER (2) Mahogany Town Gym
	db "Brad@", TRAINERTYPE_NORMAL
	mon 7, SWINUB
	mon 7, SWINUB
	end_party

	next_list_item ; BOARDER (3) Mahogany Town Gym
	db "Douglas@", TRAINERTYPE_NORMAL
	mon 7, SHELLDER
	mon 7, CLOYSTER
	mon 7, AZUMARILL
	end_party

	end_list_items

PokefanMGroupHard:
	next_list_item ; POKEFANM (1) National Park
	db "William@", TRAINERTYPE_NORMAL
	mon 4, RAICHU
	end_party

	next_list_item ; POKEFANM (2) Route 39
	db "Derek@", TRAINERTYPE_NORMAL
	mon 7, PIKACHU
	end_party

	next_list_item ; POKEFANM (3) Route 10
	db "Robert@", TRAINERTYPE_NORMAL
	mon 6, QUAGSIRE
	end_party

	next_list_item ; POKEFANM (4) Route 13
	db "Joshua@", TRAINERTYPE_NORMAL
	mon 3, PIKACHU
	mon 3, PIKACHU
	mon 4, PIKACHU
	mon 5, PIKACHU
	mon 5, PIKACHU
	mon 5, PIKACHU
	end_party

	next_list_item ; POKEFANM (5) Route 14
	db "Carter@", TRAINERTYPE_NORMAL
	mon 3, BULBASAUR
	mon 3, CHARMANDER
	mon 3, SQUIRTLE
	end_party

	next_list_item ; POKEFANM (6) Route 14
	db "Trevor@", TRAINERTYPE_NORMAL
	mon 5, PSYDUCK
	end_party

	next_list_item ; POKEFANM (7) Route 34
	db "Brandon@", TRAINERTYPE_NORMAL
	mon 4, SNUBBULL
	end_party

	next_list_item ; POKEFANM (8) S.S. Aqua
	db "Jeremy@", TRAINERTYPE_NORMAL
	mon 8, MEOWTH
	mon 8, MEOWTH
	mon 8, MEOWTH
	end_party

	next_list_item ; POKEFANM (9) S.S. Aqua
	db "Colin@", TRAINERTYPE_NORMAL
	mon 7, DELIBIRD
	end_party

	next_list_item ; POKEFANM (10) Route 13
	db "Alex@", TRAINERTYPE_NORMAL
	mon 7, NIDOKING
	mon 7, SLOWKING
	mon 7, SEAKING
	end_party

	next_list_item ; POKEFANM (11) Route 6
	db "Rex@", TRAINERTYPE_NORMAL
	mon 5, PHANPY
	end_party

	next_list_item ; POKEFANM (12) Route 6
	db "Allan@", TRAINERTYPE_NORMAL
	mon 5, TEDDIURSA
	end_party

	next_list_item ; POKEFANM (13) Route 103
	db "Miguel@", TRAINERTYPE_NORMAL
	mon 7, TRAPINCH
	mon 7, SPOINK
	end_party

	next_list_item ; POKEFANM (14) Route 117
	db "Isaac@", TRAINERTYPE_NORMAL
	mon 5, URSARING
	mon 5, LAIRON
	mon 5, SWELLOW
	mon 5, MAGMAR
	mon 9, CLEFAIRY
	end_party

	next_list_item ; POKEFANM (15) Route 110
	db "Kaleb@", TRAINERTYPE_NORMAL
	mon 7, ARAICHU
	mon 7, WIGGLYTUFF
	end_party

	next_list_item ; POKEFANM (16) Route 110
	db "Edwin@", TRAINERTYPE_NORMAL
	mon 7, CLEFABLE
	mon 7, KLEAVOR
	end_party

	end_list_items

KimonoGirlGroupHard:
	next_list_item ; KIMONO_GIRL (1) Ecruteak City
	db "Naoko@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, QUILAVA, $aa, $aa
		dw FIRE_SPIN, MUD_SLAP, MUD_SHOT, FAINT_ATTACK
	dbwbb 5, QUILAVA2, $aa, $aa
		dw FIRE_SPIN, MUD_SLAP, MUD_SHOT, FAINT_ATTACK
	dbwbb 7, EEVEE, HP_MAX_FIRE, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	dbwbb 8, FLAREON, HP_MAX_FIRE, $fc
		dw FIRE_FANG, WILLOWISP, STOMP, POISON_FANG
	end_party

	next_list_item ; KIMONO_GIRL (2) Ecruteak City
	db "Sayo@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, NATU, $aa, $aa
		dw WING_ATTACK, PSYBEAM, CONFUSE_RAY, HEX
	dbwbb 5, SPOINK, $aa, $aa
		dw PSYWAVE, RAPID_SPIN, CONFUSE_RAY, SLAM
	dbwbb 7, EEVEE, HP_MAX_PSYCHIC, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	dbwbb 8, ESPEON, HP_MAX_PSYCHIC, $fc
		dw PSYBEAM, FAE_VOICE, CONFUSE_RAY, RECOVER
	end_party

	next_list_item ; KIMONO_GIRL (3) Ecruteak City
	db "Zuki@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, UNOWN, HP_MAX_FLYING, $aa
		dw FAINT_ATTACK, HIDDEN_POWER, WILLOWISP, HEX
	dbwbb 5, NUZLEAF, $aa, $aa
		dw FAINT_ATTACK, LEECH_SEED, RAZOR_LEAF, RECOVER
	dbwbb 7, EEVEE, HP_MAX_DARK, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	dbwbb 8, UMBREON, HP_MAX_DARK, $fc
		dw SNARL, CONFUSE_RAY, STOMP, NIGHT_SHADE
	end_party

	next_list_item ; KIMONO_GIRL (4) Ecruteak City
	db "Kuni@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, WINGULL, $aa, $aa
		dw WATER_PULSE, AERIAL_ACE, PROTECT, SUPERSONIC
	dbwbb 5, CHINCHOU, $aa, $aa
		dw WATER_PULSE, SHOCK_WAVE, THUNDER_WAVE, SUPERSONIC
	dbwbb 7, EEVEE, HP_MAX_WATER, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	dbwbb 8, VAPOREON, HP_MAX_WATER, $fc
		dw BUBBLEBEAM, AURORA_BEAM, STOMP, ACID_ARMOR
	end_party

	next_list_item ; KIMONO_GIRL (5) Ecruteak City
	db "Miki@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, PLUSLE, HP_MAX_WATER, $aa
		dw HIDDEN_POWER, THUNDER_WAVE, SHOCK_WAVE, CHARM
	dbwbb 5, MINUN, HP_MAX_FIRE, $aa
		dw HIDDEN_POWER, THUNDER_WAVE, SHOCK_WAVE, GROWL
	dbwbb 7, EEVEE, HP_MAX_ELECTRIC, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	dbwbb 8, JOLTEON, HP_MAX_ELECTRIC, $fc
		dw SPARK, TWINEEDLE, STOMP, SPIKES
	end_party

	end_list_items

TwinsGroupHard:
	next_list_item ; TWINS (1) Azalea Town Gym
	db "Amy & May@", TRAINERTYPE_NORMAL
	mon 7, SPINARAK
	mon 7, LEDYBA
	end_party

	next_list_item ; TWINS (2) Route 37
	db "Ann & Anne@", TRAINERTYPE_NORMAL
	mon 7, CLEFAIRY
	mon 7, JIGGLYPUFF
	end_party

	next_list_item ; TWINS (3) Celadon City Gym
	db "Jo & Zoe@", TRAINERTYPE_NORMAL
	mon 7, WEEPINBELL
	mon 7, VILEPLUME
	end_party

	next_list_item ; TWINS (4) S.S. Aqua
	db "Meg & Peg@", TRAINERTYPE_NORMAL
	mon 7, TEDDIURSA
	mon 7, PHANPY
	end_party

	next_list_item ; TWINS (5) Dragon's Den
	db "Lea & Pia@", TRAINERTYPE_MOVES
	mon 7, DRATINI
		moves THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	mon 7, DRATINI
		moves THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	end_party

	next_list_item ; TWINS (6) Route 103
	db "Amy & Liv@", TRAINERTYPE_NORMAL
	mon 9, ZANGOOSE
	mon 9, SEVIPER
	end_party

	next_list_item ; TWINS (7) Route 104
	db "Gina & Mia@", TRAINERTYPE_NORMAL
	mon 4, SEEDOT
	mon 4, LOTAD
	end_party

	next_list_item ; TWINS (8) Route 117
	db "Anna & Meg@", TRAINERTYPE_NORMAL
	mon 8, LINOONE
	mon 8, HARIYAMA
	end_party

	next_list_item ; TWINS (9) Route 108
	db "Lisa & Ria@", TRAINERTYPE_NORMAL
	mon 8, TENTACRUEL
	mon 7, CROCONAW
	mon 7, QWILFISH
	mon 8, CORSOLA
	end_party

	next_list_item ; TWINS (10) Route 113
	db "Tori & Tia@", TRAINERTYPE_NORMAL
	mon 9, SPINDA
	mon 9, SPINDA
	end_party

	end_list_items

PokefanFGroupHard:
	next_list_item ; POKEFANF (1) National Park
	db "Beverly@", TRAINERTYPE_NORMAL
	mon 4, SNUBBULL
	end_party

	next_list_item ; POKEFANF (2) Route 39
	db "Ruth@", TRAINERTYPE_NORMAL
	mon 7, PIKACHU
	end_party
	
	next_list_item ; POKEFANF (3) Fast Ship
	db "Georgia@", TRAINERTYPE_NORMAL
	mon 3, SENTRET
	mon 3, SENTRET
	mon 3, SENTRET
	mon 8, FURRET
	mon 3, SENTRET
	end_party

	next_list_item ; POKEFANF (6) Route 39
	db "Jaime@", TRAINERTYPE_NORMAL
	mon 6, MEOWTH
	end_party

	next_list_item ; POKEFANF (7) Route 117
	db "Lydia@", TRAINERTYPE_NORMAL
	mon 5, PELIPPER
	mon 5, BRELOOM
	mon 5, AZUMARILL
	mon 7, SEAKING
	mon 7, DELCATTY
	end_party

	next_list_item ; POKEFANF (8) Route 110
	db "Isabel@", TRAINERTYPE_NORMAL
	mon 8, PLUSLE
	mon 8, MINUN
	end_party

	next_list_item ; POKEFANF (9) Sootopolos Gym
	db "Annika@", TRAINERTYPE_NORMAL
	mon 7, SEADRA
	mon 8, LUVDISC
	end_party

	next_list_item ; POKEFANF (10) Sootopolos Gym
	db "Bethany@", TRAINERTYPE_NORMAL
	mon 7, PELIPPER
	mon 8, AZUMARILL
	end_party

	end_list_items

RedGroupHard:
	next_list_item ; RED (1)
	db "Red@", TRAINERTYPE_MOVES
	mon 21, PIKACHU
		moves SURF, EXTREMESPEED, SWIFT, VOLT_TACKLE
	mon 15, ESPEON
		moves MUD_SLAP, MEDITATE, SWIFT, PSYCHIC_M
	mon 16, SNORLAX
		moves AMNESIA, SNORE, REST, BODY_SLAM
	mon 15, VENUSAUR
		moves SUNNY_DAY, GIGA_DRAIN, SYNTHESIS, SOLARBEAM
	mon 15, CHARIZARD
		moves FIRE_BLAST, SKY_ATTACK, OUTRAGE, SOLARBEAM
	mon 21, GOROCHU
		moves DRAGON_CLAW, VOLT_TACKLE, BEAT_UP, RECOVER
	end_party

	end_list_items

BlueGroupHard:
	next_list_item ; BLUE (1)
	db "Blue@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, PIDGEOT, SHARP_BEAK
		moves EXTREMESPEED, SKY_ATTACK, BODY_SLAM, STEEL_WING
	itemmon 12, ALAKAZAM, TWISTEDSPOON
		moves SHADOW_BALL, RECOVER, PSYCHIC_M, FOCUS_PUNCH
	itemmon 12, RHYPERIOR, QUICK_CLAW
		moves DRAGON_CLAW, SANDSTORM, STONE_EDGE, EARTHQUAKE
	itemmon 13, ARCANINE, CHARCOAL
		moves PURSUIT, SWIFT, SACRED_FIRE, EXTREMESPEED
	itemmon 13, GYARADOSX, LEFTOVERS
		moves DRAGON_CLAW, WATERFALL, BEAT_UP, HYPER_BEAM
	itemmon 15, ARTICUNO, MIRACLEBERRY
		moves BLIZZARD, HURRICANE, PSYCHIC_M, REST
	end_party
	
	next_list_item ; BLUE (1)
	db "Blue@", TRAINERTYPE_MOVES
	mon 12, PIDGEOT
		moves EXTREMESPEED, SKY_ATTACK, BODY_SLAM, STEEL_WING
	mon 10, ALAKAZAM
		moves SHADOW_BALL, RECOVER, PSYCHIC_M, REFLECT
	mon 10, RHYDON
		moves DRAGONBREATH, SANDSTORM, ROCK_SLIDE, EARTHQUAKE
	mon 10, GYARADOS
		moves DRAGONBREATH, WATERFALL, RAIN_DANCE, HYPER_BEAM
	mon 10, EXEGGUTOR
		moves REST, MEGA_DRAIN, PSYCHIC_M, EGG_BOMB
	mon 15, ARTICUNO
		moves BLIZZARD, PSYCHIC_M, FLY, EXTREMESPEED
	end_party
	
	next_list_item ; BLUE (1)
	db "Blue@", TRAINERTYPE_MOVES
	mon 12, PIDGEOT
		moves EXTREMESPEED, SKY_ATTACK, BODY_SLAM, STEEL_WING
	mon 12, ALAKAZAM
		moves SHADOW_BALL, RECOVER, PSYCHIC_M, REFLECT
	mon 12, RHYDON
		moves DRAGON_CLAW, SANDSTORM, ROCK_SLIDE, EARTHQUAKE
	mon 12, GYARADOS
		moves DRAGON_CLAW, WATERFALL, FIRE_FANG, AQUA_JET
	mon 12, EXEGGUTOR
		moves REST, GIGA_DRAIN, PSYCHIC_M, EGG_BOMB
	mon 15, ARTICUNO
		moves BLIZZARD, PSYCHIC_M, FLY, EXTREMESPEED
	end_party

	end_list_items

OfficerGroupHard:
	next_list_item ; OFFICER (1) Route 34
	db "Keith@", TRAINERTYPE_NORMAL
	mon 7, GROWLITHE
	end_party

	next_list_item ; OFFICER (2) Route 35
	db "Dirk@", TRAINERTYPE_NORMAL
	mon 4, GROWLITHE
	mon 4, GROWLITHE
	end_party

	end_list_items

GruntFGroupHard:
	next_list_item ; GRUNTF (1) Slowpoke Well B1f
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 4, ZUBAT
	mon 6, EKANS
	end_party

	next_list_item ; GRUNTF (2) Radio Tower 2F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 9, ARBOK
	end_party

	next_list_item ; GRUNTF (3) Goldenrod Underground Exit
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, GLOOM
	mon 7, WEEPINBELL
	mon 7, CROCONAW2
	mon 7, TENTACRUEL2
	end_party

	next_list_item ; GRUNTF (4) Radio Tower 4F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, EKANS
	mon 7, ODDISH
	mon 5, SEVIPER
	mon 6, GLOOM
	end_party

	next_list_item ; GRUNTF (5) Team Rocket Base B3F
	db "Grunt@", TRAINERTYPE_MOVES
	mon 8, SEVIPER
		moves WRAP, LEER, POISON_TAIL, BITE
	mon 8, GLOOM
		moves ABSORB, SWEET_SCENT, STUN_SPORE, SLEEP_POWDER
	end_party

	next_list_item ; GRUNTF (6) Contest Amaya #1
	db "Amaya@", TRAINERTYPE_NORMAL
	mon 9, PIKACHU
	mon 9, TRAPINCH
	mon 9, BELDUM
	mon 9, HOUNDOUR
	mon 10, GYARADOS
	mon 10, ANINETALES
	end_party

	next_list_item ; GRUNTF (7) Contest Amaya #2
	db "Amaya@", TRAINERTYPE_NORMAL
	mon 7, ARAICHU
	mon 8, FLYGON
	mon 8, METANG
	mon 9, HOUNDOOM
	mon 11, GYARADOS
	mon 11, NINETALES2
	end_party

	next_list_item ; GRUNTF (8) Contest Amaya #3
	db "Amaya@", TRAINERTYPE_NORMAL
	mon 10, ARAICHU
	mon 10, FLYGONX
	mon 10, METAGROSSX
	mon 10, HOUNDOOMX
	mon 11, GYARADOSX
	mon 11, NINETALES2
	end_party

	next_list_item ; GRUNTF (9) Safari Gruntf 1
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, ARBOK
	mon 7, SEVIPER
	end_party

	next_list_item ; GRUNTF (10) Safari Gruntf 2
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, PRIMEAPE
	mon 7, HYPNO
	end_party

	next_list_item ; GRUNTF (11) Safari Gruntf 3
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, DEWGONG
	mon 7, HITMONCHAN
	end_party

	next_list_item ; GRUNTF (12) Safari Gruntf 4
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, SEAKING
	mon 7, AERODACTYL
	end_party

	next_list_item ; GRUNTF (13) Safari Gruntf 5
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 7, GRANBULL
	mon 7, MIGHTYENA
	end_party

	next_list_item ; GRUNTF (14) Rustturf Gruntf 1
	db "Lisa@", TRAINERTYPE_NORMAL
	mon 6, SNUBBULL
	mon 7, HOUNDOUR
	end_party

	next_list_item ; GRUNTF (15) Mauville Gruntf 1
	db "Lisa@", TRAINERTYPE_NORMAL
	mon 6, HOUNDOUR
	mon 7, GRANBULL
	end_party

	next_list_item ; GRUNTF (16) Mauville Gruntf 2
	db "Jamie@", TRAINERTYPE_NORMAL
	mon 5, CARVANHA
	mon 8, GOLBAT
	end_party

	next_list_item ; GRUNTF (17) Mauville Gruntf 3
	db "Jenna@", TRAINERTYPE_NORMAL
	mon 6, MANTINE
	mon 8, QUAGSIRE
	end_party

	next_list_item ; GRUNTF (18) Route 121 Gruntf 1
	db "Lisa@", TRAINERTYPE_NORMAL
	mon 7, HOUNDOOM
	mon 8, MEGANIUM
	mon 9, GRANBULL
	end_party

	next_list_item ; GRUNTF (19) Route 121 Gruntf 2
	db "Jamie@", TRAINERTYPE_NORMAL
	mon 7, SLOWKING
	mon 7, CROBAT
	mon 8, AMUK
	end_party

	next_list_item ; GRUNTF (20) Mt Pyre Gruntf 1
	db "Elite@", TRAINERTYPE_NORMAL
	mon 7, MANECTRIC
	mon 7, ELECTRODE2
	mon 9, AMPHAROS
	end_party

	next_list_item ; GRUNTF (21) Mt Pyre Gruntf 2
	db "Elite@", TRAINERTYPE_NORMAL
	mon 7, GOLDUCK
	mon 7, VAPOREON
	mon 9, SWAMPERT
	end_party

	next_list_item ; GRUNTF (22) Mt Pyre Gruntf 3
	db "Elite@", TRAINERTYPE_NORMAL
	mon 7, WIGGLYTUFF
	mon 7, CLEFABLE
	mon 11, SYLVEON
	end_party

	next_list_item ; GRUNTF (23) Mt Pyre Gruntf 4
	db "Elite@", TRAINERTYPE_NORMAL
	mon 7, IKARI
	mon 7, ASANDSLASH
	mon 10, AGGRON
	end_party

	end_list_items

MysticalmanGroupHard:
	next_list_item ; MYSTICALMAN (1) Cianwood City
	db "Eusine@", TRAINERTYPE_MOVES
	mon 8, HYPNO
		moves DREAM_EATER, HYPNOSIS, DISABLE, CONFUSION
	mon 8, GENGAR
		moves LICK, HYPNOSIS, MEAN_LOOK, CURSE
	mon 10, ELECTRODE2
		moves SCREECH, SONICBOOM, THUNDER, ROLLOUT
	end_party

	end_list_items

KrisGroupHard:
	next_list_item; KRIS (1) Unreferenced
	db "Kris@", TRAINERTYPE_NORMAL
	mon 10, CHIKORITA
	mon 10, CYNDAQUIL
	mon 10, TOTODILE
	end_party

	end_list_items


RoxanneGroupHard:
	next_list_item; ROXXANE (1) Rustboro City Gym
	db "Roxxane@", TRAINERTYPE_NORMAL
	mon 7, AGEODUDE
	mon 7, KABUTO
	mon 8, NOSEPASS
	end_party

	next_list_item; ROXXANE (2) Rustboro City Gym
	db "Roxxane@", TRAINERTYPE_NORMAL
	mon 10, NOSEPASS
	mon 10, MAGCARGO
	mon 10, AGOLEM
	mon 10, RELICANTH
	mon 13, AERODACTYL
	end_party

	next_list_item ; ROXXANE (3) Rustboro City Gym
	db "Roxxane@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, TENTACRUEL2, KINGS_ROCK
		moves SIGNAL_BEAM, ROCK_TOMB, STONE_EDGE, GIGA_DRAIN
	itemmon 10, LUNATONE, FOCUS_BAND
		moves ROCK_TOMB, COSMIC_POWER, PSYCHIC_M, SANDSTORM
	itemmon 10, SOLROCK, FOCUS_BAND
		moves ROCK_TOMB, COSMIC_POWER, FLAMETHROWER, SANDSTORM
	itemmon 10, AGOLEM, MAGNET
		moves THUNDERBOLT, STONE_EDGE, PROTECT, EARTHQUAKE
	itemmon 12, REGIROCK, HARD_STONE
		moves SLEEP_TALK, COSMIC_POWER, REST, STONE_EDGE
	itemmon 12, PROBOPASS, LEFTOVERS
		moves ROCK_TOMB, STONE_EDGE, AURA_SPHERE, SANDSTORM
	end_party

	end_list_items

BrawlyGroupHard:
	next_list_item; BRAWLY (1) 
	db "Brawly@", TRAINERTYPE_NORMAL
	mon 7, MACHOP
	mon 8, MEDITITE
	mon 9, MAKUHITA
	end_party

	next_list_item; BRAWLY (2) 
	db "Brawly@", TRAINERTYPE_NORMAL
	mon 9, MACHOKE
	mon 10, MEDICHAM
	mon 10, HITMONCHAN
	mon 10, BRELOOM
	mon 13, BLAZIKEN
	end_party

	next_list_item ; BRAWLY (3)
	db "Brawly@", TRAINERTYPE_ITEM_MOVES	
	itemmon 10, BRELOOM, MAGNET
		moves THUNDERPUNCH, MACH_PUNCH, LEAF_BLADE, DYNAMICPUNCH
	itemmon 10, STEELIX, LEFTOVERS
		moves IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	itemmon 10, MEDICHAM, TWISTEDSPOON
		moves ZEN_HEADBUTT, MACH_PUNCH, SHADOW_PUNCH, BULLET_PUNCH
	itemmon 10, ANNIHILAPE, ICE_BERRY
		moves MACH_PUNCH, BULK_UP, SHADOW_PUNCH, EARTHQUAKE
	itemmon 10, AGGRON, QUICK_CLAW
		moves ROCK_SLIDE, BRICK_BREAK, GUILLOTINE, FISSURE
	itemmon 13, BLAZIKEN, BLACKBELT_I
		moves DRILL_PECK, BLAZE_KICK, HI_JUMP_KICK, DETECT
	end_party

	end_list_items

WattsonGroupHard:
	next_list_item; WATTSON (1) Unreferenced
	db "Wattson@", TRAINERTYPE_NORMAL
	mon 7, HVOLTORB
	mon 7, MINUN
	mon 7, PLUSLE
	mon 10, MAGNETON
	mon 10, MANECTRIC
	end_party

	next_list_item; WATTSON (2) Unreferenced
	db "Wattson@", TRAINERTYPE_NORMAL
	mon 11, HELECTRODE
	mon 11, ELECTRODE
	mon 11, ELECTRODE2
	mon 12, MAGNEZONE
	mon 15, MANECTRIC
	end_party

	next_list_item ; WATTSON (3)
	db "Wattson@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, HELECTRODE, MAGNET
		moves THUNDERBOLT, CHARGE, GIGA_DRAIN, THUNDER_WAVE
	itemmon 10, MANECTRIC, MAGNET
		moves SHOCKSLAM, CRUNCH, PURSUIT, THUNDER_WAVE
	itemmon 10, JOLTEON, MAGNET
		moves ZAP_CANNON, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	itemmon 12, ELECTIVIRE, MAGNET
		moves ZAP_CANNON, FIRE_PUNCH, DIZZY_PUNCH, THUNDERBOLT
	itemmon 12, ARAICHU, KINGS_ROCK
		moves SURF, FLASHCANNON, VOLT_TACKLE, SWIFT
	itemmon 12, AMPHAROSX, KINGS_ROCK
		moves FAERIEGLEAM, FLASHCANNON, CHARGE, THUNDERBOLT
	end_party

	end_list_items

FlanneryGroupHard:
	next_list_item; FLANNERY (1) 
	db "Flannery@", TRAINERTYPE_NORMAL
	mon 8, MAGCARGO
	mon 9, HGROWLITHE
	mon 9, GROWLITHE
	mon 10, MAGMAR
	mon 11, TORKOAL
	end_party

	next_list_item; FLANNERY (2) 
	db "Flannery@", TRAINERTYPE_NORMAL
	mon 10, MAGCARGO
	mon 10, HARCANINE
	mon 10, ARCANINE
	mon 10, MAGMAR
	mon 11, CAMERUPT
	mon 13, TORKOAL
	end_party

	next_list_item ; FLANNERY (3)
	db "Flannery@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, SUNFLORA, QUICK_CLAW
		moves FIRE_BLAST, SOLARBEAM, GIGA_DRAIN, STUN_SPORE
	itemmon 10, NINETALES, CHARCOAL
		moves FIRE_BLAST, SHADOW_BALL, WILLOWISP, SOLARBEAM
	itemmon 10, FLAREON, CHARCOAL
		moves BODY_SLAM, SACRED_FIRE, PURSUIT, SWORDS_DANCE
	itemmon 10, TORKOAL, LEFTOVERS
		moves FIRE_BLAST, FISSURE, REST, COSMIC_POWER
	itemmon 10, CHARIZARD, CHARCOAL
		moves FLAMETHROWER, SKY_ATTACK, DRAGONBREATH, SWIFT
	itemmon 12, CAMERUPTX, LEFTOVERS
		moves FISSURE, ERUPTION, RECOVER, AMNESIA
	end_party

	end_list_items

NormanGroupHard:
	next_list_item; NORMAN (1)
	db "Norman@", TRAINERTYPE_NORMAL
	mon 12, LINOONE
	mon 12, SPINDA
	mon 12, URSARING
	mon 12, SNORLAX
	mon 17, DITTO
	end_party

	next_list_item; NORMAN (2)
	db "Norman@", TRAINERTYPE_NORMAL
	mon 12, LINOONE
	mon 12, SPINDA
	mon 17, DITTO
	mon 12, URSALUNA
	mon 12, SNORLAX
	end_party

	next_list_item ; NORMAN (3)
	db "Norman@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, DITTO, QUICK_CLAW
		moves TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE
	itemmon 10, SPINDA, PINK_BOW
		moves BELLY_DRUM, EXTREMESPEED, NO_MOVE, NO_MOVE
	itemmon 10, ARCANINE, CHARCOAL
		moves BODY_SLAM, SACRED_FIRE, PURSUIT, SWORDS_DANCE
	itemmon 10, SNORLAX, LEFTOVERS
		moves SLEEP_TALK, SNORE, REST, COSMIC_POWER
	itemmon 10, SNORLAX, LEFTOVERS
		moves BODY_SLAM, EARTHQUAKE, REST, SLEEP_TALK
	itemmon 12, FURRET2, PINK_BOW
		moves BODY_SLAM, DRAGON_CLAW, RECOVER, DRAGON_DANCE
	end_party

	end_list_items

WinonaGroupHard:
	next_list_item; WINONA (1) Fortree Gym Easy
	db "Winona@", TRAINERTYPE_NORMAL
	mon 9, SWELLOW
	mon 9, PELIPPER
	mon 10, ALTARIA
	end_party

	next_list_item; WINONA (2) Fortree Gym Medium
	db "Winona@", TRAINERTYPE_NORMAL
	mon 10, SWELLOW
	mon 10, PELIPPER
	mon 10, SKARMORY
	mon 11, TROPIUS
	mon 12, ALTARIA
	end_party

	next_list_item; WINONA (3) Fortree Gym Hard
	db "Winona@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, PELIPPER, QUICK_CLAW
		moves HURRICANE, RAIN_DANCE, HYDRO_PUMP, BLIZZARD
	itemmon 11, SWELLOW, SHARP_BEAK
		moves DRILL_PECK, HURRICANE, MUD_SLAP, STEEL_WING
	itemmon 11, SKARMORY, LEFTOVERS
		moves VICEGRIP, FLY, HURRICANE, WHIRLWIND
	itemmon 11, TROPIUS, MIRACLEBERRY
		moves HURRICANE, WHIRLWIND, GIGA_DRAIN, STUN_SPORE
	itemmon 12, TOGEKISS, SHARP_BEAK
		moves HURRICANE, RAIN_DANCE, THUNDER, MIST_BALL
	itemmon 13, ALTARIAX, LEFTOVERS
		moves DRAGON_DANCE, EARTHQUAKE, PLAY_ROUGH, SKY_ATTACK
	end_party

	end_list_items

TateLizaGroupHard:
	next_list_item; TATELIZA (1) Mossdeep Gym
	db "Tate&Liza@", TRAINERTYPE_NORMAL	
	mon 10, SOLROCK
	mon 10, LUNATONE
	end_party

	next_list_item; TATELIZA (2) Mossdeep Gym
	db "Tate&Liza@", TRAINERTYPE_NORMAL
	mon 10, SOLROCK
	mon 10, LUNATONE
	mon 10, GARDEVOIR
	mon 10, GALLADE
	end_party

	next_list_item; TATELIZA (3) Mossdeep Gym
	db "Tate&Liza@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, SOLROCK, QUICK_CLAW
		moves FIRE_BLAST, WILLOWISP, POWER_GEM, COSMIC_POWER
	itemmon 10, LUNATONE, BITTER_BERRY
		moves PSYCHIC_M, FUTURE_SIGHT, MOONBLAST, REST
	itemmon 10, GARDEVOIR, TWISTEDSPOON
		moves MOONBLAST, THUNDERBOLT, PSYCHIC_M, CALM_MIND
	itemmon 10, GALLADE, BLACKBELT_I
		moves CROSS_CHOP, MACH_PUNCH, LEAF_BLADE, SWORDS_DANCE
	itemmon 10, CLAYDOL, BURNT_BERRY
		moves EARTHPOWER, PSYCHIC_M, REST, COSMIC_POWER
	itemmon 10, CHIMECHOX, LEFTOVERS
		moves FLASHCANNON, WILLOWISP, FUTURE_SIGHT, COSMIC_POWER
	end_party

	end_list_items

WallaceGroupHard:
	next_list_item; WALLACE (1) Sootopolis Gym
	db "Wallace@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, LUVDISC, QUICK_CLAW
		moves SURF, RAIN_DANCE, FAERIEGLEAM, BATON_PASS
	itemmon 10, LANTURN, BITTER_BERRY
		moves SURF, THUNDER, THUNDER_WAVE, ICE_BEAM
	itemmon 10, WHISCASH, SOFT_SAND
		moves SURF, MUD_SHOT, EARTHQUAKE, AMNESIA
	itemmon 11, SEAKING, SHARP_BEAK
		moves DRILL_PECK, WATERFALL, AGILITY, SWORDS_DANCE
	itemmon 11, KINGDRA, BITTER_BERRY
		moves HYDRO_PUMP, OUTRAGE, REST, THUNDER
	itemmon 12, MILOTIC, LEFTOVERS
		moves FLASHCANNON, CALM_MIND, MIST_BALL, DRAININGKISS
	end_party

	next_list_item; WALLACE (2) Sootopolis Gym
	db "Wallace@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, LUVDISC, QUICK_CLAW
		moves HYDRO_PUMP, RAIN_DANCE, FAERIEGLEAM, BATON_PASS
	itemmon 11, LANTURN, BITTER_BERRY
		moves HYDRO_PUMP, THUNDER, THUNDER_WAVE, ICE_BEAM
	itemmon 11, WHISCASH, SOFT_SAND
		moves HYDRO_PUMP, MUD_SHOT, EARTHQUAKE, AMNESIA
	itemmon 11, SEAKING, SHARP_BEAK
		moves DRILL_PECK, WATERFALL, AGILITY, SWORDS_DANCE
	itemmon 12, KINGDRA, BITTER_BERRY
		moves HYDRO_PUMP, OUTRAGE, REST, THUNDER
	itemmon 13, MILOTIC, LEFTOVERS
		moves FLASHCANNON, CALM_MIND, MIST_BALL, DRAININGKISS
	end_party

	end_list_items

SidneyGroupHard:
	next_list_item ; SIDNEY (1)
	db "Sidney@", TRAINERTYPE_MOVES
	mon 12, MIGHTYENA
		moves CRUNCH, DIG, BULK_UP, SNARL
	mon 12, UMBREON
		moves COSMIC_POWER, TOXIC, RECOVER, SNARL
	mon 12, SHIFTRY
		moves STUN_SPORE, LEAF_BLADE, PURSUIT, HEAT_WAVE
	mon 12, SHARPEDO
		moves PURSUIT, CRUNCH, BODY_SLAM, SURF
	mon 12, HYPNO
		moves HYPNOSIS, DREAM_EATER, DIZZY_PUNCH, PSYCHIC_M
	mon 13, ABSOL
		moves DRAGON_DANCE, SKY_ATTACK, BEAT_UP, SLASH
	end_party

	next_list_item ; SIDNEY (2)
	db "Sidney@", TRAINERTYPE_ITEM_MOVES
	itemmon 13, MIGHTYENA, NO_ITEM
		moves FIRE_FANG, CRUNCH, ICE_FANG, POISON_FANG
	itemmon 13, UMBREON, LEFTOVERS
		moves COSMIC_POWER, SNARL, REST, MUD_SLAP
	itemmon 13, SHIFTRY, MIRACLEBERRY
		moves STUN_SPORE, LEAF_BLADE, PURSUIT, HEAT_WAVE
	itemmon 13, SHARPEDO, BLACKGLASSES
		moves PLAY_ROUGH, CRUNCH, BODY_SLAM, WATERFALL
	itemmon 14, HYPNO, NO_ITEM
		moves HYPNOSIS, DREAM_EATER, DARK_PULSE, ICE_BEAM
	itemmon 15, ABSOLX, LEFTOVERS
		moves DRAGON_DANCE, SKY_ATTACK, BEAT_UP, SLASH
	end_party

	end_list_items

PhoebeGroupHard:
	next_list_item ; PHOEBE (1)
	db "Phoebe@", TRAINERTYPE_MOVES
	mon 12, NINETALES
		moves SHADOW_BALL, FLAMETHROWER, DESTINY_BOND, CONFUSE_RAY
	mon 12, PARASECT
		moves SHADOW_FORCE, LEAF_BLADE, SLASH, STUN_SPORE
	mon 12, BANETTE
		moves WILLOWISP, CONFUSE_RAY, PSYCHO_CUT, SHADOW_CLAW
	mon 12, UNOWN
		moves GLARE, CURSE, COSMIC_POWER, SHADOW_BALL
	mon 12, MISDREAVUS
		moves WILLOWISP, CONFUSE_RAY, MEAN_LOOK, PAIN_SPLIT
	mon 13, DUSKNOIR
		moves DRAGON_DANCE, SHADOW_FORCE, PURSUIT, SHADOWSNEAK
	end_party

	next_list_item ; PHOEBE (2)
	db "Phoebe@", TRAINERTYPE_ITEM_MOVES
	itemmon 13, NINETALES, CHARCOAL
		moves SHADOW_BALL, FLAMETHROWER, DESTINY_BOND, CONFUSE_RAY
	itemmon 13, PARASECT, LEFTOVERS
		moves SHADOW_FORCE, LEAF_BLADE, SLASH, STUN_SPORE
	itemmon 13, BANETTE, TWISTEDSPOON
		moves WILLOWISP, CONFUSE_RAY, PSYCHO_CUT, SHADOW_CLAW
	itemmon 13, UNOWN, WARD_BERRY
		moves GLARE, CURSE, COSMIC_POWER, SHADOW_BALL
	itemmon 14, MISMAGIUS, NO_ITEM
		moves WILLOWISP, CONFUSE_RAY, MEAN_LOOK, SHADOW_BALL
	itemmon 15, DUSKNOIR, LEFTOVERS
		moves DRAGON_DANCE, SHADOW_FORCE, PURSUIT, SHADOWSNEAK
	end_party

	end_list_items

GlaciaGroupHard:
	next_list_item ; GLACIA (1)
	db "Glacia@", TRAINERTYPE_MOVES
	mon 12, ANINETALES
		moves ICE_BEAM, FAERIEGLEAM, ICY_WIND, CALM_MIND
	mon 12, FROSLASS
		moves HAIL, ICE_BEAM, SHADOW_BALL, ICY_WIND
	mon 12, WALREIN
		moves SURF, ICE_BEAM, BODY_SLAM, EARTHQUAKE
	mon 12, ASANDSLASH
		moves ICICLE_CRASH, VICEGRIP, SLASH, BULK_UP
	mon 12, JYNX
		moves HAIL, PSYCHIC_M, ICE_BEAM, MEDITATE
	mon 13, GLALIE
		moves CRUNCH, ICE_BEAM, EXPLOSION, HAIL
	end_party

	next_list_item ; GLACIA (2)
	db "Glacia@", TRAINERTYPE_ITEM_MOVES
	itemmon 13, ANINETALES, NEVERMELTICE
		moves BLIZZARD, FAERIEGLEAM, ICY_WIND, CALM_MIND
	itemmon 13, FROSLASS, QUICK_CLAW
		moves HAIL, BLIZZARD, SHADOW_BALL, ICY_WIND
	itemmon 13, WALREIN, MYSTIC_WATER
		moves HYDRO_PUMP, BLIZZARD, EARTHQUAKE, REST
	itemmon 13, ASANDSLASH, WARD_BERRY
		moves ICICLE_CRASH, VICEGRIP, SLASH, BULK_UP
	itemmon 14, JYNX, FOCUS_BAND
		moves DIZZY_PUNCH, PSYCHIC_M, BLIZZARD, MEDITATE
	itemmon 15, GLALIEX, LEFTOVERS
		moves BLIZZARD, HAIL, CRUNCH, PROTECT
	end_party

	end_list_items

DrakeGroupHard:
	next_list_item ; DRAKE (1)
	db "Drake@", TRAINERTYPE_MOVES
	mon 12, ALTARIA
		moves DRAGON_DANCE, PLAY_ROUGH, DRAGON_CLAW, EARTHQUAKE
	mon 12, FLYGON
		moves FLAMETHROWER, MUD_SHOT, DRAGONBREATH, POISON_FANG
	mon 12, KINGDRA
		moves SURF, ICE_BEAM, OUTRAGE, AMNESIA
	mon 12, YANMEGA
		moves DRAGON_CLAW, PIN_MISSILE, DETECT, DRAGON_DANCE
	mon 12, EXEGGUTOR2
		moves CRUNCH, FIRE_FANG, ICE_FANG, THUNDER_FANG
	mon 13, SALAMENCE
		moves CRUNCH, DRAGON_CLAW, FIRE_BLAST, ROCK_TOMB
	end_party

	next_list_item ; DRAKE (2)
	db "Drake@", TRAINERTYPE_ITEM_MOVES
	itemmon 13, ALTARIA, DRAGON_FANG
		moves DRAGON_DANCE, PLAY_ROUGH, DRAGON_CLAW, EARTHQUAKE
	itemmon 13, FLYGON, SOFT_SAND
		moves FLAMETHROWER, EARTHQUAKE, DRAGON_CLAW, ROCK_TOMB
	itemmon 13, KINGDRA, MYSTIC_WATER
		moves HYDRO_PUMP, BLIZZARD, DRAGONBREATH, AMNESIA
	itemmon 13, YANMEGA, WARD_BERRY
		moves DRAGON_CLAW, MEGAHORN, DETECT, DRAGON_DANCE
	itemmon 14, EXEGGUTOR2, FOCUS_BAND
		moves CRUNCH, FIRE_FANG, ICE_FANG, THUNDER_FANG
	itemmon 15, SALAMENCEX, SCOPE_LENS
		moves CRUNCH, DRAGON_CLAW, FIRE_BLAST, ROCK_TOMB
	end_party

	end_list_items

StevenGroupHard:
	next_list_item ; STEVEN (1)
	db "Steven@", TRAINERTYPE_MOVES
	mon 13, SKARMORY
		moves MUD_SLAP, DRILL_PECK, RECOVER, VICEGRIP
	mon 13, AERODACTYL
		moves ROCK_SLIDE, CRUNCH, FLY, ROCK_TOMB
	mon 13, AGGRON
		moves STONE_EDGE, VICEGRIP, EARTHQUAKE, HYPER_BEAM
	mon 13, PROBOPASS
		moves THUNDERBOLT, FLASHCANNON, ROCK_TOMB, RECOVER
	mon 14, SCIZOR
		moves VICEGRIP, BULLET_PUNCH, LEAF_BLADE, SWORDS_DANCE
	mon 15, REGISTEEL
		moves METEOR_MASH, SANDSTORM, ROCK_SLIDE, ZAP_CANNON
	end_party
	
	next_list_item ; STEVEN (2)
	db "Steven@", TRAINERTYPE_ITEM_MOVES
	itemmon 15, SKARMORY, LEFTOVERS
		moves MUD_SLAP, SKY_ATTACK, RECOVER, GUILLOTINE
	itemmon 15, AERODACTYL, MINT_BERRY
		moves ROCK_SLIDE, CRUNCH, FLY, ROCK_TOMB
	itemmon 15, AGGRON, METAL_COAT
		moves STONE_EDGE, VICEGRIP, EARTHQUAKE, HYPER_BEAM
	itemmon 15, PROBOPASS, MAGNET
		moves FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, HYPER_BEAM
	itemmon 15, SCIZOR, METAL_COAT
		moves VICEGRIP, BULLET_PUNCH, LEAF_BLADE, SWORDS_DANCE
	itemmon 17, REGISTEEL, MINT_BERRY
		moves METEOR_MASH, SANDSTORM, ROCK_SLIDE, REST
	end_party

	next_list_item ; STEVEN (3)
	db "Steven@", TRAINERTYPE_ITEM_MOVES
	itemmon 25, METAGROSSX, LEFTOVERS
		moves METEOR_MASH, COSMIC_POWER, EARTHQUAKE, PSYCHIC_M
	end_party

	end_list_items

BattleGirlGroupHard:
	next_list_item; BATTLE_GIRL (1) Dewford City Gym
	db "Laura@", TRAINERTYPE_NORMAL
	mon 7, MEDITITE
	mon 7, TAUROS
	end_party

	next_list_item; BATTLE_GIRL (2) Dewford City Gym
	db "Lilith@", TRAINERTYPE_NORMAL
	mon 7, POLIWHIRL
	mon 7, FARFETCH_D
	end_party

	next_list_item; BATTLE_GIRL (3) Dewford City Gym
	db "Jocelyn@", TRAINERTYPE_NORMAL
	mon 7, COMBUSKEN
	mon 7, MANKEY
	end_party

	next_list_item; BATTLE_GIRL (4) Lavaridge Gym
	db "Dani@", TRAINERTYPE_NORMAL
	mon 9, MEDICHAM
	mon 9, TORRACAT
	end_party

	next_list_item; BATTLE_GIRL (4) Route 117
	db "Aisha@", TRAINERTYPE_NORMAL
	mon 9, HITMONLEE
	mon 9, ABSOL
	end_party

	next_list_item; BATTLE_GIRL (5) Route 120
	db "Callie@", TRAINERTYPE_NORMAL
	mon 8, HITMONTOP
	mon 8, MAKUHITA
	end_party

	end_list_items


RangerMGroupHard:
	next_list_item; STEVEN (1) Unreferenced
	db "Steven@", TRAINERTYPE_NORMAL
	mon 10, CHIKORITA
	mon 10, CYNDAQUIL
	mon 10, TOTODILE
	end_party

	next_list_item ; RANGERM (2) Aaron's Yellow team
	db "Aaron@", TRAINERTYPE_ITEM_MOVES	
	itemmon 11, BUTTERFREE, NO_ITEM
		moves SPORE, HURRICANE, MOONBLAST, PSYCHIC_M
	itemmon 11, PIKACHU, LIGHT_BALL
		moves VOLT_TACKLE, BODY_SLAM, SURF, THUNDER_WAVE
	itemmon 11, ARTICUNO, LEFTOVERS
		moves BLIZZARD, HURRICANE, FLY, ICY_WIND
	itemmon 11, ZAPDOS, NO_ITEM
		moves THUNDER, DRILL_PECK, SWIFT, FLY
	itemmon 11, MOLTRES, NO_ITEM
		moves PURSUIT, SKY_ATTACK, SOLARBEAM, FIRE_BLAST
	itemmon 11, MEW, LEFTOVERS
		moves MOONBLAST, BLIZZARD, FIRE_BLAST, AURA_SPHERE
	end_party

	next_list_item ; RANGERM (3) Aaron's Silver team
	db "Aaron@", TRAINERTYPE_ITEM_MOVES	
	itemmon 11, MEGANIUM, NO_ITEM
		moves SPORE, GIGA_DRAIN, MOONBLAST, BODY_SLAM
	itemmon 11, TYRANITAR, NO_ITEM
		moves CRUNCH, ROCK_SLIDE, SURF, EARTHQUAKE
	itemmon 11, BLISSEY, LEFTOVERS
		moves BLIZZARD, THUNDER, PSYCHIC_M, SOFTBOILED
	itemmon 11, JUMPLUFF, NO_ITEM
		moves GIGA_DRAIN, SKY_ATTACK, SUNNY_DAY, SOLARBEAM
	itemmon 11, LUGIA, NO_ITEM
		moves SURF, AEROBLAST, HYDRO_PUMP, PSYCHIC_M
	itemmon 11, CELEBI, LEFTOVERS
		moves MOONBLAST, BLIZZARD, FIRE_BLAST, AURA_SPHERE
	end_party

	next_list_item ; RANGERM (4) Aaron's Playtest team
	db "Aaron@", TRAINERTYPE_ITEM_MOVES	
	itemmon 11, DELIBIRD, NO_ITEM
		moves BLIZZARD, SKY_ATTACK, SPIKES, HURRICANE
	itemmon 11, ANINETALES, NO_ITEM
		moves BLIZZARD, MOONBLAST, CALM_MIND, ICY_WIND
	itemmon 11, JUMPLUFF, NO_ITEM
		moves GIGA_DRAIN, SKY_ATTACK, STUN_SPORE, NO_MOVE
	itemmon 11, UNOWN, LEFTOVERS
		moves DARK_PULSE, WILLOWISP, ICY_WIND, COSMIC_POWER
	itemmon 11, ASHIBOMB, NO_ITEM
		moves SURF, FIRE_BLAST, HYDRO_PUMP, REST
	itemmon 11, IRONBUNDLE, LEFTOVERS
		moves HYDRO_PUMP, BLIZZARD, CALM_MIND, AURA_SPHERE
	end_party

	next_list_item; RANGERM (5) Safari Zone Eli
	db "Eli@", TRAINERTYPE_NORMAL
	mon 9, MEGANIUM
	mon 9, TROPIUS
	mon 10, VENUSAUR
	end_party

	next_list_item; RANGERM (6) Safari Zone Randal
	db "Randal@", TRAINERTYPE_NORMAL
	mon 9, TYPHLOSION
	mon 9, KANGASKHAN
	mon 10, CHARIZARD
	end_party

	next_list_item; RANGERM (7) Safari Zone Steven
	db "Steven@", TRAINERTYPE_NORMAL
	mon 9, RHYDON
	mon 9, MR__MIME
	mon 10, SCYTHER
	end_party

	next_list_item; RANGERM (8) Route 119
	db "Jackson@", TRAINERTYPE_NORMAL
	mon 8, MEGANIUM
	mon 8, GOLDUCK
	mon 8, BRELOOM
	end_party

	next_list_item; RANGERM (9) Route 119
	db "Takashi@", TRAINERTYPE_NORMAL
	mon 8, LEAFEON
	mon 8, FLAREON
	mon 8, GLACEON
	end_party

	next_list_item; RANGERM (10) Route 119
	db "Yasu@", TRAINERTYPE_NORMAL
	mon 8, ESPEON
	mon 8, UMBREON
	mon 8, SYLVEON
	end_party

	next_list_item; RANGERM (11) Route 119
	db "Hideo@", TRAINERTYPE_NORMAL
	mon 8, JOLTEON
	mon 8, POLITOED
	mon 8, XATU
	end_party

	next_list_item; RANGERM (12) Route 120
	db "Riley@", TRAINERTYPE_NORMAL
	mon 8, DUSTOX
	mon 8, POLIWRATH
	mon 8, ZANGOOSE
	end_party

	next_list_item; RANGERM (13) Route 120
	db "Lorenzo@", TRAINERTYPE_NORMAL
	mon 8, AMUK
	mon 8, QUAGSIRE
	mon 8, EXEGGCUTE
	end_party

	next_list_item; RANGERM (14) Route 120
	db "Keigo@", TRAINERTYPE_NORMAL
	mon 8, WEEZING
	mon 8, TANGROWTH
	mon 8, IKARI
	end_party

	next_list_item; RANGERM (15) Treetop Trial
	db "@", TRAINERTYPE_RANDOM, 3, TRIAL_EASY
	end_party

	end_list_items

RangerFGroupHard:
	next_list_item; STEVEN (1) Unreferenced
	db "Steven@", TRAINERTYPE_NORMAL
	mon 10, CHIKORITA
	mon 10, CYNDAQUIL
	mon 10, TOTODILE
	end_party

	next_list_item; RANGERF (2) Safari Zone Monica
	db "Monica@", TRAINERTYPE_NORMAL
	mon 9, JYNX
	mon 9, LICKITUNG
	mon 10, PINSIR
	end_party

	next_list_item; RANGERF (3) Safari Zone Tina
	db "Tina@", TRAINERTYPE_NORMAL
	mon 9, CHIMECHO
	mon 9, BRELOOM
	mon 10, DELCATTY
	end_party

	next_list_item; RANGERF (4) Safari Zone Rachael
	db "Rachael@", TRAINERTYPE_NORMAL
	mon 9, LUDICOLO
	mon 9, STANTLER
	mon 10, SLOWKING
	end_party

	next_list_item; RANGERF (5) Route 119
	db "Catherine@", TRAINERTYPE_NORMAL
	mon 7, LUVDISC
	mon 7, AZUMARILL
	mon 7, SEADRA
	end_party

	next_list_item; RANGERF (6) Route 119
	db "Rachel@", TRAINERTYPE_NORMAL
	mon 7, TORKOAL
	mon 7, TROPIUS
	mon 7, FLAREON
	end_party

	next_list_item; RANGERF (7) Route 119
	db "Dani@", TRAINERTYPE_NORMAL
	mon 7, ANINETALES
	mon 7, FROSLASS
	mon 7, DEWGONG
	end_party

	next_list_item; RANGERF (8) Route 120
	db "Jenna@", TRAINERTYPE_NORMAL
	mon 8, NINETALES
	mon 8, RAPIDASH
	mon 9, ASHIBOMB
	end_party

	end_list_items

ExplorerGroupHard:
	next_list_item; EXPLORER (1) Route 105
	db "Foster@", TRAINERTYPE_NORMAL
	mon 7, RELICANTH
	mon 7, URSARING
	mon 10, PROBOPASS
	end_party

	next_list_item; EXPLORER (2) Route 105
	db "Andres@", TRAINERTYPE_NORMAL
	mon 7, ASANDSLASH
	mon 7, CRAWDAUNT
	mon 10, ARMALDO
	end_party

	next_list_item; EXPLORER (3) Safari Zone Joey
	db "Joey@", TRAINERTYPE_NORMAL
	mon 8, ASANDSLASH
	mon 9, ASANDSHREW
	mon 10, ARMALDO
	end_party

	next_list_item; EXPLORER (4) Safari Zone Ross
	db "Ross@", TRAINERTYPE_NORMAL
	mon 8, METANG
	mon 9, CLAYDOL
	mon 10, YANMEGA
	end_party

	next_list_item; EXPLORER (5) Safari Zone Chandler
	db "Chandler@", TRAINERTYPE_NORMAL
	mon 8, WHISCASH
	mon 9, CAMERUPT
	mon 10, HARIYAMA
	end_party

	next_list_item; EXPLORER (6) Testroom
	db "Test@", TRAINERTYPE_RANDOM | TRAINERTYPE_ITEM | TRAINERTYPE_MOVES, 3, PSYCHIC_EASY	
	end_party

	next_list_item; EXPLORER (7) Lavaridge Desert
	db "Dusty@", TRAINERTYPE_NORMAL
	mon 7, GLISCOR
	mon 7, SHUCKLE
	mon 7, KLEAVOR
	end_party

	next_list_item; EXPLORER (8) Lavaridge Desert
	db "Bryan@", TRAINERTYPE_NORMAL
	mon 7, RELICANTH
	mon 7, SOLROCK
	mon 7, SLOWKING
	end_party

	next_list_item; EXPLORER (9) Route 120
	db "Chip@", TRAINERTYPE_NORMAL
	mon 7, YANMEGA
	mon 7, SKARMORY
	mon 8, KINGLER
	end_party

	next_list_item; EXPLORER (10) Route 120
	db "Dale@", TRAINERTYPE_NORMAL
	mon 7, YANMEGA
	mon 7, GLISCOR
	mon 8, MAGNEZONE
	end_party

	end_list_items

	PsychicFGroupHard:
	next_list_item; PSYCHIC_F (01) Mossdeep Gym
	db "Maura@", TRAINERTYPE_NORMAL
	mon 8, HYPNO
	mon 9, KADABRA
	end_party

	next_list_item; PSYCHIC_F (02) Mossdeep Gym
	db "Samantha@", TRAINERTYPE_NORMAL
	mon 8, MISDREAVUS
	mon 9, XATU
	end_party

	next_list_item; PSYCHIC_F (03) Mossdeep Gym
	db "Macey@", TRAINERTYPE_NORMAL
	mon 8, XATU
	mon 9, SLOWKING
	end_party

	next_list_item; PSYCHIC_F (04) Mossdeep Gym
	db "Kathleen@", TRAINERTYPE_NORMAL
	mon 8, SLOWBRO
	mon 9, BANETTE
	end_party

	next_list_item; PSYCHIC_F (05) Mossdeep Gym
	db "Sylvia@", TRAINERTYPE_NORMAL
	mon 8, GENGAR
	mon 9, MEDICHAM
	end_party

	next_list_item; PSYCHIC_F (06) Mossdeep Gym
	db "Hannah@", TRAINERTYPE_NORMAL
	mon 8, CLAYDOL
	mon 9, BUTTERFREE
	end_party

	end_list_items


	AgathaGroupHard:
	next_list_item ; AGATHA (1)
	db "Agatha@", TRAINERTYPE_MOVES
	mon 11, FROSLASS
		moves ICY_WIND, SHADOW_BALL, HAIL, ICE_BEAM
	mon 11, CROBAT
		moves FLY, SLUDGE_BOMB, CRUNCH, GIGA_DRAIN
	mon 11, MISMAGIUS
		moves SHADOW_BALL, GLARE, PAIN_SPLIT, PSYWAVE
	mon 11, PARASECT
		moves GIGA_DRAIN, SPORE, SLASH, REST
	mon 12, ARBOK
		moves CRUNCH, GLARE, DIG, SWORDS_DANCE
	mon 13, GENGAR
		moves SHADOW_BALL, HYPNOSIS, DREAM_EATER, PSYCHIC_M
	end_party

	end_list_items


	LoreleiGroupHard:
	next_list_item ; LORELEI (1)
	db "Lorelei@", TRAINERTYPE_MOVES
	mon 12, DELIBIRD
		moves RAZOR_WIND, ICY_WIND, FLY, SPIKES
	mon 11, ANINETALES
		moves ICY_WIND, BLIZZARD, HAIL, MOONBLAST
	mon 11, GLACEON
		moves CALM_MIND, BLIZZARD, MUD_SHOT, RECOVER
	mon 11, CLOYSTER
		moves BLIZZARD, SURF, REST, WHIRLPOOL
	mon 11, DEWGONG
		moves SURF, BLIZZARD, HAIL, REST
	mon 13, LAPRAS
		moves HAIL, BLIZZARD, DRAGONBREATH, REST
	end_party

	end_list_items


	FergusGroupHard:

	next_list_item ; FERGUS (1)
	db "Fergus@", TRAINERTYPE_MOVES
	mon 12, GYARADOS
		moves WATERFALL, DRAGONBREATH, THUNDERBOLT, RAIN_DANCE
	mon 11, KINGDRA
		moves ICY_WIND, BLIZZARD, SURF, THUNDER
	mon 11, NIDOQUEEN
		moves SURF, EARTHQUAKE, BODY_SLAM, POISON_JAB
	mon 11, GOLDUCK
		moves BLIZZARD, SURF, RAIN_DANCE, PSYCHIC_M
	mon 11, TENTACRUEL
		moves SURF, SLUDGE_WAVE, ICY_WIND, RECOVER
	mon 13, VAPOREON
		moves ACID_ARMOR, SURF, SNARL, REST
	end_party

	end_list_items


	NeeshaGroupHard:

	next_list_item ; NEESHA (1)
	db "Neesha@", TRAINERTYPE_MOVES
	mon 12, DEWGONG
		moves SURF, ICY_WIND, AMNESIA, REST
	mon 11, NINETALES
		moves WILLOWISP, FLAMETHROWER, SOLARBEAM, FAE_VOICE
	mon 11, WIGGLYTUFF
		moves CALM_MIND, FAE_VOICE, DRAININGKISS, REST
	mon 11, VILEPLUME
		moves PETAL_DANCE, GIGA_DRAIN, MOONLIGHT, RAZOR_LEAF
	mon 11, GRAPIDASH
		moves PLAY_ROUGH, ZEN_HEADBUTT, AGILITY, MEGAHORN
	mon 13, BLASTOISE
		moves HYDRO_PUMP, FLASHCANNON, RAPID_SPIN, SKULL_BASH
	end_party

	end_list_items


	LilyGroupHard:

	next_list_item ; LILY (1)
	db "Lily@", TRAINERTYPE_MOVES
	mon 12, NINETALES
		moves FLAMETHROWER, FAE_VOICE, WILLOWISP, RECOVER
	mon 11, CLEFABLE
		moves MOONBLAST, BODY_SLAM, ICE_PUNCH, METEOR_MASH
	mon 11, MAWILE
		moves CRUNCH, VICEGRIP, PLAY_ROUGH, SWORDS_DANCE
	mon 11, MILOTIC
		moves SURF, DRAGONBREATH, FAERIEGLEAM, WHIRLPOOL
	mon 11, SYLVEON
		moves MOONBLAST, FAE_VOICE, SNARL, REST
	mon 13, TOGEKISS
		moves MOONBLAST, MIST_BALL, MIRROR_COAT, RECOVER
	end_party

	end_list_items


	GuyGroupHard:

	next_list_item ; GUY (1)
	db "Guy@", TRAINERTYPE_MOVES
	mon 12, MEGANIUM
		moves GIGA_DRAIN, DRAGONBREATH, STUN_SPORE, BODY_SLAM
	mon 11, EXEGGUTOR
		moves EGG_BOMB, PSYCHIC_M, DRAGONBREATH, LEECH_SEED
	mon 11, PARASECT
		moves SHADOW_CLAW, SLASH, LEAF_BLADE, RECOVER
	mon 11, LUDICOLO
		moves RAIN_DANCE, SURF, GIGA_DRAIN, WHIRLPOOL
	mon 11, LEAFEON
		moves LEAF_BLADE, BODY_SLAM, SUBMISSION, RECOVER
	mon 13, VENUSAUR
		moves GIGA_DRAIN, SLUDGE_WAVE, STUN_SPORE, LEECH_SEED
	end_party

	end_list_items


	GiovanniGroupHard:

	next_list_item ; GIOVANNI (1)
	db "Giovanni@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, PERSIAN, QUICK_CLAW
		moves SLASH, BEAT_UP, PLAY_ROUGH, SWORDS_DANCE
	itemmon 12, DUGTRIO, SOFT_SAND
		moves FISSURE, STONE_EDGE, MUDDY_WATER, REFLECT
	itemmon 12, NIDOQUEEN, LEFTOVERS
		moves EARTHQUAKE, SLUDGE_BOMB, TOXIC, ICE_FANG
	itemmon 13, ARCANINE, PINK_BOW
		moves CRUNCH, SACRED_FIRE, EXTREMESPEED, FIRE_BLAST
	itemmon 13, MAROWAK, THICK_CLUB
		moves FISSURE, SHADOW_FORCE, SUBMISSION, COSMIC_POWER
	itemmon 18, MEWTWO, MIRACLEBERRY
		moves PSYCHIC_M, AURA_SPHERE, CALM_MIND, RECOVER
	end_party

	end_list_items

	WallyGroupHard:

	next_list_item ; WALLY (1)
	db "Wally@", TRAINERTYPE_NORMAL
	mon 0, RALTS
	end_party

	next_list_item ; WALLY (2)
	db "Wally@", TRAINERTYPE_NORMAL
	mon 5, SWABLU
	mon 5, SKITTY
	mon 8, RALTS
	end_party

	next_list_item ; WALLY (3)
	db "Wally@", TRAINERTYPE_NORMAL
	mon 7, MINUN
	mon 8, BARBOACH
	mon 7, SWABLU
	mon 7, DELCATTY
	mon 10, KIRLIA
	end_party

	next_list_item ; WALLY (4)
	db "Wally@", TRAINERTYPE_NORMAL
	mon 9, CHIMECHO
	mon 8, WHISCASH
	mon 7, ALTARIA
	mon 7, DELCATTY
	mon 10, GARDEVOIR
	end_party

	next_list_item ; WALLY (5)
	db "Wally@", TRAINERTYPE_NORMAL
	mon 8, CHIMECHO
	mon 8, WHISCASH
	mon 8, ALTARIA
	mon 9, TROPIUS
	mon 9, ABSOL
	mon 12, GARDEVOIR
	end_party

	next_list_item ; WALLY (6)
	db "Wally@", TRAINERTYPE_NORMAL
	mon 8, CHIMECHO
	mon 8, WHISCASH
	mon 8, ALTARIA
	mon 9, TROPIUS
	mon 9, ABSOL
	mon 12, GARDEVOIR
	end_party

	next_list_item ; WC_WALLY (7) World Cup Wally
	db "Wally@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, CHIMECHOX, LEFTOVERS
		moves CALM_MIND, WILLOWISP, RECOVER, PSYCHIC_M
	itemmon 12, WHISCASH, SOFT_SAND
		moves MUDDY_WATER, EARTHQUAKE, TOXIC, REST
	itemmon 12, ALTARIAX, DRAGON_FANG
		moves DRAGON_DANCE, DRAGON_CLAW, PLAY_ROUGH, SKY_ATTACK
	itemmon 13, TROPIUSX, MIRACLE_SEED
		moves SKY_ATTACK, LEECH_SEED, FRENZY_PLANT, RECOVER
	itemmon 13, ABSOLX, FOCUS_BAND
		moves SLASH, BEAT_UP, DRAGON_CLAW, SKY_ATTACK
	itemmon 15, GARDEVOIRX, LEFTOVERS
		moves CALM_MIND, PSYCHIC_M, MOONBLAST, RECOVER
	end_party

	end_list_items

	GreenGroupHard:

	next_list_item ; GREEN (1)
	db "Green@", TRAINERTYPE_NORMAL
	mon 3, SQUIRTLE
	end_party

	next_list_item ; GREEN (2)
	db "Green@", TRAINERTYPE_NORMAL
	mon 6, SPEAROW
	mon 7, CLEFAIRY
	mon 8, SQUIRTLE
	end_party

	next_list_item ; GREEN (3)
	db "Green@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, CLEFABLE, POLKADOT_BOW
		moves DRAININGKISS, WILLOWISP, BUBBLEBEAM, MAGICAL_LEAF
	itemmon 9, HAUNTER, BERRY
		moves NIGHT_SHADE, HEX, VENOSHOCK, HYPNOSIS
	itemmon 9, WEEPINBELL, BERRY
		moves STUN_SPORE, LEECH_SEED, VINE_WHIP, GROWTH
	itemmon 8, FEAROW, BERRY
		moves WING_ATTACK, FAINT_ATTACK, MIRROR_MOVE, SHARPEN
	itemmon 12, BLASTOISE, MYSTIC_WATER
		moves BUBBLEBEAM, RAPID_SPIN, ICE_FANG, RAIN_DANCE
	end_party

	next_list_item ; GREEN (4)
	db "Green@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, KANGASKHAN, PINK_BOW
		moves DIZZY_PUNCH, CRUNCH, DOUBLE_EDGE, EARTHQUAKE
	itemmon 10, CLEFABLE, POLKADOT_BOW
		moves MOONBLAST, WILLOWISP, BUBBLEBEAM, MAGICAL_LEAF
	itemmon 10, GENGAR, BERRY
		moves WILLOWISP, HEX, VENOSHOCK, HYPNOSIS
	itemmon 10, VICTREEBEL, BERRY
		moves STUN_SPORE, LEECH_SEED, NATURE_POWER, GROWTH
	itemmon 10, ANINETALES, BERRY
		moves ICE_BEAM, MOONBLAST, ICY_WIND, RECOVER
	itemmon 12, BLASTOISE, MYSTIC_WATER
		moves SURF, RAPID_SPIN, ICE_BEAM, RAIN_DANCE
	end_party

	next_list_item ; WC_GREEN (?) World Cup Green
	db "Green@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, KANGASKHAN, PINK_BOW
		moves DIZZY_PUNCH, CRUNCH, DOUBLE_EDGE, EARTHQUAKE
	itemmon 12, CLEFABLE, QUICK_CLAW
		moves MOONBLAST, WILLOWISP, REST, CALM_MIND
	itemmon 12, ANINETALES, NEVERMELTICE
		moves BLIZZARD, ICY_WIND, MOONBLAST, RECOVER
	itemmon 13, GENGARX, SCOPE_LENS
		moves HEX, VENOSHOCK, TOXIC, DESTINY_BOND
	itemmon 13, VICTREEBELX, LEFTOVERS
		moves TOXIC, VENOSHOCK, EARTHQUAKE, GIGA_DRAIN
	itemmon 15, BLASTOISEX, LEFTOVERS
		moves RAIN_DANCE, HYDRO_PUMP, BLIZZARD, REST
	end_party

	end_list_items

ElmGroupHard:
	next_list_item ; ELM (1)
	db "Elm@", TRAINERTYPE_ITEM_MOVES
	itemmon 15, TAUROS, QUICK_CLAW
		moves DOUBLE_EDGE, FISSURE, BULK_UP, RECOVER
	itemmon 15, NIDOKING, FOCUS_BAND
		moves COSMIC_POWER, ANCIENTPOWER, SLUDGE_BOMB, FISSURE
	itemmon 15, WYRDEER, KINGS_ROCK
		moves BODY_SLAM, HYPNOSIS, REFLECT, PSYCHIC_M
	itemmon 16, VENUSAURX, MIRACLEBERRY
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, EARTHQUAKE
	itemmon 16, CHARIZARDX, DRAGON_FANG
		moves DRAGON_CLAW, SACRED_FIRE, WILLOWISP, SKY_ATTACK
	itemmon 16, BLASTOISEX, LEFTOVERS
		moves SCALD, RAIN_DANCE, HYDRO_PUMP, COSMIC_POWER
	end_party

	end_list_items

BirchGroupHard:
	next_list_item ; BIRCH (1)
	db "Birch@", TRAINERTYPE_ITEM_MOVES
	itemmon 15, TAUROS, QUICK_CLAW
		moves DOUBLE_EDGE, FISSURE, BULK_UP, RECOVER
	itemmon 15, NIDOKING, FOCUS_BAND
		moves COSMIC_POWER, ANCIENTPOWER, SLUDGE_BOMB, FISSURE
	itemmon 15, WYRDEER, KINGS_ROCK
		moves BODY_SLAM, HYPNOSIS, REFLECT, PSYCHIC_M
	itemmon 16, VENUSAURX, MIRACLEBERRY
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, EARTHQUAKE
	itemmon 16, CHARIZARDX, DRAGON_FANG
		moves DRAGON_CLAW, SACRED_FIRE, WILLOWISP, SKY_ATTACK
	itemmon 16, BLASTOISEX, LEFTOVERS
		moves SCALD, RAIN_DANCE, HYDRO_PUMP, COSMIC_POWER
	end_party

	end_list_items

NurseGroupHard:
	next_list_item ; NURSE (1)
	db "Joy@", TRAINERTYPE_ITEM_MOVES
	itemmon 15, TAUROS, QUICK_CLAW
		moves DOUBLE_EDGE, FISSURE, BULK_UP, RECOVER
	itemmon 15, NIDOKING, FOCUS_BAND
		moves COSMIC_POWER, ANCIENTPOWER, SLUDGE_BOMB, FISSURE
	itemmon 15, WYRDEER, KINGS_ROCK
		moves BODY_SLAM, HYPNOSIS, REFLECT, PSYCHIC_M
	itemmon 16, VENUSAURX, MIRACLEBERRY
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, EARTHQUAKE
	itemmon 16, CHARIZARDX, DRAGON_FANG
		moves DRAGON_CLAW, SACRED_FIRE, WILLOWISP, SKY_ATTACK
	itemmon 16, BLASTOISEX, LEFTOVERS
		moves SCALD, RAIN_DANCE, HYDRO_PUMP, COSMIC_POWER
	end_party

	end_list_items


ENDSECTION
