; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    * for TRAINERTYPE_NORMAL:     db level, species
;    * for TRAINERTYPE_MOVES:      db level, species, 4 moves
;    * for TRAINERTYPE_ITEM:       db level, species, item
;    * for TRAINERTYPE_ITEM_MOVES: db level, species, item, 4 moves
; - db -1 ; end

SECTION "Hard Trainer Parties 1", ROMX

FalknerGroupHard:
	next_list_item ; FALKNER (1)
	db "Falkner@", TRAINERTYPE_MOVES
	db 6
	dw NATU
	dw TACKLE, CONFUSE_RAY, GUST, CONFUSION
	db 7
	dw PIDGEOTTO
	dw TACKLE, MUD_SLAP, GUST, LEER
	db 8
	dw NOCTOWL
	dw TACKLE, MUD_SLAP, GUST, CONFUSE_RAY
	db -1 ; end

	next_list_item ; FALKNER (2)
	db "Falkner@", TRAINERTYPE_MOVES
	db 10
	dw XATU
	dw PSYBEAM, CONFUSE_RAY, RAZOR_WIND, MUD_SLAP
	db 9
	dw GLIGAR
	dw MAGNITUDE, MUD_SLAP, SLASH, FAINT_ATTACK
	db 10
	dw FEAROW
	dw DRILL_PECK, MUD_SLAP, GUST, CONFUSION	
	db 12
	dw NOCTOWL
	dw HYPNOSIS, MUD_SLAP, DREAM_EATER, CONFUSE_RAY
	db -1 ; end

	next_list_item ; FALKNER (3)
	db "Falkner@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw SKARMORY
	dw LEFTOVERS
	dw DRILL_PECK, TOXIC, COSMIC_POWER, REST
	db 10
	dw XATU
	dw TWISTEDSPOON
	dw PSYCHIC_M, CONFUSE_RAY, RAZOR_WIND, MUD_SLAP
	db 10
	dw GLISCOR
	dw QUICK_CLAW
	dw FISSURE, MUD_SLAP, SLASH, PURSUIT
	db 10
	dw PELIPPER
	dw LEFTOVERS
	dw HYDRO_PUMP, PROTECT, HURRICANE, RECOVER
	db 10
	dw DELIBIRD
	dw NO_ITEM
	dw BLIZZARD, MUD_SLAP, SKY_ATTACK, CONFUSE_RAY
	db 12
	dw NOCTOWL2
	dw TWISTEDSPOON
	dw WILLOWISP, MUD_SLAP, PSYCHIC_M, MOONBLAST
	db -1 ; end

	next_list_item ; FALKNER (4) ;World Cup Falkner
	db "Falkner@", TRAINERTYPE_ITEM_MOVES
	db 11
	dw ARTICUNO
	dw NO_ITEM
	dw DRILL_PECK, HURRICANE, BLIZZARD, PSYBEAM
	db 11
	dw ZAPDOS
	dw NO_ITEM
	dw THUNDERBOLT, DRILL_PECK, RAZOR_WIND, JUMP_KICK
	db 11
	dw MOLTRES
	dw QUICK_CLAW
	dw SKY_ATTACK, MUD_SLAP, FIRE_BLAST, PURSUIT
	db 12
	dw PELIPPER
	dw LEFTOVERS
	dw HYDRO_PUMP, PROTECT, HURRICANE, RECOVER
	db 12
	dw DELIBIRD
	dw NO_ITEM
	dw BLIZZARD, MUD_SLAP, SKY_ATTACK, CONFUSE_RAY
	db 15
	dw NOCTOWL
	dw TWISTEDSPOON
	dw WILLOWISP, MUD_SLAP, PSYCHIC_M, SHADOW_BALL
	db -1 ; end

	end_list_items

WhitneyGroupHard:
	next_list_item ; WHITNEY (1)
	db "Whitney@", TRAINERTYPE_MOVES
	db 10
	dw CLEFAIRY
	dw POUND, MIMIC, ENCORE, METRONOME
	db 10
	dw JIGGLYPUFF
	dw POUND, SING, ENCORE, REST
	db 12
	dw MILTANK
	dw ROLLOUT, ATTRACT, STOMP, MILK_DRINK
	db -1 ; end
	
	next_list_item ; WHITNEY (2)
	db "Whitney@", TRAINERTYPE_MOVES	
	db 10
	dw WIGGLYTUFF
	dw WILLOWISP, COSMIC_POWER, DIZZY_PUNCH, REST
	db 10
	dw FURRET
	dw HYPER_FANG, BULK_UP, DIG, CRUNCH
	db 10
	dw RATICATE
	dw HYPER_FANG, SHARPEN, CRUNCH, QUICK_ATTACK
	db 12
	dw MILTANK
	dw ROLLOUT, BULK_UP, BODY_SLAM, MILK_DRINK
	db -1 ; end
	
	next_list_item ; WHITNEY (3)
	db "Whitney@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw FURRET2
	dw DRAGON_FANG
	dw DRAGON_CLAW, DRAGON_DANCE, BODY_SLAM, CRUNCH
	db 10
	dw CLEFABLE
	dw LEFTOVERS
	dw MOONBLAST, CALM_MIND, PSYCHIC_M, METEOR_MASH	
	db 10
	dw WIGGLYTUFF
	dw LEFTOVERS
	dw WILLOWISP, COSMIC_POWER, MOONBLAST, REST	
	db 10
	dw RATICATE
	dw PINK_BOW
	dw HYPER_FANG, SWORDS_DANCE, CRUNCH, EXTREMESPEED
	db 10
	dw TAUROS
	dw PINK_BOW
	dw BODY_SLAM, SUBMISSION, EARTHQUAKE, OUTRAGE
	db 12
	dw MILTANK
	dw LEFTOVERS
	dw ROLLOUT, COSMIC_POWER, BODY_SLAM, MILK_DRINK
	db -1 ; end

	end_list_items

BugsyGroupHard:
	next_list_item ; BUGSY (1)
	db "Bugsy@", TRAINERTYPE_MOVES
	db 10
	dw LEDYBA
	dw MACH_PUNCH, STRING_SHOT, ICE_PUNCH, LEECH_LIFE
	db 10
	dw PARAS
	dw STRING_SHOT, STUN_SPORE, POISONPOWDER, RAZOR_LEAF
	db 12
	dw SCYTHER
	dw QUICK_ATTACK, LEER, FURY_CUTTER, BITE
	db -1 ; end
	
	next_list_item ; BUGSY (2)
	db "Bugsy@", TRAINERTYPE_MOVES
	db 10
	dw MASQUERAIN
	dw SURF, CONFUSE_RAY, FURY_CUTTER, SIGNAL_BEAM
	db 10
	dw LEDIAN
	dw MACH_PUNCH, STRING_SHOT, ICE_PUNCH, LEECH_LIFE
	db 10
	dw PARASECT
	dw LEAF_BLADE, STUN_SPORE, SPORE, RAZOR_LEAF	
	db 12
	dw SCYTHER
	dw SLASH, SCARY_FACE, FURY_CUTTER, NO_MOVE
	db -1 ; end

	next_list_item ; BUGSY (3)
	db "Bugsy@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw MASQUERAIN
	dw QUICK_CLAW
	dw HYDRO_PUMP, CONFUSE_RAY, MEDITATE, SIGNAL_BEAM
	db 10
	dw LEDIAN
	dw NO_ITEM
	dw MACH_PUNCH, FIRE_PUNCH, ICE_PUNCH, DIZZY_PUNCH
	db 12
	dw ARMALDO
	dw QUICK_CLAW
	dw MEGAHORN, ROCK_TOMB, ROCK_SLIDE, SHADOW_CLAW
	db 10
	dw PARASECT
	dw QUICK_CLAW
	dw LEAF_BLADE, STUN_SPORE, SPORE, SLASH	
	db 10
	dw SCYTHER2
	dw NO_ITEM
	dw SLASH, SWORDS_DANCE, FURY_CUTTER, PSYCHO_CUT
	db 12
	dw SCIZOR2
	dw LEFTOVERS
	dw SLASH, VICEGRIP, SWORDS_DANCE, BULLET_PUNCH
	db -1 ; end

	end_list_items

MortyGroupHard:
	next_list_item ; MORTY (1)
	db "Morty@", TRAINERTYPE_MOVES
	db 10
	dw VULPIX
	dw LICK, HYPNOSIS, EMBER, WILLOWISP
	db 10
	dw HAUNTER
	dw LICK, SPITE, MEAN_LOOK, CURSE
	db 10
	dw MAROWAK
	dw BONEMERANG, HEADBUTT, LICK, FOCUS_ENERGY	
	db 12
	dw MISDREAVUS
	dw LICK, WILLOWISP, CONFUSE_RAY, NIGHT_SHADE
	db -1 ; end
	
	next_list_item ; MORTY (2)
	db "Morty@", TRAINERTYPE_MOVES
	db 10
	dw NINETALES
	dw SHADOW_BALL, HYPNOSIS, FLAMETHROWER, WILLOWISP
	db 10
	dw HAUNTER
	dw LICK, THUNDERBOLT, SMOG, SHADOW_BALL
	db 10
	dw MAROWAK
	dw BONEMERANG, HEADBUTT, SHADOW_BALL, BONE_CLUB	
	db 10
	dw AMAROWAK
	dw BONEMERANG, HEADBUTT, SHADOW_BALL, BONE_CLUB	
	db 12
	dw MISDREAVUS
	dw SHADOW_BALL, WILLOWISP, CONFUSE_RAY, NIGHT_SHADE
	db -1 ; end
	
	next_list_item ; MORTY (3)
	db "Morty@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw PARASECT
	dw QUICK_CLAW
	dw DESTINY_BOND, SHADOW_CLAW, GIGA_DRAIN, SPORE
	db 10
	dw NINETALES
	dw LEFTOVERS
	dw SHADOW_BALL, LUSTER_PURGE, FIRE_BLAST, WILLOWISP	
	db 10
	dw MAROWAK
	dw THICK_CLUB
	dw EARTHQUAKE, HEADBUTT, SHADOW_CLAW, MUD_SHOT
	db 10
	dw WYRDEER
	dw TWISTEDSPOON
	dw HYPNOSIS, BODY_SLAM, SHADOW_BALL, DREAM_EATER	
	db 10
	dw MISMAGIUS
	dw SPELL_TAG
	dw SHADOW_BALL, WILLOWISP, CONFUSE_RAY, CALM_MIND
	db 12
	dw GENGARX
	dw SPELL_TAG
	dw PSYCHIC_M, THUNDERBOLT, SLUDGE_BOMB, SHADOW_BALL
	db -1 ; end

	end_list_items

PryceGroupHard:
	next_list_item ; PRYCE (1)
	db "Pryce@", TRAINERTYPE_MOVES
	db 12
	dw DELIBIRD
	dw ICY_WIND, GUST, AURORA_BEAM, SPIKES
	db 10
	dw JYNX
	dw PERISH_SONG, PSYBEAM, ICE_PUNCH, ICY_WIND
	db 12
	dw SNEASEL
	dw ICE_PUNCH, SLASH, AURORA_BEAM, PURSUIT
	db -1 ; end
	
	next_list_item ; PRYCE (2)
	db "Pryce@", TRAINERTYPE_MOVES
	db 12
	dw DELIBIRD
	dw BLIZZARD, RAZOR_WIND, ICY_WIND, SPIKES
	db 10
	dw JYNX
	dw PERISH_SONG, PSYBEAM, ICE_PUNCH, ICY_WIND
	db 10
	dw WEAVILE
	dw ICE_PUNCH, SLASH, MACH_PUNCH, PURSUIT
	db 12
	dw MAMOSWINE
	dw EARTHQUAKE, BLIZZARD, BULK_UP, BODY_SLAM
	db -1 ; end
	
	next_list_item ; PRYCE (3)
	db "Pryce@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw DELIBIRD
	dw FOCUS_BAND
	dw BLIZZARD, RAZOR_WIND, ICY_WIND, SPIKES
	db 10
	dw WALREIN
	dw LEFTOVERS
	dw SURF, HAIL, BLIZZARD, REST	
	db 10
	dw JYNX
	dw FOCUS_BAND
	dw HAIL, PSYCHIC_M, BLIZZARD, LOVELY_KISS
	db 10
	dw WEAVILE
	dw FOCUS_BAND
	dw ICICLE_CRASH, SLASH, MACH_PUNCH, PURSUIT
	db 12
	dw MAMOSWINE
	dw QUICK_CLAW
	dw EARTHQUAKE, ICICLE_CRASH, BULK_UP, BODY_SLAM
	db 12
	dw GLALIEX
	dw NEVERMELTICE
	dw ICICLE_CRASH, CRUNCH, REST, COSMIC_POWER
	db -1 ; end

	end_list_items

JasmineGroupHard:
	next_list_item ; JASMINE (1)
	db "Jasmine@", TRAINERTYPE_MOVES
	db 10
	dw MAGNEMITE
	dw METAL_CLAW, SUPERSONIC, THUNDER_WAVE, THUNDERSHOCK
	db 10
	dw KRABBY
	dw BUBBLEBEAM, CUT, CRABHAMMER, HARDEN
	db 12
	dw SKARMORY
	dw SLASH, STEEL_WING, AGILITY, WING_ATTACK
	db -1 ; end
	
	next_list_item ; JASMINE (2)
	db "Jasmine@", TRAINERTYPE_MOVES
	db 12
	dw MAWILE
	dw SANDSTORM, VICEGRIP, CRUNCH, DIZZY_PUNCH
	db 10
	dw MAGNETON
	dw TRI_ATTACK, SWIFT, THUNDER_WAVE, SHOCK_WAVE
	db 10
	dw KINGLER
	dw CRUSH_CLAW, VICEGRIP, CRABHAMMER, PROTECT
	db 12
	dw SKARMORY
	dw SLASH, STEEL_WING, AGILITY, WING_ATTACK
	db -1 ; end
	
	next_list_item ; JASMINE (3)
	db "Jasmine@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw SKARMORY
	dw QUICK_CLAW
	dw SLASH, VICEGRIP, SANDSTORM, SKY_ATTACK	
	db 12
	dw MAWILE
	dw QUICK_CLAW
	dw SANDSTORM, VICEGRIP, CRUNCH, DIZZY_PUNCH
	db 10
	dw MAGNEZONE
	dw MAGNET
	dw TRI_ATTACK, CHARGE, FLASHCANNON, ZAP_CANNON
	db 10
	dw KINGLER
	dw METAL_COAT
	dw CRUSH_CLAW, VICEGRIP, CRABHAMMER, PROTECT	
	db 12
	dw AGGRON
	dw MIRACLEBERRY
	dw GUILLOTINE, EARTHQUAKE, BULK_UP, SANDSTORM
	db 13
	dw STEELIXX
	dw LEFTOVERS
	dw IRON_TAIL, FISSURE, COSMIC_POWER, SANDSTORM
	db -1 ; end

	end_list_items

ChuckGroupHard:
	next_list_item ; CHUCK (1)
	db "Chuck@", TRAINERTYPE_MOVES
	db 12
	dw HITMONCHAN
	dw MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	db 12
	dw HITMONLEE
	dw MEGA_KICK, JUMP_KICK, FAINT_ATTACK, HI_JUMP_KICK
	db 12
	dw HITMONTOP
	dw ROLLING_KICK, SLAM, MACH_PUNCH, FAINT_ATTACK
	db -1 ; end
	
	next_list_item ; CHUCK (2)
	db "Chuck@", TRAINERTYPE_MOVES
	db 12
	dw HITMONCHAN
	dw MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	db 12
	dw HITMONLEE
	dw MEGA_KICK, JUMP_KICK, FAINT_ATTACK, HI_JUMP_KICK
	db 12
	dw HITMONTOP
	dw ROLLING_KICK, SLAM, MACH_PUNCH, FAINT_ATTACK
	db 12
	dw BRELOOM
	dw LEAF_BLADE, SPORE, MACH_PUNCH, CROSS_CHOP
	db -1 ; end
	
	next_list_item ; CHUCK (3)
	db "Chuck@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw HITMONCHAN
	dw BLACKBELT_I
	dw MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	db 10
	dw HITMONLEE
	dw BLACKBELT_I
	dw BLAZE_KICK, EXTREMESPEED, PURSUIT, HI_JUMP_KICK	
	db 10
	dw BRELOOM
	dw QUICK_CLAW
	dw LEAF_BLADE, SPORE, MACH_PUNCH, SWORDS_DANCE
	db 10
	dw MEDICHAM
	dw BLACKBELT_I
	dw BULLET_PUNCH, ZEN_HEADBUTT, BULK_UP, SHADOW_PUNCH
	db 12
	dw POLIWRATH
	dw BLACKBELT_I
	dw SURF, DYNAMICPUNCH, MACH_PUNCH, HYPNOSIS
	db 12
	dw KINGLERX
	dw QUICK_CLAW
	dw AQUA_JET, CURSE, CRABHAMMER, GUILLOTINE
	db -1 ; end

	end_list_items

ClairGroupHard:
	next_list_item ; CLAIR (1)
	db "Clair@", TRAINERTYPE_MOVES
	db 12
	dw GYARADOS
	dw DRAGONBREATH, WATERFALL, WHIRLPOOL, RAIN_DANCE
	db 10
	dw DRAGONAIR
	dw THUNDER_WAVE, SURF, SLAM, DRAGONBREATH	
	db 10
	dw LAPRAS
	dw BLIZZARD, SURF, THUNDER, RAIN_DANCE
	db -1 ; end
	
	next_list_item ; CLAIR (1)
	db "Clair@", TRAINERTYPE_MOVES
	db 12
	dw GYARADOS
	dw DRAGONBREATH, WATERFALL, WHIRLPOOL, RAIN_DANCE
	db 10
	dw FLYGON
	dw EARTHQUAKE, SURF, MUD_SHOT, DRAGONBREATH
	db 10
	dw LAPRAS
	dw BLIZZARD, SURF, THUNDER, RAIN_DANCE
	db 12
	dw KINGDRA
	dw AGILITY, HYDRO_PUMP, THUNDER, OUTRAGE
	db -1 ; end
	
	next_list_item ; CLAIR (3)
	db "Clair@", TRAINERTYPE_ITEM_MOVES	
	db 15
	dw DRAGONITEY
	dw LEFTOVERS
	dw DRAGONBREATH, SCALD, CALM_MIND, REST
	db -1 ; end

	end_list_items

Rival1GroupHard:
	next_list_item ; RIVAL1 (1)
	db "?@", TRAINERTYPE_NORMAL
	db 2
	dw TEDDIURSA
	db -1 ; end

	next_list_item ; RIVAL1 (2)
	db "?@", TRAINERTYPE_NORMAL
	db 8
	dw MAREEP
	db 8
	dw NATU
	db 8
	dw REMORAID
	db 11
	dw BAYLEEF
	db -1 ; end

	next_list_item ; RIVAL1 (3)
	db "?@", TRAINERTYPE_NORMAL
	db 6
	dw PINECO
	db 8
	dw FLAAFFY
	db 8
	dw XATU
	db 9
	dw REMORAID
	db 11
	dw URSARING
	db -1 ; end

	next_list_item ; RIVAL1 (4)
	db "?@", TRAINERTYPE_NORMAL
	db 7
	dw FORRETRESS
	db 8
	dw SNEASEL
	db 8
	dw AMPHAROS
	db 9
	dw XATU
	db 10
	dw OCTILLERY
	db 13
	dw URSARING
	db -1 ; end

	next_list_item ; RIVAL1 (5)
	db "?@", TRAINERTYPE_NORMAL
	db 12
	dw FORRETRESS
	db 12
	dw WEAVILE
	db 12
	dw AMPHAROS
	db 12
	dw XATU
	db 12
	dw OCTILLERY
	db 15
	dw URSALUNA
	db -1 ; end

	end_list_items

PokemonProfGroupHard:

	next_list_item ; OAK (1)
	db "Oak@", TRAINERTYPE_ITEM_MOVES
	db 15
	dw TAUROS
	dw QUICK_CLAW
	dw DOUBLE_EDGE, FISSURE, BULK_UP, RECOVER
	db 15
	dw NIDOKING
	dw FOCUS_BAND
	dw COSMIC_POWER, ANCIENTPOWER, SLUDGE_BOMB, FISSURE
	db 15
	dw WYRDEER
	dw KINGS_ROCK
	dw BODY_SLAM, HYPNOSIS, REFLECT, PSYCHIC_M
	db 16
	dw VENUSAURX
	dw MIRACLEBERRY
	dw SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, EARTHQUAKE
	db 16
	dw CHARIZARDX
	dw DRAGON_FANG
	dw DRAGON_CLAW, SACRED_FIRE, WILLOWISP, SKY_ATTACK
	db 16
	dw BLASTOISEX
	dw LEFTOVERS
	dw SCALD, RAIN_DANCE, HYDRO_PUMP, COSMIC_POWER
	db -1 ; end

	end_list_items

WillGroupHard:
	next_list_item ; WILL (1)
	db "Will@", TRAINERTYPE_MOVES
	db 12
	dw GARDEVOIR
	dw PSYCHIC_M, SWIFT, CALM_MIND, HYPNOSIS
	db 12
	dw LUNATONE
	dw COSMIC_POWER, ANCIENTPOWER, FUTURE_SIGHT, PSYCHIC_M
	db 12
	dw EXEGGUTOR
	dw STUN_SPORE, LEECH_SEED, EGG_BOMB, PSYCHIC_M
	db 12
	dw GIRAFARIG
	dw PURSUIT, CALM_MIND, BODY_SLAM, PSYCHIC_M
	db 12
	dw SLOWKING
	dw SURF, CALM_MIND, FLAMETHROWER, PSYCHIC_M
	db 12
	dw ESPEON
	dw BODY_SLAM, REFLECT, SHADOW_BALL, PSYCHIC_M
	db -1 ; end
	
	next_list_item ; WILL (2)
	db "Will@", TRAINERTYPE_ITEM_MOVES
	db 13
	dw GARDEVOIR
	dw QUICK_CLAW
	dw DREAM_EATER, MOONBLAST, CALM_MIND, HYPNOSIS
	db 13
	dw CLAYDOL
	dw LEFTOVERS
	dw COSMIC_POWER, ANCIENTPOWER, REST, PSYCHIC_M
	db 13
	dw ESPEON
	dw TWISTEDSPOON
	dw BODY_SLAM, REFLECT, SHADOW_BALL, PSYCHIC_M
	db 13
	dw WYRDEER
	dw MIRACLEBERRY
	dw PURSUIT, EARTHQUAKE, HYPNOSIS, DREAM_EATER	
	db 15
	dw XATU
	dw MIRACLEBERRY
	dw SKY_ATTACK, HYPNOSIS, SHADOW_BALL, PSYCHIC_M
	db 15
	dw SLOWBROX
	dw LEFTOVERS
	dw SCALD, COSMIC_POWER, REST, PSYCHIC_M
	db -1 ; end

	end_list_items

PKMNTrainerGroupHard:
	next_list_item ; CAL (1)
	db "Cal@", TRAINERTYPE_NORMAL
	db 10
	dw CHIKORITA
	db 10
	dw CYNDAQUIL
	db 10
	dw TOTODILE
	db -1 ; end

	next_list_item ; CAL (2)
	db "Cal@", TRAINERTYPE_NORMAL
	db 10
	dw BAYLEEF
	db 10
	dw QUILAVA
	db 10
	dw CROCONAW
	db -1 ; end

	next_list_item ; CAL (3)
	db "Cal@", TRAINERTYPE_NORMAL
	db 10
	dw MEGANIUM
	db 10
	dw TYPHLOSION
	db 10
	dw FERALIGATR
	db -1 ; end

	end_list_items

BrunoGroupHard:
	next_list_item ; BRUNO (1)
	db "Bruno@", TRAINERTYPE_MOVES
	db 12
	dw HITMONTOP
	dw PURSUIT, TRIPLE_KICK, DIG, DETECT
	db 12
	dw HITMONLEE
	dw SWAGGER, MEGA_KICK, HI_JUMP_KICK, FORESIGHT
	db 12
	dw HITMONCHAN
	dw THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, DYNAMICPUNCH
	db 12
	dw STEELIX
	dw IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	db 12
	dw MACHAMP
	dw ROCK_SLIDE, MACH_PUNCH, FISSURE, CROSS_CHOP
	db 12
	dw ANNIHILAPE
	dw MEGAHORN, CROSS_CHOP, SHADOW_PUNCH, EARTHQUAKE
	db -1 ; end
	
	next_list_item ; BRUNO (2)
	db "Bruno@", TRAINERTYPE_ITEM_MOVES
	db 13
	dw BLAZIKEN
	dw BLACKBELT_I
	dw DRILL_PECK, BLAZE_KICK, HI_JUMP_KICK, DETECT	
	db 13
	dw HITMONCHAN
	dw QUICK_CLAW
	dw THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, DYNAMICPUNCH
	db 13
	dw STEELIX
	dw LEFTOVERS
	dw IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	db 13
	dw MACHAMP
	dw QUICK_CLAW
	dw ROCK_SLIDE, MACH_PUNCH, FISSURE, CROSS_CHOP
	db 15
	dw ANNIHILAPE
	dw QUICK_CLAW
	dw MEGAHORN, CROSS_CHOP, SHADOW_PUNCH, EARTHQUAKE
	db 13
	dw HERACROSSX
	dw QUICK_CLAW
	dw MEGAHORN, MACH_PUNCH, HI_JUMP_KICK, PURSUIT
	db -1 ; end

	end_list_items

KarenGroupHard:
	next_list_item ; KAREN (1)
	db "Karen@", TRAINERTYPE_MOVES
	db 12
	dw UMBREON
	dw CONFUSE_RAY, TOXIC, SNARL, REST
	db 12
	dw HOUNDOOM
	dw ROAR, SNARL, FLAMETHROWER, MUD_SLAP
	db 12
	dw VILEPLUME
	dw STUN_SPORE, SLUDGE_BOMB, SWIFT, PETAL_DANCE
	db 12
	dw DUSCLOPS
	dw SHADOW_BALL, HYPNOSIS, DREAM_EATER, ICY_WIND
	db 12
	dw ABSOL
	dw EXTREMESPEED, DRILL_PECK, PURSUIT, SKY_ATTACK
	db 12
	dw TYRANITAR
	dw CRUNCH, ROCK_SLIDE, EARTHQUAKE, OUTRAGE
	db -1 ; end
	
	next_list_item ; KAREN (2)
	db "Karen@", TRAINERTYPE_ITEM_MOVES
	db 13
	dw UMBREON
	dw LEFTOVERS
	dw CONFUSE_RAY, TOXIC, SNARL, REST
	db 13
	dw UNOWN
	dw LEFTOVERS
	dw GLARE, COSMIC_POWER, PURSUIT, DESTINY_BOND
	db 13
	dw DUSKNOIR
	dw LEFTOVERS
	dw SHADOW_FORCE, HYPNOSIS, DREAM_EATER, ICY_WIND
	db 13
	dw GENGAR
	dw POISON_BARB
	dw SHADOW_BALL, HYPNOSIS, DREAM_EATER, SLUDGE_WAVE
	db 13
	dw HONCHKROW
	dw SHARP_BEAK
	dw EXTREMESPEED, DRILL_PECK, PURSUIT, SKY_ATTACK
	db 15
	dw TYRANITARX
	dw FOCUS_BAND
	dw CRUNCH, STONE_EDGE, EARTHQUAKE, OUTRAGE
	db -1 ; end

	end_list_items

KogaGroupHard:
	next_list_item ; KOGA (1)
	db "Koga@", TRAINERTYPE_MOVES
	db 12
	dw FORRETRESS
	dw PROTECT, SWIFT, EXPLOSION, SPIKES
	db 12
	dw WEEZING
	dw FIRE_BLAST, SLUDGE_BOMB, EXPLOSION, TOXIC
	db 12
	dw BEEDRILL
	dw TWINEEDLE, SLUDGE_BOMB, TOXIC, EXTREMESPEED
	db 12
	dw VENOMOTH
	dw PSYCHIC_M, DOUBLE_TEAM, SHADOW_BALL, TOXIC
	db 12
	dw AMUK
	dw MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	db 12
	dw CROBAT
	dw EXTREMESPEED, SWIFT, SKY_ATTACK, SLUDGE_BOMB
	db -1 ; end
	
	next_list_item ; KOGA (2)
	db "Koga@", TRAINERTYPE_ITEM_MOVES
	db 13
	dw TENTACRUEL
	dw LEFTOVERS
	dw COSMIC_POWER, SURF, ICY_WIND, POWER_GEM
	db 13
	dw WEEZING
	dw FOCUS_BAND
	dw FIRE_BLAST, SLUDGE_BOMB, EXPLOSION, WILLOWISP	
	db 13
	dw VENOMOTH
	dw SPELL_TAG
	dw PSYCHIC_M, DOUBLE_TEAM, SHADOW_BALL, CONFUSE_RAY
	db 13
	dw AMUK
	dw LEFTOVERS
	dw MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	db 13
	dw CROBAT
	dw POISON_BARB
	dw EXTREMESPEED, CONFUSE_RAY, SKY_ATTACK, SLUDGE_BOMB
	db 15
	dw SWALOTX
	dw LEFTOVERS
	dw COSMIC_POWER, TOXIC, GIGA_DRAIN, REST
	db -1 ; end

	end_list_items

ChampionGroupHard:
	next_list_item ; CHAMPION (1)
	db "Lance@", TRAINERTYPE_MOVES
	db 13
	dw GYARADOS
	dw THUNDER, RAIN_DANCE, HYDRO_PUMP, HYPER_BEAM
	db 13
	dw LAPRAS
	dw BLIZZARD, RAIN_DANCE, THUNDER, HYDRO_PUMP
	db 13
	dw REGISTEEL
	dw REST, CURSE, EARTHQUAKE, METEOR_MASH
	db 13
	dw AERODACTYL
	dw SKY_ATTACK, ANCIENTPOWER, STRENGTH, HYPER_BEAM
	db 13
	dw SALAMENCE
	dw FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, DRAGON_CLAW
	db 15
	dw DRAGONITE
	dw FIRE_BLAST, THUNDER, OUTRAGE, HYPER_BEAM
	db -1 ; end
	
	next_list_item ; CHAMPION (2)
	db "Lance@", TRAINERTYPE_ITEM_MOVES
	db 15
	dw GYARADOS
	dw MYSTIC_WATER
	dw FIRE_FANG, OUTRAGE, WATERFALL, AQUA_JET
	db 15
	dw TOGEKISS
	dw MINT_BERRY
	dw REST, MOONBLAST, MIST_BALL, OUTRAGE	
	db 15
	dw DRAGONITE
	dw MINT_BERRY
	dw WATERFALL, THUNDER, OUTRAGE, HYPER_BEAM
	db 15
	dw CHARIZARD
	dw CHARCOAL
	dw FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, HYPER_BEAM
	db 15
	dw FLYGON
	dw FOCUS_BAND
	dw DRAGON_CLAW, DRAGON_DANCE, EXTREMESPEED, EARTHQUAKE
	db -1 ; end
	db 17
	dw REGISTEEL
	dw MINT_BERRY
	dw REST, CURSE, EARTHQUAKE, METEOR_MASH

	next_list_item ; CHAMPION (3)
	db "Lance@", TRAINERTYPE_MOVES
	db 20
	dw DRAGONITEX
	dw WATERFALL, EXTREMESPEED, OUTRAGE, HYPER_BEAM
	db -1 ; end

	end_list_items

BrockGroupHard:
	next_list_item ; BROCK (1)
	db "Brock@", TRAINERTYPE_MOVES
	db 4
	dw GEODUDE
	dw ROCK_THROW, HARDEN, BIDE, SAND_ATTACK
	db 5
	dw OMANYTE
	dw BITE, BUBBLE, TACKLE, NO_MOVE
	db 6
	dw ONIX
	dw BIDE, SCREECH, WRAP, ROCK_THROW
	db -1 ; end
	
	next_list_item ; BROCK (2)
	db "Brock@", TRAINERTYPE_MOVES
	db 12
	dw RHYDON
	dw ROCK_TOMB, OUTRAGE, EARTHQUAKE, SANDSTORM
	db 10
	dw NOSEPASS
	dw ROCK_TOMB, COSMIC_POWER, THUNDERBOLT, SANDSTORM
	db 10
	dw KABUTOPS
	dw SLASH, ROCK_TOMB, ICE_PUNCH, SANDSTORM
	db 10
	dw OMASTAR
	dw CRUNCH, SURF, PROTECT, SPIKE_CANNON
	db 12
	dw REGIROCK
	dw ROCK_SLIDE, EARTHQUAKE, RECOVER, ROCK_TOMB
	db -1 ; end
	
	next_list_item ; BROCK (3)
	db "Brock@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw RHYPERIOR
	dw LEFTOVERS
	dw ROCK_TOMB, STONE_EDGE, DRAGON_CLAW, SANDSTORM
	db 10
	dw LUNATONE
	dw FOCUS_BAND
	dw ROCK_TOMB, COSMIC_POWER, PSYCHIC_M, SANDSTORM
	db 10
	dw SOLROCK
	dw FOCUS_BAND
	dw ROCK_TOMB, COSMIC_POWER, FLAMETHROWER, SANDSTORM
	db 10
	dw KLEAVOR
	dw KINGS_ROCK
	dw SLASH, ROCK_TOMB, STONE_EDGE, SANDSTORM
	db 10
	dw AGOLEM
	dw MAGNET
	dw THUNDERBOLT, STONE_EDGE, PROTECT, EARTHQUAKE
	db 12
	dw AERODACTYLX
	dw KINGS_ROCK
	dw DRILL_PECK, DRAGON_CLAW, CRUNCH, STONE_EDGE

	end_list_items

MistyGroupHard:
	next_list_item ; MISTY (1)
	db "Misty@", TRAINERTYPE_MOVES
	db 7
	dw CHINCHOU
	dw BUBBLEBEAM, THUNDERSHOCK, RAIN_DANCE, WHIRLPOOL
	db 8
	dw SQUIRTLE
	dw BUBBLEBEAM, METAL_CLAW, CLAMP, RAIN_DANCE
	db 9
	dw PSYDUCK
	dw BUBBLEBEAM, DISABLE, SCRATCH, CONFUSION
	db 11
	dw STARYU
	dw BUBBLEBEAM, CONFUSION, RECOVER, POWDER_SNOW
	db -1 ; end
	
	next_list_item ; MISTY (2)
	db "Misty@", TRAINERTYPE_MOVES
	db 10
	dw PELIPPER
	dw SURF, THUNDER, RAIN_DANCE, WHIRLPOOL
	db 10
	dw SEAKING
	dw SURF, DRILL_PECK, RAIN_DANCE, WATERFALL
	db 10
	dw MASQUERAIN
	dw SURF, TWINEEDLE, SIGNAL_BEAM, RAIN_DANCE
	db 10
	dw GOLDUCK
	dw SURF, SLASH, CALM_MIND, PSYBEAM
	db 12
	dw STARMIE
	dw SURF, PSYCHIC_M, RECOVER, CALM_MIND
	db -1 ; end
	
	next_list_item ; MISTY (3)
	db "Misty@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw LUVDISC
	dw KINGS_ROCK
	dw WATER_SPOUT, AQUA_JET, RAIN_DANCE, SCALD
	db 10
	dw SEAKING
	dw KINGS_ROCK
	dw AQUA_JET, DRILL_PECK, RAIN_DANCE, WATERFALL	
	db 10
	dw GOLDUCK
	dw MIRACLEBERRY
	dw HYDRO_PUMP, THUNDER, MEDITATE, PSYCHIC_M
	db 10
	dw MILOTIC
	dw LEFTOVERS
	dw HYDRO_PUMP, BLIZZARD, CALM_MIND, REST
	db 11
	dw STARMIE
	dw KINGS_ROCK
	dw SURF, PSYCHIC_M, RECOVER, CALM_MIND
	db 12
	dw TOTARTLE
	dw LEFTOVERS
	dw SCALD, HYDRO_PUMP, THUNDER, CRUNCH
	db -1 ; end

	end_list_items

LtSurgeGroupHard:
	next_list_item ; LT_SURGE (1)
	db "Lt.Surge@", TRAINERTYPE_MOVES
	db 7
	dw CHINCHOU
	dw WATER_GUN, THUNDERSHOCK, POWDER_SNOW, THUNDER_WAVE
	db 8
	dw PIKACHU
	dw DIG, QUICK_ATTACK, THUNDERSHOCK, PIXIE_DUST	
	db 9
	dw MAGNEMITE
	dw THUNDERSHOCK, METAL_CLAW, SUPERSONIC, THUNDER_WAVE	
	db 11
	dw ELECTABUZZ
	dw REFLECT, THUNDERPUNCH, DIZZY_PUNCH, NO_MOVE
	db -1 ; end
	
	next_list_item ; LT_SURGE (2)
	db "Lt.Surge@", TRAINERTYPE_MOVES
	db 10
	dw LANTURN
	dw WATER_PULSE, THUNDERBOLT, ICE_BEAM, THUNDER_WAVE
	db 9
	dw ARAICHU
	dw DIG, SURF, VOLT_TACKLE, SWIFT	
	db 9
	dw MANECTRIC
	dw VOLT_TACKLE, METAL_CLAW, PURSUIT, THUNDER_WAVE	
	db 9
	dw JOLTEON
	dw THUNDERBOLT, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	db 12
	dw ELECTIVIRE
	dw REFLECT, THUNDERPUNCH, DIZZY_PUNCH, MACH_PUNCH
	db -1 ; end
	
	next_list_item ; LT_SURGE (3)
	db "Lt.Surge@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw LANTURN
	dw LEFTOVERS
	dw SURF, THUNDER, ICE_BEAM, THUNDER_WAVE	
	db 10
	dw MANECTRIC
	dw QUICK_CLAW
	dw THUNDER, CRUNCH, PURSUIT, THUNDER_WAVE
	db 10
	dw JOLTEON
	dw MAGNET
	dw ZAP_CANNON, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	db 12
	dw ELECTIVIRE
	dw MAGNET
	dw ZAP_CANNON, THUNDERPUNCH, DIZZY_PUNCH, THUNDERBOLT
	db 12
	dw RAICHU
	dw KINGS_ROCK
	dw OUTRAGE, BEAT_UP, VOLT_TACKLE, SURF	
	db 12
	dw ZAPDOS
	dw KINGS_ROCK
	dw DRILL_PECK, FLASHCANNON, VOLT_TACKLE, THUNDERBOLT	
	db -1 ; end

	end_list_items

ScientistGroupHard:
	next_list_item ; SCIENTIST (1) Team Rocket Hideout - B3F
	db "Ross@", TRAINERTYPE_NORMAL
	db 8
	dw WEEZING
	db 8
	dw ARBOK
	db -1 ; end

	next_list_item ; SCIENTIST (2) Team Rocket Hideout - B3F
	db "Mitch@", TRAINERTYPE_NORMAL
	db 15
	dw DITTO
	db -1 ; end

	next_list_item ; SCIENTIST (3) Team Rocket Hideout - B1F
	db "Jed@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNETON
	db 7
	dw ELECTRODE
	db 7
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; SCIENTIST (4) Goldenrod City - Radio Tower
	db "Marc@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNETON
	db 7
	dw PORYGON2
	db 7
	dw MINUN
	db -1 ; end

	next_list_item ; SCIENTIST (5) Goldenrod City - Radio Tower
	db "Rich@", TRAINERTYPE_MOVES
	db 11
	dw PORYGON2
	dw CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db -1 ; end

	next_list_item ; SCIENTIST (6) New Mauville Basement Scientist 1
	db "Adam@", TRAINERTYPE_NORMAL
	db 6
	dw PORYGON2
	db 7
	dw AMUK
	db -1 ; end

	next_list_item ; SCIENTIST (7) New Mauville Basement Scientist 2
	db "James@", TRAINERTYPE_NORMAL
	db 6
	dw MUK
	db 7
	dw JOLTEON
	db -1 ; end

	next_list_item ; SCIENTIST (8) New Mauville Basement Scientist 3
	db "Jeffrey@", TRAINERTYPE_NORMAL
	db 6
	dw KIRLIA
	db 7
	dw HYPNO
	db -1 ; end

	next_list_item ; SCIENTIST (9) New Mauville Basement Scientist 4
	db "Bruce@", TRAINERTYPE_NORMAL
	db 6
	dw KADABRA
	db 7
	dw MAGNETON
	db -1 ; end

	end_list_items

ErikaGroupHard:
	next_list_item ; ERIKA (1)
	db "Erika@", TRAINERTYPE_MOVES
	db 8
	dw TANGELA
	dw STUN_SPORE, REFLECT, ABSORB, SLEEP_POWDER
	db 8
	dw SKIPLOOM
	dw ABSORB, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	db 10
	dw WEEPINBELL
	dw SUNNY_DAY, STUN_SPORE, ACID, RAZOR_LEAF
	db -1 ; end
	
	next_list_item ; ERIKA (2)
	db "Erika@", TRAINERTYPE_MOVES
	db 10
	dw SUNFLORA
	dw FIRE_BLAST, STUN_SPORE, SOLARBEAM, SUNNY_DAY
	db 10
	dw JUMPLUFF
	dw SOLARBEAM, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	db 10
	dw VICTREEBEL
	dw SUNNY_DAY, SOLARBEAM, SLUDGE_BOMB, RAZOR_LEAF
	db 10
	dw LUDICOLO
	dw SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, SURF
	db 12
	dw BELLOSSOM
	dw SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SOLARBEAM
	db -1 ; end
	
	next_list_item ; ERIKA (3)
	db "Erika@", TRAINERTYPE_MOVES
	db 12
	dw ROSELIA
	dw STUN_SPORE, REFLECT, MEGA_DRAIN, SLEEP_POWDER
	db 12
	dw JUMPLUFF
	dw MEGA_DRAIN, LEECH_SEED, STUN_SPORE, GIGA_DRAIN
	db 12
	dw VICTREEBEL
	dw SUNNY_DAY, SOLARBEAM, SLUDGE_BOMB, RAZOR_LEAF
	db 12
	dw LUDICOLO
	dw SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, SURF
	db 12
	dw VILEPLUME
	dw STUN_SPORE, SYNTHESIS, PETAL_DANCE, PURSUIT
	db 15
	dw BELLOSSOM
	dw STUN_SPORE, SYNTHESIS, PETAL_DANCE, FAERIEGLEAM
	db -1 ; end

	end_list_items

SECTION "Hard Trainer Parties 1.5", ROMX

YoungsterGroupHard:
	next_list_item ; YOUNGSTER (1) Route 30 
	db "Joey@", TRAINERTYPE_NORMAL
	db 2
	dw RATTATA
	db -1 ; end

	next_list_item ; YOUNGSTER (2) Route 30
	db "Mikey@", TRAINERTYPE_NORMAL
	db 2
	dw PIDGEY
	db 3
	dw RATTATA
	db -1 ; end

	next_list_item ; YOUNGSTER (3) Route 32
	db "Albert@", TRAINERTYPE_NORMAL
	db 5
	dw RATTATA
	db 5
	dw ZUBAT
	db -1 ; end

	next_list_item ; YOUNGSTER (4) Route 32
	db "Gordon@", TRAINERTYPE_NORMAL
	db 7
	dw WOOPER
	db 7
	dw MUDKIP
	db -1 ; end

	next_list_item ; YOUNGSTER (5) Route 34
	db "Samuel@", TRAINERTYPE_NORMAL
	db 5
	dw RATTATA
	db 5
	dw SANDSHREW
	db 5
	dw TAILLOW
	db 7
	dw BRELOOM
	db -1 ; end

	next_list_item ; YOUNGSTER (6) Route 34
	db "Ian@", TRAINERTYPE_NORMAL
	db 5
	dw MANKEY
	db 5
	dw SWINUB
	db 7
	dw DUGTRIO
	db -1 ; end

	next_list_item ; YOUNGSTER (9) Route 03
	db "Warren@", TRAINERTYPE_NORMAL
	db 3
	dw SPEAROW
	db 3
	dw GULPIN
	db -1 ; end

	next_list_item ; YOUNGSTER (10) Route 03
	db "Jimmy@", TRAINERTYPE_NORMAL
	db 3
	dw RATTATA
	db 4
	dw EKANS
	db -1 ; end

	next_list_item ; YOUNGSTER (11) Route 11
	db "Owen@", TRAINERTYPE_NORMAL
	db 5
	dw GROWLITHE
	db 5
	dw PONYTA
	db -1 ; end

	next_list_item ; YOUNGSTER (12) Route 11
	db "Jason@", TRAINERTYPE_NORMAL
	db 3
	dw SANDSLASH
	db 4
	dw CROBAT
	db -1 ; end

	next_list_item ; YOUNGSTER (15) Ilex West (Contest placeholder team)
	db "Ronald@", TRAINERTYPE_NORMAL
	db 10
	dw GIRAFARIG
	db 8
	dw BALTOY
	db 8
	dw POLIWHIRL
	db 5
	dw FEEBAS
	db 8
	dw SKIPLOOM
	db 12
	dw ANINETALES
	db -1 ; end

	next_list_item ; YOUNGSTER (16) Johto Games (Contest placeholder team)
	db "Ronald@", TRAINERTYPE_NORMAL
	db 10
	dw GIRAFARIG
	db 10
	dw CLAYDOL
	db 10
	dw POLIWRATH
	db 10
	dw MILOTIC
	db 10
	dw JUMPLUFF
	db 12
	dw ANINETALES
	db -1 ; end

	next_list_item ; YOUNGSTER (17) Unreferenced (Contest placeholder team)
	db "Ronald@", TRAINERTYPE_NORMAL
	db 10
	dw GIRAFARIG
	db 10
	dw CLAYDOL
	db 10
	dw POLIWRATH
	db 10
	dw MILOTIC
	db 10
	dw JUMPLUFF
	db 12
	dw ANINETALES
	db -1 ; end

	next_list_item ; YOUNGSTER (18) Rustboro Gym
	db "Josh@", TRAINERTYPE_NORMAL
	db 6
	dw GEODUDE
	db 6
	dw AGEODUDE
	db -1 ; end

	next_list_item ; YOUNGSTER (19) Rustboro Gym
	db "Tommy@", TRAINERTYPE_NORMAL
	db 6
	dw SANDSHREW
	db 6
	dw ASANDSHREW
	db -1 ; end

	next_list_item ; YOUNGSTER (20) Route 102
	db "Calvin@", TRAINERTYPE_NORMAL
	db 0
	dw POOCHYENA
	db 1
	dw TAILLOW
	db -1 ; end

	next_list_item ; YOUNGSTER (21) Route 102
	db "Allen@", TRAINERTYPE_NORMAL
	db 0
	dw ZIGZAGOON
	db 1
	dw TAILLOW
	db -1 ; end

	next_list_item ; YOUNGSTER (21) Route 104
	db "Billy@", TRAINERTYPE_NORMAL
	db 4
	dw ZIGZAGOON
	db 4
	dw SEEDOT
	db -1 ; end

	next_list_item ; YOUNGSTER (23) Route 116
	db "Joey@", TRAINERTYPE_NORMAL
	db 5
	dw MACHOKE
	db -1 ; end

	next_list_item ; YOUNGSTER (24) Route 116
	db "Johnson@", TRAINERTYPE_NORMAL
	db 5
	dw BRELOOM
	db 5
	dw LOTAD
	db -1 ; end

	next_list_item ; YOUNGSTER (25) Route 110
	db "Timmy@", TRAINERTYPE_NORMAL
	db 7
	dw LAIRON
	db 7
	dw ELECTRIKE
	db -1 ; end

	next_list_item ; YOUNGSTER (26) Mount Moon
	db "Josh@", TRAINERTYPE_NORMAL
	db 5
	dw ARON
	db 6
	dw ELECTRIKE
	db 7
	dw RATTATA
	db -1 ; end

	next_list_item ; YOUNGSTER (27) Route 113
	db "Lao@", TRAINERTYPE_NORMAL
	db 5
	dw WEEZING
	db 6
	dw GRIMER
	db 7
	dw DUSTOX
	db -1 ; end

	next_list_item ; YOUNGSTER (28) Route 113
	db "Dillon@", TRAINERTYPE_NORMAL
	db 5
	dw AMUK
	db 6
	dw GULPIN
	db 7
	dw PARASECT
	db -1 ; end

	end_list_items

SECTION "Hard Trainer Parties 2", ROMX

SchoolboyGroupHard:
	next_list_item ; SCHOOLBOY (1) National Park 
	db "Jack@", TRAINERTYPE_NORMAL
	db 5
	dw ODDISH
	db 5
	dw SWABLU
	db 7
	dw ELECTRODE
	db -1 ; end

	next_list_item ; SCHOOLBOY (2) Route 15
	db "Kipp@", TRAINERTYPE_NORMAL 
	db 3
	dw VOLTORB
	db 3
	dw MAGNEMITE
	db 4
	dw VOLTORB
	db 5
	dw MAGNETON
	db -1 ; end

	next_list_item ; SCHOOLBOY (3) Route 36
	db "Alan@", TRAINERTYPE_NORMAL
	db 9
	dw TANGELA
	db -1 ; end

	next_list_item ; SCHOOLBOY (4) Route 15
	db "Johnny@", TRAINERTYPE_NORMAL
	db 2
	dw BELLSPROUT
	db 4
	dw WEEPINBELL
	db 7
	dw VICTREEBEL
	db -1 ; end

	next_list_item ; SCHOOLBOY (5) Viridian Forest
	db "Danny@", TRAINERTYPE_NORMAL	
	db 1
	dw RATTATA
	db -1 ; end

	next_list_item ; SCHOOLBOY (6) Route 15
	db "Tommy@", TRAINERTYPE_NORMAL
	db 7
	dw XATU
	db 8
	dw ALAKAZAM
	db -1 ; end

	next_list_item ; SCHOOLBOY (7) Route 24
	db "Dudley@", TRAINERTYPE_NORMAL
	db 5
	dw ODDISH
	db 5
	dw VULPIX
	db -1 ; end

	next_list_item ; SCHOOLBOY (8) Route 25
	db "Joe@", TRAINERTYPE_NORMAL
	db 3
	dw TANGELA
	db 5
	dw EEVEE
	db -1 ; end

	next_list_item ; SCHOOLBOY (9) Route 15
	db "Billy@", TRAINERTYPE_NORMAL
	db 4
	dw PARAS
	db 4
	dw PARAS
	db 5
	dw POLIWHIRL
	db 7
	dw DITTO
	db -1 ; end

	next_list_item ; SCHOOLBOY (10) Route 38
	db "Chad@", TRAINERTYPE_NORMAL
	db 9
	dw MR__MIME
	db -1 ; end

	next_list_item ; SCHOOLBOY (11) Fast Ship B1F
	db "Nate@", TRAINERTYPE_NORMAL
	db 7
	dw LEDIAN
	db 7
	dw EXEGGUTOR
	db -1 ; end

	next_list_item ; SCHOOLBOY (12) Fast Ship B1F
	db "Ricky@", TRAINERTYPE_NORMAL
	db 7
	dw AIPOM
	db 7
	dw DITTO
	db -1 ; end

	next_list_item ; SCHOOLBOY (17) Route 38 Rematch 1
	db "Chad@", TRAINERTYPE_NORMAL
	db 11
	dw MR__MIME
	db 11
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SCHOOLBOY (18) Route 38 Rematch 1
	db "Chad@", TRAINERTYPE_NORMAL
	db 11
	dw MR__MIME
	db 11
	dw MAGNETON
	db -1 ; end

	next_list_item ; SCHOOLBOY (23) Route 38 Rematch 2
	db "Chad@", TRAINERTYPE_NORMAL
	db 11
	dw MR__MIME
	db 11
	dw MAGNETON
	db -1 ; end

	next_list_item ; SCHOOLBOY (24) Route 38 Rematch 3
	db "Chad@", TRAINERTYPE_MOVES
	db 11
	dw MR__MIME
	dw PSYCHIC_M, LIGHT_SCREEN, REFLECT, ENCORE
	db 11
	dw MAGNETON
	dw ZAP_CANNON, THUNDER_WAVE, LOCK_ON, SWIFT
	db -1 ; end

	next_list_item ; SCHOOLBOY (25) Mauville City Gym
	db "Ben@", TRAINERTYPE_NORMAL
	db 9
	dw RAICHU
	db 9
	dw LINOONE
	db -1 ; end

	next_list_item ; SCHOOLBOY (26) Route 118
	db "Dale@", TRAINERTYPE_NORMAL
	db 5
	dw MINUN
	db 7
	dw RAITORA
	db -1 ; end

	end_list_items

BirdKeeperGroupHard:
	next_list_item ; BIRD_KEEPER (1) Violet City Gym
	db "Rod@", TRAINERTYPE_NORMAL
	db 4
	dw PIDGEY
	db 4
	dw SPEAROW
	db 4
	dw HOOTHOOT
	db 4
	dw TAILLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (2) Violet City Gym
	db "Abe@", TRAINERTYPE_NORMAL
	db 5
	dw SPEAROW
	db 5
	dw SWABLU
	db 5
	dw HOPPIP
	db -1 ; end

	next_list_item ; BIRD_KEEPER (3) Route 35
	db "Bryan@", TRAINERTYPE_NORMAL
	db 4
	dw PIDGEY
	db 7
	dw PIDGEOTTO
	db 4
	dw TAILLOW
	db 7
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (4) Glitter Lighthouse - 3F
	db "Theo@", TRAINERTYPE_NORMAL
	db 4
	dw PIDGEY
	db 7
	dw PIDGEOTTO
	db 4
	dw TAILLOW
	db 7
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (5) Route 38
	db "Toby@", TRAINERTYPE_NORMAL
	db 5
	dw DODUO
	db 6
	dw DODUO
	db 7
	dw DODRIO
	db -1 ; end

	next_list_item ; BIRD_KEEPER (6) Glitter Lighthouse - 5F
	db "Denis@", TRAINERTYPE_NORMAL
	db 3
	dw SPEAROW
	db 7
	dw FEAROW
	db 3
	dw SPEAROW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (7) Route 44
	db "Vance@", TRAINERTYPE_NORMAL
	db 4
	dw PIDGEOTTO
	db 5
	dw PIDGEOTTO
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (8) Route 04
	db "Hank@", TRAINERTYPE_NORMAL
	db 5
	dw PIDGEY
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (9) Route 14
	db "Roy@", TRAINERTYPE_NORMAL
	db 4
	dw FEAROW
	db 5
	dw FEAROW
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (10) Route 18
	db "Boris@", TRAINERTYPE_NORMAL
	db 2
	dw DODUO
	db 3
	dw DODUO
	db 5
	dw DODRIO
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (11) Route 18
	db "Bob@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (12) Route 27
	db "Jose@", TRAINERTYPE_NORMAL
	db 9
	dw SIRFETCH_D
	db 9
	dw CROBAT
	db 9
	dw FEAROW
	db 11
	dw AERODACTYL
	db -1 ; end

	next_list_item ; BIRD_KEEPER (13) Route 32
	db "Peter@", TRAINERTYPE_NORMAL
	db 2
	dw PIDGEY
	db 3
	dw HOOTHOOT
	db 5
	dw SPEAROW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (15) Route 13
	db "Perry@", TRAINERTYPE_NORMAL
	db 9
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (16) Route 13
	db "Bret@", TRAINERTYPE_NORMAL
	db 6
	dw PIDGEOTTO
	db 8
	dw FEAROW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (20) Route 105
	db "Josue@", TRAINERTYPE_NORMAL
	db 7
	dw FEAROW
	db 7
	dw TOGETIC
	db 9
	dw JUMPLUFF
	db 11
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (21) Fortree Gym
	db "Humbert@", TRAINERTYPE_NORMAL
	db 9
	dw SKARMORY
	db 9
	dw DODRIO
	db -1 ; end

	next_list_item ; BIRD_KEEPER (22) Fortree Gym
	db "Jared@", TRAINERTYPE_NORMAL
	db 9
	dw FEAROW
	db 9
	dw JUMPLUFF
	db -1 ; end

	next_list_item ; BIRD_KEEPER (23) Fortree Gym
	db "Edwardo@", TRAINERTYPE_NORMAL
	db 9
	dw PIDGEOT
	db 9
	dw NOCTOWL
	db -1 ; end

	next_list_item ; BIRD_KEEPER (24) Fortree Gym
	db "Darius@", TRAINERTYPE_NORMAL
	db 9
	dw FARFETCH_D
	db 9
	dw BEAUTIFLY
	db -1 ; end

	next_list_item ; BIRD_KEEPER (25) Route 118
	db "Chester@", TRAINERTYPE_NORMAL
	db 5
	dw FEAROW
	db 7
	dw DUSTOX
	db -1 ; end

	next_list_item ; BIRD_KEEPER (26) Route 118
	db "Perry@", TRAINERTYPE_NORMAL
	db 5
	dw GOLBAT
	db 7
	dw GLIGAR
	db -1 ; end

	next_list_item ; BIRD_KEEPER (27) Route 113
	db "Coby@", TRAINERTYPE_NORMAL
	db 7
	dw SKARMORY
	db 7
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (28) Route 119
	db "Phil@", TRAINERTYPE_NORMAL
	db 6
	dw FEAROW
	db 7
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (29) Route 119
	db "Hugh@", TRAINERTYPE_NORMAL
	db 6
	dw PELIPPER
	db 7
	dw TROPIUS
	db -1 ; end

	next_list_item ; BIRD_KEEPER (30) Route 120
	db "Robert@", TRAINERTYPE_NORMAL
	db 6
	dw ALTARIA
	db 7
	dw DODRIO
	db -1 ; end

	next_list_item ; BIRD_KEEPER (31) Route 120
	db "Colin@", TRAINERTYPE_NORMAL
	db 6
	dw PELIPPER
	db 7
	dw XATU
	db -1 ; end

	end_list_items

LassGroupHard:
	next_list_item ; LASS (1) Goldenrod City Gym
	db "Carrie@", TRAINERTYPE_NORMAL
	db 7
	dw SNUBBULL
	db 7
	dw PONYTA
	db 7
	dw LINOONE
	db -1 ; end

	next_list_item ; LASS (2) Goldenrod City Gym
	db "Bridget@", TRAINERTYPE_NORMAL 
	db 7
	dw JIGGLYPUFF
	db 7
	dw TEDDIURSA
	db 7
	dw LINOONE
	db -1 ; end

	next_list_item ; LASS (3) Fuschia City Gym
	db "Alice@", TRAINERTYPE_NORMAL
	db 7
	dw GLOOM
	db 7
	dw ARBOK
	db 7
	dw SWALOT
	db -1 ; end

	next_list_item ; LASS (4) Unreferenced
	db "Krise@", TRAINERTYPE_NORMAL
	db 7
	dw ODDISH
	db 7
	dw CUBONE
	db -1 ; end

	next_list_item ; LASS (5) Glitter Lighthouse - 4F
	db "Connie@", TRAINERTYPE_NORMAL
	db 7
	dw AZUMARILL
	db 7
	dw TOGETIC
	db 7
	dw PLUSLE
	db -1 ; end

	next_list_item ; LASS (6) Fuschia City Gym
	db "Linda@", TRAINERTYPE_NORMAL
	db 7
	dw TANGELA
	db 7
	dw HYPNO
	db 7
	dw VENUSAUR
	db -1 ; end

	next_list_item ; LASS (7) Route 25
	db "Laura@", TRAINERTYPE_NORMAL
	db 5
	dw GLOOM
	db 5
	dw PIDGEOTTO
	db 7
	dw BELLOSSOM
	db -1 ; end

	next_list_item ; LASS (8) Route 25
	db "Shannon@", TRAINERTYPE_NORMAL
	db 5
	dw PARAS
	db 5
	dw PARAS
	db 7
	dw PARASECT
	db -1 ; end

	next_list_item ; LASS (9) Celadon City Gym
	db "Michelle@", TRAINERTYPE_NORMAL
	db 5
	dw PARAS
	db 5
	dw HOPPIP
	db 7
	dw SKIPLOOM
	db -1 ; end

	next_list_item ; LASS (10) Route 38
	db "Dana@", TRAINERTYPE_NORMAL
	db 7
	dw FLAAFFY
	db 7
	dw GOLDUCK
	db -1 ; end

	next_list_item ; LASS (11) Route 24
	db "Ellen@", TRAINERTYPE_NORMAL
	db 5
	dw JIGGLYPUFF
	db 5
	dw SNUBBULL
	db -1 ; end

	next_list_item ; LASS (18) Mauville City Gym
	db "Vivian@", TRAINERTYPE_NORMAL	
	db 9
	dw LANTURN
	db 9
	dw HITMONCHAN
	db -1 ; end

	next_list_item ; LASS (19) Route 102
	db "Tiana@", TRAINERTYPE_NORMAL	
	db 1
	dw ZIGZAGOON
	db 2
	dw SHROOMISH
	db -1 ; end

	next_list_item ; LASS (20) Route 104
	db "Haley@", TRAINERTYPE_NORMAL	
	db 3
	dw HOPPIP
	db 4
	dw LOTAD
	db -1 ; end

	next_list_item ; LASS (21) Route 116
	db "Karen@", TRAINERTYPE_NORMAL	
	db 5
	dw SHROOMISH
	db 6
	dw PIDGEOTTO
	db -1 ; end

	next_list_item ; LASS (22) Route 116
	db "Janice@", TRAINERTYPE_NORMAL	
	db 5
	dw MARILL
	db 4
	dw FEAROW
	db -1 ; end

	next_list_item ; LASS (23) Mount Moon
	db "Iris@", TRAINERTYPE_NORMAL	
	db 5
	dw CLEFAIRY
	db 7
	dw JIGGLYPUFF
	db -1 ; end

	next_list_item ; LASS (24) Mount Moon
	db "Miriam@", TRAINERTYPE_NORMAL	
	db 5
	dw GLOOM
	db 7
	dw ROSELIA
	db -1 ; end

	next_list_item ; LASS (25) Route 118
	db "Sally@", TRAINERTYPE_NORMAL	
	db 5
	dw GLOOM
	db 6
	dw VOLBEAT
	db -1 ; end

	next_list_item ; LASS (26) Route 118
	db "Annie@", TRAINERTYPE_NORMAL	
	db 5
	dw MUNCHLAX
	db 7
	dw ROSELIA
	db -1 ; end

	next_list_item ; LASS (27) Sootopolis Gym
	db "Andrea@", TRAINERTYPE_NORMAL	
	db 8
	dw LUVDISC
	db 8
	dw WAILORD
	db -1 ; end

	next_list_item ; LASS (28) Sootopolis Gym
	db "Crissy@", TRAINERTYPE_NORMAL	
	db 8
	dw SEAKING
	db 8
	dw BLASTOISE
	db -1 ; end

	end_list_items

JanineGroupHard:
	next_list_item ; JANINE (1)
	db "Janine@", TRAINERTYPE_MOVES
	db 9
	dw KOFFING
	dw ACID, EMBER, TOXIC, WILLOWISP
	db 9
	dw GRIMER
	dw ACID, TACKLE, HARDEN, TOXIC
	db 11
	dw ARIADOS
	dw TWINEEDLE, MEGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	db -1 ; end
	
	next_list_item ; JANINE (1)
	db "Janine@", TRAINERTYPE_MOVES
	db 10
	dw WEEZING
	dw SLUDGE, FIRE_SPIN, TOXIC, WILLOWISP
	db 10
	dw MUK
	dw ACID, RECOVER, HARDEN, TOXIC
	db 10
	dw SWALOT
	dw SLUDGE, MUD_SHOT, HARDEN, TOXIC
	db 10
	dw ARIADOS
	dw TWINEEDLE, MEGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	db 15
	dw NIDOQUEEN
	dw EARTHQUAKE, MEGAHORN, BULK_UP, SLUDGE_BOMB
	db -1 ; end
	
	next_list_item ; JANINE (3)
	db "Janine@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw WEEZING
	dw LEFTOVERS
	dw SLUDGE_BOMB, FIRE_BLAST, AMNESIA, WILLOWISP
	db 10
	dw AMUK
	dw LEFTOVERS
	dw SLUDGE_BOMB, RECOVER, ACID_ARMOR, TOXIC
	db 10
	dw SWALOT
	dw LEFTOVERS
	dw SLUDGE_BOMB, MUD_SHOT, COSMIC_POWER, TOXIC
	db 11
	dw ARIADOS
	dw SILVERPOWDER
	dw MEGAHORN, MEGA_DRAIN, PSYCHIC_M, NIGHT_SHADE
	db 11
	dw NIDOQUEEN
	dw POISON_BARB
	dw EARTHQUAKE, MEGAHORN, BULK_UP, SLUDGE_BOMB
	db 13
	dw VENUSAURX
	dw MINT_BERRY
	dw EARTHQUAKE, GIGA_DRAIN, REST, SLUDGE_BOMB
	db -1 ; end

	end_list_items

CooltrainerMGroupHard:
	next_list_item ; COOLTRAINERM (1) Union Cave - B2F
	db "Nick@", TRAINERTYPE_NORMAL
	db 9
	dw CHARIZARD
	db 9
	dw BLASTOISE
	db 9
	dw VENUSAUR
	db 5
	dw ARAICHU
	db 5
	dw SKARMORY2
	db 4
	dw OCTILLERY
	db -1 ; end

	next_list_item ; COOLTRAINERM (2) Unreferenced
	db "Aaron@", TRAINERTYPE_NORMAL
	db 6
	dw IVYSAUR
	db 6
	dw CHARMELEON
	db 6
	dw WARTORTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (3) Blackthorn City Gym
	db "Paul@", TRAINERTYPE_NORMAL
	db 9
	dw DRAGONAIR
	db 9
	dw SEADRA
	db 9
	dw YANMA
	db -1 ; end

	next_list_item ; COOLTRAINERM (4) Blackthorn City Gym
	db "Cody@", TRAINERTYPE_NORMAL
	db 7
	dw HORSEA
	db 9
	dw SEADRA
	db 7
	dw YANMA
	db 9
	dw FURRET
	db -1 ; end

	next_list_item ; COOLTRAINERM (5) Blackthorn City Gym
	db "Mike@", TRAINERTYPE_NORMAL
	db 9
	dw CHARIZARD
	db 9
	dw VIBRAVA
	db 9
	dw DRAGONAIR
	db -1 ; end

	next_list_item ; COOLTRAINERM (6) Route 26
	db "Gaven@", TRAINERTYPE_NORMAL
	db 9
	dw VICTREEBEL
	db 9
	dw KINGLER
	db 9
	dw FLAREON
	db 9
	dw SEVIPER
	db -1 ; end

	next_list_item ; COOLTRAINERM (8) Route 45
	db "Ryan@", TRAINERTYPE_NORMAL
	db 7
	dw PIDGEOT
	db 7
	dw ELECTABUZZ
	db 8
	dw ALTARIA
	db 8
	dw JYNX
	db -1 ; end

	next_list_item ; COOLTRAINERM (9) Route 26
	db "Jake@", TRAINERTYPE_NORMAL
	db 9
	dw PARASECT
	db 9
	dw GOLDUCK
	db 5
	dw TRAPINCH
	db 10
	dw CAMERUPT
	db -1 ; end

	next_list_item ; COOLTRAINERM (11) Route 27
	db "Blake@", TRAINERTYPE_NORMAL
	db 10
	dw MAGNEZONE
	db 10
	dw QUAGSIRE
	db 10
	dw EXEGGUTOR2
	db -1 ; end

	next_list_item ; COOLTRAINERM (12) Route 27
	db "Brian@", TRAINERTYPE_NORMAL
	db 10
	dw ASANDSLASH
	db 10
	dw SWALOT
	db 10
	dw GRUMPIG
	db -1 ; end

	next_list_item ; COOLTRAINERM (13) Unreferenced
	db "Erick@", TRAINERTYPE_NORMAL
	db 10
	dw BULBASAUR
	db 10
	dw CHARMANDER
	db 10
	dw SQUIRTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (14) Unreferenced
	db "Andy@", TRAINERTYPE_NORMAL
	db 10
	dw BULBASAUR
	db 10
	dw CHARMANDER
	db 10
	dw SQUIRTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (15) Unreferenced
	db "Tyler@", TRAINERTYPE_NORMAL
	db 10
	dw BULBASAUR
	db 10
	dw CHARMANDER
	db 10
	dw SQUIRTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (16) Unreferenced
	db "Sean@", TRAINERTYPE_NORMAL
	db 10
	dw FLAREON
	db 10
	dw TANGELA
	db 10
	dw TAUROS
	db -1 ; end

	next_list_item ; COOLTRAINERM (17) Route 25
	db "Kevin@", TRAINERTYPE_NORMAL
	db 8
	dw RHYHORN
	db 5
	dw CHARMELEON
	db 5
	dw WARTORTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (18) Unreferenced
	db "Steve@", TRAINERTYPE_NORMAL
	db 7
	dw BULBASAUR
	db 7
	dw CHARMANDER
	db 7
	dw SQUIRTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (19) Unreferenced
	db "Allen@", TRAINERTYPE_MOVES
	db 7
	dw CHARMELEON
	dw EMBER, SMOKESCREEN, RAGE, SCARY_FACE
	db -1 ; end

	next_list_item ; COOLTRAINERM (20) Dragon's Den
	db "Darin@", TRAINERTYPE_MOVES
	db 15
	dw DRAGONAIR
	dw WRAP, SURF, DRAGON_RAGE, SLAM
	db -1 ; end

	next_list_item ; COOLTRAINERM (21) Petalburg Gym
	db "Randal@", TRAINERTYPE_NORMAL
	db 11
	dw DELCATTY
	db 11
	dw PERSIAN
	db -1 ; end

	next_list_item ; COOLTRAINERM (22) Petalburg Gym
	db "Parker@", TRAINERTYPE_NORMAL
	db 11
	dw WIGGLYTUFF
	db 11
	dw TAUROS
	db -1 ; end

	next_list_item ; COOLTRAINERM (23) Petalburg Gym
	db "George@", TRAINERTYPE_NORMAL
	db 11
	dw RATICATE
	db 11
	dw KANGASKHAN
	db -1 ; end

	next_list_item ; COOLTRAINERM (24) Lavaridge Gym
	db "Gerald@", TRAINERTYPE_NORMAL
	db 11
	dw AMAROWAK
	db 11
	dw DYNABEA
	db -1 ; end

	next_list_item ; COOLTRAINERM (25) Daloric contest team #1
	db "Daloric@", TRAINERTYPE_NORMAL
	db 11
	dw CHARIZARD
	db 11
	dw AGGRON
	db 11
	dw TYRANITAR
	db 11
	dw KINGLER
	db 11
	dw GENGAR
	db 11
	dw AMPHAROS
	db -1 ; end

	next_list_item ; COOLTRAINERM (26) Daloric contest team #2
	db "Daloric@", TRAINERTYPE_NORMAL
	db 11
	dw CHARIZARDX
	db 11
	dw AGGRONX
	db 11
	dw TYRANITARX
	db 11
	dw KINGLERX
	db 11
	dw GENGARX
	db 11
	dw AMPHAROSX
	db -1 ; end

	next_list_item ; COOLTRAINERM (27) DominantDragon26 contest team #1
	db "Crystal@", TRAINERTYPE_NORMAL
	db 11
	dw NOCTOWL
	db 11
	dw SHARPEDO
	db 11
	dw RAITORA
	db 11
	dw DYNABEA
	db 11
	dw LUNATONE
	db 11
	dw SANDSLASH
	db -1 ; end

	next_list_item ; COOLTRAINERM (28) DominantDragon26 contest team #2
	db "Crystal@", TRAINERTYPE_NORMAL
	db 11
	dw NOCTOWL2
	db 11
	dw SHARPEDO
	db 11
	dw RAITORA
	db 11
	dw DYNABEA
	db 11
	dw LUNATONE
	db 11
	dw SANDSLASH
	db -1 ; end

	next_list_item ; COOLTRAINERM (29) Route 120
	db "Leonel@", TRAINERTYPE_NORMAL
	db 9
	dw MANECTRIC
	db 9
	dw MANTINE
	db 9
	dw PARASECT
	db 9
	dw AKUERIA
	db -1 ; end

	next_list_item; COOLTRAINERM (30) Ashen Gauntlet
	db "@", TRAINERTYPE_RANDOM, 6, TRIAL_EASY
	db -1 ; end

	next_list_item ; COOLTRAINERM (31) World Cup
	db "Wesley@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw FLAREON
	dw BLACKBELT_I
	dw ROLLING_KICK, FIRE_FANG, DIG, BULK_UP 
	db 9
	dw TAUROS
	dw BLACKBELT_I
	dw SUBMISSION, DOUBLE_EDGE, EARTHQUAKE, OUTRAGE
	db 9
	dw DODRIO
	dw BLACKBELT_I
	dw HI_JUMP_KICK, DRILL_PECK, SKY_ATTACK, WHIRLWIND
	db 9
	dw POLIWRATH
	dw BLACKBELT_I
	dw SUBMISSION, HYDRO_PUMP, MACH_PUNCH, AQUA_JET
	db 9
	dw MEDICHAM
	dw FOCUS_BAND
	dw FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, BULLET_PUNCH
	db 11
	dw GALLADE
	dw QUICK_CLAW
	dw PSYCHO_CUT, LEAF_BLADE, DRAGON_DANCE, RAZORSHELL
	db -1 ; end

	next_list_item ; COOLTRAINERM (32) World Cup
	db "Arthur@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw KLEAVOR
	dw HARD_STONE
	dw STONE_EDGE, ROCK_TOMB, DOUBLE_TEAM, GUILLOTINE 
	db 9
	dw DONPHAN
	dw HARD_STONE
	dw ROCK_SLIDE, DOUBLE_EDGE, EARTHQUAKE, OUTRAGE
	db 9
	dw SUDOWOODO
	dw HARD_STONE
	dw SPIKES, ROCK_SLIDE, MIRROR_MOVE, PURSUIT
	db 9
	dw CRADILY
	dw HARD_STONE
	dw ANCIENTPOWER, MAGICAL_LEAF, AMNESIA, GIGA_DRAIN
	db 9
	dw SOLROCK
	dw HARD_STONE
	dw FLAMETHROWER, FUTURE_SIGHT, POWER_GEM, RECOVER
	db 11
	dw HARCANINE
	dw HARD_STONE
	dw SACRED_FIRE, STONE_EDGE, AGILITY, PURSUIT
	db -1 ; end

	next_list_item ; COOLTRAINERM (33) World Cup
	db "Santos@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw SABLEYE
	dw SPELL_TAG
	dw COSMIC_POWER, NIGHT_SHADE, BATON_PASS, PURSUIT 
	db 9
	dw XATU
	dw SPELL_TAG
	dw SHADOW_BALL, DRILL_PECK, FLY, PSYBEAM
	db 9
	dw ESPEON
	dw SPELL_TAG
	dw SHADOW_BALL, PSYCHIC_M, SWIFT, MIST_BALL
	db 9
	dw NINETALES
	dw QUICK_CLAW
	dw FIRE_BLAST, NIGHT_SHADE, DESTINY_BOND, FAE_VOICE
	db 9
	dw GENGAR
	dw SPELL_TAG
	dw SHADOW_BALL, HYPNOSIS, DREAM_EATER, SLUDGE_WAVE
	db 11
	dw DUSKNOIR
	dw SPELL_TAG
	dw DRAGON_DANCE, WILLOWISP, SHADOW_FORCE, PURSUIT
	db -1 ; end

	next_list_item ; COOLTRAINERM (34) Evergrande Dungeon Generic #1
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw CHARIZARD
	db 7
	dw BLASTOISE
	db 7
	dw VENUSAUR
	db 8
	dw ELECTRODE
	db -1 ; end

	next_list_item ; COOLTRAINERM (35) Evergrande Dungeon Generic #2
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw MEGANIUM
	db 7
	dw FERALIGATR
	db 7
	dw TYPHLOSION
	db 8
	dw HYPNO
	db -1 ; end

	next_list_item ; COOLTRAINERM (36) Evergrande Dungeon Generic #3
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw SCEPTILE
	db 7
	dw BLAZIKEN
	db 7
	dw SWAMPERT
	db 8
	dw WIGGLYTUFF
	db -1 ; end

	next_list_item ; COOLTRAINERM (37) Evergrande Dungeon Generic #4
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw RAPIDASH
	db 7
	dw GOLDUCK
	db 7
	dw LUDICOLO
	db 8
	dw SCYTHER
	db -1 ; end

	next_list_item ; COOLTRAINERM (38) Evergrande Dungeon Generic #5
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw TAUROS
	db 7
	dw STEELIX
	db 7
	dw NOCTOWL
	db 8
	dw AGGRON
	db -1 ; end

	next_list_item ; COOLTRAINERM (39) Evergrande Dungeon Generic #6
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw MAGMAR
	db 7
	dw JYNX
	db 7
	dw ELECTABUZZ
	db 8
	dw URSARING
	db -1 ; end

	next_list_item ; COOLTRAINERM (40) Evergrande Dungeon Generic #7
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw AMUK
	db 7
	dw MUK
	db 7
	dw HARIYAMA
	db 8
	dw MAGNETON
	db -1 ; end

	next_list_item ; COOLTRAINERM (41) Evergrande Dungeon Generic #8
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw PIDGEOT
	db 7
	dw GIRAFARIG
	db 7
	dw CORSOLA
	db 8
	dw MAGCARGO
	db -1 ; end

	next_list_item ; COOLTRAINERM (42) Evergrande Dungeon Generic #9
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw AMPHAROS
	db 7
	dw CLEFABLE
	db 7
	dw HOUNDOOM
	db 8
	dw WAILORD
	db -1 ; end

	end_list_items

CooltrainerFGroupHard:
	next_list_item ; COOLTRAINERF (1) Union Cave - B2F
	db "Gwen@", TRAINERTYPE_NORMAL
	db 7
	dw EEVEE
	db 10
	dw SYLVEON
	db 10
	dw LEAFEON
	db 10
	dw GLACEON
	db -1 ; end

	next_list_item ; COOLTRAINERF (2) Unreferenced
	db "Lois@", TRAINERTYPE_NORMAL
	db 5
	dw SKIPLOOM
	db 7
	dw NINETALES
	db -1 ; end

	next_list_item ; COOLTRAINERF (3) Blackthorn City Gym
	db "Fran@", TRAINERTYPE_NORMAL
	db 7
	dw SEADRA
	db 7
	dw WAILORD
	db 7
	dw YANMA
	db 7
	dw SNEASEL
	db -1 ; end

	next_list_item ; COOLTRAINERF (4) Unreferenced
	db "Lola@", TRAINERTYPE_NORMAL
	db 4
	dw DRATINI
	db 6
	dw DRAGONAIR
	db -1 ; end

	next_list_item ; COOLTRAINERF (5) Route 34
	db "Kate@", TRAINERTYPE_NORMAL
	db 7
	dw LUDICOLO
	db 8
	dw CLOYSTER
	db -1 ; end

	next_list_item ; COOLTRAINERF (6) Route 34
	db "Irene@", TRAINERTYPE_NORMAL
	db 7
	dw MASQUERAIN
	db 8
	dw SEAKING
	db -1 ; end

	next_list_item ; COOLTRAINERF (7) Route 45
	db "Kelly@", TRAINERTYPE_NORMAL
	db 7
	dw MARILL
	db 4
	dw WARTORTLE
	db 4
	dw WARTORTLE
	db -1 ; end

	next_list_item ; COOLTRAINERF (8) Route 26
	db "Joyce@", TRAINERTYPE_NORMAL
	db 8
	dw PIKACHU
	db 9
	dw BLASTOISE
	db 8
	dw RAICHU
	db 10
	dw SUNFLORA
	db 11
	dw URSARING
	db 9
	dw SKARMORY
	db -1 ; end

	next_list_item ; COOLTRAINERF (9) Route 26
	db "Beth@", TRAINERTYPE_NORMAL
	db 9
	dw RAPIDASH
	db 9
	dw RAPIDASH2
	db 9
	dw NINETALES
	db 9
	dw ANINETALES
	db 9
	dw NOCTOWL
	db 9
	dw EXEGGCUTE2
	db -1 ; end

	next_list_item ; COOLTRAINERF (10) Route 27
	db "Reena@", TRAINERTYPE_NORMAL
	db 8
	dw STARMIE
	db 8
	dw NIDOQUEEN
	db 7
	dw GLISCOR
	db 8
	dw LUNATONE
	db 10
	dw FROSLASS
	db -1 ; end

	next_list_item ; COOLTRAINERF (11) Route 27
	db "Megan@", TRAINERTYPE_NORMAL
	db 7
	dw FERALIGATR2
	db 7
	dw TYPHLOSION2
	db 7
	dw VENUSAUR
	db 7
	dw CACTURNE
	db 11
	dw TORKOAL
	db -1 ; end

	next_list_item ; COOLTRAINERF (13) Unreferenced
	db "Carol@", TRAINERTYPE_NORMAL
	db 5
	dw ELECTRODE
	db 5
	dw STARMIE
	db 5
	dw NINETALES
	db -1 ; end

	next_list_item ; COOLTRAINERF (14) Viridian Forest
	db "Quinn@", TRAINERTYPE_NORMAL
	db 1
	dw BULBASAUR
	db -1 ; end

	next_list_item ; COOLTRAINERF (15) Union Cave - B2F
	db "Emma@", TRAINERTYPE_NORMAL
	db 9
	dw POLITOED
	db 9
	dw SUDOWOODO
	db 9
	dw LEDIAN
	db 9
	dw GIRAFARIG
	db -1 ; end

	next_list_item ; COOLTRAINERF (16) Route 44
	db "Cybil@", TRAINERTYPE_NORMAL
	db 7
	dw BUTTERFREE
	db 7
	dw BELLOSSOM
	db 7
	dw SLOWKING
	db 7
	dw UMBREON
	db -1 ; end

	next_list_item ; COOLTRAINERF (17) Route 34
	db "Jenn@", TRAINERTYPE_NORMAL
	db 8 
	dw GLACEON
	db 8
	dw STARMIE
	db -1 ; end

	next_list_item ; COOLTRAINERF (21) Dragon's Den
	db "Cara@", TRAINERTYPE_NORMAL
	db 8
	dw SHARPEDO
	db 8
	dw CAMERUPT
	db 9
	dw ALTARIA
	db -1 ; end

	next_list_item ; COOLTRAINERF (21) Ilex West (LelouchIsKing contest party #1)
	db "Marina@", TRAINERTYPE_NORMAL
	db 9
	dw GROWLITHE
	db 9
	dw SNORUNT
	db 9
	dw BRELOOM
	db 9
	dw QUAGSIRE
	db 9
	dw TOGETIC
	db 10
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; COOLTRAINERF (21) Johto Games (LelouchIsKing contest party #2)
	db "Marina@", TRAINERTYPE_NORMAL
	db 10
	dw ARCANINE
	db 10
	dw FROSLASS
	db 10
	dw BRELOOM
	db 10
	dw QUAGSIRE
	db 10
	dw TOGEKISS
	db 12
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; COOLTRAINERF (21) Unreferenced (LelouchIsKing contest party #3)
	db "Marina@", TRAINERTYPE_NORMAL
	db 12
	dw ARCANINE
	db 12
	dw FROSLASS
	db 12
	dw BRELOOM
	db 12
	dw QUAGSIRE
	db 12
	dw TOGEKISS
	db 15
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "Mary@", TRAINERTYPE_NORMAL
	db 11
	dw FURRET
	db 11
	dw ZANGOOSE
	db -1 ; end

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "Mary@", TRAINERTYPE_NORMAL
	db 11
	dw DODRIO
	db 11
	dw FEAROW
	db -1 ; end

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "Mary@", TRAINERTYPE_NORMAL
	db 11
	dw SWELLOW
	db 11
	dw NOCTOWL
	db -1 ; end

	next_list_item ; COOLTRAINERF (23) Route 120
	db "Jenni@", TRAINERTYPE_NORMAL
	db 9
	dw SABLEYE
	db 9
	dw CORSOLA
	db 9
	dw RAITORA
	db 10
	dw MAWILE
	db -1 ; end

	next_list_item ; COOLTRAINERF (24) World Cup
	db "Monica@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw BUTTERFREE
	dw SHARP_BEAK
	dw FAE_VOICE, STUN_SPORE, HURRICANE, PSYCHIC_M 
	db 9
	dw FEAROW
	dw SHARP_BEAK
	dw DRILL_PECK, FLY, DOUBLE_EDGE, MIRROR_MOVE
	db 9
	dw NOCTOWL
	dw SHARP_BEAK
	dw DRILL_PECK, PSYCHIC_M, HYPNOSIS, DREAM_EATER
	db 9
	dw ABSOL
	dw SHARP_BEAK
	dw SKY_ATTACK, CRUNCH, FUTURE_SIGHT, SLASH
	db 9
	dw YANMEGA
	dw SHARP_BEAK
	dw FLAMETHROWER, SKY_ATTACK, CRUNCH, OUTRAGE
	db 11
	dw SEAKING
	dw SHARP_BEAK
	dw DRILL_PECK, FLY, DRAGON_DANCE, RAZORSHELL
	db -1 ; end

	next_list_item ; COOLTRAINERF (25) World Cup
	db "Tuscany@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw WIGGLYTUFF
	dw LEFTOVERS
	dw WILLOWISP, GLARE, DRAININGKISS, CALM_MIND 
	db 9
	dw LINOONE
	dw PINK_BOW
	dw HYPER_VOICE, HYPER_BEAM, SUPERSONIC, ROAR
	db 9
	dw PERSIAN
	dw PINK_BOW
	dw SLASH, PURSUIT, CRUNCH, PSYCHO_CUT
	db 9
	dw RAPIDASH
	dw PINK_BOW
	dw MEGA_KICK, FLAME_WHEEL, FIRE_SPIN, DOUBLE_KICK
	db 9
	dw DELCATTY
	dw PINK_BOW
	dw PLAY_ROUGH, CHARM, GROWL, SLASH
	db 11
	dw URSALUNA
	dw PINK_BOW
	dw DOUBLE_EDGE, FISSURE, REST, BULK_UP
	db -1 ; end

	next_list_item ; COOLTRAINERF (26) World Cup
	db "Frieda@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw TENTACRUEL
	dw POISON_BARB
	dw SURF, GIGA_DRAIN, ICY_WIND, SLUDGE_BOMB 
	db 9
	dw DUSTOX
	dw POISON_BARB
	dw SLUDGE_BOMB, CONFUSE_RAY, STUN_SPORE, WHIRLWIND
	db 9
	dw AMUK
	dw POISON_BARB
	dw SLUDGE_BOMB, PURSUIT, RECOVER, MINIMIZE
	db 9
	dw NIDOQUEEN
	dw POISON_BARB
	dw SLUDGE_BOMB, EARTHQUAKE, BODY_SLAM, TOXIC
	db 9
	dw UMBREON
	dw POISON_BARB
	dw TOXIC, RECOVER, GROWL, SNARL
	db 11
	dw GWEEZING
	dw POISON_BARB
	dw SLUDGE_BOMB, PLAY_ROUGH, EXPLOSION, AMNESIA
	db -1 ; end

	next_list_item ; COOLTRAINERF (27) Evergrande Dungeon Generic F #1
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw RHYDON
	db 7
	dw HITMONCHAN
	db 7
	dw TANGROWTH
	db 8
	dw ARCANINE
	db -1 ; end

	next_list_item ; COOLTRAINERF (28) Evergrande Dungeon Generic F #2
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw NINETALES
	db 7
	dw HITMONLEE
	db 7
	dw JUMPLUFF
	db 8
	dw SLOWBRO
	db -1 ; end

	next_list_item ; COOLTRAINERF (29) Evergrande Dungeon Generic F #3
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw POLITOED
	db 7
	dw WEAVILE
	db 7
	dw SABLEYE
	db 8
	dw MAWILE
	db -1 ; end

	next_list_item ; COOLTRAINERF (30) Evergrande Dungeon Generic F #4
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw MR__RIME
	db 7
	dw LANTURN
	db 7
	dw HELECTRODE
	db 8
	dw PERSIAN
	db -1 ; end

	next_list_item ; COOLTRAINERF (31) Evergrande Dungeon Generic F #5
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw LINOONE
	db 7
	dw GLALIE
	db 7
	dw HUNTAIL
	db 8
	dw MILTANK
	db -1 ; end

	next_list_item ; COOLTRAINERF (32) Evergrande Dungeon Generic F #6
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw DELIBIRD
	db 7
	dw MANTINE
	db 7
	dw DUNSPARCE
	db 8
	dw TORKOAL
	db -1 ; end

	next_list_item ; COOLTRAINERF (33) Evergrande Dungeon Generic F #7
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw ARAICHU
	db 7
	dw BLISSEY
	db 7
	dw DELCATTY
	db 8
	dw WHISCASH
	db -1 ; end

	next_list_item ; COOLTRAINERF (34) Evergrande Dungeon Generic F #8
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw AMAROWAK
	db 7
	dw LICKILICKY
	db 7
	dw CLAYDOL
	db 8
	dw WALREIN
	db -1 ; end

	next_list_item ; COOLTRAINERF (34) Evergrande Dungeon Generic F #9
	db "@", TRAINERTYPE_NORMAL
	db 7
	dw DUSTOX
	db 7
	dw GRANBULL
	db 7
	dw SIRFETCH_D
	db 8
	dw SNORLAX
	db -1 ; end

	end_list_items

BeautyGroupHard:
	next_list_item ; BEAUTY (1) Goldenrod City Gym
	db "Victoria@", TRAINERTYPE_NORMAL
	db 7
	dw SENTRET
	db 7
	dw ZIGZAGOON
	db 7
	dw DELCATTY
	db -1 ; end

	next_list_item ; BEAUTY (2) Goldenrod City Gym
	db "Samantha@", TRAINERTYPE_NORMAL
	db 9
	dw MEOWTH
	db 9
	dw BEAUTIFLY
	db -1 ; end

	next_list_item ; BEAUTY (6) Fastship Cabins
	db "Cassie@", TRAINERTYPE_NORMAL
	db 7
	dw VILEPLUME
	db 5
	dw BUTTERFREE
	db -1 ; end

	next_list_item ; BEAUTY (9) Unreferenced
	db "Jessica@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (10) Unreferenced
	db "Rachael@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (11) Unreferenced
	db "Angelica@", TRAINERTYPE_NORMAL
	db 15
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (12) Unreferenced
	db "Kendra@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (13) Unreferenced
	db "Veronica@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (14) Celadon City Gym
	db "Julia@", TRAINERTYPE_NORMAL
	db 7
	dw EXEGGCUTE2
	db 7
	dw EXEGGCUTE
	db 7
	dw PARASECT
	db -1 ; end

	next_list_item ; BEAUTY (15) Unreferenced
	db "Theresa@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (16) Route 38
	db "Valerie@", TRAINERTYPE_NORMAL
	db 5
	dw SKIPLOOM
	db 7
	dw SUNFLORA
	db -1 ; end

	next_list_item ; BEAUTY (17) Route 38
	db "Olivia@", TRAINERTYPE_NORMAL
	db 12
	dw CORSOLA
	db -1 ; end

	next_list_item ; BEAUTY (18) Route 103
	db "Daisy@", TRAINERTYPE_NORMAL
	db 5
	dw FURRET
	db -1 ; end

	next_list_item ; BEAUTY (19) Route 104
	db "Cindy@", TRAINERTYPE_NORMAL
	db 5
	dw HOOTHOOT
	db -1 ; end

	next_list_item ; BEAUTY (20) Route 109
	db "Hailey@", TRAINERTYPE_NORMAL
	db 6
	dw NOCTOWL
	db 7
	dw AZUMARILL
	db -1 ; end

	next_list_item ; BEAUTY (21) Route 109
	db "Lola@", TRAINERTYPE_NORMAL
	db 7
	dw ANINETALES
	db 7
	dw ROSERADE
	db -1 ; end

	next_list_item ; BEAUTY (22) Route 112
	db "Shayla@", TRAINERTYPE_NORMAL
	db 7
	dw BRELOOM
	db 7
	dw ROSELIA
	db -1 ; end

	next_list_item ; BEAUTY (23) Route 120
	db "Clarissa@", TRAINERTYPE_NORMAL
	db 7
	dw ROSERADE
	db 7
	dw WAILORD
	db -1 ; end

	next_list_item ; BEAUTY (23) Route 120
	db "Clarissa@", TRAINERTYPE_NORMAL
	db 7
	dw LEAFEON
	db 7
	dw SYLVEON
	db -1 ; end

	next_list_item ; BEAUTY (24) Sootopolis Gym
	db "Connie@", TRAINERTYPE_NORMAL
	db 8
	dw SEAKING
	db 9
	dw VAPOREON
	db -1 ; end

	next_list_item ; BEAUTY (25) Sootopolis Gym
	db "Tiffany@", TRAINERTYPE_NORMAL
	db 8
	dw SHARPEDO
	db 9
	dw MASQUERAIN
	db -1 ; end

	next_list_item ; BEAUTY (26) Sootopolis Gym
	db "Olivia@", TRAINERTYPE_NORMAL
	db 8
	dw HUNTAIL
	db 8
	dw GOREBYSS
	db -1 ; end

	next_list_item ; BEAUTY (27) Sootopolis Gym
	db "Bridget@", TRAINERTYPE_NORMAL
	db 9
	dw AZUMARILL
	db 7
	dw WAILMER
	db -1 ; end

	end_list_items

PokemaniacGroupHard:
	next_list_item ; POKEMANIAC (1) Union Cave - 1F
	db "Larry@", TRAINERTYPE_NORMAL
	db 7
	dw SLOWPOKE
	db 7
	dw UNOWN
	db -1 ; end

	next_list_item ; POKEMANIAC (2) Union Cave - B1F
	db "Andrew@", TRAINERTYPE_NORMAL
	db 7
	dw MAROWAK
	db 7
	dw AMAROWAK
	db -1 ; end

	next_list_item ; POKEMANIAC (3) Union Cave - B1F
	db "Calvin@", TRAINERTYPE_NORMAL
	db 7
	dw KANGASKHAN
	db 7
	dw TAUROS
	db 7
	dw TAUROS
	db -1 ; end

	next_list_item ; POKEMANIAC (4) Route 42
	db "Shane@", TRAINERTYPE_NORMAL
	db 8
	dw NIDOQUEEN
	db 8
	dw NIDOKING
	db -1 ; end

	next_list_item ; POKEMANIAC (5) Route 43
	db "Ben@", TRAINERTYPE_NORMAL
	db 5
	dw SLOWBRO
	db 5
	dw SUDOWOODO
	db 6
	dw QWILFISH
	db -1 ; end

	next_list_item ; POKEMANIAC (6) Route 43
	db "Brent@", TRAINERTYPE_NORMAL
	db 5
	dw LICKITUNG
	db 7
	dw MR__MIME
	db 5
	dw CHANSEY
	db -1 ; end

	next_list_item ; POKEMANIAC (7) Route 43
	db "Ron@", TRAINERTYPE_NORMAL
	db 4
	dw HITMONLEE
	db 5
	dw WOBBUFFET
	db 9
	dw NIDOKING
	db -1 ; end

	next_list_item ; POKEMANIAC (8) Unreferenced
	db "Ethan@", TRAINERTYPE_NORMAL
	db 3
	dw RHYHORN
	db 7
	dw RHYDON
	db -1 ; end

	next_list_item ; POKEMANIAC (11) Goldenrod Underground
	db "Issac@", TRAINERTYPE_MOVES
	db 7
	dw LICKITUNG
	dw LICK, SUPERSONIC, CUT, NO_MOVE
	db -1 ; end

	next_list_item ; POKEMANIAC (12) Goldenrod Underground
	db "Donald@", TRAINERTYPE_NORMAL
	db 5
	dw SLOWPOKE
	db 5
	dw DODUO
	db -1 ; end

	next_list_item ; POKEMANIAC (13) Route 44
	db "Zach@", TRAINERTYPE_NORMAL
	db 7
	dw RHYHORN
	db 7
	dw AERODACTYL
	db 7
	dw AIPOM
	db -1 ; end

	next_list_item ; POKEMANIAC (15) Mt. Mortar
	db "Miller@", TRAINERTYPE_NORMAL
	db 9
	dw NIDOKING
	db 9
	dw NIDOQUEEN
	db -1 ; end

	next_list_item ; POKEMANIAC (16) Route 113
	db "Wyatt@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNETON
	db 7
	dw LAIRON
	db -1 ; end

	next_list_item ; POKEMANIAC (17) Route 114
	db "Wyatt@", TRAINERTYPE_NORMAL
	db 6
	dw LAIRON
	db 7
	dw VAPOREON
	db -1 ; end

	next_list_item ; POKEMANIAC (18) Route 119
	db "Donald@", TRAINERTYPE_NORMAL
	db 7
	dw BUTTERFREE
	db 7
	dw BEAUTIFLY
	db -1 ; end

	next_list_item ; POKEMANIAC (19) Route 119
	db "Taylor@", TRAINERTYPE_NORMAL
	db 7
	dw BEEDRILL
	db 7
	dw DUSTOX
	db -1 ; end

	next_list_item ; POKEMANIAC (20) Route 119
	db "Brent@", TRAINERTYPE_NORMAL
	db 7
	dw PINSIR
	db 7
	dw SCYTHER
	db -1 ; end

	next_list_item ; POKEMANIAC (21) Route 120
	db "Jeffrey@", TRAINERTYPE_NORMAL
	db 5
	dw MASQUERAIN
	db 5
	dw PORYGON2
	db -1 ; end

	end_list_items

GruntMGroupHard:
	next_list_item ; GRUNTM (1) Slowpoke Well BF1
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw KOFFING
	db 7
	dw MIGHTYENA
	db -1 ; end

	next_list_item ; GRUNTM (2) Slowpoke Well BF1
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw RATICATE
	db 6
	dw ZUBAT
	db 6
	dw CARVANHA
	db -1 ; end

	next_list_item ; GRUNTM (3) Radio Tower 1F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw RATICATE
	db 7
	dw DUSTOX
	db -1 ; end

	next_list_item ; GRUNTM (4) Radio Tower 2F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw MUK
	db 5
	dw MIGHTYENA
	db 5
	dw NUZLEAF
	db -1 ; end

	next_list_item ; GRUNTM (5) Radio Tower 2F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw SHIFTRY
	db 5
	dw SWELLOW
	db 5
	dw FURRET
	db -1 ; end

	next_list_item ; GRUNTM (6) Radio Tower 2F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 6
	dw GOLBAT
	db 6
	dw YANMA
	db -1 ; end

	next_list_item ; GRUNTM (7) Radio Tower 3F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw WEEZING
	db 5
	dw SEVIPER
	db 6
	dw GRUMPIG
	db -1 ; end

	next_list_item ; GRUNTM (8) Radio Tower 3F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw WEEZING
	db 7
	dw ZANGOOSE
	db -1 ; end

	next_list_item ; GRUNTM (9) Radio Tower 3F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw RATICATE
	db 7
	dw LINOONE
	db -1 ; end

	next_list_item ; GRUNTM (10) Radio Tower 4F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw ZUBAT
	db 6
	dw GOLBAT
	db 7
	dw SPINDA
	db -1 ; end

	next_list_item ; GRUNTM (11) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw AMUK
	db 5
	dw WEEZING
	db 6
	dw NOSEPASS
	db -1 ; end

	next_list_item ; GRUNTM (12) Unreferenced
	db "Executive@", TRAINERTYPE_NORMAL
	db 10
	dw HOUNDOUR
	db -1 ; end

	next_list_item ; GRUNTM (13) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw RATICATE
	db 5
	dw HARIYAMA
	db -1 ; end

	next_list_item ; GRUNTM (14) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	db 4
	dw RATICATE
	db 4
	dw GOLBAT
	db -1 ; end

	next_list_item ; GRUNTM (15) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	db 4
	dw AMUK
	db 7
	dw WEEZING
	db -1 ; end

	next_list_item ; GRUNTM (16) Team Rocket Base B1F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw PERSIAN
	db 5
	dw RATICATE
	db 5
	dw DUSTOX
	db 5
	dw FURRET
	db -1 ; end

	next_list_item ; GRUNTM (17) Team Rocket Base B2F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 8
	dw GOLBAT
	db 8
	dw DUSTOX
	db -1 ; end

	next_list_item ; GRUNTM (18) Team Rocket Base B2F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw RATICATE
	db 5
	dw MIGHTYENA
	db 5
	dw CACTURNE
	db -1 ; end

	next_list_item ; GRUNTM (19) Team Rocket Base B2F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw VENOMOTH
	db 7
	dw GLALIE
	db -1 ; end

	next_list_item ; GRUNTM (20) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw HYPNO
	db 5
	dw GOLBAT
	db -1 ; end

	next_list_item ; GRUNTM (21) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	db 6
	dw ZUBAT
	db 7
	dw GRIMER
	db 6
	dw RATTATA
	db -1 ; end

	next_list_item ; GRUNTM (22) Unreferenced
	db "Executive@", TRAINERTYPE_NORMAL
	db 10
	dw GOLBAT
	db -1 ; end

	next_list_item ; GRUNTM (23) Unreferenced
	db "Executive@", TRAINERTYPE_NORMAL
	db 10
	dw KOFFING
	db -1 ; end

	next_list_item ; GRUNTM (24) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw WEEZING
	db 5
	dw BANETTE
	db -1 ; end

	next_list_item ; GRUNTM (25) Goldenrod Underground
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw CACTURNE
	db 4
	dw MUK
	db -1 ; end

	next_list_item ; GRUNTM (26) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw RATTATA
	db 5
	dw RATTATA
	db -1 ; end

	next_list_item ; GRUNTM (27) Unreferenced
	db "Executive@", TRAINERTYPE_NORMAL
	db 10
	dw ZUBAT
	db -1 ; end

	next_list_item ; GRUNTM (28) Team Rocket Base B3F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 15
	dw RATICATE
	db -1 ; end

	next_list_item ; GRUNTM (29) Slowpoke Well B1F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw SEEL
	db 6
	dw CUBONE
	db -1 ; end

	next_list_item ; GRUNTM (30) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw GOLBAT
	db 5
	dw GOLBAT
	db 7
	dw ARBOK
	db -1 ; end

	next_list_item ; GRUNTM (31) Unreferenced
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw GOLBAT
	db -1 ; end

	next_list_item ; GRUNTM (32) Mount Moon 1
	db "Grunt@", TRAINERTYPE_NORMAL
	db 5
	dw GOLBAT
	db 5
	dw SANDSHREW
	db -1 ; end

	next_list_item ; GRUNTM (33) Mount Moon 2
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw EKANS
	db 7
	dw SEVIPER
	db -1 ; end

	next_list_item ; GRUNTM (34) Mount Moon 3
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw RATICATE
	db 7
	dw HOOTHOOT
	db -1 ; end

	next_list_item ; GRUNTM (35) Mount Moon 4
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw GRIMER
	db 7
	dw GULPIN
	db -1 ; end

	next_list_item ; GRUNTM (36) Safari Grunt 1
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw MUK
	db 7
	dw ZANGOOSE
	db -1 ; end

	next_list_item ; GRUNTM (37) Safari Grunt 2
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw MAROWAK
	db 7
	dw EXEGGUTOR2
	db -1 ; end

	next_list_item ; GRUNTM (38) Safari Grunt 3
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw TENTACRUEL
	db 7
	dw TENTACRUEL2
	db -1 ; end

	next_list_item ; GRUNTM (39) Safari Grunt 4
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw LICKILICKY
	db 7
	dw AMAROWAK
	db -1 ; end

	next_list_item ; GRUNTM (40) Safari Grunt 5
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw HELECTRODE
	db 7
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; GRUNTM (41) Safari Grunt 6
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw CRAWDAUNT
	db 7
	dw KINGLER
	db -1 ; end

	next_list_item ; GRUNTM (42) Safari Grunt 7
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw DUSCLOPS
	db 7
	dw VICTREEBEL
	db -1 ; end

	next_list_item ; GRUNTM (43) Rustturf Grunt 1
	db "Alex@", TRAINERTYPE_NORMAL
	db 6
	dw BALTOY
	db 7
	dw POOCHYENA
	db -1 ; end

	next_list_item ; GRUNTM (43) Rustturf Grunt 2
	db "Ryan@", TRAINERTYPE_NORMAL
	db 6
	dw LINOONE
	db 7
	dw CARVANHA
	db -1 ; end

	next_list_item ; GRUNTM (44) Mauville Grunt 1
	db "Ryan@", TRAINERTYPE_NORMAL
	db 6
	dw FURRET
	db 9
	dw SHARPEDO
	db -1 ; end

	next_list_item ; GRUNTM (45) Mauville Grunt 2
	db "Alex@", TRAINERTYPE_NORMAL
	db 6
	dw BALTOY
	db 9
	dw MIGHTYENA
	db -1 ; end

	next_list_item ; GRUNTM (46) Mauville Grunt 3
	db "Jordan@", TRAINERTYPE_NORMAL
	db 6
	dw NUMEL
	db 9
	dw ARIADOS
	db -1 ; end

	next_list_item ; GRUNTM (47) Mauville Grunt 4
	db "Frank@", TRAINERTYPE_NORMAL
	db 8
	dw MAGMAR
	db 10
	dw HUNTAIL
	db -1 ; end

	next_list_item ; GRUNTM (48) Route 121 Grunt 1
	db "Ryan@", TRAINERTYPE_NORMAL
	db 7
	dw LINOONE
	db 8
	dw SHARPEDO
	db 9
	dw DODRIO
	db -1 ; end

	next_list_item ; GRUNTM (49) Route 121 Grunt 2
	db "Alex@", TRAINERTYPE_NORMAL
	db 7
	dw MIGHTYENA
	db 8
	dw CAMERUPT
	db 9
	dw CLAYDOL	
	db -1 ; end

	next_list_item ; GRUNTM (50) Mt Pyre Grunt 1
	db "Elite@", TRAINERTYPE_NORMAL
	db 7
	dw TORKOAL
	db 7
	dw CHARIZARD
	db 10
	dw DYNABEA
	db -1 ; end

	next_list_item ; GRUNTM (51) Mt Pyre Grunt 2
	db "Elite@", TRAINERTYPE_NORMAL
	db 7
	dw MANTINE
	db 7
	dw BLASTOISE
	db 10
	dw AKUERIA
	db -1 ; end

	next_list_item ; GRUNTM (52) Mt Pyre Grunt 3
	db "Elite@", TRAINERTYPE_NORMAL
	db 7
	dw DUNSPARCE
	db 7
	dw MAROWAK
	db 10
	dw GLISCOR
	db -1 ; end

	next_list_item ; GRUNTM (53) Mt Pyre Grunt 4
	db "Elite@", TRAINERTYPE_NORMAL
	db 7
	dw DELIBIRD
	db 7
	dw DEWGONG
	db 10
	dw GLACEON
	db -1 ; end

	end_list_items

GentlemanGroupHard:
	next_list_item ; GENTLEMAN (1) Glitter Lighthouse - 3F
	db "Preston@", TRAINERTYPE_NORMAL
	db 7
	dw ARCANINE
	db 7
	dw RAPIDASH
	db -1 ; end

	next_list_item ; GENTLEMAN (2) Unreferenced
	db "Edward@", TRAINERTYPE_NORMAL
	db 7
	dw PERSIAN
	db -1 ; end

	next_list_item ; GENTLEMAN (3) Vermilion City Gym
	db "Gregory@", TRAINERTYPE_NORMAL
	db 7
	dw PIKACHU
	db 7
	dw FLAAFFY
	db -1 ; end

	next_list_item ; GENTLEMAN (4) Unreferenced
	db "Virgil@", TRAINERTYPE_NORMAL
	db 20
	dw PONYTA
	db -1 ; end

	next_list_item ; GENTLEMAN (5) Glitter Lighthouse - 2F
	db "Alfred@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw NOCTOWL
	db -1 ; end

	next_list_item ; GENTLEMAN (6) Mossdeep Gym
	db "Cliff@", TRAINERTYPE_NORMAL
	db 8
	dw GIRAFARIG
	db 8
	dw STANTLER
	db 9
	dw NOCTOWL
	db -1 ; end

	next_list_item ; GENTLEMAN (7) Mossdeep Gym
	db "Nate@", TRAINERTYPE_NORMAL
	db 8
	dw MR__MIME
	db 8
	dw GRUMPIG
	db 9
	dw XATU
	db -1 ; end

	end_list_items

SkierGroupHard:
	next_list_item ; SKIER (1) Mahogany Town Gym
	db "Roxanne@", TRAINERTYPE_NORMAL
	db 7
	dw JYNX
	db 7
	dw GLALIE
	db -1 ; end

	next_list_item ; SKIER (2) Mahogany Town Gym
	db "Clarissa@", TRAINERTYPE_NORMAL
	db 7
	dw DEWGONG
	db 7
	dw SNEASEL
	db -1 ; end

	end_list_items

TeacherGroupHard:
	next_list_item ; TEACHER (1) Route 15
	db "Colette@", TRAINERTYPE_NORMAL
	db 7
	dw CLEFAIRY
	db -1 ; end

	next_list_item ; TEACHER (2) Route 15
	db "Hillary@", TRAINERTYPE_NORMAL
	db 5
	dw AIPOM
	db 6
	dw CUBONE
	db -1 ; end

	next_list_item ; TEACHER (3) Unreferenced
	db "Shirley@", TRAINERTYPE_NORMAL
	db 5
	dw JIGGLYPUFF
	db -1 ; end

	next_list_item ; TEACHER (3) Ilex East (Jessadactyl contest party #1)
	db "Jess@", TRAINERTYPE_NORMAL
	db 7
	dw XATU
	db 7
	dw AGRIMER
	db 7
	dw LAIRON
	db 7
	dw TENTACRUEL
	db 7
	dw PRIMEAPE
	db 9
	dw GRANBULL
	db -1 ; end

	next_list_item ; TEACHER (3) Ilex East (Jessadactyl contest party #2)
	db "Jess@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw XATU
	dw KINGS_ROCK
	dw PSYCHIC_M, DRILL_PECK, WILLOWISP, DARK_PULSE
	db 10
	dw AMUK
	dw LEFTOVERS
	dw SLUDGE_BOMB, SHADOW_PUNCH, COSMIC_POWER, RECOVER
	db 10
	dw AGGRON
	dw METAL_COAT
	dw IRON_TAIL, COSMIC_POWER, ROCK_SLIDE, GUILLOTINE
	db 10
	dw TENTACRUEL
	dw MYSTIC_WATER
	dw SLUDGE_BOMB, HYDRO_PUMP, ICY_WIND, POWER_GEM
	db 10
	dw GRANBULL
	dw QUICK_CLAW
	dw CRUNCH, SWORDS_DANCE, THUNDERPUNCH, PLAY_ROUGH
	db 12
	dw ANNIHILAPE
	dw BLACKBELT_I
	dw CROSS_CHOP, SHADOW_PUNCH, FISSURE, BULK_UP
	db -1 ; end

	next_list_item ; TEACHER (6)  (Klutch contest party #1)
	db "Klutch@", TRAINERTYPE_NORMAL
	db 7
	dw RHYHORN
	db 7
	dw CHARMELEON
	db 5
	dw SWABLU
	db 7
	dw FURRET
	db 7
	dw HANAMOLE
	db 8
	dw GYARADOS
	db -1 ; end

	next_list_item ; TEACHER (7)  (Klutch contest party #2)
	db "Klutch@", TRAINERTYPE_NORMAL
	db 9
	dw RHYDON
	db 9
	dw CHARIZARD
	db 9
	dw ALTARIA
	db 10
	dw HANAMOLE
	db 10
	dw FURRET
	db 11
	dw GYARADOS
	db -1 ; end

	next_list_item ; TEACHER (8)  (Klutch contest party #3)
	db "Klutch@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw RHYPERIOR
	dw QUICK_CLAW
	dw ROCK_SLIDE, DRAGON_CLAW, DRAGON_DANCE, EARTHQUAKE
	db 10
	dw CHARIZARDX
	dw CHARCOAL
	dw FIRE_BLAST, OUTRAGE, EARTHQUAKE, AIR_CUTTER
	db 10
	dw ALTARIAX
	dw DRAGON_FANG
	dw LUSTER_PURGE, OUTRAGE, RECOVER, PERISH_SONG
	db 10
	dw HANAMOLE
	dw MIRACLE_SEED
	dw GIGA_DRAIN, DRAGONBREATH, STUN_SPORE, LEECH_SEED
	db 10
	dw FURRET2
	dw LEFTOVERS
	dw HYPER_BEAM, CRUNCH, OUTRAGE, DRAGON_DANCE
	db 11
	dw GYARADOSX
	dw AMULET_COIN
	dw WATERFALL, OUTRAGE, FIRE_FANG, THUNDER_FANG
	db -1 ; end

	next_list_item ; TEACHER (9) Sootopolis Gym
	db "Daphne@", TRAINERTYPE_NORMAL
	db 8
	dw GYARADOS
	db 8
	dw PELIPPER
	db -1 ; end

	next_list_item ; TEACHER (10) Sootopolis Gym
	db "Brianna@", TRAINERTYPE_NORMAL
	db 8
	dw GOREBYSS
	db 8
	dw CLOYSTER
	db -1 ; end

	end_list_items

SabrinaGroupHard:
	next_list_item ; SABRINA (1)
	db "Sabrina@", TRAINERTYPE_MOVES
	db 9
	dw SMOOCHUM
	dw POWDER_SNOW, CONFUSION, SWEET_KISS, DIZZY_PUNCH
	db 9
	dw MR__MIME
	dw BARRIER, REFLECT, BATON_PASS, CONFUSION
	db 10
	dw KADABRA
	dw CONFUSION, FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH
	db -1 ; end
	
	next_list_item ; SABRINA (2)
	db "Sabrina@", TRAINERTYPE_MOVES
	db 10
	dw JYNX
	dw ICY_WIND, PSYCHIC_M, DIZZY_PUNCH, CALM_MIND
	db 10
	dw MR__MIME
	dw BARRIER, REFLECT, BATON_PASS, PSYCHIC_M
	db 12
	dw WOBBUFFET
	dw COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	db 10
	dw LUNATONE
	dw CALM_MIND, ANCIENTPOWER, ROCK_TOMB, PSYCHIC_M
	db 12
	dw ALAKAZAM
	dw PSYCHIC_M, CALM_MIND, RECOVER, SHADOW_BALL
	db -1 ; end
	
	next_list_item ; SABRINA (3)
	db "Sabrina@", TRAINERTYPE_ITEM_MOVES
	db 11
	dw JYNX
	dw NEVERMELTICE
	dw ICY_WIND, PSYCHIC_M, DIZZY_PUNCH, CALM_MIND
	db 11
	dw MR__MIME
	dw TWISTEDSPOON
	dw BARRIER, LIGHT_SCREEN, BATON_PASS, PSYCHIC_M
	db 11
	dw WOBBUFFET
	dw LEFTOVERS
	dw COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	db 11
	dw LUNATONE
	dw MINT_BERRY
	dw CALM_MIND, REST, ROCK_TOMB, PSYCHIC_M
	db 11
	dw HYPNO
	dw MINT_BERRY
	dw CALM_MIND, REST, HYPNOSIS, DREAM_EATER
	db 13
	dw ALAKAZAMX
	dw BLACKBELT_I
	dw PSYCHIC_M, CALM_MIND, RECOVER, FOCUS_PUNCH
	db -1 ; end

	end_list_items

BugCatcherGroupHard:
	next_list_item ; BUG_CATCHER (1) Route 30
	db "Don@", TRAINERTYPE_NORMAL
	db 3
	dw CATERPIE
	db 3
	dw SURSKIT
	db -1 ; end

	next_list_item ; BUG_CATCHER (2) Viridian Forest
	db "Rob@", TRAINERTYPE_NORMAL 
	db 0
	dw WEEDLE
	db 0
	dw CATERPIE
	db -1 ; end

	next_list_item ; BUG_CATCHER (3) Viridian Forest
	db "Ed@", TRAINERTYPE_NORMAL
	db 0
	dw WEEDLE
	db 0
	dw PIDGEY
	db -1 ; end

	next_list_item ; BUG_CATCHER (4) Route 31
	db "Wade@", TRAINERTYPE_NORMAL
	db 2
	dw CATERPIE
	db 2
	dw SURSKIT
	db 3
	dw WEEDLE
	db 2
	dw WURMPLE
	db -1 ; end

	next_list_item ; BUG_CATCHER (5) Azalea Town Gym
	db "Benny@", TRAINERTYPE_NORMAL
	db 2
	dw WEEDLE
	db 4
	dw KAKUNA
	db 9
	dw BEEDRILL
	db -1 ; end

	next_list_item ; BUG_CATCHER (6) Azalea Town Gym
	db "Al@", TRAINERTYPE_NORMAL
	db 3
	dw WURMPLE
	db 3
	dw SILCOON
	db 5
	dw BEAUTIFLY
	db 5
	dw DUSTOX
	db -1 ; end

	next_list_item ; BUG_CATCHER (7) Azalea Town Gym
	db "Josh@", TRAINERTYPE_NORMAL
	db 7
	dw PARAS
	db 7
	dw YANMA
	db 7
	dw TRAPINCH
	db -1 ; end

	next_list_item ; BUG_CATCHER (8) Route 35
	db "Arnie@", TRAINERTYPE_NORMAL
	db 5
	dw VENONAT
	db 5
	dw VENONAT
	db -1 ; end

	next_list_item ; BUG_CATCHER (9) Unreferenced
	db "Ken@", TRAINERTYPE_NORMAL
	db 2
	dw ARIADOS
	db 4
	dw PINSIR
	db -1 ; end	

	next_list_item ; BUG_CATCHER (12) Viridian Forest
	db "Doug@", TRAINERTYPE_NORMAL
	db 0
	dw SPINARAK
	db -1 ; end
	
	next_list_item ; BUG_CATCHER (19) Ilex Forest
	db "Wayne@", TRAINERTYPE_NORMAL
	db 5
	dw LEDYBA
	db 6
	dw PARAS
	db -1 ; end

	next_list_item ; BUG_CATCHER (20) Mauville City Gym
	db "Angelo@", TRAINERTYPE_NORMAL
	db 10
	dw ILLUMISE
	db 10
	dw VOLBEAT
	db -1 ; end

	next_list_item ; BUG_CATCHER (21) Route 102
	db "Rick@", TRAINERTYPE_NORMAL
	db 1
	dw WURMPLE
	db 1
	dw WEEDLE
	db -1 ; end

	next_list_item ; BUG_CATCHER (22) Petalburg Woods
	db "Lyle@", TRAINERTYPE_NORMAL
	db 4
	dw PARAS
	db 5
	dw SHROOMISH
	db -1 ; end

	next_list_item ; BUG_CATCHER (23) Petalburg Woods
	db "James@", TRAINERTYPE_NORMAL
	db 4
	dw WURMPLE
	db 5
	dw WURMPLE
	db -1 ; end

	next_list_item ; BUG_CATCHER (24) Route 116
	db "Jose@", TRAINERTYPE_NORMAL
	db 5
	dw DUSTOX
	db 7
	dw PARAS
	db -1 ; end

	next_list_item ; BUG_CATCHER (25) Route 117
	db "Derek@", TRAINERTYPE_NORMAL
	db 7
	dw DUSTOX
	db 7
	dw BEAUTIFLY
	db 9
	dw DUSTOX
	db -1 ; end

	next_list_item ; BUG_CATCHER (26) Mt Moon
	db "Kent@", TRAINERTYPE_NORMAL
	db 5
	dw BEEDRILL
	db 5
	dw BUTTERFREE
	db -1 ; end

	next_list_item ; BUG_CATCHER (27) Mt Moon
	db "Robby@", TRAINERTYPE_NORMAL
	db 5
	dw CATERPIE
	db 4
	dw WEEDLE
	db 7
	dw PARAS
	db -1 ; end

	next_list_item ; BUG_CATCHER (28) Route119
	db "Kent@", TRAINERTYPE_NORMAL
	db 5
	dw PARAS
	db 8
	dw DUSTOX
	db -1 ; end

	next_list_item ; BUG_CATCHER (29) Route119
	db "Greg@", TRAINERTYPE_NORMAL
	db 6
	dw VOLBEAT
	db 6
	dw ILLUMISE
	db -1 ; end

	next_list_item ; BUG_CATCHER (30) Route119
	db "Doug@", TRAINERTYPE_NORMAL
	db 6
	dw FORRETRESS
	db 7
	dw HERACROSS
	db -1 ; end

	end_list_items

FisherGroupHard:
	next_list_item ; FISHER (1) Route 32
	db "Justin@", TRAINERTYPE_NORMAL
	db 5
	dw MAGIKARP
	db 5
	dw MAGIKARP
	db 9
	dw MAGIKARP
	db 5
	dw MAGIKARP
	db -1 ; end

	next_list_item ; FISHER (2) Route 32
	db "Ralph@", TRAINERTYPE_NORMAL
	db 7
	dw GOLDEEN
	db 7
	dw CARVANHA
	db 7
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; FISHER (3) Route 21
	db "Arnold@", TRAINERTYPE_NORMAL
	db 4
	dw TENTACRUEL
	db 4
	dw MAGNETON
	db -1 ; end

	next_list_item ; FISHER (4) Route 12
	db "Kyle@", TRAINERTYPE_NORMAL
	db 3
	dw SEAKING
	db 5
	dw MAGNETON
	db 5
	dw SEAKING
	db -1 ; end

	next_list_item ; FISHER (5) Route 32
	db "Henry@", TRAINERTYPE_NORMAL
	db 5
	dw POLIWAG
	db 5
	dw POLIWAG
	db -1 ; end

	next_list_item ; FISHER (6) Route 43
	db "Marvin@", TRAINERTYPE_NORMAL
	db 5
	dw MAGIKARP
	db 5
	dw GYARADOS
	db 7
	dw MAGIKARP
	db 7
	dw GYARADOS
	db -1 ; end

	next_list_item ; FISHER (7) Route 42
	db "Tully@", TRAINERTYPE_NORMAL
	db 8
	dw QWILFISH
	db -1 ; end

	next_list_item ; FISHER (8) Unreferenced
	db "Andre@", TRAINERTYPE_NORMAL
	db 7
	dw GYARADOS
	db -1 ; end

	next_list_item ; FISHER (9) Unreferenced
	db "Raymond@", TRAINERTYPE_NORMAL
	db 2
	dw MAGIKARP
	db 2
	dw MAGIKARP
	db 2
	dw MAGIKARP
	db 2
	dw MAGIKARP
	db -1 ; end

	next_list_item ; FISHER (10) Route 44
	db "Wilton@", TRAINERTYPE_NORMAL
	db 3
	dw GOLDEEN
	db 3
	dw GOLDEEN
	db 6
	dw SEAKING
	db -1 ; end

	next_list_item ; FISHER (11) Route 44
	db "Edgar@", TRAINERTYPE_NORMAL
	db 5
	dw REMORAID
	db 5
	dw REMORAID
	db -1 ; end

	next_list_item ; FISHER (12) Unreferenced
	db "Jonah@", TRAINERTYPE_NORMAL
	db 5
	dw SHELLDER
	db 9
	dw OCTILLERY
	db 5
	dw REMORAID
	db 9
	dw CLOYSTER
	db -1 ; end

	next_list_item ; FISHER (13) Route 12
	db "Martin@", TRAINERTYPE_NORMAL
	db 6
	dw REMORAID
	db 6
	dw REMORAID
	db -1 ; end

	next_list_item ; FISHER (14) Route 12
	db "Stephen@", TRAINERTYPE_NORMAL
	db 5
	dw MAGIKARP
	db 5
	dw MAGIKARP
	db 6
	dw QWILFISH
	db 7
	dw TENTACRUEL
	db -1 ; end

	next_list_item ; FISHER (15) Route 12
	db "Barney@", TRAINERTYPE_NORMAL
	db 2
	dw GYARADOS
	db 2
	dw GYARADOS
	db 4
	dw GYARADOS
	db -1 ; end

	next_list_item ; FISHER (21) Route 26
	db "Scott@", TRAINERTYPE_NORMAL
	db 2
	dw QWILFISH
	db 2
	dw QWILFISH
	db 6
	dw SEAKING
	db -1 ; end

	next_list_item ; FISHER (26) Route 103
	db "Andrew@", TRAINERTYPE_NORMAL
	db 7
	dw QWILFISH
	db 7
	dw GOLDEEN
	db -1 ; end

	next_list_item ; FISHER (27) Route 104
	db "Darian@", TRAINERTYPE_NORMAL
	db 3
	dw FEEBAS
	db 3
	dw TENTACOOL
	db -1 ; end

	next_list_item ; FISHER (28) Route 104
	db "Ivan@", TRAINERTYPE_NORMAL
	db 3
	dw MAGNEMITE
	db 4
	dw STARYU
	db -1 ; end

	next_list_item ; FISHER (29) Route 105
	db "Ned@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNETON
	db 7
	dw WALREIN
	db 7
	dw POLITOED
	db -1 ; end

	next_list_item ; FISHER (30) Route 105
	db "Elliot@", TRAINERTYPE_NORMAL
	db 7
	dw WAILORD
	db 7
	dw OMASTAR
	db 10
	dw DRAGONAIR
	db -1 ; end

	next_list_item ; FISHER (31) Route 110
	db "Elliot@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNETON
	db 5
	dw WHISCASH
	db 7
	dw SHARPEDO
	db -1 ; end

	next_list_item ; FISHER (32) Route 118
	db "Elliot@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNEMITE
	db 5
	dw BARBOACH
	db 7
	dw HUNTAIL
	db -1 ; end

	next_list_item ; FISHER (33) Route 114
	db "Nolan@", TRAINERTYPE_NORMAL	
	db 6
	dw WHISCASH
	db 7
	dw OCTILLERY
	db -1 ; end

	next_list_item ; FISHER (34) Route 114
	db "Kai@", TRAINERTYPE_NORMAL	
	db 7
	dw SHARPEDO
	db 6
	dw MARSHTOMP
	db -1 ; end

	next_list_item ; FISHER (34) Route 114
	db "Claude@", TRAINERTYPE_NORMAL	
	db 7
	dw SLOWBRO
	db 7
	dw WARTORTLE
	db -1 ; end

	next_list_item ; FISHER (35) Route 119
	db "Chris@", TRAINERTYPE_NORMAL	
	db 7
	dw MILOTIC
	db 7
	dw GYARADOS
	db 7
	dw TENTACRUEL
	db 8
	dw SHARPEDO
	db -1 ; end

	end_list_items

SwimmerMGroupHard:
	next_list_item ; SWIMMERM (1) Route 19
	db "Harold@", TRAINERTYPE_NORMAL
	db 6
	dw REMORAID
	db 4
	dw SEADRA
	db -1 ; end

	next_list_item ; SWIMMERM (2) Route 40
	db "Simon@", TRAINERTYPE_NORMAL
	db 3
	dw TENTACOOL
	db 5
	dw TENTACOOL
	db -1 ; end

	next_list_item ; SWIMMERM (3) Route 40
	db "Randal@", TRAINERTYPE_NORMAL
	db 3
	dw SHELLDER
	db 5
	dw WARTORTLE
	db 3
	dw SHELLDER
	db -1 ; end

	next_list_item ; SWIMMERM (4) Route 41
	db "Charlie@", TRAINERTYPE_NORMAL
	db 5
	dw SHELLDER
	db 3
	dw TENTACOOL
	db 3
	dw TENTACRUEL
	db -1 ; end

	next_list_item ; SWIMMERM (5) Route 41
	db "George@", TRAINERTYPE_NORMAL
	db 1
	dw TENTACOOL
	db 2
	dw TENTACOOL
	db 1
	dw TENTACOOL
	db 4
	dw STARYU
	db 2
	dw TENTACOOL
	db 4
	dw REMORAID
	db -1 ; end

	next_list_item ; SWIMMERM (6) Route 41
	db "Berke@", TRAINERTYPE_NORMAL
	db 8
	dw QWILFISH
	db -1 ; end

	next_list_item ; SWIMMERM (7) Route 41
	db "Kirk@", TRAINERTYPE_NORMAL
	db 3
	dw GYARADOS
	db 3
	dw GYARADOS
	db -1 ; end

	next_list_item ; SWIMMERM (8) Unreferenced
	db "Mathew@", TRAINERTYPE_NORMAL
	db 7
	dw KRABBY
	db -1 ; end

	next_list_item ; SWIMMERM (9) Unreferenced
	db "Hal@", TRAINERTYPE_NORMAL
	db 4
	dw SEEL
	db 6
	dw DEWGONG
	db 4
	dw SEEL
	db -1 ; end

	next_list_item ; SWIMMERM (10) Unreferenced
	db "Paton@", TRAINERTYPE_NORMAL
	db 6
	dw PILOSWINE
	db 6
	dw PILOSWINE
	db -1 ; end

	next_list_item ; SWIMMERM (11) Unreferenced
	db "Daryl@", TRAINERTYPE_NORMAL
	db 4
	dw SHELLDER
	db 5
	dw CLOYSTER
	db 4
	dw SHELLDER
	db -1 ; end

	next_list_item ; SWIMMERM (12) Unreferenced
	db "Walter@", TRAINERTYPE_NORMAL
	db 5
	dw HORSEA
	db 5
	dw HORSEA
	db 9
	dw SEADRA
	db -1 ; end

	next_list_item ; SWIMMERM (13) Unreferenced
	db "Tony@", TRAINERTYPE_NORMAL
	db 3
	dw STARYU
	db 8
	dw STARMIE
	db 6
	dw HORSEA
	db -1 ; end

	next_list_item ; SWIMMERM (14) Route 19
	db "Jerome@", TRAINERTYPE_NORMAL
	db 6
	dw SEADRA
	db 3
	dw TENTACOOL
	db 7
	dw TENTACRUEL
	db 6
	dw GOLDEEN
	db -1 ; end

	next_list_item ; SWIMMERM (15) Route 19
	db "Tucker@", TRAINERTYPE_NORMAL
	db 3
	dw SHELLDER
	db 6
	dw CLOYSTER
	db -1 ; end

	next_list_item ; SWIMMERM (16) Unreferenced
	db "Rick@", TRAINERTYPE_NORMAL
	db 3
	dw STARYU
	db 8
	dw STARMIE
	db 6
	dw HORSEA
	db -1 ; end

	next_list_item ; SWIMMERM (17) Route 20
	db "Cameron@", TRAINERTYPE_NORMAL
	db 7
	dw MARILL
	db -1 ; end

	next_list_item ; SWIMMERM (18) Route 21
	db "Seth@", TRAINERTYPE_NORMAL
	db 4
	dw QUAGSIRE
	db 4
	dw OCTILLERY
	db 7
	dw QUAGSIRE
	db -1 ; end

	next_list_item ; SWIMMERM (19) Unreferenced
	db "James@", TRAINERTYPE_NORMAL
	db 3
	dw STARYU
	db 8
	dw STARMIE
	db 6
	dw HORSEA
	db -1 ; end

	next_list_item ; SWIMMERM (20) Unreferenced
	db "Lewis@", TRAINERTYPE_NORMAL
	db 3
	dw STARYU
	db 8
	dw STARMIE
	db 6
	dw HORSEA
	db -1 ; end

	next_list_item ; SWIMMERM (21) Cerulean City Gym
	db "Parker@", TRAINERTYPE_NORMAL
	db 7
	dw HORSEA
	db 7
	dw WARTORTLE
	db 7
	dw SEADRA
	db -1 ; end

	next_list_item ; SWIMMERM (22) Route105
	db "Luis@", TRAINERTYPE_NORMAL
	db 10
	dw LUVDISC
	db 7
	dw SEADRA
	db 7
	dw HUNTAIL
	db -1 ; end

	next_list_item ; SWIMMERM (23) Route108
	db "Tony@", TRAINERTYPE_NORMAL
	db 8
	dw LUVDISC
	db 8
	dw GOLDUCK
	db 8
	dw SLOWKING
	db -1 ; end

	next_list_item ; SWIMMERM (24) Route108
	db "Darrin@", TRAINERTYPE_NORMAL
	db 8
	dw WHISCASH
	db 8
	dw CRAWDAUNT
	db 9
	dw LINOONE
	db -1 ; end

	end_list_items

SwimmerFGroupHard:
	next_list_item ; SWIMMERF (1) Route 40
	db "Elaine@", TRAINERTYPE_NORMAL
	db 6
	dw STARYU
	db -1 ; end

	next_list_item ; SWIMMERF (2) Route 40
	db "Paula@", TRAINERTYPE_NORMAL
	db 5
	dw STARYU
	db 5
	dw SHELLDER
	db -1 ; end

	next_list_item ; SWIMMERF (3) Route 41
	db "Kaylee@", TRAINERTYPE_NORMAL
	db 3
	dw GOLDEEN
	db 5
	dw GOLDEEN
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (4) Route 41
	db "Susie@", TRAINERTYPE_MOVES
	db 5
	dw PSYDUCK
	dw SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db 7
	dw GOLDEEN
	dw PECK, TAIL_WHIP, SUPERSONIC, HORN_ATTACK
	db -1 ; end

	next_list_item ; SWIMMERF (5) Route 41
	db "Denise@", TRAINERTYPE_NORMAL
	db 7
	dw SEEL
	db -1 ; end

	next_list_item ; SWIMMERF (6) Route 41
	db "Kara@", TRAINERTYPE_NORMAL
	db 4
	dw STARYU
	db 6
	dw STARMIE
	db -1 ; end

	next_list_item ; SWIMMERF (7) Route 41
	db "Wendy@", TRAINERTYPE_MOVES
	db 6
	dw HORSEA
	dw BUBBLE, SMOKESCREEN, LEER, WATER_GUN
	db 6
	dw HORSEA
	dw DRAGON_RAGE, SMOKESCREEN, LEER, WATER_GUN
	db -1 ; end

	next_list_item ; SWIMMERF (8) Unreferenced
	db "Lisa@", TRAINERTYPE_NORMAL
	db 8
	dw JYNX
	db -1 ; end

	next_list_item ; SWIMMERF (9) Unreferenced
	db "Jill@", TRAINERTYPE_NORMAL
	db 8
	dw DEWGONG
	db -1 ; end

	next_list_item ; SWIMMERF (10) Unreferenced
	db "Mary@", TRAINERTYPE_NORMAL
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (11) Unreferenced
	db "Katie@", TRAINERTYPE_NORMAL
	db 7
	dw DEWGONG
	db -1 ; end

	next_list_item ; SWIMMERF (12) Route 19
	db "Dawn@", TRAINERTYPE_NORMAL
	db 8
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (13) Unreferenced
	db "Tara@", TRAINERTYPE_NORMAL
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (14) Route 20
	db "Nicole@", TRAINERTYPE_NORMAL
	db 4
	dw MARILL
	db 4
	dw MARILL
	db 7
	dw LAPRAS
	db -1 ; end

	next_list_item ; SWIMMERF (15) Route 20
	db "Lori@", TRAINERTYPE_NORMAL
	db 2
	dw STARMIE
	db 2
	dw STARMIE
	db -1 ; end

	next_list_item ; SWIMMERF (16) Unreferenced
	db "Jody@", TRAINERTYPE_NORMAL
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (17) Route 21
	db "Nikki@", TRAINERTYPE_NORMAL
	db 2
	dw SEEL
	db 2
	dw SEEL
	db 3
	dw SEEL
	db 5
	dw DEWGONG
	db -1 ; end

	next_list_item ; SWIMMERF (18) Cerulean City Gym
	db "Diana@", TRAINERTYPE_NORMAL
	db 7
	dw GOLDUCK
	db 7
	dw CRAWDAUNT
	db -1 ; end

	next_list_item ; SWIMMERF (19) Cerulean City Gym
	db "Briana@", TRAINERTYPE_NORMAL
	db 5
	dw SEAKING
	db 5
	dw WHISCASH
	db -1 ; end

	next_list_item ; SWIMMERF (20) Route 105
	db "Imani@", TRAINERTYPE_NORMAL
	db 7
	dw MANTINE
	db 7
	dw GOREBYSS
	db -1 ; end

	next_list_item ; SWIMMERF (21) Route 108
	db "Denise@", TRAINERTYPE_NORMAL
	db 7
	dw PELIPPER
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (22) Route 108
	db "Beth@", TRAINERTYPE_NORMAL
	db 9
	dw WAILORD
	db 7
	dw SEALEO
	db -1 ; end

	end_list_items

SailorGroupHard:
	next_list_item ; SAILOR (1) Route 39
	db "Eugene@", TRAINERTYPE_NORMAL
	db 3
	dw POLIWHIRL
	db 5
	dw RATICATE
	db 6
	dw KRABBY
	db -1 ; end

	next_list_item ; SAILOR (2) Glitter Lighthouse - 2F
	db "Huey@", TRAINERTYPE_NORMAL
	db 10
	dw POLITOED
	db 7
	dw POLIWHIRL
	db -1 ; end

	next_list_item ; SAILOR (3) Glitter Lighthouse - 3F
	db "Terrell@", TRAINERTYPE_NORMAL
	db 8
	dw POLIWHIRL
	db 8
	dw PELIPPER
	db -1 ; end

	next_list_item ; SAILOR (4) Glitter Lighthouse - 4F
	db "Kent@", TRAINERTYPE_MOVES
	db 6
	dw KRABBY
	dw BUBBLE, LEER, VICEGRIP, HARDEN
	db 8
	dw CORPHISH
	dw BUBBLEBEAM, LEER, VICEGRIP, HARDEN
	db -1 ; end

	next_list_item ; SAILOR (5) Glitter Lighthouse - 5F
	db "Ernest@", TRAINERTYPE_NORMAL
	db 6
	dw MACHOKE
	db 7
	dw PELIPPER
	db 6
	dw POLIWHIRL
	db -1 ; end

	next_list_item ; SAILOR (6) S.S. Aqua
	db "Jeff@", TRAINERTYPE_NORMAL
	db 7
	dw RATICATE
	db 7
	dw RATICATE
	db -1 ; end

	next_list_item ; SAILOR (7) Unreferenced
	db "Garrett@", TRAINERTYPE_NORMAL
	db 7
	dw KINGLER
	db -1 ; end

	next_list_item ; SAILOR (8) Unreferenced
	db "Kenneth@", TRAINERTYPE_NORMAL
	db 3
	dw MACHOP
	db 3
	dw MACHOP
	db 8
	dw POLIWRATH
	db 3
	dw MACHOP
	db -1 ; end

	next_list_item ; SAILOR (9) S.S. Aqua
	db "Stanly@", TRAINERTYPE_NORMAL
	db 1
	dw MACHOP
	db 7
	dw MACHOKE
	db 6
	dw PSYDUCK
	db -1 ; end

	next_list_item ; SAILOR (10) Route 38
	db "Harry@", TRAINERTYPE_NORMAL
	db 7
	dw WOOPER
	db -1 ; end

	next_list_item ; SAILOR (14) Dewford City Gym
	db "Brenden@", TRAINERTYPE_NORMAL	
	db 7
	dw POLIWHIRL
	db -1 ; end

	next_list_item ; SAILOR (15) Route 109
	db "Huey@", TRAINERTYPE_NORMAL	
	db 8
	dw MACHAMP
	db 9
	dw MANTINE
	db -1 ; end

	next_list_item ; SAILOR (16) Route 109
	db "Edmond@", TRAINERTYPE_NORMAL	
	db 8
	dw HITMONLEE
	db 9
	dw CORSOLA
	db -1 ; end

	next_list_item ; SAILOR (17) Route 109
	db "Ricky@", TRAINERTYPE_NORMAL	
	db 7
	dw DEWGONG
	db 8
	dw PROBOPASS
	db -1 ; end

	next_list_item ; SAILOR (18) Route 109
	db "Chandler@", TRAINERTYPE_NORMAL	
	db 8
	dw HITMONCHAN
	db 8
	dw BLASTOISE
	db -1 ; end

	end_list_items

SuperNerdGroupHard:
	next_list_item ; SUPER_NERD (1) Unreferenced
	db "Stan@", TRAINERTYPE_NORMAL
	db 7
	dw GRIMER
	db -1 ; end

	next_list_item ; SUPER_NERD (2) Goldenrod Underground
	db "Eric@", TRAINERTYPE_NORMAL
	db 4
	dw GRIMER
	db 6
	dw GULPIN
	db -1 ; end

	next_list_item ; SUPER_NERD (3) Unreferenced
	db "Gregg@", TRAINERTYPE_NORMAL
	db 5
	dw MAGNEMITE
	db 5
	dw MAGNEMITE
	db 5
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SUPER_NERD (4) Unreferenced
	db "Jay@", TRAINERTYPE_NORMAL
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db -1 ; end

	next_list_item ; SUPER_NERD (5) Unreferenced
	db "Dave@", TRAINERTYPE_NORMAL
	db 10
	dw DITTO
	db -1 ; end

	next_list_item ; SUPER_NERD (6) Route 8
	db "Sam@", TRAINERTYPE_NORMAL
	db 4
	dw GRIMER
	db 6
	dw MUK
	db -1 ; end

	next_list_item ; SUPER_NERD (7) Route 8
	db "Tom@", TRAINERTYPE_NORMAL
	db 4
	dw MAGNEMITE
	db 4
	dw MAGNEMITE
	db 4
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SUPER_NERD (8) Route 25
	db "Pat@", TRAINERTYPE_NORMAL
	db 7
	dw PORYGON
	db -1 ; end

	next_list_item ; SUPER_NERD (9) Unreferenced
	db "Shawn@", TRAINERTYPE_NORMAL
	db 2
	dw MAGNEMITE
	db 5
	dw MUK
	db 2
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SUPER_NERD (10) Goldenrod Underground
	db "Teru@", TRAINERTYPE_NORMAL
	db 4
	dw ELECTRIKE
	db 8
	dw VOLTORB
	db 3
	dw MAGNEMITE
	db 4
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SUPER_NERD (11) Unreferenced
	db "Russ@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNEMITE
	db 7
	dw MAGNEMITE
	db 7
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SUPER_NERD (12) Unreferenced
	db "Norton@", TRAINERTYPE_MOVES
	db 7
	dw PORYGON
	dw CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db -1 ; end

	next_list_item ; SUPER_NERD (13) Mt. Mortar
	db "Hugh@", TRAINERTYPE_MOVES
	db 15
	dw KINGDRA
	dw SMOKESCREEN, TWISTER, SURF, WATERFALL
	db -1 ; end

	next_list_item ; SUPER_NERD (14) Mt. Mortar
	db "Markus@", TRAINERTYPE_MOVES
	db 15
	dw SLOWPOKE
	dw CURSE, WATER_GUN, GROWL, STRENGTH
	db -1 ; end

	next_list_item ; SUPER_NERD (15) Mount Moon
	db "Jovan@", TRAINERTYPE_NORMAL
	db 5
	dw MAGNEMITE
	db 7
	dw HVOLTORB
	db -1 ; end

	next_list_item ; SUPER_NERD (16) Mount Moon
	db "Miguel@", TRAINERTYPE_NORMAL
	db 5
	dw GRIMER
	db 7
	dw VOLTORB
	db 7
	dw KOFFING
	db -1 ; end

	end_list_items

SECTION "Hard Trainer Parties 3", ROMX

Rival2GroupHard:
	next_list_item ; RIVAL2 (7) World Cup Rival
	db "?@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw FORRETRESS
	dw QUICK_CLAW
	dw LEECH_SEED, TOXIC, RECOVER, EXPLOSION
	db 12
	dw WEAVILE
	dw NEVERMELTICE
	dw ICICLE_CRASH, PURSUIT, MACH_PUNCH, PSYCHO_CUT	
	db 12
	dw AMPHAROS
	dw MAGNET
	dw THUNDERBOLT, FLASHCANNON, THUNDER_WAVE, DRAGONBREATH
	db 13
	dw XATU
	dw TWISTEDSPOON
	dw SKY_ATTACK, PSYCHIC_M, HYPNOSIS, DREAM_EATER
	db 13
	dw OCTILLERY
	dw CHARCOAL
	dw BLAST_BURN, HYDRO_PUMP, WILLOWISP, FIRE_BLAST
	db 13
	dw URSALUNA
	dw LEFTOVERS
	dw BULK_UP, EARTHQUAKE, CRUNCH, THUNDER_FANG
	db -1 ; end

	end_list_items

GuitaristGroupHard:
	next_list_item ; GUITARIST (1) Unreferenced
	db "Clyde@", TRAINERTYPE_NORMAL
	db 7
	dw ELECTABUZZ
	db -1 ; end

	next_list_item ; GUITARIST (2) Vermilion City Gym
	db "Vincent@", TRAINERTYPE_NORMAL	
	db 8
	dw VOLBEAT
	db 9
	dw ILLUMISE
	db -1 ; end

	next_list_item ; GUITARIST (3) Mauville City Gym
	db "Kirk@", TRAINERTYPE_NORMAL
	db 7
	dw ELECTRIKE
	db 7
	dw VOLTORB2
	db 9
	dw HELECTRODE
	db -1 ; end

	next_list_item ; GUITARIST (4) Mauville City Gym
	db "Shawn@", TRAINERTYPE_NORMAL
	db 9
	dw MINUN
	db 9
	dw ELECTABUZZ
	db 9
	dw RAITORA
	db -1 ; end

	next_list_item ; GUITARIST (5) Route 103
	db "Marcos@", TRAINERTYPE_NORMAL
	db 7
	dw MINUN
	db 7
	dw PLUSLE
	db -1 ; end

	next_list_item ; GUITARIST (6) Route 110
	db "Joseph@", TRAINERTYPE_NORMAL
	db 7
	dw ELECTRODE
	db 7
	dw HELECTRODE
	db -1 ; end

	next_list_item ; GUITARIST (7) Route 119
	db "Fabian@", TRAINERTYPE_NORMAL
	db 7
	dw MANECTRIC
	db 7
	dw LINOONE
	db -1 ; end

	end_list_items

HikerGroupHard:
	next_list_item ; HIKER (1) Route 33
	db "Anthony@", TRAINERTYPE_NORMAL
	db 6
	dw GEODUDE
	db 8
	dw MACHOP
	db -1 ; end

	next_list_item ; HIKER (2) Union Cave - 1F
	db "Russell@", TRAINERTYPE_NORMAL
	db 4
	dw GRAVELER
	db 6
	dw SUDOWOODO
	db 8
	dw LAIRON
	db -1 ; end

	next_list_item ; HIKER (3) Union Cave - B1F
	db "Phillip@", TRAINERTYPE_NORMAL
	db 3
	dw GEODUDE
	db 3
	dw GEODUDE
	db 5
	dw GOLEM
	db -1 ; end

	next_list_item ; HIKER (4) Union Cave - B1F
	db "Leonard@", TRAINERTYPE_NORMAL
	db 3
	dw ARON
	db 5
	dw MAKUHITA
	db -1 ; end

	next_list_item ; HIKER (6) Route 42
	db "Benjamin@", TRAINERTYPE_NORMAL
	db 4
	dw DIGLETT
	db 4
	dw NOSEPASS
	db 6
	dw DUGTRIO
	db -1 ; end

	next_list_item ; HIKER (7) Route 45
	db "Erik@", TRAINERTYPE_NORMAL
	db 4
	dw MACHOP
	db 7
	dw GRAVELER
	db 7
	dw GRUMPIG
	db -1 ; end

	next_list_item ; HIKER (8) Route 45
	db "Michael@", TRAINERTYPE_NORMAL
	db 3
	dw GEODUDE
	db 5
	dw GRAVELER
	db 5
	dw GOLEM
	db -1 ; end

	next_list_item ; HIKER (9) Route 45
	db "Parry@", TRAINERTYPE_NORMAL
	db 6
	dw ONIX
	db 5
	dw PILOSWINE
	db -1 ; end

	next_list_item ; HIKER (10) Route 45
	db "Timothy@", TRAINERTYPE_MOVES
	db 6
	dw DIGLETT
	dw MAGNITUDE, DIG, SAND_ATTACK, SLASH
	db 6
	dw DUGTRIO
	dw MAGNITUDE, DIG, SAND_ATTACK, SLASH
	db -1 ; end

	next_list_item ; HIKER (11) Route 46
	db "Bailey@", TRAINERTYPE_NORMAL
	db 3
	dw GEODUDE
	db 3
	dw GEODUDE
	db 4
	dw GEODUDE
	db 4
	dw GEODUDE
	db 5
	dw GEODUDE
	db -1 ; end

	next_list_item ; HIKER (13) Route 9
	db "TimM@", TRAINERTYPE_NORMAL
	db 3
	dw GRAVELER
	db 5
	dw GRAVELER
	db 6
	dw GRAVELER
	db -1 ; end

	next_list_item ; HIKER (14) S.S. Aqua
	db "Noland@", TRAINERTYPE_NORMAL
	db 4
	dw SANDSLASH
	db 6
	dw GOLEM
	db -1 ; end

	next_list_item ; HIKER (15) Route 9
	db "Sidney@", TRAINERTYPE_NORMAL
	db 6
	dw DUGTRIO
	db 4
	dw ONIX
	db -1 ; end

	next_list_item ; HIKER (16) Route 13
	db "Kenny@", TRAINERTYPE_NORMAL
	db 3
	dw SANDSLASH
	db 5
	dw GRAVELER
	db 6
	dw GOLEM
	db 4
	dw GRAVELER
	db -1 ; end

	next_list_item ; HIKER (17) Route 10
	db "Jim@", TRAINERTYPE_NORMAL
	db 8
	dw MACHAMP
	db -1 ; end

	next_list_item ; HIKER (18) Union Cave - 1F
	db "Daniel@", TRAINERTYPE_NORMAL
	db 6
	dw ONIX
	db 6
	dw SMOOCHUM
	db 6
	dw SABLEYE
	db -1 ; end

	next_list_item ; HIKER (23) Rustboro Gym
	db "Marc@", TRAINERTYPE_NORMAL
	db 7
	dw LILEEP
	db 7
	dw ANORITH
	db -1 ; end

	next_list_item ; HIKER (24) Route 116
	db "Clark@", TRAINERTYPE_NORMAL
	db 9
	dw AGEODUDE
	db -1 ; end

	next_list_item ; HIKER (25) Route 116
	db "Devan@", TRAINERTYPE_NORMAL
	db 7
	dw GEODUDE
	db 7
	dw DUNSPARCE
	db -1 ; end

	next_list_item ; HIKER (26) Lavaridge Gym
	db "Eli@", TRAINERTYPE_NORMAL
	db 8
	dw FLAREON
	db 10
	dw SOLROCK
	db -1 ; end

	next_list_item ; HIKER (27) Mount Moon
	db "Marcos@", TRAINERTYPE_NORMAL
	db 5
	dw GEODUDE
	db 5
	dw SANDSHREW
	db 5
	dw LUNATONE
	db -1 ; end

	next_list_item ; HIKER (28) Route 112
	db "Trent@", TRAINERTYPE_NORMAL
	db 5
	dw GEODUDE
	db 6
	dw GRAVELER
	db 7
	dw AGOLEM
	db -1 ; end

	next_list_item ; HIKER (29) Route 112
	db "Brice@", TRAINERTYPE_NORMAL
	db 5
	dw CAMERUPT
	db 6
	dw MACHOKE
	db 7
	dw NOSEPASS
	db -1 ; end

	next_list_item ; HIKER (30) Route 114
	db "Lucas@", TRAINERTYPE_NORMAL
	db 7
	dw ONIX
	db 7
	dw MACHAMP
	db 8
	dw TAUROS
	db -1 ; end

	next_list_item ; HIKER (31) Route 114
	db "Lenny@", TRAINERTYPE_NORMAL
	db 8
	dw MAROWAK
	db 7
	dw PILOSWINE
	db 8
	dw DONPHAN
	db -1 ; end

	end_list_items

BikerGroupHard:
	next_list_item ; BIKER (1)  Unreferenced
	db "Benny@", TRAINERTYPE_NORMAL
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db -1 ; end

	next_list_item ; BIKER (2) Unreferenced
	db "Kazu@", TRAINERTYPE_NORMAL
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db -1 ; end

	next_list_item ; BIKER (3) Route 8
	db "Dwayne@", TRAINERTYPE_NORMAL
	db 5
	dw KOFFING
	db 6
	dw KOFFING
	db 7
	dw KOFFING
	db 8
	dw KOFFING
	db -1 ; end

	next_list_item ; BIKER (4) Route 8
	db "Harris@", TRAINERTYPE_NORMAL
	db 7
	dw FLAREON
	db -1 ; end

	next_list_item ; BIKER (5) Route 8
	db "Zeke@", TRAINERTYPE_NORMAL
	db 6
	dw KOFFING
	db 6
	dw KOFFING
	db -1 ; end

	next_list_item ; BIKER (6) Route 17
	db "Charles@", TRAINERTYPE_NORMAL
	db 5
	dw KOFFING
	db 5
	dw CHARMELEON
	db 5
	dw WEEZING
	db -1 ; end

	next_list_item ; BIKER (7) Route 17
	db "Riley@", TRAINERTYPE_NORMAL
	db 7
	dw WEEZING
	db -1 ; end

	next_list_item ; BIKER (8) Route 17
	db "Joel@", TRAINERTYPE_NORMAL
	db 5
	dw MAGMAR
	db 5
	dw MAGMAR
	db -1 ; end

	next_list_item ; BIKER (9) Route 17
	db "Glenn@", TRAINERTYPE_NORMAL
	db 3
	dw KOFFING
	db 5
	dw MAGMAR
	db 7
	dw WEEZING
	db -1 ; end

	end_list_items

BlaineGroupHard:
	next_list_item ; BLAINE (1)
	db "Blaine@", TRAINERTYPE_MOVES
	db 7
	dw MAGCARGO
	dw ROCK_SLIDE, FIRE_BLAST, FISSURE, CURSE
	db 9
	dw MAGMAR
	dw THUNDERPUNCH, FIRE_PUNCH, SUNNY_DAY, FLAMETHROWER
	db 10
	dw RAPIDASH
	dw SUNNY_DAY, MEGAHORN, SOLARBEAM, FIRE_BLAST
	db -1 ; end
	
	next_list_item ; BLAINE (2)
	db "Blaine@", TRAINERTYPE_MOVES
	db 12
	dw NINETALES
	dw SUNNY_DAY, SHADOW_BALL, SOLARBEAM, FIRE_BLAST
	db 10
	dw MAGCARGO
	dw ROCK_SLIDE, FIRE_BLAST, FISSURE, EARTHQUAKE
	db 12
	dw RAPIDASH
	dw SUNNY_DAY, MEGAHORN, SOLARBEAM, FIRE_BLAST
	db 12
	dw MAGMORTAR
	dw THUNDERPUNCH, SOLARBEAM, SUNNY_DAY, FLAMETHROWER
	db 15
	dw MOLTRES
	dw SUNNY_DAY, SKY_ATTACK, SOLARBEAM, FIRE_BLAST
	db -1 ; end
	
	next_list_item ; BLAINE (3)
	db "Blaine@", TRAINERTYPE_ITEM_MOVES	
	db 10
	dw NINETALES
	dw LEFTOVERS
	dw SUNNY_DAY, SHADOW_BALL, SOLARBEAM, FIRE_BLAST
	db 10
	dw MAGCARGO
	dw LEFTOVERS
	dw ROCK_SLIDE, FIRE_BLAST, FISSURE, COSMIC_POWER
	db 10
	dw FLAREON
	dw CHARCOAL
	dw FLAME_WHEEL, DIG, TAKE_DOWN, BULK_UP
	db 11
	dw MAGMORTAR
	dw CHARCOAL
	dw THUNDERPUNCH, ERUPTION, MACH_PUNCH, BRICK_BREAK
	db 11
	dw RAPIDASH
	dw CHARCOAL
	dw SUNNY_DAY, FLAME_WHEEL, SOLARBEAM, FIRE_BLAST
	db 13
	dw MOLTRES
	dw FOCUS_BAND
	dw PURSUIT, SKY_ATTACK, SOLARBEAM, FIRE_BLAST
	db -1 ; end

	end_list_items

BurglarGroupHard:
	next_list_item ; BURGLAR (1) Goldenrod City - Underground Warehouse
	db "Duncan@", TRAINERTYPE_NORMAL
	db 3
	dw GROWLITHE
	db 5
	dw MAGMAR
	db 6
	dw KADABRA
	db -1 ; end

	next_list_item ; BURGLAR (2) Goldenrod City - Underground Warehouse
	db "Eddie@", TRAINERTYPE_MOVES
	db 6
	dw GROWLITHE
	dw ROAR, EMBER, LEER, TAKE_DOWN
	db 4
	dw KOFFING
	dw TACKLE, SMOG, SLUDGE, SMOKESCREEN
	db -1 ; end

	next_list_item ; BURGLAR (3) Unreferenced
	db "Corey@", TRAINERTYPE_NORMAL
	db 5
	dw KOFFING
	db 8
	dw MAGMAR
	db 5
	dw KOFFING
	db 3
	dw KOFFING
	db -1 ; end

	end_list_items

FirebreatherGroupHard:
	next_list_item ; FIREBREATHER (1) Route 03
	db "Otis@", TRAINERTYPE_NORMAL
	db 3
	dw MAGBY
	db 3
	dw KOFFING
	db -1 ; end

	next_list_item ; FIREBREATHER (2) Unreferenced
	db "Dick@", TRAINERTYPE_NORMAL
	db 7
	dw CHARMELEON
	db -1 ; end

	next_list_item ; FIREBREATHER (3) Unreferenced
	db "Ned@", TRAINERTYPE_NORMAL
	db 5
	dw KOFFING
	db 6
	dw GROWLITHE
	db 5
	dw KOFFING
	db -1 ; end

	next_list_item ; FIREBREATHER (4) Route 03
	db "Burt@", TRAINERTYPE_NORMAL
	db 3
	dw KOFFING
	db 4
	dw SLUGMA
	db -1 ; end

	next_list_item ; FIREBREATHER (5) Union Cave - 1F
	db "Bill@", TRAINERTYPE_NORMAL
	db 6
	dw KOFFING
	db 6
	dw TORCHIC
	db -1 ; end

	next_list_item ; FIREBREATHER (6) Route 35
	db "Walt@", TRAINERTYPE_NORMAL
	db 4
	dw MAGMAR
	db 6
	dw MAGMAR
	db -1 ; end

	next_list_item ; FIREBREATHER (7) Union Cave - 1F
	db "Ray@", TRAINERTYPE_NORMAL
	db 7
	dw VULPIX
	db 7
	dw PONYTA
	db -1 ; end

	next_list_item ; FIREBREATHER (8) S.S. Aqua
	db "Lyle@", TRAINERTYPE_NORMAL
	db 6
	dw KOFFING
	db 8
	dw FLAREON
	db 6
	dw KOFFING
	db -1 ; end

	next_list_item ; FIREBREATHER (9) Lavaridge Gym
	db "Jeff@", TRAINERTYPE_NORMAL
	db 7
	dw SLUGMA
	db 8
	dw QUILAVA
	db 9
	dw WEEZING
	db -1 ; end

	next_list_item ; FIREBREATHER (10) Lavaridge Gym
	db "Jace@", TRAINERTYPE_NORMAL
	db 8
	dw CHARMELEON
	db 7
	dw PONYTA
	db 9
	dw MAGMAR
	db -1 ; end

	next_list_item ; FIREBREATHER (11) Lavaridge Gym
	db "Cole@", TRAINERTYPE_NORMAL
	db 6
	dw MAGBY
	db 9
	dw VULPIX
	db 9
	dw NUMEL
	db -1 ; end

	next_list_item ; FIREBREATHER (12) Lavaridge Gym
	db "Axle@", TRAINERTYPE_NORMAL
	db 8
	dw MAGBY
	db 9
	dw VULPIX
	db 10
	dw COMBUSKEN
	db -1 ; end

	next_list_item ; FIREBREATHER (13) Lavaridge Gym
	db "Keegan@", TRAINERTYPE_NORMAL
	db 7
	dw SUNKERN
	db 9
	dw CYNDAQUIL2
	db 9
	dw BORUBEA
	db -1 ; end

	next_list_item ; FIREBREATHER (14) Route 111
	db "Hayden@", TRAINERTYPE_NORMAL
	db 7
	dw KANGASKHAN
	db 8
	dw SHUCKLE
	db 9
	dw VOLBEAT
	db -1 ; end

	next_list_item ; FIREBREATHER (15) Route 112
	db "Bryan@", TRAINERTYPE_NORMAL
	db 7
	dw MAGCARGO
	db 6
	dw NUMEL
	db 6
	dw QUILAVA
	db -1 ; end

	next_list_item ; FIREBREATHER (16) Route 114
	db "Berny@", TRAINERTYPE_NORMAL
	db 5
	dw MAGMAR
	db 6
	dw QUILAVA2
	db 7
	dw PELIPPER
	db -1 ; end

	next_list_item ; FIREBREATHER (17) Route 119
	db "Dayton@", TRAINERTYPE_NORMAL
	db 5
	dw MAGCARGO
	db 6
	dw CAMERUPT
	db 7
	dw SEAKING
	db -1 ; end

	end_list_items

JugglerGroupHard:
	next_list_item ; JUGGLER (1) Route 35
	db "Irwin@", TRAINERTYPE_NORMAL
	db 2
	dw VOLTORB
	db 4
	dw VOLTORB
	db 6
	dw VOLTORB
	db 8
	dw VOLTORB2
	db -1 ; end

	next_list_item ; JUGGLER (2) S.S. Aqua
	db "Fritz@", TRAINERTYPE_NORMAL
	db 6
	dw MR__MIME
	db 6
	dw MAGMAR
	db 6
	dw MACHOKE
	db -1 ; end

	next_list_item ; JUGGLER (3) Vermilion City Gym
	db "Horton@", TRAINERTYPE_NORMAL
	db 8
	dw VOLTORB
	db 8
	dw VOLTORB2
	db 8
	dw HVOLTORB
	db -1 ; end

	end_list_items

BlackbeltGroupHard:
	next_list_item ; BLACKBELT_T (1) Route 45
	db "Kenji@", TRAINERTYPE_NORMAL
	db 7
	dw MEDICHAM
	db 7
	dw HITMONLEE
	db 4
	dw ONIX
	db 7
	dw MACHOKE
	db -1 ; end

	next_list_item ; BLACKBELT_T (2) Cianwood City Gym
	db "Yoshi@", TRAINERTYPE_NORMAL
	db 7
	dw HITMONLEE
	db 7
	dw MEDITITE
	db -1 ; end

	next_list_item ; BLACKBELT_T (4) Cianwood City Gym
	db "Lao@", TRAINERTYPE_NORMAL
	db 7
	dw HITMONCHAN
	db 7
	dw MAKUHITA
	db -1 ; end

	next_list_item ; BLACKBELT_T (5) Cianwood City Gym
	db "Nob@", TRAINERTYPE_NORMAL
	db 5
	dw TAUROS
	db 7
	dw MACHOKE
	db -1 ; end

	next_list_item ; BLACKBELT_T (6) Mt. Mortar
	db "Kiyo@", TRAINERTYPE_NORMAL
	db 10
	dw HITMONLEE
	db 10
	dw HITMONCHAN
	db 10
	dw HITMONTOP
	db 10
	dw POLIWRATH
	db 10
	dw MEDICHAM
	db 13
	dw GALLADE
	db -1 ; end

	next_list_item ; BLACKBELT_T (7) Cianwood City Gym
	db "Lung@", TRAINERTYPE_NORMAL
	db 5
	dw MANKEY
	db 5
	dw FURRET
	db 7
	dw PRIMEAPE
	db -1 ; end

	next_list_item ; BLACKBELT_T (9) Unreferenced
	db "Wai@", TRAINERTYPE_NORMAL
	db 2
	dw MACHOKE
	db 4
	dw MACHOKE
	db 6
	dw MACHOKE
	db -1 ; end

	next_list_item ; BLACKBELT_T (10) Dewford City Gym
	db "Takao@", TRAINERTYPE_NORMAL
	db 7
	dw MACHOKE
	db 7
	dw TYROGUE
	db -1 ; end

	next_list_item ; BLACKBELT_T (11) Dewford City Gym
	db "Cristian@", TRAINERTYPE_NORMAL
	db 7
	dw MACHOKE
	db 7
	dw TYROGUE
	db -1 ; end

	next_list_item ; BLACKBELT_T (12) Route 103
	db "Marcos@", TRAINERTYPE_NORMAL
	db 7
	dw TYROGUE
	db 7
	dw COMBUSKEN
	db -1 ; end

	end_list_items

ExecutiveMGroupHard:
	next_list_item ; EXECUTIVEM (1) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_NORMAL
	db 8
	dw MIGHTYENA
	db 8
	dw WEEZING
	db 10
	dw SHIFTRY
	db 8
	dw DUSTOX
	db 8
	dw MANECTRIC
	db 12
	dw HOUNDOOM
	db -1 ; end

	next_list_item ; EXECUTIVEM (2) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_NORMAL
	db 10
	dw CROBAT
	db 10
	dw AGGRON
	db 10
	dw HARIYAMA
	db -1 ; end

	next_list_item ; EXECUTIVEM (3) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_NORMAL
	db 7
	dw ELECTRODE
	db 7
	dw MANTINE
	db 8
	dw MAGCARGO
	db 8
	dw GIRAFARIG
	db 8
	dw QUAGSIRE
	db 9
	dw SEVIPER
	db -1 ; end

	next_list_item ; EXECUTIVEM (4) Team Rocket Hideout - B3F
	db "Executive@", TRAINERTYPE_NORMAL
	db 5
	dw GOLBAT
	db 9
	dw RATICATE
	db 7
	dw SWALOT
	db 7
	dw NOCTOWL
	db 11
	dw HONCHKROW
	db -1 ; end

	next_list_item ; EXECUTIVEM (5) Goldenrod City - Radio Tower Mega
	db "Executive@", TRAINERTYPE_ITEM_MOVES	
	db 15
	dw HOUNDOOMX
	dw LEFTOVERS
	dw FIRE_BLAST, SNARL, AGILITY, SHOCKSLAM
	db -1 ; end

	end_list_items

PsychicGroupHard:
	next_list_item ; PSYCHIC_T (1) Ruins of Alph
	db "Nathan@", TRAINERTYPE_NORMAL
	db 6
	dw GIRAFARIG
	db 7
	dw UNOWN
	db 7
	dw UNOWN
	db 7
	dw UNOWN
	db -1 ; end

	next_list_item; PSYCHIC_T (2) Saffron City Gym
	db "Franklin@", TRAINERTYPE_RANDOM, 3, PSYCHIC_EASY	
	db -1 ; end

	next_list_item ; PSYCHIC_T (3) Route 11
	db "Herman@", TRAINERTYPE_NORMAL
	db 6
	dw EXEGGCUTE
	db 6
	dw EXEGGCUTE
	db 7
	dw EXEGGUTOR
	db -1 ; end

	next_list_item ; PSYCHIC_T (4) Route 11
	db "Fidel@", TRAINERTYPE_NORMAL
	db 6
	dw XATU
	db -1 ; end

	next_list_item ; PSYCHIC_T (5) Route 37
	db "Greg@", TRAINERTYPE_MOVES
	db 7
	dw DROWZEE
	dw HYPNOSIS, DISABLE, DREAM_EATER, NO_MOVE
	db -1 ; end

	next_list_item ; PSYCHIC_T (6) Route 39
	db "Norman@", TRAINERTYPE_MOVES
	db 4
	dw SLOWPOKE
	dw TACKLE, GROWL, WATER_GUN, NO_MOVE
	db 7
	dw SLOWPOKE
	dw CURSE, BODY_SLAM, WATER_GUN, CONFUSION
	db -1 ; end

	next_list_item ; PSYCHIC_T (7) Route 36
	db "Mark@", TRAINERTYPE_MOVES
	db 1
	dw ABRA
	dw TELEPORT, FLASH, NO_MOVE, NO_MOVE
	db 4
	dw ABRA
	dw TELEPORT, FLASH, NO_MOVE, NO_MOVE
	db 9
	dw KADABRA
	dw TELEPORT, KINESIS, CONFUSION, NO_MOVE
	db -1 ; end

	next_list_item ; PSYCHIC_T (8) Route 44
	db "Phil@", TRAINERTYPE_MOVES
	db 4
	dw NATU
	dw LEER, NIGHT_SHADE, FUTURE_SIGHT, CONFUSE_RAY
	db 6
	dw KADABRA
	dw DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db -1 ; end

	next_list_item ; PSYCHIC_T (9) Route 26
	db "Richard@", TRAINERTYPE_NORMAL
	db 7
	dw ESPEON
	db -1 ; end

	next_list_item ; PSYCHIC_T (10) Route 27
	db "Gilbert@", TRAINERTYPE_NORMAL
	db 7
	dw STARMIE
	db 7
	dw EXEGGCUTE
	db 7
	dw UNOWN
	db 7
	dw NOCTOWL
	db 9
	dw GIRAFARIG
	db -1 ; end

	next_list_item; PSYCHIC_T (11) Saffron City Gym
	db "Jared@", TRAINERTYPE_RANDOM, 3, PSYCHIC_EASY
	db -1 ; end

	next_list_item ; PSYCHIC_T (12) Unreferenced
	db "Rodney@", TRAINERTYPE_NORMAL
	db 5
	dw DROWZEE
	db 8
	dw HYPNO
	db -1 ; end

	next_list_item ; PSYCHIC_T (13) Route 110
	db "Edward@", TRAINERTYPE_NORMAL
	db 9
	dw MR__MIME
	db 9
	dw JYNX
	db -1 ; end

	next_list_item ; PSYCHIC_T (14) Mossdeep Gym
	db "Preston@", TRAINERTYPE_NORMAL
	db 8
	dw KADABRA
	db 9
	dw KIRLIA
	db -1 ; end

	next_list_item ; PSYCHIC_T (15) Mossdeep Gym
	db "Blake@", TRAINERTYPE_NORMAL
	db 8
	dw ARAICHU
	db 9
	dw VENOMOTH
	db -1 ; end

	next_list_item ; PSYCHIC_T (16) Mossdeep Gym
	db "Nicholas@", TRAINERTYPE_NORMAL
	db 9
	dw WOBBUFFET
	db 9
	dw UNOWN
	db -1 ; end

	next_list_item ; PSYCHIC_T (17) Mossdeep Gym
	db "Virgil@", TRAINERTYPE_NORMAL
	db 8
	dw PORYGON2
	db 9
	dw HYPNO
	db -1 ; end

	next_list_item; PSYCHIC_T (18) Saffron City Gym
	db "Franklin@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	db -1 ; end

	next_list_item; PSYCHIC_T (11) Saffron City Gym
	db "Jared@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	db -1 ; end

	end_list_items

PicnickerGroupHard:
	next_list_item ; PICNICKER (1) Route 32
	db "Liz@", TRAINERTYPE_NORMAL
	db 5
	dw NIDORAN_F
	db 5
	dw NIDORINA
	db -1 ; end

	next_list_item ; PICNICKER (2) Route 34
	db "Gina@", TRAINERTYPE_NORMAL
	db 3
	dw HOPPIP
	db 3
	dw ROSELIA
	db 5
	dw BULBASAUR
	db -1 ; end

	next_list_item ; PICNICKER (3) Route 35
	db "Brooke@", TRAINERTYPE_MOVES
	db 6
	dw PIKACHU
	dw THUNDERSHOCK, GROWL, QUICK_ATTACK, DOUBLE_TEAM
	db -1 ; end

	next_list_item ; PICNICKER (4) Route 35
	db "Kim@", TRAINERTYPE_NORMAL
	db 5
	dw VULPIX
	db -1 ; end

	next_list_item ; PICNICKER (5) Fuschia City Gym
	db "Cindy@", TRAINERTYPE_NORMAL
	db 11
	dw NIDOQUEEN
	db -1 ; end

	next_list_item ; PICNICKER (6) Route 04
	db "Hope@", TRAINERTYPE_NORMAL
	db 7
	dw FLAAFFY
	db -1 ; end

	next_list_item ; PICNICKER (7) Route 04
	db "Sharon@", TRAINERTYPE_NORMAL	
	db 5
	dw PONYTA
	db 7
	dw FURRET
	db -1 ; end

	next_list_item ; PICNICKER (8) S.S. Aqua
	db "Debra@", TRAINERTYPE_NORMAL
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; PICNICKER (9) Route 46
	db "Erin@", TRAINERTYPE_NORMAL
	db 6
	dw VULPIX
	db 6
	dw PONYTA
	db -1 ; end

	next_list_item ; PICNICKER (10) Route 9
	db "Heidi@", TRAINERTYPE_NORMAL
	db 5
	dw SKIPLOOM
	db 5
	dw SKIPLOOM
	db -1 ; end

	next_list_item ; PICNICKER (11) Route 9
	db "Edna@", TRAINERTYPE_NORMAL
	db 2
	dw NIDORINA
	db 6
	dw RAICHU
	db -1 ; end

	next_list_item ; PICNICKER (12) Route 43
	db "Tiffany@", TRAINERTYPE_MOVES
	db 12
	dw CLEFABLE
	dw ENCORE, SING, MOONBLAST, MINIMIZE
	db -1 ; end

	next_list_item ; PICNICKER (13) Celadon City Gym
	db "Tanya@", TRAINERTYPE_NORMAL
	db 7
	dw EXEGGUTOR
	db -1 ; end

	next_list_item ; PICNICKER (14) Route 117
	db "Maria@", TRAINERTYPE_NORMAL
	db 10
	dw DELCATTY
	db -1 ; end

	next_list_item ; PICNICKER (15) Route 117
	db "Melina@", TRAINERTYPE_NORMAL
	db 9
	dw LINOONE
	db 9
	dw SWELLOW
	db -1 ; end

	next_list_item ; PICNICKER (16) Route 111
	db "Celina@", TRAINERTYPE_NORMAL
	db 7
	dw NIDOQUEEN
	db 5
	dw MILTANK
	db -1 ; end

	next_list_item ; PICNICKER (17) Route 111
	db "Bianca@", TRAINERTYPE_NORMAL
	db 7
	dw MEGANIUM
	db 8
	dw AMAROWAK
	db -1 ; end

	next_list_item ; PICNICKER (18) Route 111
	db "Gabby@", TRAINERTYPE_NORMAL
	db 7
	dw LINOONE
	db 7
	dw PINSIR
	db -1 ; end

	next_list_item ; PICNICKER (19) Route 111
	db "Irene@", TRAINERTYPE_NORMAL
	db 7
	dw MISDREAVUS
	db 7
	dw PILOSWINE
	db -1 ; end

	next_list_item ; PICNICKER (20) Fortree Gym
	db "Ashley@", TRAINERTYPE_NORMAL
	db 9
	dw SWABLU
	db 9
	dw DELIBIRD
	db -1 ; end

	next_list_item ; PICNICKER (21) Route 112
	db "Carol@", TRAINERTYPE_NORMAL
	db 6
	dw ALTARIA
	db 7
	dw LUDICOLO
	db -1 ; end

	next_list_item ; PICNICKER (22) Route 113
	db "Maddie@", TRAINERTYPE_NORMAL
	db 6
	dw ALTARIA
	db 7
	dw CAMERUPT
	db -1 ; end

	next_list_item ; PICNICKER (23) Route 113
	db "Sophie@", TRAINERTYPE_NORMAL
	db 6
	dw AZUMARILL
	db 7
	dw LUDICOLO
	db -1 ; end

	next_list_item ; PICNICKER (24) Route 114
	db "Charlote@", TRAINERTYPE_NORMAL
	db 7
	dw IVYSAUR
	db 8
	dw MEGANIUM
	db -1 ; end

	next_list_item ; PICNICKER (25) Route 114
	db "Nancy@", TRAINERTYPE_NORMAL
	db 6
	dw VOLBEAT
	db 8
	dw ROSELIA
	db -1 ; end

	next_list_item ; PICNICKER (26) Route 114
	db "Angelina@", TRAINERTYPE_NORMAL
	db 6
	dw FLAAFFY
	db 8
	dw ARAICHU
	db -1 ; end

	next_list_item ; PICNICKER (27) Lavaridge Desert
	db "Heidi@", TRAINERTYPE_NORMAL
	db 6
	dw CLAYDOL
	db 7
	dw SANDSLASH
	db -1 ; end

	next_list_item ; PICNICKER (28) Lavaridge Desert
	db "Becky@", TRAINERTYPE_NORMAL
	db 7
	dw NIDOQUEEN
	db 6
	dw AZUMARILL
	db -1 ; end

	next_list_item ; PICNICKER (29) Lavaridge Desert
	db "Celia@", TRAINERTYPE_NORMAL
	db 7
	dw AMAROWAK
	db 7
	dw MAROWAK
	db -1 ; end

	end_list_items

CamperGroupHard:
	next_list_item ; CAMPER (1) Route 32
	db "Roland@", TRAINERTYPE_NORMAL
	db 3
	dw NIDORAN_M
	db 3
	dw SENTRET
	db -1 ; end

	next_list_item ; CAMPER (2) Route 34
	db "Todd@", TRAINERTYPE_NORMAL
	db 4
	dw GOLDUCK
	db 4
	dw RALTS
	db -1 ; end

	next_list_item ; CAMPER (3) Route 35
	db "Ivam@", TRAINERTYPE_NORMAL
	db 4
	dw DIGLETT
	db 4
	dw ZUBAT
	db 7
	dw DIGLETT
	db -1 ; end

	next_list_item ; CAMPER (4) Route 35
	db "Elliot@", TRAINERTYPE_NORMAL
	db 3
	dw SANDSHREW
	db 5
	dw MARILL
	db -1 ; end

	next_list_item ; CAMPER (5) Fuschia City Gym
	db "Barry@", TRAINERTYPE_NORMAL
	db 11
	dw NIDOKING
	db -1 ; end

	next_list_item ; CAMPER (6) Route 25
	db "Lloyd@", TRAINERTYPE_NORMAL
	db 6
	dw NIDORINO
	db -1 ; end

	next_list_item ; CAMPER (7) Route 9
	db "Dean@", TRAINERTYPE_NORMAL
	db 6
	dw GOLDUCK
	db 4
	dw SANDSLASH
	db -1 ; end

	next_list_item ; CAMPER (8) Route 9
	db "Sid@", TRAINERTYPE_NORMAL
	db 2
	dw DUGTRIO
	db 7
	dw PRIMEAPE
	db 7
	dw POLIWRATH
	db -1 ; end

	next_list_item ; CAMPER (9) Unreferenced
	db "Harvey@", TRAINERTYPE_NORMAL
	db 5
	dw NIDORINO
	db -1 ; end

	next_list_item ; CAMPER (10) Unreferenced
	db "Dale@", TRAINERTYPE_NORMAL
	db 5
	dw NIDORINO
	db -1 ; end

	next_list_item ; CAMPER (11) Route 46
	db "Ted@", TRAINERTYPE_NORMAL
	db 7
	dw MANKEY
	db -1 ; end

	next_list_item ; CAMPER (14) Unreferenced
	db "Thomas@", TRAINERTYPE_NORMAL
	db 3
	dw GRAVELER
	db 6
	dw GRAVELER
	db 8
	dw GOLBAT
	db 8
	dw GOLDUCK
	db -1 ; end

	next_list_item ; CAMPER (15) Unreferenced
	db "Leroy@", TRAINERTYPE_NORMAL
	db 3
	dw GRAVELER
	db 6
	dw GRAVELER
	db 8
	dw GOLBAT
	db 8
	dw GOLDUCK
	db -1 ; end

	next_list_item ; CAMPER (16) Unreferenced
	db "David@", TRAINERTYPE_NORMAL
	db 3
	dw GRAVELER
	db 6
	dw GRAVELER
	db 8
	dw GOLBAT
	db 8
	dw GOLDUCK
	db -1 ; end

	next_list_item ; CAMPER (17) Unreferenced
	db "John@", TRAINERTYPE_NORMAL
	db 3
	dw GRAVELER
	db 6
	dw GRAVELER
	db 8
	dw GOLBAT
	db 8
	dw GOLDUCK
	db -1 ; end

	next_list_item ; CAMPER (18) Pewter City Gym
	db "Jerry@", TRAINERTYPE_NORMAL
	db 7
	dw SANDSHREW
	db 7
	dw KABUTO
	db -1 ; end

	next_list_item ; CAMPER (19) Route 43
	db "Spencer@", TRAINERTYPE_NORMAL
	db 3
	dw SANDSHREW
	db 5
	dw SANDSLASH
	db 4
	dw ZUBAT
	db -1 ; end

	next_list_item ; CAMPER (22) Unreferenced
	db "Quentin@", TRAINERTYPE_NORMAL
	db 2
	dw FEAROW
	db 3
	dw PRIMEAPE
	db 5
	dw TAUROS
	db -1 ; end

	next_list_item ; CAMPER (23) Route 104
	db "Winston@", TRAINERTYPE_NORMAL
	db 3
	dw LINOONE
	db -1 ; end

	next_list_item ; CAMPER (24) Route 117
	db "Dylan@", TRAINERTYPE_NORMAL
	db 7
	dw DODRIO
	db 7
	dw CRAWDAUNT
	db -1 ; end

	next_list_item ; CAMPER (25) Route 108
	db "Dylan@", TRAINERTYPE_NORMAL
	db 7
	dw DONPHAN
	db 7
	dw GIRAFARIG
	db 8
	dw OCTILLERY
	db -1 ; end

	next_list_item ; CAMPER (26) Route 111
	db "Tyron@", TRAINERTYPE_NORMAL
	db 7
	dw TOGETIC
	db 8
	dw MURKROW
	db -1 ; end

	next_list_item ; CAMPER (27) Route 111
	db "Travis@", TRAINERTYPE_NORMAL
	db 7
	dw GLIGAR
	db 9
	dw CACTURNE
	db -1 ; end

	next_list_item ; CAMPER (28) Fortree Gym
	db "Flint@", TRAINERTYPE_NORMAL
	db 9
	dw CROBAT
	db 9
	dw XATU
	db -1 ; end

	next_list_item ; CAMPER (29) Route 112
	db "Larry@", TRAINERTYPE_NORMAL
	db 7
	dw SHIFTRY
	db 6
	dw SWELLOW
	db -1 ; end

	next_list_item ; CAMPER (30) Route 113
	db "Jaylen@", TRAINERTYPE_NORMAL
	db 5
	dw VIBRAVA
	db 6
	dw RATICATE
	db -1 ; end

	next_list_item ; CAMPER (31) Route 113
	db "Lung@", TRAINERTYPE_NORMAL
	db 5
	dw WEEZING
	db 6
	dw MAGMAR
	db -1 ; end

	next_list_item ; CAMPER (32) Route 113
	db "Lawry@", TRAINERTYPE_NORMAL
	db 5
	dw CLAYDOL
	db 6
	dw SANDSLASH
	db -1 ; end

	next_list_item ; CAMPER (33) Route 114
	db "Shane@", TRAINERTYPE_NORMAL
	db 7
	dw URSARING
	db 7
	dw ASANDSLASH
	db -1 ; end

	next_list_item ; CAMPER (34) Lavaridge Desert
	db "Beau@", TRAINERTYPE_NORMAL	
	db 7
	dw VIBRAVA
	db 6
	dw DUGTRIO
	db -1 ; end

	next_list_item ; CAMPER (35) Lavaridge Desert
	db "Drew@", TRAINERTYPE_NORMAL	
	db 6
	dw SUDOWOODO
	db 7
	dw NIDOKING	
	db -1 ; end

	next_list_item ; CAMPER (36) Lavaridge Desert
	db "Branden@", TRAINERTYPE_NORMAL	
	db 7
	dw SKARMORY
	db 7
	dw STEELIX	
	db -1 ; end

	end_list_items

ExecutiveFGroupHard:
	next_list_item ; EXECUTIVEF (1) Goldenrod City - Radio Tower
	db "Executive@", TRAINERTYPE_MOVES
	db 8
	dw ARBOK
	dw WRAP, POISON_STING, BITE, GLARE
	db 9
	dw VILEPLUME
	dw ABSORB, SWEET_SCENT, SLEEP_POWDER, ACID
	db 10
	dw HONCHKROW
	dw DRILL_PECK, PURSUIT, HAZE, NIGHT_SHADE
	db -1 ; end

	next_list_item ; EXECUTIVEF (2) Unreferenced
	db "Executive@", TRAINERTYPE_MOVES
	db 9
	dw ARBOK
	dw WRAP, LEER, POISON_STING, BITE
	db 9
	dw GLOOM
	dw ABSORB, SWEET_SCENT, SLEEP_POWDER, ACID
	db 10
	dw MURKROW
	dw PECK, PURSUIT, HAZE, NO_MOVE
	db -1 ; end

	next_list_item ; EXECUTIVEF (3) Safari Zone Executive
	db "Executive@", TRAINERTYPE_NORMAL
	db 9
	dw RHYDON
	db 9
	dw VILEPLUME
	db 9
	dw EXEGGUTOR
	db 9
	dw DYNABEA
	db 9
	dw FERALIGATR2
	db 12
	dw ABSOLX
	db -1 ; end

	next_list_item ; EXECUTIVEF (4) Mauville Game Corner Executive
	db "Jane@", TRAINERTYPE_NORMAL
	db 7
	dw MURKROW
	db 8
	dw IVYSAUR
	db 9
	dw YANMA
	db 9
	dw GOREBYSS
	db 12
	dw OCTILLERY
	db -1 ; end

	end_list_items

SageGroupHard:
	next_list_item ; SAGE (1) Sprout Tower - 1F
	db "Chow@", TRAINERTYPE_NORMAL
	db 3
	dw BELLSPROUT
	db 3
	dw BULBASAUR
	db 3
	dw CHIKORITA
	db -1 ; end

	next_list_item ; SAGE (2) Sprout Tower - 2F
	db "Nico@", TRAINERTYPE_NORMAL
	db 3
	dw BELLSPROUT
	db 3
	dw CHIKORITA
	db 3
	dw BELLSPROUT
	db -1 ; end

	next_list_item ; SAGE (3) Unreferenced
	db "Jin@", TRAINERTYPE_NORMAL
	db 6
	dw BELLSPROUT
	db -1 ; end

	next_list_item ; SAGE (4) Sprout Tower - 3F
	db "Troy@", TRAINERTYPE_NORMAL
	db 3
	dw BELLSPROUT
	db 5
	dw HOOTHOOT
	db -1 ; end

	next_list_item ; SAGE (5) Unreferenced
	db "Jeffrey@", TRAINERTYPE_NORMAL
	db 7
	dw HAUNTER
	db -1 ; end

	next_list_item ; SAGE (6) Ecruteak City Gym
	db "Ping@", TRAINERTYPE_NORMAL
	db 7
	dw BELLSPROUT
	db 7
	dw CUBONE
	db 7
	dw VULPIX
	db 7
	dw GASTLY
	db -1 ; end

	next_list_item ; SAGE (7) Sprout Tower - 2F
	db "Edmond@", TRAINERTYPE_NORMAL
	db 3
	dw BELLSPROUT
	db 3
	dw HOPPIP
	db 4
	dw BELLSPROUT
	db -1 ; end

	next_list_item ; SAGE (8) Sprout Tower - 3F
	db "Neal@", TRAINERTYPE_NORMAL
	db 7
	dw BELLSPROUT
	db -1 ; end

	next_list_item ; SAGE (9) Sprout Tower - 3F
	db "Li@", TRAINERTYPE_NORMAL
	db 4
	dw BELLSPROUT
	db 4
	dw SPINARAK
	db 5
	dw BELLSPROUT
	db 7
	dw HOOTHOOT
	db -1 ; end

	next_list_item ; SAGE (10) Tin Tower 1F
	db "Gaku@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw FLAREON
	db -1 ; end

	next_list_item ; SAGE (11) Tin Tower 1F
	db "Masa@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw JOLTEON
	db -1 ; end

	next_list_item ; SAGE (12) Tin Tower 1F
	db "Koji@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw VAPOREON
	db -1 ; end

	end_list_items

MediumGroupHard:
	next_list_item ; MEDIUM (1) Ecruteak City Gym
	db "Martha@", TRAINERTYPE_NORMAL
	db 5
	dw GASTLY
	db 7
	dw HAUNTER
	db 7
	dw UNOWN
	db -1 ; end

	next_list_item ; MEDIUM (2) Ecruteak City Gym
	db "Grace@", TRAINERTYPE_NORMAL
	db 7
	dw HAUNTER
	db 7
	dw HAUNTER
	db -1 ; end

	next_list_item ; MEDIUM (3) Unreferenced
	db "Bethany@", TRAINERTYPE_NORMAL
	db 5
	dw HAUNTER
	db -1 ; end

	next_list_item ; MEDIUM (4) Unreferenced
	db "Margret@", TRAINERTYPE_NORMAL
	db 5
	dw HAUNTER
	db -1 ; end

	next_list_item ; MEDIUM (5) Unreferenced
	db "Ethel@", TRAINERTYPE_NORMAL
	db 5
	dw HAUNTER
	db -1 ; end

	next_list_item; MEDIUM (6) Saffron City Gym
	db "Rebecca@", TRAINERTYPE_RANDOM, 3, PSYCHIC_EASY
	db -1 ; end

	next_list_item; MEDIUM (7) Saffron City Gym
	db "Doris@", TRAINERTYPE_RANDOM, 3, PSYCHIC_EASY
	db -1 ; end

	next_list_item ; MEDIUM (8) Route 117
	db "Brandi@", TRAINERTYPE_NORMAL
	db 7
	dw KIRLIA
	db 8
	dw GRUMPIG
	db 8
	dw XATU
	db -1 ; end

	next_list_item; MEDIUM (9) Saffron City Gym
	db "Rebecca@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	db -1 ; end

	next_list_item; MEDIUM (10) Saffron City Gym
	db "Doris@", TRAINERTYPE_RANDOM, 3, PSYCHIC_MEDIUM
	db -1 ; end

	end_list_items

BoarderGroupHard:
	next_list_item ; BOARDER (1) Mahogany Town Gym
	db "Ronald@", TRAINERTYPE_NORMAL
	db 7
	dw SEEL
	db 7
	dw DEWGONG
	db 7
	dw DELIBIRD
	db -1 ; end

	next_list_item ; BOARDER (2) Mahogany Town Gym
	db "Brad@", TRAINERTYPE_NORMAL
	db 7
	dw SWINUB
	db 7
	dw SWINUB
	db -1 ; end

	next_list_item ; BOARDER (3) Mahogany Town Gym
	db "Douglas@", TRAINERTYPE_NORMAL
	db 7
	dw SHELLDER
	db 7
	dw CLOYSTER
	db 7
	dw AZUMARILL
	db -1 ; end

	end_list_items

PokefanMGroupHard:
	next_list_item ; POKEFANM (1) National Park
	db "William@", TRAINERTYPE_ITEM
	db 4
	dw RAICHU
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (2) Route 39
	db "Derek@", TRAINERTYPE_ITEM
	db 7
	dw PIKACHU
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (3) Route 10
	db "Robert@", TRAINERTYPE_ITEM
	db 6
	dw QUAGSIRE
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (4) Route 13
	db "Joshua@", TRAINERTYPE_ITEM
	db 3
	dw PIKACHU
	dw BERRY
	db 3
	dw PIKACHU
	dw BERRY
	db 4
	dw PIKACHU
	dw BERRY
	db 5
	dw PIKACHU
	dw BERRY
	db 5
	dw PIKACHU
	dw BERRY
	db 5
	dw PIKACHU
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (5) Route 14
	db "Carter@", TRAINERTYPE_ITEM
	db 3
	dw BULBASAUR
	dw BERRY
	db 3
	dw CHARMANDER
	dw BERRY
	db 3
	dw SQUIRTLE
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (6) Unreferenced
	db "Trevor@", TRAINERTYPE_ITEM
	db 5
	dw PSYDUCK
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (7) Route 34
	db "Brandon@", TRAINERTYPE_ITEM
	db 4
	dw SNUBBULL
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (8) Unreferenced
	db "Jeremy@", TRAINERTYPE_ITEM
	db 8
	dw MEOWTH
	dw BERRY
	db 8
	dw MEOWTH
	dw BERRY
	db 8
	dw MEOWTH
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (9) S.S. Aqua
	db "Colin@", TRAINERTYPE_ITEM
	db 7
	dw DELIBIRD
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (12) Route 13
	db "Alex@", TRAINERTYPE_ITEM
	db 7
	dw NIDOKING
	dw BERRY
	db 7
	dw SLOWKING
	dw BERRY
	db 7
	dw SEAKING
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (13) Route 6
	db "Rex@", TRAINERTYPE_ITEM
	db 5
	dw PHANPY
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (14) Route 6
	db "Allan@", TRAINERTYPE_ITEM
	db 5
	dw TEDDIURSA
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (15) Route 103
	db "Miguel@", TRAINERTYPE_ITEM
	db 7
	dw TRAPINCH
	dw BERRY
	db 7
	dw SPOINK
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (16) Route 117
	db "Isaac@", TRAINERTYPE_ITEM
	db 5
	dw URSARING
	dw BERRY
	db 5
	dw LAIRON
	dw BERRY
	db 5
	dw SWELLOW
	dw BERRY
	db 5
	dw MAGMAR
	dw BERRY
	db 9
	dw CLEFAIRY
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (17) Route 110
	db "Kaleb@", TRAINERTYPE_ITEM
	db 7
	dw ARAICHU
	dw BERRY
	db 7
	dw WIGGLYTUFF
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (18) Route 110
	db "Edwin@", TRAINERTYPE_ITEM
	db 7
	dw CLEFABLE
	dw BERRY
	db 7
	dw KLEAVOR
	dw BERRY
	db -1 ; end

	end_list_items

KimonoGirlGroupHard:
	next_list_item ; KIMONO_GIRL (1) Unreferenced
	db "Naoko@", TRAINERTYPE_NORMAL
	db 7
	dw SKIPLOOM
	db 7
	dw VULPIX
	db 5
	dw SKIPLOOM
	db -1 ; end

	next_list_item ; KIMONO_GIRL (2) Ecruteak City
	db "Naoko@", TRAINERTYPE_NORMAL
	db 5
	dw QUILAVA
	db 6
	dw QUILAVA2
	db 8
	dw FLAREON
	db -1 ; end

	next_list_item ; KIMONO_GIRL (3) Ecruteak City
	db "Sayo@", TRAINERTYPE_NORMAL
	db 5
	dw NATU
	db 6
	dw SPOINK
	db 8
	dw ESPEON
	db -1 ; end

	next_list_item ; KIMONO_GIRL (4) Ecruteak City
	db "Zuki@", TRAINERTYPE_NORMAL
	db 5
	dw UNOWN
	db 6
	dw NUZLEAF
	db 8
	dw UMBREON
	db -1 ; end

	next_list_item ; KIMONO_GIRL (5) Ecruteak City
	db "Kuni@", TRAINERTYPE_NORMAL
	db 5
	dw WINGULL
	db 6
	dw CHINCHOU
	db 8
	dw VAPOREON
	db -1 ; end

	next_list_item ; KIMONO_GIRL (6) Ecruteak City
	db "Miki@", TRAINERTYPE_NORMAL
	db 5
	dw PLUSLE
	db 6
	dw MINUN
	db 8
	dw JOLTEON
	db -1 ; end

	end_list_items

TwinsGroupHard:
	next_list_item ; TWINS (1) Azalea Town Gym
	db "Amy & May@", TRAINERTYPE_NORMAL
	db 7
	dw SPINARAK
	db 7
	dw LEDYBA
	db -1 ; end

	next_list_item ; TWINS (2) Route 37
	db "Ann & Anne@", TRAINERTYPE_MOVES
	db 7
	dw CLEFAIRY
	dw GROWL, ENCORE, DOUBLESLAP, METRONOME
	db 7
	dw JIGGLYPUFF
	dw SING, DEFENSE_CURL, POUND, DISABLE
	db -1 ; end

	next_list_item ; TWINS (3) Route 37
	db "Ann & Anne@", TRAINERTYPE_MOVES
	db 7
	dw JIGGLYPUFF
	dw SING, DEFENSE_CURL, POUND, DISABLE
	db 7
	dw CLEFAIRY
	dw GROWL, ENCORE, DOUBLESLAP, METRONOME
	db -1 ; end

	next_list_item ; TWINS (4) Azalea Town Gym
	db "Amy & May@", TRAINERTYPE_NORMAL
	db 7
	dw LEDYBA
	db 7
	dw SPINARAK
	db -1 ; end

	next_list_item ; TWINS (5) Celadon City Gym
	db "Jo & Zoe@", TRAINERTYPE_NORMAL
	db 7
	dw WEEPINBELL
	db 7
	dw VILEPLUME
	db -1 ; end

	next_list_item ; TWINS (6) Celadon City Gym
	db "Jo & Zoe@", TRAINERTYPE_NORMAL
	db 7
	dw VILEPLUME
	db 7
	dw WEEPINBELL
	db -1 ; end

	next_list_item ; TWINS (7) S.S. Aqua
	db "Meg & Peg@", TRAINERTYPE_NORMAL
	db 7
	dw TEDDIURSA
	db 7
	dw PHANPY
	db -1 ; end

	next_list_item ; TWINS (8) S.S. Aqua
	db "Meg & Peg@", TRAINERTYPE_NORMAL
	db 7
	dw PHANPY
	db 7
	dw TEDDIURSA
	db -1 ; end

	next_list_item ; TWINS (9) Dragon's Den
	db "Lea & Pia@", TRAINERTYPE_MOVES
	db 7
	dw DRATINI
	dw THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	db 7
	dw DRATINI
	dw THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	db -1 ; end

	next_list_item ; TWINS (10) Dragon's Den
	db "Lea & Pia@", TRAINERTYPE_MOVES
	db 7
	dw DRATINI
	dw THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	db 7
	dw DRATINI
	dw THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	db -1 ; end

	next_list_item ; TWINS (11) Route 103
	db "Amy & Liv@", TRAINERTYPE_NORMAL
	db 9
	dw ZANGOOSE
	db 9
	dw SEVIPER
	db -1 ; end

	next_list_item ; TWINS (12) Route 104
	db "Gina & Mia@", TRAINERTYPE_NORMAL
	db 4
	dw SEEDOT
	db 4
	dw LOTAD
	db -1 ; end

	next_list_item ; TWINS (13) Route 117
	db "Anna & Meg@", TRAINERTYPE_NORMAL
	db 8
	dw LINOONE
	db 8
	dw HARIYAMA
	db -1 ; end

	next_list_item ; TWINS (14) Route 108
	db "Lisa & Ria@", TRAINERTYPE_NORMAL
	db 8
	dw TENTACRUEL
	db 7
	dw CROCONAW
	db 7
	dw QWILFISH
	db 8
	dw CORSOLA
	db -1 ; end

	next_list_item ; TWINS (15) Route 113
	db "Tori & Tia@", TRAINERTYPE_NORMAL
	db 9
	dw SPINDA
	db 9
	dw SPINDA
	db -1 ; end

	end_list_items

PokefanFGroupHard:
	next_list_item ; POKEFANF (1) National Park
	db "Beverly@", TRAINERTYPE_ITEM
	db 4
	dw SNUBBULL
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (2) Route 39
	db "Ruth@", TRAINERTYPE_ITEM
	db 7
	dw PIKACHU
	dw BERRY
	db -1 ; end
	
	next_list_item ; POKEFANF (5) Unreferenced
	db "Georgia@", TRAINERTYPE_ITEM
	db 3
	dw SENTRET
	dw BERRY
	db 3
	dw SENTRET
	dw BERRY
	db 3
	dw SENTRET
	dw BERRY
	db 8
	dw FURRET
	dw BERRY
	db 3
	dw SENTRET
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (6) Route 39
	db "Jaime@", TRAINERTYPE_ITEM
	db 6
	dw MEOWTH
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (7) Route 117
	db "Lydia@", TRAINERTYPE_ITEM
	db 5
	dw PELIPPER
	dw BERRY
	db 5
	dw BRELOOM
	dw BERRY
	db 5
	dw AZUMARILL
	dw BERRY
	db 7
	dw SEAKING
	dw BERRY
	db 7
	dw DELCATTY
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (8) Route 110
	db "Isabel@", TRAINERTYPE_ITEM
	db 8
	dw PLUSLE
	dw BERRY
	db 8
	dw MINUN
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (9) Sootopolos Gym
	db "Annika@", TRAINERTYPE_ITEM
	db 7
	dw SEADRA
	dw BERRY
	db 8
	dw LUVDISC
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (10) Sootopolos Gym
	db "Bethany@", TRAINERTYPE_ITEM
	db 7
	dw PELIPPER
	dw BERRY
	db 8
	dw AZUMARILL
	dw BERRY
	db -1 ; end

	end_list_items

RedGroupHard:
	next_list_item ; RED (1)
	db "Red@", TRAINERTYPE_MOVES
	db 21
	dw PIKACHU
	dw SURF, EXTREMESPEED, SWIFT, VOLT_TACKLE
	db 15
	dw ESPEON
	dw MUD_SLAP, MEDITATE, SWIFT, PSYCHIC_M
	db 16
	dw SNORLAX
	dw AMNESIA, SNORE, REST, BODY_SLAM
	db 15
	dw VENUSAUR
	dw SUNNY_DAY, GIGA_DRAIN, SYNTHESIS, SOLARBEAM
	db 15
	dw CHARIZARD
	dw FIRE_BLAST, SKY_ATTACK, OUTRAGE, SOLARBEAM
	db 21
	dw GOROCHU
	dw DRAGON_CLAW, VOLT_TACKLE, BEAT_UP, RECOVER
	db -1 ; end

	end_list_items

BlueGroupHard:
	next_list_item ; BLUE (1)
	db "Blue@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw PIDGEOT
	dw SHARP_BEAK
	dw EXTREMESPEED, SKY_ATTACK, BODY_SLAM, STEEL_WING
	db 12
	dw ALAKAZAM
	dw TWISTEDSPOON
	dw SHADOW_BALL, RECOVER, PSYCHIC_M, FOCUS_PUNCH
	db 12
	dw RHYPERIOR
	dw QUICK_CLAW
	dw DRAGON_CLAW, SANDSTORM, STONE_EDGE, EARTHQUAKE
	db 13
	dw ARCANINE
	dw CHARCOAL
	dw PURSUIT, SWIFT, SACRED_FIRE, EXTREMESPEED
	db 13
	dw GYARADOSX
	dw LEFTOVERS
	dw DRAGON_CLAW, WATERFALL, BEAT_UP, HYPER_BEAM
	db 15
	dw ARTICUNO
	dw MIRACLEBERRY
	dw BLIZZARD, HURRICANE, PSYCHIC_M, REST
	db -1 ; end
	
	next_list_item ; BLUE (1)
	db "Blue@", TRAINERTYPE_MOVES
	db 12
	dw PIDGEOT
	dw EXTREMESPEED, SKY_ATTACK, BODY_SLAM, STEEL_WING
	db 10
	dw ALAKAZAM
	dw SHADOW_BALL, RECOVER, PSYCHIC_M, REFLECT
	db 10
	dw RHYDON
	dw DRAGONBREATH, SANDSTORM, ROCK_SLIDE, EARTHQUAKE
	db 10
	dw GYARADOS
	dw DRAGONBREATH, WATERFALL, RAIN_DANCE, HYPER_BEAM
	db 10
	dw EXEGGUTOR
	dw REST, MEGA_DRAIN, PSYCHIC_M, EGG_BOMB
	db 15
	dw ARTICUNO
	dw BLIZZARD, PSYCHIC_M, FLY, EXTREMESPEED
	db -1 ; end
	
	next_list_item ; BLUE (1)
	db "Blue@", TRAINERTYPE_MOVES
	db 12
	dw PIDGEOT
	dw EXTREMESPEED, SKY_ATTACK, BODY_SLAM, STEEL_WING
	db 12
	dw ALAKAZAM
	dw SHADOW_BALL, RECOVER, PSYCHIC_M, REFLECT
	db 12
	dw RHYDON
	dw DRAGON_CLAW, SANDSTORM, ROCK_SLIDE, EARTHQUAKE
	db 12
	dw GYARADOS
	dw DRAGON_CLAW, WATERFALL, FIRE_FANG, AQUA_JET
	db 12
	dw EXEGGUTOR
	dw REST, GIGA_DRAIN, PSYCHIC_M, EGG_BOMB
	db 15
	dw ARTICUNO
	dw BLIZZARD, PSYCHIC_M, FLY, EXTREMESPEED
	db -1 ; end

	end_list_items

OfficerGroupHard:
	next_list_item ; OFFICER (1) Route 34
	db "Keith@", TRAINERTYPE_NORMAL
	db 7
	dw GROWLITHE
	db -1 ; end

	next_list_item ; OFFICER (2) Route 35
	db "Dirk@", TRAINERTYPE_NORMAL
	db 4
	dw GROWLITHE
	db 4
	dw GROWLITHE
	db -1 ; end

	end_list_items

GruntFGroupHard:
	next_list_item ; GRUNTF (1) Slowpoke Well B1f
	db "Grunt@", TRAINERTYPE_NORMAL
	db 4
	dw ZUBAT
	db 6
	dw EKANS
	db -1 ; end

	next_list_item ; GRUNTF (2) Radio Tower 2F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 9
	dw ARBOK
	db -1 ; end

	next_list_item ; GRUNTF (3) Goldenrod Underground Exit
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw GLOOM
	db 7
	dw WEEPINBELL
	db 7
	dw CROCONAW2
	db 7
	dw TENTACRUEL2
	db -1 ; end

	next_list_item ; GRUNTF (4) Radio Tower 4F
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw EKANS
	db 7
	dw ODDISH
	db 5
	dw SEVIPER
	db 6
	dw GLOOM
	db -1 ; end

	next_list_item ; GRUNTF (5) Team Rocket Base B3F
	db "Grunt@", TRAINERTYPE_MOVES
	db 8
	dw SEVIPER
	dw WRAP, LEER, POISON_TAIL, BITE
	db 8
	dw GLOOM
	dw ABSORB, SWEET_SCENT, STUN_SPORE, SLEEP_POWDER
	db -1 ; end

	next_list_item ; GRUNTF (6) Contest Amaya #1
	db "Amaya@", TRAINERTYPE_NORMAL
	db 9
	dw PIKACHU
	db 9
	dw TRAPINCH
	db 9
	dw BELDUM
	db 9
	dw HOUNDOUR
	db 10
	dw GYARADOS
	db 10
	dw ANINETALES
	db -1 ; end

	next_list_item ; GRUNTF (7) Contest Amaya #2
	db "Amaya@", TRAINERTYPE_NORMAL
	db 7
	dw ARAICHU
	db 8
	dw FLYGON
	db 8
	dw METANG
	db 9
	dw HOUNDOOM
	db 11
	dw GYARADOS
	db 11
	dw NINETALES2
	db -1 ; end

	next_list_item ; GRUNTF (8) Contest Amaya #3
	db "Amaya@", TRAINERTYPE_NORMAL
	db 10
	dw ARAICHU
	db 10
	dw FLYGONX
	db 10
	dw METAGROSSX
	db 10
	dw HOUNDOOMX
	db 11
	dw GYARADOSX
	db 11
	dw NINETALES2
	db -1 ; end

	next_list_item ; GRUNTF (9) Safari Gruntf 1
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw ARBOK
	db 7
	dw SEVIPER
	db -1 ; end

	next_list_item ; GRUNTF (10) Safari Gruntf 2
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw PRIMEAPE
	db 7
	dw HYPNO
	db -1 ; end

	next_list_item ; GRUNTF (11) Safari Gruntf 3
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw DEWGONG
	db 7
	dw HITMONCHAN
	db -1 ; end

	next_list_item ; GRUNTF (12) Safari Gruntf 4
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw SEAKING
	db 7
	dw AERODACTYL
	db -1 ; end

	next_list_item ; GRUNTF (13) Safari Gruntf 5
	db "Grunt@", TRAINERTYPE_NORMAL
	db 7
	dw GRANBULL
	db 7
	dw MIGHTYENA
	db -1 ; end

	next_list_item ; GRUNTF (14) Rustturf Gruntf 1
	db "Lisa@", TRAINERTYPE_NORMAL
	db 6
	dw SNUBBULL
	db 7
	dw HOUNDOUR
	db -1 ; end

	next_list_item ; GRUNTF (15) Mauville Gruntf 1
	db "Lisa@", TRAINERTYPE_NORMAL
	db 6
	dw HOUNDOUR
	db 7
	dw GRANBULL
	db -1 ; end

	next_list_item ; GRUNTF (16) Mauville Gruntf 2
	db "Jamie@", TRAINERTYPE_NORMAL
	db 5
	dw CARVANHA
	db 8
	dw GOLBAT
	db -1 ; end

	next_list_item ; GRUNTF (17) Mauville Gruntf 3
	db "Jenna@", TRAINERTYPE_NORMAL
	db 6
	dw MANTINE
	db 8
	dw QUAGSIRE
	db -1 ; end

	next_list_item ; GRUNTF (18) Route 121 Gruntf 1
	db "Lisa@", TRAINERTYPE_NORMAL
	db 7
	dw HOUNDOOM
	db 8
	dw MEGANIUM
	db 9
	dw GRANBULL
	db -1 ; end

	next_list_item ; GRUNTF (19) Route 121 Gruntf 2
	db "Jamie@", TRAINERTYPE_NORMAL
	db 7
	dw SLOWKING
	db 7
	dw CROBAT
	db 8
	dw AMUK
	db -1 ; end

	next_list_item ; GRUNTF (20) Mt Pyre Gruntf 1
	db "Elite@", TRAINERTYPE_NORMAL
	db 7
	dw MANECTRIC
	db 7
	dw ELECTRODE2
	db 9
	dw AMPHAROS
	db -1 ; end

	next_list_item ; GRUNTF (21) Mt Pyre Gruntf 2
	db "Elite@", TRAINERTYPE_NORMAL
	db 7
	dw GOLDUCK
	db 7
	dw VAPOREON
	db 9
	dw SWAMPERT
	db -1 ; end

	next_list_item ; GRUNTF (22) Mt Pyre Gruntf 3
	db "Elite@", TRAINERTYPE_NORMAL
	db 7
	dw WIGGLYTUFF
	db 7
	dw CLEFABLE
	db 11
	dw SYLVEON
	db -1 ; end

	next_list_item ; GRUNTF (23) Mt Pyre Gruntf 4
	db "Elite@", TRAINERTYPE_NORMAL
	db 7
	dw IKARI
	db 7
	dw ASANDSLASH
	db 10
	dw AGGRON
	db -1 ; end

	end_list_items

MysticalmanGroupHard:
	next_list_item ; MYSTICALMAN (1) Cianwood City
	db "Eusine@", TRAINERTYPE_MOVES
	db 8
	dw HYPNO
	dw DREAM_EATER, HYPNOSIS, DISABLE, CONFUSION
	db 8
	dw GENGAR
	dw LICK, HYPNOSIS, MEAN_LOOK, CURSE
	db 10
	dw ELECTRODE2
	dw SCREECH, SONICBOOM, THUNDER, ROLLOUT
	db -1 ; end

	end_list_items

KrisGroupHard:
	next_list_item; KRIS (1) Unreferenced
	db "Kris@", TRAINERTYPE_NORMAL
	db 10
	dw CHIKORITA
	db 10
	dw CYNDAQUIL
	db 10
	dw TOTODILE
	db -1 ; end

	end_list_items


RoxanneGroupHard:
	next_list_item; ROXXANE (1) Unreferenced
	db "Roxxane@", TRAINERTYPE_NORMAL
	db 7
	dw AGEODUDE
	db 7
	dw KABUTO
	db 8
	dw NOSEPASS
	db -1 ; end

	next_list_item; ROXXANE (2) Unreferenced
	db "Roxxane@", TRAINERTYPE_NORMAL
	db 10
	dw NOSEPASS
	db 10
	dw MAGCARGO
	db 10
	dw AGOLEM
	db 10
	dw RELICANTH
	db 13
	dw AERODACTYL
	db -1 ; end

	next_list_item ; ROXXANE (3)
	db "Roxxane@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw TENTACRUEL2
	dw KINGS_ROCK
	dw SIGNAL_BEAM, ROCK_TOMB, STONE_EDGE, GIGA_DRAIN
	db 10
	dw LUNATONE
	dw FOCUS_BAND
	dw ROCK_TOMB, COSMIC_POWER, PSYCHIC_M, SANDSTORM
	db 10
	dw SOLROCK
	dw FOCUS_BAND
	dw ROCK_TOMB, COSMIC_POWER, FLAMETHROWER, SANDSTORM	
	db 10
	dw AGOLEM
	dw MAGNET
	dw THUNDERBOLT, STONE_EDGE, PROTECT, EARTHQUAKE
	db 12
	dw REGIROCK
	dw HARD_STONE
	dw SLEEP_TALK, COSMIC_POWER, REST, STONE_EDGE
	db 12
	dw PROBOPASS
	dw LEFTOVERS
	dw ROCK_TOMB, STONE_EDGE, AURA_SPHERE, SANDSTORM

	end_list_items

BrawlyGroupHard:
	next_list_item; BRAWLY (1) Unreferenced
	db "Brawly@", TRAINERTYPE_NORMAL
	db 7
	dw MACHOP
	db 8
	dw MEDITITE
	db 9
	dw MAKUHITA
	db -1 ; end

	next_list_item; BRAWLY (2) Unreferenced
	db "Brawly@", TRAINERTYPE_NORMAL
	db 9
	dw MACHOKE
	db 10
	dw MEDICHAM
	db 10
	dw HITMONCHAN
	db 10
	dw BRELOOM
	db 13
	dw BLAZIKEN
	db -1 ; end

	next_list_item ; BRAWLY (3)
	db "Brawly@", TRAINERTYPE_ITEM_MOVES	
	db 10
	dw BRELOOM
	dw MAGNET
	dw THUNDERPUNCH, MACH_PUNCH, LEAF_BLADE, DYNAMICPUNCH
	db 10
	dw STEELIX
	dw LEFTOVERS
	dw IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	db 10
	dw MEDICHAM
	dw TWISTEDSPOON
	dw ZEN_HEADBUTT, MACH_PUNCH, SHADOW_PUNCH, BULLET_PUNCH
	db 10
	dw ANNIHILAPE
	dw ICE_BERRY
	dw MACH_PUNCH, BULK_UP, SHADOW_PUNCH, EARTHQUAKE
	db 10
	dw AGGRON
	dw QUICK_CLAW
	dw ROCK_SLIDE, BRICK_BREAK, GUILLOTINE, FISSURE
	db 13
	dw BLAZIKEN
	dw BLACKBELT_I
	dw DRILL_PECK, BLAZE_KICK, HI_JUMP_KICK, DETECT	
	db -1 ; end

	end_list_items

WattsonGroupHard:
	next_list_item; WATTSON (1) Unreferenced
	db "Wattson@", TRAINERTYPE_NORMAL
	db 7
	dw HVOLTORB
	db 7
	dw MINUN
	db 7
	dw PLUSLE
	db 10
	dw MAGNETON
	db 10
	dw MANECTRIC
	db -1 ; end

	next_list_item; WATTSON (2) Unreferenced
	db "Wattson@", TRAINERTYPE_NORMAL
	db 11
	dw HELECTRODE
	db 11
	dw ELECTRODE
	db 11
	dw ELECTRODE2
	db 12
	dw MAGNEZONE
	db 15
	dw MANECTRIC
	db -1 ; end

	next_list_item ; WATTSON (3)
	db "Wattson@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw HELECTRODE
	dw MAGNET
	dw THUNDERBOLT, CHARGE, GIGA_DRAIN, THUNDER_WAVE	
	db 10
	dw MANECTRIC
	dw MAGNET
	dw SHOCKSLAM, CRUNCH, PURSUIT, THUNDER_WAVE
	db 10
	dw JOLTEON
	dw MAGNET
	dw ZAP_CANNON, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	db 12
	dw ELECTIVIRE
	dw MAGNET
	dw ZAP_CANNON, FIRE_PUNCH, DIZZY_PUNCH, THUNDERBOLT
	db 12
	dw ARAICHU
	dw KINGS_ROCK
	dw SURF, FLASHCANNON, VOLT_TACKLE, SWIFT
	db 12
	dw AMPHAROSX
	dw KINGS_ROCK
	dw FAERIEGLEAM, FLASHCANNON, CHARGE, THUNDERBOLT	
	db -1 ; end

	end_list_items

FlanneryGroupHard:
	next_list_item; FLANNERY (1) Unreferenced
	db "Flannery@", TRAINERTYPE_NORMAL
	db 9
	dw SUNFLORA
	db 10
	dw NINETALES
	db 10
	dw CAMERUPT
	db 12
	dw TORKOAL	
	db -1 ; end

	next_list_item; FLANNERY (2) Unreferenced
	db "Flannery@", TRAINERTYPE_NORMAL
	db 10
	dw SUNFLORA
	db 10
	dw NINETALES
	db 10
	dw FLAREON
	db 10
	dw CAMERUPT	
	db 12
	dw TORKOAL
	db 12
	dw BLAZIKEN
	db -1 ; end

	next_list_item ; FLANNERY (3)
	db "Flannery@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw SUNFLORA
	dw QUICK_CLAW
	dw FIRE_BLAST, SOLARBEAM, GIGA_DRAIN, STUN_SPORE	
	db 10
	dw NINETALES
	dw CHARCOAL
	dw FIRE_BLAST, SHADOW_BALL, WILLOWISP, SOLARBEAM
	db 10
	dw FLAREON
	dw CHARCOAL
	dw BODY_SLAM, SACRED_FIRE, PURSUIT, SWORDS_DANCE
	db 10
	dw TORKOAL
	dw LEFTOVERS
	dw FIRE_BLAST, FISSURE, REST, COSMIC_POWER
	db 10
	dw CHARIZARD
	dw CHARCOAL
	dw FLAMETHROWER, SKY_ATTACK, DRAGONBREATH, SWIFT
	db 12
	dw CAMERUPTX
	dw LEFTOVERS
	dw FISSURE, ERUPTION, RECOVER, AMNESIA	
	db -1 ; end

	end_list_items

NormanGroupHard:
	next_list_item; NORMAN (1) Unreferenced
	db "Norman@", TRAINERTYPE_NORMAL
	db 12
	dw LINOONE
	db 12
	dw SPINDA
	db 15
	dw DITTO
	db -1 ; end

	next_list_item; NORMAN (2) Unreferenced
	db "Norman@", TRAINERTYPE_NORMAL
	db 12
	dw LINOONE
	db 12
	dw SPINDA	
	db 12
	dw URSARING
	db 12
	dw SNORLAX
	db 17
	dw DITTO
	db -1 ; end

	next_list_item ; NORMAN (3)
	db "Norman@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw DITTO
	dw QUICK_CLAW
	dw TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE	
	db 10
	dw SPINDA
	dw PINK_BOW
	dw BELLY_DRUM, EXTREMESPEED, NO_MOVE, NO_MOVE
	db 10
	dw ARCANINE
	dw CHARCOAL
	dw BODY_SLAM, SACRED_FIRE, PURSUIT, SWORDS_DANCE
	db 10
	dw SNORLAX
	dw LEFTOVERS
	dw SLEEP_TALK, SNORE, REST, COSMIC_POWER
	db 10
	dw SNORLAX
	dw LEFTOVERS
	dw BODY_SLAM, EARTHQUAKE, REST, SLEEP_TALK
	db 12
	dw FURRET2
	dw PINK_BOW
	dw BODY_SLAM, DRAGON_CLAW, RECOVER, DRAGON_DANCE	
	db -1 ; end

	end_list_items

WinonaGroupHard:
	next_list_item; WINONA (1) Fortree Gym Easy
	db "Winona@", TRAINERTYPE_NORMAL
	db 9
	dw SWELLOW
	db 9
	dw PELIPPER
	db 10
	dw ALTARIA
	db -1 ; end

	next_list_item; WINONA (2) Fortree Gym Medium
	db "Winona@", TRAINERTYPE_NORMAL
	db 10
	dw SWELLOW
	db 10
	dw PELIPPER
	db 10
	dw SKARMORY
	db 11
	dw TROPIUS
	db 12
	dw ALTARIA
	db -1 ; end

	next_list_item; WINONA (3) Fortree Gym Hard
	db "Winona@", TRAINERTYPE_ITEM_MOVES
	db 11
	dw PELIPPER
	dw QUICK_CLAW
	dw HURRICANE, RAIN_DANCE, HYDRO_PUMP, BLIZZARD	
	db 11
	dw SWELLOW
	dw SHARP_BEAK
	dw DRILL_PECK, HURRICANE, MUD_SLAP, STEEL_WING		
	db 11
	dw SKARMORY
	dw LEFTOVERS
	dw VICEGRIP, FLY, HURRICANE, WHIRLWIND	
	db 11
	dw TROPIUS
	dw MIRACLEBERRY
	dw HURRICANE, WHIRLWIND, GIGA_DRAIN, STUN_SPORE	
	db 12
	dw TOGEKISS
	dw SHARP_BEAK
	dw HURRICANE, RAIN_DANCE, THUNDER, MIST_BALL	
	db 13
	dw ALTARIAX
	dw LEFTOVERS
	dw DRAGON_DANCE, EARTHQUAKE, PLAY_ROUGH, SKY_ATTACK	
	db -1 ; end

	end_list_items

TateLizaGroupHard:
	next_list_item; TATELIZA (1) Mossdeep Gym
	db "Tate&Liza@", TRAINERTYPE_NORMAL	
	db 10
	dw SOLROCK
	db 10
	dw LUNATONE
	db -1 ; end

	next_list_item; TATELIZA (2) Mossdeep Gym
	db "Tate&Liza@", TRAINERTYPE_NORMAL
	db 10
	dw SOLROCK
	db 10
	dw LUNATONE
	db 10
	dw GARDEVOIR
	db 10
	dw GALLADE	
	db -1 ; end

	next_list_item; TATELIZA (3) Mossdeep Gym
	db "Tate&Liza@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw SOLROCK
	dw QUICK_CLAW
	dw FIRE_BLAST, WILLOWISP, POWER_GEM, COSMIC_POWER
	db 10
	dw LUNATONE
	dw BITTER_BERRY
	dw PSYCHIC_M, FUTURE_SIGHT, MOONBLAST, REST
	db 10
	dw GARDEVOIR
	dw TWISTEDSPOON
	dw MOONBLAST, THUNDERBOLT, PSYCHIC_M, CALM_MIND
	db 10
	dw GALLADE
	dw BLACKBELT_I
	dw CROSS_CHOP, MACH_PUNCH, LEAF_BLADE, SWORDS_DANCE
	db 10
	dw CLAYDOL
	dw BURNT_BERRY
	dw EARTHPOWER, PSYCHIC_M, REST, COSMIC_POWER
	db 10
	dw CHIMECHOX
	dw LEFTOVERS
	dw FLASHCANNON, WILLOWISP, FUTURE_SIGHT, COSMIC_POWER
	db -1 ; end

	end_list_items

WallaceGroupHard:
	next_list_item; WALLACE (1) Sootopolis Gym
	db "Wallace@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw LUVDISC
	dw QUICK_CLAW
	dw SURF, RAIN_DANCE, FAERIEGLEAM, BATON_PASS
	db 10
	dw LANTURN
	dw BITTER_BERRY
	dw SURF, THUNDER, THUNDER_WAVE, ICE_BEAM
	db 10
	dw WHISCASH
	dw SOFT_SAND
	dw SURF, MUD_SHOT, EARTHQUAKE, AMNESIA
	db 11
	dw SEAKING
	dw SHARP_BEAK
	dw DRILL_PECK, WATERFALL, AGILITY, SWORDS_DANCE
	db 11
	dw KINGDRA
	dw BITTER_BERRY
	dw HYDRO_PUMP, OUTRAGE, REST, THUNDER
	db 12
	dw MILOTIC
	dw LEFTOVERS
	dw FLASHCANNON, CALM_MIND, MIST_BALL, DRAININGKISS
	db -1 ; end

	next_list_item; WALLACE (2) Sootopolis Gym
	db "Wallace@", TRAINERTYPE_ITEM_MOVES
	db 11
	dw LUVDISC
	dw QUICK_CLAW
	dw HYDRO_PUMP, RAIN_DANCE, FAERIEGLEAM, BATON_PASS
	db 11
	dw LANTURN
	dw BITTER_BERRY
	dw HYDRO_PUMP, THUNDER, THUNDER_WAVE, ICE_BEAM
	db 11
	dw WHISCASH
	dw SOFT_SAND
	dw HYDRO_PUMP, MUD_SHOT, EARTHQUAKE, AMNESIA
	db 11
	dw SEAKING
	dw SHARP_BEAK
	dw DRILL_PECK, WATERFALL, AGILITY, SWORDS_DANCE
	db 12
	dw KINGDRA
	dw BITTER_BERRY
	dw HYDRO_PUMP, OUTRAGE, REST, THUNDER
	db 13
	dw MILOTIC
	dw LEFTOVERS
	dw FLASHCANNON, CALM_MIND, MIST_BALL, DRAININGKISS
	db -1 ; end

	end_list_items

SidneyGroupHard:
	next_list_item ; SIDNEY (1)
	db "Sidney@", TRAINERTYPE_MOVES
	db 12
	dw MIGHTYENA
	dw CRUNCH, DIG, BULK_UP, SNARL
	db 12
	dw UMBREON
	dw COSMIC_POWER, TOXIC, RECOVER, SNARL
	db 12
	dw SHIFTRY
	dw STUN_SPORE, LEAF_BLADE, PURSUIT, HEAT_WAVE
	db 12
	dw SHARPEDO
	dw PURSUIT, CRUNCH, BODY_SLAM, SURF
	db 12
	dw HYPNO
	dw HYPNOSIS, DREAM_EATER, DIZZY_PUNCH, PSYCHIC_M
	db 13
	dw ABSOL
	dw DRAGON_DANCE, SKY_ATTACK, BEAT_UP, SLASH
	db -1 ; end

	next_list_item ; SIDNEY (2)
	db "Sidney@", TRAINERTYPE_ITEM_MOVES
	db 13
	dw MIGHTYENA
	dw NO_ITEM
	dw FIRE_FANG, CRUNCH, ICE_FANG, POISON_FANG
	db 13
	dw UMBREON
	dw LEFTOVERS
	dw COSMIC_POWER, SNARL, REST, MUD_SLAP
	db 13
	dw SHIFTRY
	dw MIRACLEBERRY
	dw STUN_SPORE, LEAF_BLADE, PURSUIT, HEAT_WAVE
	db 13
	dw SHARPEDO
	dw BLACKGLASSES
	dw PLAY_ROUGH, CRUNCH, BODY_SLAM, WATERFALL
	db 14
	dw HYPNO
	dw NO_ITEM
	dw HYPNOSIS, DREAM_EATER, DARK_PULSE, ICE_BEAM
	db 15
	dw ABSOLX
	dw LEFTOVERS
	dw DRAGON_DANCE, SKY_ATTACK, BEAT_UP, SLASH
	db -1 ; end

	end_list_items

PhoebeGroupHard:
	next_list_item ; PHOEBE (1)
	db "Phoebe@", TRAINERTYPE_MOVES
	db 12
	dw NINETALES
	dw SHADOW_BALL, FLAMETHROWER, DESTINY_BOND, CONFUSE_RAY
	db 12
	dw PARASECT
	dw SHADOW_FORCE, LEAF_BLADE, SLASH, STUN_SPORE
	db 12
	dw BANETTE
	dw WILLOWISP, CONFUSE_RAY, PSYCHO_CUT, SHADOW_CLAW
	db 12
	dw UNOWN
	dw GLARE, CURSE, COSMIC_POWER, SHADOW_BALL
	db 12
	dw MISDREAVUS
	dw WILLOWISP, CONFUSE_RAY, MEAN_LOOK, PAIN_SPLIT
	db 13
	dw DUSKNOIR
	dw DRAGON_DANCE, SHADOW_FORCE, PURSUIT, SHADOWSNEAK
	db -1 ; end

	next_list_item ; PHOEBE (2)
	db "Phoebe@", TRAINERTYPE_ITEM_MOVES
	db 13
	dw NINETALES
	dw CHARCOAL
	dw SHADOW_BALL, FLAMETHROWER, DESTINY_BOND, CONFUSE_RAY
	db 13
	dw PARASECT
	dw LEFTOVERS
	dw SHADOW_FORCE, LEAF_BLADE, SLASH, STUN_SPORE
	db 13
	dw BANETTE
	dw TWISTEDSPOON
	dw WILLOWISP, CONFUSE_RAY, PSYCHO_CUT, SHADOW_CLAW
	db 13
	dw UNOWN
	dw WARD_BERRY
	dw GLARE, CURSE, COSMIC_POWER, SHADOW_BALL
	db 14
	dw MISMAGIUS
	dw NO_ITEM
	dw WILLOWISP, CONFUSE_RAY, MEAN_LOOK, SHADOW_BALL
	db 15
	dw DUSKNOIR
	dw LEFTOVERS
	dw DRAGON_DANCE, SHADOW_FORCE, PURSUIT, SHADOWSNEAK
	db -1 ; end

	end_list_items

GlaciaGroupHard:
	next_list_item ; GLACIA (1)
	db "Glacia@", TRAINERTYPE_MOVES
	db 12
	dw ANINETALES
	dw ICE_BEAM, FAERIEGLEAM, ICY_WIND, CALM_MIND
	db 12
	dw FROSLASS
	dw HAIL, ICE_BEAM, SHADOW_BALL, ICY_WIND
	db 12
	dw WALREIN
	dw SURF, ICE_BEAM, BODY_SLAM, EARTHQUAKE
	db 12
	dw ASANDSLASH
	dw ICICLE_CRASH, VICEGRIP, SLASH, BULK_UP
	db 12
	dw JYNX
	dw HAIL, PSYCHIC_M, ICE_BEAM, MEDITATE
	db 13
	dw GLALIE
	dw CRUNCH, ICE_BEAM, EXPLOSION, HAIL
	db -1 ; end

	next_list_item ; GLACIA (2)
	db "Glacia@", TRAINERTYPE_ITEM_MOVES
	db 13
	dw ANINETALES
	dw NEVERMELTICE
	dw BLIZZARD, FAERIEGLEAM, ICY_WIND, CALM_MIND
	db 13
	dw FROSLASS
	dw QUICK_CLAW
	dw HAIL, BLIZZARD, SHADOW_BALL, ICY_WIND
	db 13
	dw WALREIN
	dw MYSTIC_WATER
	dw HYDRO_PUMP, BLIZZARD, EARTHQUAKE, REST
	db 13
	dw ASANDSLASH
	dw WARD_BERRY
	dw ICICLE_CRASH, VICEGRIP, SLASH, BULK_UP
	db 14
	dw JYNX
	dw FOCUS_BAND
	dw DIZZY_PUNCH, PSYCHIC_M, BLIZZARD, MEDITATE
	db 15
	dw GLALIEX
	dw LEFTOVERS
	dw BLIZZARD, HAIL, CRUNCH, PROTECT
	db -1 ; end

	end_list_items

DrakeGroupHard:
	next_list_item ; DRAKE (1)
	db "Drake@", TRAINERTYPE_MOVES
	db 12
	dw ALTARIA
	dw DRAGON_DANCE, PLAY_ROUGH, DRAGON_CLAW, EARTHQUAKE
	db 12
	dw FLYGON
	dw FLAMETHROWER, MUD_SHOT, DRAGONBREATH, POISON_FANG
	db 12
	dw KINGDRA
	dw SURF, ICE_BEAM, OUTRAGE, AMNESIA
	db 12
	dw YANMEGA
	dw DRAGON_CLAW, PIN_MISSILE, DETECT, DRAGON_DANCE
	db 12
	dw EXEGGUTOR2
	dw CRUNCH, FIRE_FANG, ICE_FANG, THUNDER_FANG
	db 13
	dw SALAMENCE
	dw CRUNCH, DRAGON_CLAW, FIRE_BLAST, ROCK_TOMB
	db -1 ; end

	next_list_item ; DRAKE (2)
	db "Drake@", TRAINERTYPE_ITEM_MOVES
	db 13
	dw ALTARIA
	dw DRAGON_FANG
	dw DRAGON_DANCE, PLAY_ROUGH, DRAGON_CLAW, EARTHQUAKE
	db 13
	dw FLYGON
	dw SOFT_SAND
	dw FLAMETHROWER, EARTHQUAKE, DRAGON_CLAW, ROCK_TOMB
	db 13
	dw KINGDRA
	dw MYSTIC_WATER
	dw HYDRO_PUMP, BLIZZARD, DRAGONBREATH, AMNESIA
	db 13
	dw YANMEGA
	dw WARD_BERRY
	dw DRAGON_CLAW, MEGAHORN, DETECT, DRAGON_DANCE
	db 14
	dw EXEGGUTOR2
	dw FOCUS_BAND
	dw CRUNCH, FIRE_FANG, ICE_FANG, THUNDER_FANG
	db 15
	dw SALAMENCEX
	dw SCOPE_LENS
	dw CRUNCH, DRAGON_CLAW, FIRE_BLAST, ROCK_TOMB
	db -1 ; end

	end_list_items

StevenGroupHard:
	next_list_item ; STEVEN (1)
	db "Steven@", TRAINERTYPE_MOVES
	db 13
	dw SKARMORY
	dw MUD_SLAP, DRILL_PECK, RECOVER, VICEGRIP
	db 13
	dw AERODACTYL
	dw ROCK_SLIDE, CRUNCH, FLY, ROCK_TOMB
	db 13
	dw AGGRON
	dw STONE_EDGE, VICEGRIP, EARTHQUAKE, HYPER_BEAM
	db 13
	dw PROBOPASS
	dw THUNDERBOLT, FLASHCANNON, ROCK_TOMB, RECOVER
	db 14
	dw SCIZOR
	dw VICEGRIP, BULLET_PUNCH, LEAF_BLADE, SWORDS_DANCE
	db 15
	dw REGISTEEL
	dw METEOR_MASH, SANDSTORM, ROCK_SLIDE, ZAP_CANNON
	db -1 ; end
	
	next_list_item ; STEVEN (2)
	db "Steven@", TRAINERTYPE_ITEM_MOVES
	db 15
	dw SKARMORY
	dw LEFTOVERS
	dw MUD_SLAP, SKY_ATTACK, RECOVER, GUILLOTINE
	db 15
	dw AERODACTYL
	dw MINT_BERRY
	dw ROCK_SLIDE, CRUNCH, FLY, ROCK_TOMB
	db 15
	dw AGGRON
	dw METAL_COAT
	dw STONE_EDGE, VICEGRIP, EARTHQUAKE, HYPER_BEAM
	db 15
	dw PROBOPASS
	dw MAGNET
	dw FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, HYPER_BEAM
	db 15
	dw SCIZOR
	dw METAL_COAT
	dw VICEGRIP, BULLET_PUNCH, LEAF_BLADE, SWORDS_DANCE
	db 17
	dw REGISTEEL
	dw MINT_BERRY
	dw METEOR_MASH, SANDSTORM, ROCK_SLIDE, REST
	db -1 ; end

	next_list_item ; STEVEN (3)
	db "Steven@", TRAINERTYPE_ITEM_MOVES
	db 25
	dw METAGROSSX
	dw LEFTOVERS
	dw METEOR_MASH, COSMIC_POWER, EARTHQUAKE, PSYCHIC_M
	db -1 ; end

	end_list_items

BattleGirlGroupHard:
	next_list_item; BATTLE_GIRL (1) Dewford City Gym
	db "Laura@", TRAINERTYPE_NORMAL
	db 7
	dw MEDICHAM
	db 7
	dw TAUROS
	db -1 ; end

	next_list_item; BATTLE_GIRL (2) Dewford City Gym
	db "Lilith@", TRAINERTYPE_NORMAL
	db 7
	dw POLIWHIRL
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item; BATTLE_GIRL (3) Dewford City Gym
	db "Jocelyn@", TRAINERTYPE_NORMAL
	db 7
	dw COMBUSKEN
	db 7
	dw MANKEY
	db -1 ; end

	next_list_item; BATTLE_GIRL (4) Lavaridge Gym
	db "Danielle@", TRAINERTYPE_NORMAL
	db 9
	dw MEDICHAM
	db 9
	dw NINETALES
	db -1 ; end

	next_list_item; BATTLE_GIRL (4) Route 117
	db "Aisha@", TRAINERTYPE_NORMAL
	db 9
	dw HITMONLEE
	db 9
	dw ABSOL
	db -1 ; end

	next_list_item; BATTLE_GIRL (5) Route 120
	db "Callie@", TRAINERTYPE_NORMAL
	db 8
	dw HITMONTOP
	db 8
	dw MAKUHITA
	db -1 ; end

	end_list_items


RangerMGroupHard:
	next_list_item; STEVEN (1) Unreferenced
	db "Steven@", TRAINERTYPE_NORMAL
	db 10
	dw CHIKORITA
	db 10
	dw CYNDAQUIL
	db 10
	dw TOTODILE
	db -1 ; end

	next_list_item ; RANGERM (2) Aaron's Yellow team
	db "Aaron@", TRAINERTYPE_ITEM_MOVES	
	db 11
	dw BUTTERFREE
	dw NO_ITEM
	dw SPORE, HURRICANE, MOONBLAST, PSYCHIC_M
	db 11
	dw PIKACHU
	dw LIGHT_BALL
	dw VOLT_TACKLE, BODY_SLAM, SURF, THUNDER_WAVE
	db 11
	dw ARTICUNO
	dw LEFTOVERS
	dw BLIZZARD, HURRICANE, FLY, ICY_WIND
	db 11
	dw ZAPDOS
	dw NO_ITEM
	dw THUNDER, DRILL_PECK, SWIFT, FLY
	db 11
	dw MOLTRES
	dw NO_ITEM
	dw PURSUIT, SKY_ATTACK, SOLARBEAM, FIRE_BLAST
	db 11
	dw MEW
	dw LEFTOVERS
	dw MOONBLAST, BLIZZARD, FIRE_BLAST, AURA_SPHERE
	db -1 ; end

	next_list_item ; RANGERM (3) Aaron's Silver team
	db "Aaron@", TRAINERTYPE_ITEM_MOVES	
	db 11
	dw MEGANIUM
	dw NO_ITEM
	dw SPORE, GIGA_DRAIN, MOONBLAST, BODY_SLAM
	db 11
	dw TYRANITAR
	dw NO_ITEM
	dw CRUNCH, ROCK_SLIDE, SURF, EARTHQUAKE
	db 11
	dw BLISSEY
	dw LEFTOVERS
	dw BLIZZARD, THUNDER, PSYCHIC_M, SOFTBOILED
	db 11
	dw JUMPLUFF
	dw NO_ITEM
	dw GIGA_DRAIN, SKY_ATTACK, SUNNY_DAY, SOLARBEAM
	db 11
	dw LUGIA
	dw NO_ITEM
	dw SURF, AEROBLAST, HYDRO_PUMP, PSYCHIC_M
	db 11
	dw CELEBI
	dw LEFTOVERS
	dw MOONBLAST, BLIZZARD, FIRE_BLAST, AURA_SPHERE
	db -1 ; end

	next_list_item ; RANGERM (4) Aaron's Playtest team
	db "Aaron@", TRAINERTYPE_ITEM_MOVES	
	db 11
	dw DELIBIRD
	dw NO_ITEM
	dw BLIZZARD, SKY_ATTACK, SPIKES, HURRICANE
	db 11
	dw ANINETALES
	dw NO_ITEM
	dw BLIZZARD, MOONBLAST, CALM_MIND, ICY_WIND
	db 11
	dw JUMPLUFF
	dw NO_ITEM
	dw GIGA_DRAIN, SKY_ATTACK, STUN_SPORE, NO_MOVE
	db 11
	dw UNOWN
	dw LEFTOVERS
	dw DARK_PULSE, WILLOWISP, ICY_WIND, COSMIC_POWER	
	db 11
	dw ASHIBOMB
	dw NO_ITEM
	dw SURF, FIRE_BLAST, HYDRO_PUMP, REST
	db 11
	dw IRONBUNDLE
	dw LEFTOVERS
	dw HYDRO_PUMP, BLIZZARD, CALM_MIND, AURA_SPHERE
	db -1 ; end

	next_list_item; RANGERM (5) Safari Zone Eli
	db "Eli@", TRAINERTYPE_NORMAL
	db 9
	dw MEGANIUM
	db 9
	dw TROPIUS
	db 10
	dw VENUSAUR
	db -1 ; end

	next_list_item; RANGERM (6) Safari Zone Randal
	db "Randal@", TRAINERTYPE_NORMAL
	db 9
	dw TYPHLOSION
	db 9
	dw KANGASKHAN
	db 10
	dw CHARIZARD
	db -1 ; end

	next_list_item; RANGERM (7) Safari Zone Steven
	db "Steven@", TRAINERTYPE_NORMAL
	db 9
	dw RHYDON
	db 9
	dw MR__MIME
	db 10
	dw SCYTHER
	db -1 ; end

	next_list_item; RANGERM (8) Route 119
	db "Jackson@", TRAINERTYPE_NORMAL
	db 8
	dw MEGANIUM
	db 8
	dw GOLDUCK
	db 8
	dw BRELOOM
	db -1 ; end

	next_list_item; RANGERM (9) Route 119
	db "Takashi@", TRAINERTYPE_NORMAL
	db 8
	dw LEAFEON
	db 8
	dw FLAREON
	db 8
	dw GLACEON
	db -1 ; end

	next_list_item; RANGERM (10) Route 119
	db "Yasu@", TRAINERTYPE_NORMAL
	db 8
	dw ESPEON
	db 8
	dw UMBREON
	db 8
	dw SYLVEON
	db -1 ; end

	next_list_item; RANGERM (11) Route 119
	db "Hideo@", TRAINERTYPE_NORMAL
	db 8
	dw JOLTEON
	db 8
	dw POLITOED
	db 8
	dw XATU
	db -1 ; end

	next_list_item; RANGERM (12) Route 120
	db "Riley@", TRAINERTYPE_NORMAL
	db 8
	dw DUSTOX
	db 8
	dw POLIWRATH
	db 8
	dw ZANGOOSE
	db -1 ; end

	next_list_item; RANGERM (13) Route 120
	db "Lorenzo@", TRAINERTYPE_NORMAL
	db 8
	dw AMUK
	db 8
	dw QUAGSIRE
	db 8
	dw EXEGGCUTE
	db -1 ; end

	next_list_item; RANGERM (14) Route 120
	db "Keigo@", TRAINERTYPE_NORMAL
	db 8
	dw WEEZING
	db 8
	dw TANGROWTH
	db 8
	dw IKARI
	db -1 ; end

	next_list_item; RANGERM (15) Treetop Trial
	db "@", TRAINERTYPE_RANDOM, 3, TRIAL_EASY
	db -1 ; end

	end_list_items

RangerFGroupHard:
	next_list_item; STEVEN (1) Unreferenced
	db "Steven@", TRAINERTYPE_NORMAL
	db 10
	dw CHIKORITA
	db 10
	dw CYNDAQUIL
	db 10
	dw TOTODILE
	db -1 ; end

	next_list_item; RANGERF (2) Safari Zone Monica
	db "Monica@", TRAINERTYPE_NORMAL
	db 9
	dw JYNX
	db 9
	dw LICKITUNG
	db 10
	dw PINSIR
	db -1 ; end

	next_list_item; RANGERF (3) Safari Zone Tina
	db "Tina@", TRAINERTYPE_NORMAL
	db 9
	dw CHIMECHO
	db 9
	dw BRELOOM
	db 10
	dw DELCATTY
	db -1 ; end

	next_list_item; RANGERF (4) Safari Zone Rachael
	db "Rachael@", TRAINERTYPE_NORMAL
	db 9
	dw LUDICOLO
	db 9
	dw STANTLER
	db 10
	dw SLOWKING
	db -1 ; end

	next_list_item; RANGERF (5) Route 119
	db "Catherine@", TRAINERTYPE_NORMAL
	db 7
	dw LUVDISC
	db 7
	dw AZUMARILL
	db 7
	dw SEADRA
	db -1 ; end

	next_list_item; RANGERF (6) Route 119
	db "Rachel@", TRAINERTYPE_NORMAL
	db 7
	dw TORKOAL
	db 7
	dw TROPIUS
	db 7
	dw FLAREON
	db -1 ; end

	next_list_item; RANGERF (7) Route 119
	db "Dani@", TRAINERTYPE_NORMAL
	db 7
	dw ANINETALES
	db 7
	dw FROSLASS
	db 7
	dw DEWGONG
	db -1 ; end

	next_list_item; RANGERF (8) Route 120
	db "Jenna@", TRAINERTYPE_NORMAL
	db 8
	dw NINETALES
	db 8
	dw RAPIDASH
	db 9
	dw ASHIBOMB
	db -1 ; end

	end_list_items

ExplorerGroupHard:
	next_list_item; EXPLORER (1) Route 105
	db "Foster@", TRAINERTYPE_NORMAL
	db 7
	dw RELICANTH
	db 7
	dw URSARING
	db 10
	dw PROBOPASS
	db -1 ; end

	next_list_item; EXPLORER (2) Route 105
	db "Andres@", TRAINERTYPE_NORMAL
	db 7
	dw ASANDSLASH
	db 7
	dw CRAWDAUNT
	db 10
	dw ARMALDO
	db -1 ; end

	next_list_item; EXPLORER (3) Safari Zone Joey
	db "Joey@", TRAINERTYPE_NORMAL
	db 8
	dw ASANDSLASH
	db 9
	dw ASANDSHREW
	db 10
	dw ARMALDO
	db -1 ; end

	next_list_item; EXPLORER (4) Safari Zone Ross
	db "Ross@", TRAINERTYPE_NORMAL
	db 8
	dw METANG
	db 9
	dw CLAYDOL
	db 10
	dw YANMEGA
	db -1 ; end

	next_list_item; EXPLORER (5) Safari Zone Chandler
	db "Chandler@", TRAINERTYPE_NORMAL
	db 8
	dw WHISCASH
	db 9
	dw CAMERUPT
	db 10
	dw HARIYAMA
	db -1 ; end

	next_list_item; EXPLORER (6) Testroom
	db "Test@", TRAINERTYPE_RANDOM | TRAINERTYPE_ITEM | TRAINERTYPE_MOVES, 3, PSYCHIC_EASY	
	db -1 ; end

	next_list_item; EXPLORER (7) Lavaridge Desert
	db "Dusty@", TRAINERTYPE_NORMAL
	db 7
	dw GLISCOR
	db 7
	dw SHUCKLE
	db 7
	dw KLEAVOR
	db -1 ; end

	next_list_item; EXPLORER (8) Lavaridge Desert
	db "Bryan@", TRAINERTYPE_NORMAL
	db 7
	dw RELICANTH
	db 7
	dw SOLROCK
	db 7
	dw SLOWKING
	db -1 ; end

	next_list_item; EXPLORER (9) Route 120
	db "Chip@", TRAINERTYPE_NORMAL
	db 7
	dw YANMEGA
	db 7
	dw SKARMORY
	db 8
	dw KINGLER
	db -1 ; end

	next_list_item; EXPLORER (10) Route 120
	db "Dale@", TRAINERTYPE_NORMAL
	db 7
	dw YANMEGA
	db 7
	dw GLISCOR
	db 8
	dw MAGNEZONE
	db -1 ; end

	end_list_items

	PsychicFGroupHard:
	next_list_item; PSYCHIC_F (01) Mossdeep Gym
	db "Maura@", TRAINERTYPE_NORMAL
	db 8
	dw HYPNO
	db 9
	dw KADABRA
	db -1 ; end

	next_list_item; PSYCHIC_F (02) Mossdeep Gym
	db "Samantha@", TRAINERTYPE_NORMAL
	db 8
	dw MISDREAVUS
	db 9
	dw XATU
	db -1 ; end

	next_list_item; PSYCHIC_F (03) Mossdeep Gym
	db "Macey@", TRAINERTYPE_NORMAL
	db 8
	dw XATU
	db 9
	dw SLOWKING
	db -1 ; end

	next_list_item; PSYCHIC_F (04) Mossdeep Gym
	db "Kathleen@", TRAINERTYPE_NORMAL
	db 8
	dw SLOWBRO
	db 9
	dw BANETTE
	db -1 ; end

	next_list_item; PSYCHIC_F (05) Mossdeep Gym
	db "Sylvia@", TRAINERTYPE_NORMAL
	db 8
	dw GENGAR
	db 9
	dw MEDICHAM
	db -1 ; end

	next_list_item; PSYCHIC_F (06) Mossdeep Gym
	db "Hannah@", TRAINERTYPE_NORMAL
	db 8
	dw CLAYDOL
	db 9
	dw BUTTERFREE
	db -1 ; end

	end_list_items


	AgathaGroupHard:
	next_list_item ; AGATHA (1)
	db "Agatha@", TRAINERTYPE_MOVES
	db 11
	dw FROSLASS
	dw ICY_WIND, SHADOW_BALL, HAIL, ICE_BEAM
	db 11
	dw CROBAT
	dw FLY, SLUDGE_BOMB, CRUNCH, GIGA_DRAIN
	db 11
	dw MISMAGIUS
	dw SHADOW_BALL, GLARE, PAIN_SPLIT, PSYWAVE
	db 11
	dw PARASECT
	dw GIGA_DRAIN, SPORE, SLASH, REST
	db 12
	dw ARBOK
	dw CRUNCH, GLARE, DIG, SWORDS_DANCE
	db 13
	dw GENGAR
	dw SHADOW_BALL, HYPNOSIS, DREAM_EATER, PSYCHIC_M
	db -1 ; end

	end_list_items


	LoreleiGroupHard:
	next_list_item ; LORELEI (1)
	db "Lorelei@", TRAINERTYPE_MOVES
	db 12
	dw DELIBIRD
	dw RAZOR_WIND, ICY_WIND, FLY, SPIKES
	db 11
	dw ANINETALES
	dw ICY_WIND, BLIZZARD, HAIL, MOONBLAST
	db 11
	dw GLACEON
	dw CALM_MIND, BLIZZARD, MUD_SHOT, RECOVER
	db 11
	dw CLOYSTER
	dw BLIZZARD, SURF, REST, WHIRLPOOL
	db 11
	dw DEWGONG
	dw SURF, BLIZZARD, HAIL, REST	
	db 13
	dw LAPRAS
	dw HAIL, BLIZZARD, DRAGONBREATH, REST
	db -1 ; end

	end_list_items


	FergusGroupHard:

	next_list_item ; FERGUS (1)
	db "Fergus@", TRAINERTYPE_MOVES
	db 12
	dw GYARADOS
	dw WATERFALL, DRAGONBREATH, THUNDERBOLT, RAIN_DANCE
	db 11
	dw KINGDRA
	dw ICY_WIND, BLIZZARD, SURF, THUNDER
	db 11
	dw NIDOQUEEN
	dw SURF, EARTHQUAKE, BODY_SLAM, POISON_JAB
	db 11
	dw GOLDUCK
	dw BLIZZARD, SURF, RAIN_DANCE, PSYCHIC_M
	db 11
	dw TENTACRUEL
	dw SURF, SLUDGE_WAVE, ICY_WIND, RECOVER	
	db 13
	dw VAPOREON
	dw ACID_ARMOR, SURF, SNARL, REST
	db -1 ; end

	end_list_items


	NeeshaGroupHard:

	next_list_item ; NEESHA (1)
	db "Neesha@", TRAINERTYPE_MOVES
	db 12
	dw DEWGONG
	dw SURF, ICY_WIND, AMNESIA, REST
	db 11
	dw NINETALES
	dw WILLOWISP, FLAMETHROWER, SOLARBEAM, FAE_VOICE
	db 11
	dw WIGGLYTUFF
	dw CALM_MIND, FAE_VOICE, DRAININGKISS, REST
	db 11
	dw VILEPLUME
	dw PETAL_DANCE, GIGA_DRAIN, MOONLIGHT, RAZOR_LEAF
	db 11
	dw GRAPIDASH
	dw PLAY_ROUGH, ZEN_HEADBUTT, AGILITY, MEGAHORN	
	db 13
	dw BLASTOISE
	dw HYDRO_PUMP, FLASHCANNON, RAPID_SPIN, SKULL_BASH
	db -1 ; end

	end_list_items


	LilyGroupHard:

	next_list_item ; LILY (1)
	db "Lily@", TRAINERTYPE_MOVES
	db 12
	dw NINETALES
	dw FLAMETHROWER, FAE_VOICE, WILLOWISP, RECOVER
	db 11
	dw CLEFABLE
	dw MOONBLAST, BODY_SLAM, ICE_PUNCH, METEOR_MASH
	db 11
	dw MAWILE
	dw CRUNCH, VICEGRIP, PLAY_ROUGH, SWORDS_DANCE
	db 11
	dw MILOTIC
	dw SURF, DRAGONBREATH, FAERIEGLEAM, WHIRLPOOL
	db 11
	dw SYLVEON
	dw MOONBLAST, FAE_VOICE, SNARL, REST	
	db 13
	dw TOGEKISS
	dw MOONBLAST, MIST_BALL, MIRROR_COAT, RECOVER
	db -1 ; end

	end_list_items


	GuyGroupHard:

	next_list_item ; GUY (1)
	db "Guy@", TRAINERTYPE_MOVES
	db 12
	dw MEGANIUM
	dw GIGA_DRAIN, DRAGONBREATH, STUN_SPORE, BODY_SLAM
	db 11
	dw EXEGGUTOR
	dw EGG_BOMB, PSYCHIC_M, DRAGONBREATH, LEECH_SEED
	db 11
	dw PARASECT
	dw SHADOW_CLAW, SLASH, LEAF_BLADE, RECOVER
	db 11
	dw LUDICOLO
	dw RAIN_DANCE, SURF, GIGA_DRAIN, WHIRLPOOL
	db 11
	dw LEAFEON
	dw LEAF_BLADE, BODY_SLAM, SUBMISSION, RECOVER	
	db 13
	dw VENUSAUR
	dw GIGA_DRAIN, SLUDGE_WAVE, STUN_SPORE, LEECH_SEED
	db -1 ; end

	end_list_items


	GiovanniGroupHard:

	next_list_item ; GIOVANNI (1)
	db "Giovanni@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw PERSIAN
	dw QUICK_CLAW
	dw SLASH, BEAT_UP, PLAY_ROUGH, SWORDS_DANCE
	db 12
	dw DUGTRIO
	dw SOFT_SAND
	dw FISSURE, STONE_EDGE, MUDDY_WATER, REFLECT
	db 12
	dw NIDOQUEEN
	dw LEFTOVERS
	dw EARTHQUAKE, SLUDGE_BOMB, TOXIC, ICE_FANG
	db 13
	dw ARCANINE
	dw PINK_BOW
	dw CRUNCH, SACRED_FIRE, EXTREMESPEED, FIRE_BLAST
	db 13
	dw MAROWAK
	dw THICK_CLUB
	dw FISSURE, SHADOW_FORCE, SUBMISSION, COSMIC_POWER	
	db 18
	dw MEWTWO
	dw MIRACLEBERRY
	dw PSYCHIC_M, AURA_SPHERE, CALM_MIND, RECOVER
	db -1 ; end

	end_list_items

	WallyGroupHard:

	next_list_item ; WALLY (1)
	db "Wally@", TRAINERTYPE_NORMAL
	db 0
	dw RALTS
	db -1 ; end

	next_list_item ; WALLY (2)
	db "Wally@", TRAINERTYPE_NORMAL
	db 5
	dw SWABLU
	db 5
	dw SKITTY
	db 8
	dw RALTS
	db -1 ; end

	next_list_item ; WALLY (3)
	db "Wally@", TRAINERTYPE_NORMAL
	db 7
	dw MINUN
	db 8
	dw BARBOACH
	db 7
	dw SWABLU
	db 7
	dw DELCATTY
	db 10
	dw KIRLIA
	db -1 ; end

	next_list_item ; WALLY (4)
	db "Wally@", TRAINERTYPE_NORMAL
	db 9
	dw CHIMECHO
	db 8
	dw WHISCASH
	db 7
	dw ALTARIA
	db 7
	dw DELCATTY
	db 10
	dw GARDEVOIR
	db -1 ; end

	next_list_item ; WALLY (5)
	db "Wally@", TRAINERTYPE_NORMAL
	db 8
	dw CHIMECHO
	db 8
	dw WHISCASH
	db 8
	dw ALTARIA
	db 9
	dw TROPIUS
	db 9
	dw ABSOL
	db 12
	dw GARDEVOIR
	db -1 ; end

	next_list_item ; WALLY (6)
	db "Wally@", TRAINERTYPE_NORMAL
	db 8
	dw CHIMECHO
	db 8
	dw WHISCASH
	db 8
	dw ALTARIA
	db 9
	dw TROPIUS
	db 9
	dw ABSOL
	db 12
	dw GARDEVOIR
	db -1 ; end

	next_list_item ; WC_WALLY (7) World Cup Wally
	db "Wally@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw CHIMECHOX
	dw LEFTOVERS
	dw CALM_MIND, WILLOWISP, RECOVER, PSYCHIC_M
	db 12
	dw WHISCASH
	dw SOFT_SAND
	dw MUDDY_WATER, EARTHQUAKE, TOXIC, REST	
	db 12
	dw ALTARIAX
	dw DRAGON_FANG
	dw DRAGON_DANCE, DRAGON_CLAW, PLAY_ROUGH, SKY_ATTACK
	db 13
	dw TROPIUSX
	dw MIRACLE_SEED
	dw SKY_ATTACK, LEECH_SEED, FRENZY_PLANT, RECOVER
	db 13
	dw ABSOLX
	dw FOCUS_BAND
	dw SLASH, BEAT_UP, DRAGON_CLAW, SKY_ATTACK
	db 15
	dw GARDEVOIRX
	dw LEFTOVERS
	dw CALM_MIND, PSYCHIC_M, MOONBLAST, RECOVER
	db -1 ; end

	end_list_items


ENDSECTION
