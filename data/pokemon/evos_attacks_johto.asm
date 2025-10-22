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
	dbw 32, BODY_SLAM	
	dbw 36, SAFEGUARD
	dbw 40, GROWTH
	dbw 45, DRAGONBREATH
	dbw 50, GIGA_DRAIN
	dbw 55, SUNNY_DAY
	dbw 60, FRENZY_PLANT
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
	dbw 32, BODY_SLAM	
	dbw 36, SAFEGUARD
	dbw 40, GROWTH
	dbw 45, DRAGONBREATH
	dbw 50, GIGA_DRAIN
	dbw 55, SUNNY_DAY
	dbw 60, FRENZY_PLANT
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
	dbw 32, BODY_SLAM	
	dbw 36, SAFEGUARD
	dbw 40, GROWTH
	dbw 45, DRAGONBREATH
	dbw 50, GIGA_DRAIN
	dbw 55, SUNNY_DAY
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, QUILAVA
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

QuilavaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TYPHLOSION
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

TyphlosionEvosAttacks:
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

TotodileEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, CROCONAW
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

CroconawEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, FERALIGATR
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

FeraligatrEvosAttacks:
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

SentretEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FURRET
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
	dbw 36, CRUNCH
	dbw 40, SUPER_FANG
	dbw 42, AGILITY
	dbw 45, EXTREMESPEED
	dbw 50, IRON_TAIL
	dbw 55, SWORDS_DANCE
	dbw 60, DOUBLE_EDGE
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
	dbw 20, HYPER_FANG
	dbw 24, SCARY_FACE
	dbw 28, DIG
	dbw 32, BULK_UP
	dbw 36, CRUNCH
	dbw 40, SUPER_FANG
	dbw 42, AGILITY
	dbw 45, EXTREMESPEED
	dbw 50, IRON_TAIL
	dbw 55, SWORDS_DANCE
	dbw 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, NOCTOWL
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
	dbw 50, GROWTH
	dbw 55, HURRICANE
	dbw 60,FUTURE_SIGHT
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, NOCTOWL2
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
	dbw 50, GROWTH
	dbw 55, HURRICANE
	dbw 60, FUTURE_SIGHT
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
	dbw 32, CRUNCH
	dbw 36, SLUDGE_BOMB
	dbw 40, AGILITY
	dbw 42, HAZE
	dbw 45, EXTREMESPEED
	dbw 50, BELLY_DRUM
	dbw 55, SKY_ATTACK
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, LANTURN
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, THUNDER_WAVE
	dbw 5, SUPERSONIC
	dbw 12, THUNDERSHOCK
	dbw 16, WATER_GUN
	dbw 24, WATER_PULSE
	dbw 26, SHOCK_WAVE
	dbw 28, CONFUSE_RAY
	dbw 32, CHARGE
	dbw 36, THUNDERBOLT
	dbw 40, SIGNAL_BEAM
	dbw 42, HYDRO_PUMP
	dbw 44, RAIN_DANCE
	dbw 48, THUNDER
	dbw 52, PROTECT
	dbw 56, POWER_GEM
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, THUNDER_WAVE
	dbw 5, SUPERSONIC
	dbw 12, THUNDERSHOCK
	dbw 16, WATER_GUN
	dbw 24, WATER_PULSE
	dbw 26, SHOCK_WAVE
	dbw 28, CONFUSE_RAY
	dbw 32, CHARGE
	dbw 36, THUNDERBOLT
	dbw 40, SIGNAL_BEAM
	dbw 42, HYDRO_PUMP
	dbw 44, RAIN_DANCE
	dbw 48, THUNDER
	dbw 52, PROTECT
	dbw 56, POWER_GEM
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

PichuEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	dbbw EVOLVE_LEVEL, 20, PIKACHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 11, QUICK_ATTACK
	dbw 15, DOUBLE_TEAM
	dbw 20, SLAM
	dbw 26, SHOCK_WAVE
	dbw 31, AGILITY
	dbw 36, THUNDERBOLT
	dbw 40, FAERIEGLEAM
	dbw 42, MEDITATE
	dbw 45, THUNDER
	dbw 50, LIGHT_SCREEN
	dbw 55, GROWTH
	dbw 60, VOLT_TACKLE
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	dbbw EVOLVE_LEVEL, 20, CLEFAIRY
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 4, ENCORE
	dbw 8, SING
	dbw 12, DOUBLESLAP	
	dbw 18, MINIMIZE
	dbw 20, METRONOME
	dbw 22, DEFENSE_CURL
	dbw 24, DRAININGKISS
	dbw 30, GLARE
	dbw 36, MOONBLAST
	dbw 38, MOONLIGHT
	dbw 40, REFLECT
	dbw 42, CALM_MIND
	dbw 45, METEOR_MASH
	dbw 50, COSMIC_POWER	
	dbw 55, PLAY_ROUGH
	dbw 60, MEDITATE
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
	dbw 32, COSMIC_POWER
	dbw 36, MOONBLAST
	dbw 40, REST
	dbw 45, BULK_UP
	dbw 50, CALM_MIND
	dbw 55, BODY_SLAM
	dbw 60, DOUBLE_EDGE
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
	dbw 36, MOONBLAST
	dbw 40, RAZOR_WIND
	dbw 42, CALM_MIND
	dbw 45, PLAY_ROUGH
	dbw 50, MIST_BALL
	dbw 55, OUTRAGE
	dbw 60, LUSTER_PURGE
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
	dbw 36, MOONBLAST
	dbw 40, RAZOR_WIND
	dbw 42, CALM_MIND
	dbw 45, PLAY_ROUGH
	dbw 50, MIST_BALL
	dbw 55, OUTRAGE
	dbw 60, LUSTER_PURGE
	db 0 ; no more level-up moves

NatuEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, XATU
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, CONFUSION
	dbw 10, NIGHT_SHADE
	dbw 15, TELEPORT
	dbw 20, PSYBEAM
	dbw 24, WING_ATTACK
	dbw 28, CONFUSE_RAY
	dbw 32, RAZOR_WIND
	dbw 36, PSYCHIC_M	
	dbw 40, DARK_PULSE
	dbw 42, MEDITATE	
	dbw 45, DRILL_PECK
	dbw 50, WILLOWISP
	dbw 55, PURSUIT
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, CONFUSION
	dbw 10, NIGHT_SHADE
	dbw 15, TELEPORT
	dbw 20, PSYBEAM
	dbw 24, WING_ATTACK
	dbw 28, CONFUSE_RAY
	dbw 32, RAZOR_WIND
	dbw 36, PSYCHIC_M	
	dbw 40, DARK_PULSE
	dbw 42, MEDITATE	
	dbw 45, DRILL_PECK
	dbw 50, WILLOWISP
	dbw 55, PURSUIT
	dbw 60, FUTURE_SIGHT
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
	dbw 26, LIGHT_SCREEN
	dbw 30, REFLECT
	dbw 32, THUNDERBOLT
	dbw 36, FLASHCANNON
	dbw 40, RAIN_DANCE
	dbw 42, CHARGE
	dbw 45, THUNDER	
	dbw 50, DRAGONBREATH
	dbw 55, POWER_GEM
	dbw 60, AURA_SPHERE
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
	dbw 26, LIGHT_SCREEN
	dbw 30, REFLECT
	dbw 32, THUNDERBOLT
	dbw 36, FLASHCANNON
	dbw 40, RAIN_DANCE
	dbw 42, CHARGE
	dbw 45, THUNDER	
	dbw 50, DRAGONBREATH
	dbw 55, POWER_GEM
	dbw 60, AURA_SPHERE
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
	dbw 26, LIGHT_SCREEN
	dbw 30, REFLECT
	dbw 32, THUNDERBOLT
	dbw 36, FLASHCANNON
	dbw 40, RAIN_DANCE
	dbw 42, CHARGE
	dbw 45, THUNDER	
	dbw 50, DRAGONBREATH
	dbw 55, POWER_GEM
	dbw 60, AURA_SPHERE
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, PIXIE_DUST
	dbw 6, STUN_SPORE
	dbw 10, SWEET_SCENT
	dbw 14, POISONPOWDER
	dbw 16, MEGA_DRAIN
	dbw 18, SLEEP_POWDER
	dbw 24, RAZOR_LEAF
	dbw 26, FAE_VOICE
	dbw 30, SYNTHESIS
	dbw 36, GIGA_DRAIN	
	dbw 40, PETAL_DANCE
	dbw 42, FAERIEGLEAM
	dbw 45, SUNNY_DAY
	dbw 50, SOLARBEAM
	dbw 55, CALM_MIND
	dbw 60, LEECH_SEED
	db 0 ; no more level-up moves

MarillEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, AZUMARILL
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 3, DEFENSE_CURL
	dbw 6, TAIL_WHIP
	dbw 10, POUND
	dbw 16, ROLLOUT
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, DIZZY_PUNCH
	dbw 30, RAIN_DANCE
	dbw 32, FAERIEGLEAM
	dbw 36, BELLY_DRUM	
	dbw 40, DOUBLE_EDGE
	dbw 42, PERISH_SONG
	dbw 45, AMNESIA
	dbw 50, HYDRO_PUMP
	dbw 55, BULK_UP
	dbw 60, ACID_ARMOR
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 3, DEFENSE_CURL
	dbw 6, TAIL_WHIP
	dbw 10, POUND
	dbw 16, ROLLOUT
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, DIZZY_PUNCH
	dbw 30, RAIN_DANCE
	dbw 32, FAERIEGLEAM
	dbw 36, BELLY_DRUM	
	dbw 40, DOUBLE_EDGE
	dbw 42, PERISH_SONG
	dbw 45, AMNESIA
	dbw 50, HYDRO_PUMP
	dbw 55, BULK_UP
	dbw 60, ACID_ARMOR
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ROCK_THROW
	dbw 1, MIMIC
	dbw 10, FLAIL
	dbw 14, LOW_KICK
	dbw 16, ROCK_THROW
	dbw 20, ROLLOUT
	dbw 25, MAGNITUDE
	dbw 28, SKETCH
	dbw 36, ROCK_SLIDE
	dbw 40, PURSUIT
	dbw 42, BODY_SLAM
	dbw 45, SKETCH
	dbw 50, STONE_EDGE
	dbw 55, EARTHQUAKE
	dbw 60, SKETCH
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 27, MACH_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, CALM_MIND
	dbw 40, MIST_BALL
	dbw 42, BODY_SLAM
	dbw 45, HYDRO_PUMP
	dbw 50, PERISH_SONG
	dbw 55, GROWTH
	dbw 60, BELLY_DRUM
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, SKIPLOOM
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, LEECH_SEED
	dbw 8, BULLET_SEED
	dbw 10, GUST
	dbw 13, POISONPOWDER
	dbw 15, STUN_SPORE
	dbw 17, SLEEP_POWDER
	dbw 20, RAZOR_LEAF
	dbw 25, COTTON_SPORE
	dbw 28, SYNTHESIS
	dbw 32, RAZOR_WIND
	dbw 36, SUNNY_DAY
	dbw 40, SOLARBEAM
	dbw 42, SKY_ATTACK
	dbw 45, GIGA_DRAIN
	dbw 50, CHARGE
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, JUMPLUFF
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, LEECH_SEED
	dbw 8, BULLET_SEED
	dbw 10, GUST
	dbw 13, POISONPOWDER
	dbw 15, STUN_SPORE
	dbw 17, SLEEP_POWDER
	dbw 20, RAZOR_LEAF
	dbw 25, COTTON_SPORE
	dbw 28, SYNTHESIS
	dbw 32, RAZOR_WIND
	dbw 36, SUNNY_DAY
	dbw 40, SOLARBEAM
	dbw 42, SKY_ATTACK
	dbw 45, GIGA_DRAIN
	dbw 50, CHARGE
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, LEECH_SEED
	dbw 8, BULLET_SEED
	dbw 10, GUST
	dbw 13, POISONPOWDER
	dbw 15, STUN_SPORE
	dbw 17, SLEEP_POWDER
	dbw 20, RAZOR_LEAF
	dbw 25, COTTON_SPORE
	dbw 28, SYNTHESIS
	dbw 32, RAZOR_WIND
	dbw 36, SUNNY_DAY
	dbw 40, SOLARBEAM
	dbw 42, SKY_ATTACK
	dbw 45, GIGA_DRAIN
	dbw 50, CHARGE
	db 0 ; no more level-up moves

AipomEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, AMBIPOM
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

SunkernEvosAttacks:
	dbww EVOLVE_ITEM, SUN_STONE, SUNFLORA
	dbbw EVOLVE_LEVEL, 30, SUNFLORA
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, GROWTH
	dbw 8, LEECH_SEED
	dbw 12, EMBER
	dbw 16, WILLOWISP
	dbw 20, RAZOR_LEAF
	dbw 24, FIRE_SPIN
	dbw 28, SYNTHESIS
	dbw 32, SUNNY_DAY
	dbw 36, SOLARBEAM
	dbw 40, FLAMETHROWER
	dbw 42, PETAL_DANCE
	dbw 45, STUN_SPORE
	dbw 50, FIRE_BLAST
	dbw 55, FRENZY_PLANT
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, GROWTH
	dbw 8, LEECH_SEED
	dbw 12, EMBER
	dbw 16, WILLOWISP
	dbw 20, RAZOR_LEAF
	dbw 24, FIRE_SPIN
	dbw 28, SYNTHESIS
	dbw 32, SUNNY_DAY
	dbw 36, SOLARBEAM
	dbw 40, FLAMETHROWER
	dbw 42, PETAL_DANCE
	dbw 45, STUN_SPORE
	dbw 50, FIRE_BLAST
	dbw 55, FRENZY_PLANT
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, YANMEGA
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

WooperEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, QUAGSIRE
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, POUND
	dbw 20, MUD_SLAP
	dbw 24, MUD_SHOT
	dbw 28, AMNESIA
	dbw 32, GROWTH
	dbw 36, MUDDY_WATER
	dbw 40, EARTHQUAKE
	dbw 40, RAIN_DANCE
	dbw 42, MIST
	dbw 45, HYDRO_PUMP
	dbw 50, HAZE
	dbw 55, REST
	dbw 60, FISSURE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, POUND
	dbw 20, MUD_SLAP
	dbw 24, MUD_SHOT
	dbw 28, AMNESIA
	dbw 32, GROWTH
	dbw 36, MUDDY_WATER
	dbw 40, EARTHQUAKE
	dbw 40, RAIN_DANCE
	dbw 42, MIST
	dbw 45, HYDRO_PUMP
	dbw 50, HAZE
	dbw 55, REST
	dbw 60, FISSURE
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
	dbw 36, PSYCHIC_M
	dbw 40, FAERIEGLEAM
	dbw 42, MEDITATE
	dbw 45, MORNING_SUN
	dbw 50, MIST_BALL
	dbw 55, POWER_GEM
	dbw 60, FUTURE_SIGHT
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
	dbw 28, FAINT_ATTACK
	dbw 32, BATON_PASS
	dbw 36, PURSUIT
	dbw 40, MOONBLAST
	dbw 42, COSMIC_POWER
	dbw 45, TOXIC
	dbw 50, MOONLIGHT
	dbw 55, DARK_PULSE
	dbw 60, SUBSTITUTE
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, HONCHKROW
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

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, GROWL
	dbw 12, WATER_GUN
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, PSYWAVE
	dbw 32, ZEN_HEADBUTT
	dbw 36, PSYCHIC_M
	dbw 40, REST
	dbw 42, CALM_MIND
	dbw 45, SCALD
	dbw 50, HYDRO_PUMP
	dbw 55, FIRE_BLAST
	dbw 60, REST
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	dbbw EVOLVE_LEVEL, 41, MISMAGIUS
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

UnownEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HIDDEN_POWER
	dbw 5, NIGHT_SHADE
	dbw 10, CURSE
	dbw 15, FAINT_ATTACK
	dbw 20, CONFUSE_RAY
	dbw 22, SHADOWSNEAK
	dbw 25, PSYBEAM
	dbw 30, WILLOWISP
	dbw 32, DARK_PULSE
	dbw 36, SHADOW_BALL
	dbw 40, COSMIC_POWER
	dbw 42, DOUBLE_TEAM
	dbw 45, DESTINY_BOND
	dbw 50, GLARE
	dbw 55, RECOVER
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COUNTER
	dbw 1, MIRROR_COAT
	dbw 1, SAFEGUARD
	dbw 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 10, CONFUSION
	dbw 16, STOMP
	dbw 20, AGILITY
	dbw 24, PSYBEAM
	dbw 28, MAGNITUDE
	dbw 30, BATON_PASS
	dbw 32, THRASH
	dbw 36, PSYCHIC_M
	dbw 40, HYPER_VOICE
	dbw 42, CHARGE	
	dbw 45, BODY_SLAM
	dbw 50, DARK_PULSE
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, PROTECT
	dbw 8, SELFDESTRUCT
	dbw 15, SPIKES
	dbw 20, RAPID_SPIN
	dbw 24, BIDE
	dbw 28, SPIKE_CANNON
	dbw 32, SIGNAL_BEAM
	dbw 36, EXPLOSION
	dbw 40, SPIKES
	dbw 42, LEECH_SEED
	dbw 45, STUN_SPORE
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, PROTECT
	dbw 8, SELFDESTRUCT
	dbw 15, SPIKES
	dbw 20, RAPID_SPIN
	dbw 24, BIDE
	dbw 28, SPIKE_CANNON
	dbw 32, SIGNAL_BEAM
	dbw 36, EXPLOSION
	dbw 40, SPIKES
	dbw 42, LEECH_SEED
	dbw 45, STUN_SPORE
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 5, DEFENSE_CURL
	dbw 13, GLARE
	dbw 18, SPITE
	dbw 20, ROLLOUT
	dbw 26, FAINT_ATTACK
	dbw 30, DIG
	dbw 32, EARTHQUAKE
	dbw 36, TAKE_DOWN
	dbw 40, SCREECH
	dbw 42, BULK_UP
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

SteelixEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, STEELIXX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCREECH
	dbw 10, BIND
	dbw 14, ROCK_THROW
	dbw 18, RAGE
	dbw 22, ROCK_TOMB
	dbw 26, MAGNITUDE	
	dbw 30, SANDSTORM
	dbw 36, ROCK_SLIDE
	dbw 40, EARTHQUAKE
	dbw 42, BULK_UP
	dbw 45, IRON_TAIL
	dbw 50, REST
	dbw 55, COSMIC_POWER
	dbw 60, FISSURE
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
	dbw 36, CRUNCH
	dbw 40, PLAY_ROUGH
	dbw 42, BODY_SLAM
	dbw 45, AGILITY
	dbw 50, REST
	dbw 55, THRASH
	dbw 60, SWORDS_DANCE
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
	dbw 36, CRUNCH
	dbw 40, PLAY_ROUGH
	dbw 42, BODY_SLAM
	dbw 45, AGILITY
	dbw 50, REST
	dbw 55, THRASH
	dbw 60, SWORDS_DANCE
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPIKES
	dbw 1, TACKLE
	dbw 6, POISON_STING
	dbw 10, HARDEN
	dbw 12, MINIMIZE
	dbw 15, WATER_GUN
	dbw 20, PIN_MISSILE
	dbw 24, BUBBLEBEAM
	dbw 28, TOXIC
	dbw 32, TAKE_DOWN
	dbw 36, ICE_BEAM
	dbw 40, HYDRO_PUMP
	dbw 42, REST
	dbw 45, AMNESIA
	dbw 50, SLUDGE_WAVE
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, SCIZORX
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, STRING_SHOT
	dbw 6, FOCUS_ENERGY
	dbw 12, BITE
	dbw 18, FALSE_SWIPE
	dbw 22, TWINEEDLE
	dbw 24, AGILITY
	dbw 30, PSYCHO_CUT
	dbw 36, VICEGRIP
	dbw 40, BULLET_PUNCH
	dbw 40, SLASH
	dbw 42, SWORDS_DANCE
	dbw 48, DOUBLE_TEAM
	dbw 52, LEAF_BLADE
	dbw 56, SHADOW_CLAW
	dbw 60, GUILLOTINE	
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, WITHDRAW
	dbw 9, WRAP
	dbw 14, ENCORE
	dbw 20, ROLLOUT
	dbw 23, SAFEGUARD
	dbw 28, BIDE
	dbw 30, REST
	dbw 36, CURSE
	dbw 40, AMNESIA
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, HERACROSSX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 10, ENDURE
	dbw 16, COUNTER
	dbw 22, MACH_PUNCH
	dbw 25, TWINEEDLE
	dbw 28, HORN_ATTACK	
	dbw 32, BRICK_BREAK
	dbw 36, SEISMIC_TOSS
	dbw 40, CROSS_CHOP
	dbw 42, SHADOW_CLAW
	dbw 45, PURSUIT
	dbw 50, SWORDS_DANCE
	dbw 55, PURSUIT
	dbw 60, MEGAHORN
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
	dbw 36, ICICLE_CRASH
	dbw 40, PURSUIT
	dbw 42, SLASH
	dbw 45, BEAT_UP
	dbw 50, SWORDS_DANCE
	dbw 55, AGILITY
	dbw 60, PSYCHO_CUT
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 8, LICK
	dbw 12, POUND
	dbw 15, FURY_SWIPES
	dbw 22, FAINT_ATTACK
	dbw 29, REST
	dbw 30, SNORE
	dbw 36, CRUSH_CLAW
	dbw 40, SLASH	
	dbw 42, CRUNCH
	dbw 45, BULK_UP
	dbw 50, EARTHQUAKE
	dbw 55, THRASH
	dbw 60, OUTRAGE
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 8, LICK
	dbw 12, POUND
	dbw 15, FURY_SWIPES
	dbw 22, FAINT_ATTACK
	dbw 29, REST
	dbw 30, SNORE
	dbw 36, CRUSH_CLAW
	dbw 40, SLASH	
	dbw 42, CRUNCH
	dbw 45, BULK_UP
	dbw 50, EARTHQUAKE
	dbw 55, THRASH
	dbw 60, OUTRAGE
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGCARGO
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 8, EMBER
	dbw 15, ROCK_THROW
	dbw 22, SANDSTORM
	dbw 26, ANCIENTPOWER
	dbw 30, COSMIC_POWER
	dbw 36, FLAMETHROWER
	dbw 40, POWER_GEM
	dbw 42, PROTECT
	dbw 45, SKULL_BASH
	dbw 50, FIRE_BLAST
	dbw 55, ROCK_SLIDE
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 8, EMBER
	dbw 15, ROCK_THROW
	dbw 22, SANDSTORM
	dbw 26, ANCIENTPOWER
	dbw 30, COSMIC_POWER
	dbw 36, FLAMETHROWER
	dbw 40, POWER_GEM
	dbw 42, PROTECT
	dbw 45, SKULL_BASH
	dbw 50, FIRE_BLAST
	dbw 55, ROCK_SLIDE
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PILOSWINE
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

PiloswineEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, MAMOSWINE
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

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, DEFENSE_CURL
	dbw 16, ROLLOUT	
	dbw 19, RECOVER
	dbw 22, ICY_WIND
	dbw 25, BUBBLEBEAM
	dbw 28, ANCIENTPOWER
	dbw 31, COSMIC_POWER
	dbw 34, POWER_GEM
	dbw 37, MIRROR_COAT
	dbw 40, MIST_BALL
	dbw 42, SPIKES
	dbw 45, RAIN_DANCE
	dbw 50, RAPID_SPIN
	dbw 55, REST
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, OCTILLERY
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
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, OCTILLERY2
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
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PRESENT
	dbw 1, POWDER_SNOW
	dbw 7, GUST
	dbw 11, SPIKES
	dbw 16, AURORA_BEAM
	dbw 20, WING_ATTACK
	dbw 24, ICY_WIND
	dbw 28, RAZOR_WIND
	dbw 32, ICICLE_CRASH
	dbw 36, SKY_ATTACK
	dbw 40, BLIZZARD
	dbw 42, REFLECT
	dbw 45, LIGHT_SCREEN
	dbw 48, BELLY_DRUM
	dbw 50, BATON_PASS
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, BUBBLE
	dbw 7, GUST
	dbw 11, CLAMP
	dbw 16, WING_ATTACK
	dbw 20, BUBBLEBEAM
	dbw 24, CONFUSE_RAY
	dbw 28, RAZOR_WIND
	dbw 32, ICE_BEAM
	dbw 36, HYDRO_PUMP
	dbw 40, SKY_ATTACK
	dbw 42, RAIN_DANCE
	dbw 45, MEDITATE
	dbw 50, AGILITY
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
	dbw 36, DRILL_PECK
	dbw 40, VICEGRIP
	dbw 42, SAFEGUARD
	dbw 45, SLASH
	dbw 50, SWORDS_DANCE
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, HOUNDOOM
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 7, ROAR
	dbw 13, SMOG
	dbw 15, BITE
	dbw 22, FAINT_ATTACK
	dbw 26, FIRE_FANG
	dbw 32, FLAME_WHEEL
	dbw 36, DARK_PULSE
	dbw 40, FLAMETHROWER
	dbw 42, PURSUIT
	dbw 45, TAKE_DOWN
	dbw 50, FIRE_BLAST
	dbw 55, CRUNCH
	dbw 60, ERUPTION
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, HOUNDOOMX
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 7, ROAR
	dbw 13, SMOG
	dbw 15, BITE
	dbw 22, FAINT_ATTACK
	dbw 26, FIRE_FANG
	dbw 32, FLAME_WHEEL
	dbw 36, DARK_PULSE
	dbw 40, FLAMETHROWER
	dbw 42, PURSUIT
	dbw 45, TAKE_DOWN
	dbw 50, FIRE_BLAST
	dbw 55, CRUNCH
	dbw 60, ERUPTION
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 8, SMOKESCREEN
	dbw 12, TWISTER
	dbw 16, WATER_GUN
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 26, AURORA_BEAM
	dbw 28, DRAGON_RAGE	
	dbw 36, DRAGONBREATH
	dbw 36, RECOVER
	dbw 40, AGILITY
	dbw 45, HYDRO_PUMP
	dbw 50, DRAGON_DANCE
	dbw 55, RAIN_DANCE
	dbw 60, HURRICANE
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
	dbw 36, EARTHQUAKE
	dbw 40, BODY_SLAM
	dbw 42, BULK_UP
	dbw 45, TAKE_DOWN
	dbw 50, PLAY_ROUGH
	dbw 55, MEGAHORN
	dbw 60, FISSURE
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
	dbw 36, EARTHQUAKE
	dbw 40, BODY_SLAM
	dbw 42, BULK_UP
	dbw 45, TAKE_DOWN
	dbw 50, PLAY_ROUGH
	dbw 55, MEGAHORN
	dbw 60, FISSURE
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
	dbw 40, SWORDS_DANCE
	dbw 42, PSYCHIC_M
	dbw 45, DREAM_EATER
	dbw 50, PURSUIT
	dbw 55, MEGAHORN
	dbw 60, EARTHQUAKE
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
	dbw 42, BULK_UP
	dbw 45, COUNTER
	dbw 50, BATON_PASS
	dbw 55, COUNTER
	dbw 60, DETECT
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, LICK
	dbw 9, LOVELY_KISS
	dbw 13, POWDER_SNOW
	dbw 21, DOUBLESLAP
	dbw 25, ICE_PUNCH
	dbw 28, PSYBEAM
	dbw 32, ICY_WIND
	dbw 36, PSYCHIC_M
	dbw 40, ICE_BEAM
	dbw 42, CALM_MIND
	dbw 45, PERISH_SONG
	dbw 50, BLIZZARD
	dbw 55, HYPER_VOICE
	dbw 60, MEDITATE
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
	dbw 25, THUNDERPUNCH
	dbw 28, THUNDER_WAVE
	dbw 36, THUNDERBOLT
	dbw 40, FAERIEGLEAM
	dbw 42, CHARGE
	dbw 45, CONFUSE_RAY
	dbw 50, THUNDER
	dbw 55, AGILITY
	dbw 60, SHOCKSLAM
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
	dbw 26, MAGNITUDE
	dbw 32, ZEN_HEADBUTT
	dbw 34, HEAL_BELL
	dbw 36, BULK_UP
	dbw 40, BODY_SLAM
	dbw 42, PLAY_ROUGH
	dbw 45, OUTRAGE
	dbw 50, EARTHQUAKE	
	dbw 55, DOUBLE_EDGE
	dbw 60, COSMIC_POWER

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
	dbw 60, CALM_MIND
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, TACKLE	
	dbw 16, ROAR
	dbw 21, SHOCK_WAVE
	dbw 26, FAINT_ATTACK
	dbw 31, DRAGONBREATH
	dbw 36, THUNDERBOLT
	dbw 41, THUNDER_WAVE
	dbw 46, REFLECT
	dbw 51, THUNDER
	dbw 56, AMNESIA
	dbw 60, EXTREMESPEED
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, TACKLE
	dbw 16, ROAR
	dbw 21, FIRE_FANG	
	dbw 26, POISON_FANG
	dbw 31, CRUNCH
	dbw 36, FLAME_WHEEL
	dbw 41, SUNNY_DAY
	dbw 46, PURSUIT
	dbw 51, SACRED_FIRE
	dbw 56, SOLARBEAM
	dbw 60, EARTHQUAKE
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TACKLE
	dbw 16, ROAR
	dbw 21, BUBBLEBEAM
	dbw 26, AURORA_BEAM
	dbw 31, SAFEGUARD
	dbw 36, RECOVER
	dbw 41, MIST_BALL
	dbw 46, RAIN_DANCE
	dbw 51, HYDRO_PUMP
	dbw 56, MIST
	dbw 60, MIRROR_COAT
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, SANDSTORM
	dbw 12, ROCK_THROW
	dbw 15, SCREECH
	dbw 22, ROLLOUT
	dbw 26, FAINT_ATTACK
	dbw 30, SCARY_FACE
	dbw 32, CRUNCH
	dbw 36, ROCK_SLIDE
	dbw 40, EARTHQUAKE
	dbw 45, SPIKES
	dbw 50, STONE_EDGE
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, SANDSTORM
	dbw 12, ROCK_THROW
	dbw 15, SCREECH
	dbw 22, ROLLOUT
	dbw 26, FAINT_ATTACK
	dbw 30, SCARY_FACE
	dbw 32, CRUNCH
	dbw 36, ROCK_SLIDE
	dbw 40, EARTHQUAKE
	dbw 45, SPIKES
	dbw 50, STONE_EDGE
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, TYRANITARX
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, SANDSTORM
	dbw 12, ROCK_THROW
	dbw 15, SCREECH
	dbw 22, ROLLOUT
	dbw 26, FAINT_ATTACK
	dbw 30, SCARY_FACE
	dbw 32, CRUNCH
	dbw 36, ROCK_SLIDE
	dbw 40, EARTHQUAKE
	dbw 45, SPIKES
	dbw 50, STONE_EDGE
	dbw 55, OUTRAGE
	dbw 60, FISSURE
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
	dbw 22, STOMP
	dbw 25, HEADBUTT
	dbw 30, SNORE
	dbw 30, REST
	dbw 36, CRUSH_CLAW
	dbw 40, BODY_SLAM
	dbw 42, BULK_UP
	dbw 45, BELLY_DRUM
	dbw 50, OUTRAGE
	dbw 55, EARTHQUAKE
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

ENDSECTION
