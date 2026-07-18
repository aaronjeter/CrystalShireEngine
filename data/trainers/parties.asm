; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    * for TRAINERTYPE_NORMAL:     db level, species
;    * for TRAINERTYPE_MOVES:      db level, species, 4 moves
;    * for TRAINERTYPE_ITEM:       db level, species, item
;    * for TRAINERTYPE_ITEM_MOVES: db level, species, item, 4 moves
; - db -1 ; end

; Random Trainers:
; - db "NAME@", TRAINERTYPE_RANDOM | other TRAINERTYPE_* constants, number of party pokémon, list constant (defined in constants/trainer_constants.asm)
; - db -1 ; end
; Lists of random Pokémon:
; - db length of list
; - Pokémon, separated by db $fe
; - db -1 ; end

SECTION "Enemy Trainer Parties 1", ROMX

FalknerGroup: ;Gym Leader
	next_list_item ; FALKNER (1)
	db "FALKNER@", TRAINERTYPE_MOVES
	db 6
	dw NATU
	dw TACKLE, CONFUSE_RAY, GUST, CONFUSION
	db 5
	dw PIDGEY
	dw TACKLE, MUD_SLAP, GUST, LEER
	db 7
	dw NOCTOWL
	dw TACKLE, MUD_SLAP, GUST, CONFUSE_RAY
	db -1 ; end

	next_list_item ; FALKNER (2)
	db "FALKNER@", TRAINERTYPE_MOVES
	db 8
	dw XATU
	dw PSYBEAM, CONFUSE_RAY, RAZOR_WIND, MUD_SLAP
	db 8
	dw GLIGAR
	dw MAGNITUDE, MUD_SLAP, SLASH, FAINT_ATTACK
	db 8
	dw FEAROW
	dw DRILL_PECK, MUD_SLAP, GUST, CONFUSION	
	db 9
	dw NOCTOWL
	dw HYPNOSIS, MUD_SLAP, DREAM_EATER, CONFUSE_RAY
	db -1 ; end

	next_list_item ; FALKNER (3)
	db "FALKNER@", TRAINERTYPE_ITEM_MOVES
	db 8
	dw SKARMORY
	dw NO_ITEM
	dw DRILL_PECK, TOXIC, COSMIC_POWER, REST
	db 8
	dw XATU
	dw NO_ITEM
	dw PSYCHIC_M, CONFUSE_RAY, RAZOR_WIND, MUD_SLAP
	db 8
	dw GLISCOR
	dw QUICK_CLAW
	dw FISSURE, MUD_SLAP, SLASH, PURSUIT
	db 8
	dw PELIPPER
	dw LEFTOVERS
	dw HYDRO_PUMP, PROTECT, HURRICANE, RECOVER
	db 8
	dw DELIBIRD
	dw NO_ITEM
	dw BLIZZARD, MUD_SLAP, SKY_ATTACK, CONFUSE_RAY
	db 11
	dw NOCTOWL2
	dw TWISTEDSPOON
	dw WILLOWISP, MUD_SLAP, PSYCHIC_M, MOONBLAST
	db -1 ; end

	end_list_items

WhitneyGroup: ;Gym Leader
	next_list_item ; WHITNEY (1)
	db "WHITNEY@", TRAINERTYPE_MOVES
	db 8
	dw CLEFAIRY
	dw POUND, MIMIC, ENCORE, METRONOME
	db 8
	dw JIGGLYPUFF
	dw POUND, SING, ENCORE, REST
	db 10
	dw MILTANK
	dw ROLLOUT, ATTRACT, STOMP, MILK_DRINK
	db -1 ; end
	
	next_list_item ; WHITNEY (2)
	db "WHITNEY@", TRAINERTYPE_MOVES	
	db 9
	dw WIGGLYTUFF
	dw WILLOWISP, COSMIC_POWER, DIZZY_PUNCH, REST
	db 9
	dw FURRET
	dw HYPER_FANG, BULK_UP, DIG, CRUNCH
	db 9
	dw RATICATE
	dw HYPER_FANG, SHARPEN, CRUNCH, QUICK_ATTACK
	db 11
	dw MILTANK
	dw ROLLOUT, BULK_UP, BODY_SLAM, MILK_DRINK
	db -1 ; end
	
	next_list_item ; WHITNEY (3)
	db "WHITNEY@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw FURRET2
	dw NO_ITEM
	dw DRAGON_CLAW, DRAGON_DANCE, BODY_SLAM, CRUNCH
	db 9
	dw CLEFABLE
	dw NO_ITEM
	dw MOONBLAST, CALM_MIND, PSYCHIC_M, METEOR_MASH	
	db 9
	dw WIGGLYTUFF
	dw LEFTOVERS
	dw WILLOWISP, COSMIC_POWER, MOONBLAST, REST	
	db 9
	dw RATICATE
	dw PINK_BOW
	dw HYPER_FANG, SWORDS_DANCE, CRUNCH, EXTREMESPEED
	db 9
	dw TAUROS
	dw NO_ITEM
	dw BODY_SLAM, SUBMISSION, EARTHQUAKE, OUTRAGE
	db 11
	dw MILTANK
	dw LEFTOVERS
	dw ROLLOUT, COSMIC_POWER, BODY_SLAM, MILK_DRINK
	db -1 ; end

	end_list_items

BugsyGroup: ;Gym Leader
	next_list_item ; BUGSY (1)
	db "BUGSY@", TRAINERTYPE_MOVES
	db 8
	dw LEDYBA
	dw MACH_PUNCH, STRING_SHOT, ICE_PUNCH, LEECH_LIFE
	db 8
	dw PARAS
	dw STRING_SHOT, STUN_SPORE, POISONPOWDER, RAZOR_LEAF
	db 9
	dw SCYTHER
	dw QUICK_ATTACK, LEER, FURY_CUTTER, BITE
	db -1 ; end
	
	next_list_item ; BUGSY (2)
	db "BUGSY@", TRAINERTYPE_MOVES
	db 9
	dw MASQUERAIN
	dw SURF, CONFUSE_RAY, FURY_CUTTER, SIGNAL_BEAM
	db 9
	dw LEDIAN
	dw MACH_PUNCH, STRING_SHOT, ICE_PUNCH, LEECH_LIFE
	db 9
	dw PARASECT
	dw LEAF_BLADE, STUN_SPORE, SPORE, RAZOR_LEAF	
	db 11
	dw SCYTHER
	dw SLASH, SCARY_FACE, FURY_CUTTER, NO_MOVE
	db -1 ; end
	
	next_list_item ; BUGSY (3)
	db "BUGSY@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw MASQUERAIN
	dw NO_ITEM
	dw HYDRO_PUMP, CONFUSE_RAY, MEDITATE, SIGNAL_BEAM
	db 9
	dw LEDIAN
	dw NO_ITEM
	dw MACH_PUNCH, FIRE_PUNCH, ICE_PUNCH, DIZZY_PUNCH
	db 9
	dw PARASECT
	dw NO_ITEM
	dw LEAF_BLADE, STUN_SPORE, SPORE, SLASH	
	db 10
	dw SCYTHER2
	dw NO_ITEM
	dw SLASH, SWORDS_DANCE, FURY_CUTTER, PSYCHO_CUT
	db 10
	dw SCIZOR2
	dw LEFTOVERS
	dw SLASH, VICEGRIP, SWORDS_DANCE, BULLET_PUNCH
	db -1 ; end

	end_list_items

MortyGroup: ;Gym Leader
	next_list_item ; MORTY (1)
	db "MORTY@", TRAINERTYPE_MOVES
	db 8
	dw VULPIX
	dw LICK, HYPNOSIS, EMBER, WILLOWISP
	db 8
	dw HAUNTER
	dw LICK, SPITE, MEAN_LOOK, CURSE
	db 8
	dw MAROWAK
	dw BONEMERANG, HEADBUTT, LICK, FOCUS_ENERGY	
	db 9
	dw MISDREAVUS
	dw LICK, WILLOWISP, CONFUSE_RAY, NIGHT_SHADE
	db -1 ; end
	
	next_list_item ; MORTY (2)
	db "MORTY@", TRAINERTYPE_MOVES
	db 9
	dw NINETALES
	dw SHADOW_BALL, HYPNOSIS, FLAMETHROWER, WILLOWISP
	db 9
	dw HAUNTER
	dw LICK, THUNDERBOLT, SMOG, SHADOW_BALL
	db 9
	dw MAROWAK
	dw BONEMERANG, HEADBUTT, SHADOW_BALL, BONE_CLUB	
	db 11
	dw MISDREAVUS
	dw SHADOW_BALL, WILLOWISP, CONFUSE_RAY, NIGHT_SHADE
	db -1 ; end
	
	next_list_item ; MORTY (3)
	db "Morty@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw PARASECT
	dw QUICK_CLAW
	dw DESTINY_BOND, SHADOW_CLAW, NO_MOVE, NO_MOVE
	db 9
	dw NINETALES
	dw NO_ITEM
	dw SHADOW_BALL, LUSTER_PURGE, FIRE_BLAST, WILLOWISP	
	db 9
	dw MAROWAK
	dw THICK_CLUB
	dw EARTHQUAKE, HEADBUTT, SHADOW_CLAW, MUD_SHOT
	db 9
	dw WYRDEER
	dw NO_ITEM
	dw HYPNOSIS, BODY_SLAM, SHADOW_BALL, DREAM_EATER	
	db 9
	dw MISMAGIUS
	dw SPELL_TAG
	dw SHADOW_BALL, WILLOWISP, CONFUSE_RAY, CALM_MIND
	db 11
	dw GENGARX
	dw SPELL_TAG
	dw PSYCHIC_M, THUNDERBOLT, SLUDGE_BOMB, SHADOW_BALL
	db -1 ; end

	end_list_items

PryceGroup: ;Gym Leader
	next_list_item ; PRYCE (1)
	db "PRYCE@", TRAINERTYPE_MOVES
	db 8
	dw DELIBIRD
	dw ICY_WIND, GUST, AURORA_BEAM, SPIKES
	db 8
	dw JYNX
	dw PERISH_SONG, PSYBEAM, ICE_PUNCH, LOVELY_KISS
	db 9
	dw SNEASEL
	dw ICE_PUNCH, SLASH, AURORA_BEAM, PURSUIT
	db -1 ; end
	
	next_list_item ; PRYCE (2)
	db "PRYCE@", TRAINERTYPE_MOVES
	db 9
	dw DELIBIRD
	dw BLIZZARD, RAZOR_WIND, ICY_WIND, SPIKES
	db 9
	dw JYNX
	dw PERISH_SONG, PSYBEAM, ICE_PUNCH, LOVELY_KISS
	db 9
	dw SNEASEL
	dw ICE_PUNCH, SLASH, MACH_PUNCH, PURSUIT
	db 11
	dw PILOSWINE
	dw EARTHQUAKE, BLIZZARD, BULK_UP, BODY_SLAM
	db -1 ; end
	
	next_list_item ; PRYCE (3)
	db "PRYCE@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw DELIBIRD
	dw NO_ITEM
	dw BLIZZARD, RAZOR_WIND, ICY_WIND, SPIKES
	db 9
	dw WALREIN
	dw LEFTOVERS
	dw SURF, HAIL, BLIZZARD, REST	
	db 9
	dw JYNX
	dw NO_ITEM
	dw HAIL, PSYCHIC_M, BLIZZARD, LOVELY_KISS
	db 9
	dw WEAVILE
	dw NO_ITEM
	dw ICICLE_CRASH, SLASH, MACH_PUNCH, PURSUIT
	db 10
	dw MAMOSWINE
	dw NO_ITEM
	dw EARTHQUAKE, ICICLE_CRASH, BULK_UP, BODY_SLAM
	db 11
	dw GLALIEX
	dw NEVERMELTICE
	dw ICICLE_CRASH, CRUNCH, REST, COSMIC_POWER
	db -1 ; end

	end_list_items

JasmineGroup: ;Gym Leader
	next_list_item ; JASMINE (1)
	db "JASMINE@", TRAINERTYPE_MOVES
	db 8
	dw MAGNEMITE
	dw METAL_CLAW, SUPERSONIC, THUNDER_WAVE, THUNDERSHOCK
	db 8
	dw KRABBY
	dw BUBBLEBEAM, CUT, CRABHAMMER, HARDEN
	db 9
	dw SKARMORY
	dw SLASH, STEEL_WING, AGILITY, WING_ATTACK
	db -1 ; end
	
	next_list_item ; JASMINE (2)
	db "JASMINE@", TRAINERTYPE_MOVES
	db 9
	dw MAWILE
	dw SANDSTORM, VICEGRIP, CRUNCH, DIZZY_PUNCH
	db 9
	dw MAGNETON
	dw TRI_ATTACK, SWIFT, THUNDER_WAVE, SHOCK_WAVE
	db 9
	dw KINGLER
	dw CRUSH_CLAW, VICEGRIP, CRABHAMMER, PROTECT
	db 11
	dw SKARMORY
	dw SLASH, STEEL_WING, AGILITY, WING_ATTACK
	db -1 ; end
	
	next_list_item ; JASMINE (3)
	db "JASMINE@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw SKARMORY
	dw NO_ITEM
	dw SLASH, VICEGRIP, SANDSTORM, SKY_ATTACK	
	db 9
	dw MAWILE
	dw NO_ITEM
	dw SANDSTORM, VICEGRIP, CRUNCH, DIZZY_PUNCH
	db 9
	dw MAGNEZONE
	dw MAGNET
	dw TRI_ATTACK, CHARGE, FLASHCANNON, ZAP_CANNON
	db 9
	dw KINGLER
	dw METAL_COAT
	dw CRUSH_CLAW, VICEGRIP, CRABHAMMER, PROTECT	
	db 10
	dw AGGRON
	dw NO_ITEM
	dw GUILLOTINE, EARTHQUAKE, BULK_UP, SANDSTORM
	db 11
	dw STEELIXX
	dw LEFTOVERS
	dw IRON_TAIL, FISSURE, COSMIC_POWER, SANDSTORM
	db -1 ; end

	end_list_items

ChuckGroup: ;Gym Leader
	next_list_item ; CHUCK (1)
	db "CHUCK@", TRAINERTYPE_MOVES
	db 9
	dw HITMONCHAN
	dw MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	db 9
	dw HITMONLEE
	dw MEGA_KICK, JUMP_KICK, FAINT_ATTACK, HI_JUMP_KICK
	db 9
	dw HITMONTOP
	dw ROLLING_KICK, SLAM, MACH_PUNCH, FAINT_ATTACK
	db -1 ; end
	
	next_list_item ; CHUCK (2)
	db "CHUCK@", TRAINERTYPE_MOVES
	db 9
	dw HITMONCHAN
	dw MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	db 9
	dw HITMONLEE
	dw MEGA_KICK, JUMP_KICK, FAINT_ATTACK, HI_JUMP_KICK
	db 9
	dw HITMONTOP
	dw ROLLING_KICK, SLAM, MACH_PUNCH, FAINT_ATTACK
	db 11
	dw BRELOOM
	dw LEAF_BLADE, SPORE, MACH_PUNCH, CROSS_CHOP
	db -1 ; end
	
	next_list_item ; CHUCK (3)
	db "CHUCK@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw HITMONCHAN
	dw NO_ITEM
	dw MACH_PUNCH, FIRE_PUNCH, DIZZY_PUNCH, ICE_PUNCH
	db 9
	dw HITMONLEE
	dw NO_ITEM
	dw BLAZE_KICK, EXTREMESPEED, PURSUIT, HI_JUMP_KICK	
	db 9
	dw BRELOOM
	dw NO_ITEM
	dw LEAF_BLADE, SPORE, MACH_PUNCH, SWORDS_DANCE
	db 9
	dw MEDICHAM
	dw NO_ITEM
	dw BULLET_PUNCH, ZEN_HEADBUTT, BULK_UP, SHADOW_PUNCH
	db 10
	dw POLIWRATH
	dw BLACKBELT_I
	dw SURF, DYNAMICPUNCH, MACH_PUNCH, HYPNOSIS
	db 11
	dw KINGLERX
	dw QUICK_CLAW
	dw AQUA_JET, CURSE, CRABHAMMER, GUILLOTINE
	db -1 ; end

	end_list_items

ClairGroup: ;Gym Leader
	next_list_item ; CLAIR (1)
	db "CLAIR@", TRAINERTYPE_MOVES
	db 9
	dw GYARADOS
	dw DRAGONBREATH, WATERFALL, WHIRLPOOL, RAIN_DANCE
	db 9
	dw DRAGONAIR
	dw THUNDER_WAVE, SURF, SLAM, DRAGONBREATH	
	db 9
	dw LAPRAS
	dw BLIZZARD, SURF, THUNDER, RAIN_DANCE
	db -1 ; end
	
	next_list_item ; CLAIR (1)
	db "CLAIR@", TRAINERTYPE_MOVES
	db 9
	dw GYARADOS
	dw DRAGONBREATH, WATERFALL, WHIRLPOOL, RAIN_DANCE
	db 9
	dw OCTILLERY
	dw OCTAZOOKA, SURF, ICE_BEAM, DRAGONBREATH
	db 9
	dw LAPRAS
	dw BLIZZARD, SURF, THUNDER, RAIN_DANCE
	db 11
	dw KINGDRA
	dw AGILITY, HYDRO_PUMP, THUNDER, OUTRAGE
	db -1 ; end
	
	next_list_item ; CLAIR (3)
	db "CLAIR@", TRAINERTYPE_ITEM_MOVES	
	db 12
	dw DRAGONITEY
	dw LEFTOVERS
	dw DRAGONBREATH, SCALD, CALM_MIND, REST
	db -1 ; end

	end_list_items

Rival1Group:
	next_list_item ; RIVAL1 (1)
	db "?@", TRAINERTYPE_NORMAL
	db 1
	dw CHIKORITA
	db -1 ; end

	next_list_item ; RIVAL1 (2)
	db "?@", TRAINERTYPE_NORMAL
	db 1
	dw CYNDAQUIL
	db -1 ; end

	next_list_item ; RIVAL1 (3)
	db "?@", TRAINERTYPE_NORMAL
	db 1
	dw TOTODILE
	db -1 ; end

	next_list_item ; RIVAL1 (4)
	db "?@", TRAINERTYPE_NORMAL
	db 7
	dw GASTLY
	db 6
	dw ZUBAT
	db 11
	dw BAYLEEF
	db -1 ; end

	next_list_item ; RIVAL1 (5)
	db "?@", TRAINERTYPE_NORMAL
	db 7
	dw GASTLY
	db 6
	dw ZUBAT
	db 11
	dw QUILAVA
	db -1 ; end

	next_list_item ; RIVAL1 (6)
	db "?@", TRAINERTYPE_NORMAL
	db 7
	dw GASTLY
	db 6
	dw ZUBAT
	db 11
	dw CROCONAW
	db -1 ; end

	next_list_item ; RIVAL1 (7)
	db "?@", TRAINERTYPE_NORMAL
	db 7
	dw HAUNTER
	db 6
	dw MAGNEMITE
	db 6
	dw ZUBAT
	db 10
	dw BAYLEEF
	db -1 ; end

	next_list_item ; RIVAL1 (8)
	db "?@", TRAINERTYPE_NORMAL
	db 7
	dw HAUNTER
	db 6
	dw MAGNEMITE
	db 6
	dw ZUBAT
	db 10
	dw QUILAVA
	db -1 ; end

	next_list_item ; RIVAL1 (9)
	db "?@", TRAINERTYPE_NORMAL
	db 7
	dw HAUNTER
	db 6
	dw MAGNEMITE
	db 6
	dw ZUBAT
	db 10
	dw CROCONAW
	db -1 ; end

	next_list_item ; RIVAL1 (10)
	db "?@", TRAINERTYPE_NORMAL
	db 8
	dw GOLBAT
	db 7
	dw MAGNEMITE
	db 7
	dw HAUNTER
	db 9
	dw SNEASEL
	db 10
	dw MEGANIUM
	db -1 ; end

	next_list_item ; RIVAL1 (11)
	db "?@", TRAINERTYPE_NORMAL
	db 8
	dw GOLBAT
	db 7
	dw MAGNEMITE
	db 7
	dw HAUNTER
	db 9
	dw SNEASEL
	db 10
	dw QUILAVA
	db -1 ; end

	next_list_item ; RIVAL1 (12)
	db "?@", TRAINERTYPE_NORMAL
	db 8
	dw GOLBAT
	db 7
	dw MAGNEMITE
	db 7
	dw HAUNTER
	db 9
	dw SNEASEL
	db 10
	dw FERALIGATR
	db -1 ; end

	next_list_item ; RIVAL1 (13)
	db "?@", TRAINERTYPE_NORMAL
	db 9
	dw WEAVILE
	db 8
	dw CROBAT
	db 8
	dw MAGNEZONE
	db 9
	dw GENGAR
	db 9
	dw ALAKAZAM
	db 10
	dw MEGANIUM
	db -1 ; end

	next_list_item ; RIVAL1 (14)
	db "?@", TRAINERTYPE_NORMAL
	db 9
	dw WEAVILE
	db 8
	dw CROBAT
	db 8
	dw MAGNEZONE
	db 9
	dw GENGAR
	db 9
	dw ALAKAZAM
	db 10
	dw TYPHLOSION
	db -1 ; end

	next_list_item ; RIVAL1 (15)
	db "?@", TRAINERTYPE_NORMAL
	db 9
	dw WEAVILE
	db 8
	dw CROBAT
	db 8
	dw MAGNEZONE
	db 9
	dw GENGAR
	db 9
	dw ALAKAZAM
	db 10
	dw FERALIGATR
	db -1 ; end

	end_list_items

PokemonProfGroup:

WillGroup:	;Elite 4
	next_list_item ; WILL (1)
	db "WILL@", TRAINERTYPE_MOVES
	db 9
	dw GARDEVOIR
	dw PSYCHIC_M, SWIFT, CALM_MIND, HYPNOSIS
	db 9
	dw LUNATONE
	dw COSMIC_POWER, ANCIENTPOWER, FUTURE_SIGHT, PSYCHIC_M
	db 9
	dw EXEGGUTOR
	dw STUN_SPORE, LEECH_SEED, EGG_BOMB, PSYCHIC_M
	db 9
	dw GIRAFARIG
	dw PURSUIT, CALM_MIND, BODY_SLAM, PSYCHIC_M
	db 10
	dw SLOWKING
	dw SURF, CALM_MIND, FLAMETHROWER, PSYCHIC_M
	db 11
	dw ESPEON
	dw BODY_SLAM, REFLECT, SHADOW_BALL, PSYCHIC_M
	db -1 ; end
	
	next_list_item ; WILL (2)
	db "WILL@", TRAINERTYPE_ITEM_MOVES
	db 11
	dw GARDEVOIR
	dw NO_ITEM
	dw DREAM_EATER, MOONBLAST, CALM_MIND, HYPNOSIS
	db 11
	dw CLAYDOL
	dw LEFTOVERS
	dw COSMIC_POWER, ANCIENTPOWER, REST, PSYCHIC_M
	db 11
	dw ESPEON
	dw NO_ITEM
	dw BODY_SLAM, REFLECT, SHADOW_BALL, PSYCHIC_M
	db 11
	dw WYRDEER
	dw MIRACLEBERRY
	dw PURSUIT, EARTHQUAKE, HYPNOSIS, DREAM_EATER	
	db 12
	dw XATU
	dw NO_ITEM
	dw SKY_ATTACK, HYPNOSIS, SHADOW_BALL, PSYCHIC_M
	db 13
	dw SLOWBROX
	dw LEFTOVERS
	dw SCALD, COSMIC_POWER, REST, PSYCHIC_M
	db -1 ; end

	end_list_items

PKMNTrainerGroup:
	next_list_item ; CAL (1)
	db "CAL@", TRAINERTYPE_NORMAL
	db 10
	dw CHIKORITA
	db 10
	dw CYNDAQUIL
	db 10
	dw TOTODILE
	db -1 ; end

	next_list_item ; CAL (2)
	db "CAL@", TRAINERTYPE_NORMAL
	db 10
	dw BAYLEEF
	db 10
	dw QUILAVA
	db 10
	dw CROCONAW
	db -1 ; end

	next_list_item ; CAL (3)
	db "CAL@", TRAINERTYPE_NORMAL
	db 10
	dw MEGANIUM
	db 10
	dw TYPHLOSION
	db 10
	dw FERALIGATR
	db -1 ; end

	end_list_items

BrunoGroup: ;Elite 4
	next_list_item ; BRUNO (1)
	db "BRUNO@", TRAINERTYPE_MOVES
	db 9
	dw HITMONTOP
	dw PURSUIT, TRIPLE_KICK, DIG, DETECT
	db 9
	dw HITMONLEE
	dw SWAGGER, MEGA_KICK, HI_JUMP_KICK, FORESIGHT
	db 9
	dw HITMONCHAN
	dw THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, DYNAMICPUNCH
	db 9
	dw STEELIX
	dw IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	db 10
	dw MACHAMP
	dw ROCK_SLIDE, MACH_PUNCH, FISSURE, CROSS_CHOP
	db 11
	dw HERACROSS
	dw MEGAHORN, CROSS_CHOP, BODY_SLAM, EARTHQUAKE
	db -1 ; end
	
	next_list_item ; BRUNO (2)
	db "BRUNO@", TRAINERTYPE_ITEM_MOVES
	db 11
	dw BLAZIKEN
	dw NO_ITEM
	dw DRILL_PECK, BLAZE_KICK, HI_JUMP_KICK, DETECT	
	db 11
	dw HITMONCHAN
	dw NO_ITEM
	dw THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, DYNAMICPUNCH
	db 11
	dw STEELIX
	dw NO_ITEM
	dw IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	db 11
	dw MACHAMP
	dw NO_ITEM
	dw ROCK_SLIDE, MACH_PUNCH, FISSURE, CROSS_CHOP
	db 12
	dw ANNIHILAPE
	dw QUICK_CLAW
	dw MEGAHORN, CROSS_CHOP, SHADOW_PUNCH, EARTHQUAKE
	db 13
	dw HERACROSSX
	dw QUICK_CLAW
	dw MEGAHORN, MACH_PUNCH, HI_JUMP_KICK, PURSUIT
	db -1 ; end

	end_list_items

KarenGroup: ;Elite 4
	next_list_item ; KAREN (1)
	db "KAREN@", TRAINERTYPE_MOVES
	db 9
	dw UMBREON
	dw CONFUSE_RAY, TOXIC, SNARL, REST
	db 9
	dw HOUNDOOM
	dw ROAR, CRUNCH, FLAMETHROWER, MUD_SLAP
	db 9
	dw VILEPLUME
	dw STUN_SPORE, SLUDGE_BOMB, SWIFT, PETAL_DANCE
	db 9
	dw GENGAR
	dw SHADOW_BALL, HYPNOSIS, DREAM_EATER, SLUDGE_BOMB
	db 10
	dw ABSOL
	dw EXTREMESPEED, DRILL_PECK, PURSUIT, SKY_ATTACK
	db 11
	dw TYRANITAR
	dw CRUNCH, ROCK_SLIDE, EARTHQUAKE, OUTRAGE
	db -1 ; end
	
	next_list_item ; KAREN (2)
	db "KAREN@", TRAINERTYPE_ITEM_MOVES
	db 11
	dw UMBREON
	dw NO_ITEM
	dw CONFUSE_RAY, TOXIC, SNARL, REST
	db 11
	dw UNOWN
	dw NO_ITEM
	dw GLARE, COSMIC_POWER, PURSUIT, DESTINY_BOND
	db 11
	dw DUSKNOIR
	dw NO_ITEM
	dw SHADOW_FORCE, HYPNOSIS, DREAM_EATER, ICY_WIND
	db 11
	dw GENGAR
	dw NO_ITEM
	dw SHADOW_BALL, HYPNOSIS, DREAM_EATER, SLUDGE_WAVE
	db 12
	dw HONCHKROW
	dw SHARP_BEAK
	dw EXTREMESPEED, DRILL_PECK, PURSUIT, SKY_ATTACK
	db 13
	dw TYRANITARX
	dw FOCUS_BAND
	dw CRUNCH, STONE_EDGE, EARTHQUAKE, OUTRAGE
	db -1 ; end

	end_list_items

KogaGroup: ;Elite 4
	next_list_item ; KOGA (1)
	db "KOGA@", TRAINERTYPE_MOVES
	db 9
	dw FORRETRESS
	dw PROTECT, SWIFT, EXPLOSION, SPIKES
	db 9
	dw WEEZING
	dw FIRE_BLAST, SLUDGE_BOMB, EXPLOSION, TOXIC
	db 9
	dw BEEDRILL
	dw TWINEEDLE, SLUDGE_BOMB, TOXIC, EXTREMESPEED
	db 9
	dw VENOMOTH
	dw PSYCHIC_M, DOUBLE_TEAM, SHADOW_BALL, TOXIC
	db 10
	dw AMUK
	dw MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	db 11
	dw CROBAT
	dw EXTREMESPEED, SWIFT, SKY_ATTACK, SLUDGE_BOMB
	db -1 ; end
	
	next_list_item ; KOGA (2)
	db "KOGA@", TRAINERTYPE_ITEM_MOVES
	db 11
	dw TENTACRUEL
	dw LEFTOVERS
	dw COSMIC_POWER, SURF, ICY_WIND, POWER_GEM
	db 11
	dw WEEZING
	dw NO_ITEM
	dw FIRE_BLAST, SLUDGE_BOMB, EXPLOSION, WILLOWISP	
	db 11
	dw VENOMOTH
	dw NO_ITEM
	dw PSYCHIC_M, DOUBLE_TEAM, SHADOW_BALL, CONFUSE_RAY
	db 11
	dw AMUK
	dw NO_ITEM
	dw MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	db 12
	dw CROBAT
	dw NO_ITEM
	dw EXTREMESPEED, CONFUSE_RAY, SKY_ATTACK, SLUDGE_BOMB
	db 13
	dw SWALOTX
	dw LEFTOVERS
	dw COSMIC_POWER, TOXIC, SLUDGE_BOMB, REST
	db -1 ; end

	end_list_items

ChampionGroup: ;Elite 4
	next_list_item ; CHAMPION (1)
	db "LANCE@", TRAINERTYPE_MOVES
	db 11
	dw GYARADOS
	dw THUNDER, RAIN_DANCE, HYDRO_PUMP, HYPER_BEAM
	db 11
	dw LAPRAS
	dw BLIZZARD, RAIN_DANCE, THUNDER, HYDRO_PUMP
	db 11
	dw SNORLAX
	dw REST, CURSE, EARTHQUAKE, HYPER_BEAM
	db 11
	dw AERODACTYL
	dw SKY_ATTACK, ANCIENTPOWER, STRENGTH, HYPER_BEAM
	db 12
	dw CHARIZARD
	dw FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, HYPER_BEAM
	db 13
	dw DRAGONITE
	dw FIRE_BLAST, THUNDER, OUTRAGE, HYPER_BEAM
	db -1 ; end
	
	next_list_item ; CHAMPION (2)
	db "LANCE@", TRAINERTYPE_ITEM_MOVES
	db 12
	dw GYARADOS
	dw NO_ITEM
	dw FIRE_FANG, OUTRAGE, WATERFALL, AQUA_JET
	db 12
	dw TOGEKISS
	dw MINT_BERRY
	dw REST, MOONBLAST, MIST_BALL, OUTRAGE	
	db 12
	dw DRAGONITE
	dw NO_ITEM
	dw WATERFALL, THUNDER, OUTRAGE, HYPER_BEAM
	db 12
	dw CHARIZARD
	dw NO_ITEM
	dw FIRE_BLAST, SKY_ATTACK, EARTHQUAKE, HYPER_BEAM
	db 12
	dw FLYGON
	dw FOCUS_BAND
	dw DRAGON_CLAW, DRAGON_DANCE, EXTREMESPEED, EARTHQUAKE
	db -1 ; end
	db 13
	dw REGISTEEL
	dw MINT_BERRY
	dw REST, CURSE, EARTHQUAKE, METEOR_MASH

	next_list_item ; CHAMPION (3)
	db "LANCE@", TRAINERTYPE_MOVES
	db 15
	dw DRAGONITEX
	dw WATERFALL, EXTREMESPEED, OUTRAGE, HYPER_BEAM
	db -1 ; end

	end_list_items

BrockGroup: ;Gym Leader
	next_list_item ; BROCK (1)
	db "BROCK@", TRAINERTYPE_MOVES
	db 3
	dw GEODUDE
	dw ROCK_THROW, HARDEN, BIDE, SAND_ATTACK
	db 3
	dw OMANYTE
	dw BITE, BUBBLE, TACKLE, NO_MOVE
	db 5
	dw ONIX
	dw BIDE, SCREECH, WRAP, ROCK_THROW
	db -1 ; end
	
	next_list_item ; BROCK (2)
	db "BROCK@", TRAINERTYPE_MOVES
	db 9
	dw DUNSPARCE
	dw ROCK_TOMB, DIG, EARTHQUAKE, SANDSTORM
	db 9
	dw LUNATONE
	dw ROCK_TOMB, COSMIC_POWER, PSYCHIC_M, SANDSTORM
	db 9
	dw NOSEPASS
	dw ROCK_TOMB, COSMIC_POWER, THUNDERBOLT, SANDSTORM
	db 9
	dw KABUTOPS
	dw SLASH, ROCK_TOMB, ICE_PUNCH, SANDSTORM
	db 10
	dw OMASTAR
	dw CRUNCH, SURF, PROTECT, SPIKE_CANNON
	db 11
	dw RHYDON
	dw DRAGON_CLAW, EARTHQUAKE, BULK_UP, ROCK_TOMB
	db -1 ; end
	
	next_list_item ; BROCK (3)
	db "BROCK@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw RHYPERIOR
	dw LEFTOVERS
	dw ROCK_TOMB, STONE_EDGE, DRAGON_CLAW, SANDSTORM
	db 9
	dw LUNATONE
	dw NO_ITEM
	dw ROCK_TOMB, COSMIC_POWER, PSYCHIC_M, SANDSTORM
	db 9
	dw SOLROCK
	dw NO_ITEM
	dw ROCK_TOMB, COSMIC_POWER, FLAMETHROWER, SANDSTORM
	db 9
	dw KLEAVOR
	dw NO_ITEM
	dw SLASH, ROCK_TOMB, STONE_EDGE, SANDSTORM
	db 10
	dw AGOLEM
	dw MAGNET
	dw THUNDERBOLT, STONE_EDGE, PROTECT, EARTHQUAKE
	db 11
	dw AERODACTYLX
	dw KINGS_ROCK
	dw DRILL_PECK, DRAGON_CLAW, CRUNCH, STONE_EDGE

	end_list_items

MistyGroup: ;Gym Leader
	next_list_item ; MISTY (1)
	db "MISTY@", TRAINERTYPE_MOVES
	db 8
	dw LUVDISC
	dw BUBBLEBEAM, CHARM, AQUA_JET, RAIN_DANCE
	db 8
	dw CHINCHOU
	dw BUBBLEBEAM, THUNDERSHOCK, RAIN_DANCE, WHIRLPOOL	
	db 8
	dw PSYDUCK
	dw BUBBLEBEAM, DISABLE, SCRATCH, CONFUSION
	db 9
	dw STARYU
	dw BUBBLEBEAM, CONFUSION, RECOVER, POWDER_SNOW
	db -1 ; end
	
	next_list_item ; MISTY (2)
	db "MISTY@", TRAINERTYPE_MOVES
	db 9
	dw PELIPPER
	dw SURF, THUNDER, RAIN_DANCE, WHIRLPOOL
	db 9
	dw SEAKING
	dw SURF, DRILL_PECK, RAIN_DANCE, WATERFALL
	db 9
	dw MASQUERAIN
	dw SURF, TWINEEDLE, SIGNAL_BEAM, RAIN_DANCE
	db 10
	dw GOLDUCK
	dw SURF, SLASH, CALM_MIND, PSYBEAM
	db 11
	dw STARMIE
	dw SURF, PSYCHIC_M, RECOVER, CALM_MIND
	db -1 ; end
	
	next_list_item ; MISTY (3)
	db "MISTY@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw LUVDISC
	dw NO_ITEM
	dw WATER_SPOUT, AQUA_JET, RAIN_DANCE, SCALD
	db 9
	dw SEAKING
	dw NO_ITEM
	dw AQUA_JET, DRILL_PECK, RAIN_DANCE, WATERFALL	
	db 9
	dw GOLDUCK
	dw MIRACLEBERRY
	dw HYDRO_PUMP, THUNDER, MEDITATE, PSYCHIC_M
	db 9
	dw MILOTIC
	dw NO_ITEM
	dw HYDRO_PUMP, BLIZZARD, CALM_MIND, REST
	db 10
	dw STARMIE
	dw KINGS_ROCK
	dw SURF, PSYCHIC_M, RECOVER, CALM_MIND
	db 11
	dw TOTARTLE
	dw NO_ITEM
	dw SCALD, HYDRO_PUMP, THUNDER, CRUNCH
	db -1 ; end

	end_list_items

LtSurgeGroup: ;Gym Leader
	next_list_item ; LT_SURGE (1)
	db "LT.SURGE@", TRAINERTYPE_MOVES
	db 8
	dw CHINCHOU
	dw WATER_GUN, THUNDERSHOCK, POWDER_SNOW, THUNDER_WAVE
	db 8
	dw PIKACHU
	dw DIG, QUICK_ATTACK, THUNDERSHOCK, PIXIE_DUST	
	db 8
	dw MAGNEMITE
	dw THUNDERSHOCK, METAL_CLAW, SUPERSONIC, THUNDER_WAVE	
	db 9
	dw ELECTABUZZ
	dw REFLECT, THUNDERPUNCH, DIZZY_PUNCH, THUNDERBOLT
	db -1 ; end
	
	next_list_item ; LT_SURGE (2)
	db "LT.SURGE@", TRAINERTYPE_MOVES
	db 9
	dw LANTURN
	dw WATER_PULSE, THUNDERBOLT, ICE_BEAM, THUNDER_WAVE
	db 9
	dw RAICHU
	dw DIG, SURF, VOLT_TACKLE, SWIFT	
	db 9
	dw MANECTRIC
	dw VOLT_TACKLE, METAL_CLAW, PURSUIT, THUNDER_WAVE
	db 9
	dw JOLTEON
	dw THUNDERBOLT, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	db 11
	dw ELECTIVIRE
	dw REFLECT, THUNDERPUNCH, DIZZY_PUNCH, MACH_PUNCH
	db -1 ; end
	
	next_list_item ; LT_SURGE (3)
	db "LT.SURGE@", TRAINERTYPE_ITEM_MOVES
	db 8
	dw LANTURN
	dw LEFTOVERS
	dw SURF, THUNDER, ICE_BEAM, THUNDER_WAVE	
	db 8
	dw MANECTRIC
	dw QUICK_CLAW
	dw THUNDER, CRUNCH, PURSUIT, THUNDER_WAVE
	db 8
	dw JOLTEON
	dw MAGNET
	dw ZAP_CANNON, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	db 9
	dw ELECTIVIRE
	dw MAGNET
	dw ZAP_CANNON, THUNDERPUNCH, DIZZY_PUNCH, THUNDERBOLT
	db 11
	dw RAICHU
	dw KINGS_ROCK
	dw OUTRAGE, BEAT_UP, VOLT_TACKLE, SURF	
	db 11
	dw ZAPDOS
	dw KINGS_ROCK
	dw DRILL_PECK, FLASHCANNON, VOLT_TACKLE, THUNDERBOLT	
	db -1 ; end

	end_list_items

ScientistGroup:
	next_list_item ; SCIENTIST (1) Team Rocket Hideout - B3F
	db "ROSS@", TRAINERTYPE_NORMAL
	db 8
	dw WEEZING
	db 8
	dw ARBOK
	db -1 ; end

	next_list_item ; SCIENTIST (2) Team Rocket Hideout - B3F
	db "MITCH@", TRAINERTYPE_NORMAL
	db 15
	dw DITTO
	db -1 ; end

	next_list_item ; SCIENTIST (3) Team Rocket Hideout - B1F
	db "JED@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNETON
	db 7
	dw ELECTRODE
	db 7
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; SCIENTIST (4) Goldenrod City - Radio Tower
	db "MARC@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNETON
	db 7
	dw PORYGON2
	db 7
	dw MINUN
	db -1 ; end

	next_list_item ; SCIENTIST (5) Goldenrod City - Radio Tower
	db "RICH@", TRAINERTYPE_MOVES
	db 11
	dw PORYGON2
	dw CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db -1 ; end

	end_list_items

ErikaGroup: ;Gym Leader
	next_list_item ; ERIKA (1)
	db "ERIKA@", TRAINERTYPE_MOVES
	db 8
	dw TANGELA
	dw STUN_SPORE, REFLECT, ABSORB, SLEEP_POWDER
	db 8
	dw SKIPLOOM
	dw ABSORB, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	db 9
	dw WEEPINBELL
	dw SUNNY_DAY, STUN_SPORE, ACID, RAZOR_LEAF
	db -1 ; end
	
	next_list_item ; ERIKA (2)
	db "ERIKA@", TRAINERTYPE_MOVES
	db 9
	dw SUNFLORA
	dw STUN_SPORE, REFLECT, SOLARBEAM, SUNNY_DAY
	db 9
	dw JUMPLUFF
	dw MEGA_DRAIN, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	db 9
	dw VICTREEBEL
	dw SUNNY_DAY, SOLARBEAM, SLUDGE_BOMB, RAZOR_LEAF
	db 9
	dw LUDICOLO
	dw SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, SURF
	db 11
	dw BELLOSSOM
	dw SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SOLARBEAM
	db -1 ; end
	
	next_list_item ; ERIKA (3)
	db "ERIKA@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw LEAFEON
	dw NO_ITEM
	dw LEAF_BLADE, SUBMISSION, BULK_UP, RECOVER
	db 9
	dw SCEPTILE
	dw NO_ITEM
	dw LEAF_BLADE, PURSUIT, DRAGON_DANCE, FRENZY_PLANT	
	db 9
	dw LUDICOLO
	dw NO_ITEM
	dw SUNNY_DAY, SOLARBEAM, GIGA_DRAIN, SURF
	db 9
	dw TROPIUS
	dw NO_ITEM
	dw SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SKY_ATTACK
	db 10
	dw BELLOSSOM
	dw NO_ITEM
	dw SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SOLARBEAM
	db 11
	dw VICTREEBELX
	dw LEFTOVERS
	dw SUNNY_DAY, SOLARBEAM, SLUDGE_BOMB, RAZOR_LEAF
	db -1 ; end

	end_list_items

YoungsterGroup:
	next_list_item ; YOUNGSTER (1) Route 30 
	db "JOEY@", TRAINERTYPE_NORMAL
	db 1
	dw RATTATA
	db -1 ; end

	next_list_item ; YOUNGSTER (2) Route 30
	db "MIKEY@", TRAINERTYPE_NORMAL
	db 1
	dw PIDGEY
	db 1
	dw RATTATA
	db -1 ; end

	next_list_item ; YOUNGSTER (3) Route 32
	db "ALBERT@", TRAINERTYPE_NORMAL
	db 2
	dw RATTATA
	db 3
	dw ZUBAT
	db -1 ; end

	next_list_item ; YOUNGSTER (4) Route 32
	db "GORDON@", TRAINERTYPE_NORMAL
	db 4
	dw WOOPER
	db 4
	dw MUDKIP
	db -1 ; end

	next_list_item ; YOUNGSTER (5) Route 34
	db "SAMUEL@", TRAINERTYPE_NORMAL
	db 3
	dw RATTATA
	db 3
	dw SANDSHREW
	db 5
	dw TAILLOW
	db 6
	dw SHROOMISH
	db -1 ; end

	next_list_item ; YOUNGSTER (6) Route 34
	db "IAN@", TRAINERTYPE_NORMAL
	db 3
	dw MANKEY
	db 4
	dw SWINUB
	db 5
	dw DIGLETT
	db -1 ; end

	next_list_item ; YOUNGSTER (7) Route 30 Rematch 1
	db "JOEY@", TRAINERTYPE_NORMAL
	db 10
	dw RATTATA
	db -1 ; end

	next_list_item ; YOUNGSTER (8) Route 30 Rematch 2
	db "JOEY@", TRAINERTYPE_NORMAL
	db 12
	dw RATICATE
	db -1 ; end

	next_list_item ; YOUNGSTER (9) Route 03
	db "WARREN@", TRAINERTYPE_NORMAL
	db 3
	dw SPEAROW
	db 3
	dw GULPIN
	db -1 ; end

	next_list_item ; YOUNGSTER (10) Route 03
	db "JIMMY@", TRAINERTYPE_NORMAL
	db 3
	dw RATTATA
	db 4
	dw EKANS
	db -1 ; end

	next_list_item ; YOUNGSTER (11) Route 11
	db "OWEN@", TRAINERTYPE_NORMAL
	db 5
	dw GROWLITHE
	db 5
	dw PONYTA
	db -1 ; end

	next_list_item ; YOUNGSTER (12) Route 11
	db "JASON@", TRAINERTYPE_NORMAL
	db 3
	dw SANDSLASH
	db 4
	dw CROBAT
	db -1 ; end

	next_list_item ; YOUNGSTER (13) Route 30 Rematch 3
	db "JOEY@", TRAINERTYPE_NORMAL
	db 15
	dw RATICATE
	db -1 ; end

	next_list_item ; YOUNGSTER (14) Route 30 Rematch 4
	db "JOEY@", TRAINERTYPE_NORMAL
	db 20
	dw RATICATE
	db -1 ; end

	next_list_item ; YOUNGSTER (15) Ilex West (Contest placeholder team)
	db "RONALD@", TRAINERTYPE_NORMAL
	db 9
	dw GIRAFARIG
	db 7
	dw BALTOY
	db 7
	dw POLIWHIRL
	db 3
	dw FEEBAS
	db 7
	dw SKIPLOOM
	db 10
	dw ANINETALES
	db -1 ; end

	next_list_item ; YOUNGSTER (16) Johto Games (Contest placeholder team)
	db "RONALD@", TRAINERTYPE_NORMAL
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
	db "RONALD@", TRAINERTYPE_NORMAL
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
	db "JOSH@", TRAINERTYPE_NORMAL
	db 5
	dw GEODUDE
	db -1 ; end

	next_list_item ; YOUNGSTER (19) Rustboro Gym
	db "TOMMY@", TRAINERTYPE_NORMAL
	db 5
	dw SANDSHREW
	db -1 ; end

	next_list_item ; YOUNGSTER (20) Route 102
	db "CALVIN@", TRAINERTYPE_NORMAL
	db 0
	dw POOCHYENA
	db 0
	dw TAILLOW
	db -1 ; end

	next_list_item ; YOUNGSTER (21) Route 102
	db "ALLEN@", TRAINERTYPE_NORMAL
	db 0
	dw ZIGZAGOON
	db 0
	dw TAILLOW
	db -1 ; end

	next_list_item ; YOUNGSTER (22) Route 104
	db "BILLY@", TRAINERTYPE_NORMAL
	db 3
	dw ZIGZAGOON
	db 3
	dw SEEDOT
	db -1 ; end

	next_list_item ; YOUNGSTER (23) Route 116
	db "JOEY@", TRAINERTYPE_NORMAL
	db 5
	dw MACHOP
	db -1 ; end

	next_list_item ; YOUNGSTER (24) Route 116
	db "JOHNSON@", TRAINERTYPE_NORMAL
	db 5
	dw SHROOMISH
	db 5
	dw LOTAD
	db -1 ; end

	next_list_item ; YOUNGSTER (25) Route 110
	db "TIMMY@", TRAINERTYPE_NORMAL
	db 5
	dw ARON
	db 5
	dw ELECTRIKE
	db -1 ; end

	next_list_item ; YOUNGSTER (26) Mount Moon
	db "JOSH@", TRAINERTYPE_NORMAL
	db 3
	dw ARON
	db 4
	dw ELECTRIKE
	db 5
	dw RATTATA
	db -1 ; end

	next_list_item ; YOUNGSTER (27) Route 113
	db "LAO@", TRAINERTYPE_NORMAL
	db 3
	dw KOFFING
	db 4
	dw GRIMER
	db 5
	dw DUSTOX
	db -1 ; end

	next_list_item ; YOUNGSTER (28) Route 113
	db "DILLON@", TRAINERTYPE_NORMAL
	db 3
	dw AGRIMER
	db 4
	dw GULPIN
	db 5
	dw PARASECT
	db -1 ; end

	end_list_items

SECTION "Enemy Trainer Parties 2", ROMX

SchoolboyGroup:
	next_list_item ; SCHOOLBOY (1) National Park 
	db "JACK@", TRAINERTYPE_NORMAL
	db 2
	dw ODDISH
	db 3
	dw SWABLU
	db 5
	dw VOLTORB
	db -1 ; end

	next_list_item ; SCHOOLBOY (2) Unreferenced
	db "KIPP@", TRAINERTYPE_NORMAL 
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
	db "ALAN@", TRAINERTYPE_NORMAL
	db 9
	dw TANGELA
	db -1 ; end

	next_list_item ; SCHOOLBOY (4) Route 15
	db "JOHNNY@", TRAINERTYPE_NORMAL
	db 2
	dw BELLSPROUT
	db 4
	dw WEEPINBELL
	db 7
	dw VICTREEBEL
	db -1 ; end

	next_list_item ; SCHOOLBOY (5) Route 01
	db "DANNY@", TRAINERTYPE_NORMAL
	db 0
	dw RATTATA
	db -1 ; end

	next_list_item ; SCHOOLBOY (6) Route 15
	db "TOMMY@", TRAINERTYPE_NORMAL
	db 7
	dw XATU
	db 8
	dw ALAKAZAM
	db -1 ; end

	next_list_item ; SCHOOLBOY (7) Route 24
	db "DUDLEY@", TRAINERTYPE_NORMAL
	db 5
	dw ODDISH
	db 5
	dw VULPIX
	db -1 ; end

	next_list_item ; SCHOOLBOY (8) Route 25
	db "JOE@", TRAINERTYPE_NORMAL
	db 3
	dw TANGELA
	db 5
	dw EEVEE
	db -1 ; end

	next_list_item ; SCHOOLBOY (9) Route 15
	db "BILLY@", TRAINERTYPE_NORMAL
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
	db "CHAD@", TRAINERTYPE_NORMAL
	db 9
	dw MR__MIME
	db -1 ; end

	next_list_item ; SCHOOLBOY (11) Unreferenced
	db "NATE@", TRAINERTYPE_NORMAL
	db 7
	dw LEDIAN
	db 7
	dw EXEGGUTOR
	db -1 ; end

	next_list_item ; SCHOOLBOY (12) Unreferenced
	db "RICKY@", TRAINERTYPE_NORMAL
	db 7
	dw AIPOM
	db 7
	dw DITTO
	db -1 ; end

	next_list_item ; SCHOOLBOY (13) National Park
	db "JACK@", TRAINERTYPE_NORMAL
	db 4
	dw ODDISH
	db 7
	dw VOLTORB
	db 7
	dw VOLTORB2
	db -1 ; end

	next_list_item ; SCHOOLBOY (14) National Park Rematch 1
	db "JACK@", TRAINERTYPE_NORMAL
	db 4
	dw GLOOM
	db 7
	dw ELECTRODE
	db 7
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; SCHOOLBOY (15) Route 36 Rematch 1
	db "ALAN@", TRAINERTYPE_NORMAL
	db 11
	dw TANGELA
	db 11
	dw YANMA
	db -1 ; end

	next_list_item ; SCHOOLBOY (16) Route 36 Rematch 2
	db "ALAN@", TRAINERTYPE_NORMAL
	db 9
	dw NATU
	db 11
	dw TANGELA
	db 11
	dw QUAGSIRE
	db 11
	dw YANMA
	db -1 ; end

	next_list_item ; SCHOOLBOY (17) Route 38 Rematch 1
	db "CHAD@", TRAINERTYPE_NORMAL
	db 11
	dw MR__MIME
	db 11
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SCHOOLBOY (18) Route 38 Rematch 1
	db "CHAD@", TRAINERTYPE_NORMAL
	db 11
	dw MR__MIME
	db 11
	dw MAGNETON
	db -1 ; end

	next_list_item ; SCHOOLBOY (19) National Park Rematch 2
	db "JACK@", TRAINERTYPE_NORMAL
	db 11
	dw GLOOM
	db 11
	dw GROWLITHE
	db 11
	dw ELECTRODE
	db -1 ; end

	next_list_item ; SCHOOLBOY (20) National Park Rematch 3
	db "JACK@", TRAINERTYPE_MOVES
	db 10
	dw ELECTRODE
	dw SCREECH, SONICBOOM, ROLLOUT, LIGHT_SCREEN
	db 10
	dw GROWLITHE
	dw SUNNY_DAY, LEER, TAKE_DOWN, FLAME_WHEEL
	db 10
	dw VILEPLUME
	dw SOLARBEAM, SLEEP_POWDER, ACID, MOONLIGHT
	db -1 ; end

	next_list_item ; SCHOOLBOY (21) Route 36 Rematch 3
	db "ALAN@", TRAINERTYPE_NORMAL
	db 11
	dw NATU
	db 11
	dw TANGELA
	db 11
	dw QUAGSIRE
	db 11
	dw YANMA
	db -1 ; end

	next_list_item ; SCHOOLBOY (22) Route 36 Rematch 4
	db "ALAN@", TRAINERTYPE_MOVES
	db 10
	dw XATU
	dw PECK, NIGHT_SHADE, SWIFT, FUTURE_SIGHT
	db 10
	dw TANGELA
	dw POISONPOWDER, VINE_WHIP, BIND, MEGA_DRAIN
	db 10
	dw YANMA
	dw QUICK_ATTACK, DOUBLE_TEAM, SONICBOOM, SUPERSONIC
	db 10
	dw QUAGSIRE
	dw TAIL_WHIP, SLAM, AMNESIA, EARTHQUAKE
	db -1 ; end

	next_list_item ; SCHOOLBOY (23) Route 38 Rematch 2
	db "CHAD@", TRAINERTYPE_NORMAL
	db 11
	dw MR__MIME
	db 11
	dw MAGNETON
	db -1 ; end

	next_list_item ; SCHOOLBOY (24) Route 38 Rematch 3
	db "CHAD@", TRAINERTYPE_MOVES
	db 11
	dw MR__MIME
	dw PSYCHIC_M, LIGHT_SCREEN, REFLECT, ENCORE
	db 11
	dw MAGNETON
	dw ZAP_CANNON, THUNDER_WAVE, LOCK_ON, SWIFT
	db -1 ; end

	next_list_item ; SCHOOLBOY (25) Mauville City Gym
	db "BEN@", TRAINERTYPE_NORMAL
	db 7
	dw PIKACHU
	db 7
	dw LINOONE
	db -1 ; end

	next_list_item ; SCHOOLBOY (26) Route 118
	db "DALE@", TRAINERTYPE_NORMAL
	db 3
	dw MINUN
	db 5
	dw RAITORA
	db -1 ; end

	end_list_items

BirdKeeperGroup:
	next_list_item ; BIRD_KEEPER (1) Violet City Gym
	db "ROD@", TRAINERTYPE_NORMAL
	db 2
	dw PIDGEY
	db 4
	dw SPEAROW
	db 4
	dw HOOTHOOT
	db 4
	dw TAILLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (2) Violet City Gym
	db "ABE@", TRAINERTYPE_NORMAL
	db 5
	dw SPEAROW
	db 5
	dw SWABLU
	db 5
	dw HOPPIP
	db -1 ; end

	next_list_item ; BIRD_KEEPER (3) Route 35
	db "BRYAN@", TRAINERTYPE_NORMAL
	db 4
	dw PIDGEY
	db 6
	dw PIDGEOTTO
	db 4
	dw TAILLOW
	db 6
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (4) Glitter Lighthouse - 3F
	db "THEO@", TRAINERTYPE_NORMAL
	db 4
	dw PIDGEY
	db 6
	dw PIDGEOTTO
	db 4
	dw TAILLOW
	db 6
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (5) Route 38
	db "TOBY@", TRAINERTYPE_NORMAL
	db 5
	dw DODUO
	db 6
	dw DODUO
	db 7
	dw DODRIO
	db -1 ; end

	next_list_item ; BIRD_KEEPER (6) Glitter Lighthouse - 5F
	db "DENIS@", TRAINERTYPE_NORMAL
	db 3
	dw SPEAROW
	db 7
	dw FEAROW
	db 3
	dw SPEAROW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (7) Route 44
	db "VANCE@", TRAINERTYPE_NORMAL
	db 4
	dw PIDGEOTTO
	db 5
	dw PIDGEOTTO
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (8) Route 04
	db "HANK@", TRAINERTYPE_NORMAL
	db 5
	dw PIDGEY
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (9) Route 14
	db "ROY@", TRAINERTYPE_NORMAL
	db 4
	dw FEAROW
	db 5
	dw FEAROW
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (10) Route 18
	db "BORIS@", TRAINERTYPE_NORMAL
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
	db "BOB@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (12) Route 27
	db "JOSE@", TRAINERTYPE_NORMAL
	db 7
	dw FARFETCH_D
	db 7
	dw GOLBAT
	db -1 ; end

	next_list_item ; BIRD_KEEPER (13) Route 32
	db "PETER@", TRAINERTYPE_NORMAL
	db 2
	dw PIDGEY
	db 3
	dw HOOTHOOT
	db 5
	dw SPEAROW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (14) Route 27 Rematch 1
	db "JOSE@", TRAINERTYPE_NORMAL
	db 9
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (15) Route 13
	db "PERRY@", TRAINERTYPE_NORMAL
	db 9
	dw FARFETCH_D
	db -1 ; end

	next_list_item ; BIRD_KEEPER (16) Route 13
	db "BRET@", TRAINERTYPE_NORMAL
	db 6
	dw PIDGEOTTO
	db 8
	dw FEAROW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (17) Route 27 Rematch 2
	db "JOSE@", TRAINERTYPE_NORMAL
	db 12
	dw FARFETCH_D
	dw FURY_ATTACK, DETECT, FLY, SLASH
	db -1 ; end

	next_list_item ; BIRD_KEEPER (18) Route 44 Rematch 1
	db "VANCE@", TRAINERTYPE_NORMAL
	db 9
	dw PIDGEOTTO
	db 9
	dw PIDGEOTTO
	db -1 ; end

	next_list_item ; BIRD_KEEPER (19) Route 44 Rematch 2
	db "VANCE@", TRAINERTYPE_MOVES
	db 11
	dw PIDGEOT
	dw TOXIC, QUICK_ATTACK, WHIRLWIND, FLY
	db 11
	dw PIDGEOT
	dw SWIFT, DETECT, STEEL_WING, FLY
	db -1 ; end

	next_list_item ; BIRD_KEEPER (20) Route 105
	db "JOSUE@", TRAINERTYPE_NORMAL
	db 6
	dw FEAROW
	db 7
	dw TOGETIC
	db 8
	dw SKIPLOOM
	db 9
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (21) Fortree Gym
	db "HUMBERT@", TRAINERTYPE_NORMAL
	db 7
	dw SKARMORY
	db 7
	dw DODRIO
	db -1 ; end

	next_list_item ; BIRD_KEEPER (22) Fortree Gym
	db "JARED@", TRAINERTYPE_NORMAL
	db 7
	dw FEAROW
	db 7
	dw SKIPLOOM
	db -1 ; end

	next_list_item ; BIRD_KEEPER (23) Fortree Gym
	db "EDWARDO@", TRAINERTYPE_NORMAL
	db 7
	dw PIDGEOT
	db 7
	dw NOCTOWL
	db -1 ; end

	next_list_item ; BIRD_KEEPER (24) Fortree Gym
	db "DARIUS@", TRAINERTYPE_NORMAL
	db 7
	dw FARFETCH_D
	db 7
	dw BEAUTIFLY
	db -1 ; end

	next_list_item ; BIRD_KEEPER (25) Route 118
	db "CHESTER@", TRAINERTYPE_NORMAL
	db 4
	dw FEAROW
	db 6
	dw DUSTOX
	db -1 ; end

	next_list_item ; BIRD_KEEPER (26) Route 118
	db "PERRY@", TRAINERTYPE_NORMAL
	db 4
	dw GOLBAT
	db 6
	dw GLIGAR
	db -1 ; end

	next_list_item ; BIRD_KEEPER (27) Route 113
	db "COBY@", TRAINERTYPE_NORMAL
	db 6
	dw SKARMORY
	db 4
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (28) Route 119
	db "PHIL@", TRAINERTYPE_NORMAL
	db 5
	dw FEAROW
	db 5
	dw SWELLOW
	db -1 ; end

	next_list_item ; BIRD_KEEPER (29) Route 119
	db "HUGH@", TRAINERTYPE_NORMAL
	db 5
	dw WINGULL
	db 5
	dw TROPIUS
	db -1 ; end

	next_list_item ; BIRD_KEEPER (30) Route 120
	db "ROBERT@", TRAINERTYPE_NORMAL
	db 5
	dw SWABLU
	db 5
	dw DODRIO
	db -1 ; end

	next_list_item ; BIRD_KEEPER (31) Route 120
	db "COLIN@", TRAINERTYPE_NORMAL
	db 5
	dw WINGULL
	db 5
	dw NATU
	db -1 ; end

	end_list_items

LassGroup:
	next_list_item ; LASS (1) Goldenrod City Gym
	db "CARRIE@", TRAINERTYPE_NORMAL
	db 7
	dw SNUBBULL
	db 7
	dw PONYTA
	db 7
	dw LINOONE
	db -1 ; end

	next_list_item ; LASS (2) Goldenrod City Gym
	db "BRIDGET@", TRAINERTYPE_NORMAL 
	db 7
	dw JIGGLYPUFF
	db 7
	dw TEDDIURSA
	db 7
	dw LINOONE
	db -1 ; end

	next_list_item ; LASS (3) Fuschia City Gym
	db "ALICE@", TRAINERTYPE_NORMAL
	db 7
	dw GLOOM
	db 7
	dw ARBOK
	db 7
	dw SWALOT
	db -1 ; end

	next_list_item ; LASS (4) Unreferenced
	db "KRISE@", TRAINERTYPE_NORMAL
	db 7
	dw ODDISH
	db 7
	dw CUBONE
	db -1 ; end

	next_list_item ; LASS (5) Glitter Lighthouse - 4F
	db "CONNIE@", TRAINERTYPE_NORMAL
	db 7
	dw AZUMARILL
	db 7
	dw TOGETIC
	db 7
	dw PLUSLE
	db -1 ; end

	next_list_item ; LASS (6) Fuschia City Gym
	db "LINDA@", TRAINERTYPE_NORMAL
	db 7
	dw TANGELA
	db 7
	dw HYPNO
	db 7
	dw VENUSAUR
	db -1 ; end

	next_list_item ; LASS (7) Route 25
	db "LAURA@", TRAINERTYPE_NORMAL
	db 5
	dw GLOOM
	db 5
	dw PIDGEOTTO
	db -1 ; end

	next_list_item ; LASS (8) Route 25
	db "SHANNON@", TRAINERTYPE_NORMAL
	db 5
	dw PARAS
	db 7
	dw PARASECT
	db -1 ; end

	next_list_item ; LASS (9) Celadon City Gym
	db "MICHELLE@", TRAINERTYPE_NORMAL
	db 5
	dw SKIPLOOM
	db 5
	dw HOPPIP
	db 7
	dw JUMPLUFF
	db -1 ; end

	next_list_item ; LASS (10) Route 38
	db "DANA@", TRAINERTYPE_NORMAL
	db 7
	dw FLAAFFY
	db 7
	dw GOLDUCK
	db -1 ; end

	next_list_item ; LASS (11) Route 24
	db "ELLEN@", TRAINERTYPE_NORMAL
	db 5
	dw JIGGLYPUFF
	db 5
	dw SNUBBULL
	db -1 ; end

	next_list_item ; LASS (12) Glitter Lighthouse - 4F Rematch 1
	db "CONNIE@", TRAINERTYPE_NORMAL
	db 11
	dw AZUMARILL
	db 11
	dw TOGEKISS
	db 11
	dw PLUSLE
	db 11
	dw MINUN
	db -1 ; end

	next_list_item ; LASS (13) Glitter Lighthouse - 4F Rematch 2
	db "CONNIE@", TRAINERTYPE_NORMAL
	db 11
	dw AZUMARILL
	db 11
	dw TOGEKISS
	db 11
	dw PLUSLE
	db 11
	dw MINUN
	db 11
	dw RAICHU
	db -1 ; end

	next_list_item ; LASS (14) Route 38 Rematch 1
	db "DANA@", TRAINERTYPE_NORMAL
	db 9
	dw AMPHAROS
	db 9
	dw GOLDUCK
	db 9
	dw VOLBEAT
	db 9
	dw ILLUMISE
	db -1 ; end

	next_list_item ; LASS (15) Route 38 Rematch 2
	db "DANA@", TRAINERTYPE_NORMAL
	db 11
	dw AMPHAROS
	db 11
	dw GOLDUCK
	db 9
	dw VOLBEAT
	db 9
	dw ILLUMISE
	db -1 ; end

	next_list_item ; LASS (16) Route 38 Rematch 3
	db "DANA@", TRAINERTYPE_NORMAL
	db 11
	dw AMPHAROS
	db 11
	dw GOLDUCK
	db 9
	dw VOLBEAT
	db 9
	dw ILLUMISE
	db -1 ; end

	next_list_item ; LASS (17) Route 38 Rematch 4
	db "DANA@", TRAINERTYPE_NORMAL
	db 11
	dw AMPHAROS
	db 11
	dw GOLDUCK
	db 9
	dw VOLBEAT
	db 9
	dw ILLUMISE
	db -1 ; end

	next_list_item ; LASS (18) Mauville City Gym
	db "VIVIAN@", TRAINERTYPE_NORMAL	
	db 9
	dw LANTURN
	db -1 ; end

	next_list_item ; LASS (19) Route 102
	db "TIANA@", TRAINERTYPE_NORMAL	
	db 0
	dw ZIGZAGOON
	db 1
	dw SHROOMISH
	db -1 ; end

	next_list_item ; LASS (20) Route 104
	db "HALEY@", TRAINERTYPE_NORMAL	
	db 3
	dw HOPPIP
	db 4
	dw LOTAD
	db -1 ; end

	next_list_item ; LASS (21) Route 116
	db "KAREN@", TRAINERTYPE_NORMAL	
	db 5
	dw SHROOMISH
	db 6
	dw PIDGEY
	db -1 ; end

	next_list_item ; LASS (22) Route 116
	db "JANICE@", TRAINERTYPE_NORMAL	
	db 5
	dw MARILL
	db 4
	dw SPEAROW
	db -1 ; end

	next_list_item ; LASS (23) Mount Moon
	db "IRIS@", TRAINERTYPE_NORMAL	
	db 4
	dw CLEFAIRY
	db 5
	dw JIGGLYPUFF
	db -1 ; end

	next_list_item ; LASS (24) Mount Moon
	db "MIRIAM@", TRAINERTYPE_NORMAL	
	db 4
	dw GLOOM
	db 5
	dw ROSELIA
	db -1 ; end

	next_list_item ; LASS (25) Route 118
	db "SALLY@", TRAINERTYPE_NORMAL	
	db 4
	dw GLOOM
	db 5
	dw VOLBEAT
	db -1 ; end

	next_list_item ; LASS (26) Route 118
	db "ANNIE@", TRAINERTYPE_NORMAL	
	db 4
	dw MUNCHLAX
	db 5
	dw ROSELIA
	db -1 ; end

	end_list_items

JanineGroup: ;Gym Leader
	next_list_item ; JANINE (1)
	db "JANINE@", TRAINERTYPE_MOVES
	db 7
	dw KOFFING
	dw ACID, EMBER, TOXIC, WILLOWISP
	db 7
	dw GRIMER
	dw ACID, TACKLE, HARDEN, TOXIC
	db 9
	dw ARIADOS
	dw TWINEEDLE, MEGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	db -1 ; end
	
	next_list_item ; JANINE (1)
	db "JANINE@", TRAINERTYPE_MOVES
	db 9
	dw WEEZING
	dw SLUDGE, FIRE_SPIN, TOXIC, WILLOWISP
	db 9
	dw MUK
	dw ACID, RECOVER, HARDEN, TOXIC
	db 9
	dw SWALOT
	dw SLUDGE, MUD_SHOT, HARDEN, TOXIC
	db 9
	dw ARIADOS
	dw TWINEEDLE, MEGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	db 11
	dw NIDOQUEEN
	dw EARTHQUAKE, MEGAHORN, BULK_UP, SLUDGE_BOMB
	db -1 ; end
	
	next_list_item ; JANINE (3)
	db "JANINE@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw WEEZING
	dw LEFTOVERS
	dw SLUDGE_BOMB, FIRE_BLAST, AMNESIA, WILLOWISP
	db 9
	dw AMUK
	dw NO_ITEM
	dw SLUDGE_BOMB, RECOVER, ACID_ARMOR, TOXIC
	db 9
	dw SWALOT
	dw NO_ITEM
	dw SLUDGE_BOMB, MUD_SHOT, COSMIC_POWER, TOXIC
	db 9
	dw ARIADOS
	dw NO_ITEM
	dw MEGAHORN, MEGA_DRAIN, PSYCHIC_M, NIGHT_SHADE
	db 10
	dw NIDOQUEEN
	dw NO_ITEM
	dw EARTHQUAKE, MEGAHORN, BULK_UP, SLUDGE_BOMB
	db 11
	dw VENUSAURX
	dw MINT_BERRY
	dw EARTHQUAKE, GIGA_DRAIN, REST, SLUDGE_BOMB
	db -1 ; end

	end_list_items

CooltrainerMGroup:
	next_list_item ; COOLTRAINERM (1) Union Cave - B2F
	db "NICK@", TRAINERTYPE_NORMAL
	db 9
	dw CHARIZARD
	db 9
	dw BLASTOISE
	db 9
	dw VENUSAUR
	db 5
	dw RAICHU
	db 5
	dw SKARMORY
	db 4
	dw OCTILLERY
	db -1 ; end

	next_list_item ; COOLTRAINERM (2) Unreferenced
	db "AARON@", TRAINERTYPE_NORMAL
	db 6
	dw IVYSAUR
	db 6
	dw CHARMELEON
	db 6
	dw WARTORTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (3) Blackthorn City Gym
	db "PAUL@", TRAINERTYPE_NORMAL
	db 9
	dw DRAGONAIR
	db 9
	dw SEADRA
	db 7
	dw YANMA2
	db -1 ; end

	next_list_item ; COOLTRAINERM (4) Blackthorn City Gym
	db "CODY@", TRAINERTYPE_NORMAL
	db 5
	dw HORSEA
	db 7
	dw SEADRA
	db 5
	dw YANMA
	db 7
	dw FURRET
	db -1 ; end

	next_list_item ; COOLTRAINERM (5) Blackthorn City Gym
	db "MIKE@", TRAINERTYPE_NORMAL
	db 7
	dw CHARIZARD
	db 7
	dw VIBRAVA
	db 7
	dw DRAGONAIR
	db -1 ; end

	next_list_item ; COOLTRAINERM (6) Route 26
	db "GAVEN@", TRAINERTYPE_NORMAL
	db 9
	dw VICTREEBEL
	db 9
	dw KINGLER
	db 9
	dw FLAREON
	db 9
	dw SEVIPER
	db -1 ; end

	next_list_item ; COOLTRAINERM (7) Route 26 Rematch 1
	db "GAVEN@", TRAINERTYPE_NORMAL
	db 9
	dw VICTREEBEL
	db 9
	dw KINGLER
	db 9
	dw FLAREON
	db 9
	dw SEVIPER
	db 9
	dw ZANGOOSE
	db -1 ; end

	next_list_item ; COOLTRAINERM (8) Route 45
	db "RYAN@", TRAINERTYPE_NORMAL
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
	db "JAKE@", TRAINERTYPE_NORMAL
	db 7
	dw PARASECT
	db 7
	dw GOLDUCK
	db 4
	dw TRAPINCH
	db 9
	dw CAMERUPT
	db -1 ; end

	next_list_item ; COOLTRAINERM (10) Route 26 Rematch 2
	db "GAVEN@", TRAINERTYPE_NORMAL
	db 11
	dw VICTREEBEL
	db 11
	dw KINGLER
	db 11
	dw FLAREON
	db 11
	dw SEVIPER
	db 11
	dw ZANGOOSE
	db -1 ; end

	next_list_item ; COOLTRAINERM (11) Route 27
	db "BLAKE@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNETON
	db 7
	dw QUAGSIRE
	db 7
	dw EXEGGUTOR2
	db -1 ; end

	next_list_item ; COOLTRAINERM (12) Route 27
	db "BRIAN@", TRAINERTYPE_NORMAL
	db 9
	dw SANDSLASH
	db 9
	dw SWALOT
	db 9
	dw GRUMPIG
	db -1 ; end

	next_list_item ; COOLTRAINERM (13) Unreferenced
	db "ERICK@", TRAINERTYPE_NORMAL
	db 10
	dw BULBASAUR
	db 10
	dw CHARMANDER
	db 10
	dw SQUIRTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (14) Unreferenced
	db "ANDY@", TRAINERTYPE_NORMAL
	db 10
	dw BULBASAUR
	db 10
	dw CHARMANDER
	db 10
	dw SQUIRTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (15) Unreferenced
	db "TYLER@", TRAINERTYPE_NORMAL
	db 10
	dw BULBASAUR
	db 10
	dw CHARMANDER
	db 10
	dw SQUIRTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (16) Unreferenced
	db "SEAN@", TRAINERTYPE_NORMAL
	db 10
	dw FLAREON
	db 10
	dw TANGELA
	db 10
	dw TAUROS
	db -1 ; end

	next_list_item ; COOLTRAINERM (17) Route 25
	db "KEVIN@", TRAINERTYPE_NORMAL
	db 8
	dw RHYHORN
	db 5
	dw CHARMELEON
	db 5
	dw WARTORTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (18) Unreferenced
	db "STEVE@", TRAINERTYPE_NORMAL
	db 7
	dw BULBASAUR
	db 7
	dw CHARMANDER
	db 7
	dw SQUIRTLE
	db -1 ; end

	next_list_item ; COOLTRAINERM (19) Unreferenced
	db "ALLEN@", TRAINERTYPE_MOVES
	db 7
	dw CHARMELEON
	dw EMBER, SMOKESCREEN, RAGE, SCARY_FACE
	db -1 ; end

	next_list_item ; COOLTRAINERM (20) Dragon's Den
	db "DARIN@", TRAINERTYPE_MOVES
	db 11
	dw DRAGONAIR
	dw WRAP, SURF, DRAGON_RAGE, SLAM
	db -1 ; end

	next_list_item ; COOLTRAINERM (21) Petalburg Gym
	db "RANDALL@", TRAINERTYPE_NORMAL
	db 11
	dw DELCATTY
	db -1 ; end

	next_list_item ; COOLTRAINERM (22) Petalburg Gym
	db "PARKER@", TRAINERTYPE_NORMAL
	db 11
	dw WIGGLYTUFF
	db -1 ; end

	next_list_item ; COOLTRAINERM (23) Petalburg Gym
	db "GEORGE@", TRAINERTYPE_NORMAL
	db 11
	dw RATICATE
	db -1 ; end

	next_list_item ; COOLTRAINERM (24) Lavaridge Gym
	db "GERALD@", TRAINERTYPE_NORMAL
	db 9
	dw AMAROWAK
	db 9
	dw DYNABEA
	db -1 ; end	

	next_list_item ; COOLTRAINERM (25) Daloric contest team #1
	db "DALORIC@", TRAINERTYPE_NORMAL
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
	db "DALORIC@", TRAINERTYPE_NORMAL
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
	db "CRYSTAL@", TRAINERTYPE_NORMAL
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
	db "CRYSTAL@", TRAINERTYPE_NORMAL
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
	db "LEONEL@", TRAINERTYPE_NORMAL
	db 7
	dw MANECTRIC
	db 7
	dw MANTINE
	db 7
	dw PARASECT
	db 8
	dw AKUERIA
	db -1 ; end

	end_list_items

CooltrainerFGroup:
	next_list_item ; COOLTRAINERF (1) Union Cave - B2F
	db "GWEN@", TRAINERTYPE_NORMAL
	db 6
	dw EEVEE
	db 9
	dw SYLVEON
	db 9
	dw LEAFEON
	db 9
	dw GLACEON
	db -1 ; end

	next_list_item ; COOLTRAINERF (2) Unreferenced
	db "LOIS@", TRAINERTYPE_NORMAL
	db 5
	dw SKIPLOOM
	db 7
	dw NINETALES
	db -1 ; end

	next_list_item ; COOLTRAINERF (3) Blackthorn City Gym
	db "FRAN@", TRAINERTYPE_NORMAL
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
	db "LOLA@", TRAINERTYPE_NORMAL
	db 4
	dw DRATINI
	db 6
	dw DRAGONAIR
	db -1 ; end

	next_list_item ; COOLTRAINERF (5) Route 34
	db "KATE@", TRAINERTYPE_NORMAL
	db 6
	dw SHELLDER
	db 8
	dw CLOYSTER
	db -1 ; end

	next_list_item ; COOLTRAINERF (6) Route 34
	db "IRENE@", TRAINERTYPE_NORMAL
	db 6
	dw GOLDEEN
	db 8
	dw SEAKING
	db -1 ; end

	next_list_item ; COOLTRAINERF (7) Route 45
	db "KELLY@", TRAINERTYPE_NORMAL
	db 7
	dw MARILL
	db 4
	dw WARTORTLE
	db 4
	dw WARTORTLE
	db -1 ; end

	next_list_item ; COOLTRAINERF (8) Route 26
	db "JOYCE@", TRAINERTYPE_NORMAL
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
	db "BETH@", TRAINERTYPE_NORMAL
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
	db "REENA@", TRAINERTYPE_NORMAL
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
	db "MEGAN@", TRAINERTYPE_NORMAL
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

	next_list_item ; COOLTRAINERF (12) Route 26 Rematch 1
	db "BETH@", TRAINERTYPE_NORMAL
	db 11
	dw RAPIDASH
	db 11
	dw RAPIDASH2
	db 11
	dw NINETALES
	db 11
	dw ANINETALES
	db 11
	dw NOCTOWL
	db 11
	dw EXEGGCUTE2
	db -1 ; end

	next_list_item ; COOLTRAINERF (13) Unreferenced
	db "CAROL@", TRAINERTYPE_NORMAL
	db 5
	dw ELECTRODE
	db 5
	dw STARMIE
	db 5
	dw NINETALES
	db -1 ; end

	next_list_item ; COOLTRAINERF (14) Route 1
	db "QUINN@", TRAINERTYPE_NORMAL
	db 0
	dw BULBASAUR
	db -1 ; end

	next_list_item ; COOLTRAINERF (15) Union Cave - B2F
	db "EMMA@", TRAINERTYPE_NORMAL
	db 8
	dw POLITOED
	db 8
	dw SUDOWOODO
	db 8
	dw LEDIAN
	db 8
	dw GIRAFARIG
	db -1 ; end

	next_list_item ; COOLTRAINERF (16) Route 44
	db "CYBIL@", TRAINERTYPE_NORMAL
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
	db "JENN@", TRAINERTYPE_NORMAL
	db 8 
	dw GLACEON
	db 8
	dw STARMIE
	db -1 ; end

	next_list_item ; COOLTRAINERF (18) Route 26 Rematch 2
	db "BETH@", TRAINERTYPE_NORMAL
	db 11
	dw RAPIDASH
	db 11
	dw RAPIDASH2
	db 11
	dw NINETALES
	db 11
	dw ANINETALES
	db 11
	dw NOCTOWL
	db 11
	dw EXEGGCUTE2
	db -1 ; end

	next_list_item ; COOLTRAINERF (19) Route 27 Rematch 1
	db "REENA@", TRAINERTYPE_NORMAL
	db 9
	dw STARMIE
	db 9
	dw NIDOQUEEN
	db 10
	dw GLISCOR
	db 9
	dw LUNATONE
	db 11
	dw FROSLASS
	db -1 ; end

	next_list_item ; COOLTRAINERF (20) Route 27 Rematch 2
	db "REENA@", TRAINERTYPE_NORMAL
	db 11
	dw STARMIE
	db 11
	dw NIDOQUEEN
	db 11
	dw GLISCOR
	db 11
	dw LUNATONE
	db 11
	dw FROSLASS
	db -1 ; end

	next_list_item ; COOLTRAINERF (21) Dragon's Den
	db "CARA@", TRAINERTYPE_NORMAL
	db 8
	dw SHARPEDO
	db 8
	dw CAMERUPT
	db 9
	dw ALTARIA
	db -1 ; end

	next_list_item ; COOLTRAINERF (21) Ilex West (LelouchIsKing contest party #1)
	db "MARINA@", TRAINERTYPE_NORMAL
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
	db "MARINA@", TRAINERTYPE_NORMAL
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
	db "MARINA@", TRAINERTYPE_NORMAL
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

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "MARY@", TRAINERTYPE_NORMAL
	db 11
	dw FURRET
	db -1 ; end

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "MARY@", TRAINERTYPE_NORMAL
	db 11
	dw DODRIO
	db -1 ; end

	next_list_item ; COOLTRAINERF (22) Petalburg Gym
	db "MARY@", TRAINERTYPE_NORMAL
	db 11
	dw SWELLOW
	db -1 ; end

	next_list_item ; COOLTRAINERF (23) Route 120
	db "JENNI@", TRAINERTYPE_NORMAL
	db 7
	dw SABLEYE
	db 7
	dw CORSOLA
	db 7
	dw RAITORA
	db 7
	dw MAWILE
	db -1 ; end

	next_list_item ; COOLTRAINERF (24) World Cup
	db "Monica@", TRAINERTYPE_MOVES
	db 9
	dw BUTTERFREE
	dw FAE_VOICE, STUN_SPORE, HURRICANE, PSYCHIC_M 
	db 9
	dw FEAROW
	dw DRILL_PECK, FLY, DOUBLE_EDGE, MIRROR_MOVE
	db 9
	dw NOCTOWL
	dw DRILL_PECK, PSYCHIC_M, HYPNOSIS, DREAM_EATER
	db 9
	dw ABSOL
	dw SKY_ATTACK, CRUNCH, FUTURE_SIGHT, SLASH
	db 9
	dw YANMEGA
	dw FLAMETHROWER, SKY_ATTACK, CRUNCH, OUTRAGE
	db 11
	dw SEAKING
	dw DRILL_PECK, FLY, DRAGON_DANCE, RAZORSHELL
	db -1 ; end

	next_list_item ; COOLTRAINERF (25) World Cup
	db "Tuscany@", TRAINERTYPE_MOVES
	db 9
	dw WIGGLYTUFF
	dw WILLOWISP, GLARE, DRAININGKISS, CALM_MIND 
	db 9
	dw LINOONE
	dw HYPER_VOICE, HYPER_BEAM, SUPERSONIC, ROAR
	db 9
	dw PERSIAN
	dw SLASH, PURSUIT, CRUNCH, PSYCHO_CUT
	db 9
	dw RAPIDASH
	dw MEGA_KICK, FLAME_WHEEL, FIRE_SPIN, DOUBLE_KICK
	db 9
	dw DELCATTY
	dw PLAY_ROUGH, CHARM, GROWL, SLASH
	db 11
	dw URSALUNA
	dw DOUBLE_EDGE, FISSURE, REST, BULK_UP
	db -1 ; end

	next_list_item ; COOLTRAINERF (26) World Cup
	db "Frieda@", TRAINERTYPE_MOVES
	db 9
	dw TENTACRUEL
	dw SURF, GIGA_DRAIN, ICY_WIND, SLUDGE_BOMB 
	db 9
	dw DUSTOX
	dw SLUDGE_BOMB, CONFUSE_RAY, STUN_SPORE, WHIRLWIND
	db 9
	dw AMUK
	dw SLUDGE_BOMB, PURSUIT, RECOVER, MINIMIZE
	db 9
	dw NIDOQUEEN
	dw SLUDGE_BOMB, EARTHQUAKE, BODY_SLAM, TOXIC
	db 9
	dw UMBREON
	dw TOXIC, RECOVER, GROWL, SNARL
	db 11
	dw GWEEZING
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

BeautyGroup:
	next_list_item ; BEAUTY (1) Goldenrod City Gym
	db "VICTORIA@", TRAINERTYPE_NORMAL
	db 7
	dw SENTRET
	db 7
	dw ZIGZAGOON
	db 7
	dw DELCATTY
	db -1 ; end

	next_list_item ; BEAUTY (2) Goldenrod City Gym
	db "SAMANTHA@", TRAINERTYPE_NORMAL
	db 9
	dw MEOWTH
	db 9
	dw MEOWTH
	db -1 ; end

	next_list_item ; BEAUTY (3) Unreferenced
	db "JULIE@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (4) Unreferenced
	db "JACLYN@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (5) Unreferenced
	db "BRENDA@", TRAINERTYPE_NORMAL
	db 6
	dw FURRET
	db -1 ; end

	next_list_item ; BEAUTY (6) Unreferenced
	db "CASSIE@", TRAINERTYPE_NORMAL
	db 7
	dw VILEPLUME
	db 5
	dw BUTTERFREE
	db -1 ; end

	next_list_item ; BEAUTY (7) Unreferenced
	db "CAROLINE@", TRAINERTYPE_NORMAL
	db 3
	dw MARILL
	db 5
	dw SEEL
	db 3
	dw MARILL
	db -1 ; end

	next_list_item ; BEAUTY (8) Unreferenced
	db "CARLENE@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (9) Unreferenced
	db "JESSICA@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (10) Unreferenced
	db "RACHAEL@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (11) Unreferenced
	db "ANGELICA@", TRAINERTYPE_NORMAL
	db 15
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (12) Unreferenced
	db "KENDRA@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (13) Unreferenced
	db "VERONICA@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (14) Celadon City Gym
	db "JULIA@", TRAINERTYPE_NORMAL
	db 7
	dw EXEGGCUTE2
	db 7
	dw EXEGGCUTE
	db 7
	dw PARASECT
	db -1 ; end

	next_list_item ; BEAUTY (15) Unreferenced
	db "THERESA@", TRAINERTYPE_NORMAL
	db 5
	dw SENTRET
	db -1 ; end

	next_list_item ; BEAUTY (16) Route 38
	db "VALERIE@", TRAINERTYPE_NORMAL
	db 5
	dw SKIPLOOM
	db 7
	dw SUNFLORA
	db -1 ; end

	next_list_item ; BEAUTY (17) Route 38
	db "OLIVIA@", TRAINERTYPE_NORMAL
	db 9
	dw CORSOLA
	db -1 ; end

	next_list_item ; BEAUTY (18) Route 103
	db "DAISY@", TRAINERTYPE_NORMAL
	db 5
	dw FURRET
	db -1 ; end

	next_list_item ; BEAUTY (19) Route 104
	db "CINDY@", TRAINERTYPE_NORMAL
	db 3
	dw HOOTHOOT
	db -1 ; end

	next_list_item ; BEAUTY (20) Route 109
	db "HAILEY@", TRAINERTYPE_NORMAL
	db 6
	dw NOCTOWL
	db 7
	dw AZUMARILL
	db -1 ; end

	next_list_item ; BEAUTY (21) Route 109
	db "LOLA@", TRAINERTYPE_NORMAL
	db 7
	dw AVULPIX
	db 7
	dw ROSELIA
	db -1 ; end

	next_list_item ; BEAUTY (22) Route 112
	db "SHAYLA@", TRAINERTYPE_NORMAL
	db 5
	dw SHROOMISH
	db 7
	dw ROSELIA
	db -1 ; end

	next_list_item ; BEAUTY (23) Route 120
	db "CLARISSA@", TRAINERTYPE_NORMAL
	db 5
	dw ROSELIA
	db 7
	dw WAILMER
	db -1 ; end

	next_list_item ; BEAUTY (23) Route 120
	db "CLARISSA@", TRAINERTYPE_NORMAL
	db 5
	dw EEVEE
	db 7
	dw SYLVEON
	db -1 ; end

	end_list_items

PokemaniacGroup:
	next_list_item ; POKEMANIAC (1) Union Cave - 1F
	db "LARRY@", TRAINERTYPE_NORMAL
	db 7
	dw SLOWPOKE
	db 7
	dw UNOWN
	db -1 ; end

	next_list_item ; POKEMANIAC (2) Union Cave - B1F
	db "ANDREW@", TRAINERTYPE_NORMAL
	db 7
	dw MAROWAK
	db 7
	dw MAROWAK
	db -1 ; end

	next_list_item ; POKEMANIAC (3) Union Cave - B1F
	db "CALVIN@", TRAINERTYPE_NORMAL
	db 7
	dw KANGASKHAN
	db 7
	dw TAUROS
	db 7
	dw TAUROS
	db -1 ; end

	next_list_item ; POKEMANIAC (4) Route 42
	db "SHANE@", TRAINERTYPE_NORMAL
	db 8
	dw NIDORINA
	db 8
	dw NIDORINO
	db -1 ; end

	next_list_item ; POKEMANIAC (5) Route 43
	db "BEN@", TRAINERTYPE_NORMAL
	db 5
	dw SLOWBRO
	db 5
	dw SUDOWOODO
	db 6
	dw QWILFISH
	db -1 ; end

	next_list_item ; POKEMANIAC (6) Route 43
	db "BRENT@", TRAINERTYPE_NORMAL
	db 5
	dw LICKITUNG
	db 7
	dw MR__MIME
	db 5
	dw CHANSEY
	db -1 ; end

	next_list_item ; POKEMANIAC (7) Route 43
	db "RON@", TRAINERTYPE_NORMAL
	db 4
	dw HITMONLEE
	db 5
	dw WOBBUFFET
	db 9
	dw NIDOKING
	db -1 ; end

	next_list_item ; POKEMANIAC (8) Unreferenced
	db "ETHAN@", TRAINERTYPE_NORMAL
	db 3
	dw RHYHORN
	db 7
	dw RHYDON
	db -1 ; end

	next_list_item ; POKEMANIAC (9) Route 43 Rematch 1
	db "BRENT@", TRAINERTYPE_NORMAL
	db 9
	dw LICKITUNG
	db 9
	dw MR__MIME
	db 9
	dw CHANSEY
	db -1 ; end

	next_list_item ; POKEMANIAC (10) Route 43 Rematch 2
	db "BRENT@", TRAINERTYPE_MOVES
	db 9
	dw LICKITUNG
	db 9
	dw MR__MIME
	db 9
	dw CHANSEY
	db -1 ; end

	next_list_item ; POKEMANIAC (11) Goldenrod Underground
	db "ISSAC@", TRAINERTYPE_MOVES
	db 7
	dw LICKITUNG
	dw LICK, SUPERSONIC, CUT, NO_MOVE
	db -1 ; end

	next_list_item ; POKEMANIAC (12) Goldenrod Underground
	db "DONALD@", TRAINERTYPE_NORMAL
	db 5
	dw SLOWPOKE
	db 5
	dw DODUO
	db -1 ; end

	next_list_item ; POKEMANIAC (13) Route 44
	db "ZACH@", TRAINERTYPE_NORMAL
	db 7
	dw RHYHORN
	db 7
	dw AERODACTYL
	db 7
	dw AIPOM
	db -1 ; end

	next_list_item ; POKEMANIAC (14) Route 43 Rematch 3
	db "BRENT@", TRAINERTYPE_NORMAL
	db 11
	dw LICKITUNG
	db 11
	dw MR__MIME
	db 11
	dw CHANSEY
	db -1 ; end

	next_list_item ; POKEMANIAC (15) Mt. Mortar
	db "MILLER@", TRAINERTYPE_NORMAL
	db 9
	dw NIDOKING
	db 9
	dw NIDOQUEEN
	db -1 ; end

	next_list_item ; POKEMANIAC (16) Route 113
	db "WYATT@", TRAINERTYPE_NORMAL
	db 5
	dw ARON
	db 5
	dw ARON
	db -1 ; end

	next_list_item ; POKEMANIAC (17) Route 114
	db "WYATT@", TRAINERTYPE_NORMAL
	db 5
	dw LAIRON
	db 5
	dw VAPOREON
	db -1 ; end

	next_list_item ; POKEMANIAC (18) Route 119
	db "DONALD@", TRAINERTYPE_NORMAL
	db 5
	dw BUTTERFREE
	db 5
	dw BEAUTIFLY
	db -1 ; end

	next_list_item ; POKEMANIAC (19) Route 119
	db "TAYLOR@", TRAINERTYPE_NORMAL
	db 5
	dw BEEDRILL
	db 5
	dw DUSTOX
	db -1 ; end

	next_list_item ; POKEMANIAC (20) Route 119
	db "BRENT@", TRAINERTYPE_NORMAL
	db 5
	dw PINSIR
	db 5
	dw SCYTHER
	db -1 ; end

	next_list_item ; POKEMANIAC (21) Route 120
	db "JEFFREY@", TRAINERTYPE_NORMAL
	db 5
	dw SURSKIT
	db 5
	dw PORYGON
	db -1 ; end

	end_list_items

GruntMGroup:
	next_list_item ; GRUNTM (1) Slowpoke Well BF1
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 7
	dw KOFFING
	db 7
	dw POOCHYENA
	db -1 ; end

	next_list_item ; GRUNTM (2) Slowpoke Well BF1
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 6
	dw RATTATA
	db 6
	dw ZUBAT
	db 6
	dw CARVANHA
	db -1 ; end

	next_list_item ; GRUNTM (3) Radio Tower 1F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 7
	dw RATICATE
	db 7
	dw DUSTOX
	db -1 ; end

	next_list_item ; GRUNTM (4) Radio Tower 2F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw MUK
	db 5
	dw MIGHTYENA
	db 5
	dw NUZLEAF
	db -1 ; end

	next_list_item ; GRUNTM (5) Radio Tower 2F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw SHIFTRY
	db 5
	dw SWELLOW
	db 5
	dw FURRET
	db -1 ; end

	next_list_item ; GRUNTM (6) Radio Tower 2F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 6
	dw GOLBAT
	db 6
	dw YANMA2
	db -1 ; end

	next_list_item ; GRUNTM (7) Radio Tower 3F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw WEEZING
	db 5
	dw SEVIPER
	db 6
	dw GRUMPIG
	db -1 ; end

	next_list_item ; GRUNTM (8) Radio Tower 3F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 7
	dw WEEZING
	db 7
	dw ZANGOOSE
	db -1 ; end

	next_list_item ; GRUNTM (9) Radio Tower 3F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 4
	dw RATICATE
	db 6
	dw LINOONE
	db -1 ; end

	next_list_item ; GRUNTM (10) Radio Tower 4F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw ZUBAT
	db 6
	dw GOLBAT
	db 7
	dw SPINDA
	db -1 ; end

	next_list_item ; GRUNTM (11) Goldenrod Underground
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw MUK
	db 5
	dw KOFFING
	db 6
	dw NOSEPASS
	db -1 ; end

	next_list_item ; GRUNTM (12) Unreferenced
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	db 10
	dw HOUNDOUR
	db -1 ; end

	next_list_item ; GRUNTM (13) Goldenrod Underground
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw RATICATE
	db 5
	dw HARIYAMA
	db -1 ; end

	next_list_item ; GRUNTM (14) Goldenrod Underground
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 4
	dw RATICATE
	db 4
	dw GOLBAT
	db -1 ; end

	next_list_item ; GRUNTM (15) Goldenrod Underground
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 4
	dw GRIMER
	db 7
	dw WEEZING
	db -1 ; end

	next_list_item ; GRUNTM (16) Team Rocket Base B1F
	db "GRUNT@", TRAINERTYPE_NORMAL
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
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 8
	dw GOLBAT
	db 8
	dw DUSTOX
	db -1 ; end

	next_list_item ; GRUNTM (18) Team Rocket Base B2F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw RATICATE
	db 5
	dw MIGHTYENA
	db 4
	dw MIGHTYENA
	db -1 ; end

	next_list_item ; GRUNTM (19) Team Rocket Base B2F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 7
	dw VENOMOTH
	db 7
	dw GLALIE
	db -1 ; end

	next_list_item ; GRUNTM (20) Unreferenced
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 7
	dw HYPNO
	db 5
	dw GOLBAT
	db -1 ; end

	next_list_item ; GRUNTM (21) Unreferenced
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 6
	dw ZUBAT
	db 7
	dw GRIMER
	db 6
	dw RATTATA
	db -1 ; end

	next_list_item ; GRUNTM (22) Unreferenced
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	db 10
	dw GOLBAT
	db -1 ; end

	next_list_item ; GRUNTM (23) Unreferenced
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	db 10
	dw KOFFING
	db -1 ; end

	next_list_item ; GRUNTM (24) Goldenrod Underground
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw WEEZING
	db 5
	dw HAUNTER
	db -1 ; end

	next_list_item ; GRUNTM (25) Goldenrod Underground
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw CACTURNE
	db 4
	dw MUK
	db -1 ; end

	next_list_item ; GRUNTM (26) Unreferenced
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw RATTATA
	db 5
	dw RATTATA
	db -1 ; end

	next_list_item ; GRUNTM (27) Unreferenced
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	db 10
	dw ZUBAT
	db -1 ; end

	next_list_item ; GRUNTM (28) Team Rocket Base B3F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 15
	dw RATICATE
	db -1 ; end

	next_list_item ; GRUNTM (29) Slowpoke Well B1F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw SEEL
	db 6
	dw CUBONE
	db -1 ; end

	next_list_item ; GRUNTM (30) Unreferenced
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw GOLBAT
	db 5
	dw GOLBAT
	db 7
	dw ARBOK
	db -1 ; end

	next_list_item ; GRUNTM (31) Unreferenced
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 7
	dw GOLBAT
	db -1 ; end

	next_list_item ; GRUNTM (32) Mount Moon 1
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw ZUBAT
	db 5
	dw SANDSHREW
	db -1 ; end

	next_list_item ; GRUNTM (33) Mount Moon 2
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw EKANS
	db 5
	dw SEVIPER
	db -1 ; end

	next_list_item ; GRUNTM (34) Mount Moon 3
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw RATICATE
	db 5
	dw HOOTHOOT
	db -1 ; end

	next_list_item ; GRUNTM (35) Mount Moon 4
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw GRIMER
	db 5
	dw GULPIN
	db -1 ; end

	next_list_item ; GRUNTM (36) Safari Grunt 1
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw MUK
	db 5
	dw ZANGOOSE
	db -1 ; end

	next_list_item ; GRUNTM (37) Safari Grunt 2
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw MAROWAK
	db 5
	dw EXEGGUTOR2
	db -1 ; end

	next_list_item ; GRUNTM (38) Safari Grunt 3
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw TENTACRUEL
	db 5
	dw TENTACRUEL2
	db -1 ; end

	next_list_item ; GRUNTM (39) Safari Grunt 4
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw LICKILICKY
	db 5
	dw AMAROWAK
	db -1 ; end

	next_list_item ; GRUNTM (40) Safari Grunt 5
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw HELECTRODE
	db 5
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; GRUNTM (41) Safari Grunt 6
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw CRAWDAUNT
	db 5
	dw KINGLER
	db -1 ; end

	next_list_item ; GRUNTM (42) Safari Grunt 7
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw DUSCLOPS
	db 5
	dw VICTREEBEL
	db -1 ; end

	next_list_item ; GRUNTM (43) Rustturf Grunt 1
	db "Alex@", TRAINERTYPE_NORMAL
	db 5
	dw BALTOY
	db 5
	dw POOCHYENA
	db -1 ; end

	next_list_item ; GRUNTM (43) Rustturf Grunt 2
	db "Ryan@", TRAINERTYPE_NORMAL
	db 5
	dw LINOONE
	db 5
	dw CARVANHA
	db -1 ; end

	next_list_item ; GRUNTM (44) Mauville Grunt 1
	db "Ryan@", TRAINERTYPE_NORMAL
	db 6
	dw LINOONE
	db 7
	dw SHARPEDO
	db -1 ; end

	next_list_item ; GRUNTM (45) Mauville Grunt 2
	db "Alex@", TRAINERTYPE_NORMAL
	db 6
	dw BALTOY
	db 7
	dw MIGHTYENA
	db -1 ; end

	next_list_item ; GRUNTM (46) Mauville Grunt 3
	db "Jordan@", TRAINERTYPE_NORMAL
	db 6
	dw NUMEL
	db 7
	dw ARIADOS
	db -1 ; end

	next_list_item ; GRUNTM (47) Mauville Grunt 4
	db "Frank@", TRAINERTYPE_NORMAL
	db 6
	dw MAGMAR
	db 7
	dw HUNTAIL
	db -1 ; end

	next_list_item ; GRUNTM (48) Route 121 Grunt 1
	db "Ryan@", TRAINERTYPE_NORMAL
	db 5
	dw LINOONE
	db 6
	dw SHARPEDO
	db 7
	dw DODRIO
	db -1 ; end

	next_list_item ; GRUNTM (49) Route 121 Grunt 2
	db "Alex@", TRAINERTYPE_NORMAL
	db 6
	dw MIGHTYENA
	db 6
	dw CAMERUPT
	db 8
	dw CLAYDOL	
	db -1 ; end

	next_list_item ; GRUNTM (50) Mt Pyre Grunt 1
	db "Elite@", TRAINERTYPE_NORMAL
	db 6
	dw TORKOAL
	db 7
	dw CHARIZARD
	db 8
	dw DYNABEA
	db -1 ; end

	next_list_item ; GRUNTM (51) Mt Pyre Grunt 2
	db "Elite@", TRAINERTYPE_NORMAL
	db 6
	dw MANTINE
	db 7
	dw BLASTOISE
	db 8
	dw AKUERIA
	db -1 ; end

	next_list_item ; GRUNTM (52) Mt Pyre Grunt 3
	db "Elite@", TRAINERTYPE_NORMAL
	db 6
	dw DUNSPARCE
	db 7
	dw MAROWAK
	db 8
	dw GLISCOR
	db -1 ; end

	next_list_item ; GRUNTM (53) Mt Pyre Grunt 4
	db "Elite@", TRAINERTYPE_NORMAL
	db 6
	dw DELIBIRD
	db 7
	dw DEWGONG
	db 8
	dw GLACEON
	db -1 ; end
	
	end_list_items

GentlemanGroup:
	next_list_item ; GENTLEMAN (1) Glitter Lighthouse - 3F
	db "PRESTON@", TRAINERTYPE_NORMAL
	db 7
	dw ARCANINE
	db 7
	dw RAPIDASH
	db -1 ; end

	next_list_item ; GENTLEMAN (2) Unreferenced
	db "EDWARD@", TRAINERTYPE_NORMAL
	db 7
	dw PERSIAN
	db -1 ; end

	next_list_item ; GENTLEMAN (3) Vermilion City Gym
	db "GREGORY@", TRAINERTYPE_NORMAL
	db 7
	dw RAICHU
	db 7
	dw AMPHAROS
	db -1 ; end

	next_list_item ; GENTLEMAN (4) Unreferenced
	db "VIRGIL@", TRAINERTYPE_NORMAL
	db 20
	dw PONYTA
	db -1 ; end

	next_list_item ; GENTLEMAN (5) Glitter Lighthouse - 2F
	db "ALFRED@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw NOCTOWL
	db -1 ; end

	next_list_item ; GENTLEMAN (6) Mossdeep Gym
	db "CLIFF@", TRAINERTYPE_NORMAL
	db 7
	dw GIRAFARIG
	db 7
	dw STANTLER
	db 7
	dw NOCTOWL
	db -1 ; end

	next_list_item ; GENTLEMAN (7) Mossdeep Gym
	db "NATE@", TRAINERTYPE_NORMAL
	db 7
	dw MR__MIME
	db 7
	dw GRUMPIG	
	db 7
	dw XATU
	db -1 ; end

	end_list_items

SkierGroup:
	next_list_item ; SKIER (1) Mahogany Town Gym
	db "ROXANNE@", TRAINERTYPE_NORMAL
	db 7
	dw JYNX
	db 7
	dw GLALIE
	db -1 ; end

	next_list_item ; SKIER (2) Mahogany Town Gym
	db "CLARISSA@", TRAINERTYPE_NORMAL
	db 7
	dw DEWGONG
	db 7
	dw SNEASEL
	db -1 ; end

	end_list_items

TeacherGroup:
	next_list_item ; TEACHER (1) Route 15
	db "COLETTE@", TRAINERTYPE_NORMAL
	db 7
	dw CLEFAIRY
	db -1 ; end

	next_list_item ; TEACHER (2) Route 15
	db "HILLARY@", TRAINERTYPE_NORMAL
	db 5
	dw AIPOM
	db 6
	dw CUBONE
	db -1 ; end

	next_list_item ; TEACHER (3) Unreferenced
	db "SHIRLEY@", TRAINERTYPE_NORMAL
	db 5
	dw JIGGLYPUFF
	db -1 ; end

	next_list_item ; TEACHER (4) Ilex East (Jessadactyl contest party #1)
	db "JESS@", TRAINERTYPE_NORMAL
	db 5
	dw NATU
	db 5
	dw AGRIMER
	db 5
	dw LAIRON
	db 5
	dw TENTACRUEL
	db 5
	dw PRIMEAPE
	db 7
	dw GRANBULL
	db -1 ; end

	next_list_item ; TEACHER (5) Ilex East (Jessadactyl contest party #2)
	db "JESS@", TRAINERTYPE_MOVES
	db 8
	dw XATU
	dw PSYCHIC_M, DRILL_PECK, WILLOWISP, DARK_PULSE
	db 8
	dw AMUK
	dw SLUDGE_BOMB, SHADOW_PUNCH, COSMIC_POWER, RECOVER
	db 8
	dw AGGRON
	dw IRON_TAIL, COSMIC_POWER, ROCK_SLIDE, GUILLOTINE
	db 9
	dw TENTACRUEL
	dw SLUDGE_BOMB, HYDRO_PUMP, ICY_WIND, POWER_GEM
	db 9
	dw GRANBULL
	dw CRUNCH, SWORDS_DANCE, THUNDERPUNCH, PLAY_ROUGH
	db 10
	dw ANNIHILAPE
	dw CROSS_CHOP, SHADOW_PUNCH, FISSURE, BULK_UP
	db -1 ; end	

	next_list_item ; TEACHER (6)  (Klutch contest party #1)
	db "KLUTCH@", TRAINERTYPE_NORMAL
	db 5
	dw RHYHORN
	db 5
	dw CHARMANDER
	db 5
	dw SWABLU
	db 5
	dw FURRET
	db 5
	dw HANAMOLE
	db 7
	dw GYARADOS
	db -1 ; end

	next_list_item ; TEACHER (7)  (Klutch contest party #2)
	db "KLUTCH@", TRAINERTYPE_NORMAL
	db 7
	dw RHYDON
	db 7
	dw CHARIZARD
	db 7
	dw ALTARIA
	db 7
	dw HANAMOLE
	db 7
	dw FURRET
	db 9
	dw GYARADOS
	db -1 ; end

	next_list_item ; TEACHER (8)  (Klutch contest party #3)
	db "KLUTCH@", TRAINERTYPE_NORMAL
	db 10
	dw RHYPERIOR
	db 10
	dw CHARIZARDX
	db 10
	dw ALTARIAX
	db 10
	dw HANAMOLE
	db 10
	dw FURRET2
	db 11
	dw GYARADOSX
	db -1 ; end

	end_list_items

SabrinaGroup: ;Gym Leader
	next_list_item ; SABRINA (1)
	db "SABRINA@", TRAINERTYPE_MOVES
	db 7
	dw SMOOCHUM
	dw POWDER_SNOW, CONFUSION, SWEET_KISS, DIZZY_PUNCH
	db 7
	dw MR__MIME
	dw BARRIER, REFLECT, BATON_PASS, CONFUSION
	db 9
	dw KADABRA
	dw CONFUSION, FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH
	db -1 ; end
	
	next_list_item ; SABRINA (2)
	db "SABRINA@", TRAINERTYPE_MOVES
	db 9
	dw JYNX
	dw ICY_WIND, PSYBEAM, DIZZY_PUNCH, CALM_MIND
	db 9
	dw MR__MIME
	dw BARRIER, REFLECT, BATON_PASS, PSYBEAM
	db 9
	dw WOBBUFFET
	dw COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	db 9
	dw LUNATONE
	dw CALM_MIND, ANCIENTPOWER, ROCK_TOMB, PSYBEAM
	db 11
	dw ALAKAZAM
	dw PSYBEAM, CALM_MIND, RECOVER, SHADOW_BALL
	db -1 ; end
	
	next_list_item ; SABRINA (3)
	db "SABRINA@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw JYNX
	dw NO_ITEM
	dw ICY_WIND, PSYCHIC_M, DIZZY_PUNCH, CALM_MIND
	db 9
	dw MR__MIME
	dw NO_ITEM
	dw BARRIER, LIGHT_SCREEN, BATON_PASS, PSYCHIC_M
	db 9
	dw WOBBUFFET
	dw LEFTOVERS
	dw COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	db 9
	dw LUNATONE
	dw NO_ITEM
	dw CALM_MIND, REST, ROCK_TOMB, PSYCHIC_M
	db 10
	dw HYPNO
	dw MINT_BERRY
	dw CALM_MIND, REST, HYPNOSIS, DREAM_EATER
	db 11
	dw ALAKAZAMX
	dw BLACKBELT_I
	dw PSYCHIC_M, CALM_MIND, RECOVER, FOCUS_PUNCH
	db -1 ; end

	end_list_items

BugCatcherGroup:
	next_list_item ; BUG_CATCHER (1) Route 30
	db "DON@", TRAINERTYPE_NORMAL
	db 3
	dw CATERPIE
	db 3
	dw SURSKIT
	db -1 ; end

	next_list_item ; BUG_CATCHER (2) Route 02
	db "ROB@", TRAINERTYPE_NORMAL 
	db 0
	dw WEEDLE
	db 0
	dw CATERPIE
	db -1 ; end

	next_list_item ; BUG_CATCHER (3) Route 02
	db "ED@", TRAINERTYPE_NORMAL
	db 0
	dw WEEDLE
	db 0
	dw PIDGEY
	db -1 ; end

	next_list_item ; BUG_CATCHER (4) Route 31
	db "WADE@", TRAINERTYPE_NORMAL
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
	db "BENNY@", TRAINERTYPE_NORMAL
	db 2
	dw WEEDLE
	db 4
	dw KAKUNA
	db 9
	dw BEEDRILL
	db -1 ; end

	next_list_item ; BUG_CATCHER (6) Azalea Town Gym
	db "AL@", TRAINERTYPE_NORMAL
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
	db "JOSH@", TRAINERTYPE_NORMAL
	db 7
	dw PARAS
	db 7
	dw YANMA
	db 7
	dw TRAPINCH
	db -1 ; end

	next_list_item ; BUG_CATCHER (8) Route 35
	db "ARNIE@", TRAINERTYPE_NORMAL
	db 5
	dw VENONAT
	db 5
	dw VENONAT
	db -1 ; end

	next_list_item ; BUG_CATCHER (9) Unreferenced
	db "KEN@", TRAINERTYPE_NORMAL
	db 2
	dw ARIADOS
	db 4
	dw PINSIR
	db -1 ; end

	next_list_item ; BUG_CATCHER (10) Route 31 Rematch 1
	db "WADE@", TRAINERTYPE_NORMAL
	db 4
	dw METAPOD
	db 4
	dw METAPOD
	db 7
	dw KAKUNA
	db 5
	dw METAPOD
	db -1 ; end

	next_list_item ; BUG_CATCHER (11) Route 31 Rematch 2
	db "WADE@", TRAINERTYPE_NORMAL
	db 5
	dw BUTTERFREE
	db 5
	dw BUTTERFREE
	db 7
	dw BEEDRILL
	db 5
	dw BUTTERFREE
	db -1 ; end

	next_list_item ; BUG_CATCHER (12) Route 02
	db "DOUG@", TRAINERTYPE_NORMAL
	db 0
	dw SPINARAK
	db -1 ; end

	next_list_item ; BUG_CATCHER (13) Route 35 Rematch 1
	db "ARNIE@", TRAINERTYPE_NORMAL
	db 7
	dw VENONAT
	db -1 ; end

	next_list_item ; BUG_CATCHER (14) Route 35 Rematch 2
	db "ARNIE@", TRAINERTYPE_MOVES
	db 8
	dw VENOMOTH
	dw DISABLE, SUPERSONIC, CONFUSION, LEECH_LIFE
	db -1 ; end

	next_list_item ; BUG_CATCHER (15) Route 31 Rematch 3
	db "WADE@", TRAINERTYPE_MOVES
	db 6
	dw BUTTERFREE
	dw CONFUSION, POISONPOWDER, SUPERSONIC, WHIRLWIND
	db 7
	dw BUTTERFREE
	dw CONFUSION, STUN_SPORE, SUPERSONIC, WHIRLWIND
	db 9
	dw BEEDRILL
	dw FURY_ATTACK, FOCUS_ENERGY, TWINEEDLE, RAGE
	db 7
	dw BUTTERFREE
	dw CONFUSION, SLEEP_POWDER, SUPERSONIC, WHIRLWIND
	db -1 ; end

	next_list_item ; BUG_CATCHER (16) Route 31 Rematch 3
	db "WADE@", TRAINERTYPE_MOVES
	db 10
	dw BUTTERFREE
	dw CONFUSION, POISONPOWDER, SUPERSONIC, GUST
	db 10
	dw BUTTERFREE
	dw CONFUSION, STUN_SPORE, SUPERSONIC, GUST
	db 10
	dw BEEDRILL
	dw FURY_ATTACK, PURSUIT, TWINEEDLE, DOUBLE_TEAM
	db 10
	dw BUTTERFREE
	dw PSYBEAM, SLEEP_POWDER, GUST, WHIRLWIND
	db -1 ; end

	next_list_item ; BUG_CATCHER (17) Route 35 Rematch 3
	db "ARNIE@", TRAINERTYPE_MOVES
	db 10
	dw VENOMOTH
	dw GUST, SUPERSONIC, PSYBEAM, LEECH_LIFE
	db -1 ; end

	next_list_item ; BUG_CATCHER (18) Route 35 Rematch 4
	db "ARNIE@", TRAINERTYPE_MOVES
	db 12
	dw VENOMOTH
	dw GUST, SUPERSONIC, PSYCHIC_M, TOXIC
	db -1 ; end

	next_list_item ; BUG_CATCHER (19) Ilex Forest
	db "WAYNE@", TRAINERTYPE_NORMAL
	db 5
	dw LEDYBA
	db 6
	dw PARAS
	db -1 ; end

	next_list_item ; BUG_CATCHER (20) Mauville City Gym
	db "ANGELO@", TRAINERTYPE_NORMAL
	db 8
	dw ILLUMISE
	db 8
	dw VOLBEAT
	db -1 ; end

	next_list_item ; BUG_CATCHER (21) Route 102
	db "RICK@", TRAINERTYPE_NORMAL
	db 0
	dw WURMPLE
	db 1
	dw WURMPLE
	db -1 ; end

	next_list_item ; BUG_CATCHER (22) Petalburg Woods
	db "LYLE@", TRAINERTYPE_NORMAL
	db 3
	dw PARAS
	db 4
	dw SHROOMISH
	db -1 ; end

	next_list_item ; BUG_CATCHER (23) Petalburg Woods
	db "JAMES@", TRAINERTYPE_NORMAL
	db 3
	dw WURMPLE
	db 4
	dw WURMPLE
	db -1 ; end

	next_list_item ; BUG_CATCHER (24) Route 116
	db "JOSE@", TRAINERTYPE_NORMAL
	db 5
	dw WURMPLE
	db 7
	dw PARAS
	db -1 ; end

	next_list_item ; BUG_CATCHER (25) Route 117
	db "DEREK@", TRAINERTYPE_NORMAL
	db 5
	dw DUSTOX
	db 7
	dw BEAUTIFLY
	db -1 ; end

	next_list_item ; BUG_CATCHER (26) Mt Moon
	db "KENT@", TRAINERTYPE_NORMAL
	db 4
	dw WEEDLE
	db 4
	dw BUTTERFREE
	db -1 ; end

	next_list_item ; BUG_CATCHER (27) Mt Moon
	db "ROBBY@", TRAINERTYPE_NORMAL
	db 1
	dw CATERPIE
	db 2
	dw WEEDLE
	db 3
	dw PARAS
	db -1 ; end

	next_list_item ; BUG_CATCHER (28) Route119
	db "KENT@", TRAINERTYPE_NORMAL
	db 4
	dw PARAS
	db 4
	dw DUSTOX
	db -1 ; end

	next_list_item ; BUG_CATCHER (29) Route119
	db "GREG@", TRAINERTYPE_NORMAL
	db 4
	dw VOLBEAT
	db 4
	dw ILLUMISE
	db -1 ; end

	next_list_item ; BUG_CATCHER (30) Route119
	db "DOUG@", TRAINERTYPE_NORMAL
	db 4
	dw PINECO
	db 4
	dw HERACROSS
	db -1 ; end

	end_list_items

FisherGroup:
	next_list_item ; FISHER (1) Route 32
	db "JUSTIN@", TRAINERTYPE_NORMAL
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
	db "RALPH@", TRAINERTYPE_NORMAL
	db 7
	dw GOLDEEN
	db 7
	dw CARVANHA
	db 7
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; FISHER (3) Route 21
	db "ARNOLD@", TRAINERTYPE_NORMAL
	db 4
	dw TENTACRUEL
	db 4
	dw MAGNETON
	db -1 ; end

	next_list_item ; FISHER (4) Route 12
	db "KYLE@", TRAINERTYPE_NORMAL
	db 3
	dw SEAKING
	db 5
	dw MAGNETON
	db 5
	dw SEAKING
	db -1 ; end

	next_list_item ; FISHER (5) Route 32
	db "HENRY@", TRAINERTYPE_NORMAL
	db 5
	dw POLIWAG
	db 5
	dw POLIWAG
	db -1 ; end

	next_list_item ; FISHER (6) Route 43
	db "MARVIN@", TRAINERTYPE_NORMAL
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
	db "TULLY@", TRAINERTYPE_NORMAL
	db 8
	dw QWILFISH
	db -1 ; end

	next_list_item ; FISHER (8) Unreferenced
	db "ANDRE@", TRAINERTYPE_NORMAL
	db 7
	dw GYARADOS
	db -1 ; end

	next_list_item ; FISHER (9) Unreferenced
	db "RAYMOND@", TRAINERTYPE_NORMAL
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
	db "WILTON@", TRAINERTYPE_NORMAL
	db 3
	dw GOLDEEN
	db 3
	dw GOLDEEN
	db 6
	dw SEAKING
	db -1 ; end

	next_list_item ; FISHER (11) Route 44
	db "EDGAR@", TRAINERTYPE_NORMAL
	db 5
	dw REMORAID
	db 5
	dw REMORAID
	db -1 ; end

	next_list_item ; FISHER (12) Unreferenced
	db "JONAH@", TRAINERTYPE_NORMAL
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
	db "MARTIN@", TRAINERTYPE_NORMAL
	db 6
	dw REMORAID
	db 6
	dw REMORAID
	db -1 ; end

	next_list_item ; FISHER (14) Route 12
	db "STEPHEN@", TRAINERTYPE_NORMAL
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
	db "BARNEY@", TRAINERTYPE_NORMAL
	db 2
	dw GYARADOS
	db 2
	dw GYARADOS
	db 4
	dw GYARADOS
	db -1 ; end

	next_list_item ; FISHER (16) Route 32 Rematch 1
	db "RALPH@", TRAINERTYPE_NORMAL
	db 7
	dw GOLDEEN
	db -1 ; end

	next_list_item ; FISHER (17) Route 32 Rematch 2
	db "RALPH@", TRAINERTYPE_NORMAL
	db 8
	dw QWILFISH
	db 9
	dw GOLDEEN
	db -1 ; end

	next_list_item ; FISHER (18) Route 42 Rematch 1
	db "TULLY@", TRAINERTYPE_NORMAL
	db 8
	dw QWILFISH
	db -1 ; end

	next_list_item ; FISHER (19) Route 42 Rematch 2
	db "TULLY@", TRAINERTYPE_NORMAL
	db 7
	dw GOLDEEN
	db 7
	dw GOLDEEN
	db 10
	dw QWILFISH
	db -1 ; end

	next_list_item ; FISHER (20) Route 44
	db "WILTON@", TRAINERTYPE_NORMAL
	db 4
	dw GOLDEEN
	db 4
	dw GOLDEEN
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; FISHER (21) Route 26
	db "SCOTT@", TRAINERTYPE_NORMAL
	db 2
	dw QWILFISH
	db 2
	dw QWILFISH
	db 6
	dw SEAKING
	db -1 ; end

	next_list_item ; FISHER (22) Route 44 Rematch 1
	db "WILTON@", TRAINERTYPE_MOVES
	db 4
	dw SEAKING
	dw SUPERSONIC, WATERFALL, FLAIL, FURY_ATTACK
	db 4
	dw SEAKING
	dw SUPERSONIC, WATERFALL, FLAIL, FURY_ATTACK
	db 8
	dw REMORAID
	dw PSYBEAM, AURORA_BEAM, BUBBLEBEAM, HYPER_BEAM
	db -1 ; end

	next_list_item ; FISHER (23) Route 32 Rematch 3
	db "RALPH@", TRAINERTYPE_NORMAL
	db 8
	dw QWILFISH
	db 10
	dw GOLDEEN
	db -1 ; end

	next_list_item ; FISHER (24) Route 32 Rematch 4
	db "RALPH@", TRAINERTYPE_MOVES
	db 10
	dw QWILFISH
	dw TOXIC, MINIMIZE, SURF, PIN_MISSILE
	db 10
	dw SEAKING
	dw ENDURE, FLAIL, FURY_ATTACK, WATERFALL
	db -1 ; end

	next_list_item ; FISHER (25) Route 42 Rematch 3
	db "TULLY@", TRAINERTYPE_MOVES
	db 7
	dw SEAKING
	dw SUPERSONIC, RAIN_DANCE, WATERFALL, FURY_ATTACK
	db 7
	dw SEAKING
	dw SUPERSONIC, RAIN_DANCE, WATERFALL, FURY_ATTACK
	db 10
	dw QWILFISH
	dw ROLLOUT, SURF, PIN_MISSILE, TAKE_DOWN
	db -1 ; end

	next_list_item ; FISHER (26) Route 103
	db "ANDREW@", TRAINERTYPE_NORMAL
	db 5
	dw QWILFISH
	db 5
	dw GOLDEEN
	db -1 ; end

	next_list_item ; FISHER (27) Route 104
	db "DARIAN@", TRAINERTYPE_NORMAL
	db 2
	dw FEEBAS
	db 3
	dw TENTACOOL
	db -1 ; end

	next_list_item ; FISHER (28) Route 104
	db "IVAN@", TRAINERTYPE_NORMAL
	db 2
	dw MAGNEMITE
	db 3
	dw STARYU
	db -1 ; end

	next_list_item ; FISHER (29) Route 105
	db "NED@", TRAINERTYPE_NORMAL
	db 5
	dw MAGNETON
	db 5
	dw SEALEO
	db 5
	dw POLIWHIRL
	db -1 ; end

	next_list_item ; FISHER (30) Route 105
	db "ELLIOT@", TRAINERTYPE_NORMAL
	db 5
	dw WAILORD
	db 5
	dw OMASTAR
	db 7
	dw DRAGONAIR
	db -1 ; end

	next_list_item ; FISHER (31) Route 110
	db "ELLIOT@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNEMITE
	db 5
	dw BARBOACH
	db 7
	dw CARVANHA
	db -1 ; end

	next_list_item ; FISHER (32) Route 118
	db "ELLIOT@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNEMITE
	db 5
	dw BARBOACH
	db 7
	dw HUNTAIL
	db -1 ; end

	next_list_item ; FISHER (33) Route 114
	db "NOLAN@", TRAINERTYPE_NORMAL	
	db 5
	dw BARBOACH
	db 6
	dw OCTILLERY
	db -1 ; end

	next_list_item ; FISHER (34) Route 114
	db "KAI@", TRAINERTYPE_NORMAL	
	db 5
	dw CARVANHA
	db 6
	dw MARSHTOMP
	db -1 ; end

	next_list_item ; FISHER (34) Route 114
	db "CLAUDE@", TRAINERTYPE_NORMAL	
	db 5
	dw SLOWBRO
	db 6
	dw WARTORTLE
	db -1 ; end

	next_list_item ; FISHER (35) Route 119
	db "CHRIS@", TRAINERTYPE_NORMAL	
	db 5
	dw FEEBAS
	db 6
	dw MAGIKARP
	db 5
	dw TENTACOOL
	db 6
	dw CARVANHA
	db -1 ; end

	end_list_items

SwimmerMGroup:
	next_list_item ; SWIMMERM (1) Route 19
	db "HAROLD@", TRAINERTYPE_NORMAL
	db 6
	dw REMORAID
	db 4
	dw SEADRA
	db -1 ; end

	next_list_item ; SWIMMERM (2) Route 40
	db "SIMON@", TRAINERTYPE_NORMAL
	db 3
	dw TENTACOOL
	db 3
	dw TENTACOOL
	db -1 ; end

	next_list_item ; SWIMMERM (3) Route 40
	db "RANDALL@", TRAINERTYPE_NORMAL
	db 3
	dw SHELLDER
	db 5
	dw WARTORTLE
	db 3
	dw SHELLDER
	db -1 ; end

	next_list_item ; SWIMMERM (4) Route 41
	db "CHARLIE@", TRAINERTYPE_NORMAL
	db 5
	dw SHELLDER
	db 3
	dw TENTACOOL
	db 3
	dw TENTACRUEL
	db -1 ; end

	next_list_item ; SWIMMERM (5) Route 41
	db "GEORGE@", TRAINERTYPE_NORMAL
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
	db "BERKE@", TRAINERTYPE_NORMAL
	db 8
	dw QWILFISH
	db -1 ; end

	next_list_item ; SWIMMERM (7) Route 41
	db "KIRK@", TRAINERTYPE_NORMAL
	db 3
	dw GYARADOS
	db 3
	dw GYARADOS
	db -1 ; end

	next_list_item ; SWIMMERM (8) Unreferenced
	db "MATHEW@", TRAINERTYPE_NORMAL
	db 7
	dw KRABBY
	db -1 ; end

	next_list_item ; SWIMMERM (9) Unreferenced
	db "HAL@", TRAINERTYPE_NORMAL
	db 4
	dw SEEL
	db 6
	dw DEWGONG
	db 4
	dw SEEL
	db -1 ; end

	next_list_item ; SWIMMERM (10) Unreferenced
	db "PATON@", TRAINERTYPE_NORMAL
	db 6
	dw PILOSWINE
	db 6
	dw PILOSWINE
	db -1 ; end

	next_list_item ; SWIMMERM (11) Unreferenced
	db "DARYL@", TRAINERTYPE_NORMAL
	db 4
	dw SHELLDER
	db 5
	dw CLOYSTER
	db 4
	dw SHELLDER
	db -1 ; end

	next_list_item ; SWIMMERM (12) Unreferenced
	db "WALTER@", TRAINERTYPE_NORMAL
	db 5
	dw HORSEA
	db 5
	dw HORSEA
	db 9
	dw SEADRA
	db -1 ; end

	next_list_item ; SWIMMERM (13) Unreferenced
	db "TONY@", TRAINERTYPE_NORMAL
	db 3
	dw STARYU
	db 8
	dw STARMIE
	db 6
	dw HORSEA
	db -1 ; end

	next_list_item ; SWIMMERM (14) Route 19
	db "JEROME@", TRAINERTYPE_NORMAL
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
	db "TUCKER@", TRAINERTYPE_NORMAL
	db 3
	dw SHELLDER
	db 6
	dw CLOYSTER
	db -1 ; end

	next_list_item ; SWIMMERM (16) Unreferenced
	db "RICK@", TRAINERTYPE_NORMAL
	db 3
	dw STARYU
	db 8
	dw STARMIE
	db 6
	dw HORSEA
	db -1 ; end

	next_list_item ; SWIMMERM (17) Route 20
	db "CAMERON@", TRAINERTYPE_NORMAL
	db 7
	dw MARILL
	db -1 ; end

	next_list_item ; SWIMMERM (18) Route 21
	db "SETH@", TRAINERTYPE_NORMAL
	db 4
	dw QUAGSIRE
	db 4
	dw OCTILLERY
	db 7
	dw QUAGSIRE
	db -1 ; end

	next_list_item ; SWIMMERM (19) Unreferenced
	db "JAMES@", TRAINERTYPE_NORMAL
	db 3
	dw STARYU
	db 8
	dw STARMIE
	db 6
	dw HORSEA
	db -1 ; end

	next_list_item ; SWIMMERM (20) Unreferenced
	db "LEWIS@", TRAINERTYPE_NORMAL
	db 3
	dw STARYU
	db 8
	dw STARMIE
	db 6
	dw HORSEA
	db -1 ; end

	next_list_item ; SWIMMERM (21) Cerulean City Gym
	db "PARKER@", TRAINERTYPE_NORMAL
	db 7
	dw HORSEA
	db 7
	dw WARTORTLE
	db 7
	dw SEADRA
	db -1 ; end

	next_list_item ; SWIMMERM (22) Route105
	db "LUIS@", TRAINERTYPE_NORMAL
	db 7
	dw LUVDISC
	db 7
	dw SEADRA
	db 7
	dw HUNTAIL
	db -1 ; end

	next_list_item ; SWIMMERM (23) Route108
	db "TONY@", TRAINERTYPE_NORMAL
	db 6
	dw LUVDISC
	db 6
	dw PSYDUCK
	db 6
	dw SLOWPOKE
	db -1 ; end

	next_list_item ; SWIMMERM (24) Route108
	db "DARRIN@", TRAINERTYPE_NORMAL
	db 6
	dw BARBOACH
	db 6
	dw CORPHISH
	db 7
	dw LINOONE
	db -1 ; end

	end_list_items

SwimmerFGroup:
	next_list_item ; SWIMMERF (1) Route 40
	db "ELAINE@", TRAINERTYPE_NORMAL
	db 6
	dw STARYU
	db -1 ; end

	next_list_item ; SWIMMERF (2) Route 40
	db "PAULA@", TRAINERTYPE_NORMAL
	db 5
	dw STARYU
	db 5
	dw SHELLDER
	db -1 ; end

	next_list_item ; SWIMMERF (3) Route 41
	db "KAYLEE@", TRAINERTYPE_NORMAL
	db 3
	dw GOLDEEN
	db 5
	dw GOLDEEN
	db 5
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (4) Route 41
	db "SUSIE@", TRAINERTYPE_MOVES
	db 5
	dw PSYDUCK
	dw SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db 7
	dw GOLDEEN
	dw PECK, TAIL_WHIP, SUPERSONIC, HORN_ATTACK
	db -1 ; end

	next_list_item ; SWIMMERF (5) Route 41
	db "DENISE@", TRAINERTYPE_NORMAL
	db 7
	dw SEEL
	db -1 ; end

	next_list_item ; SWIMMERF (6) Route 41
	db "KARA@", TRAINERTYPE_NORMAL
	db 4
	dw STARYU
	db 6
	dw STARMIE
	db -1 ; end

	next_list_item ; SWIMMERF (7) Route 41
	db "WENDY@", TRAINERTYPE_MOVES
	db 6
	dw HORSEA
	dw BUBBLE, SMOKESCREEN, LEER, WATER_GUN
	db 6
	dw HORSEA
	dw DRAGON_RAGE, SMOKESCREEN, LEER, WATER_GUN
	db -1 ; end

	next_list_item ; SWIMMERF (8) Unreferenced
	db "LISA@", TRAINERTYPE_NORMAL
	db 8
	dw JYNX
	db -1 ; end

	next_list_item ; SWIMMERF (9) Unreferenced
	db "JILL@", TRAINERTYPE_NORMAL
	db 8
	dw DEWGONG
	db -1 ; end

	next_list_item ; SWIMMERF (10) Unreferenced
	db "MARY@", TRAINERTYPE_NORMAL
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (11) Unreferenced
	db "KATIE@", TRAINERTYPE_NORMAL
	db 7
	dw DEWGONG
	db -1 ; end

	next_list_item ; SWIMMERF (12) Route 19
	db "DAWN@", TRAINERTYPE_NORMAL
	db 8
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (13) Unreferenced
	db "TARA@", TRAINERTYPE_NORMAL
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (14) Route 20
	db "NICOLE@", TRAINERTYPE_NORMAL
	db 4
	dw MARILL
	db 4
	dw MARILL
	db 7
	dw LAPRAS
	db -1 ; end

	next_list_item ; SWIMMERF (15) Route 20
	db "LORI@", TRAINERTYPE_NORMAL
	db 2
	dw STARMIE
	db 2
	dw STARMIE
	db -1 ; end

	next_list_item ; SWIMMERF (16) Unreferenced
	db "JODY@", TRAINERTYPE_NORMAL
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (17) Route 21
	db "NIKKI@", TRAINERTYPE_NORMAL
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
	db "DIANA@", TRAINERTYPE_NORMAL
	db 7
	dw GOLDUCK
	db 7
	dw SQUIRTLE
	db -1 ; end

	next_list_item ; SWIMMERF (19) Cerulean City Gym
	db "BRIANA@", TRAINERTYPE_NORMAL
	db 5
	dw SEAKING
	db 5
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (20) Route 105
	db "IMANI@", TRAINERTYPE_NORMAL
	db 5
	dw MANTINE
	db 5
	dw GOREBYSS
	db -1 ; end

	next_list_item ; SWIMMERF (21) Route 108
	db "DENISE@", TRAINERTYPE_NORMAL
	db 5
	dw WINGULL
	db 5
	dw SEAKING
	db -1 ; end

	next_list_item ; SWIMMERF (22) Route 108
	db "BETH@", TRAINERTYPE_NORMAL
	db 5
	dw WAILMER
	db 5
	dw SEALEO
	db -1 ; end

	end_list_items

SailorGroup:
	next_list_item ; SAILOR (1) Route 39
	db "EUGENE@", TRAINERTYPE_NORMAL
	db 3
	dw POLIWHIRL
	db 5
	dw RATICATE
	db 6
	dw KRABBY
	db -1 ; end

	next_list_item ; SAILOR (2) Glitter Lighthouse - 2F
	db "HUEY@", TRAINERTYPE_NORMAL
	db 6
	dw POLITOED
	db 6
	dw POLIWHIRL
	db -1 ; end

	next_list_item ; SAILOR (3) Glitter Lighthouse - 3F
	db "TERRELL@", TRAINERTYPE_NORMAL
	db 8
	dw POLIWHIRL
	db 8
	dw PELIPPER
	db -1 ; end

	next_list_item ; SAILOR (4) Glitter Lighthouse - 4F
	db "KENT@", TRAINERTYPE_MOVES
	db 6
	dw KRABBY
	dw BUBBLE, LEER, VICEGRIP, HARDEN
	db 8
	dw KRABBY
	dw BUBBLEBEAM, LEER, VICEGRIP, HARDEN
	db -1 ; end

	next_list_item ; SAILOR (5) Glitter Lighthouse - 5F
	db "ERNEST@", TRAINERTYPE_NORMAL
	db 6
	dw MACHOP
	db 7
	dw WINGULL
	db 6
	dw POLIWHIRL
	db -1 ; end

	next_list_item ; SAILOR (6) S.S. Aqua
	db "JEFF@", TRAINERTYPE_NORMAL
	db 7
	dw RATICATE
	db 7
	dw RATICATE
	db -1 ; end

	next_list_item ; SAILOR (7) Unreferenced
	db "GARRETT@", TRAINERTYPE_NORMAL
	db 7
	dw KINGLER
	db -1 ; end

	next_list_item ; SAILOR (8) Unreferenced
	db "KENNETH@", TRAINERTYPE_NORMAL
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
	db "STANLY@", TRAINERTYPE_NORMAL
	db 1
	dw MACHOP
	db 7
	dw MACHOKE
	db 6
	dw PSYDUCK
	db -1 ; end

	next_list_item ; SAILOR (10) Route 38
	db "HARRY@", TRAINERTYPE_NORMAL
	db 7
	dw WOOPER
	db -1 ; end

	next_list_item ; SAILOR (11) Glitter Lighthouse - 2F Rematch 1
	db "HUEY@", TRAINERTYPE_NORMAL
	db 8
	dw POLIWHIRL
	db 8
	dw POLIWHIRL
	db -1 ; end

	next_list_item ; SAILOR (12) Glitter Lighthouse - 2F Rematch 2
	db "HUEY@", TRAINERTYPE_NORMAL
	db 9
	dw POLIWHIRL
	db 9
	dw POLIWRATH
	db -1 ; end

	next_list_item ; SAILOR (13) Glitter Lighthouse - 2F Rematch 3
	db "HUEY@", TRAINERTYPE_MOVES
	db 10
	dw POLITOED
	dw WHIRLPOOL, RAIN_DANCE, BODY_SLAM, PERISH_SONG
	db 10
	dw POLIWRATH
	dw SURF, STRENGTH, ICE_PUNCH, SUBMISSION
	db -1 ; end

	next_list_item ; SAILOR (14) Dewford City Gym
	db "BRENDEN@", TRAINERTYPE_NORMAL	
	db 6
	dw POLIWHIRL
	db -1 ; end

	next_list_item ; SAILOR (15) Route 109
	db "HUEY@", TRAINERTYPE_NORMAL	
	db 6
	dw MACHOKE
	db 7
	dw MANTINE
	db -1 ; end

	next_list_item ; SAILOR (16) Route 109
	db "EDMOND@", TRAINERTYPE_NORMAL	
	db 6
	dw HITMONLEE
	db 7
	dw CORSOLA
	db -1 ; end

	next_list_item ; SAILOR (17) Route 109
	db "RICKY@", TRAINERTYPE_NORMAL	
	db 6
	dw DEWGONG
	db 7
	dw NOSEPASS
	db -1 ; end

	next_list_item ; SAILOR (18) Route 109
	db "CHANDLER@", TRAINERTYPE_NORMAL	
	db 6
	dw HITMONCHAN
	db 7
	dw WARTORTLE	
	db -1 ; end

	end_list_items

SuperNerdGroup:
	next_list_item ; SUPER_NERD (1) Unreferenced
	db "STAN@", TRAINERTYPE_NORMAL
	db 7
	dw GRIMER
	db -1 ; end

	next_list_item ; SUPER_NERD (2) Goldenrod Underground
	db "ERIC@", TRAINERTYPE_NORMAL
	db 4
	dw GRIMER
	db 6
	dw GULPIN
	db -1 ; end

	next_list_item ; SUPER_NERD (3) Unreferenced
	db "GREGG@", TRAINERTYPE_NORMAL
	db 5
	dw MAGNEMITE
	db 5
	dw MAGNEMITE
	db 5
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SUPER_NERD (4) Unreferenced
	db "JAY@", TRAINERTYPE_NORMAL
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db -1 ; end

	next_list_item ; SUPER_NERD (5) Unreferenced
	db "DAVE@", TRAINERTYPE_NORMAL
	db 10
	dw DITTO
	db -1 ; end

	next_list_item ; SUPER_NERD (6) Route 8
	db "SAM@", TRAINERTYPE_NORMAL
	db 4
	dw GRIMER
	db 6
	dw MUK
	db -1 ; end

	next_list_item ; SUPER_NERD (7) Route 8
	db "TOM@", TRAINERTYPE_NORMAL
	db 4
	dw MAGNEMITE
	db 4
	dw MAGNEMITE
	db 4
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SUPER_NERD (8) Route 25
	db "PAT@", TRAINERTYPE_NORMAL
	db 7
	dw PORYGON
	db -1 ; end

	next_list_item ; SUPER_NERD (9) Unreferenced
	db "SHAWN@", TRAINERTYPE_NORMAL
	db 2
	dw MAGNEMITE
	db 5
	dw MUK
	db 2
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SUPER_NERD (10) Goldenrod Underground
	db "TERU@", TRAINERTYPE_NORMAL
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
	db "RUSS@", TRAINERTYPE_NORMAL
	db 7
	dw MAGNEMITE
	db 7
	dw MAGNEMITE
	db 7
	dw MAGNEMITE
	db -1 ; end

	next_list_item ; SUPER_NERD (12) Unreferenced
	db "NORTON@", TRAINERTYPE_MOVES
	db 7
	dw PORYGON
	dw CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db -1 ; end

	next_list_item ; SUPER_NERD (13) Mt. Mortar
	db "HUGH@", TRAINERTYPE_MOVES
	db 12
	dw KINGDRA
	dw SMOKESCREEN, TWISTER, SURF, WATERFALL
	db -1 ; end

	next_list_item ; SUPER_NERD (14) Mt. Mortar
	db "MARKUS@", TRAINERTYPE_MOVES
	db 12
	dw SLOWPOKE
	dw CURSE, WATER_GUN, GROWL, STRENGTH
	db -1 ; end

	next_list_item ; SUPER_NERD (15) Mount Moon
	db "JOVAN@", TRAINERTYPE_NORMAL
	db 4
	dw MAGNEMITE
	db 5
	dw VOLTORB
	db -1 ; end

	next_list_item ; SUPER_NERD (16) Mount Moon
	db "MIGUEL@", TRAINERTYPE_NORMAL
	db 5
	dw GRIMER
	db 5
	dw VOLTORB
	db -1 ; end

	end_list_items

Rival2Group:
	next_list_item ; RIVAL2 (1) Mt. Moon
	db "?@", TRAINERTYPE_NORMAL
	db 9
	dw WEAVILE
	db 7
	dw CROBAT
	db 7
	dw MAGNEZONE
	db 8
	dw GENGAR
	db 8
	dw ALAKAZAM
	db 10
	dw MEGANIUM
	db -1 ; end

	next_list_item ; RIVAL2 (2)
	db "?@", TRAINERTYPE_NORMAL
	db 9
	dw WEAVILE
	db 7
	dw CROBAT
	db 7
	dw MAGNEZONE
	db 8
	dw GENGAR
	db 8
	dw ALAKAZAM
	db 10
	dw TYPHLOSION
	db -1 ; end

	next_list_item ; RIVAL2 (3)
	db "?@", TRAINERTYPE_NORMAL
	db 9
	dw WEAVILE
	db 7
	dw CROBAT
	db 7
	dw MAGNEZONE
	db 8
	dw GENGAR
	db 8
	dw ALAKAZAM
	db 10
	dw FERALIGATR
	db -1 ; end

	next_list_item ; RIVAL2 (4) Indigo Plateu
	db "?@", TRAINERTYPE_NORMAL
	db 10
	dw WEAVILE
	db 10
	dw CROBAT
	db 10
	dw MAGNEZONE
	db 10
	dw GENGAR
	db 10
	dw ALAKAZAM
	db 10
	dw MEGANIUM
	db -1 ; end

	next_list_item ; RIVAL2 (5)
	db "?@", TRAINERTYPE_NORMAL
	db 10
	dw WEAVILE
	db 10
	dw CROBAT
	db 10
	dw MAGNEZONE
	db 10
	dw GENGAR
	db 10
	dw ALAKAZAM
	db 10
	dw TYPHLOSION
	db -1 ; end

	next_list_item ; RIVAL2 (6)
	db "?@", TRAINERTYPE_NORMAL
	db 10
	dw WEAVILE
	db 10
	dw CROBAT
	db 10
	dw MAGNEZONE
	db 10
	dw GENGAR
	db 10
	dw ALAKAZAM
	db 10
	dw FERALIGATR
	db -1 ; end

	end_list_items

GuitaristGroup:
	next_list_item ; GUITARIST (1) Unreferenced
	db "CLYDE@", TRAINERTYPE_NORMAL
	db 7
	dw ELECTABUZZ
	db -1 ; end

	next_list_item ; GUITARIST (2) Vermilion City Gym
	db "VINCENT@", TRAINERTYPE_NORMAL
	db 7
	dw MANECTRIC
	db 7
	dw VOLBEAT
	db 7
	dw ILLUMISE
	db 7
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; GUITARIST (3) Mauville City Gym
	db "KIRK@", TRAINERTYPE_NORMAL
	db 7
	dw ELECTRIKE
	db 7
	dw VOLTORB
	db 7
	dw HVOLTORB
	db -1 ; end

	next_list_item ; GUITARIST (4) Mauville City Gym
	db "SHAWN@", TRAINERTYPE_NORMAL
	db 7
	dw MINUN
	db 7
	dw ELECTABUZZ
	db -1 ; end

	next_list_item ; GUITARIST (5) Route 103
	db "SHAWN@", TRAINERTYPE_NORMAL
	db 7
	dw MINUN
	db -1 ; end

	next_list_item ; GUITARIST (6) Route 110
	db "SHAWN@", TRAINERTYPE_NORMAL
	db 7
	dw VOLTORB
	db 7
	dw HVOLTORB
	db -1 ; end

	next_list_item ; GUITARIST (7) Route 119
	db "FABIAN@", TRAINERTYPE_NORMAL
	db 7
	dw MANECTRIC
	db 7
	dw LINOONE
	db -1 ; end

	end_list_items

HikerGroup:
	next_list_item ; HIKER (1) Route 33
	db "ANTHONY@", TRAINERTYPE_NORMAL
	db 6
	dw GEODUDE
	db 8
	dw MACHOP
	db -1 ; end

	next_list_item ; HIKER (2) Union Cave - 1F
	db "RUSSELL@", TRAINERTYPE_NORMAL
	db 4
	dw GRAVELER
	db 6
	dw SUDOWOODO
	db 8
	dw LAIRON
	db -1 ; end

	next_list_item ; HIKER (3) Union Cave - B1F
	db "PHILLIP@", TRAINERTYPE_NORMAL
	db 3
	dw GEODUDE
	db 3
	dw GEODUDE
	db 5
	dw GOLEM
	db -1 ; end

	next_list_item ; HIKER (4) Union Cave - B1F
	db "LEONARD@", TRAINERTYPE_NORMAL
	db 3
	dw ARON
	db 5
	dw MAKUHITA
	db -1 ; end

	next_list_item ; HIKER (5) Route 33
	db "ANTHONY@", TRAINERTYPE_NORMAL
	db 6
	dw GEODUDE
	db 6
	dw MAKUHITA
	db -1 ; end

	next_list_item ; HIKER (6) Route 42
	db "BENJAMIN@", TRAINERTYPE_NORMAL
	db 4
	dw DIGLETT
	db 4
	dw NOSEPASS
	db 6
	dw DUGTRIO
	db -1 ; end

	next_list_item ; HIKER (7) Route 45
	db "ERIK@", TRAINERTYPE_NORMAL
	db 4
	dw MACHOP
	db 7
	dw GRAVELER
	db 7
	dw GRUMPIG
	db -1 ; end

	next_list_item ; HIKER (8) Route 45
	db "MICHAEL@", TRAINERTYPE_NORMAL
	db 3
	dw GEODUDE
	db 5
	dw GRAVELER
	db 5
	dw GOLEM
	db -1 ; end

	next_list_item ; HIKER (9) Route 45
	db "PARRY@", TRAINERTYPE_NORMAL
	db 6
	dw ONIX
	db 5
	dw PILOSWINE
	db -1 ; end

	next_list_item ; HIKER (10) Route 45
	db "TIMOTHY@", TRAINERTYPE_MOVES
	db 6
	dw DIGLETT
	dw MAGNITUDE, DIG, SAND_ATTACK, SLASH
	db 6
	dw DUGTRIO
	dw MAGNITUDE, DIG, SAND_ATTACK, SLASH
	db -1 ; end

	next_list_item ; HIKER (11) Route 46
	db "BAILEY@", TRAINERTYPE_NORMAL
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

	next_list_item ; HIKER (12) Route 33
	db "ANTHONY@", TRAINERTYPE_NORMAL
	db 5
	dw GRAVELER
	db 7
	dw GRAVELER
	db 9
	dw MACHOKE
	db -1 ; end

	next_list_item ; HIKER (13) Route 9
	db "TIM@", TRAINERTYPE_NORMAL
	db 3
	dw GRAVELER
	db 5
	dw GRAVELER
	db 6
	dw GRAVELER
	db -1 ; end

	next_list_item ; HIKER (14) S.S. Aqua
	db "NOLAND@", TRAINERTYPE_NORMAL
	db 4
	dw SANDSLASH
	db 6
	dw GOLEM
	db -1 ; end

	next_list_item ; HIKER (15) Route 9
	db "SIDNEY@", TRAINERTYPE_NORMAL
	db 6
	dw DUGTRIO
	db 4
	dw ONIX
	db -1 ; end

	next_list_item ; HIKER (16) Route 13
	db "KENNY@", TRAINERTYPE_NORMAL
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
	db "JIM@", TRAINERTYPE_NORMAL
	db 8
	dw MACHAMP
	db -1 ; end

	next_list_item ; HIKER (18) Union Cave - 1F
	db "DANIEL@", TRAINERTYPE_NORMAL
	db 6
	dw ONIX
	db 6
	dw SMOOCHUM
	db 6
	dw SABLEYE
	db -1 ; end

	next_list_item ; HIKER (19) Route 45
	db "PARRY@", TRAINERTYPE_MOVES
	db 5
	dw PILOSWINE
	dw EARTHQUAKE, BLIZZARD, REST, TAKE_DOWN
	db 5
	dw DUGTRIO
	dw MAGNITUDE, DIG, MUD_SLAP, SLASH
	db 8
	dw STEELIX
	dw DIG, IRON_TAIL, SANDSTORM, SLAM
	db -1 ; end

	next_list_item ; HIKER (20) Route 45
	db "PARRY@", TRAINERTYPE_NORMAL
	db 9
	dw ONIX
	db -1 ; end

	next_list_item ; HIKER (21) Route 33
	db "ANTHONY@", TRAINERTYPE_NORMAL
	db 5
	dw GRAVELER
	db 5
	dw GRAVELER
	db 7
	dw MACHOKE
	db -1 ; end

	next_list_item ; HIKER (22) Route 33
	db "ANTHONY@", TRAINERTYPE_MOVES
	db 7
	dw GRAVELER
	dw MAGNITUDE, SELFDESTRUCT, DEFENSE_CURL, ROLLOUT
	db 9
	dw GOLEM
	dw MAGNITUDE, SELFDESTRUCT, DEFENSE_CURL, ROLLOUT
	db 7
	dw MACHOKE
	dw KARATE_CHOP, VITAL_THROW, HEADBUTT, DIG
	db -1 ; end

	next_list_item ; HIKER (23) Rustboro Gym
	db "MARC@", TRAINERTYPE_NORMAL
	db 7
	dw LILEEP
	db -1 ; end

	next_list_item ; HIKER (24) Route 116
	db "CLARK@", TRAINERTYPE_NORMAL
	db 9
	dw AGEODUDE
	db -1 ; end

	next_list_item ; HIKER (25) Route 116
	db "DEVAN@", TRAINERTYPE_NORMAL
	db 7
	dw GEODUDE
	db 7
	dw DUNSPARCE
	db -1 ; end

	next_list_item ; HIKER (26) Lavaridge Gym
	db "ELI@", TRAINERTYPE_NORMAL
	db 7
	dw NUMEL
	db 7
	dw SOLROCK
	db -1 ; end

	next_list_item ; HIKER (27) Mount Moon
	db "MARCOS@", TRAINERTYPE_NORMAL
	db 3
	dw GEODUDE
	db 4
	dw SANDSHREW
	db 5
	dw LUNATONE
	db -1 ; end

	next_list_item ; HIKER (28) Route 112
	db "TRENT@", TRAINERTYPE_NORMAL
	db 3
	dw GEODUDE
	db 4
	dw GRAVELER
	db 5
	dw AGRAVELER
	db -1 ; end

	next_list_item ; HIKER (29) Route 112
	db "BRICE@", TRAINERTYPE_NORMAL
	db 3
	dw NUMEL
	db 4
	dw MACHOP
	db 5
	dw MACHOKE
	db -1 ; end

	next_list_item ; HIKER (30) Route 114
	db "LUCAS@", TRAINERTYPE_NORMAL
	db 6
	dw ONIX
	db 6
	dw MACHOKE
	db 7
	dw TAUROS
	db -1 ; end

	next_list_item ; HIKER (31) Route 114
	db "LENNY@", TRAINERTYPE_NORMAL
	db 6
	dw MAROWAK
	db 6
	dw PILOSWINE
	db 7
	dw DONPHAN
	db -1 ; end

	end_list_items

BikerGroup:
	next_list_item ; BIKER (1)  Unreferenced
	db "BENNY@", TRAINERTYPE_NORMAL
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db -1 ; end

	next_list_item ; BIKER (2) Unreferenced
	db "KAZU@", TRAINERTYPE_NORMAL
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db 7
	dw KOFFING
	db -1 ; end

	next_list_item ; BIKER (3) Route 8
	db "DWAYNE@", TRAINERTYPE_NORMAL
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
	db "HARRIS@", TRAINERTYPE_NORMAL
	db 7
	dw FLAREON
	db -1 ; end

	next_list_item ; BIKER (5) Route 8
	db "ZEKE@", TRAINERTYPE_NORMAL
	db 6
	dw KOFFING
	db 6
	dw KOFFING
	db -1 ; end

	next_list_item ; BIKER (6) Route 17
	db "CHARLES@", TRAINERTYPE_NORMAL
	db 5
	dw KOFFING
	db 5
	dw CHARMELEON
	db 5
	dw WEEZING
	db -1 ; end

	next_list_item ; BIKER (7) Route 17
	db "RILEY@", TRAINERTYPE_NORMAL
	db 7
	dw WEEZING
	db -1 ; end

	next_list_item ; BIKER (8) Route 17
	db "JOEL@", TRAINERTYPE_NORMAL
	db 5
	dw MAGMAR
	db 5
	dw MAGMAR
	db -1 ; end

	next_list_item ; BIKER (9) Route 17
	db "GLENN@", TRAINERTYPE_NORMAL
	db 3
	dw KOFFING
	db 5
	dw MAGMAR
	db 7
	dw WEEZING
	db -1 ; end

	end_list_items

BlaineGroup: ;Gym Leader
	next_list_item ; BLAINE (1)
	db "BLAINE@", TRAINERTYPE_MOVES
	db 7
	dw MAGCARGO
	dw ROCK_SLIDE, FIRE_BLAST, FISSURE, CURSE
	db 8
	dw MAGMAR
	dw THUNDERPUNCH, FIRE_PUNCH, SUNNY_DAY, FLAMETHROWER
	db 9
	dw RAPIDASH
	dw SUNNY_DAY, MEGAHORN, SOLARBEAM, FIRE_BLAST
	db -1 ; end
	
	next_list_item ; BLAINE (2)
	db "BLAINE@", TRAINERTYPE_MOVES
	db 9
	dw NINETALES
	dw SUNNY_DAY, SHADOW_BALL, SOLARBEAM, FIRE_BLAST
	db 8
	dw MAGCARGO
	dw ROCK_SLIDE, FIRE_BLAST, FISSURE, CURSE
	db 8
	dw FLAREON
	dw FLAME_WHEEL, DIG, TAKE_DOWN, BULK_UP
	db 10
	dw MAGMORTAR
	dw THUNDERPUNCH, FIRE_PUNCH, SUNNY_DAY, FLAMETHROWER
	db 11
	dw RAPIDASH
	dw SUNNY_DAY, MEGAHORN, SOLARBEAM, FIRE_BLAST
	db -1 ; end
	
	next_list_item ; BLAINE (3)
	db "BLAINE@", TRAINERTYPE_ITEM_MOVES	
	db 9
	dw NINETALES
	dw NO_ITEM
	dw SUNNY_DAY, SHADOW_BALL, SOLARBEAM, FIRE_BLAST
	db 9
	dw MAGCARGO
	dw NO_ITEM
	dw ROCK_SLIDE, FIRE_BLAST, FISSURE, COSMIC_POWER
	db 9
	dw FLAREON
	dw NO_ITEM
	dw FLAME_WHEEL, DIG, TAKE_DOWN, BULK_UP
	db 9
	dw MAGMORTAR
	dw NO_ITEM
	dw THUNDERPUNCH, ERUPTION, MACH_PUNCH, BRICK_BREAK
	db 10
	dw MOLTRES
	dw NO_ITEM
	dw PURSUIT, SKY_ATTACK, SOLARBEAM, FIRE_BLAST
	db 11
	dw RAPIDASH2
	dw NEVERMELTICE
	dw SUNNY_DAY, BLIZZARD, SOLARBEAM, FIRE_BLAST
	db -1 ; end

	end_list_items

BurglarGroup:
	next_list_item ; BURGLAR (1) Goldenrod City - Underground Warehouse
	db "DUNCAN@", TRAINERTYPE_NORMAL
	db 3
	dw GROWLITHE
	db 5
	dw MAGMAR
	db 6
	dw KADABRA
	db -1 ; end

	next_list_item ; BURGLAR (2) Goldenrod City - Underground Warehouse
	db "EDDIE@", TRAINERTYPE_MOVES
	db 6
	dw GROWLITHE
	dw ROAR, EMBER, LEER, TAKE_DOWN
	db 4
	dw KOFFING
	dw TACKLE, SMOG, SLUDGE, SMOKESCREEN
	db -1 ; end

	next_list_item ; BURGLAR (3) Unreferenced
	db "COREY@", TRAINERTYPE_NORMAL
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

FirebreatherGroup:
	next_list_item ; FIREBREATHER (1) Route 03
	db "OTIS@", TRAINERTYPE_NORMAL
	db 3
	dw MAGBY
	db 3
	dw KOFFING
	db -1 ; end

	next_list_item ; FIREBREATHER (2) Unreferenced
	db "DICK@", TRAINERTYPE_NORMAL
	db 7
	dw CHARMELEON
	db -1 ; end

	next_list_item ; FIREBREATHER (3) Unreferenced
	db "NED@", TRAINERTYPE_NORMAL
	db 5
	dw KOFFING
	db 6
	dw GROWLITHE
	db 5
	dw KOFFING
	db -1 ; end

	next_list_item ; FIREBREATHER (4) Route 03
	db "BURT@", TRAINERTYPE_NORMAL
	db 3
	dw KOFFING
	db 4
	dw SLUGMA
	db -1 ; end

	next_list_item ; FIREBREATHER (5) Union Cave - 1F
	db "BILL@", TRAINERTYPE_NORMAL
	db 6
	dw KOFFING
	db 6
	dw KOFFING
	db -1 ; end

	next_list_item ; FIREBREATHER (6) Route 35
	db "WALT@", TRAINERTYPE_NORMAL
	db 4
	dw MAGMAR
	db 6
	dw MAGMAR
	db -1 ; end

	next_list_item ; FIREBREATHER (7) Union Cave - 1F
	db "RAY@", TRAINERTYPE_NORMAL
	db 7
	dw VULPIX
	db 7
	dw PONYTA
	db -1 ; end

	next_list_item ; FIREBREATHER (8) S.S. Aqua
	db "LYLE@", TRAINERTYPE_NORMAL
	db 6
	dw KOFFING
	db 8
	dw FLAREON
	db 6
	dw KOFFING
	db -1 ; end

	next_list_item ; FIREBREATHER (9) Lavaridge Gym
	db "JEFF@", TRAINERTYPE_NORMAL
	db 6
	dw SLUGMA
	db 7
	dw CYNDAQUIL
	db 8
	dw KOFFING
	db -1 ; end

	next_list_item ; FIREBREATHER (10) Lavaridge Gym
	db "JACE@", TRAINERTYPE_NORMAL
	db 6
	dw CHARMANDER
	db 7
	dw PONYTA
	db 8
	dw MAGMAR
	db -1 ; end

	next_list_item ; FIREBREATHER (11) Lavaridge Gym
	db "COLE@", TRAINERTYPE_NORMAL
	db 6
	dw MAGBY
	db 7
	dw VULPIX
	db 8
	dw NUMEL
	db -1 ; end

	next_list_item ; FIREBREATHER (12) Lavaridge Gym
	db "AXLE@", TRAINERTYPE_NORMAL
	db 6
	dw MAGBY
	db 7
	dw VULPIX
	db 8
	dw COMBUSKEN
	db -1 ; end

	next_list_item ; FIREBREATHER (13) Lavaridge Gym
	db "KEEGAN@", TRAINERTYPE_NORMAL
	db 6
	dw SUNKERN
	db 7
	dw CYNDAQUIL2
	db 8
	dw BORUBEA
	db -1 ; end

	next_list_item ; FIREBREATHER (14) Route 111
	db "HAYDEN@", TRAINERTYPE_NORMAL
	db 5
	dw KANGASKHAN
	db 6
	dw SHUCKLE
	db 7
	dw VOLBEAT
	db -1 ; end

	next_list_item ; FIREBREATHER (15) Route 112
	db "BRYAN@", TRAINERTYPE_NORMAL
	db 5
	dw SLUGMA
	db 6
	dw NUMEL
	db 7
	dw QUILAVA
	db -1 ; end

	next_list_item ; FIREBREATHER (16) Route 114
	db "BERNY@", TRAINERTYPE_NORMAL
	db 5
	dw MAGMAR
	db 6
	dw QUILAVA2
	db 7
	dw PELIPPER
	db -1 ; end

	next_list_item ; FIREBREATHER (17) Route 119
	db "DAYTON@", TRAINERTYPE_NORMAL
	db 5
	dw SLUGMA
	db 6
	dw NUMEL
	db 7
	dw SEAKING
	db -1 ; end

	end_list_items

JugglerGroup:
	next_list_item ; JUGGLER (1) Route 35
	db "IRWIN@", TRAINERTYPE_NORMAL
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
	db "FRITZ@", TRAINERTYPE_NORMAL
	db 6
	dw MR__MIME
	db 6
	dw MAGMAR
	db 6
	dw MACHOKE
	db -1 ; end

	next_list_item ; JUGGLER (3) Vermilion City Gym
	db "HORTON@", TRAINERTYPE_NORMAL
	db 3
	dw ELECTRODE
	db 5
	dw ELECTRODE
	db 7
	dw ELECTRODE2
	db 9
	dw ELECTRODE2
	db -1 ; end

	next_list_item ; JUGGLER (4) Route 35
	db "IRWIN@", TRAINERTYPE_NORMAL
	db 3
	dw VOLTORB
	db 5
	dw VOLTORB
	db 7
	dw VOLTORB2
	db 9
	dw VOLTORB
	db -1 ; end

	next_list_item ; JUGGLER (5) Route 35
	db "IRWIN@", TRAINERTYPE_NORMAL
	db 4
	dw VOLTORB2
	db 6
	dw VOLTORB
	db 8
	dw VOLTORB
	db 10
	dw ELECTRODE
	db -1 ; end

	next_list_item ; JUGGLER (6) Route 35
	db "IRWIN@", TRAINERTYPE_NORMAL
	db 9
	dw VOLTORB2
	db 9
	dw VOLTORB
	db 9
	dw VOLTORB
	db 10
	dw ELECTRODE2
	db -1 ; end

	end_list_items

BlackbeltGroup:
	next_list_item ; BLACKBELT_T (1) Route 45
	db "KENJI@", TRAINERTYPE_NORMAL
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
	db "YOSHI@", TRAINERTYPE_NORMAL
	db 7
	dw HITMONLEE
	db 7
	dw MEDITITE
	db -1 ; end

	next_list_item ; BLACKBELT_T (3) Route 45
	db "KENJI@", TRAINERTYPE_MOVES
	db 8
	dw ONIX
	dw BIND, ROCK_THROW, TOXIC, DIG
	db 10
	dw MACHAMP
	dw HEADBUTT, SWAGGER, THUNDERPUNCH, VITAL_THROW
	db 8
	dw STEELIX
	dw EARTHQUAKE, ROCK_THROW, IRON_TAIL, SANDSTORM
	db 10
	dw HITMONLEE
	dw DOUBLE_TEAM, HI_JUMP_KICK, MUD_SLAP, SWIFT
	db -1 ; end

	next_list_item ; BLACKBELT_T (4) Cianwood City Gym
	db "LAO@", TRAINERTYPE_NORMAL
	db 7
	dw HITMONCHAN
	db 7
	dw MAKUHITA
	db -1 ; end

	next_list_item ; BLACKBELT_T (5) Cianwood City Gym
	db "NOB@", TRAINERTYPE_NORMAL
	db 5
	dw TAUROS
	db 7
	dw MACHOKE
	db -1 ; end

	next_list_item ; BLACKBELT_T (6) Mt. Mortar
	db "KIYO@", TRAINERTYPE_NORMAL
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
	db "LUNG@", TRAINERTYPE_NORMAL
	db 5
	dw MANKEY
	db 5
	dw FURRET
	db 7
	dw PRIMEAPE
	db -1 ; end

	next_list_item ; BLACKBELT_T (8) Route 45
	db "KENJI@", TRAINERTYPE_NORMAL
	db 7
	dw MACHOKE
	db -1 ; end

	next_list_item ; BLACKBELT_T (9) Unreferenced
	db "WAI@", TRAINERTYPE_NORMAL
	db 2
	dw MACHOKE
	db 4
	dw MACHOKE
	db 6
	dw MACHOKE
	db -1 ; end

	next_list_item ; BLACKBELT_T (10) Dewford City Gym
	db "TAKAO@", TRAINERTYPE_NORMAL	
	db 7
	dw TYROGUE
	db -1 ; end

	next_list_item ; BLACKBELT_T (11) Dewford City Gym
	db "CRISTIAN@", TRAINERTYPE_NORMAL
	db 7
	dw MACHOKE
	db -1 ; end

	next_list_item ; BLACKBELT_T (12) Route 103
	db "MARCOS@", TRAINERTYPE_NORMAL
	db 7
	dw TYROGUE
	db -1 ; end

	end_list_items

ExecutiveMGroup:
	next_list_item ; EXECUTIVEM (1) Goldenrod City - Radio Tower
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	db 7
	dw MIGHTYENA
	db 7
	dw WEEZING
	db 7
	dw NUZLEAF
	db 7
	dw DUSTOX
	db 7
	dw MANECTRIC
	db 8
	dw HOUNDOOM
	db -1 ; end

	next_list_item ; EXECUTIVEM (2) Goldenrod City - Radio Tower
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	db 8
	dw CROBAT
	db 8
	dw AGGRON
	db 9
	dw HARIYAMA
	db -1 ; end

	next_list_item ; EXECUTIVEM (3) Goldenrod City - Radio Tower
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	db 8
	dw ELECTRODE
	db 8
	dw MANTINE
	db 8
	dw MAGCARGO
	db 8
	dw GIRAFARIG
	db 7
	dw QUAGSIRE
	db 7
	dw SEVIPER
	db -1 ; end

	next_list_item ; EXECUTIVEM (4) Team Rocket Hideout - B3F
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	db 5
	dw GOLBAT
	db 7
	dw RATICATE
	db 7
	dw SWALOT
	db 7
	dw NOCTOWL
	db 9
	dw MURKROW
	db -1 ; end

	next_list_item ; EXECUTIVEM (5) Goldenrod City - Radio Tower Mega
	db "EXECUTIVE@", TRAINERTYPE_NORMAL	
	db 9
	dw HOUNDOOMX
	db -1 ; end

	end_list_items

PsychicGroup:
	next_list_item ; PSYCHIC_T (1) Ruins of Alph
	db "NATHAN@", TRAINERTYPE_NORMAL
	db 6
	dw GIRAFARIG
	db 7
	dw UNOWN
	db 7
	dw UNOWN
	db 7
	dw UNOWN
	db -1 ; end

	next_list_item ; PSYCHIC_T (2) Saffron City Gym
	db "FRANKLIN@", TRAINERTYPE_NORMAL
	db 7
	dw KADABRA
	db 7
	dw XATU
	db 7
	dw KADABRA
	db -1 ; end

	next_list_item ; PSYCHIC_T (3) Route 11
	db "HERMAN@", TRAINERTYPE_NORMAL
	db 6
	dw EXEGGCUTE
	db 6
	dw EXEGGCUTE
	db 7
	dw EXEGGUTOR
	db -1 ; end

	next_list_item ; PSYCHIC_T (4) Route 11
	db "FIDEL@", TRAINERTYPE_NORMAL
	db 6
	dw XATU
	db -1 ; end

	next_list_item ; PSYCHIC_T (5) Route 37
	db "GREG@", TRAINERTYPE_MOVES
	db 7
	dw DROWZEE
	dw HYPNOSIS, DISABLE, DREAM_EATER, NO_MOVE
	db -1 ; end

	next_list_item ; PSYCHIC_T (6) Route 39
	db "NORMAN@", TRAINERTYPE_MOVES
	db 4
	dw SLOWPOKE
	dw TACKLE, GROWL, WATER_GUN, NO_MOVE
	db 7
	dw SLOWPOKE
	dw CURSE, BODY_SLAM, WATER_GUN, CONFUSION
	db -1 ; end

	next_list_item ; PSYCHIC_T (7) Route 36
	db "MARK@", TRAINERTYPE_MOVES
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
	db "PHIL@", TRAINERTYPE_MOVES
	db 4
	dw NATU
	dw LEER, NIGHT_SHADE, FUTURE_SIGHT, CONFUSE_RAY
	db 6
	dw KADABRA
	dw DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db -1 ; end

	next_list_item ; PSYCHIC_T (9) Route 26
	db "RICHARD@", TRAINERTYPE_NORMAL
	db 7
	dw ESPEON
	db -1 ; end

	next_list_item ; PSYCHIC_T (10) Route 27
	db "GILBERT@", TRAINERTYPE_NORMAL
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

	next_list_item ; PSYCHIC_T (11) Saffron City Gym
	db "JARED@", TRAINERTYPE_NORMAL
	db 7
	dw MR__MIME
	db 7
	dw EXEGGCUTE
	db 7
	dw GRUMPIG
	db -1 ; end

	next_list_item ; PSYCHIC_T (12) Unreferenced
	db "RODNEY@", TRAINERTYPE_NORMAL
	db 5
	dw DROWZEE
	db 8
	dw HYPNO
	db -1 ; end

	next_list_item ; PSYCHIC_T (13) Route 110
	db "EDWARD@", TRAINERTYPE_NORMAL
	db 6
	dw MR__MIME
	db 6
	dw JYNX
	db -1 ; end

	next_list_item ; PSYCHIC_T (14) Mossdeep Gym
	db "PRESTON@", TRAINERTYPE_NORMAL
	db 7
	dw KADABRA
	db 7
	dw KIRLIA
	db -1 ; end

	next_list_item ; PSYCHIC_T (15) Mossdeep Gym
	db "BLAKE@", TRAINERTYPE_NORMAL
	db 7
	dw ARAICHU
	db 7
	dw VENOMOTH
	db -1 ; end

	next_list_item ; PSYCHIC_T (16) Mossdeep Gym
	db "NICHOLAS@", TRAINERTYPE_NORMAL
	db 7
	dw WOBBUFFET
	db 7
	dw UNOWN
	db -1 ; end

	next_list_item ; PSYCHIC_T (17) Mossdeep Gym
	db "VIRGIL@", TRAINERTYPE_NORMAL
	db 7
	dw PORYGON2
	db 7
	dw HYPNO
	db -1 ; end

	end_list_items

PicnickerGroup:
	next_list_item ; PICNICKER (1) Route 32
	db "LIZ@", TRAINERTYPE_NORMAL
	db 5
	dw NIDORAN_F
	db 5
	dw NIDORINA
	db -1 ; end

	next_list_item ; PICNICKER (2) Route 34
	db "GINA@", TRAINERTYPE_NORMAL
	db 3
	dw HOPPIP
	db 3
	dw ROSELIA
	db 5
	dw BULBASAUR
	db -1 ; end

	next_list_item ; PICNICKER (3) Route 35
	db "BROOKE@", TRAINERTYPE_MOVES
	db 6
	dw PIKACHU
	dw THUNDERSHOCK, GROWL, QUICK_ATTACK, DOUBLE_TEAM
	db -1 ; end

	next_list_item ; PICNICKER (4) Route 35
	db "KIM@", TRAINERTYPE_NORMAL
	db 5
	dw VULPIX
	db -1 ; end

	next_list_item ; PICNICKER (5) Fuschia City Gym
	db "CINDY@", TRAINERTYPE_NORMAL
	db 11
	dw NIDOQUEEN
	db -1 ; end

	next_list_item ; PICNICKER (6) Route 04
	db "HOPE@", TRAINERTYPE_NORMAL
	db 7
	dw FLAAFFY
	db -1 ; end

	next_list_item ; PICNICKER (7) Route 04
	db "SHARON@", TRAINERTYPE_NORMAL	
	db 5
	dw PONYTA
	db 7
	dw FURRET
	db -1 ; end

	next_list_item ; PICNICKER (8) S.S. Aqua
	db "DEBRA@", TRAINERTYPE_NORMAL
	db 7
	dw SEAKING
	db -1 ; end

	next_list_item ; PICNICKER (9) Route 34
	db "GINA@", TRAINERTYPE_NORMAL
	db 4
	dw HOPPIP
	db 4
	dw HOPPIP
	db 7
	dw IVYSAUR
	db -1 ; end

	next_list_item ; PICNICKER (10) Route 46
	db "ERIN@", TRAINERTYPE_NORMAL
	db 6
	dw VULPIX
	db 6
	dw PONYTA
	db -1 ; end

	next_list_item ; PICNICKER (11) Route 32
	db "LIZ@", TRAINERTYPE_NORMAL
	db 5
	dw WEEPINBELL
	db 6
	dw NIDORINA
	db -1 ; end

	next_list_item ; PICNICKER (12) Route 32
	db "LIZ@", TRAINERTYPE_NORMAL
	db 6
	dw WEEPINBELL
	db 7
	dw NIDORINO
	db 8
	dw NIDOQUEEN
	db -1 ; end

	next_list_item ; PICNICKER (13) Route 9
	db "HEIDI@", TRAINERTYPE_NORMAL
	db 5
	dw SKIPLOOM
	db 5
	dw SKIPLOOM
	db -1 ; end

	next_list_item ; PICNICKER (14) Route 9
	db "EDNA@", TRAINERTYPE_NORMAL
	db 2
	dw NIDORINA
	db 6
	dw RAICHU
	db -1 ; end

	next_list_item ; PICNICKER (15) Route 34
	db "GINA@", TRAINERTYPE_NORMAL
	db 6
	dw SKIPLOOM
	db 6
	dw SKIPLOOM
	db 9
	dw IVYSAUR
	db -1 ; end

	next_list_item ; PICNICKER (16) Route 43
	db "TIFFANY@", TRAINERTYPE_MOVES
	db 6
	dw CLEFAIRY
	dw ENCORE, SING, DOUBLESLAP, MINIMIZE
	db -1 ; end

	next_list_item ; PICNICKER (17) Route 43
	db "TIFFANY@", TRAINERTYPE_MOVES
	db 7
	dw CLEFAIRY
	dw ENCORE, DOUBLESLAP, MINIMIZE, METRONOME
	db -1 ; end

	next_list_item ; PICNICKER (18) Route 46
	db "ERIN@", TRAINERTYPE_NORMAL
	db 7
	dw PONYTA
	db 7
	dw PONYTA
	db -1 ; end

	next_list_item ; PICNICKER (19) Celadon City Gym
	db "TANYA@", TRAINERTYPE_NORMAL
	db 7
	dw EXEGGUTOR
	db -1 ; end

	next_list_item ; PICNICKER (20) Route 43
	db "TIFFANY@", TRAINERTYPE_MOVES
	db 9
	dw CLEFAIRY
	dw ENCORE, SING, DOUBLESLAP, MINIMIZE
	db -1 ; end

	next_list_item ; PICNICKER (21) Route 46
	db "ERIN@", TRAINERTYPE_MOVES
	db 8
	dw PONYTA
	dw DOUBLE_TEAM, STOMP, FIRE_SPIN, SUNNY_DAY
	db 9
	dw RAICHU
	dw SWIFT, MUD_SLAP, QUICK_ATTACK, THUNDERBOLT
	db 8
	dw PONYTA
	dw DOUBLE_TEAM, STOMP, FIRE_SPIN, SUNNY_DAY
	db -1 ; end

	next_list_item ; PICNICKER (22) Route 32
	db "LIZ@", TRAINERTYPE_NORMAL
	db 4
	dw WEEPINBELL
	db 6
	dw NIDORINO
	db 6
	dw NIDOQUEEN
	db -1 ; end

	next_list_item ; PICNICKER (23) Route 32
	db "LIZ@", TRAINERTYPE_MOVES
	db 7
	dw WEEPINBELL
	dw SLEEP_POWDER, POISONPOWDER, STUN_SPORE, SLUDGE_BOMB
	db 8
	dw NIDOKING
	dw EARTHQUAKE, DOUBLE_KICK, POISON_STING, IRON_TAIL
	db 8
	dw NIDOQUEEN
	dw EARTHQUAKE, DOUBLE_KICK, TAIL_WHIP, BODY_SLAM
	db -1 ; end

	next_list_item ; PICNICKER (24) Route 34
	db "GINA@", TRAINERTYPE_NORMAL
	db 7
	dw SKIPLOOM
	db 7
	dw SKIPLOOM
	db 9
	dw IVYSAUR
	db -1 ; end

	next_list_item ; PICNICKER (25) Route 34
	db "GINA@", TRAINERTYPE_MOVES
	db 9
	dw JUMPLUFF
	dw STUN_SPORE, SUNNY_DAY, LEECH_SEED, COTTON_SPORE
	db 9
	dw JUMPLUFF
	dw SUNNY_DAY, SLEEP_POWDER, LEECH_SEED, COTTON_SPORE
	db 10
	dw VENUSAUR
	dw SOLARBEAM, RAZOR_LEAF, HEADBUTT, MUD_SLAP
	db -1 ; end

	next_list_item ; PICNICKER (26) Route 43
	db "TIFFANY@", TRAINERTYPE_MOVES
	db 12
	dw CLEFAIRY
	dw METRONOME, ENCORE, MOONLIGHT, MINIMIZE
	db -1 ; end

	next_list_item ; PICNICKER (27) Route 117
	db "MARIA@", TRAINERTYPE_NORMAL
	db 9
	dw DELCATTY
	db -1 ; end

	next_list_item ; PICNICKER (28) Route 117
	db "MELINA@", TRAINERTYPE_NORMAL
	db 7
	dw LINOONE
	db 7
	dw SWELLOW
	db -1 ; end

	next_list_item ; PICNICKER (29) Route 111
	db "CELINA@", TRAINERTYPE_NORMAL
	db 7
	dw NIDORINA
	db 5
	dw MILTANK
	db -1 ; end

	next_list_item ; PICNICKER (30) Route 111
	db "BIANCA@", TRAINERTYPE_NORMAL
	db 7
	dw BAYLEEF
	db 5
	dw CUBONE
	db -1 ; end

	next_list_item ; PICNICKER (31) Route 111
	db "GABBY@", TRAINERTYPE_NORMAL
	db 6
	dw LINOONE
	db 5
	dw PINSIR
	db -1 ; end

	next_list_item ; PICNICKER (32) Route 111
	db "IRENE@", TRAINERTYPE_NORMAL
	db 6
	dw MISDREAVUS
	db 5
	dw PILOSWINE
	db -1 ; end

	next_list_item ; PICNICKER (33) Fortree Gym
	db "ASHLEY@", TRAINERTYPE_NORMAL
	db 7
	dw SWABLU
	db 7
	dw DELIBIRD
	db -1 ; end

	next_list_item ; PICNICKER (34) Route 112
	db "CAROL@", TRAINERTYPE_NORMAL
	db 5
	dw SWABLU
	db 6
	dw LOMBRE
	db -1 ; end

	next_list_item ; PICNICKER (35) Route 113
	db "MADDIE@", TRAINERTYPE_NORMAL
	db 5
	dw SWABLU
	db 6
	dw NUMEL
	db -1 ; end

	next_list_item ; PICNICKER (36) Route 113
	db "SOPHIE@", TRAINERTYPE_NORMAL
	db 5
	dw MARILL
	db 6
	dw LOMBRE
	db -1 ; end

	next_list_item ; PICNICKER (37) Route 114
	db "CHARLOTE@", TRAINERTYPE_NORMAL
	db 5
	dw IVYSAUR
	db 6
	dw BAYLEEF
	db -1 ; end

	next_list_item ; PICNICKER (38) Route 114
	db "NANCY@", TRAINERTYPE_NORMAL
	db 5
	dw VOLBEAT
	db 6
	dw ROSELIA
	db -1 ; end

	next_list_item ; PICNICKER (39) Route 114
	db "ANGELINA@", TRAINERTYPE_NORMAL
	db 5
	dw FLAAFFY
	db 6
	dw ARAICHU
	db -1 ; end

	next_list_item ; PICNICKER (40) Lavaridge Desert
	db "HEIDI@", TRAINERTYPE_NORMAL
	db 5
	dw BALTOY
	db 6
	dw SANDSLASH
	db -1 ; end

	next_list_item ; PICNICKER (41) Lavaridge Desert
	db "BECKY@", TRAINERTYPE_NORMAL
	db 5
	dw NIDORINA
	db 6
	dw AZUMARILL
	db -1 ; end

	next_list_item ; PICNICKER (42) Lavaridge Desert
	db "CELIA@", TRAINERTYPE_NORMAL
	db 5
	dw AMAROWAK
	db 6
	dw MAROWAK
	db -1 ; end

	end_list_items

CamperGroup:
	next_list_item ; CAMPER (1) Route 32
	db "ROLAND@", TRAINERTYPE_NORMAL
	db 3
	dw NIDORAN_M
	db 3
	dw SENTRET
	db -1 ; end

	next_list_item ; CAMPER (2) Route 34
	db "TODD@", TRAINERTYPE_NORMAL
	db 4
	dw PSYDUCK
	db 4
	dw PHANPY
	db -1 ; end

	next_list_item ; CAMPER (3) Route 35
	db "IVAN@", TRAINERTYPE_NORMAL
	db 4
	dw DIGLETT
	db 4
	dw ZUBAT
	db 7
	dw DIGLETT
	db -1 ; end

	next_list_item ; CAMPER (4) Route 35
	db "ELLIOT@", TRAINERTYPE_NORMAL
	db 3
	dw SANDSHREW
	db 5
	dw MARILL
	db -1 ; end

	next_list_item ; CAMPER (5) Fuschia City Gym
	db "BARRY@", TRAINERTYPE_NORMAL
	db 11
	dw NIDOKING
	db -1 ; end

	next_list_item ; CAMPER (6) Route 25
	db "LLOYD@", TRAINERTYPE_NORMAL
	db 6
	dw NIDORINO
	db -1 ; end

	next_list_item ; CAMPER (7) Route 9
	db "DEAN@", TRAINERTYPE_NORMAL
	db 6
	dw GOLDUCK
	db 4
	dw SANDSLASH
	db -1 ; end

	next_list_item ; CAMPER (8) Route 9
	db "SID@", TRAINERTYPE_NORMAL
	db 2
	dw DUGTRIO
	db 7
	dw PRIMEAPE
	db 7
	dw POLIWRATH
	db -1 ; end

	next_list_item ; CAMPER (9) Unreferenced
	db "HARVEY@", TRAINERTYPE_NORMAL
	db 5
	dw NIDORINO
	db -1 ; end

	next_list_item ; CAMPER (10) Unreferenced
	db "DALE@", TRAINERTYPE_NORMAL
	db 5
	dw NIDORINO
	db -1 ; end

	next_list_item ; CAMPER (11) Route 46
	db "TED@", TRAINERTYPE_NORMAL
	db 7
	dw MANKEY
	db -1 ; end

	next_list_item ; CAMPER (12) Route 34
	db "TODD@", TRAINERTYPE_NORMAL
	db 5
	dw GEODUDE
	db 5
	dw GEODUDE
	db 9
	dw PSYDUCK
	db -1 ; end

	next_list_item ; CAMPER (13) Route 34
	db "TODD@", TRAINERTYPE_NORMAL
	db 6
	dw GEODUDE
	db 6
	dw GEODUDE
	db 9
	dw PSYDUCK
	db -1 ; end

	next_list_item ; CAMPER (14) Unreferenced
	db "THOMAS@", TRAINERTYPE_NORMAL
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
	db "LEROY@", TRAINERTYPE_NORMAL
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
	db "DAVID@", TRAINERTYPE_NORMAL
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
	db "JOHN@", TRAINERTYPE_NORMAL
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
	db "JERRY@", TRAINERTYPE_NORMAL
	db 7
	dw SANDSLASH
	db 7
	dw KABUTO
	db -1 ; end

	next_list_item ; CAMPER (19) Route 43
	db "SPENCER@", TRAINERTYPE_NORMAL
	db 3
	dw SANDSHREW
	db 5
	dw SANDSLASH
	db 4
	dw ZUBAT
	db -1 ; end

	next_list_item ; CAMPER (20) Route 34
	db "TODD@", TRAINERTYPE_NORMAL
	db 5
	dw GRAVELER
	db 5
	dw GRAVELER
	db 6
	dw SLUGMA
	db 8
	dw PSYDUCK
	db -1 ; end

	next_list_item ; CAMPER (21) Route 34
	db "TODD@", TRAINERTYPE_MOVES
	db 7
	dw GRAVELER
	dw SELFDESTRUCT, ROCK_THROW, HARDEN, MAGNITUDE
	db 7
	dw GRAVELER
	dw SELFDESTRUCT, ROCK_THROW, HARDEN, MAGNITUDE
	db 9
	dw MAGCARGO
	dw ROCK_THROW, HARDEN, AMNESIA, FLAMETHROWER
	db 10
	dw GOLDUCK
	dw DISABLE, PSYCHIC_M, SURF, PSYCH_UP
	db -1 ; end

	next_list_item ; CAMPER (22) Unreferenced
	db "QUENTIN@", TRAINERTYPE_NORMAL
	db 2
	dw FEAROW
	db 3
	dw PRIMEAPE
	db 5
	dw TAUROS
	db -1 ; end

	next_list_item ; CAMPER (23) Route 104
	db "WINSTON@", TRAINERTYPE_NORMAL
	db 2
	dw LINOONE
	db -1 ; end

	next_list_item ; CAMPER (24) Route 117
	db "DYLAN@", TRAINERTYPE_NORMAL
	db 5
	dw DODUO
	db 5
	dw CORPHISH
	db -1 ; end

	next_list_item ; CAMPER (25) Route 108
	db "DYLAN@", TRAINERTYPE_NORMAL
	db 5
	dw DONPHAN
	db 5
	dw GIRAFARIG
	db -1 ; end

	next_list_item ; CAMPER (26) Route 111
	db "TYRON@", TRAINERTYPE_NORMAL
	db 5
	dw TOGETIC
	db 5
	dw MURKROW
	db -1 ; end

	next_list_item ; CAMPER (27) Route 111
	db "TRAVIS@", TRAINERTYPE_NORMAL
	db 5
	dw GLIGAR
	db 5
	dw CACTURNE
	db -1 ; end

	next_list_item ; CAMPER (28) Fortree Gym
	db "FLINT@", TRAINERTYPE_NORMAL
	db 7
	dw GOLBAT
	db 7
	dw XATU
	db -1 ; end

	next_list_item ; CAMPER (29) Route 112
	db "LARRY@", TRAINERTYPE_NORMAL
	db 5
	dw NUZLEAF
	db 6
	dw SWELLOW
	db -1 ; end

	next_list_item ; CAMPER (30) Route 113
	db "JAYLEN@", TRAINERTYPE_NORMAL
	db 5
	dw TRAPINCH
	db 6
	dw RATICATE
	db -1 ; end

	next_list_item ; CAMPER (31) Route 113
	db "LUNG@", TRAINERTYPE_NORMAL
	db 5
	dw KOFFING
	db 6
	dw MAGMAR
	db -1 ; end

	next_list_item ; CAMPER (32) Route 113
	db "LAWRY@", TRAINERTYPE_NORMAL
	db 5
	dw BALTOY
	db 6
	dw SANDSLASH
	db -1 ; end

	next_list_item ; CAMPER (33) Route 114
	db "SHANE@", TRAINERTYPE_NORMAL
	db 5
	dw URSARING
	db 6
	dw ASANDSLASH
	db -1 ; end

	next_list_item ; CAMPER (34) Lavaridge Desert
	db "BEAU@", TRAINERTYPE_NORMAL	
	db 4
	dw TRAPINCH
	db 6
	dw DUGTRIO
	db -1 ; end

	next_list_item ; CAMPER (35) Lavaridge Desert
	db "DREW@", TRAINERTYPE_NORMAL	
	db 4
	dw SUDOWOODO
	db 6
	dw NIDORINO	
	db -1 ; end

	next_list_item ; CAMPER (36) Lavaridge Desert
	db "BRANDEN@", TRAINERTYPE_NORMAL	
	db 4
	dw SKARMORY
	db 6
	dw ONIX	
	db -1 ; end

	end_list_items

ExecutiveFGroup:
	next_list_item ; EXECUTIVEF (1) Goldenrod City - Radio Tower
	db "EXECUTIVE@", TRAINERTYPE_MOVES
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
	db "EXECUTIVE@", TRAINERTYPE_MOVES
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
	db "EXECUTIVE@", TRAINERTYPE_NORMAL
	db 8
	dw RHYDON
	db 8
	dw VILEPLUME
	db 8
	dw EXEGGUTOR
	db 8
	dw DYNABEA
	db 8
	dw FERALIGATR2
	db 10
	dw ABSOLX
	db -1 ; end

	end_list_items

SageGroup:
	next_list_item ; SAGE (1) Sprout Tower - 1F
	db "CHOW@", TRAINERTYPE_NORMAL
	db 3
	dw BELLSPROUT
	db 3
	dw BULBASAUR
	db 3
	dw CHIKORITA
	db -1 ; end

	next_list_item ; SAGE (2) Sprout Tower - 2F
	db "NICO@", TRAINERTYPE_NORMAL
	db 3
	dw BELLSPROUT
	db 3
	dw CHIKORITA
	db 3
	dw BELLSPROUT
	db -1 ; end

	next_list_item ; SAGE (3) Unreferenced
	db "JIN@", TRAINERTYPE_NORMAL
	db 6
	dw BELLSPROUT
	db -1 ; end

	next_list_item ; SAGE (4) Sprout Tower - 3F
	db "TROY@", TRAINERTYPE_NORMAL
	db 3
	dw BELLSPROUT
	db 5
	dw HOOTHOOT
	db -1 ; end

	next_list_item ; SAGE (5) Unreferenced
	db "JEFFREY@", TRAINERTYPE_NORMAL
	db 7
	dw HAUNTER
	db -1 ; end

	next_list_item ; SAGE (6) Ecruteak City Gym
	db "PING@", TRAINERTYPE_NORMAL
	db 7
	dw GASTLY
	db 7
	dw CUBONE
	db 7
	dw VULPIX
	db 7
	dw GASTLY
	db -1 ; end

	next_list_item ; SAGE (7) Sprout Tower - 2F
	db "EDMOND@", TRAINERTYPE_NORMAL
	db 3
	dw BELLSPROUT
	db 3
	dw HOPPIP
	db 4
	dw BELLSPROUT
	db -1 ; end

	next_list_item ; SAGE (8) Sprout Tower - 3F
	db "NEAL@", TRAINERTYPE_NORMAL
	db 7
	dw BELLSPROUT
	db -1 ; end

	next_list_item ; SAGE (9) Sprout Tower - 3F
	db "LI@", TRAINERTYPE_NORMAL
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
	db "GAKU@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw FLAREON
	db -1 ; end

	next_list_item ; SAGE (11) Tin Tower 1F
	db "MASA@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw JOLTEON
	db -1 ; end

	next_list_item ; SAGE (12) Tin Tower 1F
	db "KOJI@", TRAINERTYPE_NORMAL
	db 7
	dw NOCTOWL
	db 7
	dw VAPOREON
	db -1 ; end

	end_list_items

MediumGroup:
	next_list_item ; MEDIUM (1) Ecruteak City Gym
	db "MARTHA@", TRAINERTYPE_NORMAL
	db 5
	dw GASTLY
	db 7
	dw HAUNTER
	db 7
	dw UNOWN
	db -1 ; end

	next_list_item ; MEDIUM (2) Ecruteak City Gym
	db "GRACE@", TRAINERTYPE_NORMAL
	db 7
	dw HAUNTER
	db 7
	dw HAUNTER
	db -1 ; end

	next_list_item ; MEDIUM (3) Unreferenced
	db "BETHANY@", TRAINERTYPE_NORMAL
	db 5
	dw HAUNTER
	db -1 ; end

	next_list_item ; MEDIUM (4) Unreferenced
	db "MARGRET@", TRAINERTYPE_NORMAL
	db 5
	dw HAUNTER
	db -1 ; end

	next_list_item ; MEDIUM (5) Unreferenced
	db "ETHEL@", TRAINERTYPE_NORMAL
	db 5
	dw HAUNTER
	db -1 ; end

	next_list_item ; MEDIUM (6) Saffron City Gym
	db "REBECCA@", TRAINERTYPE_NORMAL
	db 7
	dw DROWZEE
	db 7
	dw HYPNO
	db -1 ; end

	next_list_item ; MEDIUM (7) Saffron City Gym
	db "DORIS@", TRAINERTYPE_NORMAL
	db 7
	dw SLOWKING
	db 7
	dw SLOWBRO
	db -1 ; end

	next_list_item ; MEDIUM (8) Route 117
	db "BRANDI@", TRAINERTYPE_NORMAL
	db 5
	dw RALTS
	db 6
	dw SPOINK
	db 5
	dw NATU
	db -1 ; end

	end_list_items

BoarderGroup:
	next_list_item ; BOARDER (1) Mahogany Town Gym
	db "RONALD@", TRAINERTYPE_NORMAL
	db 7
	dw SEEL
	db 7
	dw DEWGONG
	db 7
	dw DELIBIRD
	db -1 ; end

	next_list_item ; BOARDER (2) Mahogany Town Gym
	db "BRAD@", TRAINERTYPE_NORMAL
	db 7
	dw SWINUB
	db 7
	dw SWINUB
	db -1 ; end

	next_list_item ; BOARDER (3) Mahogany Town Gym
	db "DOUGLAS@", TRAINERTYPE_NORMAL
	db 7
	dw SHELLDER
	db 7
	dw CLOYSTER
	db 7
	dw AZUMARILL
	db -1 ; end

	end_list_items

PokefanMGroup:
	next_list_item ; POKEFANM (1) National Park
	db "WILLIAM@", TRAINERTYPE_ITEM
	db 4
	dw RAICHU
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (2) Route 39
	db "DEREK@", TRAINERTYPE_ITEM
	db 7
	dw PIKACHU
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (3) Route 10
	db "ROBERT@", TRAINERTYPE_ITEM
	db 6
	dw QUAGSIRE
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (4) Route 13
	db "JOSHUA@", TRAINERTYPE_ITEM
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
	db "CARTER@", TRAINERTYPE_ITEM
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
	db "TREVOR@", TRAINERTYPE_ITEM
	db 5
	dw PSYDUCK
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (7) Route 34
	db "BRANDON@", TRAINERTYPE_ITEM
	db 4
	dw SNUBBULL
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (8) Unreferenced
	db "JEREMY@", TRAINERTYPE_ITEM
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
	db "COLIN@", TRAINERTYPE_ITEM
	db 7
	dw DELIBIRD
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (10) Route 39
	db "DEREK@", TRAINERTYPE_ITEM
	db 9
	dw PIKACHU
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (11) Route 39
	db "DEREK@", TRAINERTYPE_ITEM
	db 10
	dw PIKACHU
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (12) Route 13
	db "ALEX@", TRAINERTYPE_ITEM
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
	db "REX@", TRAINERTYPE_ITEM
	db 5
	dw PHANPY
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (14) Route 6
	db "ALLAN@", TRAINERTYPE_ITEM
	db 5
	dw TEDDIURSA
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (15) Route 103
	db "MIGUEL@", TRAINERTYPE_ITEM
	db 5
	dw TRAPINCH
	dw BERRY
	db 5
	dw SPOINK
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (16) Route 117
	db "ISAAC@", TRAINERTYPE_ITEM
	db 5
	dw TEDDIURSA
	dw BERRY
	db 5
	dw ARON
	dw BERRY
	db 5
	dw TAILLOW
	dw BERRY
	db 5
	dw MAGBY
	dw BERRY
	db 5
	dw CLEFFA
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (17) Route 110
	db "KALEB@", TRAINERTYPE_ITEM
	db 5
	dw PIKACHU
	dw BERRY
	db 5
	dw JIGGLYPUFF
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANM (18) Route 110
	db "EDWIN@", TRAINERTYPE_ITEM
	db 5
	dw CLEFAIRY
	dw BERRY
	db 5
	dw SCYTHER
	dw BERRY
	db -1 ; end

	end_list_items

KimonoGirlGroup:
	next_list_item ; KIMONO_GIRL (1) Unreferenced
	db "NAOKO@", TRAINERTYPE_NORMAL
	db 7
	dw SKIPLOOM
	db 7
	dw VULPIX
	db 5
	dw SKIPLOOM
	db -1 ; end

	next_list_item ; KIMONO_GIRL (2) Ecruteak City
	db "NAOKO@", TRAINERTYPE_NORMAL
	db 4
	dw QUILAVA
	db 5
	dw QUILAVA2
	db 6
	dw FLAREON
	db -1 ; end

	next_list_item ; KIMONO_GIRL (3) Ecruteak City
	db "SAYO@", TRAINERTYPE_NORMAL
	db 4
	dw NATU
	db 5
	dw SPOINK
	db 6
	dw ESPEON
	db -1 ; end

	next_list_item ; KIMONO_GIRL (4) Ecruteak City
	db "ZUKI@", TRAINERTYPE_NORMAL
	db 4
	dw UNOWN
	db 5
	dw NUZLEAF
	db 6
	dw UMBREON
	db -1 ; end

	next_list_item ; KIMONO_GIRL (5) Ecruteak City
	db "KUNI@", TRAINERTYPE_NORMAL
	db 4
	dw WINGULL
	db 5
	dw CHINCHOU
	db 6
	dw VAPOREON
	db -1 ; end

	next_list_item ; KIMONO_GIRL (6) Ecruteak City
	db "MIKI@", TRAINERTYPE_NORMAL
	db 4
	dw PLUSLE
	db 5
	dw MINUN
	db 6
	dw JOLTEON
	db -1 ; end

	end_list_items

TwinsGroup:
	next_list_item ; TWINS (1) Azalea Town Gym
	db "AMY & MAY@", TRAINERTYPE_NORMAL
	db 7
	dw SPINARAK
	db 7
	dw LEDYBA
	db -1 ; end

	next_list_item ; TWINS (2) Route 37
	db "ANN & ANNE@", TRAINERTYPE_MOVES
	db 7
	dw CLEFAIRY
	dw GROWL, ENCORE, DOUBLESLAP, METRONOME
	db 7
	dw JIGGLYPUFF
	dw SING, DEFENSE_CURL, POUND, DISABLE
	db -1 ; end

	next_list_item ; TWINS (3) Route 37
	db "ANN & ANNE@", TRAINERTYPE_MOVES
	db 7
	dw JIGGLYPUFF
	dw SING, DEFENSE_CURL, POUND, DISABLE
	db 7
	dw CLEFAIRY
	dw GROWL, ENCORE, DOUBLESLAP, METRONOME
	db -1 ; end

	next_list_item ; TWINS (4) Azalea Town Gym
	db "AMY & MAY@", TRAINERTYPE_NORMAL
	db 7
	dw LEDYBA
	db 7
	dw SPINARAK
	db -1 ; end

	next_list_item ; TWINS (5) Celadon City Gym
	db "JO & ZOE@", TRAINERTYPE_NORMAL
	db 7
	dw VICTREEBEL
	db 7
	dw VILEPLUME
	db -1 ; end

	next_list_item ; TWINS (6) Celadon City Gym
	db "JO & ZOE@", TRAINERTYPE_NORMAL
	db 7
	dw VILEPLUME
	db 7
	dw VICTREEBEL
	db -1 ; end

	next_list_item ; TWINS (7) S.S. Aqua
	db "MEG & PEG@", TRAINERTYPE_NORMAL
	db 7
	dw TEDDIURSA
	db 7
	dw PHANPY
	db -1 ; end

	next_list_item ; TWINS (8) S.S. Aqua
	db "MEG & PEG@", TRAINERTYPE_NORMAL
	db 7
	dw PHANPY
	db 7
	dw TEDDIURSA
	db -1 ; end

	next_list_item ; TWINS (9) Dragon's Den
	db "LEA & PIA@", TRAINERTYPE_MOVES
	db 7
	dw DRATINI
	dw THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	db 7
	dw DRATINI
	dw THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	db -1 ; end

	next_list_item ; TWINS (10) Dragon's Den
	db "LEA & PIA@", TRAINERTYPE_MOVES
	db 7
	dw DRATINI
	dw THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	db 7
	dw DRATINI
	dw THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	db -1 ; end

	next_list_item ; TWINS (11) Route 103
	db "AMY & LIV@", TRAINERTYPE_NORMAL
	db 7
	dw ZANGOOSE
	db 7
	dw SEVIPER
	db -1 ; end

	next_list_item ; TWINS (12) Route 104
	db "GINA & MIA@", TRAINERTYPE_NORMAL
	db 3
	dw SEEDOT
	db 3
	dw LOTAD
	db -1 ; end

	next_list_item ; TWINS (13) Route 117
	db "ANNA & MEG@", TRAINERTYPE_NORMAL
	db 7
	dw ZIGZAGOON
	db 7
	dw MAKUHITA
	db -1 ; end

	next_list_item ; TWINS (14) Route 108
	db "LISA & RIA@", TRAINERTYPE_NORMAL
	db 6
	dw TENTACOOL
	db 7
	dw TOTODILE
	db 6
	dw QWILFISH
	db 7
	dw CORSOLA
	db -1 ; end

	next_list_item ; TWINS (15) Route 113
	db "TORI & TIA@", TRAINERTYPE_NORMAL
	db 7
	dw SPINDA
	db 7
	dw SPINDA
	db -1 ; end

	end_list_items

PokefanFGroup:
	next_list_item ; POKEFANF (1) National Park
	db "BEVERLY@", TRAINERTYPE_ITEM
	db 4
	dw SNUBBULL
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (2) Route 39
	db "RUTH@", TRAINERTYPE_ITEM
	db 7
	dw PIKACHU
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (3) National Park
	db "BEVERLY@", TRAINERTYPE_ITEM
	db 6
	dw SNUBBULL
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (4) National Park
	db "BEVERLY@", TRAINERTYPE_ITEM
	db 8
	dw GRANBULL
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (5) Unreferenced
	db "GEORGIA@", TRAINERTYPE_ITEM
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
	db "JAIME@", TRAINERTYPE_ITEM
	db 6
	dw MEOWTH
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (7) Route 117
	db "LYDIA@", TRAINERTYPE_ITEM
	db 5
	dw WINGULL
	dw BERRY
	db 5
	dw SHROOMISH
	dw BERRY
	db 5
	dw MARILL
	dw BERRY
	db 5
	dw GOLDEEN
	dw BERRY
	db 5
	dw SKITTY
	dw BERRY
	db -1 ; end

	next_list_item ; POKEFANF (8) Route 110
	db "ISABEL@", TRAINERTYPE_ITEM
	db 6
	dw PLUSLE
	dw BERRY
	db 6
	dw MINUN
	dw BERRY
	db -1 ; end

	end_list_items

RedGroup:
	next_list_item ; RED (1)
	db "RED@", TRAINERTYPE_MOVES
	db 15
	dw PIKACHU
	dw SURF, EXTREMESPEED, SWIFT, VOLT_TACKLE
	db 13
	dw ESPEON
	dw MUD_SLAP, MEDITATE, SWIFT, PSYCHIC_M
	db 13
	dw SNORLAX
	dw AMNESIA, SNORE, REST, BODY_SLAM
	db 13
	dw VENUSAUR
	dw SUNNY_DAY, GIGA_DRAIN, SYNTHESIS, SOLARBEAM
	db 13
	dw CHARIZARD
	dw FIRE_BLAST, SKY_ATTACK, OUTRAGE, SOLARBEAM
	db 16
	dw MEWTWO
	dw MEDITATE, PSYCHIC_M, SHADOW_BALL, RECOVER
	db -1 ; end

	end_list_items

BlueGroup: ;Gym Leader
	next_list_item ; BLUE (1)
	db "BLUE@", TRAINERTYPE_ITEM_MOVES
	db 10
	dw PIDGEOT
	dw NO_ITEM
	dw EXTREMESPEED, SKY_ATTACK, BODY_SLAM, STEEL_WING
	db 10
	dw ALAKAZAM
	dw NO_ITEM
	dw SHADOW_BALL, RECOVER, PSYCHIC_M, FOCUS_PUNCH
	db 10
	dw RHYPERIOR
	dw NO_ITEM
	dw DRAGON_CLAW, SANDSTORM, STONE_EDGE, EARTHQUAKE
	db 10
	dw ARCANINE
	dw CHARCOAL
	dw PURSUIT, SWIFT, SACRED_FIRE, EXTREMESPEED
	db 11
	dw GYARADOSX
	dw NO_ITEM
	dw DRAGON_CLAW, WATERFALL, BEAT_UP, HYPER_BEAM
	db 12
	dw ARTICUNO
	dw MIRACLEBERRY
	dw BLIZZARD, HURRICANE, PSYCHIC_M, REST
	db -1 ; end
	
	next_list_item ; BLUE (2)
	db "BLUE@", TRAINERTYPE_MOVES
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
	dw GYARADOSX
	dw DRAGONBREATH, WATERFALL, RAIN_DANCE, HYPER_BEAM
	db 10
	dw ARTICUNO
	dw REST, BLIZZARD, PSYCHIC_M, HURRICANE
	db 13
	dw ARCANINE
	dw ROAR, SWIFT, FLAMETHROWER, EXTREMESPEED
	db -1 ; end
	
	next_list_item ; BLUE (1)
	db "BLUE@", TRAINERTYPE_MOVES
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
	db 13
	dw ARCANINE
	dw ROAR, SWIFT, FLAMETHROWER, EXTREMESPEED
	db -1 ; end

	end_list_items

OfficerGroup:
	next_list_item ; OFFICER (1) Route 34
	db "KEITH@", TRAINERTYPE_NORMAL
	db 7
	dw GROWLITHE
	db -1 ; end

	next_list_item ; OFFICER (2) Route 35
	db "DIRK@", TRAINERTYPE_NORMAL
	db 4
	dw GROWLITHE
	db 4
	dw GROWLITHE
	db -1 ; end

	end_list_items

GruntFGroup:
	next_list_item ; GRUNTF (1) Slowpoke Well B1f
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 4
	dw ZUBAT
	db 6
	dw EKANS
	db -1 ; end

	next_list_item ; GRUNTF (2) Radio Tower 2F
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 9
	dw ARBOK
	db -1 ; end

	next_list_item ; GRUNTF (3) Goldenrod Underground Exit
	db "GRUNT@", TRAINERTYPE_NORMAL
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
	db "GRUNT@", TRAINERTYPE_NORMAL
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
	db "GRUNT@", TRAINERTYPE_MOVES
	db 8
	dw SEVIPER
	dw WRAP, LEER, POISON_TAIL, BITE
	db 8
	dw GLOOM
	dw ABSORB, SWEET_SCENT, STUN_SPORE, SLEEP_POWDER
	db -1 ; end

	next_list_item ; GRUNTF (6) Contest Amaya #1
	db "AMAYA@", TRAINERTYPE_NORMAL
	db 7
	dw PIKACHU
	db 7
	dw TRAPINCH
	db 7
	dw BELDUM
	db 7
	dw HOUNDOUR
	db 8
	dw AVULPIX
	db 8
	dw GYARADOS	
	db -1 ; end

	next_list_item ; GRUNTF (7) Contest Amaya #2
	db "AMAYA@", TRAINERTYPE_NORMAL
	db 7
	dw ARAICHU
	db 7
	dw VIBRAVA
	db 7
	dw METANG
	db 7
	dw HOUNDOOM
	db 8
	dw GYARADOS
	db 9
	dw ANINETALES
	db -1 ; end

	next_list_item ; GRUNTF (8) Contest Amaya #3
	db "AMAYA@", TRAINERTYPE_NORMAL
	db 7
	dw ARAICHU
	db 7
	dw FLYGONX
	db 7
	dw METAGROSSX
	db 7
	dw HOUNDOOMX
	db 8
	dw GYARADOSX
	db 9
	dw NINETALES2
	db -1 ; end

	next_list_item ; GRUNTF (9) Safari Gruntf 1
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw ARBOK
	db 5
	dw SEVIPER
	db -1 ; end

	next_list_item ; GRUNTF (10) Safari Gruntf 2
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw PRIMEAPE
	db 5
	dw HYPNO
	db -1 ; end

	next_list_item ; GRUNTF (11) Safari Gruntf 3
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw DEWGONG
	db 5
	dw HITMONCHAN
	db -1 ; end

	next_list_item ; GRUNTF (12) Safari Gruntf 4
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw SEAKING
	db 5
	dw AERODACTYL
	db -1 ; end

	next_list_item ; GRUNTF (13) Safari Gruntf 5
	db "GRUNT@", TRAINERTYPE_NORMAL
	db 5
	dw GRANBULL
	db 5
	dw MIGHTYENA
	db -1 ; end

	end_list_items

MysticalmanGroup:
	next_list_item ; MYSTICALMAN (1) Cianwood City
	db "EUSINE@", TRAINERTYPE_MOVES
	db 8
	dw HYPNO
	dw DREAM_EATER, HYPNOSIS, DISABLE, CONFUSION
	db 8
	dw GENGAR
	dw LICK, HYPNOSIS, MEAN_LOOK, CURSE
	db 8
	dw ELECTRODE2
	dw SCREECH, SONICBOOM, THUNDER, ROLLOUT
	db -1 ; end

	end_list_items

KrisGroup:
	next_list_item; KRIS (1) Unreferenced
	db "KRIS@", TRAINERTYPE_NORMAL
	db 10
	dw CHIKORITA
	db 10
	dw CYNDAQUIL
	db 10
	dw TOTODILE
	db -1 ; end

	end_list_items

RoxanneGroup:
	next_list_item; ROXXANE (1) Unreferenced
	db "ROXXANE@", TRAINERTYPE_NORMAL
	db 5
	dw AGEODUDE
	db 5
	dw KABUTO
	db 7
	dw NOSEPASS
	db -1 ; end

	next_list_item; ROXXANE (2) Unreferenced
	db "ROXXANE@", TRAINERTYPE_NORMAL
	db 8
	dw NOSEPASS
	db 8
	dw MAGCARGO
	db 8
	dw AGOLEM
	db 8
	dw RELICANTH
	db 11
	dw AERODACTYL
	db -1 ; end

	next_list_item ; ROXXANE (3)
	db "ROXXANE@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw TENTACRUEL2
	dw KINGS_ROCK
	dw SIGNAL_BEAM, ROCK_TOMB, STONE_EDGE, GIGA_DRAIN	
	db 9
	dw LUNATONE
	dw NO_ITEM
	dw ROCK_TOMB, COSMIC_POWER, PSYCHIC_M, SANDSTORM
	db 9
	dw SOLROCK
	dw NO_ITEM
	dw ROCK_TOMB, COSMIC_POWER, FLAMETHROWER, SANDSTORM	
	db 10
	dw AGOLEM
	dw NO_ITEM
	dw THUNDERBOLT, STONE_EDGE, PROTECT, EARTHQUAKE
	db 11
	dw REGIROCK
	dw NO_ITEM
	dw SLEEP_TALK, COSMIC_POWER, REST, STONE_EDGE
	db 11
	dw PROBOPASS
	dw LEFTOVERS
	dw ROCK_TOMB, STONE_EDGE, AURA_SPHERE, SANDSTORM

	end_list_items

BrawlyGroup:
	next_list_item; BRAWLY (1) 
	db "BRAWLY@", TRAINERTYPE_NORMAL
	db 7
	dw MACHOP
	db 7
	dw MEDITITE
	db 7
	dw MAKUHITA
	db -1 ; end

	next_list_item; BRAWLY (2) 
	db "BRAWLY@", TRAINERTYPE_NORMAL
	db 7
	dw MACHOKE
	db 7
	dw MEDICHAM
	db 7
	dw HITMONCHAN
	db 7
	dw BRELOOM
	db 7
	dw BLAZIKEN
	db -1 ; end

	next_list_item ; BRAWLY (3)
	db "BRAWLY@", TRAINERTYPE_ITEM_MOVES	
	db 9
	dw BRELOOM
	dw MAGNET
	dw THUNDERPUNCH, MACH_PUNCH, LEAF_BLADE, DYNAMICPUNCH
	db 9
	dw STEELIX
	dw LEFTOVERS
	dw IRON_TAIL, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	db 9
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
	db 11
	dw BLAZIKEN
	dw BLACKBELT_I
	dw DRILL_PECK, BLAZE_KICK, HI_JUMP_KICK, DETECT	
	db -1 ; end

	end_list_items

WattsonGroup:
	next_list_item; WATTSON (1)
	db "WATTSON@", TRAINERTYPE_NORMAL
	db 7
	dw HVOLTORB
	db 7
	dw MINUN
	db 7
	dw PLUSLE
	db 9
	dw MAGNETON
	db 9
	dw MANECTRIC
	db -1 ; end

	next_list_item; WATTSON (2)
	db "WATTSON@", TRAINERTYPE_NORMAL
	db 9
	dw HELECTRODE
	db 9
	dw MINUN
	db 9
	dw PLUSLE
	db 10
	dw MAGNEZONE
	db 11
	dw MANECTRIC
	db -1 ; end

	next_list_item ; WATTSON (3)
	db "WATTSON@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw HELECTRODE
	dw NO_ITEM
	dw THUNDERBOLT, CHARGE, GIGA_DRAIN, THUNDER_WAVE	
	db 9
	dw MANECTRIC
	dw MAGNET
	dw SHOCKSLAM, CRUNCH, PURSUIT, THUNDER_WAVE
	db 9
	dw JOLTEON
	dw NO_ITEM
	dw ZAP_CANNON, PIN_MISSILE, PURSUIT, THUNDER_WAVE
	db 10
	dw ELECTIVIRE
	dw NO_ITEM
	dw ZAP_CANNON, FIRE_PUNCH, DIZZY_PUNCH, THUNDERBOLT
	db 10
	dw ARAICHU
	dw KINGS_ROCK
	dw SURF, FLASHCANNON, VOLT_TACKLE, SWIFT
	db 11
	dw AMPHAROSX
	dw NO_ITEM
	dw FAERIEGLEAM, FLASHCANNON, CHARGE, THUNDERBOLT	
	db -1 ; end

	end_list_items

FlanneryGroup:
	next_list_item; FLANNERY (1) Unreferenced
	db "FLANNERY@", TRAINERTYPE_NORMAL
	db 7
	dw SUNFLORA
	db 8
	dw NINETALES
	db 7
	dw TORKOAL
	db 7
	dw CAMERUPT
	db -1 ; end

	next_list_item; FLANNERY (2) Unreferenced
	db "FLANNERY@", TRAINERTYPE_NORMAL
	db 8
	dw SUNFLORA
	db 8
	dw NINETALES
	db 8
	dw FLAREON
	db 9
	dw TORKOAL
	db 10
	dw CAMERUPT	
	db -1 ; end

	next_list_item ; FLANNERY (3)
	db "FLANNERY@", TRAINERTYPE_ITEM_MOVES
	db 9
	dw SUNFLORA
	dw QUICK_CLAW
	dw FIRE_BLAST, SOLARBEAM, GIGA_DRAIN, STUN_SPORE	
	db 9
	dw NINETALES
	dw NO_ITEM
	dw FIRE_BLAST, SHADOW_BALL, WILLOWISP, SOLARBEAM
	db 9
	dw FLAREON
	dw NO_ITEM
	dw BODY_SLAM, SACRED_FIRE, PURSUIT, SWORDS_DANCE
	db 9
	dw TORKOAL
	dw LEFTOVERS
	dw FIRE_BLAST, FISSURE, REST, COSMIC_POWER
	db 10
	dw CHARIZARD
	dw NO_ITEM
	dw FLAMETHROWER, SKY_ATTACK, DRAGONBREATH, SWIFT
	db 11
	dw CAMERUPTX
	dw LEFTOVERS
	dw FISSURE, ERUPTION, RECOVER, AMNESIA	
	db -1 ; end

	end_list_items

NormanGroup:
	next_list_item; NORMAN (1) Unreferenced
	db "NORMAN@", TRAINERTYPE_NORMAL
	db 7
	dw LINOONE
	db 7
	dw SPINDA
	db 15
	dw DITTO
	db -1 ; end

	next_list_item; NORMAN (2) Unreferenced
	db "NORMAN@", TRAINERTYPE_NORMAL
	db 8
	dw LINOONE
	db 8
	dw SPINDA
	db 15
	dw DITTO
	db 8
	dw URSARING
	db 11
	dw SNORLAX
	db -1 ; end

	next_list_item ; NORMAN (3)
	db "NORMAN@", TRAINERTYPE_ITEM_MOVES
	db 15
	dw DITTO
	dw QUICK_CLAW
	dw TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE	
	db 9
	dw SPINDA
	dw PINK_BOW
	dw BELLY_DRUM, EXTREMESPEED, NO_MOVE, NO_MOVE
	db 9
	dw ARCANINE
	dw CHARCOAL
	dw BODY_SLAM, SACRED_FIRE, PURSUIT, SWORDS_DANCE
	db 9
	dw SNORLAX
	dw LEFTOVERS
	dw SLEEP_TALK, SNORE, REST, COSMIC_POWER
	db 10
	dw SNORLAX
	dw LEFTOVERS
	dw BODY_SLAM, EARTHQUAKE, REST, SLEEP_TALK
	db 11
	dw FURRET2
	dw PINK_BOW
	dw BODY_SLAM, DRAGON_CLAW, RECOVER, DRAGON_DANCE	
	db -1 ; end

	end_list_items

WinonaGroup:
	next_list_item; WINONA (1) Fortree Gym Easy
	db "WINONA@", TRAINERTYPE_NORMAL
	db 8
	dw SWELLOW
	db 8
	dw PELIPPER
	db 9
	dw ALTARIA
	db -1 ; end

	next_list_item; WINONA (2) Fortree Gym Medium
	db "WINONA@", TRAINERTYPE_NORMAL
	db 8
	dw SWELLOW
	db 8
	dw PELIPPER
	db 9
	dw SKARMORY
	db 9
	dw TROPIUS
	db 10
	dw ALTARIA
	db -1 ; end

	next_list_item; WINONA (3) Fortree Gym Hard
	db "WINONA@", TRAINERTYPE_NORMAL
	db 8
	dw SWELLOW
	db 8
	dw PELIPPER
	db 9
	dw SKARMORY
	db 9
	dw TROPIUS
	db 10
	dw TOGEKISS
	db 11
	dw ALTARIAX
	db -1 ; end

	end_list_items

TateLizaGroup:
	next_list_item; TATELIZA (1) Mossdeep Gym
	db "TATE&LIZA@", TRAINERTYPE_NORMAL	
	db 10
	dw SOLROCK
	db 10
	dw LUNATONE
	db -1 ; end

	next_list_item; TATELIZA (2) Mossdeep Gym
	db "TATE&LIZA@", TRAINERTYPE_NORMAL
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
	db "TATE&LIZA@", TRAINERTYPE_NORMAL
	db 10
	dw SOLROCK
	db 10
	dw LUNATONE
	db 10
	dw GARDEVOIR
	db 10
	dw GALLADE
	db 10
	dw CLAYDOL
	db 10
	dw CHIMECHOX	
	db -1 ; end

	end_list_items

WallaceGroup:
	next_list_item; WALLACE (1) Unreferenced
	db "WALLACE@", TRAINERTYPE_NORMAL
	db 10
	dw LUVDISC
	db 10
	dw LANTURN
	db 10
	dw WHISCASH
	db 10
	dw SEAKING
	db 10
	dw GYARADOS
	db 10
	dw MILOTIC
	db -1 ; end

	end_list_items

SidneyGroup:
	next_list_item; SIDNEY (1) Unreferenced
	db "SIDNEY@", TRAINERTYPE_NORMAL
	db 10
	dw SHARPEDO
	db 10
	dw SHIFTRY
	db 10
	dw MIGHTYENA
	db 10
	dw HYPNO
	db 10
	dw UMBREON
	db 10
	dw ABSOL
	db -1 ; end

	end_list_items

PhoebeGroup:
	next_list_item; PHOEBE (1) Unreferenced
	db "PHOEBE@", TRAINERTYPE_NORMAL
	db 10
	dw DUSKNOIR
	db 10
	dw NINETALES
	db 10
	dw PARASECT
	db 10
	dw SABLEYE
	db 10
	dw BANETTE
	db 10
	dw UNOWN
	db -1 ; end

	end_list_items

GlaciaGroup:
	next_list_item; GLACIA (1) Unreferenced
	db "GLACIA@", TRAINERTYPE_NORMAL
	db 10
	dw ANINETALES
	db 10
	dw FROSLASS
	db 10
	dw WALREIN
	db 10
	dw ASANDSLASH	
	db 10
	dw JYNX
	db 10
	dw GLALIE
	db -1 ; end

	end_list_items

DrakeGroup:
	next_list_item; DRAKE (1) Unreferenced
	db "DRAKE@", TRAINERTYPE_NORMAL
	db 10
	dw ALTARIA
	db 10
	dw FLYGON
	db 10
	dw KINGDRA
	db 10
	dw YANMEGA
	db 10
	dw EXEGGUTOR2
	db 10
	dw SALAMENCE
	db -1 ; end

	end_list_items

StevenGroup:
	next_list_item; STEVEN (1) Unreferenced
	db "STEVEN@", TRAINERTYPE_NORMAL
	db 10
	dw SKARMORY
	db 10
	dw AERODACTYL
	db 10
	dw AGGRON
	db 10
	dw PROBOPASS
	db 10
	dw SCIZOR	
	db 10
	dw METAGROSS
	db -1 ; end

	end_list_items


BattleGirlGroup:
	next_list_item; BATTLE_GIRL (1) Dewford City Gym
	db "LAURA@", TRAINERTYPE_NORMAL
	db 7
	dw MEDITITE
	db -1 ; end

	next_list_item; BATTLE_GIRL (2) Dewford City Gym
	db "LILITH@", TRAINERTYPE_NORMAL	
	db 7
	dw FARFETCH_D
	db -1 ; end

	next_list_item; BATTLE_GIRL (3) Dewford City Gym
	db "JOCELYN@", TRAINERTYPE_NORMAL
	db 7
	dw COMBUSKEN
	db 7
	dw MANKEY
	db -1 ; end

	next_list_item; BATTLE_GIRL (4) Lavaridge Gym
	db "DANIELLE@", TRAINERTYPE_NORMAL
	db 7
	dw MEDITITE
	db 7
	dw NINETALES
	db -1 ; end

	next_list_item; BATTLE_GIRL (4) Route 117
	db "AISHA@", TRAINERTYPE_NORMAL
	db 6
	dw HITMONLEE
	db 6
	dw ABSOL
	db -1 ; end

	next_list_item; BATTLE_GIRL (5) Route 120
	db "CALLIE@", TRAINERTYPE_NORMAL
	db 6
	dw HITMONTOP
	db 6
	dw MAKUHITA
	db -1 ; end

	end_list_items


RangerMGroup:
	next_list_item; RANGERM (1) Unreferenced
	db "STEVEN@", TRAINERTYPE_NORMAL
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
	dw GENGAR
	dw NO_ITEM
	dw PSYCHIC_M, GIGA_DRAIN, SLUDGE_WAVE, SHADOW_BALL
	db 11
	dw STARMIE
	dw NO_ITEM
	dw MIST_BALL, HYDRO_CANNON, THUNDERBOLT, BLIZZARD
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
	db "ELI@", TRAINERTYPE_NORMAL
	db 7
	dw MEGANIUM
	db 7
	dw TROPIUS
	db 8
	dw VENUSAUR
	db -1 ; end

	next_list_item; RANGERM (6) Safari Zone Randal
	db "RANDAL@", TRAINERTYPE_NORMAL
	db 7
	dw TYPHLOSION
	db 7
	dw KANGASKHAN
	db 8
	dw CHARIZARD
	db -1 ; end

	next_list_item; RANGERM (7) Safari Zone Steven
	db "STEVEN@", TRAINERTYPE_NORMAL
	db 7
	dw RHYDON
	db 7
	dw MR__MIME
	db 8
	dw SCYTHER
	db -1 ; end

	next_list_item; RANGERM (8) Route 119
	db "JACKSON@", TRAINERTYPE_NORMAL
	db 7
	dw BAYLEEF
	db 7
	dw GOLDUCK
	db 7
	dw BRELOOM
	db -1 ; end

	next_list_item; RANGERM (9) Route 119
	db "TAKASHI@", TRAINERTYPE_NORMAL
	db 7
	dw LEAFEON
	db 7
	dw FLAREON
	db 7
	dw GLACEON
	db -1 ; end

	next_list_item; RANGERM (10) Route 119
	db "YASU@", TRAINERTYPE_NORMAL
	db 7
	dw ESPEON
	db 7
	dw UMBREON
	db 7
	dw SYLVEON
	db -1 ; end

	next_list_item; RANGERM (11) Route 119
	db "HIDEO@", TRAINERTYPE_NORMAL
	db 7
	dw JOLTEON
	db 7
	dw POLITOED
	db 7
	dw XATU
	db -1 ; end

	next_list_item; RANGERM (12) Route 120
	db "RILEY@", TRAINERTYPE_NORMAL
	db 7
	dw DUSTOX
	db 7
	dw POLIWRATH
	db 7
	dw ZANGOOSE
	db -1 ; end

	next_list_item; RANGERM (13) Route 120
	db "LORENZO@", TRAINERTYPE_NORMAL
	db 7
	dw AMUK
	db 7
	dw QUAGSIRE
	db 7
	dw EXEGGCUTE
	db -1 ; end

	next_list_item; RANGERM (14) Route 120
	db "KEIGO@", TRAINERTYPE_NORMAL
	db 7
	dw WEEZING
	db 7
	dw TANGELA
	db 7
	dw IKARI
	db -1 ; end

	end_list_items

RangerFGroup:
	next_list_item; RANGERF (1) Unreferenced
	db "STEVEN@", TRAINERTYPE_NORMAL
	db 7
	dw CHIKORITA
	db 7
	dw CYNDAQUIL
	db 8
	dw TOTODILE
	db -1 ; end

	next_list_item; RANGERF (2) Safari Zone Monica
	db "MONICA@", TRAINERTYPE_NORMAL
	db 7
	dw JYNX
	db 7
	dw LICKITUNG
	db 8
	dw PINSIR
	db -1 ; end

	next_list_item; RANGERF (3) Safari Zone Tina
	db "TINA@", TRAINERTYPE_NORMAL
	db 7
	dw CHIMECHO
	db 7
	dw BRELOOM
	db 8
	dw DELCATTY
	db -1 ; end

	next_list_item; RANGERF (4) Safari Zone Rachael
	db "RACHAEL@", TRAINERTYPE_NORMAL
	db 7
	dw LUDICOLO
	db 7
	dw STANTLER
	db 8
	dw SLOWKING
	db -1 ; end

	next_list_item; RANGERF (5) Route 119
	db "CATHERINE@", TRAINERTYPE_NORMAL
	db 7
	dw LUVDISC
	db 7
	dw AZUMARILL
	db 7
	dw SEADRA
	db -1 ; end

	next_list_item; RANGERF (6) Route 119
	db "RACHEL@", TRAINERTYPE_NORMAL
	db 7
	dw TORKOAL
	db 7
	dw TROPIUS
	db 7
	dw FLAREON
	db -1 ; end

	next_list_item; RANGERF (7) Route 119
	db "DANI@", TRAINERTYPE_NORMAL
	db 7
	dw ANINETALES
	db 7
	dw FROSLASS
	db 7
	dw DEWGONG
	db -1 ; end

	next_list_item; RANGERF (8) Route 120
	db "JENNA@", TRAINERTYPE_NORMAL
	db 7
	dw NINETALES
	db 7
	dw RAPIDASH
	db 7
	dw ASHIBOMB
	db -1 ; end

	end_list_items

ExplorerGroup:
	next_list_item; EXPLORER (1) Route 105
	db "FOSTER@", TRAINERTYPE_NORMAL
	db 5
	dw RELICANTH
	db 5
	dw URSARING
	db 7
	dw NOSEPASS
	db -1 ; end

	next_list_item; EXPLORER (2) Route 105
	db "ANDRES@", TRAINERTYPE_NORMAL
	db 5
	dw ASANDSHREW
	db 5
	dw CRAWDAUNT
	db 7
	dw ARMALDO
	db -1 ; end

	next_list_item; EXPLORER (3) Safari Zone Joey
	db "JOEY@", TRAINERTYPE_NORMAL
	db 6
	dw ASANDSLASH
	db 7
	dw ASANDSHREW
	db 8
	dw ARMALDO
	db -1 ; end

	next_list_item; EXPLORER (4) Safari Zone Ross
	db "ROSS@", TRAINERTYPE_NORMAL
	db 6
	dw METANG
	db 7
	dw CLAYDOL
	db 8
	dw YANMEGA
	db -1 ; end

	next_list_item; EXPLORER (5) Safari Zone Chandler
	db "CHANDLER@", TRAINERTYPE_NORMAL
	db 6
	dw WHISCASH
	db 7
	dw CAMERUPT
	db 8
	dw HARIYAMA
	db -1 ; end

	next_list_item; EXPLORER (6) Testroom
	db "TEST@", TRAINERTYPE_RANDOM | TRAINERTYPE_ITEM | TRAINERTYPE_MOVES, 6, BATTLETOWER_LEGEND	
	db -1 ; end

	next_list_item; EXPLORER (7) Lavaridge Desert
	db "DUSTY@", TRAINERTYPE_NORMAL
	db 5
	dw GLIGAR
	db 5
	dw SHUCKLE
	db 7
	dw KLEAVOR
	db -1 ; end

	next_list_item; EXPLORER (8) Lavaridge Desert
	db "BRYAN@", TRAINERTYPE_NORMAL
	db 5
	dw RELICANTH
	db 5
	dw SOLROCK
	db 7
	dw SLOWKING
	db -1 ; end

	next_list_item; EXPLORER (9) Route 120
	db "CHIP@", TRAINERTYPE_NORMAL
	db 5
	dw YANMA2
	db 5
	dw SKARMORY
	db 7
	dw KINGLER
	db -1 ; end

	next_list_item; EXPLORER (10) Route 120
	db "DALE@", TRAINERTYPE_NORMAL
	db 5
	dw YANMA
	db 5
	dw GLIGAR
	db 7
	dw MAGNETON
	db -1 ; end

	end_list_items


	PsychicFGroup:

	next_list_item; PSYCHIC_F (01) Mossdeep Gym
	db "MAURA@", TRAINERTYPE_NORMAL
	db 6
	dw DROWZEE
	db 7
	dw KADABRA
	db -1 ; end

	next_list_item; PSYCHIC_F (02) Mossdeep Gym
	db "SAMANTHA@", TRAINERTYPE_NORMAL
	db 6
	dw MISDREAVUS
	db 7
	dw XATU
	db -1 ; end

	next_list_item; PSYCHIC_F (03) Mossdeep Gym
	db "MACEY@", TRAINERTYPE_NORMAL
	db 6
	dw NATU
	db 7
	dw SLOWKING
	db -1 ; end

	next_list_item; PSYCHIC_F (04) Mossdeep Gym
	db "KATHLEEN@", TRAINERTYPE_NORMAL
	db 6
	dw SLOWPOKE
	db 7
	dw BANETTE
	db -1 ; end

	next_list_item; PSYCHIC_F (05) Mossdeep Gym
	db "SYLVIA@", TRAINERTYPE_NORMAL
	db 6
	dw HAUNTER
	db 7
	dw MEDICHAM
	db -1 ; end

	next_list_item; PSYCHIC_F (06) Mossdeep Gym
	db "HANNAH@", TRAINERTYPE_NORMAL
	db 6
	dw BALTOY
	db 7
	dw BUTTERFREE
	db -1 ; end

	end_list_items

ENDSECTION


SECTION "Random Party Lists", ROMX

RandomPartyLists::
    ; BATTLETOWER_EASY
    db 21
    db 11
	dw BUTTERFREE, MIRACLEBERRY, MOONBLAST, GIGA_DRAIN, STUN_SPORE, WHIRLWIND
	db $fe
	db 11
	dw BEEDRILL, LEFTOVERS, PURSUIT, MEGAHORN, POISON_JAB, TOXIC
	db $fe
	db 11
	dw PIDGEOT, GOLD_BERRY, PURSUIT, STEEL_WING, HURRICANE, DRILL_PECK
	db $fe
	db 11
	dw RATICATE, FOCUS_BAND, HYPER_FANG, CRUNCH, ICE_FANG, FIRE_FANG
	db $fe
	db 11
	dw FEAROW, MIRACLEBERRY, DRILL_PECK, HYPER_BEAM, MIRROR_MOVE, EXTREMESPEED
	db $fe
	db 11
	dw ARBOK, SCOPE_LENS, CRUNCH, DIG, ICE_FANG, POISON_FANG
	db $fe
	db 11
	dw RAICHU, GOLD_BERRY, THUNDERBOLT, MEDITATE, AGILITY, SURF
	db $fe
	db 11
	dw SANDSLASH, LEFTOVERS, SANDSTORM, SLASH, ROCK_SLIDE, DIG
	db $fe
	db 11
	dw NIDOKING, MIRACLEBERRY, EARTHQUAKE, POISON_JAB, BODY_SLAM, REST
	db $fe
	db 11
	dw CLEFABLE, GOLD_BERRY, SWIFT, METEOR_MASH, FIRE_PUNCH, THUNDERPUNCH
	db $fe
	db 11
	dw GOLDUCK, BRIGHTPOWDER, PSYCHIC_M, SURF, HYPER_BEAM, SLASH
	db $fe
	db 11
	dw POLIWRATH, FOCUS_BAND, FOCUS_PUNCH, SURF, AQUA_JET, HYPNOSIS
	db $fe
	db 11
	dw FARFETCH_D, GOLD_BERRY, JUMP_KICK, SWORDS_DANCE, WING_ATTACK, LEAF_BLADE
	db $fe
	db 11
	dw MAROWAK, KINGS_ROCK, BONE_RUSH, MUD_SLAP, SHADOW_BALL, BODY_SLAM
	db $fe
	db 11
	dw HITMONCHAN, QUICK_CLAW, MEGA_PUNCH, BULLET_PUNCH, FIRE_PUNCH, SHADOW_PUNCH
	db $fe
	db 11
	dw LICKITUNG, MIRACLEBERRY, HEADBUTT, PROTECT, TOXIC, SURF
	db $fe
	db 11
	dw KANGASKHAN, KINGS_ROCK, SUBMISSION, BODY_SLAM, ICE_BEAM, DIZZY_PUNCH
	db $fe
	db 11
	dw SEAKING, GOLD_BERRY, REVERSAL, ENDURE, DRILL_PECK, WATERFALL
	db $fe
	db 11
	dw DITTO, BERRY, TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE
	db $fe
	db 11
	dw OMASTAR, KINGS_ROCK, ANCIENTPOWER, SURF, AGILITY, RAIN_DANCE
	db $fe
	db 11
	dw KABUTOPS, QUICK_CLAW, SANDSTORM, SLASH, ICE_BEAM, GIGA_DRAIN
	db $fe
    db -1 ; end

	; BATTLETOWER_HARD
    db 40
    db 11
	dw JOLTEON, MIRACLEBERRY, THUNDERBOLT, CHARGE, SHADOW_BALL, THUNDER_WAVE
	db $fe
	db 11
	dw ESPEON, LEFTOVERS, MUD_SLAP, PSYCHIC_M, PSYCH_UP, TOXIC
	db $fe
	db 11
	dw UMBREON, GOLD_BERRY, DARK_PULSE, REST, PSYCH_UP, TOXIC
	db $fe
	db 11
	dw VAPOREON, LEFTOVERS, SURF, MIRROR_COAT, BLIZZARD, ACID_ARMOR
	db $fe
	db 11
	dw FLAREON, MIRACLEBERRY, WILLOWISP, DRAGON_DANCE, FIRE_BLAST, BODY_SLAM
	db $fe
	db 11
	dw GLACEON, SCOPE_LENS, ICY_WIND, BLIZZARD, MIRROR_COAT, MUD_SHOT
	db $fe
	db 11
	dw LEAFEON, GOLD_BERRY, PETAL_DANCE, STUN_SPORE, SUBMISSION, RECOVER
	db $fe
	db 11
	dw SYLVEON, LEFTOVERS, CALM_MIND, MIST_BALL, GROWL, DRAININGKISS
	db $fe
	db 11
	dw SLAKING, MIRACLEBERRY, REST, BODY_SLAM, EARTHQUAKE, SNORE
	db $fe
	db 11
	dw MACHAMP, GOLD_BERRY, CROSS_CHOP, MACH_PUNCH, ROCK_SLIDE, SHADOW_PUNCH
	db $fe
	db 11
	dw AMUK, BRIGHTPOWDER, COSMIC_POWER, SLUDGE_BOMB, MUD_SHOT, TOXIC
	db $fe
	db 11
	dw DUGTRIO, FOCUS_BAND, FISSURE, ROCK_SLIDE, TRI_ATTACK, SWORDS_DANCE
	db $fe
	db 11
	dw SWELLOW, GOLD_BERRY, DRILL_PECK, FLY, BODY_SLAM, MIRROR_MOVE
	db $fe
	db 11
	dw SCIZOR, KINGS_ROCK, BULLET_PUNCH, FURY_CUTTER, VICEGRIP, LEAF_BLADE
	db $fe
	db 11
	dw AGOLEM, QUICK_CLAW, ZAP_CANNON, STONE_EDGE, EXPLOSION, EARTHQUAKE
	db $fe
	db 11
	dw GENGAR, MIRACLEBERRY, SHADOW_BALL, SLUDGE_WAVE, HYPNOSIS, DREAM_EATER
	db $fe
	db 11
	dw SALAMENCE, KINGS_ROCK, DRAGON_CLAW, DRAGON_DANCE, FLY, FIRE_BLAST
	db $fe
	db 11
	dw WEAVILE, GOLD_BERRY, ICICLE_SPEAR, PURSUIT, MACH_PUNCH, SWORDS_DANCE
	db $fe
	db 11
	dw AGGRON, BERRY, VICEGRIP, STONE_EDGE, MUD_SLAP, STONE_EDGE
	db $fe
	db 11
	dw TOGEKISS, KINGS_ROCK, LUSTER_PURGE, MIST_BALL, RAZOR_WIND, CALM_MIND
	db $fe
	db 11
	dw GLISCOR, QUICK_CLAW, TOXIC, SLASH, EARTHQUAKE, FLY
	db $fe
	db 11
	dw MAMOSWINE, MIRACLEBERRY, BLIZZARD, EARTHQUAKE, BODY_SLAM, ICY_WIND
	db $fe
	db 11
	dw WALREIN, LEFTOVERS, BLIZZARD, SURF, EARTHQUAKE, AMNESIA
	db $fe
	db 11
	dw TYRANITAR, GOLD_BERRY, CRUNCH, STONE_EDGE, EARTHQUAKE, SPIKES
	db $fe
	db 11
	dw METAGROSS, LEFTOVERS, METEOR_MASH, PSYCHIC_M, BULLET_PUNCH, REFLECT
	db $fe
	db 11
	dw WYRDEER, MIRACLEBERRY, WILLOWISP, PSYCHIC_M, HYPNOSIS, DREAM_EATER
	db $fe
	db 11
	dw PORYGONZ, SCOPE_LENS, ZAP_CANNON, HYPER_BEAM, THUNDER_WAVE, CHARGE
	db $fe
	db 11
	dw ANNIHILAPE, GOLD_BERRY, SUBMISSION, SHADOW_FORCE, MACH_PUNCH, BULK_UP
	db $fe
	db 11
	dw CORSOLA, LEFTOVERS, COSMIC_POWER, MIST_BALL, MIRROR_COAT, ANCIENTPOWER
	db $fe
	db 11
	dw TENTACRUEL2, MIRACLEBERRY, REST, ROCK_SLIDE, SIGNAL_BEAM, SURF
	db $fe
	db 11
	dw FROSLASS, MIRACLEBERRY, ICY_WIND, SHADOW_BALL, BLIZZARD, HAIL
	db $fe
	db 11
	dw KLEAVOR, SCOPE_LENS, STONE_EDGE, SLASH, MEGAHORN, DRAGON_DANCE
	db $fe
	db 11
	dw MUK, LEFTOVERS, COSMIC_POWER, SLUDGE_BOMB, MUD_SHOT, TOXIC
	db $fe
	db 11
	dw PROBOPASS, FOCUS_BAND, FISSURE, STONE_EDGE, THUNDER, FLASHCANNON
	db $fe
	db 11
	dw BUTTERFREE, GOLD_BERRY, HURRICANE, LUSTER_PURGE, SPORE, AGILITY
	db $fe
	db 11
	dw GALLADE, KINGS_ROCK, PSYCHO_CUT, CROSS_CHOP, LEAF_BLADE, DRAGON_DANCE
	db $fe
	db 11
	dw PARASECT, MIRACLEBERRY, STUN_SPORE, LEAF_BLADE, SHADOW_FORCE, GIGA_DRAIN
	db $fe
	db 11
	dw MAGMORTAR, GOLD_BERRY, FIRE_BLAST, MACH_PUNCH, SLUDGE_BOMB, PSYCHIC_M
	db $fe
	db 11
	dw URSARING, MIRACLEBERRY, REST, CRUSH_CLAW, EARTHQUAKE, ICE_FANG
	db $fe
	db 11
	dw GARDEVOIR, GOLD_BERRY, MOONBLAST, PSYCHIC_M, CALM_MIND, DRAININGKISS
	db $fe
    db -1 ; end

	; BATTLETOWER_LEGEND
    db 53
    db 11
	dw ARTICUNO, MIRACLEBERRY, BLIZZARD, FLY, REST, HURRICANE
	db $fe
	db 11
	dw ZAPDOS, LEFTOVERS, THUNDER, DRILL_PECK, DETECT, THUNDER_WAVE
	db $fe
	db 11
	dw MOLTRES, GOLD_BERRY, DARK_PULSE, FIRE_BLAST, SOLARBEAM, SKY_ATTACK
	db $fe
	db 11
	dw MEWTWO, LEFTOVERS, PSYCHIC_M, FOCUS_PUNCH, RECOVER, AMNESIA
	db $fe
	db 11
	dw MEW, MIRACLEBERRY, WILLOWISP, LUSTER_PURGE, REST, ANCIENTPOWER
	db $fe
	db 11
	dw RAIKOU, SCOPE_LENS, THUNDER_WAVE, THUNDERBOLT, CRUNCH, PSYCH_UP
	db $fe
	db 11
	dw ENTEI, GOLD_BERRY, SACRED_FIRE, CRUNCH, ROAR, RECOVER
	db $fe
	db 11
	dw SUICUNE, LEFTOVERS, HYDRO_PUMP, BLIZZARD, MIST, MIRROR_COAT
	db $fe
	db 11
	dw LUGIA, MIRACLEBERRY, HYDRO_PUMP, AEROBLAST, EARTHQUAKE, MIST
	db $fe
	db 11
	dw HO_OH, GOLD_BERRY, SACRED_FIRE, FLY, EARTHQUAKE, RECOVER
	db $fe
	db 11
	dw CELEBI, BRIGHTPOWDER, GIGA_DRAIN, MOONLIGHT, STUN_SPORE, LEECH_SEED
	db $fe
	db 11
	dw REGIROCK, FOCUS_BAND, FISSURE, ROCK_SLIDE, STONE_EDGE, SANDSTORM
	db $fe
	db 11
	dw REGICE, GOLD_BERRY, HAIL, BLIZZARD, COSMIC_POWER, SUPERPOWER
	db $fe
	db 11
	dw REGISTEEL, KINGS_ROCK, SANDSTORM, EARTHQUAKE, VICEGRIP, SUPERPOWER
	db $fe
	db 11
	dw LATIOS, QUICK_CLAW, DRAGON_DANCE, FUTURE_SIGHT, PSYCHIC_M, DRAGON_CLAW
	db $fe
	db 11
	dw LATIAS, MIRACLEBERRY, DRAGONBREATH, PSYCHIC_M, CALM_MIND, MIST_BALL
	db $fe
	db 11
	dw KYOGRE, KINGS_ROCK, CALM_MIND, SURF, THUNDER, HYDRO_PUMP
	db $fe
	db 11
	dw GROUDON, GOLD_BERRY, FISSURE, SOLARBEAM, FIRE_BLAST, DRAGON_CLAW
	db $fe
	db 11
	dw RAYQUAZA, BERRY, DRAGON_CLAW, DRAGON_DANCE, SKY_ATTACK, ICE_BEAM
	db $fe
	db 11
	dw JIRACHI, KINGS_ROCK, METEOR_MASH, FUTURE_SIGHT, COSMIC_POWER, SANDSTORM
	db $fe
	db 11
	dw TOTARTLE, QUICK_CLAW, SURF, THUNDER, SKULL_BASH, PROTECT
	db $fe
	db 11
	dw GOROCHU, MIRACLEBERRY, VOLT_TACKLE, OUTRAGE, BEAT_UP, SURF
	db $fe
	db 11
	dw DRAGONITEX, LEFTOVERS, DRAGON_CLAW, DRAGON_DANCE, FLY, SAFEGUARD
	db $fe
	db 11
	dw DRAGONITEY, GOLD_BERRY, DRAGONBREATH, HYDRO_PUMP, THUNDER, FIRE_BLAST
	db $fe
	db 11
	dw VENUSAURX, LEFTOVERS, FRENZY_PLANT, SLUDGE_BOMB, GIGA_DRAIN, STUN_SPORE
	db $fe
	db 11
	dw BLASTOISEX, MIRACLEBERRY, ICY_WIND, HYDRO_PUMP, FLASHCANNON, PROTECT
	db $fe
	db 11
	dw CHARIZARDY, SCOPE_LENS, BLAST_BURN, SOLARBEAM, FLY, DRAGONBREATH
	db $fe
	db 11
	dw BEEDRILLX, GOLD_BERRY, BEAT_UP, MEGAHORN, AGILITY, SWORDS_DANCE
	db $fe
	db 11
	dw ALAKAZAMX, LEFTOVERS, CALM_MIND, FOCUS_PUNCH, PSYCHIC_M, RECOVER
	db $fe
	db 11
	dw SLOWBROX, MIRACLEBERRY, REST, AMNESIA, PSYCHIC_M, SURF
	db $fe
	db 11
	dw GENGARX, MIRACLEBERRY, PSYCHIC_M, SHADOW_BALL, HYPNOSIS, EXPLOSION
	db $fe
	db 11
	dw PINSIRX, SCOPE_LENS, STONE_EDGE, FLY, MEGAHORN, GUILLOTINE
	db $fe
	db 11
	dw GYARADOSX, LEFTOVERS, WATERFALL, RAIN_DANCE, HYPER_BEAM, THUNDER_FANG
	db $fe
	db 11
	dw AERODACTYLX, FOCUS_BAND, STONE_EDGE, SKY_ATTACK, ICE_FANG, STEEL_WING
	db $fe
	db 11
	dw AMPHAROSX, GOLD_BERRY, THUNDERBOLT, CHARGE, THUNDER_WAVE, DRAGONBREATH
	db $fe
	db 11
	dw STEELIXX, KINGS_ROCK, FISSURE, VICEGRIP, STONE_EDGE, TOXIC
	db $fe
	db 11
	dw SCIZORX, MIRACLEBERRY, BULLET_PUNCH, GUILLOTINE, MACH_PUNCH, LEAF_BLADE
	db $fe
	db 11
	dw HERACROSSX, GOLD_BERRY, CROSS_CHOP, MACH_PUNCH, MEGAHORN, BULK_UP
	db $fe
	db 11
	dw HOUNDOOMX, MIRACLEBERRY, BLAST_BURN, DARK_PULSE, FLAMETHROWER, ICE_FANG
	db $fe
	db 11
	dw AGGRONX, GOLD_BERRY, FISSURE, REST, STONE_EDGE, SPIKES
	db $fe
	db 11
	dw CAMERUPTX, GOLD_BERRY, FISSURE, BLAST_BURN, STONE_EDGE, SUNNY_DAY
	db $fe
	db 11
	dw ALTARIAX, GOLD_BERRY, FLY, LUSTER_PURGE, OUTRAGE, THUNDER_WAVE
	db $fe
	db 11
	dw ABSOLX, GOLD_BERRY, SLASH, SKY_ATTACK, ICE_FANG, BEAT_UP
	db $fe
	db 11
	dw GLALIEX, GOLD_BERRY, BLIZZARD, BULK_UP, CRUNCH, THUNDER_FANG
	db $fe
	db 11
	dw SALAMENCEX, GOLD_BERRY, DRAGON_CLAW, EARTHQUAKE, FIRE_BLAST, DRAGON_DANCE
	db $fe
	db 11
	dw METAGROSSX, GOLD_BERRY, METEOR_MASH, BULLET_PUNCH, PSYCHIC_M, REFLECT
	db $fe
	db 11
	dw KINGLERX, GOLD_BERRY, CRABHAMMER, AQUA_JET, GUILLOTINE, AMNESIA
	db $fe
	db 11
	dw TROPIUSX, GOLD_BERRY, SUNNY_DAY, FLY, GIGA_DRAIN, PROTECT
	db $fe
	db 11
	dw SWALOTX, GOLD_BERRY, COSMIC_POWER, REST, SLUDGE_BOMB, TOXIC
	db $fe
	db 11
	dw FLYGONX, GOLD_BERRY, FISSURE, DRAGONBREATH, DRAGON_DANCE, SPIKES
	db $fe
	db 11
	dw CHIMECHOX, GOLD_BERRY, FUTURE_SIGHT, MIST, FLASHCANNON, RECOVER
	db $fe
	db 11
	dw VICTREEBELX, GOLD_BERRY, LEAF_BLADE, SLUDGE_BOMB, SWORDS_DANCE, WRAP
	db $fe
	db 11
	dw UNOWNX, GOLD_BERRY, WILLOWISP, SHADOW_CLAW, RECOVER, COSMIC_POWER
	db $fe
    db -1 ; end
	