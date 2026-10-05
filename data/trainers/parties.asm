; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    * for TRAINERTYPE_NORMAL:     db level, species
;    * for TRAINERTYPE_MOVES:      db level, species, 4 moves
;    * for TRAINERTYPE_ITEM:       db level, species, item
;    * for TRAINERTYPE_ITEM_MOVES: db level, species, item, 4 moves
; - end_party

; Random Trainers:
; - db "NAME@", TRAINERTYPE_RANDOM | other TRAINERTYPE_* constants, number of party pokémon, list constant (defined in constants/trainer_constants.asm)
; - end_party
; Lists of random Pokémon:
; - db length of list
; - Pokémon, separated by db $fe
; - end_party

SECTION "Enemy Trainer Parties 1", ROMX

FalknerGroup: ;Gym Leader
	next_list_item ; FALKNER (1)
	db "Falkner@", TRAINERTYPE_MOVES
	mon 6, NATU
		moves TACKLE, CONFUSE_RAY, GUST, CONFUSION
	mon 5, PIDGEY
		moves TACKLE, MUD_SLAP, GUST, LEER
	mon 7, NOCTOWL
		moves TACKLE, MUD_SLAP, GUST, CONFUSE_RAY
	end_party

	next_list_item ; FALKNER (2)
	db "Falkner@", TRAINERTYPE_MOVES
	mon 8, XATU
		moves PSYBEAM, CONFUSE_RAY, RAZOR_WIND, MUD_SLAP
	mon 8, GLIGAR
		moves MAGNITUDE, MUD_SLAP, SLASH, FAINT_ATTACK
	mon 8, FEAROW
		moves DRILL_PECK, MUD_SLAP, GUST, CONFUSION
	mon 9, NOCTOWL
		moves HYPNOSIS, MUD_SLAP, DREAM_EATER, CONFUSE_RAY
	end_party

	next_list_item ; FALKNER (3)
	db "Falkner@", TRAINERTYPE_ITEM | TRAINERTYPE_MOVES
	itemmon 8, SKARMORY, NO_ITEM
		moves DRILL_PECK, TOXIC, COSMIC_POWER, REST
	itemmon 8, XATU, NO_ITEM
		moves PSYCHIC_M, CONFUSE_RAY, RAZOR_WIND, MUD_SLAP
	itemmon 8, GLISCOR, QUICK_CLAW
		moves FISSURE, MUD_SLAP, SLASH, PURSUIT
	itemmon 8, PELIPPER, LEFTOVERS
		moves HYDRO_PUMP, PROTECT, HURRICANE, RECOVER
	itemmon 8, DELIBIRD, NO_ITEM
		moves BLIZZARD, MUD_SLAP, SKY_ATTACK, CONFUSE_RAY
	itemmon 11, NOCTOWL, TWISTEDSPOON
		moves WILLOWISP, MUD_SLAP, PSYCHIC_M, MOONBLAST
	end_party

	next_list_item ; FALKNER (4) ;World Cup Falkner
	db "Falkner@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, ARTICUNO, NO_ITEM
		moves DRILL_PECK, HURRICANE, BLIZZARD, PSYBEAM
	itemmon 10, ZAPDOS, NO_ITEM
		moves THUNDERBOLT, DRILL_PECK, RAZOR_WIND, JUMP_KICK
	itemmon 10, MOLTRES, QUICK_CLAW
		moves SKY_ATTACK, MUD_SLAP, FIRE_BLAST, PURSUIT
	itemmon 9, PELIPPER, LEFTOVERS
		moves HYDRO_PUMP, PROTECT, HURRICANE, RECOVER
	itemmon 9, DELIBIRD, NO_ITEM
		moves BLIZZARD, MUD_SLAP, SKY_ATTACK, CONFUSE_RAY
	itemmon 15, NOCTOWL, TWISTEDSPOON
		moves WILLOWISP, MUD_SLAP, PSYCHIC_M, SHADOW_BALL
	end_party

	end_list_items

WhitneyGroup: ;Gym Leader
	next_list_item ; WHITNEY (1)
	db "Whitney@", TRAINERTYPE_MOVES
	mon 8, CLEFAIRY
		moves POUND, MIMIC, ENCORE, METRONOME
	mon 8, JIGGLYPUFF
		moves POUND, SING, ENCORE, REST
	mon 10, MILTANK
		moves ROLLOUT, ATTRACT, STOMP, MILK_DRINK
	end_party
	
	next_list_item ; WHITNEY (2)
	db "Whitney@", TRAINERTYPE_MOVES	
	mon 9, WIGGLYTUFF
		moves WILLOWISP, COSMIC_POWER, DIZZY_PUNCH, REST
	mon 9, FURRET
		moves HYPER_FANG, BULK_UP, DIG, CRUNCH
	mon 9, RATICATE
		moves HYPER_FANG, SHARPEN, CRUNCH, QUICK_ATTACK
	mon 11, MILTANK
		moves ROLLOUT, BULK_UP, BODY_SLAM, MILK_DRINK
	end_party
	
	next_list_item ; WHITNEY (3)
	db "Whitney@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, FURRET2, NO_ITEM
		moves DRAGON_CLAW, DRAGON_DANCE, BODY_SLAM, CRUNCH
	itemmon 9, CLEFABLE, NO_ITEM
		moves MOONBLAST, CALM_MIND, PSYCHIC_M, METEOR_MASH
	itemmon 9, WIGGLYTUFF, LEFTOVERS
		moves WILLOWISP, COSMIC_POWER, MOONBLAST, REST
	itemmon 9, RATICATE, PINK_BOW
		moves HYPER_FANG, SWORDS_DANCE, CRUNCH, EXTREMESPEED
	itemmon 9, TAUROS, NO_ITEM
		moves BODY_SLAM, SUBMISSION, EARTHQUAKE, OUTRAGE
	itemmon 11, MILTANK, LEFTOVERS
		moves ROLLOUT, COSMIC_POWER, BODY_SLAM, MILK_DRINK
	end_party

	end_list_items

BugsyGroup: ;Gym Leader
	next_list_item ; BUGSY (1)
	db "Bugsy@", TRAINERTYPE_MOVES
	mon 8, LEDYBA
		moves MACH_PUNCH, STRING_SHOT, ICE_PUNCH, LEECH_LIFE
	mon 8, PARAS
		moves STRING_SHOT, STUN_SPORE, POISONPOWDER, RAZOR_LEAF
	mon 9, SCYTHER
		moves QUICK_ATTACK, LEER, FURY_CUTTER, BITE
	end_party
	
	next_list_item ; BUGSY (2)
	db "Bugsy@", TRAINERTYPE_MOVES
	mon 9, MASQUERAIN
		moves SURF, CONFUSE_RAY, FURY_CUTTER, SIGNAL_BEAM
	mon 9, LEDIAN
		moves MACH_PUNCH, STRING_SHOT, ICE_PUNCH, LEECH_LIFE
	mon 9, PARASECT
		moves LEAF_BLADE, STUN_SPORE, SPORE, RAZOR_LEAF
	mon 11, SCYTHER
		moves SLASH, SCARY_FACE, FURY_CUTTER, NO_MOVE
	end_party
	
	next_list_item ; BUGSY (3)
	db "Bugsy@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, MASQUERAIN, NO_ITEM
		moves HYDRO_PUMP, CONFUSE_RAY, MEDITATE, SIGNAL_BEAM
	itemmon 9, LEDIAN, NO_ITEM
		moves MACH_PUNCH, FIRE_PUNCH, ICE_PUNCH, DIZZY_PUNCH
	itemmon 9, PARASECT, NO_ITEM
		moves LEAF_BLADE, STUN_SPORE, SPORE, SLASH
	itemmon 10, SCYTHER2, NO_ITEM
		moves SLASH, SWORDS_DANCE, FURY_CUTTER, PSYCHO_CUT
	itemmon 10, SCIZOR2, LEFTOVERS
		moves SLASH, VICEGRIP, SWORDS_DANCE, BULLET_PUNCH
	end_party

	end_list_items

MortyGroup: ;Gym Leader
	next_list_item ; MORTY (1)
	db "Morty@", TRAINERTYPE_MOVES
	mon 8, VULPIX
		moves LICK, HYPNOSIS, EMBER, WILLOWISP
	mon 8, HAUNTER
		moves LICK, SPITE, MEAN_LOOK, CURSE
	mon 8, MAROWAK
		moves BONEMERANG, HEADBUTT, LICK, FOCUS_ENERGY
	mon 9, MISDREAVUS
		moves LICK, WILLOWISP, CONFUSE_RAY, NIGHT_SHADE
	end_party
	
	next_list_item ; MORTY (2)
	db "Morty@", TRAINERTYPE_MOVES
	mon 9, NINETALES
		moves SHADOW_BALL, HYPNOSIS, FLAMETHROWER, WILLOWISP
	mon 9, HAUNTER
		moves LICK, THUNDERBOLT, SMOG, SHADOW_BALL
	mon 9, MAROWAK
		moves BONEMERANG, HEADBUTT, SHADOW_BALL, BONE_CLUB
	mon 11, MISDREAVUS
		moves SHADOW_BALL, WILLOWISP, CONFUSE_RAY, NIGHT_SHADE
	end_party
	
	next_list_item ; MORTY (3)
	db "Morty@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, PARASECT, QUICK_CLAW
		moves DESTINY_BOND, SHADOW_CLAW, NO_MOVE, NO_MOVE
	itemmon 9, NINETALES, NO_ITEM
		moves SHADOW_BALL, LUSTER_PURGE, FIRE_BLAST, WILLOWISP
	itemmon 9, MAROWAK, THICK_CLUB
		moves EARTHQUAKE, HEADBUTT, SHADOW_CLAW, MUD_SHOT
	itemmon 9, WYRDEER, NO_ITEM
		moves HYPNOSIS, BODY_SLAM, SHADOW_BALL, DREAM_EATER
	itemmon 9, MISMAGIUS, SPELL_TAG
		moves SHADOW_BALL, WILLOWISP, CONFUSE_RAY, CALM_MIND
	itemmon 11, GENGARX, SPELL_TAG
		moves PSYCHIC_M, THUNDERBOLT, SLUDGE_BOMB, SHADOW_BALL
	end_party

	end_list_items

PryceGroup: ;Gym Leader
	next_list_item ; PRYCE (1)
	db "Pryce@", TRAINERTYPE_MOVES
	mon 8, DELIBIRD
		moves ICY_WIND, GUST, AURORA_BEAM, SPIKES
	mon 8, JYNX
		moves PERISH_SONG, PSYBEAM, ICE_PUNCH, LOVELY_KISS
	mon 9, SNEASEL
		moves ICE_PUNCH, SLASH, AURORA_BEAM, PURSUIT
	end_party
	
	next_list_item ; PRYCE (2)
	db "Pryce@", TRAINERTYPE_MOVES
	mon 9, DELIBIRD
		moves BLIZZARD, RAZOR_WIND, ICY_WIND, SPIKES
	mon 9, JYNX
		moves PERISH_SONG, PSYBEAM, ICE_PUNCH, LOVELY_KISS
	mon 9, SNEASEL
		moves ICE_PUNCH, SLASH, MACH_PUNCH, PURSUIT
	mon 11, PILOSWINE
		moves EARTHQUAKE, BLIZZARD, BULK_UP, BODY_SLAM
	end_party
	
	next_list_item ; PRYCE (3)
	db "Pryce@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, DELIBIRD, NO_ITEM
		moves BLIZZARD, RAZOR_WIND, ICY_WIND, SPIKES
	itemmon 9, WALREIN, LEFTOVERS
		moves SURF, HAIL, BLIZZARD, REST
	itemmon 9, JYNX, NO_ITEM
		moves HAIL, PSYCHIC_M, BLIZZARD, LOVELY_KISS
	itemmon 9, WEAVILE, NO_ITEM
		moves ICICLE_CRASH, SLASH, MACH_PUNCH, PURSUIT
	itemmon 10, MAMOSWINE, NO_ITEM
		moves EARTHQUAKE, ICICLE_CRASH, BULK_UP, BODY_SLAM
	itemmon 11, GLALIEX, NEVERMELTICE
		moves ICICLE_CRASH, CRUNCH, REST, COSMIC_POWER
	end_party

	end_list_items

JasmineGroup: ;Gym Leader
	next_list_item ; JASMINE (1)
	db "Jasmine@", TRAINERTYPE_MOVES
	mon 8, MAGNEMITE
		moves METAL_CLAW, SUPERSONIC, THUNDER_WAVE, THUNDERSHOCK
	mon 8, KRABBY
		moves BUBBLEBEAM, CUT, CRABHAMMER, HARDEN
	mon 9, SKARMORY
		moves SLASH, STEEL_WING, AGILITY, WING_ATTACK
	end_party
	
	next_list_item ; JASMINE (2)
	db "Jasmine@", TRAINERTYPE_MOVES
	mon 9, MAWILE
		moves SANDSTORM, VICEGRIP, CRUNCH, DIZZY_PUNCH
	mon 9, MAGNETON
		moves TRI_ATTACK, SWIFT, THUNDER_WAVE, SHOCK_WAVE
	mon 9, KINGLER
		moves CRUSH_CLAW, VICEGRIP, CRABHAMMER, PROTECT
	mon 11, SKARMORY
		moves SLASH, STEEL_WING, AGILITY, WING_ATTACK
	end_party
	
	next_list_item ; JASMINE (3)
	db "Jasmine@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, SKARMORY, NO_ITEM
		moves SLASH, VICEGRIP, SANDSTORM, SKY_ATTACK
	itemmon 9, MAWILE, NO_ITEM
		moves SANDSTORM, VICEGRIP, CRUNCH, DIZZY_PUNCH
	itemmon 9, MAGNEZONE, MAGNET
		moves TRI_ATTACK, CHARGE, FLASHCANNON, ZAP_CANNON
	itemmon 9, KINGLER, METAL_COAT
		moves CRUSH_CLAW, VICEGRIP, CRABHAMMER, PROTECT
	itemmon 10, AGGRON, NO_ITEM
		moves GUILLOTINE, EARTHQUAKE, BULK_UP, SANDSTORM
	itemmon 11, STEELIXX, LEFTOVERS
		moves IRON_TAIL, FISSURE, COSMIC_POWER, SANDSTORM
	end_party

	end_list_items

ChuckGroup: ;Gym Leader
	next_list_item ; CHUCK (1)
	db "Chuck@", TRAINERTYPE_MOVES
	mon 9, HITMONCHAN
		moves MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	mon 9, HITMONLEE
		moves MEGA_KICK, JUMP_KICK, FAINT_ATTACK, HI_JUMP_KICK
	mon 9, HITMONTOP
		moves ROLLING_KICK, SLAM, MACH_PUNCH, FAINT_ATTACK
	end_party
	
	next_list_item ; CHUCK (2)
	db "Chuck@", TRAINERTYPE_MOVES
	mon 9, HITMONCHAN
		moves MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	mon 9, HITMONLEE
		moves MEGA_KICK, JUMP_KICK, FAINT_ATTACK, HI_JUMP_KICK
	mon 9, HITMONTOP
		moves ROLLING_KICK, SLAM, MACH_PUNCH, FAINT_ATTACK
	mon 11, BRELOOM
		moves LEAF_BLADE, SPORE, MACH_PUNCH, CROSS_CHOP
	end_party
	
	next_list_item ; CHUCK (3)
	db "Chuck@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, HITMONCHAN, NO_ITEM
		moves MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	itemmon 9, HITMONLEE, NO_ITEM
		moves BLAZE_KICK, EXTREMESPEED, PURSUIT, HI_JUMP_KICK
	itemmon 9, BRELOOM, NO_ITEM
		moves LEAF_BLADE, SPORE, MACH_PUNCH, SWORDS_DANCE
	itemmon 9, MEDICHAM, NO_ITEM
		moves BULLET_PUNCH, ZEN_HEADBUTT, BULK_UP, SHADOW_PUNCH
	itemmon 10, POLIWRATH, BLACKBELT_I
		moves SURF, DYNAMICPUNCH, MACH_PUNCH, HYPNOSIS
	itemmon 11, KINGLERX, QUICK_CLAW
		moves AQUA_JET, CURSE, CRABHAMMER, GUILLOTINE
	end_party

	end_list_items

ClairGroup: ;Gym Leader
	next_list_item ; CLAIR (1)
	db "Clair@", TRAINERTYPE_MOVES
	mon 9, GYARADOS
		moves DRAGONBREATH, WATERFALL, WHIRLPOOL, RAIN_DANCE
	mon 9, DRAGONAIR
		moves THUNDER_WAVE, SURF, SLAM, DRAGONBREATH
	mon 9, LAPRAS
		moves BLIZZARD, SURF, THUNDER, RAIN_DANCE
	end_party
	
	next_list_item ; CLAIR (1)
	db "Clair@", TRAINERTYPE_MOVES
	mon 9, GYARADOS
		moves DRAGONBREATH, WATERFALL, WHIRLPOOL, RAIN_DANCE
	mon 9, OCTILLERY
		moves OCTAZOOKA, SURF, ICE_BEAM, DRAGONBREATH
	mon 9, LAPRAS
		moves BLIZZARD, SURF, THUNDER, RAIN_DANCE
	mon 11, KINGDRA
		moves AGILITY, HYDRO_PUMP, THUNDER, OUTRAGE
	end_party
	
	next_list_item ; CLAIR (3)
	db "CLAIR@", TRAINERTYPE_ITEM_MOVES	
	itemmon 12, DRAGONITEY, LEFTOVERS
		moves DRAGONBREATH, SCALD, CALM_MIND, REST
	end_party

	end_list_items

Rival1Group:
	next_list_item ; RIVAL1 (1)
	db "?@", TRAINERTYPE_NORMAL
	mon 1, TEDDIURSA
	end_party

	next_list_item ; RIVAL1 (2)
	db "?@", TRAINERTYPE_NORMAL
	mon 6, MAREEP
	mon 6, NATU
	mon 7, REMORAID
	mon 10, TEDDIURSA
	end_party

	next_list_item ; RIVAL1 (3)
	db "?@", TRAINERTYPE_NORMAL
	mon 5, PINECO
	mon 7, FLAAFFY
	mon 7, XATU
	mon 7, REMORAID
	mon 10, URSARING
	end_party

	next_list_item ; RIVAL1 (4)
	db "?@", TRAINERTYPE_NORMAL
	mon 6, FORRETRESS
	mon 7, SNEASEL
	mon 7, AMPHAROS
	mon 8, XATU
	mon 9, OCTILLERY
	mon 11, URSARING
	end_party

	next_list_item ; RIVAL1 (5)
	db "?@", TRAINERTYPE_NORMAL
	mon 10, FORRETRESS
	mon 11, WEAVILE
	mon 11, AMPHAROS
	mon 11, XATU
	mon 11, OCTILLERY
	mon 12, URSALUNA
	end_party

	end_list_items

OakGroup:
	next_list_item ; OAK (1)
	db "Oak@", TRAINERTYPE_MOVES
	mon 15, TAUROS
		moves DOUBLE_EDGE, FISSURE, BULK_UP, RECOVER
	mon 15, NIDOKING
		moves COSMIC_POWER, ANCIENTPOWER, SLUDGE_BOMB, FISSURE
	mon 15, WYRDEER
		moves BODY_SLAM, HYPNOSIS, REFLECT, PSYCHIC_M
	mon 15, VENUSAURX
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, EARTHQUAKE
	mon 15, CHARIZARDX
		moves DRAGON_CLAW, SACRED_FIRE, WILLOWISP, SKY_ATTACK
	mon 15, BLASTOISEX
		moves SCALD, RAIN_DANCE, HYDRO_PUMP, COSMIC_POWER
	end_party

	end_list_items

WillGroup:	;Elite 4
	next_list_item ; WILL (1)
	db "Will@", TRAINERTYPE_MOVES
	mon 9, GARDEVOIR
		moves PSYCHIC_M, SWIFT, CALM_MIND, HYPNOSIS
	mon 9, LUNATONE
		moves COSMIC_POWER, ANCIENTPOWER, FUTURE_SIGHT, PSYCHIC_M
	mon 9, EXEGGUTOR
		moves STUN_SPORE, LEECH_SEED, EGG_BOMB, PSYCHIC_M
	mon 9, GIRAFARIG
		moves PURSUIT, CALM_MIND, BODY_SLAM, PSYCHIC_M
	mon 10, SLOWKING
		moves SURF, CALM_MIND, FLAMETHROWER, PSYCHIC_M
	mon 11, ESPEON
		moves BODY_SLAM, REFLECT, SHADOW_BALL, PSYCHIC_M
	end_party
	
	next_list_item ; WILL (2)
	db "Will@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, GARDEVOIR, NO_ITEM
		moves DREAM_EATER, MOONBLAST, CALM_MIND, HYPNOSIS
	itemmon 11, CLAYDOL, LEFTOVERS
		moves COSMIC_POWER, ANCIENTPOWER, REST, PSYCHIC_M
	itemmon 11, ESPEON, NO_ITEM
		moves BODY_SLAM, REFLECT, SHADOW_BALL, PSYCHIC_M
	itemmon 11, WYRDEER, MIRACLEBERRY
		moves PURSUIT, EARTHQUAKE, HYPNOSIS, DREAM_EATER
	itemmon 12, XATU, NO_ITEM
		moves SKY_ATTACK, HYPNOSIS, SHADOW_BALL, PSYCHIC_M
	itemmon 13, SLOWBROX, LEFTOVERS
		moves SCALD, COSMIC_POWER, REST, PSYCHIC_M
	end_party

	end_list_items

PKMNTrainerGroup:
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

BrunoGroup: ;Elite 4
	next_list_item ; BRUNO (1)
	db "Bruno@", TRAINERTYPE_MOVES
	mon 9, HITMONTOP
		moves PURSUIT, TRIPLE_KICK, DIG, DETECT
	mon 9, HITMONLEE
		moves SWAGGER, MEGA_KICK, HI_JUMP_KICK, FORESIGHT
	mon 9, HITMONCHAN
		moves THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, DYNAMICPUNCH
	mon 9, STEELIX
		moves IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	mon 10, MACHAMP
		moves ROCK_SLIDE, MACH_PUNCH, FISSURE, CROSS_CHOP
	mon 11, HERACROSS
		moves MEGAHORN, CROSS_CHOP, BODY_SLAM, EARTHQUAKE
	end_party
	
	next_list_item ; BRUNO (2)
	db "Bruno@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, BLAZIKEN, NO_ITEM
		moves DRILL_PECK, BLAZE_KICK, HI_JUMP_KICK, DETECT
	itemmon 11, HITMONCHAN, NO_ITEM
		moves THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, DYNAMICPUNCH
	itemmon 11, STEELIX, NO_ITEM
		moves IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	itemmon 11, MACHAMP, NO_ITEM
		moves ROCK_SLIDE, MACH_PUNCH, FISSURE, CROSS_CHOP
	itemmon 12, ANNIHILAPE, QUICK_CLAW
		moves MEGAHORN, CROSS_CHOP, SHADOW_PUNCH, EARTHQUAKE
	itemmon 13, HERACROSSX, QUICK_CLAW
		moves MEGAHORN, MACH_PUNCH, HI_JUMP_KICK, PURSUIT
	end_party

	end_list_items

KarenGroup: ;Elite 4
	next_list_item ; KAREN (1)
	db "Karen@", TRAINERTYPE_MOVES
	mon 9, UMBREON
		moves CONFUSE_RAY, TOXIC, SNARL, REST
	mon 9, HOUNDOOM
		moves ROAR, CRUNCH, FLAMETHROWER, MUD_SLAP
	mon 9, VILEPLUME
		moves STUN_SPORE, SLUDGE_BOMB, SWIFT, PETAL_DANCE
	mon 9, GENGAR
		moves SHADOW_BALL, HYPNOSIS, DREAM_EATER, SLUDGE_BOMB
	mon 10, ABSOL
		moves EXTREMESPEED, DRILL_PECK, PURSUIT, SKY_ATTACK
	mon 11, TYRANITAR
		moves CRUNCH, ROCK_SLIDE, EARTHQUAKE, OUTRAGE
	end_party
	
	next_list_item ; KAREN (2)
	db "Karen@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, UMBREON, NO_ITEM
		moves CONFUSE_RAY, TOXIC, SNARL, REST
	itemmon 11, UNOWN, NO_ITEM
		moves GLARE, COSMIC_POWER, PURSUIT, DESTINY_BOND
	itemmon 11, DUSKNOIR, NO_ITEM
		moves SHADOW_FORCE, HYPNOSIS, DREAM_EATER, ICY_WIND
	itemmon 11, GENGAR, NO_ITEM
		moves SHADOW_BALL, HYPNOSIS, DREAM_EATER, SLUDGE_WAVE
	itemmon 12, HONCHKROW, SHARP_BEAK
		moves EXTREMESPEED, DRILL_PECK, PURSUIT, SKY_ATTACK
	itemmon 13, TYRANITARX, FOCUS_BAND
		moves CRUNCH, STONE_EDGE, EARTHQUAKE, OUTRAGE
	end_party

	end_list_items

KogaGroup: ;Elite 4
	next_list_item ; KOGA (1)
	db "Koga@", TRAINERTYPE_MOVES
	mon 9, FORRETRESS
		moves PROTECT, SWIFT, EXPLOSION, SPIKES
	mon 9, WEEZING
		moves FIRE_BLAST, SLUDGE_BOMB, EXPLOSION, TOXIC
	mon 9, BEEDRILL
		moves TWINEEDLE, SLUDGE_BOMB, TOXIC, EXTREMESPEED
	mon 9, VENOMOTH
		moves PSYCHIC_M, DOUBLE_TEAM, SHADOW_BALL, TOXIC
	mon 10, AMUK
		moves MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	mon 11, CROBAT
		moves EXTREMESPEED, SWIFT, SKY_ATTACK, SLUDGE_BOMB
	end_party
	
	next_list_item ; KOGA (2)
	db "Koga@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, TENTACRUEL, LEFTOVERS
		moves COSMIC_POWER, SURF, ICY_WIND, POWER_GEM
	itemmon 11, WEEZING, NO_ITEM
		moves FIRE_BLAST, SLUDGE_BOMB, EXPLOSION, WILLOWISP
	itemmon 11, VENOMOTH, NO_ITEM
		moves PSYCHIC_M, DOUBLE_TEAM, SHADOW_BALL, CONFUSE_RAY
	itemmon 11, AMUK, NO_ITEM
		moves MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	itemmon 12, CROBAT, NO_ITEM
		moves EXTREMESPEED, CONFUSE_RAY, SKY_ATTACK, SLUDGE_BOMB
	itemmon 13, SWALOTX, LEFTOVERS
		moves COSMIC_POWER, TOXIC, SLUDGE_BOMB, REST
	end_party

	end_list_items

ChampionGroup: ;Elite 4
	next_list_item ; CHAMPION (1)
	db "Lance@", TRAINERTYPE_MOVES
	mon 11, GYARADOS
		moves THUNDER, RAIN_DANCE, HYDRO_PUMP, HYPER_BEAM
	mon 11, LAPRAS
		moves BLIZZARD, RAIN_DANCE, THUNDER, HYDRO_PUMP
	mon 11, SNORLAX
		moves REST, CURSE, EARTHQUAKE, HYPER_BEAM
	mon 11, AERODACTYL
		moves SKY_ATTACK, ANCIENTPOWER, STRENGTH, HYPER_BEAM
	mon 12, CHARIZARD
		moves FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, HYPER_BEAM
	mon 13, DRAGONITE
		moves FIRE_BLAST, THUNDER, OUTRAGE, HYPER_BEAM
	end_party
	
	next_list_item ; CHAMPION (2)
	db "Lance@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, GYARADOS, NO_ITEM
		moves FIRE_FANG, OUTRAGE, WATERFALL, AQUA_JET
	itemmon 12, TOGEKISS, MINT_BERRY
		moves REST, MOONBLAST, MIST_BALL, OUTRAGE
	itemmon 12, DRAGONITE, NO_ITEM
		moves WATERFALL, THUNDER, OUTRAGE, HYPER_BEAM
	itemmon 12, CHARIZARD, NO_ITEM
		moves FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, HYPER_BEAM
	itemmon 12, FLYGON, FOCUS_BAND
		moves DRAGON_CLAW, DRAGON_DANCE, EXTREMESPEED, EARTHQUAKE
	end_party

	next_list_item ; CHAMPION (3)
	db "Lance@", TRAINERTYPE_MOVES
	mon 15, DRAGONITEX
		moves WATERFALL, EXTREMESPEED, OUTRAGE, HYPER_BEAM
	end_party

	end_list_items

BrockGroup: ;Gym Leader
	next_list_item ; BROCK (1)
	db "Brock@", TRAINERTYPE_MOVES
	mon 3, GEODUDE
		moves ROCK_THROW, HARDEN, BIDE, SAND_ATTACK
	mon 3, OMANYTE
		moves BITE, BUBBLE, TACKLE, NO_MOVE
	mon 5, ONIX
		moves BIDE, SCREECH, WRAP, ROCK_THROW
	end_party
	
	next_list_item ; BROCK (2)
	db "Brock@", TRAINERTYPE_MOVES
	mon 8, GRAVELER
		moves ROCK_TOMB, DIG, ANCIENTPOWER, SANDSTORM
	mon 8, ONIX
		moves ROCK_TOMB, DIG, SLAM, SANDSTORM
	mon 8, RELICANTH
		moves ROCK_TOMB, BUBBLEBEAM, ROCK_SLIDE, SANDSTORM
	mon 9, KABUTOPS
		moves SLASH, ROCK_TOMB, ICE_PUNCH, SANDSTORM
	mon 9, OMASTAR
		moves CRUNCH, SURF, PROTECT, SPIKE_CANNON
	mon 11, RHYDON
		moves DRAGON_CLAW, EARTHQUAKE, BULK_UP, ROCK_TOMB
	end_party
	
	next_list_item ; BROCK (3)
	db "Brock@", TRAINERTYPE_ITEM_MOVES
	itemmon 8, AGOLEM, MAGNET
		moves THUNDERBOLT, STONE_EDGE, SANDSTORM, EARTHQUAKE
	itemmon 8, STEELIX, NO_ITEM
		moves STONE_EDGE, EARTHQUAKE, VICEGRIP, SANDSTORM
	itemmon 9, KABUTOPS, NO_ITEM
		moves SLASH, ROCK_TOMB, ICE_PUNCH, SANDSTORM
	itemmon 9, OMASTAR, NO_ITEM
		moves CRUNCH, SURF, PROTECT, SPIKE_CANNON
	itemmon 10, RHYPERIOR, LEFTOVERS
		moves ROCK_TOMB, STONE_EDGE, DRAGON_CLAW, SANDSTORM
	itemmon 11, AERODACTYLX, KINGS_ROCK
		moves DRILL_PECK, DRAGON_CLAW, CRUNCH, STONE_EDGE
	end_party

	end_list_items

MistyGroup: ;Gym Leader
	next_list_item ; MISTY (1)
	db "Misty@", TRAINERTYPE_MOVES
	mon 7, PSYDUCK
		moves BUBBLE, DISABLE, SCRATCH, CONFUSION
	mon 7, CHINCHOU
		moves BUBBLE, THUNDERSHOCK, RAIN_DANCE, WHIRLPOOL
	mon 10, STARMIE
		moves BUBBLEBEAM, CONFUSION, RECOVER, POWDER_SNOW
	end_party
	
	next_list_item ; MISTY (2)
	db "Misty@", TRAINERTYPE_MOVES
	mon 7, PELIPPER
		moves SURF, THUNDER, RAIN_DANCE, WHIRLPOOL
	mon 8, SEAKING
		moves SURF, DRILL_PECK, RAIN_DANCE, WATERFALL
	mon 8, MASQUERAIN
		moves SURF, TWINEEDLE, SIGNAL_BEAM, RAIN_DANCE
	mon 9, GOLDUCK
		moves SURF, SLASH, CALM_MIND, PSYBEAM
	mon 11, STARMIE
		moves SURF, PSYCHIC_M, RECOVER, CALM_MIND
	end_party
	
	next_list_item ; MISTY (3)
	db "Misty@", TRAINERTYPE_ITEM_MOVES
	itemmon 8, LUVDISC, NO_ITEM
		moves SURF, AQUA_JET, RAIN_DANCE, SCALD
	itemmon 8, SEAKING, NO_ITEM
		moves AQUA_JET, DRILL_PECK, RAIN_DANCE, WATERFALL
	itemmon 8, GOLDUCK, MIRACLEBERRY
		moves SURF, THUNDER, MEDITATE, PSYCHIC_M
	itemmon 10, MILOTIC, NO_ITEM
		moves SURF, BLIZZARD, CALM_MIND, REST
	itemmon 10, LAPRAS, LEFTOVERS
		moves SURF, BLIZZARD, CALM_MIND, REST
	itemmon 11, STARMIE, KINGS_ROCK
		moves SURF, PSYCHIC_M, RECOVER, CALM_MIND
	end_party

	end_list_items

LtSurgeGroup: ;Gym Leader
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
	mon 11, RAICHU
		moves DIG, SURF, THUNDERBOLT, CHARGE
	mon 11, ARAICHU
		moves SURF, EXTRASENSORY, CHARGE, THUNDERBOLT
	end_party
	
	next_list_item ; LT_SURGE (3)
	db "Lt.Surge@", TRAINERTYPE_ITEM_MOVES
	itemmon 8, LANTURN, NO_ITEM
		moves SURF, THUNDER, ICE_BEAM, RAIN_DANCE
	itemmon 8, JOLTEON, MAGNET
		moves THUNDER, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	itemmon 9, ELECTIVIRE, MAGNET
		moves ZAP_CANNON, THUNDERPUNCH, DIZZY_PUNCH, THUNDERBOLT
	itemmon 10, RAICHU, KINGS_ROCK
		moves THUNDER, BEAT_UP, VOLT_TACKLE, SURF
	itemmon 10, ARAICHU, MYSTIC_WATER
		moves THUNDER, RAIN_DANCE, SURF, EXTRASENSORY
	itemmon 11, ZAPDOS, KINGS_ROCK
		moves DRILL_PECK, FLASHCANNON, VOLT_TACKLE, THUNDERBOLT
	end_party

	end_list_items

ScientistGroup:
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

ErikaGroup: ;Gym Leader
	next_list_item ; ERIKA (1)
	db "Erika@", TRAINERTYPE_MOVES
	mon 8, SKIPLOOM
		moves POISONPOWDER, VENOSHOCK, STUN_SPORE, MAGICAL_LEAF
	mon 8, TANGELA
		moves STUN_SPORE, REFLECT, MAGICAL_LEAF, SLEEP_POWDER
	mon 11, BELLOSSOM
		moves SUNNY_DAY, POISONPOWDER, VENOSHOCK, MAGICAL_LEAF
	end_party
	
	next_list_item ; ERIKA (2)
	db "Erika@", TRAINERTYPE_MOVES
	mon 8, SUNFLORA
		moves FLAMETHROWER, REFLECT, GIGA_DRAIN, SUNNY_DAY
	mon 8, JUMPLUFF
		moves MAGICAL_LEAF, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	mon 9, VICTREEBEL
		moves SUNNY_DAY, NATURE_POWER, SLUDGE_BOMB, RAZOR_LEAF
	mon 9, LUDICOLO
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, SURF
	mon 11, BELLOSSOM
		moves SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SOLARBEAM
	end_party
	
	next_list_item ; ERIKA (3)
	db "Erika@", TRAINERTYPE_ITEM_MOVES
	itemmon 8, SUNFLORA, NO_ITEM
		moves STUN_SPORE, FIRE_BLAST, SOLARBEAM, SUNNY_DAY
	itemmon 8, JUMPLUFF, NO_ITEM
		moves SKY_ATTACK, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	itemmon 9, LUDICOLO, NO_ITEM
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, SURF
	itemmon 9, TROPIUS, NO_ITEM
		moves SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SKY_ATTACK
	itemmon 11, BELLOSSOM, NO_ITEM
		moves SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SOLARBEAM
	itemmon 11, VICTREEBELX, LEFTOVERS
		moves SUNNY_DAY, SOLARBEAM, SLUDGE_BOMB, RAZOR_LEAF
	end_party

	end_list_items

SECTION "Enemy Trainer Parties 1.5", ROMX

YoungsterGroup:
	next_list_item ; YOUNGSTER (1) Route 30 
	db "Joey@", TRAINERTYPE_NORMAL
	mon 1, RATTATA
	end_party

	next_list_item ; YOUNGSTER (2) Route 30
	db "Mikey@", TRAINERTYPE_NORMAL
	mon 1, PIDGEY
	mon 1, RATTATA
	end_party

	next_list_item ; YOUNGSTER (3) Route 32
	db "Albert@", TRAINERTYPE_NORMAL
	mon 2, RATTATA
	mon 3, ZUBAT
	end_party

	next_list_item ; YOUNGSTER (4) Route 32
	db "Gordon@", TRAINERTYPE_NORMAL
	mon 4, WOOPER
	mon 4, MUDKIP
	end_party

	next_list_item ; YOUNGSTER (5) Route 34
	db "Samuel@", TRAINERTYPE_NORMAL
	mon 3, RATTATA
	mon 3, SANDSHREW
	mon 5, TAILLOW
	mon 6, SHROOMISH
	end_party

	next_list_item ; YOUNGSTER (6) Route 34
	db "Ian@", TRAINERTYPE_NORMAL
	mon 3, MANKEY
	mon 4, SWINUB
	mon 5, DIGLETT
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
	mon 9, GIRAFARIG
	mon 7, BALTOY
	mon 7, POLIWHIRL
	mon 3, FEEBAS
	mon 7, SKIPLOOM
	mon 10, ANINETALES
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
	mon 5, GEODUDE
	end_party

	next_list_item ; YOUNGSTER (19) Rustboro Gym
	db "Tommy@", TRAINERTYPE_NORMAL
	mon 5, SANDSHREW
	end_party

	next_list_item ; YOUNGSTER (20) Route 102
	db "Calvin@", TRAINERTYPE_NORMAL
	mon 0, POOCHYENA
	mon 0, TAILLOW
	end_party

	next_list_item ; YOUNGSTER (21) Route 102
	db "Allen@", TRAINERTYPE_NORMAL
	mon 0, ZIGZAGOON
	mon 0, TAILLOW
	end_party

	next_list_item ; YOUNGSTER (22) Route 104
	db "Billy@", TRAINERTYPE_NORMAL
	mon 3, ZIGZAGOON
	mon 3, SEEDOT
	end_party

	next_list_item ; YOUNGSTER (23) Route 116
	db "Joey@", TRAINERTYPE_NORMAL
	mon 5, MACHOP
	end_party

	next_list_item ; YOUNGSTER (24) Route 116
	db "Johnson@", TRAINERTYPE_NORMAL
	mon 5, SHROOMISH
	mon 5, LOTAD
	end_party

	next_list_item ; YOUNGSTER (25) Route 110
	db "Timmy@", TRAINERTYPE_NORMAL
	mon 5, ARON
	mon 5, ELECTRIKE
	end_party

	next_list_item ; YOUNGSTER (26) Mount Moon
	db "Josh@", TRAINERTYPE_NORMAL
	mon 3, ARON
	mon 4, ELECTRIKE
	mon 5, RATTATA
	end_party

	next_list_item ; YOUNGSTER (27) Route 113
	db "Lao@", TRAINERTYPE_NORMAL
	mon 3, KOFFING
	mon 4, GRIMER
	mon 5, DUSTOX
	end_party

	next_list_item ; YOUNGSTER (28) Route 113
	db "Dillon@", TRAINERTYPE_NORMAL
	mon 3, AGRIMER
	mon 4, GULPIN
	mon 5, PARASECT
	end_party

	end_list_items

SECTION "Enemy Trainer Parties 2", ROMX

SchoolboyGroup:
	next_list_item ; SCHOOLBOY (1) National Park 
	db "Jack@", TRAINERTYPE_NORMAL
	mon 2, ODDISH
	mon 3, SWABLU
	mon 5, VOLTORB
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
	mon 0, RATTATA
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
	mon 7, PIKACHU
	mon 7, LINOONE
	end_party

	next_list_item ; SCHOOLBOY (14) Route 118
	db "Dale@", TRAINERTYPE_NORMAL
	mon 3, MINUN
	mon 5, RAITORA
	end_party

	end_list_items

BirdKeeperGroup:
	next_list_item ; BIRD_KEEPER (1) Violet City Gym
	db "Rod@", TRAINERTYPE_RANDOM, 3, BIRDS_EASY
	end_party

	next_list_item ; BIRD_KEEPER (2) Violet City Gym
	db "Abe@", TRAINERTYPE_RANDOM, 3, BIRDS_EASY
	end_party

	next_list_item ; BIRD_KEEPER (3) Route 35
	db "Bryan@", TRAINERTYPE_NORMAL
	mon 4, PIDGEY
	mon 6, PIDGEOTTO
	mon 4, TAILLOW
	mon 6, SWELLOW
	end_party

	next_list_item ; BIRD_KEEPER (4) Glitter Lighthouse - 3F
	db "Theo@", TRAINERTYPE_NORMAL
	mon 4, PIDGEY
	mon 6, PIDGEOTTO
	mon 4, TAILLOW
	mon 6, SWELLOW
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
	mon 7, FARFETCH_D
	mon 7, GOLBAT
	mon 7, FEAROW
	mon 7, AERODACTYL
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
	mon 6, FEAROW
	mon 7, TOGETIC
	mon 8, SKIPLOOM
	mon 9, SWELLOW
	end_party

	next_list_item ; BIRD_KEEPER (21) Fortree Gym
	db "Humbert@", TRAINERTYPE_NORMAL
	mon 7, SKARMORY
	mon 7, DODRIO
	end_party

	next_list_item ; BIRD_KEEPER (22) Fortree Gym
	db "Jared@", TRAINERTYPE_NORMAL
	mon 7, FEAROW
	mon 7, SKIPLOOM
	end_party

	next_list_item ; BIRD_KEEPER (23) Fortree Gym
	db "Edwardo@", TRAINERTYPE_NORMAL
	mon 7, PIDGEOT
	mon 7, NOCTOWL
	end_party

	next_list_item ; BIRD_KEEPER (24) Fortree Gym
	db "Darius@", TRAINERTYPE_NORMAL
	mon 7, FARFETCH_D
	mon 7, BEAUTIFLY
	end_party

	next_list_item ; BIRD_KEEPER (25) Route 118
	db "Chester@", TRAINERTYPE_NORMAL
	mon 4, FEAROW
	mon 6, DUSTOX
	end_party

	next_list_item ; BIRD_KEEPER (26) Route 118
	db "Perry@", TRAINERTYPE_NORMAL
	mon 4, GOLBAT
	mon 6, GLIGAR
	end_party

	next_list_item ; BIRD_KEEPER (27) Route 113
	db "Coby@", TRAINERTYPE_NORMAL
	mon 6, SKARMORY
	mon 4, SWELLOW
	end_party

	next_list_item ; BIRD_KEEPER (28) Route 119
	db "Phil@", TRAINERTYPE_NORMAL
	mon 5, FEAROW
	mon 5, SWELLOW
	end_party

	next_list_item ; BIRD_KEEPER (29) Route 119
	db "Hugh@", TRAINERTYPE_NORMAL
	mon 5, WINGULL
	mon 5, TROPIUS
	end_party

	next_list_item ; BIRD_KEEPER (30) Route 120
	db "Robert@", TRAINERTYPE_NORMAL
	mon 5, SWABLU
	mon 5, DODRIO
	end_party

	next_list_item ; BIRD_KEEPER (31) Route 120
	db "Colin@", TRAINERTYPE_NORMAL
	mon 5, WINGULL
	mon 5, NATU
	end_party

	end_list_items

LassGroup:
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
	end_party

	next_list_item ; LASS (8) Route 25
	db "Shannon@", TRAINERTYPE_NORMAL
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
	end_party

	next_list_item ; LASS (19) Route 102
	db "Tiana@", TRAINERTYPE_NORMAL	
	mon 0, ZIGZAGOON
	mon 1, SHROOMISH
	end_party

	next_list_item ; LASS (20) Route 104
	db "Haley@", TRAINERTYPE_NORMAL	
	mon 3, HOPPIP
	mon 4, LOTAD
	end_party

	next_list_item ; LASS (21) Route 116
	db "Karen@", TRAINERTYPE_NORMAL	
	mon 5, SHROOMISH
	mon 6, PIDGEY
	end_party

	next_list_item ; LASS (22) Route 116
	db "Janice@", TRAINERTYPE_NORMAL	
	mon 5, MARILL
	mon 4, SPEAROW
	end_party

	next_list_item ; LASS (23) Mount Moon
	db "Iris@", TRAINERTYPE_NORMAL	
	mon 4, CLEFAIRY
	mon 5, JIGGLYPUFF
	end_party

	next_list_item ; LASS (24) Mount Moon
	db "Miriam@", TRAINERTYPE_NORMAL	
	mon 4, GLOOM
	mon 5, ROSELIA
	end_party

	next_list_item ; LASS (25) Route 118
	db "Sally@", TRAINERTYPE_NORMAL	
	mon 4, GLOOM
	mon 5, VOLBEAT
	end_party

	next_list_item ; LASS (26) Route 118
	db "Annie@", TRAINERTYPE_NORMAL	
	mon 4, MUNCHLAX
	mon 5, ROSELIA
	end_party

	next_list_item ; LASS (27) Sootopolis Gym
	db "Andrea@", TRAINERTYPE_NORMAL	
	mon 7, LUVDISC
	mon 7, WAILMER
	end_party

	next_list_item ; LASS (28) Sootopolis Gym
	db "Crissy@", TRAINERTYPE_NORMAL	
	mon 7, GOLDEEN
	mon 7, BLASTOISE
	end_party

	end_list_items

JanineGroup: ;Gym Leader
	next_list_item ; JANINE (1)
	db "Janine@", TRAINERTYPE_MOVES
	mon 7, KOFFING
		moves ACID, EMBER, TOXIC, WILLOWISP
	mon 7, GRIMER
		moves ACID, TACKLE, HARDEN, TOXIC
	mon 9, ARIADOS
		moves TWINEEDLE, MEGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	end_party
	
	next_list_item ; JANINE (1)
	db "Janine@", TRAINERTYPE_MOVES
	mon 9, WEEZING
		moves SLUDGE, FIRE_SPIN, TOXIC, WILLOWISP
	mon 9, MUK
		moves ACID, RECOVER, HARDEN, TOXIC
	mon 9, SWALOT
		moves SLUDGE, MUD_SHOT, HARDEN, TOXIC
	mon 9, ARIADOS
		moves TWINEEDLE, MEGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	mon 11, NIDOQUEEN
		moves EARTHQUAKE, MEGAHORN, BULK_UP, SLUDGE_BOMB
	end_party
	
	next_list_item ; JANINE (3)
	db "Janine@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, WEEZING, LEFTOVERS
		moves SLUDGE_BOMB, FIRE_BLAST, AMNESIA, WILLOWISP
	itemmon 9, AMUK, NO_ITEM
		moves SLUDGE_BOMB, RECOVER, ACID_ARMOR, TOXIC
	itemmon 9, SWALOT, NO_ITEM
		moves SLUDGE_BOMB, MUD_SHOT, COSMIC_POWER, TOXIC
	itemmon 9, ARIADOS, NO_ITEM
		moves MEGAHORN, MEGA_DRAIN, PSYCHIC_M, NIGHT_SHADE
	itemmon 10, NIDOQUEEN, NO_ITEM
		moves EARTHQUAKE, MEGAHORN, BULK_UP, SLUDGE_BOMB
	itemmon 11, VENUSAURX, MINT_BERRY
		moves EARTHQUAKE, GIGA_DRAIN, REST, SLUDGE_BOMB
	end_party

	end_list_items

CooltrainerMGroup:
	next_list_item ; COOLTRAINERM (1) Union Cave - B2F
	db "Nick@", TRAINERTYPE_NORMAL
	mon 9, CHARIZARD
	mon 9, BLASTOISE
	mon 9, VENUSAUR
	mon 5, RAICHU
	mon 5, SKARMORY
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
	mon 7, YANMA
	end_party

	next_list_item ; COOLTRAINERM (4) Blackthorn City Gym
	db "Cody@", TRAINERTYPE_NORMAL
	mon 5, HORSEA
	mon 7, SEADRA
	mon 5, YANMA
	mon 7, FURRET
	end_party

	next_list_item ; COOLTRAINERM (5) Blackthorn City Gym
	db "Mike@", TRAINERTYPE_NORMAL
	mon 7, CHARIZARD
	mon 7, VIBRAVA
	mon 7, DRAGONAIR
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
	mon 7, PARASECT
	mon 7, GOLDUCK
	mon 4, TRAPINCH
	mon 9, CAMERUPT
	end_party

	next_list_item ; COOLTRAINERM (9) Route 27
	db "Blake@", TRAINERTYPE_NORMAL
	mon 7, MAGNETON
	mon 7, QUAGSIRE
	mon 7, EXEGGUTOR2
	end_party

	next_list_item ; COOLTRAINERM (10) Route 27
	db "Brian@", TRAINERTYPE_NORMAL
	mon 9, SANDSLASH
	mon 9, SWALOT
	mon 9, GRUMPIG
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
	mon 11, DRAGONAIR
		moves WRAP, SURF, DRAGON_RAGE, SLAM
	end_party

	next_list_item ; COOLTRAINERM (15) Petalburg Gym
	db "Randal@", TRAINERTYPE_NORMAL
	mon 11, DELCATTY
	end_party

	next_list_item ; COOLTRAINERM (16) Petalburg Gym
	db "Parker@", TRAINERTYPE_NORMAL
	mon 11, WIGGLYTUFF
	end_party

	next_list_item ; COOLTRAINERM (17) Petalburg Gym
	db "George@", TRAINERTYPE_NORMAL
	mon 11, RATICATE
	end_party

	next_list_item ; COOLTRAINERM (18) Lavaridge Gym
	db "Gerald@", TRAINERTYPE_NORMAL
	mon 9, AMAROWAK
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
	mon 7, MANECTRIC
	mon 7, MANTINE
	mon 7, PARASECT
	mon 8, AKUERIA
	end_party

	next_list_item; COOLTRAINERM (24) Ashen Gauntlet
	db "@", TRAINERTYPE_RANDOM, 6, TRIAL_EASY
	end_party

	next_list_item ; COOLTRAINERM (25) World Cup
	db "Wesley@", TRAINERTYPE_MOVES
	mon 9, FLAREON
		moves ROLLING_KICK, FIRE_FANG, DIG, BULK_UP
	mon 9, TAUROS
		moves SUBMISSION, DOUBLE_EDGE, EARTHQUAKE, OUTRAGE
	mon 9, DODRIO
		moves HI_JUMP_KICK, DRILL_PECK, SKY_ATTACK, WHIRLWIND
	mon 9, POLIWRATH
		moves SUBMISSION, HYDRO_PUMP, MACH_PUNCH, AQUA_JET
	mon 9, MEDICHAM
		moves FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, BULLET_PUNCH
	mon 11, GALLADE
		moves PSYCHO_CUT, LEAF_BLADE, DRAGON_DANCE, RAZORSHELL
	end_party

	next_list_item ; COOLTRAINERM (26) World Cup
	db "Arthur@", TRAINERTYPE_MOVES
	mon 9, KLEAVOR
		moves STONE_EDGE, ROCK_TOMB, DOUBLE_TEAM, GUILLOTINE
	mon 9, DONPHAN
		moves SUBMISSION, DOUBLE_EDGE, EARTHQUAKE, OUTRAGE
	mon 9, SUDOWOODO
		moves SPIKES, ROCK_SLIDE, MIRROR_MOVE, PURSUIT
	mon 9, CRADILY
		moves ANCIENTPOWER, MAGICAL_LEAF, AMNESIA, GIGA_DRAIN
	mon 9, SOLROCK
		moves FLAMETHROWER, FUTURE_SIGHT, POWER_GEM, RECOVER
	mon 11, HARCANINE
		moves SACRED_FIRE, STONE_EDGE, AGILITY, PURSUIT
	end_party

	next_list_item ; COOLTRAINERM (27) World Cup
	db "Santos@", TRAINERTYPE_MOVES
	mon 9, SABLEYE
		moves COSMIC_POWER, NIGHT_SHADE, BATON_PASS, PURSUIT
	mon 9, XATU
		moves SHADOW_BALL, DRILL_PECK, FLY, PSYBEAM
	mon 9, ESPEON
		moves SHADOW_BALL, PSYCHIC_M, SWIFT, MIST_BALL
	mon 9, NINETALES
		moves FIRE_BLAST, NIGHT_SHADE, DESTINY_BOND, FAE_VOICE
	mon 9, GENGAR
		moves SHADOW_BALL, HYPNOSIS, DREAM_EATER, SLUDGE_WAVE
	mon 11, DUSKNOIR
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

CooltrainerFGroup:
	next_list_item ; COOLTRAINERF (1) Union Cave - B2F
	db "Gwen@", TRAINERTYPE_NORMAL
	mon 6, EEVEE
	mon 9, SYLVEON
	mon 9, LEAFEON
	mon 9, GLACEON
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
	mon 6, SHELLDER
	mon 8, CLOYSTER
	end_party

	next_list_item ; COOLTRAINERF (6) Route 34
	db "Irene@", TRAINERTYPE_NORMAL
	mon 6, GOLDEEN
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
	mon 0, BULBASAUR
	end_party

	next_list_item ; COOLTRAINERF (15) Union Cave - B2F
	db "Emma@", TRAINERTYPE_NORMAL
	mon 8, POLITOED
	mon 8, SUDOWOODO
	mon 8, LEDIAN
	mon 8, GIRAFARIG
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
	mon 10, ARCANINE
	mon 10, FROSLASS
	mon 10, BRELOOM
	mon 10, QUAGSIRE
	mon 10, TOGEKISS
	mon 12, ELECTRODE2
	end_party

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "Mary@", TRAINERTYPE_NORMAL
	mon 11, FURRET
	end_party

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "Mary@", TRAINERTYPE_NORMAL
	mon 11, DODRIO
	end_party

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "Mary@", TRAINERTYPE_NORMAL
	mon 11, SWELLOW
	end_party

	next_list_item ; COOLTRAINERF (23) Route 120
	db "Jenni@", TRAINERTYPE_NORMAL
	mon 7, SABLEYE
	mon 7, CORSOLA
	mon 7, RAITORA
	mon 7, MAWILE
	end_party

	next_list_item ; COOLTRAINERF (24) World Cup
	db "Monica@", TRAINERTYPE_MOVES
	mon 9, BUTTERFREE
		moves FAE_VOICE, STUN_SPORE, HURRICANE, PSYCHIC_M
	mon 9, FEAROW
		moves DRILL_PECK, FLY, DOUBLE_EDGE, MIRROR_MOVE
	mon 9, NOCTOWL
		moves DRILL_PECK, PSYCHIC_M, HYPNOSIS, DREAM_EATER
	mon 9, ABSOL
		moves SKY_ATTACK, CRUNCH, FUTURE_SIGHT, SLASH
	mon 9, YANMEGA
		moves FLAMETHROWER, SKY_ATTACK, CRUNCH, OUTRAGE
	mon 11, SEAKING
		moves DRILL_PECK, FLY, DRAGON_DANCE, RAZORSHELL
	end_party

	next_list_item ; COOLTRAINERF (25) World Cup
	db "Tuscany@", TRAINERTYPE_MOVES
	mon 9, WIGGLYTUFF
		moves WILLOWISP, GLARE, DRAININGKISS, CALM_MIND
	mon 9, LINOONE
		moves HYPER_VOICE, HYPER_BEAM, SUPERSONIC, ROAR
	mon 9, PERSIAN
		moves SLASH, PURSUIT, CRUNCH, PSYCHO_CUT
	mon 9, RAPIDASH
		moves MEGA_KICK, FLAME_WHEEL, FIRE_SPIN, DOUBLE_KICK
	mon 9, DELCATTY
		moves PLAY_ROUGH, CHARM, GROWL, SLASH
	mon 11, URSALUNA
		moves DOUBLE_EDGE, FISSURE, REST, BULK_UP
	end_party

	next_list_item ; COOLTRAINERF (26) World Cup
	db "Frieda@", TRAINERTYPE_MOVES
	mon 9, TENTACRUEL
		moves SURF, GIGA_DRAIN, ICY_WIND, SLUDGE_BOMB
	mon 9, DUSTOX
		moves SLUDGE_BOMB, CONFUSE_RAY, STUN_SPORE, WHIRLWIND
	mon 9, AMUK
		moves SLUDGE_BOMB, PURSUIT, RECOVER, MINIMIZE
	mon 9, NIDOQUEEN
		moves SLUDGE_BOMB, EARTHQUAKE, BODY_SLAM, TOXIC
	mon 9, UMBREON
		moves TOXIC, RECOVER, GROWL, SNARL
	mon 11, GWEEZING
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

BeautyGroup:
	next_list_item ; BEAUTY (1) Goldenrod City Gym
	db "Victoria@", TRAINERTYPE_NORMAL
	mon 7, SENTRET
	mon 7, ZIGZAGOON
	mon 7, DELCATTY
	end_party

	next_list_item ; BEAUTY (2) Goldenrod City Gym
	db "Samantha@", TRAINERTYPE_NORMAL
	mon 9, MEOWTH
	mon 9, MEOWTH
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
	mon 7, PARAS
	end_party

	next_list_item ; BEAUTY (5) Route 38
	db "Valerie@", TRAINERTYPE_NORMAL
	mon 5, SKIPLOOM
	mon 7, SUNFLORA
	end_party

	next_list_item ; BEAUTY (6) Route 38
	db "Olivia@", TRAINERTYPE_NORMAL
	mon 9, CORSOLA
	end_party

	next_list_item ; BEAUTY (7) Route 103
	db "Daisy@", TRAINERTYPE_NORMAL
	mon 5, FURRET
	end_party

	next_list_item ; BEAUTY (8) Route 104
	db "Cindy@", TRAINERTYPE_NORMAL
	mon 3, HOOTHOOT
	end_party

	next_list_item ; BEAUTY (9) Route 109
	db "Hailey@", TRAINERTYPE_NORMAL
	mon 6, NOCTOWL
	mon 7, AZUMARILL
	end_party

	next_list_item ; BEAUTY (10) Route 109
	db "Lola@", TRAINERTYPE_NORMAL
	mon 7, AVULPIX
	mon 7, ROSELIA
	end_party

	next_list_item ; BEAUTY (11) Route 112
	db "Shayla@", TRAINERTYPE_NORMAL
	mon 5, SHROOMISH
	mon 7, ROSELIA
	end_party

	next_list_item ; BEAUTY (12) Route 120
	db "Clarissa@", TRAINERTYPE_NORMAL
	mon 5, ROSELIA
	mon 7, WAILMER
	end_party

	next_list_item ; BEAUTY (13) Route 120
	db "Angelica@", TRAINERTYPE_NORMAL
	mon 5, EEVEE
	mon 7, SYLVEON
	end_party

	next_list_item ; BEAUTY (14) Sootopolis Gym
	db "Connie@", TRAINERTYPE_NORMAL
	mon 7, SEAKING
	mon 7, VAPOREON
	end_party

	next_list_item ; BEAUTY (15) Sootopolis Gym
	db "Tiffany@", TRAINERTYPE_NORMAL
	mon 7, SHARPEDO
	mon 7, MASQUERAIN
	end_party

	next_list_item ; BEAUTY (16) Sootopolis Gym
	db "Olivia@", TRAINERTYPE_NORMAL
	mon 7, HUNTAIL
	mon 7, GOREBYSS
	end_party

	next_list_item ; BEAUTY (17) Sootopolis Gym
	db "Bridget@", TRAINERTYPE_NORMAL
	mon 7, AZUMARILL
	mon 7, WAILMER
	end_party

	end_list_items

PokemaniacGroup:
	next_list_item ; POKEMANIAC (1) Union Cave - 1F
	db "Larry@", TRAINERTYPE_NORMAL
	mon 7, SLOWPOKE
	mon 7, UNOWN
	end_party

	next_list_item ; POKEMANIAC (2) Union Cave - B1F
	db "Andrew@", TRAINERTYPE_NORMAL
	mon 7, MAROWAK
	mon 7, MAROWAK
	end_party

	next_list_item ; POKEMANIAC (3) Union Cave - B1F
	db "Calvin@", TRAINERTYPE_NORMAL
	mon 7, KANGASKHAN
	mon 7, TAUROS
	mon 7, TAUROS
	end_party

	next_list_item ; POKEMANIAC (4) Route 42
	db "Shane@", TRAINERTYPE_NORMAL
	mon 8, NIDORINA
	mon 8, NIDORINO
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
	mon 5, ARON
	mon 5, ARON
	end_party

	next_list_item ; POKEMANIAC (17) Route 114
	db "Wyatt@", TRAINERTYPE_NORMAL
	mon 5, LAIRON
	mon 5, VAPOREON
	end_party

	next_list_item ; POKEMANIAC (18) Route 119
	db "Donald@", TRAINERTYPE_NORMAL
	mon 5, BUTTERFREE
	mon 5, BEAUTIFLY
	end_party

	next_list_item ; POKEMANIAC (19) Route 119
	db "Taylor@", TRAINERTYPE_NORMAL
	mon 5, BEEDRILL
	mon 5, DUSTOX
	end_party

	next_list_item ; POKEMANIAC (20) Route 119
	db "Brent@", TRAINERTYPE_NORMAL
	mon 5, PINSIR
	mon 5, SCYTHER
	end_party

	next_list_item ; POKEMANIAC (21) Route 120
	db "Jeffrey@", TRAINERTYPE_NORMAL
	mon 5, SURSKIT
	mon 5, PORYGON
	end_party

	end_list_items

GruntMGroup:	
	next_list_item ; GRUNTM (1) GRUNTM_EASY 
	db "Grunt@", TRAINERTYPE_RANDOM, 2, ROCKET_EASY
	end_party

	next_list_item ; GRUNTM (2) GRUNTM_MEDIUM
	db "Enforcer@", TRAINERTYPE_RANDOM, 2, ROCKET_MEDIUM
	end_party

	next_list_item ; GRUNTM (3) GRUNTM_HARD 
	db "Soldier@", TRAINERTYPE_RANDOM, 2, ROCKET_HARD
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
	mon 4, RATICATE
	mon 6, LINOONE
	end_party

	next_list_item ; GRUNTM (10) Radio Tower 4F
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, ZUBAT
	mon 6, GOLBAT
	mon 7, SPINDA
	end_party

	next_list_item ; GRUNTM (11) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, MUK
	mon 5, KOFFING
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
	mon 4, GRIMER
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
	mon 4, MIGHTYENA
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
	mon 5, HAUNTER
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
	mon 5, ZUBAT
	mon 5, SANDSHREW
	end_party

	next_list_item ; GRUNTM (33) Mount Moon 2
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, EKANS
	mon 5, SEVIPER
	end_party

	next_list_item ; GRUNTM (34) Mount Moon 3
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, RATICATE
	mon 5, HOOTHOOT
	end_party

	next_list_item ; GRUNTM (35) Mount Moon 4
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, GRIMER
	mon 5, GULPIN
	end_party

	next_list_item ; GRUNTM (36) Safari Grunt 1
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, MUK
	mon 5, ZANGOOSE
	end_party

	next_list_item ; GRUNTM (37) Safari Grunt 2
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, MAROWAK
	mon 5, EXEGGUTOR2
	end_party

	next_list_item ; GRUNTM (38) Safari Grunt 3
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, TENTACRUEL
	mon 5, TENTACRUEL2
	end_party

	next_list_item ; GRUNTM (39) Safari Grunt 4
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, LICKILICKY
	mon 5, AMAROWAK
	end_party

	next_list_item ; GRUNTM (40) Safari Grunt 5
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, HELECTRODE
	mon 5, ELECTRODE2
	end_party

	next_list_item ; GRUNTM (41) Safari Grunt 6
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, CRAWDAUNT
	mon 5, KINGLER
	end_party

	next_list_item ; GRUNTM (42) Safari Grunt 7
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, DUSCLOPS
	mon 5, VICTREEBEL
	end_party

	next_list_item ; GRUNTM (43) Rustturf Grunt 1
	db "Alex@", TRAINERTYPE_NORMAL
	mon 5, BALTOY
	mon 5, POOCHYENA
	end_party

	next_list_item ; GRUNTM (43) Rustturf Grunt 2
	db "Ryan@", TRAINERTYPE_NORMAL
	mon 5, LINOONE
	mon 5, CARVANHA
	end_party

	next_list_item ; GRUNTM (44) Mauville Grunt 1
	db "Ryan@", TRAINERTYPE_NORMAL
	mon 6, LINOONE
	mon 7, SHARPEDO
	end_party

	next_list_item ; GRUNTM (45) Mauville Grunt 2
	db "Alex@", TRAINERTYPE_NORMAL
	mon 6, BALTOY
	mon 7, MIGHTYENA
	end_party

	next_list_item ; GRUNTM (46) Mauville Grunt 3
	db "Jordan@", TRAINERTYPE_NORMAL
	mon 6, NUMEL
	mon 7, ARIADOS
	end_party

	next_list_item ; GRUNTM (47) Mauville Grunt 4
	db "Frank@", TRAINERTYPE_NORMAL
	mon 6, MAGMAR
	mon 7, HUNTAIL
	end_party

	next_list_item ; GRUNTM (48) Route 121 Grunt 1
	db "Ryan@", TRAINERTYPE_NORMAL
	mon 5, LINOONE
	mon 6, SHARPEDO
	mon 7, DODRIO
	end_party

	next_list_item ; GRUNTM (49) Route 121 Grunt 2
	db "Alex@", TRAINERTYPE_NORMAL
	mon 6, MIGHTYENA
	mon 6, CAMERUPT
	mon 8, CLAYDOL
	end_party

	next_list_item ; GRUNTM (50) Mt Pyre Grunt 1
	db "Elite@", TRAINERTYPE_NORMAL
	mon 6, TORKOAL
	mon 7, CHARIZARD
	mon 8, DYNABEA
	end_party

	next_list_item ; GRUNTM (51) Mt Pyre Grunt 2
	db "Elite@", TRAINERTYPE_NORMAL
	mon 6, MANTINE
	mon 7, BLASTOISE
	mon 8, AKUERIA
	end_party

	next_list_item ; GRUNTM (52) Mt Pyre Grunt 3
	db "Elite@", TRAINERTYPE_NORMAL
	mon 6, DUNSPARCE
	mon 7, MAROWAK
	mon 8, GLISCOR
	end_party

	next_list_item ; GRUNTM (53) Mt Pyre Grunt 4
	db "Elite@", TRAINERTYPE_NORMAL
	mon 6, DELIBIRD
	mon 7, DEWGONG
	mon 8, GLACEON
	end_party

	end_list_items

GentlemanGroup:
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
	mon 7, MAREEP
	end_party

	next_list_item ; GENTLEMAN (4) Glitter Lighthouse - 2F
	db "Alfred@", TRAINERTYPE_NORMAL
	mon 7, NOCTOWL
	mon 7, NOCTOWL
	end_party

	next_list_item ; GENTLEMAN (5) Mossdeep Gym
	db "Cliff@", TRAINERTYPE_NORMAL
	mon 7, GIRAFARIG
	mon 7, STANTLER
	mon 7, NOCTOWL
	end_party

	next_list_item ; GENTLEMAN (6) Mossdeep Gym
	db "Nate@", TRAINERTYPE_NORMAL
	mon 7, MR__MIME
	mon 7, GRUMPIG
	mon 7, XATU
	end_party

	end_list_items

SkierGroup:
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

TeacherGroup:
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

	next_list_item ; TEACHER (4) Ilex East (Jessadactyl contest party #1)
	db "Jess@", TRAINERTYPE_NORMAL
	mon 5, NATU
	mon 5, AGRIMER
	mon 5, LAIRON
	mon 5, TENTACRUEL
	mon 5, PRIMEAPE
	mon 7, GRANBULL
	end_party

	next_list_item ; TEACHER (5) Ilex East (Jessadactyl contest party #2)
	db "Jess@", TRAINERTYPE_MOVES
	mon 8, XATU
		moves PSYCHIC_M, DRILL_PECK, WILLOWISP, DARK_PULSE
	mon 8, AMUK
		moves SLUDGE_BOMB, SHADOW_PUNCH, COSMIC_POWER, RECOVER
	mon 8, AGGRON
		moves IRON_TAIL, COSMIC_POWER, ROCK_SLIDE, GUILLOTINE
	mon 9, TENTACRUEL
		moves SLUDGE_BOMB, HYDRO_PUMP, ICY_WIND, POWER_GEM
	mon 9, GRANBULL
		moves CRUNCH, SWORDS_DANCE, THUNDERPUNCH, PLAY_ROUGH
	mon 10, ANNIHILAPE
		moves CROSS_CHOP, SHADOW_PUNCH, FISSURE, BULK_UP
	end_party	

	next_list_item ; TEACHER (6)  (Klutch contest party #1)
	db "Klutch@", TRAINERTYPE_NORMAL
	mon 5, RHYHORN
	mon 5, CHARMANDER
	mon 5, SWABLU
	mon 5, FURRET
	mon 5, HANAMOLE
	mon 7, GYARADOS
	end_party

	next_list_item ; TEACHER (7)  (Klutch contest party #2)
	db "Klutch@", TRAINERTYPE_NORMAL
	mon 7, RHYDON
	mon 7, CHARIZARD
	mon 7, ALTARIA
	mon 7, HANAMOLE
	mon 7, FURRET
	mon 9, GYARADOS
	end_party

	next_list_item ; TEACHER (8)  (Klutch contest party #3)
	db "Klutch@", TRAINERTYPE_NORMAL
	mon 10, RHYPERIOR
	mon 10, CHARIZARDX
	mon 10, ALTARIAX
	mon 10, HANAMOLE
	mon 10, FURRET2
	mon 11, GYARADOSX
	end_party

	next_list_item ; TEACHER (9) Sootopolis Gym
	db "Daphne@", TRAINERTYPE_NORMAL
	mon 6, GYARADOS
	mon 6, WINGULL
	end_party

	next_list_item ; TEACHER (10) Sootopolis Gym
	db "Brianna@", TRAINERTYPE_NORMAL
	mon 6, CLAMPERL
	mon 6, SHELLDER
	end_party

	end_list_items

SabrinaGroup: ;Gym Leader
	next_list_item ; SABRINA (1)
	db "Sabrina@", TRAINERTYPE_MOVES
	mon 7, SMOOCHUM
		moves POWDER_SNOW, CONFUSION, SWEET_KISS, DIZZY_PUNCH
	mon 7, MR__MIME
		moves BARRIER, REFLECT, BATON_PASS, CONFUSION
	mon 9, KADABRA
		moves CONFUSION, FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH
	end_party
	
	next_list_item ; SABRINA (2)
	db "Sabrina@", TRAINERTYPE_MOVES
	mon 9, JYNX
		moves ICY_WIND, PSYBEAM, DIZZY_PUNCH, CALM_MIND
	mon 9, MR__MIME
		moves BARRIER, REFLECT, BATON_PASS, PSYBEAM
	mon 9, WOBBUFFET
		moves COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	mon 9, LUNATONE
		moves CALM_MIND, ANCIENTPOWER, ROCK_TOMB, PSYBEAM
	mon 11, ALAKAZAM
		moves PSYBEAM, CALM_MIND, RECOVER, SHADOW_BALL
	end_party
	
	next_list_item ; SABRINA (3)
	db "Sabrina@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, JYNX, NO_ITEM
		moves ICY_WIND, PSYCHIC_M, DIZZY_PUNCH, CALM_MIND
	itemmon 9, MR__MIME, NO_ITEM
		moves BARRIER, LIGHT_SCREEN, BATON_PASS, PSYCHIC_M
	itemmon 9, WOBBUFFET, LEFTOVERS
		moves COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	itemmon 9, LUNATONE, NO_ITEM
		moves CALM_MIND, REST, ROCK_TOMB, PSYCHIC_M
	itemmon 10, HYPNO, MINT_BERRY
		moves CALM_MIND, REST, HYPNOSIS, DREAM_EATER
	itemmon 11, ALAKAZAMX, BLACKBELT_I
		moves PSYCHIC_M, CALM_MIND, RECOVER, FOCUS_PUNCH
	end_party

	end_list_items

BugCatcherGroup:
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
	mon 8, ILLUMISE
	mon 8, VOLBEAT
	end_party

	next_list_item ; BUG_CATCHER (21) Route 102
	db "Rick@", TRAINERTYPE_NORMAL
	mon 0, WURMPLE
	mon 1, WURMPLE
	end_party

	next_list_item ; BUG_CATCHER (22) Petalburg Woods
	db "Lyle@", TRAINERTYPE_NORMAL
	mon 3, PARAS
	mon 4, SHROOMISH
	end_party

	next_list_item ; BUG_CATCHER (23) Petalburg Woods
	db "James@", TRAINERTYPE_NORMAL
	mon 3, WURMPLE
	mon 4, WURMPLE
	end_party

	next_list_item ; BUG_CATCHER (24) Route 116
	db "Jose@", TRAINERTYPE_NORMAL
	mon 5, WURMPLE
	mon 7, PARAS
	end_party

	next_list_item ; BUG_CATCHER (25) Route 117
	db "Derek@", TRAINERTYPE_NORMAL
	mon 5, DUSTOX
	mon 7, BEAUTIFLY
	end_party

	next_list_item ; BUG_CATCHER (26) Mt Moon
	db "Kent@", TRAINERTYPE_NORMAL
	mon 4, WEEDLE
	mon 4, BUTTERFREE
	end_party

	next_list_item ; BUG_CATCHER (27) Mt Moon
	db "Robby@", TRAINERTYPE_NORMAL
	mon 1, CATERPIE
	mon 2, WEEDLE
	mon 3, PARAS
	end_party

	next_list_item ; BUG_CATCHER (28) Route119
	db "Kent@", TRAINERTYPE_NORMAL
	mon 4, PARAS
	mon 4, DUSTOX
	end_party

	next_list_item ; BUG_CATCHER (29) Route119
	db "Greg@", TRAINERTYPE_NORMAL
	mon 4, VOLBEAT
	mon 4, ILLUMISE
	end_party

	next_list_item ; BUG_CATCHER (30) Route119
	db "Doug@", TRAINERTYPE_NORMAL
	mon 4, PINECO
	mon 4, HERACROSS
	end_party

	end_list_items

FisherGroup:
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
	mon 5, QWILFISH
	mon 5, GOLDEEN
	end_party

	next_list_item ; FISHER (27) Route 104
	db "Darian@", TRAINERTYPE_NORMAL
	mon 2, FEEBAS
	mon 3, TENTACOOL
	end_party

	next_list_item ; FISHER (28) Route 104
	db "Ivan@", TRAINERTYPE_NORMAL
	mon 2, MAGNEMITE
	mon 3, STARYU
	end_party

	next_list_item ; FISHER (29) Route 105
	db "Ned@", TRAINERTYPE_NORMAL
	mon 5, MAGNETON
	mon 5, SEALEO
	mon 5, POLIWHIRL
	end_party

	next_list_item ; FISHER (30) Route 105
	db "Elliot@", TRAINERTYPE_NORMAL
	mon 5, WAILORD
	mon 5, OMASTAR
	mon 7, DRAGONAIR
	end_party

	next_list_item ; FISHER (31) Route 110
	db "Dale@", TRAINERTYPE_NORMAL
	mon 7, MAGNEMITE
	mon 5, BARBOACH
	mon 7, CARVANHA
	end_party

	next_list_item ; FISHER (32) Route 118
	db "Barney@", TRAINERTYPE_NORMAL
	mon 7, MAGNEMITE
	mon 5, BARBOACH
	mon 7, HUNTAIL
	end_party

	next_list_item ; FISHER (33) Route 114
	db "Nolan@", TRAINERTYPE_NORMAL	
	mon 5, BARBOACH
	mon 6, OCTILLERY
	end_party

	next_list_item ; FISHER (34) Route 114
	db "Kai@", TRAINERTYPE_NORMAL	
	mon 5, CARVANHA
	mon 6, MARSHTOMP
	end_party

	next_list_item ; FISHER (34) Route 114
	db "Claude@", TRAINERTYPE_NORMAL	
	mon 5, SLOWBRO
	mon 6, WARTORTLE
	end_party

	next_list_item ; FISHER (35) Route 119
	db "Chris@", TRAINERTYPE_NORMAL	
	mon 5, FEEBAS
	mon 6, MAGIKARP
	mon 5, TENTACOOL
	mon 6, CARVANHA
	end_party

	end_list_items

SwimmerMGroup:
	next_list_item ; SWIMMERM (1) Route 19
	db "Harold@", TRAINERTYPE_NORMAL
	mon 6, REMORAID
	mon 4, SEADRA
	end_party

	next_list_item ; SWIMMERM (2) Route 40
	db "Simon@", TRAINERTYPE_NORMAL
	mon 3, TENTACOOL
	mon 3, TENTACOOL
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
	mon 7, LUVDISC
	mon 7, SEADRA
	mon 7, HUNTAIL
	end_party

	next_list_item ; SWIMMERM (15) Route108
	db "Tony@", TRAINERTYPE_NORMAL
	mon 6, LUVDISC
	mon 6, PSYDUCK
	mon 6, SLOWPOKE
	end_party

	next_list_item ; SWIMMERM (16) Route108
	db "Darrin@", TRAINERTYPE_NORMAL
	mon 6, BARBOACH
	mon 6, CORPHISH
	mon 7, LINOONE
	end_party

	end_list_items

SwimmerFGroup:
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
	mon 5, SEAKING
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
	mon 7, SQUIRTLE
	end_party

	next_list_item ; SWIMMERF (13) Cerulean City Gym
	db "Briana@", TRAINERTYPE_NORMAL
	mon 5, SEAKING
	mon 5, SEAKING
	end_party

	next_list_item ; SWIMMERF (14) Route 105
	db "Imani@", TRAINERTYPE_NORMAL
	mon 5, MANTINE
	mon 5, GOREBYSS
	end_party

	next_list_item ; SWIMMERF (15) Route 108
	db "Denise@", TRAINERTYPE_NORMAL
	mon 5, WINGULL
	mon 5, SEAKING
	end_party

	next_list_item ; SWIMMERF (16) Route 108
	db "Beth@", TRAINERTYPE_NORMAL
	mon 5, WAILMER
	mon 5, SEALEO
	end_party

	end_list_items

SailorGroup:
	next_list_item ; SAILOR (1) Route 39
	db "Eugene@", TRAINERTYPE_NORMAL
	mon 3, POLIWHIRL
	mon 5, RATICATE
	mon 6, KRABBY
	end_party

	next_list_item ; SAILOR (2) Glitter Lighthouse - 2F
	db "Huey@", TRAINERTYPE_NORMAL
	mon 8, POLITOED
	mon 6, POLIWHIRL
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
	mon 8, KRABBY
		moves BUBBLEBEAM, LEER, VICEGRIP, HARDEN
	end_party

	next_list_item ; SAILOR (5) Glitter Lighthouse - 5F
	db "Ernest@", TRAINERTYPE_NORMAL
	mon 6, MACHOP
	mon 7, WINGULL
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
	mon 6, POLIWHIRL
	end_party

	next_list_item ; SAILOR (15) Route 109
	db "Huey@", TRAINERTYPE_NORMAL	
	mon 6, MACHOKE
	mon 7, MANTINE
	end_party

	next_list_item ; SAILOR (16) Route 109
	db "Edmond@", TRAINERTYPE_NORMAL	
	mon 6, HITMONLEE
	mon 7, CORSOLA
	end_party

	next_list_item ; SAILOR (17) Route 109
	db "Ricky@", TRAINERTYPE_NORMAL	
	mon 6, DEWGONG
	mon 7, NOSEPASS
	end_party

	next_list_item ; SAILOR (18) Route 109
	db "Chandler@", TRAINERTYPE_NORMAL	
	mon 6, HITMONCHAN
	mon 7, WARTORTLE
	end_party

	end_list_items

SuperNerdGroup:
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
	mon 12, KINGDRA
		moves SMOKESCREEN, TWISTER, SURF, WATERFALL
	end_party

	next_list_item ; SUPER_NERD (8) Mt. Mortar
	db "Markus@", TRAINERTYPE_MOVES
	mon 12, SLOWPOKE
		moves CURSE, WATER_GUN, GROWL, STRENGTH
	end_party

	next_list_item ; SUPER_NERD (9) Mount Moon
	db "Jovan@", TRAINERTYPE_NORMAL
	mon 4, MAGNEMITE
	mon 5, VOLTORB
	end_party

	next_list_item ; SUPER_NERD (10) Mount Moon
	db "Miguel@", TRAINERTYPE_NORMAL
	mon 5, GRIMER
	mon 5, VOLTORB
	end_party

	end_list_items

SECTION "Enemy Trainer Parties 3", ROMX

Rival2Group:
	next_list_item ; RIVAL2 (7) World Cup Rival
	db "?@", TRAINERTYPE_MOVES
	mon 12, FORRETRESS
		moves LEECH_SEED, TOXIC, RECOVER, EXPLOSION
	mon 12, WEAVILE
		moves ICICLE_CRASH, PURSUIT, MACH_PUNCH, PSYCHO_CUT
	mon 12, AMPHAROS
		moves THUNDERBOLT, FLASHCANNON, THUNDER_WAVE, DRAGONBREATH
	mon 13, XATU
		moves SKY_ATTACK, PSYCHIC_M, HYPNOSIS, DREAM_EATER
	mon 13, OCTILLERY
		moves BLAST_BURN, HYDRO_PUMP, WILLOWISP, FIRE_BLAST
	mon 15, URSALUNA
		moves BULK_UP, EARTHQUAKE, CRUNCH, THUNDER_FANG
	end_party

	end_list_items

GuitaristGroup:
	next_list_item ; GUITARIST (1) Fast Ship
	db "Clyde@", TRAINERTYPE_NORMAL
	mon 7, ELECTABUZZ
	end_party

	next_list_item ; GUITARIST (2) Vermilion City Gym
	db "Vincent@", TRAINERTYPE_NORMAL	
	mon 7, VOLBEAT
	mon 7, ILLUMISE
	end_party

	next_list_item ; GUITARIST (3) Mauville City Gym
	db "Kirk@", TRAINERTYPE_NORMAL
	mon 7, ELECTRIKE
	mon 7, VOLTORB
	mon 7, HVOLTORB
	end_party

	next_list_item ; GUITARIST (4) Mauville City Gym
	db "Shawn@", TRAINERTYPE_NORMAL
	mon 7, MINUN
	mon 7, ELECTABUZZ
	end_party

	next_list_item ; GUITARIST (5) Route 103
	db "Marcos@", TRAINERTYPE_NORMAL
	mon 7, MINUN
	end_party

	next_list_item ; GUITARIST (6) Route 110
	db "Joseph@", TRAINERTYPE_NORMAL
	mon 7, VOLTORB
	mon 7, HVOLTORB
	end_party

	next_list_item ; GUITARIST (7) Route 119
	db "Fabian@", TRAINERTYPE_NORMAL
	mon 7, MANECTRIC
	mon 7, LINOONE
	end_party

	end_list_items

HikerGroup:
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
	mon 7, NUMEL
	mon 7, SOLROCK
	end_party

	next_list_item ; HIKER (27) Mount Moon
	db "Marcos@", TRAINERTYPE_NORMAL
	mon 3, GEODUDE
	mon 4, SANDSHREW
	mon 5, LUNATONE
	end_party

	next_list_item ; HIKER (28) Route 112
	db "Trent@", TRAINERTYPE_NORMAL
	mon 3, GEODUDE
	mon 4, GRAVELER
	mon 5, AGRAVELER
	end_party

	next_list_item ; HIKER (29) Route 112
	db "Brice@", TRAINERTYPE_NORMAL
	mon 3, NUMEL
	mon 4, MACHOP
	mon 5, MACHOKE
	end_party

	next_list_item ; HIKER (30) Route 114
	db "Lucas@", TRAINERTYPE_NORMAL
	mon 6, ONIX
	mon 6, MACHOKE
	mon 7, TAUROS
	end_party

	next_list_item ; HIKER (31) Route 114
	db "Lenny@", TRAINERTYPE_NORMAL
	mon 6, MAROWAK
	mon 6, PILOSWINE
	mon 7, DONPHAN
	end_party

	end_list_items

BikerGroup:
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

BlaineGroup: ;Gym Leader
	next_list_item ; BLAINE (1)
	db "Blaine@", TRAINERTYPE_MOVES
	mon 7, MAGCARGO
		moves ROCK_SLIDE, FIRE_BLAST, FISSURE, CURSE
	mon 8, MAGMAR
		moves THUNDERPUNCH, FIRE_PUNCH, SUNNY_DAY, FLAMETHROWER
	mon 9, RAPIDASH
		moves SUNNY_DAY, MEGAHORN, SOLARBEAM, FIRE_BLAST
	end_party
	
	next_list_item ; BLAINE (2)
	db "Blaine@", TRAINERTYPE_MOVES
	mon 9, NINETALES
		moves SUNNY_DAY, SHADOW_BALL, SOLARBEAM, FIRE_BLAST
	mon 8, MAGCARGO
		moves ROCK_SLIDE, FIRE_BLAST, FISSURE, CURSE
	mon 8, FLAREON
		moves FLAME_WHEEL, DIG, TAKE_DOWN, BULK_UP
	mon 10, MAGMORTAR
		moves THUNDERPUNCH, FIRE_PUNCH, SUNNY_DAY, FLAMETHROWER
	mon 11, RAPIDASH
		moves SUNNY_DAY, MEGAHORN, SOLARBEAM, FIRE_BLAST
	end_party
	
	next_list_item ; BLAINE (3)
	db "Blaine@", TRAINERTYPE_ITEM_MOVES	
	itemmon 9, NINETALES, NO_ITEM
		moves SUNNY_DAY, SHADOW_BALL, SOLARBEAM, FIRE_BLAST
	itemmon 9, MAGCARGO, NO_ITEM
		moves ROCK_SLIDE, FIRE_BLAST, FISSURE, COSMIC_POWER
	itemmon 9, FLAREON, NO_ITEM
		moves FLAME_WHEEL, DIG, TAKE_DOWN, BULK_UP
	itemmon 9, MAGMORTAR, NO_ITEM
		moves THUNDERPUNCH, ERUPTION, MACH_PUNCH, BRICK_BREAK
	itemmon 9, RAPIDASH, CHARCOAL
		moves SUNNY_DAY, FLAME_WHEEL, SOLARBEAM, FIRE_BLAST
	itemmon 11, MOLTRES, NO_ITEM
		moves PURSUIT, SKY_ATTACK, SOLARBEAM, FIRE_BLAST
	end_party

	end_list_items

BurglarGroup:
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

FirebreatherGroup:
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
	mon 6, KOFFING
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
	mon 6, SLUGMA
	mon 7, CYNDAQUIL
	mon 8, KOFFING
	end_party

	next_list_item ; FIREBREATHER (8) Lavaridge Gym
	db "Jace@", TRAINERTYPE_NORMAL
	mon 6, CHARMANDER
	mon 7, PONYTA
	mon 8, MAGBY
	end_party

	next_list_item ; FIREBREATHER (9) Lavaridge Gym
	db "Cole@", TRAINERTYPE_NORMAL
	mon 6, MAGBY
	mon 7, VULPIX
	mon 8, NUMEL
	end_party

	next_list_item ; FIREBREATHER (10) Lavaridge Gym
	db "Axle@", TRAINERTYPE_NORMAL
	mon 6, MAGBY
	mon 7, VULPIX
	mon 8, COMBUSKEN
	end_party

	next_list_item ; FIREBREATHER (11) Lavaridge Gym
	db "Keegan@", TRAINERTYPE_NORMAL
	mon 6, SUNKERN
	mon 7, CYNDAQUIL2
	mon 8, BORUBEA
	end_party

	next_list_item ; FIREBREATHER (12) Route 111
	db "Hayden@", TRAINERTYPE_NORMAL
	mon 5, KANGASKHAN
	mon 6, SHUCKLE
	mon 7, VOLBEAT
	end_party

	next_list_item ; FIREBREATHER (13) Route 112
	db "Bryan@", TRAINERTYPE_NORMAL
	mon 5, SLUGMA
	mon 6, NUMEL
	mon 7, QUILAVA
	end_party

	next_list_item ; FIREBREATHER (14) Route 114
	db "Berny@", TRAINERTYPE_NORMAL
	mon 5, MAGMAR
	mon 6, QUILAVA2
	mon 7, PELIPPER
	end_party

	next_list_item ; FIREBREATHER (15) Route 119
	db "Dayton@", TRAINERTYPE_NORMAL
	mon 5, SLUGMA
	mon 6, NUMEL
	mon 7, SEAKING
	end_party

	end_list_items

JugglerGroup:
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
	mon 7, VOLTORB
	mon 7, VOLTORB2
	mon 7, HVOLTORB
	end_party

	end_list_items

BlackbeltGroup:
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
	mon 7, TYROGUE
	end_party

	next_list_item ; BLACKBELT_T (11) Dewford City Gym
	db "Cristian@", TRAINERTYPE_NORMAL
	mon 7, MACHOKE
	end_party

	next_list_item ; BLACKBELT_T (12) Route 103
	db "Marcos@", TRAINERTYPE_NORMAL
	mon 7, TYROGUE
	end_party

	end_list_items

ExecutiveMGroup:
	next_list_item ; EXECUTIVEM (1) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_NORMAL
	mon 7, MIGHTYENA
	mon 7, WEEZING
	mon 7, NUZLEAF
	mon 7, DUSTOX
	mon 7, MANECTRIC
	mon 8, HOUNDOOM
	end_party

	next_list_item ; EXECUTIVEM (2) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_NORMAL
	mon 8, CROBAT
	mon 8, AGGRON
	mon 9, HARIYAMA
	end_party

	next_list_item ; EXECUTIVEM (3) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_NORMAL
	mon 8, ELECTRODE
	mon 8, MANTINE
	mon 8, MAGCARGO
	mon 8, GIRAFARIG
	mon 7, QUAGSIRE
	mon 7, SEVIPER
	end_party

	next_list_item ; EXECUTIVEM (4) Team Rocket Hideout - B3F
	db "Executive@", TRAINERTYPE_NORMAL
	mon 5, GOLBAT
	mon 7, RATICATE
	mon 7, SWALOT
	mon 7, NOCTOWL
	mon 9, MURKROW
	end_party

	next_list_item ; EXECUTIVEM (5) Goldenrod City - Radio Tower Mega
	db "Executive@", TRAINERTYPE_NORMAL	
	mon 9, HOUNDOOMX
	end_party

	end_list_items

PsychicGroup:
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
	mon 6, MR__MIME
	mon 6, JYNX
	end_party

	next_list_item ; PSYCHIC_T (14) Mossdeep Gym
	db "Preston@", TRAINERTYPE_NORMAL
	mon 7, KADABRA
	mon 7, KIRLIA
	end_party

	next_list_item ; PSYCHIC_T (15) Mossdeep Gym
	db "Blake@", TRAINERTYPE_NORMAL
	mon 7, ARAICHU
	mon 7, VENOMOTH
	end_party

	next_list_item ; PSYCHIC_T (16) Mossdeep Gym
	db "Nicholas@", TRAINERTYPE_NORMAL
	mon 7, WOBBUFFET
	mon 7, UNOWN
	end_party

	next_list_item ; PSYCHIC_T (17) Mossdeep Gym
	db "Virgil@", TRAINERTYPE_NORMAL
	mon 7, PORYGON2
	mon 7, HYPNO
	end_party

	next_list_item; PSYCHIC_T (18) Saffron City Gym
	db "Franklin@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	end_party

	next_list_item; PSYCHIC_T (11) Saffron City Gym
	db "Jared@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	end_party

	end_list_items

PicnickerGroup:
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
	mon 12, CLEFAIRY
		moves ENCORE, SING, DOUBLESLAP, MINIMIZE
	end_party

	next_list_item ; PICNICKER (13) Celadon City Gym
	db "Tanya@", TRAINERTYPE_NORMAL
	mon 7, EXEGGUTOR
	end_party

	next_list_item ; PICNICKER (14) Route 117
	db "Maria@", TRAINERTYPE_NORMAL
	mon 9, DELCATTY
	end_party

	next_list_item ; PICNICKER (15) Route 117
	db "Melina@", TRAINERTYPE_NORMAL
	mon 7, LINOONE
	mon 7, SWELLOW
	end_party

	next_list_item ; PICNICKER (16) Route 111
	db "Celina@", TRAINERTYPE_NORMAL
	mon 7, NIDORINA
	mon 5, MILTANK
	end_party

	next_list_item ; PICNICKER (17) Route 111
	db "Bianca@", TRAINERTYPE_NORMAL
	mon 7, BAYLEEF
	mon 5, CUBONE
	end_party

	next_list_item ; PICNICKER (18) Route 111
	db "Gabby@", TRAINERTYPE_NORMAL
	mon 6, LINOONE
	mon 5, PINSIR
	end_party

	next_list_item ; PICNICKER (19) Route 111
	db "Irene@", TRAINERTYPE_NORMAL
	mon 6, MISDREAVUS
	mon 5, PILOSWINE
	end_party

	next_list_item ; PICNICKER (20) Fortree Gym
	db "Ashley@", TRAINERTYPE_NORMAL
	mon 7, SWABLU
	mon 7, DELIBIRD
	end_party

	next_list_item ; PICNICKER (21) Route 112
	db "Carol@", TRAINERTYPE_NORMAL
	mon 5, SWABLU
	mon 6, LOMBRE
	end_party

	next_list_item ; PICNICKER (22) Route 113
	db "Maddie@", TRAINERTYPE_NORMAL
	mon 5, SWABLU
	mon 6, NUMEL
	end_party

	next_list_item ; PICNICKER (23) Route 113
	db "Sophie@", TRAINERTYPE_NORMAL
	mon 5, MARILL
	mon 6, LOMBRE
	end_party

	next_list_item ; PICNICKER (24) Route 114
	db "Charlote@", TRAINERTYPE_NORMAL
	mon 5, IVYSAUR
	mon 6, BAYLEEF
	end_party

	next_list_item ; PICNICKER (25) Route 114
	db "Nancy@", TRAINERTYPE_NORMAL
	mon 5, VOLBEAT
	mon 6, ROSELIA
	end_party

	next_list_item ; PICNICKER (26) Route 114
	db "Angelina@", TRAINERTYPE_NORMAL
	mon 5, FLAAFFY
	mon 6, ARAICHU
	end_party

	next_list_item ; PICNICKER (27) Lavaridge Desert
	db "Heidi@", TRAINERTYPE_NORMAL
	mon 5, BALTOY
	mon 6, SANDSLASH
	end_party

	next_list_item ; PICNICKER (28) Lavaridge Desert
	db "Becky@", TRAINERTYPE_NORMAL
	mon 5, NIDORINA
	mon 6, AZUMARILL
	end_party

	next_list_item ; PICNICKER (29) Lavaridge Desert
	db "Celia@", TRAINERTYPE_NORMAL
	mon 5, AMAROWAK
	mon 6, MAROWAK
	end_party

	next_list_item ; PICNICKER (30) Pewter City Gym
	db "Amara@", TRAINERTYPE_NORMAL	
	mon 2, NIDORAN_F
	mon 2, GEODUDE
	end_party

	end_list_items

CamperGroup:
	next_list_item ; CAMPER (1) Route 32
	db "Roland@", TRAINERTYPE_NORMAL
	mon 3, NIDORAN_M
	mon 3, SENTRET
	end_party

	next_list_item ; CAMPER (2) Route 34
	db "Todd@", TRAINERTYPE_NORMAL
	mon 4, PSYDUCK
	mon 4, PHANPY
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
	mon 1, SANDSHREW
	mon 2, KABUTO
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
	mon 2, LINOONE
	end_party

	next_list_item ; CAMPER (14) Route 117
	db "Dylan@", TRAINERTYPE_NORMAL
	mon 5, DODUO
	mon 5, CORPHISH
	end_party

	next_list_item ; CAMPER (15) Route 108
	db "Dylan@", TRAINERTYPE_NORMAL
	mon 5, DONPHAN
	mon 5, GIRAFARIG
	end_party

	next_list_item ; CAMPER (16) Route 111
	db "Tyron@", TRAINERTYPE_NORMAL
	mon 5, TOGETIC
	mon 5, MURKROW
	end_party

	next_list_item ; CAMPER (17) Route 111
	db "Travis@", TRAINERTYPE_NORMAL
	mon 5, GLIGAR
	mon 5, CACTURNE
	end_party

	next_list_item ; CAMPER (18) Fortree Gym
	db "Flint@", TRAINERTYPE_NORMAL
	mon 7, GOLBAT
	mon 7, XATU
	end_party

	next_list_item ; CAMPER (19) Route 112
	db "Larry@", TRAINERTYPE_NORMAL
	mon 5, NUZLEAF
	mon 6, SWELLOW
	end_party

	next_list_item ; CAMPER (20) Route 113
	db "Jaylen@", TRAINERTYPE_NORMAL
	mon 5, TRAPINCH
	mon 6, RATICATE
	end_party

	next_list_item ; CAMPER (21) Route 113
	db "Lung@", TRAINERTYPE_NORMAL
	mon 5, KOFFING
	mon 6, MAGMAR
	end_party

	next_list_item ; CAMPER (22) Route 113
	db "Lawry@", TRAINERTYPE_NORMAL
	mon 5, BALTOY
	mon 6, SANDSLASH
	end_party

	next_list_item ; CAMPER (23) Route 114
	db "Shane@", TRAINERTYPE_NORMAL
	mon 5, URSARING
	mon 6, ASANDSLASH
	end_party

	next_list_item ; CAMPER (24) Lavaridge Desert
	db "Beau@", TRAINERTYPE_NORMAL	
	mon 4, TRAPINCH
	mon 6, DUGTRIO
	end_party

	next_list_item ; CAMPER (25) Lavaridge Desert
	db "Drew@", TRAINERTYPE_NORMAL	
	mon 4, SUDOWOODO
	mon 6, NIDORINO
	end_party

	next_list_item ; CAMPER (26) Lavaridge Desert
	db "Branden@", TRAINERTYPE_NORMAL	
	mon 4, SKARMORY
	mon 6, ONIX
	end_party

	next_list_item ; CAMPER (27) Pewter City Gym
	db "Liam@", TRAINERTYPE_NORMAL	
	mon 2, NIDORAN_M
	mon 2, AGEODUDE
	end_party

	end_list_items

ExecutiveFGroup:
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
	mon 8, RHYDON
	mon 8, VILEPLUME
	mon 8, EXEGGUTOR
	mon 8, DYNABEA
	mon 8, FERALIGATR2
	mon 10, ABSOLX
	end_party

	next_list_item ; EXECUTIVEF (4) Mauville Game Corner Executive
	db "Jane@", TRAINERTYPE_NORMAL
	mon 7, MURKROW
	mon 8, IVYSAUR
	mon 8, YANMA
	mon 9, GOREBYSS
	mon 10, OCTILLERY
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

SageGroup:
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
	mon 7, GASTLY
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

MediumGroup:
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
	mon 5, RALTS
	mon 6, SPOINK
	mon 5, NATU
	end_party

	next_list_item; MEDIUM (6) Saffron City Gym
	db "Rebecca@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	end_party

	next_list_item; MEDIUM (7) Saffron City Gym
	db "Doris@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	end_party

	end_list_items

BoarderGroup:
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

PokefanMGroup:
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
	mon 5, TRAPINCH
	mon 5, SPOINK
	end_party

	next_list_item ; POKEFANM (14) Route 117
	db "Isaac@", TRAINERTYPE_NORMAL
	mon 5, TEDDIURSA
	mon 5, ARON
	mon 5, TAILLOW
	mon 5, MAGBY
	mon 5, CLEFFA
	end_party

	next_list_item ; POKEFANM (15) Route 110
	db "Kaleb@", TRAINERTYPE_NORMAL
	mon 5, PIKACHU
	mon 5, JIGGLYPUFF
	end_party

	next_list_item ; POKEFANM (16) Route 110
	db "Edwin@", TRAINERTYPE_NORMAL
	mon 5, CLEFAIRY
	mon 5, SCYTHER
	end_party

	end_list_items

KimonoGirlGroup:
	next_list_item ; KIMONO_GIRL (1) Ecruteak City
	db "Naoko@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, QUILAVA, $aa, $aa
		dw FIRE_SPIN, MUD_SLAP, MUD_SHOT, FAINT_ATTACK
	dbwbb 5, QUILAVA2, $aa, $aa
		dw FIRE_SPIN, MUD_SLAP, MUD_SHOT, FAINT_ATTACK
	dbwbb 7, EEVEE, HP_MAX_FIRE, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	end_party

	next_list_item ; KIMONO_GIRL (2) Ecruteak City
	db "Sayo@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, NATU, $aa, $aa
		dw WING_ATTACK, PSYBEAM, CONFUSE_RAY, HEX
	dbwbb 5, SPOINK, $aa, $aa
		dw PSYWAVE, RAPID_SPIN, CONFUSE_RAY, SLAM
	dbwbb 7, EEVEE, HP_MAX_PSYCHIC, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	end_party

	next_list_item ; KIMONO_GIRL (3) Ecruteak City
	db "Zuki@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, UNOWN, HP_MAX_FLYING, $aa
		dw FAINT_ATTACK, HIDDEN_POWER, WILLOWISP, HEX
	dbwbb 5, NUZLEAF, $aa, $aa
		dw FAINT_ATTACK, LEECH_SEED, RAZOR_LEAF, RECOVER
	dbwbb 7, EEVEE, HP_MAX_DARK, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	end_party

	next_list_item ; KIMONO_GIRL (4) Ecruteak City
	db "Kuni@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, WINGULL, $aa, $aa
		dw WATER_PULSE, AERIAL_ACE, PROTECT, SUPERSONIC
	dbwbb 5, CHINCHOU, $aa, $aa
		dw WATER_PULSE, SHOCK_WAVE, THUNDER_WAVE, SUPERSONIC
	dbwbb 7, EEVEE, HP_MAX_WATER, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	end_party

	next_list_item ; KIMONO_GIRL (5) Ecruteak City
	db "Miki@", TRAINERTYPE_DVS | TRAINERTYPE_MOVES
	dbwbb 4, PLUSLE, HP_MAX_WATER, $aa
		dw HIDDEN_POWER, THUNDER_WAVE, SHOCK_WAVE, CHARM
	dbwbb 5, MINUN, HP_MAX_FIRE, $aa
		dw HIDDEN_POWER, THUNDER_WAVE, SHOCK_WAVE, GROWL
	dbwbb 7, EEVEE, HP_MAX_ELECTRIC, $fe
		dw HIDDEN_POWER, QUICK_ATTACK, STOMP, RECOVER
	end_party

	end_list_items

TwinsGroup:
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
	mon 7, GLOOM
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
	mon 7, ZANGOOSE
	mon 7, SEVIPER
	end_party

	next_list_item ; TWINS (7) Route 104
	db "Gina & Mia@", TRAINERTYPE_NORMAL
	mon 3, SEEDOT
	mon 3, LOTAD
	end_party

	next_list_item ; TWINS (8) Route 117
	db "Anna & Meg@", TRAINERTYPE_NORMAL
	mon 7, ZIGZAGOON
	mon 7, MAKUHITA
	end_party

	next_list_item ; TWINS (9) Route 108
	db "Lisa & Ria@", TRAINERTYPE_NORMAL
	mon 6, TENTACOOL
	mon 7, TOTODILE
	mon 6, QWILFISH
	mon 7, CORSOLA
	end_party

	next_list_item ; TWINS (10) Route 113
	db "Tori & Tia@", TRAINERTYPE_NORMAL
	mon 7, SPINDA
	mon 7, SPINDA
	end_party

	end_list_items

PokefanFGroup:
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
	mon 5, WINGULL
	mon 5, SHROOMISH
	mon 5, MARILL
	mon 5, GOLDEEN
	mon 5, SKITTY
	end_party

	next_list_item ; POKEFANF (8) Route 110
	db "Isabel@", TRAINERTYPE_NORMAL
	mon 6, PLUSLE
	mon 6, MINUN
	end_party

	next_list_item ; POKEFANF (9) Sootopolos Gym
	db "Annika@", TRAINERTYPE_NORMAL
	mon 6, SEADRA
	mon 6, LUVDISC
	end_party

	next_list_item ; POKEFANF (10) Sootopolos Gym
	db "Bethany@", TRAINERTYPE_NORMAL
	mon 6, PELIPPER
	mon 6, MARILL
	end_party

	end_list_items

RedGroup:
	next_list_item ; RED (1)
	db "Red@", TRAINERTYPE_MOVES
	mon 15, PIKACHU
		moves SURF, EXTREMESPEED, SWIFT, VOLT_TACKLE
	mon 13, ESPEON
		moves MUD_SLAP, MEDITATE, SWIFT, PSYCHIC_M
	mon 13, SNORLAX
		moves AMNESIA, SNORE, REST, BODY_SLAM
	mon 13, VENUSAUR
		moves SUNNY_DAY, GIGA_DRAIN, SYNTHESIS, SOLARBEAM
	mon 13, CHARIZARD
		moves FIRE_BLAST, SKY_ATTACK, OUTRAGE, SOLARBEAM
	mon 16, GOROCHU
		moves DRAGON_CLAW, VOLT_TACKLE, BEAT_UP, RECOVER
	end_party

	end_list_items

BlueGroup: ;Gym Leader
	next_list_item ; BLUE (1)
	db "Blue@", TRAINERTYPE_ITEM_MOVES
	itemmon 10, PIDGEOT, NO_ITEM
		moves EXTREMESPEED, SKY_ATTACK, BODY_SLAM, STEEL_WING
	itemmon 10, ALAKAZAM, NO_ITEM
		moves SHADOW_BALL, RECOVER, PSYCHIC_M, FOCUS_PUNCH
	itemmon 10, RHYPERIOR, NO_ITEM
		moves DRAGON_CLAW, SANDSTORM, STONE_EDGE, EARTHQUAKE
	itemmon 10, ARCANINE, CHARCOAL
		moves PURSUIT, SWIFT, SACRED_FIRE, EXTREMESPEED
	itemmon 11, GYARADOSX, NO_ITEM
		moves DRAGON_CLAW, WATERFALL, BEAT_UP, HYPER_BEAM
	itemmon 12, ARTICUNO, MIRACLEBERRY
		moves BLIZZARD, HURRICANE, PSYCHIC_M, REST
	end_party
	
	next_list_item ; BLUE (2)
	db "Blue@", TRAINERTYPE_MOVES
	mon 12, PIDGEOT
		moves EXTREMESPEED, SKY_ATTACK, BODY_SLAM, STEEL_WING
	mon 10, ALAKAZAM
		moves SHADOW_BALL, RECOVER, PSYCHIC_M, REFLECT
	mon 10, RHYDON
		moves DRAGONBREATH, SANDSTORM, ROCK_SLIDE, EARTHQUAKE
	mon 10, GYARADOSX
		moves DRAGONBREATH, WATERFALL, RAIN_DANCE, HYPER_BEAM
	mon 10, ARTICUNO
		moves REST, BLIZZARD, PSYCHIC_M, HURRICANE
	mon 13, ARCANINE
		moves ROAR, SWIFT, FLAMETHROWER, EXTREMESPEED
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
	mon 13, ARCANINE
		moves ROAR, SWIFT, FLAMETHROWER, EXTREMESPEED
	end_party

	end_list_items

OfficerGroup:
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

GruntFGroup:
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
	mon 7, PIKACHU
	mon 7, TRAPINCH
	mon 7, BELDUM
	mon 7, HOUNDOUR
	mon 8, AVULPIX
	mon 8, GYARADOS
	end_party

	next_list_item ; GRUNTF (7) Contest Amaya #2
	db "Amaya@", TRAINERTYPE_NORMAL
	mon 7, ARAICHU
	mon 7, VIBRAVA
	mon 7, METANG
	mon 7, HOUNDOOM
	mon 8, GYARADOS
	mon 9, ANINETALES
	end_party

	next_list_item ; GRUNTF (8) Contest Amaya #3
	db "Amaya@", TRAINERTYPE_NORMAL
	mon 7, ARAICHU
	mon 7, FLYGONX
	mon 7, METAGROSSX
	mon 7, HOUNDOOMX
	mon 8, GYARADOSX
	mon 9, NINETALES2
	end_party

	next_list_item ; GRUNTF (9) Safari Gruntf 1
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, ARBOK
	mon 5, SEVIPER
	end_party

	next_list_item ; GRUNTF (10) Safari Gruntf 2
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, PRIMEAPE
	mon 5, HYPNO
	end_party

	next_list_item ; GRUNTF (11) Safari Gruntf 3
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, DEWGONG
	mon 5, HITMONCHAN
	end_party

	next_list_item ; GRUNTF (12) Safari Gruntf 4
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, SEAKING
	mon 5, AERODACTYL
	end_party

	next_list_item ; GRUNTF (13) Safari Gruntf 5
	db "Grunt@", TRAINERTYPE_NORMAL
	mon 5, GRANBULL
	mon 5, MIGHTYENA
	end_party

	next_list_item ; GRUNTF (14) Rustturf Gruntf 1
	db "Lisa@", TRAINERTYPE_NORMAL
	mon 5, SNUBBULL
	mon 5, HOUNDOUR
	end_party

	next_list_item ; GRUNTF (15) Mauville Gruntf 1
	db "Lisa@", TRAINERTYPE_NORMAL
	mon 5, HOUNDOUR
	mon 7, GRANBULL
	end_party

	next_list_item ; GRUNTF (16) Mauville Gruntf 2
	db "Jamie@", TRAINERTYPE_NORMAL
	mon 5, CARVANHA
	mon 7, GOLBAT
	end_party

	next_list_item ; GRUNTF (17) Mauville Gruntf 3
	db "Jenna@", TRAINERTYPE_NORMAL
	mon 5, MANTINE
	mon 7, QUAGSIRE
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
	mon 6, MANECTRIC
	mon 7, ELECTRODE2
	mon 8, AMPHAROS
	end_party

	next_list_item ; GRUNTF (21) Mt Pyre Gruntf 2
	db "Elite@", TRAINERTYPE_NORMAL
	mon 6, GOLDUCK
	mon 7, VAPOREON
	mon 8, SWAMPERT
	end_party

	next_list_item ; GRUNTF (22) Mt Pyre Gruntf 3
	db "Elite@", TRAINERTYPE_NORMAL
	mon 6, WIGGLYTUFF
	mon 7, CLEFABLE
	mon 8, SYLVEON
	end_party

	next_list_item ; GRUNTF (23) Mt Pyre Gruntf 4
	db "Elite@", TRAINERTYPE_NORMAL
	mon 6, IKARI
	mon 7, ASANDSLASH
	mon 8, AGGRON
	end_party

	end_list_items

MysticalmanGroup:
	next_list_item ; MYSTICALMAN (1) Cianwood City
	db "Eusine@", TRAINERTYPE_MOVES
	mon 8, HYPNO
		moves DREAM_EATER, HYPNOSIS, DISABLE, CONFUSION
	mon 8, GENGAR
		moves LICK, HYPNOSIS, MEAN_LOOK, CURSE
	mon 8, ELECTRODE2
		moves SCREECH, SONICBOOM, THUNDER, ROLLOUT
	end_party

	end_list_items

KrisGroup:
	next_list_item; KRIS (1) Unreferenced
	db "Kris@", TRAINERTYPE_NORMAL
	mon 10, CHIKORITA
	mon 10, CYNDAQUIL
	mon 10, TOTODILE
	end_party

	end_list_items

RoxanneGroup:
	next_list_item; ROXXANE (1) Rustboro City Gym
	db "Roxxane@", TRAINERTYPE_NORMAL
	mon 5, AGEODUDE
	mon 5, KABUTO
	mon 7, NOSEPASS
	end_party

	next_list_item; ROXXANE (2) Rustboro City Gym
	db "Roxxane@", TRAINERTYPE_NORMAL
	mon 8, NOSEPASS
	mon 8, MAGCARGO
	mon 8, AGOLEM
	mon 8, RELICANTH
	mon 11, AERODACTYL
	end_party

	next_list_item ; ROXXANE (3) Rustboro City Gym
	db "Roxxane@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, TENTACRUEL2, KINGS_ROCK
		moves SIGNAL_BEAM, ROCK_TOMB, STONE_EDGE, GIGA_DRAIN
	itemmon 9, LUNATONE, NO_ITEM
		moves ROCK_TOMB, COSMIC_POWER, PSYCHIC_M, SANDSTORM
	itemmon 9, SOLROCK, NO_ITEM
		moves ROCK_TOMB, COSMIC_POWER, FLAMETHROWER, SANDSTORM
	itemmon 10, AGOLEM, NO_ITEM
		moves THUNDERBOLT, STONE_EDGE, PROTECT, EARTHQUAKE
	itemmon 11, REGIROCK, NO_ITEM
		moves SLEEP_TALK, COSMIC_POWER, REST, STONE_EDGE
	itemmon 11, PROBOPASS, LEFTOVERS
		moves ROCK_TOMB, STONE_EDGE, AURA_SPHERE, SANDSTORM
	end_party

	end_list_items

BrawlyGroup:
	next_list_item; BRAWLY (1) 
	db "Brawly@", TRAINERTYPE_NORMAL
	mon 7, MACHOP
	mon 7, MEDITITE
	mon 7, MAKUHITA
	end_party

	next_list_item; BRAWLY (2) 
	db "Brawly@", TRAINERTYPE_NORMAL
	mon 7, MACHOKE
	mon 7, MEDICHAM
	mon 7, HITMONCHAN
	mon 7, BRELOOM
	mon 7, BLAZIKEN
	end_party

	next_list_item ; BRAWLY (3)
	db "Brawly@", TRAINERTYPE_ITEM_MOVES	
	itemmon 9, BRELOOM, MAGNET
		moves THUNDERPUNCH, MACH_PUNCH, LEAF_BLADE, DYNAMICPUNCH
	itemmon 9, STEELIX, LEFTOVERS
		moves IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	itemmon 9, MEDICHAM, TWISTEDSPOON
		moves ZEN_HEADBUTT, MACH_PUNCH, SHADOW_PUNCH, BULLET_PUNCH
	itemmon 10, ANNIHILAPE, ICE_BERRY
		moves MACH_PUNCH, BULK_UP, SHADOW_PUNCH, EARTHQUAKE
	itemmon 10, AGGRON, QUICK_CLAW
		moves ROCK_SLIDE, BRICK_BREAK, GUILLOTINE, FISSURE
	itemmon 11, BLAZIKEN, BLACKBELT_I
		moves DRILL_PECK, BLAZE_KICK, HI_JUMP_KICK, DETECT
	end_party

	end_list_items

WattsonGroup:
	next_list_item; WATTSON (1)
	db "Wattson@", TRAINERTYPE_NORMAL
	mon 7, HVOLTORB
	mon 7, MINUN
	mon 7, PLUSLE
	mon 9, MAGNETON
	mon 9, MANECTRIC
	end_party

	next_list_item; WATTSON (2)
	db "Wattson@", TRAINERTYPE_NORMAL
	mon 9, HELECTRODE
	mon 9, MINUN
	mon 9, PLUSLE
	mon 10, MAGNEZONE
	mon 11, MANECTRIC
	end_party

	next_list_item ; WATTSON (3)
	db "Wattson@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, HELECTRODE, NO_ITEM
		moves THUNDERBOLT, CHARGE, GIGA_DRAIN, THUNDER_WAVE
	itemmon 9, MANECTRIC, MAGNET
		moves SHOCKSLAM, CRUNCH, PURSUIT, THUNDER_WAVE
	itemmon 9, JOLTEON, NO_ITEM
		moves ZAP_CANNON, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	itemmon 10, ELECTIVIRE, NO_ITEM
		moves ZAP_CANNON, FIRE_PUNCH, DIZZY_PUNCH, THUNDERBOLT
	itemmon 10, ARAICHU, KINGS_ROCK
		moves SURF, FLASHCANNON, VOLT_TACKLE, SWIFT
	itemmon 11, AMPHAROSX, NO_ITEM
		moves FAERIEGLEAM, FLASHCANNON, CHARGE, THUNDERBOLT
	end_party

	end_list_items

FlanneryGroup:
	next_list_item; FLANNERY (1) 
	db "Flannery@", TRAINERTYPE_NORMAL
	mon 6, SLUGMA
	mon 7, HGROWLITHE
	mon 7, GROWLITHE
	mon 8, MAGMAR
	mon 9, TORKOAL
	end_party

	next_list_item; FLANNERY (2) 
	db "Flannery@", TRAINERTYPE_NORMAL
	mon 8, MAGCARGO
	mon 8, HARCANINE
	mon 8, ARCANINE
	mon 8, MAGMAR
	mon 9, CAMERUPT
	mon 10, TORKOAL
	end_party

	next_list_item ; FLANNERY (3)
	db "Flannery@", TRAINERTYPE_ITEM_MOVES
	itemmon 9, SUNFLORA, QUICK_CLAW
		moves FIRE_BLAST, SOLARBEAM, GIGA_DRAIN, STUN_SPORE
	itemmon 9, HARCANINE, NO_ITEM
		moves FIRE_BLAST, PURSUIT, WILLOWISP, STONE_EDGE
	itemmon 9, ARCANINE, NO_ITEM
		moves BODY_SLAM, SACRED_FIRE, PURSUIT, SWORDS_DANCE
	itemmon 9, TORKOAL, LEFTOVERS
		moves FIRE_BLAST, FISSURE, REST, COSMIC_POWER
	itemmon 10, CHARIZARD, NO_ITEM
		moves FLAMETHROWER, SKY_ATTACK, DRAGONBREATH, SWIFT
	itemmon 11, CAMERUPTX, LEFTOVERS
		moves FISSURE, ERUPTION, RECOVER, AMNESIA
	end_party

	end_list_items

NormanGroup:
	next_list_item; NORMAN (1)
	db "Norman@", TRAINERTYPE_NORMAL
	mon 8, LINOONE
	mon 8, SPINDA
	mon 15, DITTO
	mon 8, URSARING
	mon 11, SNORLAX
	end_party

	next_list_item; NORMAN (2)
	db "Norman@", TRAINERTYPE_NORMAL
	mon 8, LINOONE
	mon 8, SPINDA
	mon 15, DITTO
	mon 11, SNORLAX
	mon 11, URSALUNA
	end_party

	next_list_item ; NORMAN (3)
	db "Norman@", TRAINERTYPE_ITEM_MOVES
	itemmon 15, DITTO, QUICK_CLAW
		moves TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE
	itemmon 9, SPINDA, PINK_BOW
		moves BELLY_DRUM, EXTREMESPEED, NO_MOVE, NO_MOVE
	itemmon 9, ARCANINE, CHARCOAL
		moves BODY_SLAM, SACRED_FIRE, PURSUIT, SWORDS_DANCE
	itemmon 9, SNORLAX, LEFTOVERS
		moves SLEEP_TALK, SNORE, REST, COSMIC_POWER
	itemmon 10, URSALUNA, LEFTOVERS
		moves BODY_SLAM, EARTHQUAKE, REST, SLEEP_TALK
	itemmon 11, FURRET2, PINK_BOW
		moves BODY_SLAM, DRAGON_CLAW, RECOVER, DRAGON_DANCE
	end_party

	end_list_items

WinonaGroup:
	next_list_item; WINONA (1) Fortree Gym Easy
	db "Winona@", TRAINERTYPE_NORMAL
	mon 8, SWELLOW
	mon 8, PELIPPER
	mon 9, ALTARIA
	end_party

	next_list_item; WINONA (2) Fortree Gym Medium
	db "Winona@", TRAINERTYPE_NORMAL
	mon 8, SWELLOW
	mon 8, PELIPPER
	mon 9, SKARMORY
	mon 9, TROPIUS
	mon 10, ALTARIA
	end_party

	next_list_item; WINONA (3) Fortree Gym Hard
	db "Winona@", TRAINERTYPE_NORMAL
	mon 8, SWELLOW
	mon 8, PELIPPER
	mon 9, SKARMORY
	mon 9, TROPIUS
	mon 10, TOGEKISS
	mon 11, ALTARIAX
	end_party

	end_list_items

TateLizaGroup:
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
	db "Tate&Liza@", TRAINERTYPE_NORMAL
	mon 10, SOLROCK
	mon 10, LUNATONE
	mon 10, GARDEVOIR
	mon 10, GALLADE
	mon 10, CLAYDOL
	mon 10, CHIMECHOX
	end_party

	end_list_items

WallaceGroup:
	next_list_item; WALLACE (1) Sootopolis Gym
	db "Wallace@", TRAINERTYPE_ITEM_MOVES
	itemmon 8, LUVDISC, QUICK_CLAW
		moves SURF, RAIN_DANCE, FAERIEGLEAM, BATON_PASS
	itemmon 9, LANTURN, BITTER_BERRY
		moves SURF, THUNDER, THUNDER_WAVE, ICE_BEAM
	itemmon 9, WHISCASH, TWISTEDSPOON
		moves SURF, MUD_SHOT, EARTHQUAKE, AMNESIA
	itemmon 10, SEAKING, BLACKBELT_I
		moves DRILL_PECK, WATERFALL, AGILITY, SWORDS_DANCE
	itemmon 10, WAILORD, BITTER_BERRY
		moves WATER_SPOUT, AMNESIA, REST, BODY_SLAM
	itemmon 11, MILOTIC, LEFTOVERS
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
	itemmon 11, KINGDRA, BITTER_BERRY
		moves HYDRO_PUMP, OUTRAGE, REST, THUNDER
	itemmon 13, MILOTIC, LEFTOVERS
		moves FLASHCANNON, CALM_MIND, MIST_BALL, DRAININGKISS
	end_party

	end_list_items

SidneyGroup:
	next_list_item ; SIDNEY (1)
	db "Sidney@", TRAINERTYPE_MOVES
	mon 9, MIGHTYENA
		moves CRUNCH, DIG, BULK_UP, SNARL
	mon 9, UMBREON
		moves COSMIC_POWER, TOXIC, RECOVER, SNARL
	mon 9, SHIFTRY
		moves STUN_SPORE, LEAF_BLADE, PURSUIT, HEAT_WAVE
	mon 9, SHARPEDO
		moves PURSUIT, CRUNCH, BODY_SLAM, SURF
	mon 10, HYPNO
		moves HYPNOSIS, DREAM_EATER, DIZZY_PUNCH, PSYCHIC_M
	mon 11, ABSOL
		moves DRAGON_DANCE, SKY_ATTACK, BEAT_UP, SLASH
	end_party

	next_list_item ; SIDNEY (2)
	db "Sidney@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, MIGHTYENA, NO_ITEM
		moves FIRE_FANG, CRUNCH, ICE_FANG, POISON_FANG
	itemmon 11, UMBREON, LEFTOVERS
		moves COSMIC_POWER, SNARL, REST, MUD_SLAP
	itemmon 11, SHIFTRY, MIRACLEBERRY
		moves STUN_SPORE, LEAF_BLADE, PURSUIT, HEAT_WAVE
	itemmon 11, SHARPEDO, BLACKGLASSES
		moves PLAY_ROUGH, CRUNCH, BODY_SLAM, WATERFALL
	itemmon 12, HYPNO, NO_ITEM
		moves HYPNOSIS, DREAM_EATER, DARK_PULSE, ICE_BEAM
	itemmon 13, ABSOLX, LEFTOVERS
		moves DRAGON_DANCE, SKY_ATTACK, BEAT_UP, SLASH
	end_party

	end_list_items

PhoebeGroup:
	next_list_item ; PHOEBE (1)
	db "Phoebe@", TRAINERTYPE_MOVES
	mon 9, NINETALES
		moves SHADOW_BALL, FLAMETHROWER, DESTINY_BOND, CONFUSE_RAY
	mon 9, PARASECT
		moves SHADOW_FORCE, LEAF_BLADE, SLASH, STUN_SPORE
	mon 9, BANETTE
		moves WILLOWISP, CONFUSE_RAY, PSYCHO_CUT, SHADOW_CLAW
	mon 9, UNOWN
		moves GLARE, CURSE, COSMIC_POWER, SHADOW_BALL
	mon 10, MISDREAVUS
		moves WILLOWISP, CONFUSE_RAY, MEAN_LOOK, PAIN_SPLIT
	mon 11, DUSKNOIR
		moves DRAGON_DANCE, SHADOW_FORCE, PURSUIT, SHADOWSNEAK
	end_party

	next_list_item ; PHOEBE (2)
	db "Phoebe@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, NINETALES, CHARCOAL
		moves SHADOW_BALL, FLAMETHROWER, DESTINY_BOND, CONFUSE_RAY
	itemmon 11, PARASECT, LEFTOVERS
		moves SHADOW_FORCE, LEAF_BLADE, SLASH, STUN_SPORE
	itemmon 11, BANETTE, TWISTEDSPOON
		moves WILLOWISP, CONFUSE_RAY, PSYCHO_CUT, SHADOW_CLAW
	itemmon 11, UNOWN, WARD_BERRY
		moves GLARE, CURSE, COSMIC_POWER, SHADOW_BALL
	itemmon 12, MISMAGIUS, NO_ITEM
		moves WILLOWISP, CONFUSE_RAY, MEAN_LOOK, SHADOW_BALL
	itemmon 13, DUSKNOIR, LEFTOVERS
		moves DRAGON_DANCE, SHADOW_FORCE, PURSUIT, SHADOWSNEAK
	end_party

	end_list_items

GlaciaGroup:
	next_list_item ; GLACIA (1)
	db "Glacia@", TRAINERTYPE_MOVES
	mon 9, ANINETALES
		moves ICE_BEAM, FAERIEGLEAM, ICY_WIND, CALM_MIND
	mon 9, FROSLASS
		moves HAIL, ICE_BEAM, SHADOW_BALL, ICY_WIND
	mon 9, WALREIN
		moves SURF, ICE_BEAM, BODY_SLAM, EARTHQUAKE
	mon 9, ASANDSLASH
		moves ICICLE_CRASH, VICEGRIP, SLASH, BULK_UP
	mon 10, JYNX
		moves HAIL, PSYCHIC_M, ICE_BEAM, MEDITATE
	mon 11, GLALIE
		moves CRUNCH, ICE_BEAM, EXPLOSION, HAIL
	end_party

	next_list_item ; GLACIA (2)
	db "Glacia@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, ANINETALES, NEVERMELTICE
		moves BLIZZARD, FAERIEGLEAM, ICY_WIND, CALM_MIND
	itemmon 11, FROSLASS, QUICK_CLAW
		moves HAIL, BLIZZARD, SHADOW_BALL, ICY_WIND
	itemmon 11, WALREIN, MYSTIC_WATER
		moves HYDRO_PUMP, BLIZZARD, EARTHQUAKE, REST
	itemmon 11, ASANDSLASH, WARD_BERRY
		moves ICICLE_CRASH, VICEGRIP, SLASH, BULK_UP
	itemmon 12, JYNX, FOCUS_BAND
		moves DIZZY_PUNCH, PSYCHIC_M, BLIZZARD, MEDITATE
	itemmon 13, GLALIEX, LEFTOVERS
		moves BLIZZARD, HAIL, CRUNCH, PROTECT
	end_party

	end_list_items

DrakeGroup:
	next_list_item ; DRAKE (1)
	db "Drake@", TRAINERTYPE_MOVES
	mon 9, ALTARIA
		moves DRAGON_DANCE, PLAY_ROUGH, DRAGON_CLAW, EARTHQUAKE
	mon 9, FLYGON
		moves FLAMETHROWER, MUD_SHOT, DRAGONBREATH, POISON_FANG
	mon 9, KINGDRA
		moves SURF, ICE_BEAM, OUTRAGE, AMNESIA
	mon 9, YANMEGA
		moves DRAGON_CLAW, PIN_MISSILE, DETECT, DRAGON_DANCE
	mon 10, EXEGGUTOR2
		moves CRUNCH, FIRE_FANG, ICE_FANG, THUNDER_FANG
	mon 11, SALAMENCE
		moves CRUNCH, DRAGON_CLAW, FIRE_BLAST, ROCK_TOMB
	end_party

	next_list_item ; DRAKE (2)
	db "Drake@", TRAINERTYPE_ITEM_MOVES
	itemmon 11, ALTARIA, DRAGON_FANG
		moves DRAGON_DANCE, PLAY_ROUGH, DRAGON_CLAW, EARTHQUAKE
	itemmon 11, FLYGON, SOFT_SAND
		moves FLAMETHROWER, EARTHQUAKE, DRAGON_CLAW, ROCK_TOMB
	itemmon 11, KINGDRA, MYSTIC_WATER
		moves HYDRO_PUMP, BLIZZARD, DRAGONBREATH, AMNESIA
	itemmon 11, YANMEGA, WARD_BERRY
		moves DRAGON_CLAW, MEGAHORN, DETECT, DRAGON_DANCE
	itemmon 12, EXEGGUTOR2, FOCUS_BAND
		moves CRUNCH, FIRE_FANG, ICE_FANG, THUNDER_FANG
	itemmon 13, SALAMENCEX, SCOPE_LENS
		moves CRUNCH, DRAGON_CLAW, FIRE_BLAST, ROCK_TOMB
	end_party

	end_list_items

StevenGroup:
	next_list_item ; STEVEN (1)
	db "Steven@", TRAINERTYPE_MOVES
	mon 11, SKARMORY
		moves MUD_SLAP, DRILL_PECK, RECOVER, VICEGRIP
	mon 11, AERODACTYL
		moves ROCK_SLIDE, CRUNCH, FLY, ROCK_TOMB
	mon 11, AGGRON
		moves STONE_EDGE, VICEGRIP, EARTHQUAKE, HYPER_BEAM
	mon 11, PROBOPASS
		moves THUNDERBOLT, FLASHCANNON, ROCK_TOMB, RECOVER
	mon 12, SCIZOR
		moves VICEGRIP, BULLET_PUNCH, LEAF_BLADE, SWORDS_DANCE
	mon 13, REGISTEEL
		moves METEOR_MASH, SANDSTORM, ROCK_SLIDE, ZAP_CANNON
	end_party
	
	next_list_item ; STEVEN (2)
	db "Steven@", TRAINERTYPE_ITEM_MOVES
	itemmon 12, SKARMORY, NO_ITEM
		moves MUD_SLAP, SKY_ATTACK, RECOVER, GUILLOTINE
	itemmon 12, AERODACTYL, MINT_BERRY
		moves ROCK_SLIDE, CRUNCH, FLY, ROCK_TOMB
	itemmon 12, AGGRON, NO_ITEM
		moves STONE_EDGE, VICEGRIP, EARTHQUAKE, HYPER_BEAM
	itemmon 12, PROBOPASS, NO_ITEM
		moves FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, HYPER_BEAM
	itemmon 12, SCIZOR, FOCUS_BAND
		moves VICEGRIP, BULLET_PUNCH, LEAF_BLADE, SWORDS_DANCE
	itemmon 13, REGISTEEL, MINT_BERRY
		moves METEOR_MASH, SANDSTORM, ROCK_SLIDE, ZAP_CANNON
	end_party

	next_list_item ; STEVEN (3)
	db "Steven@", TRAINERTYPE_ITEM_MOVES
	itemmon 20, METAGROSSX, LEFTOVERS
		moves METEOR_MASH, COSMIC_POWER, EARTHQUAKE, PSYCHIC_M
	end_party

	end_list_items


BattleGirlGroup:
	next_list_item; BATTLE_GIRL (1) Dewford City Gym
	db "Laura@", TRAINERTYPE_NORMAL
	mon 7, MEDITITE
	end_party

	next_list_item; BATTLE_GIRL (2) Dewford City Gym
	db "Lilith@", TRAINERTYPE_NORMAL	
	mon 7, FARFETCH_D
	end_party

	next_list_item; BATTLE_GIRL (3) Dewford City Gym
	db "Jocelyn@", TRAINERTYPE_NORMAL
	mon 7, COMBUSKEN
	mon 7, MANKEY
	end_party

	next_list_item; BATTLE_GIRL (4) Lavaridge Gym
	db "Dani@", TRAINERTYPE_NORMAL
	mon 7, MEDITITE
	mon 7, TORRACAT
	end_party

	next_list_item; BATTLE_GIRL (4) Route 117
	db "Aisha@", TRAINERTYPE_NORMAL
	mon 6, HITMONLEE
	mon 6, ABSOL
	end_party

	next_list_item; BATTLE_GIRL (5) Route 120
	db "Callie@", TRAINERTYPE_NORMAL
	mon 6, HITMONTOP
	mon 6, MAKUHITA
	end_party

	end_list_items


RangerMGroup:
	next_list_item; RANGERM (1) Unreferenced
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
	itemmon 11, GENGAR, NO_ITEM
		moves PSYCHIC_M, GIGA_DRAIN, SLUDGE_WAVE, SHADOW_BALL
	itemmon 11, STARMIE, NO_ITEM
		moves MIST_BALL, HYDRO_CANNON, THUNDERBOLT, BLIZZARD
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
	mon 7, MEGANIUM
	mon 7, TROPIUS
	mon 8, VENUSAUR
	end_party

	next_list_item; RANGERM (6) Safari Zone Randal
	db "Randal@", TRAINERTYPE_NORMAL
	mon 7, TYPHLOSION
	mon 7, KANGASKHAN
	mon 8, CHARIZARD
	end_party

	next_list_item; RANGERM (7) Safari Zone Steven
	db "Steven@", TRAINERTYPE_NORMAL
	mon 7, RHYDON
	mon 7, MR__MIME
	mon 8, SCYTHER
	end_party

	next_list_item; RANGERM (8) Route 119
	db "Jackson@", TRAINERTYPE_NORMAL
	mon 7, BAYLEEF
	mon 7, GOLDUCK
	mon 7, BRELOOM
	end_party

	next_list_item; RANGERM (9) Route 119
	db "Takashi@", TRAINERTYPE_NORMAL
	mon 7, LEAFEON
	mon 7, FLAREON
	mon 7, GLACEON
	end_party

	next_list_item; RANGERM (10) Route 119
	db "Yasu@", TRAINERTYPE_NORMAL
	mon 7, ESPEON
	mon 7, UMBREON
	mon 7, SYLVEON
	end_party

	next_list_item; RANGERM (11) Route 119
	db "Hideo@", TRAINERTYPE_NORMAL
	mon 7, JOLTEON
	mon 7, POLITOED
	mon 7, XATU
	end_party

	next_list_item; RANGERM (12) Route 120
	db "Riley@", TRAINERTYPE_NORMAL
	mon 7, DUSTOX
	mon 7, POLIWRATH
	mon 7, ZANGOOSE
	end_party

	next_list_item; RANGERM (13) Route 120
	db "Lorenzo@", TRAINERTYPE_NORMAL
	mon 7, AMUK
	mon 7, QUAGSIRE
	mon 7, EXEGGCUTE
	end_party

	next_list_item; RANGERM (14) Route 120
	db "Keigo@", TRAINERTYPE_NORMAL
	mon 7, WEEZING
	mon 7, TANGELA
	mon 7, IKARI
	end_party

	next_list_item; RANGERM (15) Treetop Trial
	db "Ranger@", TRAINERTYPE_RANDOM, 3, TRIAL_EASY
	end_party

	end_list_items

RangerFGroup:
	next_list_item; RANGERF (1) Unreferenced
	db "Steven@", TRAINERTYPE_NORMAL
	mon 7, CHIKORITA
	mon 7, CYNDAQUIL
	mon 8, TOTODILE
	end_party

	next_list_item; RANGERF (2) Safari Zone Monica
	db "Monica@", TRAINERTYPE_NORMAL
	mon 7, JYNX
	mon 7, LICKITUNG
	mon 8, PINSIR
	end_party

	next_list_item; RANGERF (3) Safari Zone Tina
	db "Tina@", TRAINERTYPE_NORMAL
	mon 7, CHIMECHO
	mon 7, BRELOOM
	mon 8, DELCATTY
	end_party

	next_list_item; RANGERF (4) Safari Zone Rachael
	db "Rachael@", TRAINERTYPE_NORMAL
	mon 7, LUDICOLO
	mon 7, STANTLER
	mon 8, SLOWKING
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
	mon 7, NINETALES
	mon 7, RAPIDASH
	mon 7, ASHIBOMB
	end_party

	end_list_items

ExplorerGroup:
	next_list_item; EXPLORER (1) Route 105
	db "Foster@", TRAINERTYPE_NORMAL
	mon 5, RELICANTH
	mon 5, URSARING
	mon 7, NOSEPASS
	end_party

	next_list_item; EXPLORER (2) Route 105
	db "Andres@", TRAINERTYPE_NORMAL
	mon 5, ASANDSHREW
	mon 5, CRAWDAUNT
	mon 7, ARMALDO
	end_party

	next_list_item; EXPLORER (3) Safari Zone Joey
	db "Joey@", TRAINERTYPE_NORMAL
	mon 6, ASANDSLASH
	mon 7, ASANDSHREW
	mon 8, ARMALDO
	end_party

	next_list_item; EXPLORER (4) Safari Zone Ross
	db "Ross@", TRAINERTYPE_NORMAL
	mon 6, METANG
	mon 7, CLAYDOL
	mon 8, YANMEGA
	end_party

	next_list_item; EXPLORER (5) Safari Zone Chandler
	db "Chandler@", TRAINERTYPE_NORMAL
	mon 6, WHISCASH
	mon 7, CAMERUPT
	mon 8, HARIYAMA
	end_party

	next_list_item; EXPLORER (6) Testroom
	db "Test@", TRAINERTYPE_RANDOM | TRAINERTYPE_ITEM | TRAINERTYPE_MOVES, 6, PSYCHIC_EASY	
	end_party

	next_list_item; EXPLORER (7) Lavaridge Desert
	db "Dusty@", TRAINERTYPE_NORMAL
	mon 5, GLIGAR
	mon 5, SHUCKLE
	mon 7, KLEAVOR
	end_party

	next_list_item; EXPLORER (8) Lavaridge Desert
	db "Bryan@", TRAINERTYPE_NORMAL
	mon 5, RELICANTH
	mon 5, SOLROCK
	mon 7, SLOWKING
	end_party

	next_list_item; EXPLORER (9) Route 120
	db "Chip@", TRAINERTYPE_NORMAL
	mon 5, YANMA
	mon 5, SKARMORY
	mon 7, KINGLER
	end_party

	next_list_item; EXPLORER (10) Route 120
	db "Dale@", TRAINERTYPE_NORMAL
	mon 5, YANMA
	mon 5, GLIGAR
	mon 7, MAGNETON
	end_party

	end_list_items


	PsychicFGroup:

	next_list_item; PSYCHIC_F (01) Mossdeep Gym
	db "Maura@", TRAINERTYPE_NORMAL
	mon 6, DROWZEE
	mon 7, KADABRA
	end_party

	next_list_item; PSYCHIC_F (02) Mossdeep Gym
	db "Samantha@", TRAINERTYPE_NORMAL
	mon 6, MISDREAVUS
	mon 7, XATU
	end_party

	next_list_item; PSYCHIC_F (03) Mossdeep Gym
	db "Macey@", TRAINERTYPE_NORMAL
	mon 6, NATU
	mon 7, SLOWKING
	end_party

	next_list_item; PSYCHIC_F (04) Mossdeep Gym
	db "Kathleen@", TRAINERTYPE_NORMAL
	mon 6, SLOWPOKE
	mon 7, BANETTE
	end_party

	next_list_item; PSYCHIC_F (05) Mossdeep Gym
	db "Sylvia@", TRAINERTYPE_NORMAL
	mon 6, HAUNTER
	mon 7, MEDICHAM
	end_party

	next_list_item; PSYCHIC_F (06) Mossdeep Gym
	db "Hannah@", TRAINERTYPE_NORMAL
	mon 6, BALTOY
	mon 7, BUTTERFREE
	end_party

	end_list_items


	AgathaGroup:

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


	LoreleiGroup:

	next_list_item ; LORELEI (1)
	db "Lorelei@", TRAINERTYPE_MOVES
	mon 10, DELIBIRD
		moves RAZOR_WIND, ICY_WIND, FLY, SPIKES
	mon 11, ANINETALES
		moves ICY_WIND, BLIZZARD, HAIL, MOONBLAST
	mon 11, GLACEON
		moves CALM_MIND, BLIZZARD, MUD_SHOT, RECOVER
	mon 12, CLOYSTER
		moves BLIZZARD, SURF, REST, WHIRLPOOL
	mon 12, DEWGONG
		moves SURF, BLIZZARD, HAIL, REST
	mon 15, LAPRAS
		moves HAIL, BLIZZARD, DRAGONBREATH, REST
	end_party

	end_list_items


	FergusGroup:

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


	NeeshaGroup:

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


	LilyGroup:

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


	GuyGroup:

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


	GiovanniGroup:

	next_list_item ; GIOVANNI (1)
	db "Giovanni@", TRAINERTYPE_MOVES
	mon 10, PERSIAN
		moves SLASH, CRUNCH, PLAY_ROUGH, SWORDS_DANCE
	mon 10, DUGTRIO
		moves FISSURE, ROCK_SLIDE, MUDDY_WATER, REFLECT
	mon 10, NIDOQUEEN
		moves EARTHQUAKE, SLUDGE_BOMB, TOXIC, ICE_FANG
	mon 12, ARCANINE
		moves CRUNCH, SACRED_FIRE, BODY_SLAM, FIRE_BLAST
	mon 12, MAROWAK
		moves BONE_CLUB, SHADOW_FORCE, SUBMISSION, COSMIC_POWER
	mon 16, MEWTWO
		moves PSYCHIC_M, AURA_SPHERE, CALM_MIND, RECOVER
	end_party

	end_list_items


	WallyGroup:

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
	mon 7, CHIMECHO
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
	db "Wally@", TRAINERTYPE_MOVES
	mon 12, CHIMECHO
		moves CALM_MIND, WILLOWISP, RECOVER, PSYCHIC_M
	mon 12, WHISCASH
		moves MUDDY_WATER, EARTHQUAKE, TOXIC, REST
	mon 12, ALTARIA
		moves DRAGON_DANCE, DRAGON_CLAW, PLAY_ROUGH, SKY_ATTACK
	mon 13, TROPIUS
		moves SKY_ATTACK, LEECH_SEED, FRENZY_PLANT, RECOVER
	mon 13, ABSOL
		moves SLASH, BEAT_UP, DRAGON_CLAW, SKY_ATTACK
	mon 15, GARDEVOIRX
		moves CALM_MIND, PSYCHIC_M, MOONBLAST, RECOVER
	end_party

	end_list_items


	GreenGroup:

	next_list_item ; GREEN (1)
	db "Green@", TRAINERTYPE_NORMAL
	mon 3, SQUIRTLE
	end_party

	next_list_item ; GREEN (2)
	db "Green@", TRAINERTYPE_NORMAL
	mon 5, SPEAROW
	mon 6, CLEFAIRY
	mon 7, SQUIRTLE
	end_party

	next_list_item ; GREEN (3)
	db "Green@", TRAINERTYPE_NORMAL
	mon 9, CLEFAIRY
	mon 9, HAUNTER
	mon 9, WEEPINBELL
	mon 8, FEAROW
	mon 12, BLASTOISE
	end_party

	next_list_item ; GREEN (4)
	db "Green@", TRAINERTYPE_NORMAL
	mon 11, KANGASKHAN
	mon 9, CLEFABLE
	mon 9, GENGAR
	mon 9, VICTREEBEL
	mon 9, ANINETALES
	mon 12, BLASTOISE
	end_party

	next_list_item ; WC_GREEN (?) World Cup Green
	db "Green@", TRAINERTYPE_MOVES
	mon 12, KANGASKHAN
		moves DIZZY_PUNCH, CRUNCH, DOUBLE_EDGE, EARTHQUAKE
	mon 12, GENGAR
		moves HEX, WILLOWISP, TOXIC, DARK_PULSE
	mon 12, VICTREEBEL
		moves STUN_SPORE, SLUDGE_BOMB, NATURE_POWER, FRENZY_PLANT
	mon 13, CLEFABLE
		moves MOONBLAST, WILLOWISP, REST, CALM_MIND
	mon 13, ANINETALES
		moves BLIZZARD, ICY_WIND, MOONBLAST, RECOVER
	mon 15, BLASTOISEX
		moves RAIN_DANCE, HYDRO_PUMP, BLIZZARD, REST
	end_party

	end_list_items

ElmGroup:
	next_list_item ; ELM (1)
	db "Elm@", TRAINERTYPE_MOVES
	mon 15, TAUROS
		moves DOUBLE_EDGE, FISSURE, BULK_UP, RECOVER
	mon 15, NIDOKING
		moves COSMIC_POWER, ANCIENTPOWER, SLUDGE_BOMB, FISSURE
	mon 15, WYRDEER
		moves BODY_SLAM, HYPNOSIS, REFLECT, PSYCHIC_M
	mon 15, VENUSAURX
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, EARTHQUAKE
	mon 15, CHARIZARDX
		moves DRAGON_CLAW, SACRED_FIRE, WILLOWISP, SKY_ATTACK
	mon 15, BLASTOISEX
		moves SCALD, RAIN_DANCE, HYDRO_PUMP, COSMIC_POWER
	end_party

	end_list_items

BirchGroup:
	next_list_item ; BIRCH (1)
	db "Birch@", TRAINERTYPE_MOVES
	mon 15, TAUROS
		moves DOUBLE_EDGE, FISSURE, BULK_UP, RECOVER
	mon 15, NIDOKING
		moves COSMIC_POWER, ANCIENTPOWER, SLUDGE_BOMB, FISSURE
	mon 15, WYRDEER
		moves BODY_SLAM, HYPNOSIS, REFLECT, PSYCHIC_M
	mon 15, VENUSAURX
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, EARTHQUAKE
	mon 15, CHARIZARDX
		moves DRAGON_CLAW, SACRED_FIRE, WILLOWISP, SKY_ATTACK
	mon 15, BLASTOISEX
		moves SCALD, RAIN_DANCE, HYDRO_PUMP, COSMIC_POWER
	end_party

	end_list_items

NurseGroup:
	next_list_item ; NURSE (1)
	db "Joy@", TRAINERTYPE_MOVES
	mon 15, TAUROS
		moves DOUBLE_EDGE, FISSURE, BULK_UP, RECOVER
	mon 15, NIDOKING
		moves COSMIC_POWER, ANCIENTPOWER, SLUDGE_BOMB, FISSURE
	mon 15, WYRDEER
		moves BODY_SLAM, HYPNOSIS, REFLECT, PSYCHIC_M
	mon 15, VENUSAURX
		moves SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, EARTHQUAKE
	mon 15, CHARIZARDX
		moves DRAGON_CLAW, SACRED_FIRE, WILLOWISP, SKY_ATTACK
	mon 15, BLASTOISEX
		moves SCALD, RAIN_DANCE, HYDRO_PUMP, COSMIC_POWER
	end_party

	end_list_items

ENDSECTION


SECTION "Random Party Lists", ROMX

INCLUDE "data/trainers/random_parties.asm"

ENDSECTION