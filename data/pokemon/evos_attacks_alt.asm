SECTION "Evolutions and Attacks 4", ROMX

EvosAttacksPointers4::

;gen4+ mons
	dw TogekissEvosAttacks
	dw MamoswineEvosAttacks
	dw SylveonEvosAttacks
	dw LeafeonEvosAttacks
	dw GlaceonEvosAttacks
	dw GliscorEvosAttacks
	dw GalladeEvosAttacks
	dw FroslassEvosAttacks
	dw HonchkrowEvosAttacks
	dw WeavileEvosAttacks
	dw MagnezoneEvosAttacks
	dw TangrowthEvosAttacks
	dw ElectivireEvosAttacks
	dw MagmortarEvosAttacks
	dw WyrdeerEvosAttacks
	dw PorygonzEvosAttacks
	dw AnnihilapeEvosAttacks
	dw KleavorEvosAttacks
	dw RoseradeEvosAttacks
	dw AmbipomEvosAttacks
	dw MismagiusEvosAttacks
	dw LickilickyEvosAttacks
	dw RhyperiorEvosAttacks
	dw YanmegaEvosAttacks
	dw ProbopassEvosAttacks
	dw DusknoirEvosAttacks
	;alt forms
	dw AraichuEvosAttacks
	dw AmarowakEvosAttacks
	dw AgrimerEvosAttacks
	dw AmukEvosAttacks
	dw AsandshrewEvosAttacks
	dw AsandslashEvosAttacks
	dw AvulpixEvosAttacks
	dw AninetalesEvosAttacks
	dw AgeodudeEvosAttacks
	dw AgravelerEvosAttacks
	dw AgolemEvosAttacks
	dw HvoltorbEvosAttacks
	dw HelectrodeEvosAttacks
	dw IronbundleEvosAttacks
	;reddit mons
	dw Voltorb2EvosAttacks
	dw Electrode2EvosAttacks
	dw Exeggcute2EvosAttacks
	dw Exeggutor2EvosAttacks
	dw Furret2EvosAttacks
	dw Noctowl2EvosAttacks
	dw Octillery2EvosAttacks
	dw Yanma2EvosAttacks
	dw Scyther2EvosAttacks
	dw ScizorEvosAttacks
	dw Tentacool2EvosAttacks
	dw Tentacruel2EvosAttacks
	dw Rapidash2EvosAttacks
	dw Ninetales2EvosAttacks
	dw Tauros2EvosAttacks
	dw Swinub2EvosAttacks
	dw Piloswine2EvosAttacks
	dw Skarmory2EvosAttacks
	dw Totodile2EvosAttacks
	dw Croconaw2EvosAttacks
	dw Feraligatr2EvosAttacks
	dw Cyndaquil2EvosAttacks
	dw Quilava2EvosAttacks
	dw Typhlosion2EvosAttacks
	;beta mons
	dw HanamoleEvosAttacks
	dw HonobeaEvosAttacks
	dw BorubeaEvosAttacks
	dw DynabeaEvosAttacks
	dw KurusuEvosAttacks
	dw AkuaEvosAttacks
	dw AkueriaEvosAttacks
	dw HaneeiEvosAttacks
	dw TsubomittEvosAttacks
	dw KotoraEvosAttacks
	dw RaitoraEvosAttacks
	dw AshibombEvosAttacks
	dw SunbouEvosAttacks
	dw IkariEvosAttacks
	dw TotartleEvosAttacks
	dw GorochuEvosAttacks	
.IndirectEnd::

TogekissEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 5, POUND
	dbw 10, SWEET_KISS
	dbw 12, METRONOME
	dbw 16, PIXIE_DUST
	dbw 20, ENCORE
	dbw 22, SAFEGUARD
	dbw 24, FAE_VOICE
	dbw 28, DOUBLE_TEAM
	dbw 32, PSYBEAM
	dbw 36, MOONBLAST
	dbw 40, RAZOR_WIND
	dbw 42, CALM_MIND
	dbw 45, PLAY_ROUGH
	dbw 50, MIST_BALL
	dbw 55, OUTRAGE
	dbw 60, LUSTER_PURGE
	db 0 ; no more level-up moves

MamoswineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 10, ENDURE
	dbw 15, CURSE
	dbw 20, ANCIENTPOWER	
	dbw 24, ICICLE_SPEAR
	dbw 28, MAGNITUDE
	dbw 32, BULK_UP
	dbw 36, ICICLE_CRASH
	dbw 40, EARTHQUAKE
	dbw 42, MIST
	dbw 45, BLIZZARD
	dbw 50, AMNESIA
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves	

SylveonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, QUICK_ATTACK
	dbw 20, GROWL
	dbw 24, DRAININGKISS
	dbw 28, MAGICAL_LEAF
	dbw 32, BATON_PASS
	dbw 36, FAERIEGLEAM
	dbw 40, SHADOW_BALL
	dbw 42, CALM_MIND
	dbw 45, RECOVER
	dbw 50, MIST_BALL
	dbw 55, POWER_GEM
	dbw 60, MOONBLAST
	db 0 ; no more level-up moves

LeafeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, VINE_WHIP
	dbw 16, QUICK_ATTACK
	dbw 20, LEECH_SEED
	dbw 24, RAZOR_LEAF
	dbw 28, SWIFT
	dbw 32, BRICK_BREAK
	dbw 36, LEAF_BLADE
	dbw 40, BODY_SLAM
	dbw 42, BULK_UP
	dbw 45, RECOVER
	dbw 50, PSYCHO_CUT
	dbw 55, SUBMISSION
	dbw 60, PETAL_DANCE
	db 0 ; no more level-up moves

GlaceonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, POWDER_SNOW
	dbw 16, QUICK_ATTACK
	dbw 20, ICY_WIND
	dbw 24, AURORA_BEAM
	dbw 28, WATER_PULSE
	dbw 32, MUD_SHOT
	dbw 36, ICE_BEAM
	dbw 40, MIRROR_COAT
	dbw 42, CALM_MIND
	dbw 45, RECOVER
	dbw 50, BLIZZARD
	dbw 55, ICICLE_CRASH
	dbw 60, AURA_SPHERE
	db 0 ; no more level-up moves

GliscorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 6, SAND_ATTACK
	dbw 13, HARDEN
	dbw 16, MUD_SLAP
	dbw 20, WING_ATTACK
	dbw 24, MAGNITUDE
	dbw 28, FAINT_ATTACK
	dbw 32, RAZOR_WIND
	dbw 36, SLASH
	dbw 40, EARTHQUAKE
	dbw 42, SKY_ATTACK
	dbw 45, FISSURE
	dbw 50, GUILLOTINE
	db 0 ; no more level-up moves

GalladeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 6, CONFUSION
	dbw 11, CHARM
	dbw 16, TELEPORT
	dbw 20, DRAININGKISS
	dbw 24, PSYCHO_CUT
	dbw 28, MACH_PUNCH
	dbw 32, SWORDS_DANCE
	dbw 36, SLASH
	dbw 40, CROSS_CHOP
	dbw 42, RECOVER
	dbw 45, LEAF_BLADE
	dbw 50, SUBSTITUTE
	dbw 55, SUBMISSION
	dbw 60, DRAGON_DANCE
	db 0 ; no more level-up moves

FroslassEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, POWDER_SNOW
	dbw 7, LEER
	dbw 12, ICY_WIND
	dbw 16, BITE
	dbw 20, ICE_FANG
	dbw 24, DRAININGKISS
	dbw 28, SHADOW_CLAW
	dbw 32, CALM_MIND
	dbw 34, COSMIC_POWER
	dbw 36, ICE_BEAM
	dbw 40, SHADOW_BALL
	dbw 42, BULK_UP
	dbw 45, PERISH_SONG
	dbw 50, BLIZZARD	
	dbw 55, PROTECT
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 6, BITE
	dbw 12, HAZE
	dbw 16, NIGHT_SHADE
	dbw 20, WING_ATTACK
	dbw 24, FAINT_ATTACK	
	dbw 28, GLARE
	dbw 32, PURSUIT
	dbw 36, RAZOR_WIND
	dbw 40, MEAN_LOOK
	dbw 42, DRILL_PECK
	dbw 45, SLASH
	dbw 50, SHADOW_CLAW
	dbw 55, SKY_ATTACK
	dbw 60, BULK_UP
	db 0 ; no more level-up moves

WeavileEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 9, QUICK_ATTACK
	dbw 16, ICE_PUNCH	
	dbw 20, FAINT_ATTACK
	dbw 24, MACH_PUNCH
	dbw 28, FURY_SWIPES
	dbw 36, ICICLE_CRASH
	dbw 40, PURSUIT
	dbw 42, SLASH
	dbw 45, BEAT_UP
	dbw 50, SWORDS_DANCE
	dbw 55, AGILITY
	dbw 60, PSYCHO_CUT
	db 0 ; no more level-up moves

MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, THUNDERSHOCK
	dbw 11, SUPERSONIC
	dbw 15, METAL_CLAW
	dbw 16, SONICBOOM
	dbw 21, THUNDER_WAVE
	dbw 26, SHOCK_WAVE
	dbw 27, LOCK_ON
	dbw 36, THUNDERBOLT
	dbw 40, FLASHCANNON
	dbw 42, CHARGE
	dbw 45, LIGHT_SCREEN
	dbw 50, REFLECT
	dbw 55, RECOVER
	dbw 60, ZAP_CANNON
	db 0 ; no more level-up moves

TangrowthEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 4, SLEEP_POWDER
	dbw 10, ABSORB
	dbw 13, POISONPOWDER
	dbw 18, VINE_WHIP
	dbw 25, SLAM
	dbw 31, GIGA_DRAIN
	dbw 34, STUN_SPORE
	dbw 36, GROWTH
	dbw 40, BODY_SLAM
	dbw 42, NATURE_POWER
	dbw 45, LEECH_SEED
	dbw 50, AMNESIA
	dbw 55, SOLARBEAM
	dbw 60, SPORE
	db 0 ; no more level-up moves

ElectivireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 12, QUICK_ATTACK	
	dbw 17, LIGHT_SCREEN
	dbw 20, MACH_PUNCH
	dbw 24, DIZZY_PUNCH	
	dbw 25, THUNDERPUNCH
	dbw 28, THUNDER_WAVE
	dbw 36, THUNDERBOLT
	dbw 40, BRICK_BREAK
	dbw 42, CHARGE
	dbw 45, CONFUSE_RAY
	dbw 50, SHOCKSLAM
	dbw 55, AGILITY
	dbw 60, THUNDER
	db 0 ; no more level-up moves

MagmortarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 13, TAIL_WHIP
	dbw 18, SMOG
	dbw 20, MACH_PUNCH
	dbw 24, SMOKESCREEN
	dbw 25, FIRE_PUNCH
	dbw 28, WILLOWISP
	dbw 30, SUNNY_DAY
	dbw 36, FLAMETHROWER
	dbw 40, CONFUSE_RAY
	dbw 45, SLUDGE_WAVE
	dbw 50, FIRE_BLAST
	dbw 55, BRICK_BREAK
	dbw 60, ERUPTION
	db 0 ; no more level-up moves

WyrdeerEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 8, SAND_ATTACK
	dbw 15, HYPNOSIS
	dbw 20, STOMP
	dbw 24, NIGHT_SHADE
	dbw 28, WILLOWISP
	dbw 32, CONFUSE_RAY
	dbw 36, PSYCHIC_M
	dbw 40, CALM_MIND
	dbw 36, TAKE_DOWN
	dbw 45, DREAM_EATER
	dbw 50, PURSUIT
	dbw 55, MEGAHORN
	dbw 60, EARTHQUAKE
	db 0 ; no more level-up moves

PorygonzEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONVERSION2
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 9, AGILITY
	dbw 16, RECOVER
	dbw 24, SHOCK_WAVE
	dbw 28, PSYBEAM	
	dbw 32, CHARGE	
	dbw 36, THUNDERBOLT
	dbw 40, TRI_ATTACK
	dbw 42, SUBSTITUTE
	dbw 45, THUNDER_WAVE
	dbw 50, HYPER_BEAM
	dbw 55, LOCK_ON
	dbw 60, ZAP_CANNON
	db 0 ; no more level-up moves

AnnihilapeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 1, LEER
	dbw 8, DOUBLE_KICK
	dbw 12, LOW_KICK
	dbw 16, MAGNITUDE
	dbw 20, FURY_SWIPES
	dbw 22, SHADOWSNEAK
	dbw 24, SHADOW_PUNCH
	dbw 28, MACH_PUNCH
	dbw 30, SEISMIC_TOSS
	dbw 32, BULK_UP
	dbw 36, CROSS_CHOP
	dbw 40, EARTHQUAKE
	dbw 45, ROCK_SLIDE
	dbw 50, SUPERPOWER
	dbw 55, SHADOW_FORCE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

KleavorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, STRING_SHOT
	dbw 6, FOCUS_ENERGY
	dbw 12, ROCK_THROW
	dbw 18, FALSE_SWIPE
	dbw 22, TWINEEDLE
	dbw 24, ROCK_TOMB
	dbw 32, ROCK_SLIDE
	dbw 36, RAZOR_WIND
	dbw 42, SWORDS_DANCE
	dbw 45, ROCK_SLIDE
	dbw 48, DOUBLE_TEAM
	dbw 52, LEAF_BLADE
	dbw 60, SHADOW_CLAW
	db 0 ; no more level-up moves

AraichuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, PSYWAVE
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 11, QUICK_ATTACK
	dbw 15, DOUBLE_TEAM
	dbw 20, SLAM
	dbw 26, SHOCK_WAVE
	dbw 31, EXTRASENSORY
	dbw 36, THUNDERBOLT
	dbw 40, PSYCHIC_M
	dbw 42, MEDITATE
	dbw 45, THUNDER
	dbw 50, LIGHT_SCREEN
	dbw 55, GROWTH
	dbw 60, VOLT_TACKLE
	db 0 ; no more level-up moves

AmarowakEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, ASTONISH
	dbw 5, TAIL_WHIP
	dbw 12, SAND_ATTACK
	dbw 16, BONE_CLUB
	dbw 20, HEADBUTT
	dbw 22, NIGHT_SHADE
	dbw 25, FIRE_FANG
	dbw 28, BONEMERANG	
	dbw 32, SHADOW_CLAW
	dbw 36, FLAME_WHEEL
	dbw 40, SHADOW_BALL
	dbw 42, SWORDS_DANCE
	dbw 45, ERUPTION
	dbw 50, CONFUSE_RAY
	dbw 55, GLARE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

AgrimerEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, AMUK
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 1, HARDEN
	dbw 7, BITE
	dbw 12, STUN_SPORE
	dbw 16, CURSE
	dbw 20, POISON_FANG
	dbw 22, SHADOWSNEAK
	dbw 24, FAINT_ATTACK
	dbw 28, MAGNITUDE	
	dbw 30, RECOVER
	dbw 32, COSMIC_POWER
	dbw 36, SLUDGE_BOMB
	dbw 40, PURSUIT
	dbw 42, REST
	dbw 45, EARTHQUAKE
	dbw 50, SUBSTITUTE
	dbw 55, CRUSH_CLAW
	dbw 60, BULK_UP
	db 0 ; no more level-up moves

AmukEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 1, HARDEN
	dbw 7, BITE
	dbw 12, STUN_SPORE
	dbw 16, CURSE
	dbw 20, POISON_FANG
	dbw 22, SHADOWSNEAK
	dbw 24, FAINT_ATTACK
	dbw 28, MAGNITUDE	
	dbw 30, RECOVER
	dbw 32, COSMIC_POWER
	dbw 36, SLUDGE_BOMB
	dbw 40, PURSUIT
	dbw 42, REST
	dbw 45, EARTHQUAKE
	dbw 50, SUBSTITUTE
	dbw 55, CRUSH_CLAW
	dbw 60, BULK_UP
	db 0 ; no more level-up moves

AsandshrewEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ASANDSLASH
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 1, DEFENSE_CURL
	dbw 8, POWDER_SNOW
	dbw 12, POISON_STING
	dbw 16, RAPID_SPIN
	dbw 20, ICE_BALL
	dbw 24, ROCK_TOMB
	dbw 28, ICE_FANG	
	dbw 32, HAIL
	dbw 36, VICEGRIP
	dbw 40, ICICLE_CRASH
	dbw 42, BULK_UP
	dbw 45, EARTHQUAKE
	dbw 48, CRUSH_CLAW
	dbw 50, ICY_WIND
	dbw 55, GUILLOTINE
	dbw 60, SKULL_BASH
	db 0 ; no more level-up moves

AsandslashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 1, DEFENSE_CURL
	dbw 8, POWDER_SNOW
	dbw 12, POISON_STING
	dbw 16, RAPID_SPIN
	dbw 20, ICE_BALL
	dbw 24, ROCK_TOMB
	dbw 28, ICE_FANG	
	dbw 32, HAIL
	dbw 36, VICEGRIP
	dbw 40, ICICLE_CRASH
	dbw 42, BULK_UP
	dbw 45, EARTHQUAKE
	dbw 48, CRUSH_CLAW
	dbw 50, ICY_WIND
	dbw 55, GUILLOTINE
	dbw 60, SKULL_BASH
	db 0 ; no more level-up moves

AvulpixEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, ANINETALES
	dbww EVOLVE_ITEM, ICE_STONE, ANINETALES
	dbww EVOLVE_ITEM, FIRE_STONE, VULPIX
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, PIXIE_DUST
	dbw 7, QUICK_ATTACK
	dbw 12, ROAR
	dbw 16, NIGHT_SHADE
	dbw 20, ICY_WIND
	dbw 24, DRAININGKISS
	dbw 28, AURORA_BEAM
	dbw 32, RECOVER
	dbw 36, ICE_BEAM
	dbw 40, FAERIEGLEAM
	dbw 42, CALM_MIND
	dbw 45, EXTRASENSORY
	dbw 50, BLIZZARD
	dbw 55, FLAMETHROWER
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

AninetalesEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, NINETALES
	dbww EVOLVE_ITEM, KANTOITE_X, NINETALES2
	db 0 ; no more evolutions	
	dbw 1, POWDER_SNOW
	dbw 1, PIXIE_DUST
	dbw 7, QUICK_ATTACK
	dbw 12, ROAR
	dbw 16, NIGHT_SHADE
	dbw 20, ICY_WIND
	dbw 24, DRAININGKISS
	dbw 28, AURORA_BEAM
	dbw 32, RECOVER
	dbw 36, ICE_BEAM
	dbw 40, FAERIEGLEAM
	dbw 42, CALM_MIND
	dbw 45, EXTRASENSORY
	dbw 50, BLIZZARD
	dbw 55, FLAMETHROWER
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

AgeodudeEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, AGRAVELER
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, ROLLOUT
	dbw 21, SELFDESTRUCT
	dbw 24, THUNDERPUNCH
	dbw 28, ROCK_TOMB	
	dbw 32, ROCK_SLIDE
	dbw 36, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 42, CURSE
	dbw 45, AMNESIA
	dbw 50, EXPLOSION
	dbw 55, STONE_EDGE
	dbw 60, SHOCKSLAM
	db 0 ; no more level-up moves

AgravelerEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, AGOLEM
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, ROLLOUT
	dbw 21, SELFDESTRUCT
	dbw 24, THUNDERPUNCH
	dbw 28, ROCK_TOMB	
	dbw 32, ROCK_SLIDE
	dbw 36, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 42, CURSE
	dbw 45, AMNESIA
	dbw 50, EXPLOSION
	dbw 55, STONE_EDGE
	dbw 60, SHOCKSLAM
	db 0 ; no more level-up moves

AgolemEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, ROLLOUT
	dbw 21, SELFDESTRUCT
	dbw 24, THUNDERPUNCH
	dbw 28, ROCK_TOMB	
	dbw 32, ROCK_SLIDE
	dbw 36, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 42, CURSE
	dbw 45, AMNESIA
	dbw 50, EXPLOSION
	dbw 55, STONE_EDGE
	dbw 60, SHOCKSLAM
	db 0 ; no more level-up moves

HvoltorbEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, HELECTRODE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 12, SONICBOOM
	dbw 16, SPARK
	dbw 20, RAZOR_LEAF
	dbw 23, SELFDESTRUCT
	dbw 27, ROLLOUT
	dbw 30, LIGHT_SCREEN
	dbw 32, THUNDERBOLT
	dbw 36, GIGA_DRAIN
	dbw 39, EXPLOSION
	dbw 41, CHARGE
	dbw 45, EXTREMESPEED
	dbw 50, THUNDER
	dbw 55, POWER_GEM
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

HelectrodeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 12, SONICBOOM
	dbw 16, SPARK
	dbw 20, RAZOR_LEAF
	dbw 23, SELFDESTRUCT
	dbw 27, ROLLOUT
	dbw 30, LIGHT_SCREEN
	dbw 32, THUNDERBOLT
	dbw 36, GIGA_DRAIN
	dbw 39, EXPLOSION
	dbw 41, CHARGE
	dbw 45, EXTREMESPEED
	dbw 50, THUNDER
	dbw 55, POWER_GEM
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

IronbundleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PRESENT
	dbw 1, POWDER_SNOW
	dbw 7, GUST
	dbw 11, SPIKES
	dbw 16, AURORA_BEAM
	dbw 20, BUBBLEBEAM
	dbw 24, ICY_WIND
	dbw 28, RAZOR_WIND
	dbw 32, ICE_BEAM
	dbw 36, SURF
	dbw 40, BLIZZARD
	dbw 42, REFLECT
	dbw 45, LIGHT_SCREEN
	dbw 48, CALM_MIND
	dbw 50, BATON_PASS
	dbw 55, HYDRO_PUMP
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

Voltorb2EvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTRODE2
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 1, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 12, SONICBOOM
	dbw 16, SPARK
	dbw 20, SLAM
	dbw 23, SELFDESTRUCT
	dbw 27, ROLLOUT
	dbw 30, LIGHT_SCREEN
	dbw 32, THUNDERBOLT
	dbw 36, FLASHCANNON
	dbw 39, EXPLOSION
	dbw 41, CHARGE
	dbw 45, EXTREMESPEED
	dbw 50, THUNDER
	dbw 55, POWER_GEM
	dbw 60, FAERIEGLEAM
	db 0 ; no more level-up moves

Electrode2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 1, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 12, SONICBOOM
	dbw 16, SPARK
	dbw 20, SLAM
	dbw 23, SELFDESTRUCT
	dbw 27, ROLLOUT
	dbw 30, LIGHT_SCREEN
	dbw 32, THUNDERBOLT
	dbw 36, FLASHCANNON
	dbw 39, EXPLOSION
	dbw 41, CHARGE
	dbw 45, EXTREMESPEED
	dbw 50, THUNDER
	dbw 55, POWER_GEM
	dbw 60, FAERIEGLEAM
	db 0 ; no more level-up moves

Exeggcute2EvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR2
	dbbw EVOLVE_LEVEL, 36, EXEGGUTOR2
	db 0 ; no more evolutions
	dbw 1, BULLET_SEED
	dbw 1, HYPNOSIS
	dbw 7, REFLECT
	dbw 10, LEECH_SEED
	dbw 13, TWISTER
	dbw 18, BARRAGE
	dbw 20, STUN_SPORE
	dbw 24, MEGA_DRAIN	
	dbw 30, PSYBEAM
	dbw 31, POISONPOWDER
	dbw 37, SLEEP_POWDER
	dbw 40, DRAGONBREATH
	dbw 42, EGG_BOMB
	dbw 45, CALM_MIND
	dbw 50, EXPLOSION
	dbw 55, DRAGON_DANCE
	dbw 60, DRAGON_CLAW
	db 0 ; no more level-up moves

Exeggutor2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BULLET_SEED
	dbw 1, HYPNOSIS
	dbw 7, REFLECT
	dbw 10, LEECH_SEED
	dbw 13, TWISTER
	dbw 18, BARRAGE
	dbw 20, STUN_SPORE
	dbw 24, MEGA_DRAIN	
	dbw 30, PSYBEAM
	dbw 31, POISONPOWDER
	dbw 37, SLEEP_POWDER
	dbw 40, DRAGONBREATH
	dbw 42, EGG_BOMB
	dbw 45, CALM_MIND
	dbw 50, EXPLOSION
	dbw 55, DRAGON_DANCE
	dbw 60, DRAGON_CLAW
	db 0 ; no more level-up moves

Furret2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, FOCUS_ENERGY
	dbw 18, SHARPEN	
	dbw 20, HYPER_FANG
	dbw 24, SCARY_FACE
	dbw 28, DIG
	dbw 32, BULK_UP
	dbw 36, DRAGON_CLAW
	dbw 40, DRAGON_DANCE
	dbw 42, REST
	dbw 45, EXTREMESPEED
	dbw 50, IRON_TAIL
	dbw 55, OUTRAGE
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

Noctowl2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 5, PECK
	dbw 10, NIGHT_SHADE
	dbw 12, CONFUSION
	dbw 15, FORESIGHT	
	dbw 18, HYPNOSIS
	dbw 22, WING_ATTACK
	dbw 26, PSYBEAM
	dbw 30, DREAM_EATER
	dbw 32, DRILL_PECK
	dbw 36, PSYCHIC_M
	dbw 40, WILLOWISP
	dbw 42, MOONBLAST
	dbw 45, ICY_WIND
	dbw 50, CALM_MIND
	dbw 55, HURRICANE
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

Octillery2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 11, LOCK_ON
	dbw 16, BUBBLEBEAM
	dbw 20, PSYBEAM
	dbw 24, AURORA_BEAM
	dbw 22, BUBBLEBEAM
	dbw 28, OCTAZOOKA
	dbw 32, ICE_BEAM
	dbw 36, MEDITATE
	dbw 40, HYPER_BEAM
	dbw 42, SUNNY_DAY
	dbw 45, SOLARBEAM
	dbw 50, RECOVER
	dbw 55, FLAMETHROWER
	dbw 60, ERUPTION
	db 0 ; no more level-up moves

Yanma2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TWISTER
	dbw 1, STRING_SHOT
	dbw 7, QUICK_ATTACK
	dbw 13, DOUBLE_TEAM
	dbw 15, SAND_ATTACK
	dbw 18, MUD_SHOT
	dbw 22, DETECT
	dbw 25, DRAGON_RAGE
	dbw 28, SUPERSONIC
	dbw 31, DRAGON_CLAW
	dbw 34, PIN_MISSILE
	dbw 37, EARTHQUAKE
	dbw 40, DRAGON_DANCE
	dbw 45, MEGAHORN
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

Scyther2EvosAttacks:
	dbww EVOLVE_ITEM, METAL_COAT, SCIZOR2
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, STRING_SHOT
	dbw 6, FOCUS_ENERGY
	dbw 12, BITE
	dbw 18, FALSE_SWIPE
	dbw 22, TWINEEDLE
	dbw 24, AGILITY
	dbw 32, SLASH
	dbw 36, RAZOR_WIND
	dbw 42, SWORDS_DANCE
	dbw 48, DOUBLE_TEAM
	dbw 52, LEAF_BLADE
	dbw 60, SHADOW_CLAW
	db 0 ; no more level-up moves

Tentacool2EvosAttacks:
	dbbw EVOLVE_LEVEL, 30, TENTACRUEL2
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, ROCK_THROW
	dbw 6, SUPERSONIC
	dbw 12, WRAP
	dbw 16, ROCK_TOMB
	dbw 20, TWINEEDLE
	dbw 24, SANDSTORM
	dbw 28, SILVER_WIND
	dbw 32, COSMIC_POWER
	dbw 36, POWER_GEM
	dbw 40, GIGA_DRAIN
	dbw 42, SIGNAL_BEAM
	dbw 45, EARTHQUAKE 
	dbw 50, REST
	dbw 55, OUTRAGE
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

Tentacruel2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, ROCK_THROW
	dbw 6, SUPERSONIC
	dbw 12, WRAP
	dbw 16, ROCK_TOMB
	dbw 20, TWINEEDLE
	dbw 24, SANDSTORM
	dbw 28, SILVER_WIND
	dbw 32, COSMIC_POWER
	dbw 36, POWER_GEM
	dbw 40, GIGA_DRAIN
	dbw 42, SIGNAL_BEAM
	dbw 45, EARTHQUAKE 
	dbw 50, REST
	dbw 55, OUTRAGE
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

Rapidash2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 8, TAIL_WHIP
	dbw 10, EMBER
	dbw 15, DOUBLE_KICK
	dbw 20, STOMP
	dbw 24, FIRE_FANG
	dbw 26, ICE_FANG
	dbw 32, THUNDER_FANG
	dbw 36, ICICLE_CRASH
	dbw 40, FLAME_WHEEL
	dbw 42, BULK_UP
	dbw 45, MEGAHORN
	dbw 50, SACRED_FIRE
	dbw 55, WILLOWISP
	dbw 60, BLIZZARD
	db 0 ; no more level-up moves

Ninetales2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, LICK
	dbw 7, QUICK_ATTACK
	dbw 12, ROAR
	dbw 16, NIGHT_SHADE
	dbw 20, WILLOWISP
	dbw 24, FAE_VOICE
	dbw 28, COSMIC_POWER
	dbw 32, RECOVER
	dbw 36, MOONBLAST
	dbw 40, SHADOW_BALL
	dbw 42, CALM_MIND
	dbw 45, FLAMETHROWER
	dbw 50, PLAY_ROUGH
	dbw 55, SOLARBEAM
	dbw 60, LUSTER_PURGE
	db 0 ; no more level-up moves

Tauros2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 5, DOUBLE_KICK
	dbw 13, RAGE	
	dbw 19, SCARY_FACE
	dbw 24, HORN_ATTACK
	dbw 28, MAGNITUDE
	dbw 32, BRICK_BREAK
	dbw 36, EARTHQUAKE
	dbw 40, BULK_UP
	dbw 42, OUTRAGE
	dbw 45, EARTHQUAKE
	dbw 50, DOUBLE_EDGE
	dbw 55, SUBMISSION
	dbw 60, FISSURE
	db 0 ; no more level-up moves

HanamoleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, TAIL_WHIP
	dbw 12, TWISTER	
	dbw 16, COTTON_SPORE
	dbw 20, LEECH_SEED
	dbw 24, STUN_SPORE
	dbw 28, MAGICAL_LEAF
	dbw 32, CHARM
	dbw 36, DRAGONBREATH
	dbw 40, GIGA_DRAIN
	dbw 42, SUNNY_DAY
	dbw 45, SOLARBEAM
	dbw 50, SYNTHESIS
	dbw 55, HEAL_BELL
	dbw 60, CALM_MIND
	db 0 ; no more level-up moves

HonobeaEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, BORUBEA
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, METAL_CLAW
	dbw 14, SMOKESCREEN
	dbw 18, RAGE
	dbw 20, FIRE_FANG
	dbw 24, SCARY_FACE
	dbw 30, AIR_CUTTER
	dbw 36, FLAME_WHEEL	
	dbw 40, DRAGON_CLAW
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, SACRED_FIRE
	db 0 ; no more level-up moves

BorubeaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, DYNABEA
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, METAL_CLAW
	dbw 14, SMOKESCREEN
	dbw 18, RAGE
	dbw 20, FIRE_FANG
	dbw 24, SCARY_FACE
	dbw 30, AIR_CUTTER
	dbw 36, FLAME_WHEEL	
	dbw 40, DRAGON_CLAW
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, SACRED_FIRE
	db 0 ; no more level-up moves

DynabeaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, METAL_CLAW
	dbw 14, SMOKESCREEN
	dbw 18, RAGE
	dbw 20, FIRE_FANG
	dbw 24, SCARY_FACE
	dbw 30, AIR_CUTTER
	dbw 36, FLAME_WHEEL	
	dbw 40, DRAGON_CLAW
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, SACRED_FIRE
	db 0 ; no more level-up moves

KurusuEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, AKUA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, TAIL_WHIP
	dbw 7, GROWL
	dbw 10, WATER_GUN
	dbw 14, BITE
	dbw 18, AGILITY
	dbw 22, BUBBLEBEAM
	dbw 26, AURORA_BEAM
	dbw 32, TAKE_DOWN
	dbw 36, MIST_BALL
	dbw 40, ICE_BEAM
	dbw 42, MIRROR_COAT
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, BLIZZARD
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

AkuaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, AKUERIA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, TAIL_WHIP
	dbw 7, GROWL
	dbw 10, WATER_GUN
	dbw 14, BITE
	dbw 18, AGILITY
	dbw 22, BUBBLEBEAM
	dbw 26, AURORA_BEAM
	dbw 32, TAKE_DOWN
	dbw 36, MIST_BALL
	dbw 40, ICE_BEAM
	dbw 42, MIRROR_COAT
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, BLIZZARD
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

AkueriaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, TAIL_WHIP
	dbw 7, GROWL
	dbw 10, WATER_GUN
	dbw 14, BITE
	dbw 18, AGILITY
	dbw 22, BUBBLEBEAM
	dbw 26, AURORA_BEAM
	dbw 32, TAKE_DOWN
	dbw 36, MIST_BALL
	dbw 40, ICE_BEAM
	dbw 42, MIRROR_COAT
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, BLIZZARD
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

HaneeiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 4, BUBBLE
	dbw 8, WATER_GUN
	dbw 12, CURSE	
	dbw 16, NIGHT_SHADE
	dbw 20, BUBBLEBEAM
	dbw 24, AURORA_BEAM
	dbw 28, CONFUSE_RAY
	dbw 32, HYPNOSIS
	dbw 36, MIST_BALL
	dbw 40, SHADOW_BALL
	dbw 42, DREAM_EATER
	dbw 45, DESTINY_BOND
	dbw 50, LIGHT_SCREEN
	dbw 55, COSMIC_POWER
	dbw 60, BATON_PASS
	db 0 ; no more level-up moves

TsubomittEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 6, GROWTH
	dbw 11, WRAP
	dbw 15, SLEEP_POWDER
	dbw 17, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 23, RAZOR_LEAF
	dbw 28, SWEET_SCENT
	dbw 32, BULK_UP
	dbw 36, LEAF_BLADE
	dbw 40, PLAY_ROUGH
	dbw 42, LEECH_SEED
	dbw 45, BODY_SLAM
	dbw 50, DRAGON_CLAW
	dbw 55, SOLARBEAM
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

KotoraEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, RAITORA
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 11, QUICK_ATTACK
	dbw 15, DOUBLE_TEAM
	dbw 20, SLAM
	dbw 26, THUNDER_FANG
	dbw 31, CRUSH_CLAW
	dbw 36, CRUNCH
	dbw 40, PLAY_ROUGH
	dbw 42, DRAGON_DANCE
	dbw 45, SHADOW_CLAW
	dbw 50, ICE_FANG
	dbw 55, FIRE_FANG
	dbw 60, VOLT_TACKLE
	db 0 ; no more level-up moves

RaitoraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 11, QUICK_ATTACK
	dbw 15, DOUBLE_TEAM
	dbw 20, SLAM
	dbw 26, THUNDER_FANG
	dbw 31, CRUSH_CLAW
	dbw 36, CRUNCH
	dbw 40, PLAY_ROUGH
	dbw 42, DRAGON_DANCE
	dbw 45, SHADOW_CLAW
	dbw 50, ICE_FANG
	dbw 55, FIRE_FANG
	dbw 60, VOLT_TACKLE
	db 0 ; no more level-up moves

AshibombEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 5, EMBER
	dbw 10, GROWL
	dbw 16, WILLOWISP	
	dbw 20, AGILITY
	dbw 24, FIRE_SPIN
	dbw 28, BUBBLEBEAM	
	dbw 32, TAKE_DOWN
	dbw 36, FLAMETHROWER
	dbw 40, SCALD
	dbw 42, AMNESIA
	dbw 45, WILLOWISP
	dbw 48, HYDRO_PUMP
	dbw 50, FIRE_BLAST
	dbw 55, MIRROR_COAT
	dbw 60, WATER_SPOUT
	db 0 ; no more level-up moves

SunbouEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, IKARI
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 5, BITE
	dbw 10, GROWL
	dbw 16, AQUA_JET	
	dbw 20, AGILITY
	dbw 24, FIRE_FANG
	dbw 28, ICE_FANG	
	dbw 32, RAZORSHELL
	dbw 36, VICEGRIP
	dbw 40, THUNDER_FANG
	dbw 42, DRAGON_DANCE
	dbw 45, CRUNCH
	dbw 48, HYDRO_PUMP
	dbw 50, IRON_TAIL
	dbw 55, MIRROR_COAT
	dbw 60, RECOVER
	db 0 ; no more level-up moves

IkariEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 5, BITE
	dbw 10, GROWL
	dbw 16, AQUA_JET	
	dbw 20, AGILITY
	dbw 24, FIRE_FANG
	dbw 28, ICE_FANG	
	dbw 32, RAZORSHELL
	dbw 36, VICEGRIP
	dbw 40, THUNDER_FANG
	dbw 42, DRAGON_DANCE
	dbw 45, CRUNCH
	dbw 48, HYDRO_PUMP
	dbw 50, IRON_TAIL
	dbw 55, MIRROR_COAT
	dbw 60, RECOVER
	db 0 ; no more level-up moves

RoseradeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 5, GROWTH
	dbw 9, POISON_STING
	dbw 12, STUN_SPORE
	dbw 16, LEECH_SEED
	dbw 20, MAGICAL_LEAF
	dbw 24, SWEET_SCENT
	dbw 28, SLUDGE
	dbw 32, TOXIC
	dbw 36, GIGA_DRAIN	
	dbw 40, GROWTH
	dbw 42, SYNTHESIS
	dbw 45, SLUDGE_WAVE
	dbw 50, AGILITY
	dbw 55, MOONBLAST
	dbw 60, PETAL_DANCE
	db 0 ; no more level-up moves

AmbipomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 6, SAND_ATTACK
	dbw 12, BATON_PASS
	dbw 19, FURY_SWIPES
	dbw 23, DIG
	dbw 27, SWIFT
	dbw 32, SLASH
	dbw 36, SCREECH
	dbw 40, BODY_SLAM
	dbw 45, AGILITY
	dbw 50, GLARE
	db 0 ; no more level-up moves

MismagiusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK	
	dbw 6, SPITE
	dbw 12, PSYWAVE
	dbw 15, POISON_GAS
	dbw 18, WILLOWISP
	dbw 20, SHADOWSNEAK
	dbw 22, CONFUSE_RAY
	dbw 25, MEAN_LOOK
	dbw 28, ICY_WIND
	dbw 30, PSYBEAM
	dbw 32, SHADOW_BALL
	dbw 36, PAIN_SPLIT
	dbw 40, GLARE
	dbw 42, PERISH_SONG
	dbw 45, PAIN_SPLIT
	dbw 50, DESTINY_BOND
	db 0 ; no more level-up moves

LickilickyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LICK
	dbw 7, SUPERSONIC
	dbw 13, DEFENSE_CURL
	dbw 15, POUND
	dbw 20, ROLLOUT
	dbw 24, STOMP	
	dbw 28, DISABLE
	dbw 30, SCREECH
	dbw 36, BODY_SLAM	
	dbw 40, CRUNCH
	dbw 42, THUNDER_FANG
	dbw 45, ICE_FANG
	dbw 48, FIRE_FANG
	dbw 50, BULK_UP

RhyperiorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TAIL_WHIP
	dbw 8, ROCK_THROW
	dbw 12, METAL_CLAW
	dbw 16, ROAR
	dbw 20, HORN_ATTACK
	dbw 20, ROCK_TOMB
	dbw 28, DRAGON_RAGE
	dbw 30, SCARY_FACE
	dbw 36, ROCK_SLIDE
	dbw 39, DRAGON_CLAW	
	dbw 41, TAKE_DOWN
	dbw 42, DRAGON_DANCE
	dbw 45, EARTHQUAKE
	dbw 50, STONE_EDGE
	dbw 55, SANDSTORM
	dbw 60, HORN_DRILL

YanmegaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TWISTER
	dbw 1, STRING_SHOT
	dbw 7, QUICK_ATTACK
	dbw 13, DOUBLE_TEAM
	dbw 15, SONICBOOM
	dbw 18, GUST
	dbw 22, DETECT
	dbw 25, ANCIENTPOWER
	dbw 28, SUPERSONIC
	dbw 31, DRAGONBREATH
	dbw 34, SIGNAL_BEAM
	dbw 37, RAZOR_WIND
	dbw 40, DRAGON_DANCE
	dbw 45, MEGAHORN
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

ProbopassEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ROCK_THROW
	dbw 7, THUNDERSHOCK
	dbw 10, THUNDER_WAVE
	dbw 12, SAND_ATTACK
	dbw 15, DEFENSE_CURL
	dbw 20, ROLLOUT
	dbw 24, SHOCK_WAVE
	dbw 28, ROCK_TOMB
	dbw 32, CHARGE
	dbw 36, THUNDERBOLT
	dbw 40, POWER_GEM	
	dbw 42, COSMIC_POWER
	dbw 45, AURA_SPHERE	
	dbw 50, REST
	dbw 52, STONE_EDGE
	dbw 55, LOCK_ON
	dbw 60, ZAP_CANNON
	db 0 ; no more level-up moves

DusknoirEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 5, DISABLE
	dbw 8, ASTONISH
	dbw 12, WILLOWISP
	dbw 16, CURSE
	dbw 20, CONFUSE_RAY
	dbw 22, SHADOWSNEAK
	dbw 24, FAINT_ATTACK
	dbw 28, SHADOW_CLAW
	dbw 32, COSMIC_POWER
	dbw 36, PURSUIT
	dbw 40, PSYCHO_CUT
	dbw 42, DRAGON_DANCE
	dbw 45, MEAN_LOOK
	dbw 50, RECOVER
	dbw 55, SHADOW_FORCE
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

TotartleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, BUBBLE
	dbw 10, WITHDRAW
	dbw 14, WATER_GUN
	dbw 18, BITE
	dbw 20, BUBBLEBEAM
	dbw 24, RAPID_SPIN
	dbw 28, PROTECT
	dbw 31, RAIN_DANCE
	dbw 36, MIST_BALL
	dbw 40, FLASHCANNON
	dbw 44, SKULL_BASH
	dbw 50, HYDRO_PUMP
	dbw 55, BODY_SLAM
	dbw 60, HYDRO_CANNON
	dbw 70, SCALD
	dbw 70, THUNDER
	dbw 70, CRUNCH
	db 0 ; no more level-up moves

GorochuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, OUTRAGE
	dbw 1, VOLT_TACKLE
	dbw 1, SHOCKSLAM
	dbw 1, BEAT_UP
	db 0 ; no more level-up moves

Totodile2EvosAttacks:
	dbbw EVOLVE_LEVEL, 18, CROCONAW2
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 7, RAGE
	dbw 10, WATER_GUN
	dbw 14, BITE
	dbw 18, SCARY_FACE
	dbw 22, BUBBLEBEAM
	dbw 26, ICE_FANG
	dbw 32, CRUNCH
	dbw 36, SLASH
	dbw 40, SCREECH
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, ICICLE_CRASH
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

Croconaw2EvosAttacks:
	dbbw EVOLVE_LEVEL, 30, FERALIGATR2
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 7, RAGE
	dbw 10, WATER_GUN
	dbw 14, BITE
	dbw 18, SCARY_FACE
	dbw 22, BUBBLEBEAM
	dbw 26, ICE_FANG
	dbw 32, CRUNCH
	dbw 36, SLASH
	dbw 40, SCREECH
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, ICICLE_CRASH
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

Feraligatr2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 7, RAGE
	dbw 10, WATER_GUN
	dbw 14, BITE
	dbw 18, SCARY_FACE
	dbw 22, BUBBLEBEAM
	dbw 26, ICE_FANG
	dbw 32, CRUNCH
	dbw 36, SLASH
	dbw 40, SCREECH
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, ICICLE_CRASH
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

Cyndaquil2EvosAttacks:
	dbbw EVOLVE_LEVEL, 14, QUILAVA2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 14, QUICK_ATTACK
	dbw 20, FIRE_FANG
	dbw 24, FAINT_ATTACK
	dbw 28, SLAM
	dbw 32, FLAME_WHEEL
	dbw 36, PURSUIT
	dbw 40, FLAMETHROWER
	dbw 45, OUTRAGE
	dbw 50, FIRE_BLAST
	dbw 55, DRAGON_DANCE
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

Quilava2EvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TYPHLOSION2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 14, QUICK_ATTACK
	dbw 20, FIRE_FANG
	dbw 24, FAINT_ATTACK
	dbw 28, SLAM
	dbw 32, FLAME_WHEEL
	dbw 36, PURSUIT
	dbw 40, FLAMETHROWER
	dbw 45, OUTRAGE
	dbw 50, FIRE_BLAST
	dbw 55, DRAGON_DANCE
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

Typhlosion2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 14, QUICK_ATTACK
	dbw 20, FIRE_FANG
	dbw 24, FAINT_ATTACK
	dbw 28, SLAM
	dbw 32, FLAME_WHEEL
	dbw 36, PURSUIT
	dbw 40, FLAMETHROWER
	dbw 45, OUTRAGE
	dbw 50, FIRE_BLAST
	dbw 55, DRAGON_DANCE
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

Swinub2EvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PILOSWINE2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 10, ENDURE
	dbw 15, CURSE
	dbw 20, ANCIENTPOWER	
	dbw 24, ICICLE_SPEAR
	dbw 28, MAGNITUDE
	dbw 32, BULK_UP
	dbw 36, ICICLE_CRASH
	dbw 40, EARTHQUAKE
	dbw 42, MIST
	dbw 45, BLIZZARD
	dbw 50, AMNESIA
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

Piloswine2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 10, ENDURE
	dbw 15, CURSE
	dbw 20, ANCIENTPOWER	
	dbw 24, ICICLE_SPEAR
	dbw 28, MAGNITUDE
	dbw 32, BULK_UP
	dbw 36, ICICLE_CRASH
	dbw 40, EARTHQUAKE
	dbw 42, MIST
	dbw 45, BLIZZARD
	dbw 50, AMNESIA
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

Skarmory2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 8, SAND_ATTACK
	dbw 12, METAL_CLAW
	dbw 16, AGILITY
	dbw 20, SPIKES
	dbw 24, WING_ATTACK	
	dbw 28, STEEL_WING
	dbw 32, RECOVER
	dbw 36, DRILL_PECK
	dbw 40, VICEGRIP
	dbw 42, SAFEGUARD
	dbw 45, SLASH
	dbw 50, SWORDS_DANCE
	db 0 ; no more level-up moves

ENDSECTION