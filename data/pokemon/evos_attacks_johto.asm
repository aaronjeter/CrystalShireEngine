SECTION "Evolutions and Attacks 2", ROMX

EvosAttacksPointers2::
	dw ChikoritaEvosAttacks
	dw BayleefEvosAttacks
	dw MeganiumEvosAttacks
	dw CyndaquilEvosAttacks
	dw QuilavaEvosAttacks
	dw TyphlosionEvosAttacks
	dw TotodileEvosAttacks
	dw CroconawEvosAttacks
	dw FeraligatrEvosAttacks
	dw SentretEvosAttacks
	dw FurretEvosAttacks
	dw HoothootEvosAttacks
	dw NoctowlEvosAttacks
	dw LedybaEvosAttacks
	dw LedianEvosAttacks
	dw SpinarakEvosAttacks
	dw AriadosEvosAttacks
	dw CrobatEvosAttacks
	dw ChinchouEvosAttacks
	dw LanturnEvosAttacks
	dw PichuEvosAttacks
	dw CleffaEvosAttacks
	dw IgglybuffEvosAttacks
	dw TogepiEvosAttacks
	dw TogeticEvosAttacks
	dw NatuEvosAttacks
	dw XatuEvosAttacks
	dw MareepEvosAttacks
	dw FlaaffyEvosAttacks
	dw AmpharosEvosAttacks
	dw BellossomEvosAttacks
	dw MarillEvosAttacks
	dw AzumarillEvosAttacks
	dw SudowoodoEvosAttacks
	dw PolitoedEvosAttacks
	dw HoppipEvosAttacks
	dw SkiploomEvosAttacks
	dw JumpluffEvosAttacks
	dw AipomEvosAttacks
	dw SunkernEvosAttacks
	dw SunfloraEvosAttacks
	dw YanmaEvosAttacks
	dw WooperEvosAttacks
	dw QuagsireEvosAttacks
	dw EspeonEvosAttacks
	dw UmbreonEvosAttacks
	dw MurkrowEvosAttacks
	dw SlowkingEvosAttacks
	dw MisdreavusEvosAttacks
	dw UnownEvosAttacks
	dw WobbuffetEvosAttacks
	dw GirafarigEvosAttacks
	dw PinecoEvosAttacks
	dw ForretressEvosAttacks
	dw DunsparceEvosAttacks
	dw GligarEvosAttacks
	dw SteelixEvosAttacks
	dw SnubbullEvosAttacks
	dw GranbullEvosAttacks
	dw QwilfishEvosAttacks
	dw ScizorEvosAttacks
	dw ShuckleEvosAttacks
	dw HeracrossEvosAttacks
	dw SneaselEvosAttacks
	dw TeddiursaEvosAttacks
	dw UrsaringEvosAttacks
	dw SlugmaEvosAttacks
	dw MagcargoEvosAttacks
	dw SwinubEvosAttacks
	dw PiloswineEvosAttacks
	dw CorsolaEvosAttacks
	dw RemoraidEvosAttacks
	dw OctilleryEvosAttacks
	dw DelibirdEvosAttacks
	dw MantineEvosAttacks
	dw SkarmoryEvosAttacks
	dw HoundourEvosAttacks
	dw HoundoomEvosAttacks
	dw KingdraEvosAttacks
	dw PhanpyEvosAttacks
	dw DonphanEvosAttacks
	dw Porygon2EvosAttacks
	dw StantlerEvosAttacks
	dw SmeargleEvosAttacks
	dw TyrogueEvosAttacks
	dw HitmontopEvosAttacks
	dw SmoochumEvosAttacks
	dw ElekidEvosAttacks
	dw MagbyEvosAttacks
	dw MiltankEvosAttacks
	dw BlisseyEvosAttacks
	dw RaikouEvosAttacks
	dw EnteiEvosAttacks
	dw SuicuneEvosAttacks
	dw LarvitarEvosAttacks
	dw PupitarEvosAttacks
	dw TyranitarEvosAttacks
	dw LugiaEvosAttacks
	dw HoOhEvosAttacks
	dw CelebiEvosAttacks
	dw MunchlaxEvosAttacks	
	
.IndirectEnd::

ChikoritaEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 8, VINE_WHIP
	dbw 12, REFLECT
	dbw 15, POISONPOWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF
	dbw 28, LIGHT_SCREEN
	dbw 32, SAFEGUARD
	dbw 36, GROWTH
	dbw 40, GIGA_DRAIN
	dbw 45, BODY_SLAM
	dbw 50, DRAGONBREATH
	dbw 55, SUNNY_DAY
	dbw 60, SOLARBEAM
	dbw 65, STUN_SPORE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 8, VINE_WHIP
	dbw 12, REFLECT
	dbw 15, POISONPOWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF
	dbw 28, LIGHT_SCREEN
	dbw 32, SAFEGUARD
	dbw 36, GROWTH
	dbw 40, GIGA_DRAIN
	dbw 45, BODY_SLAM
	dbw 50, DRAGONBREATH
	dbw 55, SUNNY_DAY
	dbw 60, SOLARBEAM
	dbw 65, STUN_SPORE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 8, VINE_WHIP
	dbw 12, REFLECT
	dbw 15, POISONPOWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF
	dbw 28, LIGHT_SCREEN
	dbw 32, SAFEGUARD
	dbw 36, GROWTH
	dbw 40, GIGA_DRAIN
	dbw 45, BODY_SLAM
	dbw 50, DRAGONBREATH
	dbw 55, SUNNY_DAY
	dbw 60, SOLARBEAM
	dbw 65, STUN_SPORE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, QUILAVA
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

QuilavaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TYPHLOSION
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

TyphlosionEvosAttacks:
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

TotodileEvosAttacks:
    dbww EVOLVE_ITEM, THUNDERSTONE, TOTODILE2
	dbbw EVOLVE_LEVEL, 18, CROCONAW
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

CroconawEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, CROCONAW2
	dbbw EVOLVE_LEVEL, 30, FERALIGATR
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

FeraligatrEvosAttacks:
    dbww EVOLVE_ITEM, THUNDERSTONE, FERALIGATR2
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

SentretEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FURRET
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

FurretEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, FURRET2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, FOCUS_ENERGY
	dbw 18, SHARPEN
	dbw 20, SCARY_FACE
	dbw 24, HYPER_FANG
	dbw 28, POISON_FANG
	dbw 32, BULK_UP
	dbw 40, DRAGON_CLAW
	dbw 45, DRAGON_DANCE
	dbw 50, EXTREMESPEED
	dbw 55, FIRE_FANG
	dbw 60, OUTRAGE
	dbw 65, ICE_FANG
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, NOCTOWL
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

NoctowlEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, NOCTOWL2
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

LedybaEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, LEDIAN
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEECH_LIFE
	dbw 8, SUPERSONIC
	dbw 12, POISONPOWDER
	dbw 16, MACH_PUNCH
	dbw 20, LIGHT_SCREEN
	dbw 24, REFLECT
	dbw 28, TWINEEDLE
	dbw 30, BATON_PASS
	dbw 32, BULK_UP
	dbw 36, BRICK_BREAK
	dbw 40, SHADOW_PUNCH
	dbw 42, CROSS_CHOP
	dbw 45, PLAY_ROUGH
	dbw 50, MEGAHORN
	dbw 55, SILVER_WIND
	dbw 60, SUPERPOWER
	db 0 ; no more level-up moves

LedianEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, LEDIANX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEECH_LIFE
	dbw 8, SUPERSONIC
	dbw 12, POISONPOWDER
	dbw 16, MACH_PUNCH
	dbw 20, LIGHT_SCREEN
	dbw 24, REFLECT
	dbw 28, TWINEEDLE
	dbw 30, BATON_PASS
	dbw 32, BULK_UP
	dbw 36, BRICK_BREAK
	dbw 40, SHADOW_PUNCH
	dbw 42, CROSS_CHOP
	dbw 45, PLAY_ROUGH
	dbw 50, MEGAHORN
	dbw 55, SILVER_WIND
	dbw 60, SUPERPOWER
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 6, SCARY_FACE
	dbw 11, SPIDER_WEB
	dbw 16, NIGHT_SHADE
	dbw 20, MEGA_DRAIN
	dbw 22, SHADOWSNEAK
	dbw 24, SLUDGE
	dbw 28, TWINEEDLE
	dbw 30, PSYBEAM
	dbw 32, AGILITY
	dbw 36, SLUDGE_BOMB
	dbw 40, SIGNAL_BEAM
	dbw 42, GROWTH
	dbw 45, PSYCHIC_M
	dbw 50, PURSUIT
	dbw 55, CRUNCH
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 6, SCARY_FACE
	dbw 11, SPIDER_WEB
	dbw 16, NIGHT_SHADE
	dbw 20, MEGA_DRAIN
	dbw 22, SHADOWSNEAK
	dbw 24, SLUDGE
	dbw 28, TWINEEDLE
	dbw 30, PSYBEAM
	dbw 32, AGILITY
	dbw 36, SLUDGE_BOMB
	dbw 40, SIGNAL_BEAM
	dbw 42, GROWTH
	dbw 45, PSYCHIC_M
	dbw 50, PURSUIT
	dbw 55, CRUNCH
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, POISON_STING
	dbw 6, SUPERSONIC
	dbw 10, GUST
	dbw 16, BITE
	dbw 19, CONFUSE_RAY
	dbw 24, WING_ATTACK
	dbw 28, POISON_FANG
	dbw 32, HAZE
	dbw 36, BELLY_DRUM
	dbw 40, SLUDGE_BOMB
	dbw 45, CRUNCH
	dbw 50, EXTREMESPEED
	dbw 55, AGILITY
	dbw 60, SKY_ATTACK
	dbw 65, WHIRLWIND
	dbw 70, DOUBLE_TEAM
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, LANTURN
	db 0 ; no more evolutions
	dbw 1, BUBBLE	
	dbw 5, SUPERSONIC
	dbw 10, THUNDERSHOCK
	dbw 16, WATER_GUN
	dbw 20, THUNDER_WAVE
	dbw 28, SHOCK_WAVE
	dbw 24, WATER_PULSE
	dbw 32, CONFUSE_RAY
	dbw 36, CHARGE
	dbw 40, THUNDERBOLT
	dbw 45, SIGNAL_BEAM
	dbw 50, MIST_BALL
	dbw 55, RAIN_DANCE
	dbw 60, THUNDER
	dbw 65, HYDRO_PUMP
	dbw 70, FLASHCANNON
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE	
	dbw 5, SUPERSONIC
	dbw 10, THUNDERSHOCK
	dbw 16, WATER_GUN
	dbw 20, THUNDER_WAVE
	dbw 28, SHOCK_WAVE
	dbw 24, WATER_PULSE
	dbw 32, CONFUSE_RAY
	dbw 36, CHARGE
	dbw 40, THUNDERBOLT
	dbw 45, SIGNAL_BEAM
	dbw 50, MIST_BALL
	dbw 55, RAIN_DANCE
	dbw 60, THUNDER
	dbw 65, HYDRO_PUMP
	dbw 70, FLASHCANNON
	db 0 ; no more level-up moves

PichuEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	dbbw EVOLVE_LEVEL, 20, PIKACHU
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
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	dbbw EVOLVE_LEVEL, 20, CLEFAIRY
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 4, ENCORE
	dbw 8, SING
	dbw 12, DOUBLESLAP
	dbw 16, METRONOME
	dbw 20, DEFENSE_CURL
	dbw 24, DRAININGKISS
	dbw 28, GLARE
	dbw 32, FAE_VOICE
	dbw 36, MOONLIGHT
	dbw 40, MOONBLAST	
	dbw 45, REFLECT
	dbw 50, CALM_MIND
	dbw 55, METEOR_MASH
	dbw 60, COSMIC_POWER
	dbw 65, HYPER_VOICE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	dbbw EVOLVE_LEVEL, 20, JIGGLYPUFF
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 5, POUND
	dbw 10, DISABLE
	dbw 16, ROLLOUT
	dbw 20, WILLOWISP
	dbw 24, DRAININGKISS
	dbw 28, REST
	dbw 32, GLARE
	dbw 36, COSMIC_POWER
	dbw 40, MOONBLAST
	dbw 45, REST
	dbw 50, CALM_MIND
	dbw 55, PERISH_SONG
	dbw 60, DOUBLE_EDGE
	dbw 65, HYPER_VOICE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
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
	dbw 36, MIRROR_COAT
	dbw 40, MOONBLAST
	dbw 45, RAZOR_WIND
	dbw 50, CALM_MIND
	dbw 55, PLAY_ROUGH
	dbw 60, MIST_BALL
	dbw 65, OUTRAGE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	dbww EVOLVE_ITEM, DAWN_STONE, TOGEKISS
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
	dbw 36, MIRROR_COAT
	dbw 40, MOONBLAST
	dbw 45, RAZOR_WIND
	dbw 50, CALM_MIND
	dbw 55, PLAY_ROUGH
	dbw 60, MIST_BALL
	dbw 65, OUTRAGE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

NatuEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, XATU
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, CONFUSION
	dbw 10, NIGHT_SHADE
	dbw 15, TELEPORT
	dbw 20, CONFUSE_RAY
	dbw 24, PSYBEAM
	dbw 28, WING_ATTACK
	dbw 32, MEDITATE	
	dbw 36, RAZOR_WIND
	dbw 40, PSYCHIC_M	
	dbw 45, DARK_PULSE	
	dbw 50, DRILL_PECK
	dbw 55, WILLOWISP
	dbw 60, PURSUIT
	dbw 60, HURRICANE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, CONFUSION
	dbw 10, NIGHT_SHADE
	dbw 15, TELEPORT
	dbw 20, CONFUSE_RAY
	dbw 24, PSYBEAM
	dbw 28, WING_ATTACK
	dbw 32, MEDITATE	
	dbw 36, RAZOR_WIND
	dbw 40, PSYCHIC_M	
	dbw 45, DARK_PULSE	
	dbw 50, DRILL_PECK
	dbw 55, WILLOWISP
	dbw 60, PURSUIT
	dbw 60, HURRICANE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

MareepEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FLAAFFY
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 8, THUNDERSHOCK
	dbw 12, COTTON_SPORE
	dbw 16, THUNDER_WAVE
	dbw 20, RECOVER
	dbw 24, SHOCK_WAVE
	dbw 28, LIGHT_SCREEN
	dbw 32, REFLECT
	dbw 36, CHARGE
	dbw 40, THUNDERBOLT
	dbw 45, FLASHCANNON
	dbw 50, RAIN_DANCE
	dbw 55, DRAGONBREATH
	dbw 60, THUNDER	
	dbw 65, POWER_GEM
	dbw 70, AURA_SPHERE
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, AMPHAROS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 8, THUNDERSHOCK
	dbw 12, COTTON_SPORE
	dbw 16, THUNDER_WAVE
	dbw 20, RECOVER
	dbw 24, SHOCK_WAVE
	dbw 28, LIGHT_SCREEN
	dbw 32, REFLECT
	dbw 36, CHARGE
	dbw 40, THUNDERBOLT
	dbw 45, FLASHCANNON
	dbw 50, RAIN_DANCE
	dbw 55, DRAGONBREATH
	dbw 60, THUNDER	
	dbw 65, POWER_GEM
	dbw 70, AURA_SPHERE
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, AMPHAROSX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 8, THUNDERSHOCK
	dbw 12, COTTON_SPORE
	dbw 16, THUNDER_WAVE
	dbw 20, RECOVER
	dbw 24, SHOCK_WAVE
	dbw 28, LIGHT_SCREEN
	dbw 32, REFLECT
	dbw 36, CHARGE
	dbw 40, THUNDERBOLT
	dbw 45, FLASHCANNON
	dbw 50, RAIN_DANCE
	dbw 55, DRAGONBREATH
	dbw 60, THUNDER	
	dbw 65, POWER_GEM
	dbw 70, AURA_SPHERE
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, PIXIE_DUST
	dbw 6, STUN_SPORE
	dbw 10, SWEET_SCENT
	dbw 14, POISONPOWDER
	dbw 20, SLEEP_POWDER
	dbw 24, MEGA_DRAIN	
	dbw 28, RAZOR_LEAF
	dbw 32, FAE_VOICE
	dbw 36, SYNTHESIS
	dbw 40, GIGA_DRAIN	
	dbw 45, FAERIEGLEAM
	dbw 50, PETAL_DANCE	
	dbw 55, SUNNY_DAY
	dbw 60, SOLARBEAM
	dbw 65, CALM_MIND
	dbw 70, LEECH_SEED
	db 0 ; no more level-up moves

MarillEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, AZUMARILL
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, DEFENSE_CURL
	dbw 8, TAIL_WHIP
	dbw 12, POUND
	dbw 16, ROLLOUT
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, DIZZY_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, BELLY_DRUM
	dbw 40, PLAY_ROUGH
	dbw 45, WATERFALL
	dbw 50, FAERIEGLEAM	
	dbw 55, DOUBLE_EDGE
	dbw 60, HYDRO_PUMP
	dbw 65, AMNESIA
	dbw 70, BULK_UP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, DEFENSE_CURL
	dbw 8, TAIL_WHIP
	dbw 12, POUND
	dbw 16, ROLLOUT
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, DIZZY_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, BELLY_DRUM
	dbw 40, PLAY_ROUGH
	dbw 45, WATERFALL
	dbw 50, FAERIEGLEAM	
	dbw 55, DOUBLE_EDGE
	dbw 60, HYDRO_PUMP
	dbw 65, AMNESIA
	dbw 70, BULK_UP
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ROCK_THROW
	dbw 1, MIMIC
	dbw 10, FLAIL
	dbw 14, LOW_KICK
	dbw 16, ROCK_THROW
	dbw 20, ROLLOUT
	dbw 24, MAGNITUDE
	dbw 28, CONVERSION
	dbw 32, SKETCH
	dbw 36, SKETCH
	dbw 40, ROCK_SLIDE
	dbw 45, PURSUIT
	dbw 50, BODY_SLAM
	dbw 55, EARTHQUAKE
	dbw 60, STONE_EDGE
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, MACH_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, CALM_MIND
	dbw 40, MIST_BALL
	dbw 45, BODY_SLAM
	dbw 50, BULK_UP	
	dbw 55, SCALD
	dbw 60, SUBMISSION
	dbw 65, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, SKIPLOOM
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, LEECH_SEED
	dbw 8, BULLET_SEED
	dbw 10, GUST
	dbw 12, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 20, COTTON_SPORE
	dbw 24, RAZOR_LEAF	
	dbw 28, SYNTHESIS
	dbw 32, RAZOR_WIND
	dbw 36, SUNNY_DAY
	dbw 40, SOLARBEAM
	dbw 45, SKY_ATTACK
	dbw 50, GIGA_DRAIN
	dbw 55, SLEEP_POWDER
	dbw 60, HURRICANE
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, JUMPLUFF
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, LEECH_SEED
	dbw 8, BULLET_SEED
	dbw 10, GUST
	dbw 12, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 20, COTTON_SPORE
	dbw 24, RAZOR_LEAF	
	dbw 28, SYNTHESIS
	dbw 32, RAZOR_WIND
	dbw 36, SUNNY_DAY
	dbw 40, SOLARBEAM
	dbw 45, SKY_ATTACK
	dbw 50, GIGA_DRAIN
	dbw 55, SLEEP_POWDER
	dbw 60, HURRICANE
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, LEECH_SEED
	dbw 8, BULLET_SEED
	dbw 10, GUST
	dbw 12, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 20, COTTON_SPORE
	dbw 24, RAZOR_LEAF	
	dbw 28, SYNTHESIS
	dbw 32, RAZOR_WIND
	dbw 36, SUNNY_DAY
	dbw 40, SOLARBEAM
	dbw 45, SKY_ATTACK
	dbw 50, GIGA_DRAIN
	dbw 55, SLEEP_POWDER
	dbw 60, HURRICANE
	db 0 ; no more level-up moves

AipomEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, AMBIPOM
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

SunkernEvosAttacks:
	dbww EVOLVE_ITEM, SUN_STONE, SUNFLORA
	dbbw EVOLVE_LEVEL, 30, SUNFLORA
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, GROWTH
	dbw 8, LEECH_SEED
	dbw 12, EMBER
	dbw 16, WILLOWISP
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF
	dbw 28, FIRE_SPIN	
	dbw 32, SUNNY_DAY
	dbw 40, SOLARBEAM
	dbw 45, FLAMETHROWER
	dbw 50, PETAL_DANCE
	dbw 55, STUN_SPORE
	dbw 60, FIRE_BLAST
	dbw 65, FRENZY_PLANT
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, GROWTH
	dbw 8, LEECH_SEED
	dbw 12, EMBER
	dbw 16, WILLOWISP
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF
	dbw 28, FIRE_SPIN	
	dbw 32, SUNNY_DAY
	dbw 40, SOLARBEAM
	dbw 45, FLAMETHROWER
	dbw 50, PETAL_DANCE
	dbw 55, STUN_SPORE
	dbw 60, FIRE_BLAST
	dbw 65, FRENZY_PLANT
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, YANMEGA
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

WooperEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, QUAGSIRE
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, POUND
	dbw 16, MIST
	dbw 20, MUD_SLAP
	dbw 24, MUD_SHOT
	dbw 28, WATER_PULSE
	dbw 32, GROWTH
	dbw 40, MUDDY_WATER
	dbw 42, EARTHPOWER
	dbw 45, EARTHQUAKE
	dbw 50, RAIN_DANCE
	dbw 55, HAZE
	dbw 60, HYDRO_PUMP
	dbw 65, REST
	dbw 70, FISSURE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, POUND
	dbw 16, MIST
	dbw 20, MUD_SLAP
	dbw 24, MUD_SHOT
	dbw 28, WATER_PULSE
	dbw 32, GROWTH
	dbw 40, MUDDY_WATER
	dbw 42, EARTHPOWER
	dbw 45, EARTHQUAKE
	dbw 50, RAIN_DANCE
	dbw 55, HAZE
	dbw 60, HYDRO_PUMP
	dbw 65, REST
	dbw 70, FISSURE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, QUICK_ATTACK
	dbw 20, CONFUSE_RAY
	dbw 24, PSYBEAM
	dbw 28, FAE_VOICE
	dbw 32, BATON_PASS
	dbw 36, MEDITATE
	dbw 40, PSYCHIC_M
	dbw 45, FAERIEGLEAM	
	dbw 50, MORNING_SUN
	dbw 55, MIST_BALL
	dbw 60, POWER_GEM
	dbw 65, RECOVER
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, QUICK_ATTACK
	dbw 20, CONFUSE_RAY
	dbw 24, NIGHT_SHADE
	dbw 28, SNARL
	dbw 32, BATON_PASS
	dbw 36, COSMIC_POWER
	dbw 40, PURSUIT
	dbw 45, MOONBLAST	
	dbw 50, TOXIC
	dbw 55, MOONLIGHT
	dbw 60, DARK_PULSE
	dbw 65, REST
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, HONCHKROW
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

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 6, TACKLE
	dbw 10, GROWL
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, PSYWAVE
	dbw 32, RECOVER
	dbw 36, AMNESIA
	dbw 40, PSYCHIC_M
	dbw 45, REST
	dbw 50, SCALD
	dbw 55, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 65, FUTURE_SIGHT
	dbw 70, RAIN_DANCE
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	dbbw EVOLVE_LEVEL, 41, MISMAGIUS
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

UnownEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, UNOWNX
	db 0 ; no more evolutions
	dbw 1, HIDDEN_POWER
	dbw 5, NIGHT_SHADE
	dbw 10, CURSE
	dbw 16, SHADOWSNEAK
	dbw 20, CONFUSE_RAY
	dbw 24, FAINT_ATTACK	
	dbw 28, SHADOW_CLAW
	dbw 32, WILLOWISP
	dbw 36, GLARE
	dbw 40, DARK_PULSE
	dbw 45, SHADOW_BALL
	dbw 50, COSMIC_POWER	
	dbw 55, PURSUIT
	dbw 60, SHADOW_FORCE
	dbw 65, RECOVER
	dbw 70, MEAN_LOOK
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COUNTER
	dbw 1, MIRROR_COAT
	dbw 1, SAFEGUARD
	dbw 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	dbbw EVOLVE_LEVEL, 41, FARIGIRAF
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 10, CONFUSION
	dbw 16, STOMP
	dbw 20, AGILITY
	dbw 24, PSYBEAM
	dbw 28, MAGNITUDE
	dbw 32, BATON_PASS
	dbw 36, THRASH
	dbw 40, PSYCHIC_M
	dbw 45, HYPER_VOICE
	dbw 50, CHARGE	
	dbw 55, BODY_SLAM
	dbw 60, DARK_PULSE
	dbw 65, FUTURE_SIGHT
	dbw 70, DOUBLE_EDGE
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, PROTECT
	dbw 8, SELFDESTRUCT
	dbw 16, SPIKES
	dbw 20, RAPID_SPIN
	dbw 24, BIDE
	dbw 28, SPIKE_CANNON
	dbw 32, LEECH_SEED
	dbw 36, EXPLOSION
	dbw 40, SIGNAL_BEAM	
	dbw 45, STUN_SPORE	
	dbw 50, ENDURE
	dbw 55, DOUBLE_EDGE
	dbw 60, TOXIC
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, PROTECT
	dbw 8, SELFDESTRUCT
	dbw 16, SPIKES
	dbw 20, RAPID_SPIN
	dbw 24, BIDE
	dbw 28, SPIKE_CANNON
	dbw 32, LEECH_SEED
	dbw 36, EXPLOSION
	dbw 40, SIGNAL_BEAM	
	dbw 45, STUN_SPORE	
	dbw 50, ENDURE
	dbw 55, DOUBLE_EDGE
	dbw 60, TOXIC
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 5, DEFENSE_CURL
	dbw 13, GLARE
	dbw 18, SPITE
	dbw 20, ROLLOUT
	dbw 24, FAINT_ATTACK
	dbw 28, DIG
	dbw 32, BULK_UP
	dbw 36, TAKE_DOWN
	dbw 40, EARTHQUAKE	
	dbw 45, COSMIC_POWER
	dbw 50, OUTRAGE
	dbw 55, POISON_JAB
	dbw 60, FISSURE
	db 0 ; no more level-up moves

GligarEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, GLISCOR
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

SteelixEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, STEELIXX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCREECH
	dbw 10, BIND
	dbw 12, ROCK_THROW
	dbw 16, RAGE
	dbw 20, CURSE
	dbw 24, ROCK_TOMB
	dbw 28, MAGNITUDE	
	dbw 32, SANDSTORM
	dbw 36, REST
	dbw 40, ROCK_SLIDE
	dbw 45, EARTHQUAKE
	dbw 50, BULK_UP
	dbw 55, IRON_TAIL
	dbw 60, FISSURE
	dbw 65, CRUNCH
	dbw 70, COSMIC_POWER
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, GRANBULL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCARY_FACE
	dbw 4, TAIL_WHIP
	dbw 8, CHARM
	dbw 13, BITE
	dbw 19, LICK
	dbw 25, ROAR
	dbw 28, FAINT_ATTACK
	dbw 32, POISON_FANG
	dbw 36, AGILITY
	dbw 40, CRUNCH
	dbw 45, PLAY_ROUGH
	dbw 50, BODY_SLAM
	dbw 55, REST
	dbw 60, SWORDS_DANCE
	dbw 65, THRASH
	dbw 70, PURSUIT
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCARY_FACE
	dbw 4, TAIL_WHIP
	dbw 8, CHARM
	dbw 13, BITE
	dbw 19, LICK
	dbw 25, ROAR
	dbw 28, FAINT_ATTACK
	dbw 32, POISON_FANG
	dbw 36, AGILITY
	dbw 40, CRUNCH
	dbw 45, PLAY_ROUGH
	dbw 50, BODY_SLAM
	dbw 55, REST
	dbw 60, SWORDS_DANCE
	dbw 65, THRASH
	dbw 70, PURSUIT
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions	
	dbw 1, TACKLE
	dbw 6, POISON_STING
	dbw 10, HARDEN
	dbw 12, MINIMIZE
	dbw 15, WATER_GUN
	dbw 20, SPIKES	
	dbw 24, BUBBLEBEAM
	dbw 28, TOXIC
	dbw 32, TAKE_DOWN
	dbw 36, REST
	dbw 40, SLUDGE_BOMB
	dbw 45, MIST_BALL
	dbw 50, AMNESIA
	dbw 55, SLUDGE_WAVE
	dbw 60, HYDRO_PUMP
	dbw 65, RECOVER
	dbw 70, ACID_ARMOR	
	db 0 ; no more level-up moves

ScizorEvosAttacks:
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

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, WITHDRAW
	dbw 9, WRAP
	dbw 14, ENCORE
	dbw 20, ROLLOUT
	dbw 24, SAFEGUARD
	dbw 28, BIDE
	dbw 32, REST
	dbw 36, CURSE
	dbw 40, AMNESIA
	dbw 45, ROCK_SLIDE
	dbw 50, SIGNAL_BEAM
	dbw 55, COSMIC_POWER
	dbw 60, LEECH_SEED
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, HERACROSSX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 10, ENDURE
	dbw 16, COUNTER
	dbw 20, MACH_PUNCH
	dbw 24, TWINEEDLE
	dbw 28, HORN_ATTACK	
	dbw 32, BRICK_BREAK
	dbw 36, SEISMIC_TOSS
	dbw 40, CROSS_CHOP
	dbw 45, SHADOW_CLAW
	dbw 50, PURSUIT
	dbw 55, SWORDS_DANCE
	dbw 60, MEGAHORN
	dbw 65, BULK_UP
	dbw 70, SUBMISSION
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, WEAVILE
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

TeddiursaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 8, LICK
	dbw 12, POUND
	dbw 15, FURY_SWIPES
	dbw 24, FAINT_ATTACK
	dbw 28, REST
	dbw 32, SNORE
	dbw 36, CRUSH_CLAW
	dbw 40, SLASH	
	dbw 45, CRUNCH
	dbw 50, BULK_UP
	dbw 55, EARTHQUAKE
	dbw 60, THRASH
	dbw 65, OUTRAGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	dbbw EVOLVE_LEVEL, 48, URSALUNA
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 8, LICK
	dbw 12, POUND
	dbw 15, FURY_SWIPES
	dbw 24, FAINT_ATTACK
	dbw 28, REST
	dbw 32, SNORE
	dbw 36, CRUSH_CLAW
	dbw 40, SLASH	
	dbw 45, CRUNCH
	dbw 50, BULK_UP
	dbw 55, EARTHQUAKE
	dbw 60, THRASH
	dbw 65, OUTRAGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGCARGO
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 8, EMBER
	dbw 15, ROCK_THROW
	dbw 20, SUNNY_DAY
	dbw 24, ANCIENTPOWER
	dbw 24, FIRE_SPIN
	dbw 32, SANDSTORM
	dbw 36, COSMIC_POWER
	dbw 40, FLAMETHROWER
	dbw 45, POWER_GEM
	dbw 50, PROTECT
	dbw 55, SKULL_BASH
	dbw 60, FIRE_BLAST
	dbw 65, ROCK_SLIDE
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, MAGCARGOX
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 8, EMBER
	dbw 15, ROCK_THROW
	dbw 20, SUNNY_DAY
	dbw 24, ANCIENTPOWER
	dbw 24, FIRE_SPIN
	dbw 32, SANDSTORM
	dbw 36, COSMIC_POWER
	dbw 40, FLAMETHROWER
	dbw 45, POWER_GEM
	dbw 50, PROTECT
	dbw 55, SKULL_BASH
	dbw 60, FIRE_BLAST
	dbw 65, ROCK_SLIDE
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PILOSWINE
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

PiloswineEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, MAMOSWINE
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

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, DEFENSE_CURL
	dbw 16, ROLLOUT	
	dbw 20, RECOVER
	dbw 24, ICY_WIND
	dbw 28, BUBBLEBEAM
	dbw 32, ANCIENTPOWER
	dbw 36, COSMIC_POWER
	dbw 40, POWER_GEM
	dbw 45, MIRROR_COAT
	dbw 50, MIST_BALL
	dbw 55, RAIN_DANCE
	dbw 60, HYDRO_PUMP
	dbw 65, RAPID_SPIN
	dbw 70, REST	
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, OCTILLERY
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

OctilleryEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, OCTILLERY2
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

DelibirdEvosAttacks:
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
	dbw 40, LIGHT_SCREEN
	dbw 45, ICICLE_CRASH
	dbw 50, BELLY_DRUM
	dbw 55, BATON_PASS
	dbw 60, BLIZZARD
	dbw 65, SKY_ATTACK
	dbw 70, HURRICANE	
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, BUBBLE
	dbw 10, GUST
	dbw 16, CLAMP
	dbw 20, WING_ATTACK
	dbw 24, BUBBLEBEAM
	dbw 28, CONFUSE_RAY
	dbw 32, RAZOR_WIND
	dbw 36, MIST_BALL
	dbw 40, ICE_BEAM
	dbw 45, RAIN_DANCE
	dbw 50, MEDITATE
	dbw 55, HYDRO_PUMP
	dbw 60, SKY_ATTACK
	dbw 70, HURRICANE	
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, SKARMORY2
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

HoundourEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, HOUNDOOM
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 7, ROAR
	dbw 12, SMOG
	dbw 16, BITE
	dbw 20, SHARPEN
	dbw 24, SNARL
	dbw 28, FIRE_FANG
	dbw 32, SLAM
	dbw 36, SWIFT
	dbw 40, FLAME_WHEEL
	dbw 45, DARK_PULSE
	dbw 50, FLAMETHROWER
	dbw 55, PURSUIT
	dbw 60, FIRE_BLAST
	dbw 65, CRUNCH
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, HOUNDOOMX
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 7, ROAR
	dbw 12, SMOG
	dbw 16, BITE
	dbw 20, SHARPEN
	dbw 24, SNARL
	dbw 28, FIRE_FANG
	dbw 32, SLAM
	dbw 36, SWIFT
	dbw 40, FLAME_WHEEL
	dbw 45, DARK_PULSE
	dbw 50, FLAMETHROWER
	dbw 55, PURSUIT
	dbw 60, FIRE_BLAST
	dbw 65, CRUNCH
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 8, SMOKESCREEN
	dbw 12, TWISTER
	dbw 16, WATER_GUN
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 32, DRAGON_RAGE	
	dbw 36, RAIN_DANCE
	dbw 40, DRAGONBREATH
	dbw 45, MIST_BALL
	dbw 50, RECOVER
	dbw 55, AGILITY
	dbw 60, HYDRO_PUMP
	dbw 65, AMNESIA	
	dbw 70, OUTRAGE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 5, SAND_ATTACK
	dbw 9, DEFENSE_CURL
	dbw 16, MUD_SLAP
	dbw 20, ROLLOUT
	dbw 24, MAGNITUDE
	dbw 28, ENDURE
	dbw 32, RAPID_SPIN
	dbw 36, BULK_UP
	dbw 40, EARTHQUAKE
	dbw 45, BODY_SLAM
	dbw 50, PLAY_ROUGH
	dbw 55, MEGAHORN
	dbw 60, FISSURE
	dbw 65, SANDSTORM
	dbw 70, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 5, SAND_ATTACK
	dbw 9, DEFENSE_CURL
	dbw 16, MUD_SLAP
	dbw 20, ROLLOUT
	dbw 24, MAGNITUDE
	dbw 28, ENDURE
	dbw 32, RAPID_SPIN
	dbw 36, BULK_UP
	dbw 40, EARTHQUAKE
	dbw 45, BODY_SLAM
	dbw 50, PLAY_ROUGH
	dbw 55, MEGAHORN
	dbw 60, FISSURE
	dbw 65, SANDSTORM
	dbw 70, DOUBLE_EDGE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	dbww EVOLVE_ITEM, UP_GRADE, PORYGONZ
	dbbw EVOLVE_LEVEL, 42, PORYGONZ
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

StantlerEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, WYRDEER
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
	dbw 70, EARTHPOWER
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SKETCH
	dbw 10, SKETCH
	dbw 15, SKETCH
	dbw 20, SKETCH
	dbw 25, SKETCH
	dbw 30, SKETCH
	dbw 35, SKETCH
	dbw 40, SKETCH
	dbw 45, SKETCH
	dbw 50, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	dbbbw EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	dbbbw EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	dbbbw EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SHARPEN
	dbw 5, LOW_KICK
	dbw 10, MACH_PUNCH
	dbw 16, RAPID_SPIN
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 7, AGILITY
	dbw 13, MACH_PUNCH
	dbw 20, DIZZY_PUNCH
	dbw 24, ROLLING_KICK
	dbw 28, FAINT_ATTACK
	dbw 32, DIG
	dbw 36, PURSUIT
	dbw 40, TRIPLE_KICK
	dbw 45, BULK_UP
	dbw 50, COUNTER
	dbw 55, BATON_PASS
	dbw 60, DETECT
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, LICK
	dbw 9, LOVELY_KISS
	dbw 13, POWDER_SNOW
	dbw 18, DOUBLESLAP
	dbw 24, ICE_PUNCH
	dbw 28, PSYBEAM
	dbw 32, ICY_WIND
	dbw 36, PERISH_SONG
	dbw 40, PSYCHIC_M
	dbw 45, ICE_BEAM
	dbw 50, CALM_MIND
	dbw 55, HYPER_VOICE
	dbw 60, BLIZZARD
	dbw 55, FUTURE_SIGHT
	dbw 70, MEDITATE
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTABUZZ
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

MagbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGMAR
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

MiltankEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 5, DEFENSE_CURL
	dbw 8, RAGE
	dbw 12, SCARY_FACE
	dbw 16, MILK_DRINK
	dbw 20, ROLLOUT
	dbw 24, STOMP	
	dbw 28, MAGNITUDE
	dbw 32, ZEN_HEADBUTT
	dbw 36, HEAL_BELL	
	dbw 40, BODY_SLAM
	dbw 45, PLAY_ROUGH
	dbw 50, BULK_UP
	dbw 55, OUTRAGE
	dbw 60, EARTHQUAKE	
	dbw 65, DOUBLE_EDGE
	dbw 70, COSMIC_POWER
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 5, GROWL
	dbw 9, TAIL_WHIP
	dbw 13, SOFTBOILED
	dbw 17, DOUBLESLAP
	dbw 23, MINIMIZE
	dbw 29, SING
	dbw 32, EGG_BOMB
	dbw 36, CALM_MIND
	dbw 40, HYPER_VOICE
	dbw 42, LIGHT_SCREEN
	dbw 45, REFLECT
	dbw 50, DOUBLE_EDGE
	dbw 55, BULK_UP
	dbw 60, MOONBLAST
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, TACKLE	
	dbw 16, ROAR
	dbw 24, SHOCK_WAVE
	dbw 28, FAINT_ATTACK
	dbw 32, THUNDER_WAVE
	dbw 36, REFLECT
	dbw 40, THUNDERBOLT
	dbw 45, DRAGONBREATH
	dbw 50, EXTREMESPEED
	dbw 55, AMNESIA	
	dbw 60, THUNDER
	dbw 65, RAIN_DANCE
	dbw 70, CRUNCH	
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, TACKLE
	dbw 16, ROAR
	dbw 24, FIRE_FANG	
	dbw 28, POISON_FANG
	dbw 32, SUNNY_DAY
	dbw 36, CRUNCH
	dbw 40, FLAME_WHEEL	
	dbw 45, PURSUIT
	dbw 50, SOLARBEAM
	dbw 55, EARTHQUAKE
	dbw 60, SACRED_FIRE	
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TACKLE
	dbw 16, ROAR
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 32, SAFEGUARD
	dbw 36, RECOVER
	dbw 40, MIST_BALL
	dbw 45, RAIN_DANCE
	dbw 50, MIST
	dbw 55, MIRROR_COAT
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, SANDSTORM
	dbw 12, ROCK_THROW
	dbw 15, SCREECH
	dbw 20, ROLLOUT
	dbw 24, FAINT_ATTACK
	dbw 28, SCARY_FACE
	dbw 32, SPIKES
	dbw 36, BULK_UP
	dbw 40, CRUNCH
	dbw 45, ROCK_SLIDE
	dbw 50, EARTHQUAKE
	dbw 55, OUTRAGE
	dbw 60, STONE_EDGE
	dbw 65, FISSURE
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, SANDSTORM
	dbw 12, ROCK_THROW
	dbw 15, SCREECH
	dbw 20, ROLLOUT
	dbw 24, FAINT_ATTACK
	dbw 28, SCARY_FACE
	dbw 32, SPIKES
	dbw 36, BULK_UP
	dbw 40, CRUNCH
	dbw 45, ROCK_SLIDE
	dbw 50, EARTHQUAKE
	dbw 55, OUTRAGE
	dbw 60, STONE_EDGE
	dbw 65, FISSURE
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, TYRANITARX
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, SANDSTORM
	dbw 12, ROCK_THROW
	dbw 15, SCREECH
	dbw 20, ROLLOUT
	dbw 24, FAINT_ATTACK
	dbw 28, SCARY_FACE
	dbw 32, SPIKES
	dbw 36, BULK_UP
	dbw 40, CRUNCH
	dbw 45, ROCK_SLIDE
	dbw 50, EARTHQUAKE
	dbw 55, OUTRAGE
	dbw 60, STONE_EDGE
	dbw 65, FISSURE
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, WATER_GUN
	dbw 11, SAFEGUARD
	dbw 22, WING_ATTACK
	dbw 27, BUBBLEBEAM
	dbw 33, ANCIENTPOWER
	dbw 37, RECOVER
	dbw 40, MIST_BALL
	dbw 45, AEROBLAST
	dbw 50, RAIN_DANCE
	dbw 55, HYDRO_PUMP
	dbw 60, PSYCHIC_M
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, EMBER
	dbw 11, SAFEGUARD
	dbw 22, WING_ATTACK
	dbw 27, FIRE_FANG
	dbw 33, ANCIENTPOWER
	dbw 37, RECOVER
	dbw 40, FLAME_WHEEL
	dbw 45, SACRED_FIRE
	dbw 50, SUNNY_DAY
	dbw 55, SKY_ATTACK
	dbw 60, EARTHQUAKE
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEECH_SEED
	dbw 1, PIXIE_DUST
	dbw 8, VINE_WHIP
	dbw 10, POISONPOWDER
	dbw 15, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 20, ANCIENTPOWER
	dbw 24, RAZOR_LEAF
	dbw 28, FAE_VOICE	
	dbw 32, PSYBEAM
	dbw 36, MOONBLAST
	dbw 40, RECOVER
	dbw 42, BATON_PASS
	dbw 45, HEAL_BELL
	dbw 48, SAFEGUARD
	dbw 50, CALM_MIND
	dbw 52, PETAL_DANCE
	dbw 55, FUTURE_SIGHT
	dbw 60, PERISH_SONG
	db 0 ; no more level-up moves

MunchlaxEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SNORLAX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LICK
	dbw 8, AMNESIA
	dbw 15, DEFENSE_CURL
	dbw 20, STOMP
	dbw 24, HEADBUTT
	dbw 28, SNORE
	dbw 32, REST
	dbw 36, CRUSH_CLAW
	dbw 40, BODY_SLAM
	dbw 45, BULK_UP
	dbw 50, BELLY_DRUM
	dbw 55, OUTRAGE
	dbw 60, EARTHQUAKE
	dbw 60, HYPER_BEAM
	dbw 65, DOUBLE_EDGE
	dbw 70, CRUNCH
	db 0 ; no more level-up moves

ENDSECTION
