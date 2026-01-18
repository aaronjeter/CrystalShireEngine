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
	dw Scizor2EvosAttacks
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
	dbw 40, MOONBLAST
	dbw 45, RAZOR_WIND
	dbw 50, CALM_MIND
	dbw 55, PLAY_ROUGH
	dbw 60, MIST_BALL
	dbw 65, OUTRAGE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

MamoswineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 10, ENDURE
	dbw 15, CURSE
	dbw 20, HAIL
	dbw 24, ANCIENTPOWER	
	dbw 28, ICICLE_SPEAR
	dbw 32, MAGNITUDE
	dbw 36, BULK_UP
	dbw 40, ICICLE_CRASH
	dbw 45, EARTHQUAKE
	dbw 50, MIST
	dbw 55, AMNESIA
	dbw 60, BLIZZARD
	dbw 65, OUTRAGE
	dbw 70, FISSURE
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
	dbw 36, CALM_MIND
	dbw 40, FAERIEGLEAM
	dbw 45, SHADOW_BALL	
	dbw 50, RECOVER
	dbw 55, MIST_BALL
	dbw 60, LUSTER_PURGE
	dbw 65, MIST
	dbw 60, PLAY_ROUGH
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
	dbw 36, BULK_UP
	dbw 40, LEAF_BLADE
	dbw 45, BODY_SLAM	
	dbw 50, RECOVER
	dbw 55, PSYCHO_CUT	
	dbw 60, PETAL_DANCE
	dbw 65, SUBMISSION
	dbw 70, STUN_SPORE
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
	dbw 36, CALM_MIND
	dbw 40, ICE_BEAM
	dbw 45, MIRROR_COAT	
	dbw 50, RECOVER	
	dbw 55, ICICLE_CRASH
	dbw 60, BLIZZARD
	dbw 65, AURA_SPHERE
	dbw 70, HAIL
	db 0 ; no more level-up moves

GliscorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 6, SAND_ATTACK
	dbw 13, HARDEN
	dbw 20, MUD_SLAP
	dbw 24, WING_ATTACK
	dbw 28, MAGNITUDE
	dbw 32, FAINT_ATTACK
	dbw 36, RAZOR_WIND
	dbw 40, SLASH
	dbw 45, EARTHQUAKE
	dbw 50, SKY_ATTACK
	dbw 55, LEAF_BLADE
	dbw 60, FISSURE
	dbw 65, TOXIC
	dbw 70, GUILLOTINE
	db 0 ; no more level-up moves

GalladeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 6, CONFUSION
	dbw 12, CHARM
	dbw 16, TELEPORT
	dbw 20, CONFUSE_RAY
	dbw 24, DRAININGKISS	
	dbw 28, MACH_PUNCH
	dbw 32, PSYCHO_CUT
	dbw 36, SWORDS_DANCE
	dbw 40, SLASH
	dbw 45, CROSS_CHOP
	dbw 50, RECOVER
	dbw 55, LEAF_BLADE
	dbw 60, SUBSTITUTE
	dbw 65, SUBMISSION
	dbw 70, DRAGON_DANCE
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
	dbw 28, HAIL
	dbw 32, SHADOW_CLAW
	dbw 36, CALM_MIND
	dbw 40, ICE_BEAM
	dbw 45, SHADOW_BALL
	dbw 50, DESTINY_BOND
	dbw 55, PROTECT
	dbw 60, BLIZZARD	
	dbw 65, MIST
	dbw 70, PERISH_SONG
	db 0 ; no more level-up moves

HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 6, BITE
	dbw 12, HAZE
	dbw 16, NIGHT_SHADE
	dbw 20, MEAN_LOOK
	dbw 24, WING_ATTACK
	dbw 28, FAINT_ATTACK	
	dbw 32, GLARE
	dbw 36, RAZOR_WIND
	dbw 40, PURSUIT	
	dbw 45, DRILL_PECK
	dbw 50, SLASH
	dbw 55, SHADOW_CLAW
	dbw 60, SKY_ATTACK
	dbw 65, BULK_UP
	dbw 70, BEAT_UP
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
	dbw 32, PSYCHO_CUT
	dbw 36, SWORDS_DANCE
	dbw 40, ICICLE_CRASH
	dbw 45, PURSUIT
	dbw 50, SLASH
	dbw 55, ICICLE_SPEAR
	dbw 60, BEAT_UP
	dbw 65, AGILITY
	dbw 70, SCREECH	
	db 0 ; no more level-up moves

MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, THUNDERSHOCK
	dbw 12, SUPERSONIC
	dbw 16, METAL_CLAW
	dbw 20, SONICBOOM
	dbw 24, THUNDER_WAVE
	dbw 28, SHOCK_WAVE
	dbw 32, LOCK_ON
	dbw 36, CHARGE
	dbw 40, THUNDERBOLT
	dbw 45, FLASHCANNON	
	dbw 50, LIGHT_SCREEN
	dbw 55, REFLECT
	dbw 60, ZAP_CANNON
	dbw 65, PROTECT
	dbw 70, RECOVER
	db 0 ; no more level-up moves

TangrowthEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 4, SLEEP_POWDER
	dbw 10, ABSORB
	dbw 13, POISONPOWDER
	dbw 18, VINE_WHIP
	dbw 24, SLAM
	dbw 28, STUN_SPORE
	dbw 32, GROWTH
	dbw 36, LEECH_SEED
	dbw 40, GIGA_DRAIN
	dbw 45, BODY_SLAM	
	dbw 50, NATURE_POWER	
	dbw 55, AMNESIA
	dbw 60, SOLARBEAM
	dbw 65, SPORE
	dbw 70, DARK_PULSE
	db 0 ; no more level-up moves

ElectivireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 12, QUICK_ATTACK	
	dbw 17, LIGHT_SCREEN
	dbw 20, MACH_PUNCH
	dbw 24, DIZZY_PUNCH	
	dbw 28, THUNDERPUNCH
	dbw 32, THUNDER_WAVE
	dbw 36, CONFUSE_RAY
	dbw 40, THUNDERBOLT
	dbw 45, FAERIEGLEAM
	dbw 50, CHARGE	
	dbw 55, AGILITY
	dbw 60, THUNDER
	dbw 65, SUBMISSION
	dbw 70, SHOCKSLAM
	db 0 ; no more level-up moves

MagmortarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 13, TAIL_WHIP
	dbw 18, SMOG
	dbw 20, MACH_PUNCH
	dbw 24, SMOKESCREEN
	dbw 28, FIRE_PUNCH
	dbw 32, WILLOWISP
	dbw 36, SUNNY_DAY
	dbw 40, FLAMETHROWER
	dbw 45, SLUDGE_WAVE
	dbw 50, BRICK_BREAK
	dbw 55, PSYCHIC_M
	dbw 60, FIRE_BLAST	
	dbw 65, CONFUSE_RAY
	dbw 70, ERUPTION
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
	dbw 36, TAKE_DOWN
	dbw 40, PSYCHIC_M
	dbw 45, DREAM_EATER
	dbw 50, SWORDS_DANCE
	dbw 50, MEDITATE	
	dbw 60, PURSUIT
	dbw 65, MEGAHORN
	dbw 70, EARTHQUAKE
	db 0 ; no more level-up moves

PorygonzEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONVERSION2
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 9, AGILITY
	dbw 16, RECOVER
	dbw 20, THUNDER_WAVE
	dbw 24, SHOCK_WAVE
	dbw 28, PSYBEAM	
	dbw 32, CHARGE
	dbw 36, TRI_ATTACK	
	dbw 40, THUNDERBOLT
	dbw 45, MIRROR_COAT	
	dbw 50, HYPER_BEAM
	dbw 55, LOCK_ON
	dbw 60, ZAP_CANNON
	dbw 65, HYPER_VOICE
	dbw 70, TRANSFORM
	db 0 ; no more level-up moves

AnnihilapeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 5, SAND_ATTACK
	dbw 8, LEER	
	dbw 12, SHADOWSNEAK
	dwb 16, ROAR
	dbw 20, FURY_SWIPES
	dbw 24, DOUBLE_KICK
	dbw 28, SHADOW_PUNCH
	dbw 32, MACH_PUNCH	
	dbw 36, MAGNITUDE	
	dbw 40, CROSS_CHOP
	dbw 45, EARTHQUAKE
	dbw 50, ROCK_SLIDE
	dbw 55, BULK_UP
	dbw 60, SHADOW_FORCE
	dbw 65, SUPERPOWER
	dbw 70, MEAN_LOOK
	db 0 ; no more level-up moves

KleavorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BULLET_PUNCH
	dbw 1, STRING_SHOT
	dbw 6, FOCUS_ENERGY
	dbw 12, ROCK_THROW
	dbw 18, FALSE_SWIPE
	dbw 24, ROCK_TOMB
	dbw 28, AGILITY
	dbw 32, FURY_CUTTER	
	dbw 36, RAZOR_WIND
	dbw 40, ROCK_SLIDE
	dbw 45, SWORDS_DANCE
	dbw 50, LEAF_BLADE
	dbw 55, DOUBLE_TEAM
	dbw 60, STONE_EDGE
	dbw 65, SHADOW_CLAW
	dbw 70, GUILLOTINE
	db 0 ; no more level-up moves

AraichuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, PSYWAVE
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 12, QUICK_ATTACK
	dbw 16, DOUBLE_TEAM
	dbw 20, CHARM
	dbw 24, SHOCK_WAVE
	dbw 28, PSYBEAM
	dbw 32, GROWTH
	dbw 36, SWIFT
	dbw 40, EXTRASENSORY
	dbw 45, THUNDERBOLT
	dbw 50, MEDITATE
	dbw 55, PSYCHIC_M	
	dbw 60, THUNDER
	dbw 65, LIGHT_SCREEN	
	dbw 70, VOLT_TACKLE
	db 0 ; no more level-up moves

AmarowakEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 5, TAIL_WHIP
	dbw 12, SAND_ATTACK
	dbw 16, BONE_CLUB
	dbw 20, HEADBUTT
	dbw 24, NIGHT_SHADE
	dbw 28, BONEMERANG
	dbw 32, CURSE
	dbw 36, SHADOW_CLAW
	dbw 40, FLAME_WHEEL	
	dbw 45, SHADOW_BALL
	dbw 50, SWORDS_DANCE
	dbw 55, BONE_RUSH
	dbw 60, SHADOW_FORCE
	dbw 65, GLARE
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

AgrimerEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, AMUK
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 1, HARDEN
	dbw 7, BITE
	dbw 12, STUN_SPORE
	dbw 16, CURSE
	dbw 20, SHADOWSNEAK
	dbw 24, POISON_FANG	
	dbw 28, FAINT_ATTACK
	dbw 32, MAGNITUDE
	dbw 36, COSMIC_POWER
	dbw 40, SLUDGE_BOMB
	dbw 45, PURSUIT
	dbw 50, REST
	dbw 55, EARTHQUAKE
	dbw 60, SUBSTITUTE
	dbw 65, CRUSH_CLAW
	dbw 70, CONVERSION
	db 0 ; no more level-up moves

AmukEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 1, HARDEN
	dbw 7, BITE
	dbw 12, STUN_SPORE
	dbw 16, CURSE
	dbw 20, SHADOWSNEAK
	dbw 24, POISON_FANG	
	dbw 28, FAINT_ATTACK
	dbw 32, MAGNITUDE
	dbw 36, COSMIC_POWER
	dbw 40, SLUDGE_BOMB
	dbw 45, PURSUIT
	dbw 50, REST
	dbw 55, EARTHQUAKE
	dbw 60, SUBSTITUTE
	dbw 65, CRUSH_CLAW
	dbw 70, CONVERSION
	db 0 ; no more level-up moves

AsandshrewEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ASANDSLASH
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 8, POWDER_SNOW
	dbw 12, METAL_CLAW
	dbw 16, POISON_STING
	dbw 20, ICE_BALL
	dbw 24, ICE_FANG
	dbw 28, ROCK_TOMB	
	dbw 32, HAIL
	dbw 36, SLASH
	dbw 40, ICICLE_CRASH
	dbw 45, VICEGRIP
	dbw 50, BULK_UP
	dbw 55, EARTHQUAKE
	dbw 60, GUILLOTINE
	dbw 65, ICY_WIND
	dbw 70, BLIZZARD
	db 0 ; no more level-up moves

AsandslashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 8, POWDER_SNOW
	dbw 12, METAL_CLAW
	dbw 16, POISON_STING
	dbw 20, ICE_BALL
	dbw 24, ICE_FANG
	dbw 28, ROCK_TOMB	
	dbw 32, HAIL
	dbw 36, SLASH
	dbw 40, ICICLE_CRASH
	dbw 45, VICEGRIP
	dbw 50, BULK_UP
	dbw 55, EARTHQUAKE
	dbw 60, GUILLOTINE
	dbw 65, ICY_WIND
	dbw 70, BLIZZARD
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
	dbw 36, HYPNOSIS
	dbw 40, FAERIEGLEAM
	dbw 45, EXTRASENSORY
	dbw 50, CALM_MIND
	dbw 55, DESTINY_BOND
	dbw 60, BLIZZARD
	dbw 65, HAIL
	dbw 70, LUSTER_PURGE
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
	dbw 36, HYPNOSIS
	dbw 40, FAERIEGLEAM
	dbw 45, EXTRASENSORY
	dbw 50, CALM_MIND
	dbw 55, DESTINY_BOND
	dbw 60, BLIZZARD
	dbw 65, HAIL
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

AgeodudeEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, AGRAVELER
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, ROLLOUT
	dbw 21, SELFDESTRUCT
	dbw 24, ROCK_TOMB
	dbw 28, THUNDERPUNCH
	dbw 32, CURSE
	dbw 36, EXPLOSION
	dbw 40, ROCK_SLIDE
	dbw 45, THUNDERBOLT
	dbw 50, SANDSTORM
	dbw 55, AMNESIA	
	dbw 60, STONE_EDGE
	dbw 65, SHOCKSLAM
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

AgravelerEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, AGOLEM
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, ROLLOUT
	dbw 21, SELFDESTRUCT
	dbw 24, ROCK_TOMB
	dbw 28, THUNDERPUNCH
	dbw 32, CURSE
	dbw 36, EXPLOSION
	dbw 40, ROCK_SLIDE
	dbw 45, THUNDERBOLT
	dbw 50, SANDSTORM
	dbw 55, AMNESIA	
	dbw 60, STONE_EDGE
	dbw 65, SHOCKSLAM
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

AgolemEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, ROLLOUT
	dbw 21, SELFDESTRUCT
	dbw 24, ROCK_TOMB
	dbw 28, THUNDERPUNCH
	dbw 32, CURSE
	dbw 36, EXPLOSION
	dbw 40, ROCK_SLIDE
	dbw 45, THUNDERBOLT
	dbw 50, SANDSTORM
	dbw 55, AMNESIA	
	dbw 60, STONE_EDGE
	dbw 65, SHOCKSLAM
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

HvoltorbEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, HELECTRODE
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK	
	dbw 8, THUNDER_WAVE
	dbw 12, TACKLE
	dbw 16, SELFDESTRUCT
	dbw 20, SONICBOOM	
	dbw 24, SPARK	
	dbw 28, RAZOR_LEAF
	dbw 32, LIGHT_SCREEN
	dbw 36, ROLLOUT
	dbw 40, THUNDERBOLT
	dbw 45, GIGA_DRAIN
	dbw 50, CHARGE
	dbw 55, EXPLOSION
	dbw 60, THUNDER	
	dbw 65, POWER_GEM
	dbw 70, FLASHCANNON
	db 0 ; no more level-up moves

HelectrodeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK	
	dbw 8, THUNDER_WAVE
	dbw 12, TACKLE
	dbw 16, SELFDESTRUCT
	dbw 20, SONICBOOM	
	dbw 24, SPARK	
	dbw 28, RAZOR_LEAF
	dbw 32, LIGHT_SCREEN
	dbw 36, ROLLOUT
	dbw 40, THUNDERBOLT
	dbw 45, GIGA_DRAIN
	dbw 50, CHARGE
	dbw 55, EXPLOSION
	dbw 60, THUNDER	
	dbw 65, POWER_GEM
	dbw 70, FLASHCANNON
	db 0 ; no more level-up moves

IronbundleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PRESENT
	dbw 1, POWDER_SNOW
	dbw 10, GUST
	dbw 16, SPIKES
	dbw 20, ICY_WIND
	dbw 24, AURORA_BEAM
	dbw 28, WING_ATTACK	
	dbw 32, RAZOR_WIND
	dbw 36, REFLECT
	dbw 40, SURF
	dbw 45, ICICLE_CRASH
	dbw 50, CALM_MIND
	dbw 55, BATON_PASS
	dbw 60, BLIZZARD
	dbw 65, HYDRO_PUMP
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

Voltorb2EvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTRODE2
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK	
	dbw 8, THUNDER_WAVE
	dbw 12, METAL_CLAW
	dbw 16, SELFDESTRUCT
	dbw 20, SONICBOOM	
	dbw 24, SPARK	
	dbw 28, SPIKE_CANNON
	dbw 32, LIGHT_SCREEN
	dbw 36, ROLLOUT
	dbw 40, THUNDERBOLT
	dbw 45, FLASHCANNON
	dbw 50, CHARGE
	dbw 55, EXPLOSION
	dbw 60, THUNDER	
	dbw 65, POWER_GEM
	dbw 70, FAERIEGLEAM
	db 0 ; no more level-up moves

Electrode2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK	
	dbw 8, THUNDER_WAVE
	dbw 12, METAL_CLAW
	dbw 16, SELFDESTRUCT
	dbw 20, SONICBOOM	
	dbw 24, SPARK	
	dbw 28, SPIKE_CANNON
	dbw 32, LIGHT_SCREEN
	dbw 36, ROLLOUT
	dbw 40, THUNDERBOLT
	dbw 45, FLASHCANNON
	dbw 50, CHARGE
	dbw 55, EXPLOSION
	dbw 60, THUNDER	
	dbw 65, POWER_GEM
	dbw 70, FAERIEGLEAM
	db 0 ; no more level-up moves

Exeggcute2EvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR2
	dbbw EVOLVE_LEVEL, 36, EXEGGUTOR2
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, LEECH_SEED
	dbw 7, BITE
	dbw 12, TWISTER
	dbw 16, BARRAGE
	dbw 20, STUN_SPORE
	dbw 24, HYPER_FANG	
	dbw 28, POISON_FANG
	dbw 32, FIRE_FANG
	dbw 36, ICE_FANG
	dbw 40, DRAGON_CLAW
	dbw 45, LEAF_BLADE
	dbw 50, BULK_UP
	dbw 55, THUNDER_FANG
	dbw 60, CRUNCH
	dbw 65, DRAGON_DANCE
	dbw 70, OUTRAGE
	db 0 ; no more level-up moves

Exeggutor2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, LEECH_SEED
	dbw 7, BITE
	dbw 12, TWISTER
	dbw 16, BARRAGE
	dbw 20, STUN_SPORE
	dbw 24, HYPER_FANG	
	dbw 28, POISON_FANG
	dbw 32, FIRE_FANG
	dbw 36, ICE_FANG
	dbw 40, DRAGON_CLAW
	dbw 45, LEAF_BLADE
	dbw 50, BULK_UP
	dbw 55, THUNDER_FANG
	dbw 60, CRUNCH
	dbw 65, DRAGON_DANCE
	dbw 70, OUTRAGE
	db 0 ; no more level-up moves

Furret2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, FOCUS_ENERGY
	dbw 18, SHARPEN
	dbw 20, SCARY_FACE
	dbw 24, HYPER_FANG
	dbw 28, DIG
	dbw 32, BULK_UP
	dbw 40, DRAGON_CLAW
	dbw 45, DRAGON_DANCE
	dbw 50, EXTREMESPEED
	dbw 55, FIRE_FANG
	dbw 60, OUTRAGE
	dbw 65, ICE_FANG
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

Noctowl2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 5, PECK
	dbw 10, NIGHT_SHADE
	dbw 12, CONFUSION
	dbw 16, FORESIGHT	
	dbw 20, HYPNOSIS
	dbw 24, WING_ATTACK
	dbw 28, PSYBEAM
	dbw 32, WILLOWISP
	dbw 36, DREAM_EATER
	dbw 40, DRILL_PECK
	dbw 45, PSYCHIC_M	
	dbw 50, MOONBLAST
	dbw 55, ICY_WIND
	dbw 60, HURRICANE
	dbw 65, GROWTH
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

Octillery2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 10, CLAMP
	dbw 20, LOCK_ON
	dbw 24, BUBBLEBEAM
	dbw 28, PSYBEAM
	dbw 32, AURORA_BEAM
	dbw 36, MEDITATE
	dbw 40, OCTAZOOKA
	dbw 45, ICE_BEAM
	dbw 50, HYPER_BEAM
	dbw 55, FIRE_BLAST
	dbw 60, SOLARBEAM
	dbw 65, RECOVER
	dbw 70, ERUPTION
	db 0 ; no more level-up moves

Yanma2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TWISTER
	dbw 1, STRING_SHOT
	dbw 7, QUICK_ATTACK
	dbw 12, DOUBLE_TEAM
	dbw 16, GUST
	dbw 20, SONICBOOM	
	dbw 24, MUD_SHOT
	dbw 28, ANCIENTPOWER
	dbw 32, SUPERSONIC
	dbw 36, DRAGON_DANCE
	dbw 40, DRAGON_CLAW
	dbw 45, PIN_MISSILE
	dbw 50, EARTHQUAKE
	dbw 55, POISON_JAB
	dbw 60, MEGAHORN
	dbw 65, OUTRAGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

Scyther2EvosAttacks:
	dbww EVOLVE_ITEM, METAL_COAT, SCIZOR2
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, STRING_SHOT
	dbw 6, FOCUS_ENERGY
	dbw 12, BITE
	dbw 18, FALSE_SWIPE
	dbw 24, WING_ATTACK
	dbw 28, AGILITY
	dbw 32, FURY_CUTTER
	dbw 36, RAZOR_WIND
	dbw 40, SLASH	
	dbw 45, SWORDS_DANCE
	dbw 50, LEAF_BLADE
	dbw 55, DOUBLE_TEAM	
	dbw 60, SKY_ATTACK
	dbw 65, PSYCHO_CUT
	dbw 70, AERIAL_ACE
	db 0 ; no more level-up moves

Scizor2EvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, SCIZORX
	db 0 ; no more evolutions
	dbw 1, BULLET_PUNCH
	dbw 1, STRING_SHOT
	dbw 6, FOCUS_ENERGY
	dbw 12, BITE
	dbw 18, FALSE_SWIPE
	dbw 24, WING_ATTACK
	dbw 28, AGILITY
	dbw 32, FURY_CUTTER
	dbw 36, RAZOR_WIND
	dbw 40, VICEGRIP	
	dbw 45, SWORDS_DANCE
	dbw 50, LEAF_BLADE
	dbw 55, DOUBLE_TEAM	
	dbw 60, SKY_ATTACK
	dbw 65, PSYCHO_CUT
	dbw 70, GUILLOTINE
	db 0 ; no more level-up moves

Tentacool2EvosAttacks:
	dbbw EVOLVE_LEVEL, 30, TENTACRUEL2
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, ROCK_THROW
	dbw 6, SUPERSONIC
	dbw 12, CLAMP
	dbw 16, WRAP
	dbw 20, GROWTH
	dbw 24, ROCK_TOMB
	dbw 28, TWINEEDLE
	dbw 32, SANDSTORM
	dbw 36, COSMIC_POWER
	dbw 40, POWER_GEM
	dbw 45, GIGA_DRAIN
	dbw 50, SIGNAL_BEAM
	dbw 55, EARTHQUAKE
	dbw 60, STONE_EDGE
	dbw 65, MEGAHORN
	dbw 70, MIST
	db 0 ; no more level-up moves

Tentacruel2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, ROCK_THROW
	dbw 6, SUPERSONIC
	dbw 12, CLAMP
	dbw 16, WRAP
	dbw 20, GROWTH
	dbw 24, ROCK_TOMB
	dbw 28, TWINEEDLE
	dbw 32, SANDSTORM
	dbw 36, COSMIC_POWER
	dbw 40, POWER_GEM
	dbw 45, GIGA_DRAIN
	dbw 50, SIGNAL_BEAM
	dbw 55, EARTHQUAKE
	dbw 60, STONE_EDGE
	dbw 65, MEGAHORN
	dbw 70, MIST
	db 0 ; no more level-up moves

Rapidash2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, GROWL
	dbw 10, EMBER
	dbw 15, TAIL_WHIP
	dbw 20, DOUBLE_KICK
	dbw 24, STOMP
	dbw 28, FIRE_SPIN
	dbw 36, SUNNY_DAY
	dbw 40, FLAME_WHEEL
	dbw 45, TAKE_DOWN
	dbw 50, EXTREMESPEED
	dbw 55, DRAGON_DANCE
	dbw 60, SACRED_FIRE
	dbw 65, MEGA_KICK
	dbw 70, SOLARBEAM
	dbw 75, ICICLE_CRASH
	dbw 80, BLIZZARD	
	db 0 ; no more level-up moves

Ninetales2EvosAttacks:
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
	dbw 36, HYPNOSIS
	dbw 40, FAERIEGLEAM
	dbw 45, EXTRASENSORY
	dbw 50, CALM_MIND
	dbw 55, DESTINY_BOND
	dbw 60, BLIZZARD
	dbw 65, HAIL
	dbw 70, LUSTER_PURGE
	dbw 75, SHADOW_BALL
	dbw 80, FIRE_BLAST
	db 0 ; no more level-up moves

Tauros2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, TAIL_WHIP
	dbw 12, LOW_KICK
	dbw 16, RAGE
	dbw 20, SCARY_FACE
	dbw 24, DOUBLE_KICK	
	dbw 28, HORN_ATTACK
	dbw 32, MAGNITUDE
	dbw 36, BRICK_BREAK
	dbw 40, EARTHQUAKE
	dbw 45, BODY_SLAM
	dbw 50, BULK_UP
	dbw 55, OUTRAGE
	dbw 60, SUBMISSION
	dbw 65, DOUBLE_EDGE
	dbw 70, FISSURE
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
	dbw 65, REFLECT
	dbw 70, SUBSTITUTE
	db 0 ; no more level-up moves

HonobeaEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, BORUBEA
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 12, METAL_CLAW
	dbw 16, SMOKESCREEN
	dbw 20, RAGE
	dbw 24, FIRE_FANG
	dbw 28, SCARY_FACE
	dbw 32, AIR_CUTTER
	dbw 36, SUNNY_DAY
	dbw 40, FLAME_WHEEL	
	dbw 45, DRAGON_CLAW
	dbw 50, CRUSH_CLAW
	dbw 55, BULK_UP	
	dbw 60, FIRE_BLAST
	dbw 65, OUTRAGE
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

BorubeaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, DYNABEA
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 12, METAL_CLAW
	dbw 16, SMOKESCREEN
	dbw 20, RAGE
	dbw 24, FIRE_FANG
	dbw 28, SCARY_FACE
	dbw 32, AIR_CUTTER
	dbw 36, SUNNY_DAY
	dbw 40, FLAME_WHEEL	
	dbw 45, DRAGON_CLAW
	dbw 50, CRUSH_CLAW
	dbw 55, BULK_UP	
	dbw 60, FIRE_BLAST
	dbw 65, OUTRAGE
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

DynabeaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 12, METAL_CLAW
	dbw 16, SMOKESCREEN
	dbw 20, RAGE
	dbw 24, FIRE_FANG
	dbw 28, SCARY_FACE
	dbw 32, AIR_CUTTER
	dbw 36, SUNNY_DAY
	dbw 40, FLAME_WHEEL	
	dbw 45, DRAGON_CLAW
	dbw 50, CRUSH_CLAW
	dbw 55, BULK_UP	
	dbw 60, FIRE_BLAST
	dbw 65, OUTRAGE
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

KurusuEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, AKUA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, TAIL_WHIP
	dbw 7, GROWL
	dbw 12, WATER_GUN
	dbw 16, BITE
	dbw 20, AGILITY
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 32, MIRROR_COAT
	dbw 36, RAIN_DANCE
	dbw 40, MIST_BALL
	dbw 45, ICE_BEAM
	dbw 50, CALM_MIND
	dbw 55, SCALD
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

AkuaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, AKUERIA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, TAIL_WHIP
	dbw 7, GROWL
	dbw 12, WATER_GUN
	dbw 16, BITE
	dbw 20, AGILITY
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 32, MIRROR_COAT
	dbw 36, RAIN_DANCE
	dbw 40, MIST_BALL
	dbw 45, ICE_BEAM
	dbw 50, CALM_MIND
	dbw 55, SCALD
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

AkueriaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, TAIL_WHIP
	dbw 7, GROWL
	dbw 12, WATER_GUN
	dbw 16, BITE
	dbw 20, AGILITY
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 32, MIRROR_COAT
	dbw 36, RAIN_DANCE
	dbw 40, MIST_BALL
	dbw 45, ICE_BEAM
	dbw 50, CALM_MIND
	dbw 55, SCALD
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

HaneeiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 4, BUBBLE
	dbw 8, WATER_GUN
	dbw 12, CURSE	
	dbw 16, NIGHT_SHADE
	dbw 20, CONFUSE_RAY
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM	
	dbw 32, HYPNOSIS
	dbw 36, DREAM_EATER
	dbw 40, MIST_BALL
	dbw 45, SHADOW_BALL	
	dbw 50, DESTINY_BOND
	dbw 55, LIGHT_SCREEN
	dbw 60, COSMIC_POWER
	dbw 65, BATON_PASS
	dbw 70, CURSE
	db 0 ; no more level-up moves

TsubomittEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 6, GROWTH
	dbw 11, WRAP
	dbw 16, SLEEP_POWDER
	dbw 20, POISONPOWDER	
	dbw 24, RAZOR_LEAF
	dbw 28, SWEET_SCENT
	dbw 32, STUN_SPORE
	dbw 36, LEECH_SEED	
	dbw 40, SLUDGE_BOMB
	dbw 45, NATURE_POWER
	dbw 50, BULK_UP
	dbw 55, BODY_SLAM
	dbw 60, SOLARBEAM
	dbw 65, TOXIC
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

KotoraEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, RAITORA
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 12, QUICK_ATTACK
	dbw 16, DOUBLE_TEAM
	dbw 20, THUNDER_FANG
	dbw 24, ICE_FANG
	dbw 28, FIRE_FANG
	dbw 32, HYPER_FANG
	dbw 36, POISON_FANG
	dbw 40, CRUNCH
	dbw 45, THUNDERBOLT
	dbw 50, DRAGON_DANCE
	dbw 55, PLAY_ROUGH
	dbw 60, SHOCKSLAM
	dbw 65, BEAT_UP	
	dbw 70, VOLT_TACKLE
	db 0 ; no more level-up moves

RaitoraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 12, QUICK_ATTACK
	dbw 16, DOUBLE_TEAM
	dbw 20, THUNDER_FANG
	dbw 24, ICE_FANG
	dbw 28, FIRE_FANG
	dbw 32, HYPER_FANG
	dbw 36, POISON_FANG
	dbw 40, CRUNCH
	dbw 45, THUNDERBOLT
	dbw 50, DRAGON_DANCE
	dbw 55, PLAY_ROUGH
	dbw 60, SHOCKSLAM
	dbw 65, BEAT_UP	
	dbw 70, VOLT_TACKLE
	db 0 ; no more level-up moves

AshibombEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 5, GROWL
	dbw 10, TAIL_WHIP
	dbw 16, REST
	dbw 20, HEADBUTT
	dbw 24, FIRE_SPIN
	dbw 28, BUBBLEBEAM
	dbw 32, TAKE_DOWN
	dbw 36, MIRROR_COAT
	dbw 40, FLAMETHROWER
	dbw 45, SCALD
	dbw 50, ICY_WIND
	dbw 55, WILLOWISP
	dbw 60, HYDRO_PUMP
	dbw 65, FIRE_BLAST
	dbw 70, MEGAHORN
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
	dbw 20, SWEET_SCENT
	dbw 24, MAGICAL_LEAF	
	dbw 28, SLUDGE
	dbw 32, TOXIC
	dbw 36, GROWTH
	dbw 40, GIGA_DRAIN	
	dbw 45, SYNTHESIS
	dbw 50, SLUDGE_WAVE
	dbw 55, AGILITY
	dbw 60, MOONBLAST
	dbw 65, PETAL_DANCE
	dbw 70, SLEEP_POWDER
	db 0 ; no more level-up moves

AmbipomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 6, SAND_ATTACK
	dbw 12, BATON_PASS
	dbw 18, FURY_SWIPES
	dbw 24, DIG
	dbw 28, SWIFT
	dbw 32, SCREECH
	dbw 36, GLARE
	dbw 40, SLASH
	dbw 45, PLAY_ROUGH
	dbw 50, BODY_SLAM
	dbw 55, CRUSH_CLAW
	dbw 60, HYPER_BEAM	
	db 0 ; no more level-up moves

MismagiusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK	
	dbw 6, SPITE
	dbw 12, PSYWAVE
	dbw 15, POISON_GAS
	dbw 20, WILLOWISP
	dbw 24, SHADOWSNEAK
	dbw 28, CONFUSE_RAY
	dbw 32, MEAN_LOOK
	dbw 36, ICY_WIND
	dbw 40, SHADOW_BALL	
	dbw 45, PAIN_SPLIT
	dbw 50, GLARE
	dbw 55, PERISH_SONG
	dbw 60, DESTINY_BOND
	dbw 60, CURSE
	dbw 60, SHADOW_FORCE
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
	dbw 32, SCREECH
	dbw 36, THUNDER_FANG
	dbw 40, BODY_SLAM	
	dbw 45, CRUNCH	
	dbw 50, ICE_FANG
	dbw 55, FIRE_FANG
	dbw 60, BULK_UP

RhyperiorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TAIL_WHIP
	dbw 8, ROCK_THROW
	dbw 12, METAL_CLAW
	dbw 16, ROAR
	dbw 20, HORN_ATTACK
	dbw 24, ROCK_TOMB
	dbw 28, DRAGON_RAGE
	dbw 32, SCARY_FACE
	dbw 36, TAKE_DOWN
	dbw 40, ROCK_SLIDE
	dbw 45, DRAGON_CLAW	
	dbw 50, DRAGON_DANCE
	dbw 55, EARTHQUAKE
	dbw 60, STONE_EDGE
	dbw 65, SANDSTORM
	dbw 70, HORN_DRILL

YanmegaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TWISTER
	dbw 1, STRING_SHOT
	dbw 7, QUICK_ATTACK
	dbw 12, DOUBLE_TEAM
	dbw 16, GUST
	dbw 20, SONICBOOM	
	dbw 24, DETECT
	dbw 28, ANCIENTPOWER
	dbw 32, SUPERSONIC
	dbw 36, DRAGON_DANCE
	dbw 40, DRAGON_CLAW
	dbw 45, PIN_MISSILE
	dbw 50, RAZOR_WIND
	dbw 55, POISON_JAB
	dbw 60, MEGAHORN
	dbw 65, OUTRAGE
	dbw 70, SKY_ATTACK
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
	dbw 36, COSMIC_POWER
	dbw 40, THUNDERBOLT
	dbw 45, POWER_GEM	
	dbw 50, AURA_SPHERE	
	dbw 55, REST
	dbw 60, STONE_EDGE
	dbw 65, LOCK_ON
	dbw 70, ZAP_CANNON
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
	dbw 40, SHADOW_BALL
	dbw 45, PSYCHO_CUT
	dbw 50, DRAGON_DANCE
	dbw 55, MEAN_LOOK
	dbw 60, SHADOW_FORCE
	dbw 65, RECOVER	
	dbw 70, DESTINY_BOND
	db 0 ; no more level-up moves

TotartleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, BUBBLE
	dbw 10, WITHDRAW
	dbw 14, WATER_GUN
	dbw 18, BITE
	dbw 20, PROTECT
	dbw 24, BUBBLEBEAM
	dbw 28, RAPID_SPIN	
	dbw 32, RAIN_DANCE
	dbw 36, ICE_FANG
	dbw 40, MIST_BALL
	dbw 45, FLASHCANNON
	dbw 50, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 65, BODY_SLAM
	dbw 70, HYDRO_CANNON
	dbw 75, SCALD
	dbw 80, THUNDER
	db 0 ; no more level-up moves

GorochuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 12, QUICK_ATTACK
	dbw 16, DOUBLE_TEAM
	dbw 20, CHARM
	dbw 24, SHOCK_WAVE
	dbw 32, GROWTH
	dbw 36, SWIFT
	dbw 40, THUNDERBOLT
	dbw 45, FAERIEGLEAM
	dbw 50, MEDITATE	
	dbw 55, LIGHT_SCREEN
	dbw 60, THUNDER
	dbw 65, RAIN_DANCE
	dbw 70, VOLT_TACKLE
	dbw 75, BEAT_UP
	dbw 80, SHOCKSLAM
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
	dbw 24, BUBBLEBEAM
	dbw 28, ICE_FANG
	dbw 32, POISON_FANG
	dbw 36, DRAGON_DANCE
	dbw 40, WATERFALL
	dbw 45, CRUNCH
	dbw 50, SLASH
	dbw 55, SCREECH
	dbw 60, RAIN_DANCE
	dbw 65, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
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
	dbw 24, BUBBLEBEAM
	dbw 28, ICE_FANG
	dbw 32, POISON_FANG
	dbw 36, DRAGON_DANCE
	dbw 40, WATERFALL
	dbw 45, CRUNCH
	dbw 50, SLASH
	dbw 55, SCREECH
	dbw 60, RAIN_DANCE
	dbw 65, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

Feraligatr2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 7, RAGE
	dbw 10, WATER_GUN
	dbw 14, BITE
	dbw 18, SCARY_FACE
	dbw 24, BUBBLEBEAM
	dbw 28, ICE_FANG
	dbw 32, POISON_FANG
	dbw 36, DRAGON_DANCE
	dbw 40, WATERFALL
	dbw 45, CRUNCH
	dbw 50, SLASH
	dbw 55, SCREECH
	dbw 60, RAIN_DANCE
	dbw 65, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

Cyndaquil2EvosAttacks:
	dbbw EVOLVE_LEVEL, 14, QUILAVA2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 14, QUICK_ATTACK
	dbw 20, TWISTER
	dbw 24, FIRE_FANG
	dbw 28, FAINT_ATTACK
	dbw 32, SLAM
	dbw 36, DRAGON_DANCE
	dbw 40, FLAME_WHEEL
	dbw 45, PURSUIT
	dbw 50, FLAMETHROWER
	dbw 55, OUTRAGE
	dbw 60, FIRE_BLAST
	dbw 65, BEAT_UP
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

Quilava2EvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TYPHLOSION2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 14, QUICK_ATTACK
	dbw 20, TWISTER
	dbw 24, FIRE_FANG
	dbw 28, FAINT_ATTACK
	dbw 32, SLAM
	dbw 36, DRAGON_DANCE
	dbw 40, FLAME_WHEEL
	dbw 45, PURSUIT
	dbw 50, FLAMETHROWER
	dbw 55, OUTRAGE
	dbw 60, FIRE_BLAST
	dbw 65, BEAT_UP
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

Typhlosion2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 14, QUICK_ATTACK
	dbw 20, TWISTER
	dbw 24, FIRE_FANG
	dbw 28, FAINT_ATTACK
	dbw 32, SLAM
	dbw 36, DRAGON_DANCE
	dbw 40, FLAME_WHEEL
	dbw 45, PURSUIT
	dbw 50, FLAMETHROWER
	dbw 55, OUTRAGE
	dbw 60, FIRE_BLAST
	dbw 65, BEAT_UP
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

Swinub2EvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PILOSWINE2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 10, ENDURE
	dbw 15, CURSE
	dbw 20, HAIL
	dbw 24, ANCIENTPOWER	
	dbw 28, ICICLE_SPEAR
	dbw 32, MAGNITUDE
	dbw 36, BULK_UP
	dbw 40, ICICLE_CRASH
	dbw 45, EARTHQUAKE
	dbw 50, MIST
	dbw 55, AMNESIA
	dbw 60, BLIZZARD
	dbw 65, OUTRAGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

Piloswine2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 10, ENDURE
	dbw 15, CURSE
	dbw 20, HAIL
	dbw 24, ANCIENTPOWER	
	dbw 28, ICICLE_SPEAR
	dbw 32, MAGNITUDE
	dbw 36, BULK_UP
	dbw 40, ICICLE_CRASH
	dbw 45, EARTHQUAKE
	dbw 50, MIST
	dbw 55, AMNESIA
	dbw 60, BLIZZARD
	dbw 65, OUTRAGE
	dbw 70, FISSURE
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
	dbw 36, SAFEGUARD
	dbw 40, DRILL_PECK
	dbw 45, VICEGRIP	
	dbw 50, SLASH
	dbw 55, CURSE
	dbw 60, GUILLOTINE
	dbw 65, TOXIC
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

ENDSECTION