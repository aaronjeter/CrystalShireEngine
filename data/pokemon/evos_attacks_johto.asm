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
	dbww EVOLVE_ITEM, WATER_STONE, CHIKORITA2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, VINE_WHIP
	dbw 7, SWEET_SCENT
	dbw 10, LEECH_SEED
	dbw 13, MAGICAL_LEAF
	dbw 16, REFLECT
	dbw 19, STUN_SPORE
	dbw 22, RAZOR_LEAF
	dbw 25, SYNTHESIS
	dbw 28, GROWTH
	dbw 30, BREAKING_SWIPE
	dbw 32, LIGHT_SCREEN
	dbw 34, SAFEGUARD
	dbw 36, SUNNY_DAY
	dbw 38, WEATHER_BALL
	dbw 40, GIGA_DRAIN
	dbw 43, BODY_SLAM
	dbw 46, DRAGONBREATH
	dbw 49, HEAL_BELL
	dbw 52, CALM_MIND
	dbw 55, LEAF_BLADE
	dbw 58, SWORDS_DANCE
	dbw 61, SOLARBEAM
	dbw 64, PETAL_DANCE
	dbw 68, OUTRAGE
	dbw 72, FRENZY_PLANT
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, MEGANIUM
	dbww EVOLVE_ITEM, WATER_STONE, BAYLEEF2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, VINE_WHIP
	dbw 7, SWEET_SCENT
	dbw 10, LEECH_SEED
	dbw 13, MAGICAL_LEAF
	dbw 16, REFLECT
	dbw 19, STUN_SPORE
	dbw 22, RAZOR_LEAF
	dbw 25, SYNTHESIS
	dbw 28, GROWTH
	dbw 30, BREAKING_SWIPE
	dbw 32, LIGHT_SCREEN
	dbw 34, SAFEGUARD
	dbw 36, SUNNY_DAY
	dbw 38, WEATHER_BALL
	dbw 40, GIGA_DRAIN
	dbw 43, BODY_SLAM
	dbw 46, DRAGONBREATH
	dbw 49, HEAL_BELL
	dbw 52, CALM_MIND
	dbw 55, LEAF_BLADE
	dbw 58, SWORDS_DANCE
	dbw 61, SOLARBEAM
	dbw 64, PETAL_DANCE
	dbw 68, OUTRAGE
	dbw 72, FRENZY_PLANT
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, MEGANIUM2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, VINE_WHIP
	dbw 7, SWEET_SCENT
	dbw 10, LEECH_SEED
	dbw 13, MAGICAL_LEAF
	dbw 16, REFLECT
	dbw 19, STUN_SPORE
	dbw 22, RAZOR_LEAF
	dbw 25, SYNTHESIS
	dbw 28, GROWTH
	dbw 30, BREAKING_SWIPE
	dbw 32, LIGHT_SCREEN
	dbw 34, SAFEGUARD
	dbw 36, SUNNY_DAY
	dbw 38, WEATHER_BALL
	dbw 40, GIGA_DRAIN
	dbw 43, BODY_SLAM
	dbw 46, DRAGONBREATH
	dbw 49, HEAL_BELL
	dbw 52, CALM_MIND
	dbw 55, LEAF_BLADE
	dbw 58, SWORDS_DANCE
	dbw 61, SOLARBEAM
	dbw 64, PETAL_DANCE
	dbw 68, OUTRAGE
	dbw 72, FRENZY_PLANT
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 4, EMBER
	dbw 7, SMOKESCREEN
	dbw 10, QUICK_ATTACK
	dbw 13, FLAME_CHARGE
	dbw 16, DEFENSE_CURL
	dbw 19, MUD_SHOT
	dbw 22, FIRE_SPIN
	dbw 25, ROLLOUT
	dbw 28, CRUSH_CLAW
	dbw 31, MYSTICAL_FIRE
	dbw 34, LAVA_PLUME
	dbw 37, CALM_MIND
	dbw 40, FLAMETHROWER
	dbw 43, FLAME_WHEEL
	dbw 46, EARTHPOWER
	dbw 49, BULK_UP
	dbw 52, NIGHT_SLASH
	dbw 55, HEAT_CRASH
	dbw 58, FIRE_BLAST
	dbw 61, DOUBLE_EDGE
	dbw 64, HEAT_WAVE
	dbw 68, ERUPTION
	dbw 72, BLAST_BURN
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 4, EMBER
	dbw 7, SMOKESCREEN
	dbw 10, QUICK_ATTACK
	dbw 13, FLAME_CHARGE
	dbw 16, DEFENSE_CURL
	dbw 19, MUD_SHOT
	dbw 22, FIRE_SPIN
	dbw 25, ROLLOUT
	dbw 28, CRUSH_CLAW
	dbw 31, MYSTICAL_FIRE
	dbw 34, LAVA_PLUME
	dbw 37, CALM_MIND
	dbw 40, FLAMETHROWER
	dbw 43, FLAME_WHEEL
	dbw 46, EARTHPOWER
	dbw 49, BULK_UP
	dbw 52, NIGHT_SLASH
	dbw 55, HEAT_CRASH
	dbw 58, FIRE_BLAST
	dbw 61, DOUBLE_EDGE
	dbw 64, HEAT_WAVE
	dbw 68, ERUPTION
	dbw 72, BLAST_BURN
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 4, EMBER
	dbw 7, SMOKESCREEN
	dbw 10, QUICK_ATTACK
	dbw 13, FLAME_CHARGE
	dbw 16, DEFENSE_CURL
	dbw 19, MUD_SHOT
	dbw 22, FIRE_SPIN
	dbw 25, ROLLOUT
	dbw 28, CRUSH_CLAW
	dbw 31, MYSTICAL_FIRE
	dbw 34, LAVA_PLUME
	dbw 37, CALM_MIND
	dbw 40, FLAMETHROWER
	dbw 43, FLAME_WHEEL
	dbw 46, EARTHPOWER
	dbw 49, BULK_UP
	dbw 52, NIGHT_SLASH
	dbw 55, HEAT_CRASH
	dbw 58, FIRE_BLAST
	dbw 61, DOUBLE_EDGE
	dbw 64, HEAT_WAVE
	dbw 68, ERUPTION
	dbw 72, BLAST_BURN
	db 0 ; no more level-up moves

TotodileEvosAttacks:
    dbww EVOLVE_ITEM, THUNDERSTONE, TOTODILE2
	dbbw EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 4, WATER_GUN
	dbw 7, BITE
	dbw 10, AQUA_JET
	dbw 13, SCARY_FACE
	dbw 16, WATER_PULSE
	dbw 19, ROCK_TOMB
	dbw 22, BUBBLEBEAM
	dbw 25, CRUSH_CLAW
	dbw 28, ICE_FANG
	dbw 31, FLAIL
	dbw 34, SUCKER_PUNCH
	dbw 37, CRUNCH
	dbw 40, WATERFALL
	dbw 43, SWORDS_DANCE
	dbw 46, SCALD
	dbw 49, ROCK_SLIDE
	dbw 52, DRAGON_DANCE
	dbw 55, AQUA_TAIL
	dbw 58, SUPERPOWER
	dbw 62, THRASH
	dbw 66, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, CROCONAW2
	dbbw EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 4, WATER_GUN
	dbw 7, BITE
	dbw 10, AQUA_JET
	dbw 13, SCARY_FACE
	dbw 16, WATER_PULSE
	dbw 19, ROCK_TOMB
	dbw 22, BUBBLEBEAM
	dbw 25, CRUSH_CLAW
	dbw 28, ICE_FANG
	dbw 31, FLAIL
	dbw 34, SUCKER_PUNCH
	dbw 37, CRUNCH
	dbw 40, WATERFALL
	dbw 43, SWORDS_DANCE
	dbw 46, SCALD
	dbw 49, ROCK_SLIDE
	dbw 52, DRAGON_DANCE
	dbw 55, AQUA_TAIL
	dbw 58, SUPERPOWER
	dbw 62, THRASH
	dbw 66, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
    dbww EVOLVE_ITEM, THUNDERSTONE, FERALIGATR2
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 4, WATER_GUN
	dbw 7, BITE
	dbw 10, AQUA_JET
	dbw 13, SCARY_FACE
	dbw 16, WATER_PULSE
	dbw 19, ROCK_TOMB
	dbw 22, BUBBLEBEAM
	dbw 25, CRUSH_CLAW
	dbw 28, ICE_FANG
	dbw 31, FLAIL
	dbw 34, SUCKER_PUNCH
	dbw 37, CRUNCH
	dbw 40, WATERFALL
	dbw 43, SWORDS_DANCE
	dbw 46, SCALD
	dbw 49, ROCK_SLIDE
	dbw 52, DRAGON_DANCE
	dbw 55, AQUA_TAIL
	dbw 58, SUPERPOWER
	dbw 62, THRASH
	dbw 66, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

SentretEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FURRET
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 1, DEFENSE_CURL
	dbw 4, QUICK_ATTACK
	dbw 7, BITE
	dbw 10, FURY_SWIPES
	dbw 13, TWISTER
	dbw 16, SCARY_FACE
	dbw 19, HYPER_FANG
	dbw 22, DRAGON_RAGE
	dbw 25, AGILITY
	dbw 28, FIRE_FANG
	dbw 30, ICE_FANG
	dbw 32, THUNDER_FANG
	dbw 35, SUCKER_PUNCH
	dbw 38, AMNESIA
	dbw 41, HYPER_VOICE
	dbw 44, BATON_PASS
	dbw 47, DRAGONBREATH
	dbw 50, DRAGON_DANCE
	dbw 53, REST
	dbw 56, EXTREMESPEED
	dbw 60, DOUBLE_EDGE
	dbw 64, OUTRAGE
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

FurretEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, FURRET2
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 1, DEFENSE_CURL
	dbw 4, QUICK_ATTACK
	dbw 7, BITE
	dbw 10, FURY_SWIPES
	dbw 13, TWISTER
	dbw 16, SCARY_FACE
	dbw 19, HYPER_FANG
	dbw 22, DRAGON_RAGE
	dbw 25, AGILITY
	dbw 28, FIRE_FANG
	dbw 30, ICE_FANG
	dbw 32, THUNDER_FANG
	dbw 35, SUCKER_PUNCH
	dbw 38, AMNESIA
	dbw 41, HYPER_VOICE
	dbw 44, BATON_PASS
	dbw 47, DRAGONBREATH
	dbw 50, DRAGON_DANCE
	dbw 53, REST
	dbw 56, EXTREMESPEED
	dbw 60, DOUBLE_EDGE
	dbw 64, OUTRAGE
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, FORESIGHT
	dbw 4, GUST
	dbw 7, ASTONISH
	dbw 10, CONFUSION
	dbw 13, HYPNOSIS
	dbw 16, NIGHT_SHADE
	dbw 19, REFLECT
	dbw 22, PSYBEAM
	dbw 25, AIR_CUTTER
	dbw 28, HEX
	dbw 31, WILLOWISP
	dbw 34, CONFUSE_RAY
	dbw 37, MOONLIGHT
	dbw 40, EXTRASENSORY
	dbw 43, SHADOW_BALL
	dbw 46, CALM_MIND
	dbw 49, PSYCHIC_M
	dbw 52, MOONBLAST
	dbw 55, DREAM_EATER
	dbw 58, DARK_PULSE
	dbw 62, UPROAR
	dbw 66, HURRICANE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, NOCTOWL2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, FORESIGHT
	dbw 4, GUST
	dbw 7, ASTONISH
	dbw 10, CONFUSION
	dbw 13, HYPNOSIS
	dbw 16, NIGHT_SHADE
	dbw 19, REFLECT
	dbw 22, PSYBEAM
	dbw 25, AIR_CUTTER
	dbw 28, HEX
	dbw 31, WILLOWISP
	dbw 34, CONFUSE_RAY
	dbw 37, MOONLIGHT
	dbw 40, EXTRASENSORY
	dbw 43, SHADOW_BALL
	dbw 46, CALM_MIND
	dbw 49, PSYCHIC_M
	dbw 52, MOONBLAST
	dbw 55, DREAM_EATER
	dbw 58, DARK_PULSE
	dbw 62, UPROAR
	dbw 66, HURRICANE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, LEDIAN
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEECH_LIFE
	dbw 1, SUPERSONIC
	dbw 4, COMET_PUNCH
	dbw 7, MACH_PUNCH
	dbw 10, TWINEEDLE
	dbw 13, REFLECT
	dbw 16, LIGHT_SCREEN
	dbw 19, FURY_CUTTER
	dbw 22, SAFEGUARD
	dbw 25, BULLET_PUNCH
	dbw 28, AGILITY
	dbw 31, SHADOW_PUNCH
	dbw 34, DRAIN_PUNCH
	dbw 37, DIZZY_PUNCH
	dbw 40, BATON_PASS
	dbw 43, U_TURN
	dbw 46, FIRE_PUNCH
	dbw 49, BULK_UP
	dbw 52, CROSS_CHOP
	dbw 55, ENCORE
	dbw 58, DOUBLE_EDGE
	dbw 62, MEGAHORN
	dbw 66, COUNTER
	dbw 70, DYNAMICPUNCH
	db 0 ; no more level-up moves

LedianEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, LEDIANX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEECH_LIFE
	dbw 1, SUPERSONIC
	dbw 4, COMET_PUNCH
	dbw 7, MACH_PUNCH
	dbw 10, TWINEEDLE
	dbw 13, REFLECT
	dbw 16, LIGHT_SCREEN
	dbw 19, FURY_CUTTER
	dbw 22, SAFEGUARD
	dbw 25, BULLET_PUNCH
	dbw 28, AGILITY
	dbw 31, SHADOW_PUNCH
	dbw 34, DRAIN_PUNCH
	dbw 37, DIZZY_PUNCH
	dbw 40, BATON_PASS
	dbw 43, U_TURN
	dbw 46, FIRE_PUNCH
	dbw 49, BULK_UP
	dbw 52, CROSS_CHOP
	dbw 55, ENCORE
	dbw 58, DOUBLE_EDGE
	dbw 62, MEGAHORN
	dbw 66, COUNTER
	dbw 70, DYNAMICPUNCH
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 1, CONSTRICT
	dbw 4, LEECH_LIFE
	dbw 7, ASTONISH
	dbw 10, SCARY_FACE
	dbw 13, NIGHT_SHADE
	dbw 16, SPIDER_WEB
	dbw 19, FURY_SWIPES
	dbw 22, SHADOWSNEAK
	dbw 25, POISON_FANG
	dbw 28, PSYBEAM
	dbw 31, SPIKES
	dbw 34, HEX
	dbw 37, SUCKER_PUNCH
	dbw 40, KNOCK_OFF
	dbw 43, POISON_JAB
	dbw 46, SIGNAL_BEAM
	dbw 49, TOXIC
	dbw 52, NIGHT_SLASH
	dbw 55, SHADOW_BALL
	dbw 58, SLUDGE_WAVE
	dbw 62, PSYCHIC_M
	dbw 66, MEGAHORN
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 1, CONSTRICT
	dbw 4, LEECH_LIFE
	dbw 7, ASTONISH
	dbw 10, SCARY_FACE
	dbw 13, NIGHT_SHADE
	dbw 16, SPIDER_WEB
	dbw 19, FURY_SWIPES
	dbw 22, SHADOWSNEAK
	dbw 25, POISON_FANG
	dbw 28, PSYBEAM
	dbw 31, SPIKES
	dbw 34, HEX
	dbw 37, SUCKER_PUNCH
	dbw 40, KNOCK_OFF
	dbw 43, POISON_JAB
	dbw 46, SIGNAL_BEAM
	dbw 49, TOXIC
	dbw 52, NIGHT_SLASH
	dbw 55, SHADOW_BALL
	dbw 58, SLUDGE_WAVE
	dbw 62, PSYCHIC_M
	dbw 66, MEGAHORN
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, POISON_STING
	dbw 4, SUPERSONIC
	dbw 7, ASTONISH
	dbw 10, BITE
	dbw 13, GUST
	dbw 16, MEAN_LOOK
	dbw 19, CONFUSE_RAY
	dbw 22, WING_ATTACK
	dbw 25, POISON_FANG
	dbw 28, HAZE
	dbw 31, FIRE_FANG
	dbw 33, ICE_FANG
	dbw 35, THUNDER_FANG
	dbw 37, ACROBATICS
	dbw 40, CRUNCH
	dbw 43, SLUDGE_BOMB
	dbw 46, TAUNT
	dbw 49, BELLY_DRUM
	dbw 52, U_TURN
	dbw 55, WHIRLWIND
	dbw 58, EXTREMESPEED
	dbw 65, SKY_ATTACK
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, LANTURN
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, SUPERSONIC
	dbw 4, THUNDERSHOCK
	dbw 7, WATER_GUN
	dbw 10, THUNDER_WAVE
	dbw 13, CONFUSE_RAY
	dbw 16, CHARGE_BEAM
	dbw 19, WATER_PULSE
	dbw 22, SPARK
	dbw 25, BUBBLEBEAM
	dbw 28, ELECTRO_BALL
	dbw 31, AQUA_RING
	dbw 34, RAIN_DANCE
	dbw 37, DISCHARGE
	dbw 40, LIGHT_SCREEN
	dbw 43, VOLT_SWITCH
	dbw 46, SCALD
	dbw 49, CHARGE
	dbw 52, HEAL_BELL
	dbw 55, FLAIL
	dbw 60, THUNDER
	dbw 65, HYDRO_PUMP
	dbw 70, WATER_SPOUT
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, SUPERSONIC
	dbw 4, THUNDERSHOCK
	dbw 7, WATER_GUN
	dbw 10, THUNDER_WAVE
	dbw 13, CONFUSE_RAY
	dbw 16, CHARGE_BEAM
	dbw 19, WATER_PULSE
	dbw 22, SPARK
	dbw 25, BUBBLEBEAM
	dbw 28, ELECTRO_BALL
	dbw 31, AQUA_RING
	dbw 34, RAIN_DANCE
	dbw 37, DISCHARGE
	dbw 40, LIGHT_SCREEN
	dbw 43, VOLT_SWITCH
	dbw 46, SCALD
	dbw 49, CHARGE
	dbw 52, HEAL_BELL
	dbw 55, FLAIL
	dbw 60, THUNDER
	dbw 65, HYDRO_PUMP
	dbw 70, WATER_SPOUT
	db 0 ; no more level-up moves

PichuEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	dbbw EVOLVE_LEVEL, 20, PIKACHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, THUNDER_WAVE
	dbw 13, SWEET_KISS
	dbw 16, DOUBLE_TEAM
	dbw 19, CHARGE_BEAM
	dbw 22, SPARK
	dbw 25, CHARM
	dbw 28, ELECTRO_BALL
	dbw 30, GROWTH
	dbw 32, AGILITY
	dbw 35, VOLT_SWITCH
	dbw 38, DISCHARGE
	dbw 41, THUNDERBOLT
	dbw 44, LIGHT_SCREEN
	dbw 47, FAERIEGLEAM
	dbw 50, MEDITATE
	dbw 53, GRASS_KNOT
	dbw 56, KNOCK_OFF
	dbw 60, THUNDER
	dbw 64, RAIN_DANCE
	dbw 68, SURF
	dbw 72, VOLT_TACKLE
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	dbbw EVOLVE_LEVEL, 20, CLEFAIRY
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 4, PIXIE_DUST
	dbw 7, ENCORE
	dbw 10, SING
	dbw 13, DOUBLESLAP
	dbw 16, METRONOME
	dbw 19, SWEET_KISS
	dbw 22, MINIMIZE
	dbw 25, DRAININGKISS
	dbw 28, GLARE
	dbw 31, FAE_VOICE
	dbw 34, LIGHT_SCREEN
	dbw 36, MOONLIGHT
	dbw 38, REFLECT
	dbw 41, MOONBLAST
	dbw 44, HYPER_VOICE
	dbw 47, CALM_MIND
	dbw 50, MYSTICAL_FIRE
	dbw 53, COSMIC_POWER
	dbw 56, METEOR_MASH
	dbw 60, HEAL_BELL
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	dbbw EVOLVE_LEVEL, 20, JIGGLYPUFF
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 1, POUND
	dbw 4, SWEET_KISS
	dbw 7, DISABLE
	dbw 10, ROLLOUT
	dbw 13, DOUBLESLAP
	dbw 16, WILLOWISP
	dbw 19, DRAININGKISS
	dbw 22, YAWN
	dbw 25, REST
	dbw 28, BODY_SLAM
	dbw 31, MEAN_LOOK
	dbw 34, HYPER_VOICE
	dbw 37, SLEEP_TALK
	dbw 40, PLAY_ROUGH
	dbw 43, MOONBLAST
	dbw 46, PERISH_SONG
	dbw 49, GYRO_BALL
	dbw 52, UPROAR
	dbw 55, DOUBLE_EDGE
	dbw 58, FACADE
	dbw 60, HEAL_BELL
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 1, POUND
	dbw 4, PIXIE_DUST
	dbw 7, SWEET_KISS
	dbw 10, YAWN
	dbw 13, METRONOME
	dbw 16, TWISTER
	dbw 19, FAE_VOICE
	dbw 22, ANCIENTPOWER
	dbw 25, ENCORE
	dbw 28, SAFEGUARD
	dbw 31, AIR_CUTTER
	dbw 34, HEADBUTT
	dbw 37, BATON_PASS
	dbw 40, EXTRASENSORY
	dbw 43, MOONBLAST
	dbw 46, CALM_MIND
	dbw 49, HEAL_BELL
	dbw 52, TRI_ATTACK
	dbw 55, DRAGONBREATH
	dbw 58, AURA_SPHERE
	dbw 62, EXTREMESPEED
	dbw 66, HURRICANE
	dbw 70, LUSTER_PURGE
	dbw 74, SKY_ATTACK
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	dbww EVOLVE_ITEM, DAWN_STONE, TOGEKISS
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 1, POUND
	dbw 4, PIXIE_DUST
	dbw 7, SWEET_KISS
	dbw 10, YAWN
	dbw 13, METRONOME
	dbw 16, TWISTER
	dbw 19, FAE_VOICE
	dbw 22, ANCIENTPOWER
	dbw 25, ENCORE
	dbw 28, SAFEGUARD
	dbw 31, AIR_CUTTER
	dbw 34, HEADBUTT
	dbw 37, BATON_PASS
	dbw 40, EXTRASENSORY
	dbw 43, MOONBLAST
	dbw 46, CALM_MIND
	dbw 49, HEAL_BELL
	dbw 52, TRI_ATTACK
	dbw 55, DRAGONBREATH
	dbw 58, AURA_SPHERE
	dbw 62, EXTREMESPEED
	dbw 66, HURRICANE
	dbw 70, LUSTER_PURGE
	dbw 74, SKY_ATTACK
	db 0 ; no more level-up moves

NatuEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, XATU
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, LEER
	dbw 1, TELEPORT
	dbw 4, CONFUSION
	dbw 7, NIGHT_SHADE
	dbw 10, PSYWAVE
	dbw 13, CONFUSE_RAY
	dbw 16, REFLECT
	dbw 19, LIGHT_SCREEN
	dbw 22, AIR_CUTTER
	dbw 24, PURSUIT
	dbw 26, PSYBEAM
	dbw 28, WILLOWISP
	dbw 31, U_TURN
	dbw 34, SAFEGUARD
	dbw 37, HEX
	dbw 40, PSYCHIC_M
	dbw 43, CALM_MIND
	dbw 46, HAZE
	dbw 49, DARK_PULSE
	dbw 52, ENERVATE
	dbw 55, SHADOW_BALL
	dbw 58, HURRICANE
	dbw 62, FUTURE_SIGHT
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, LEER
	dbw 1, TELEPORT
	dbw 4, CONFUSION
	dbw 7, NIGHT_SHADE
	dbw 10, PSYWAVE
	dbw 13, CONFUSE_RAY
	dbw 16, REFLECT
	dbw 19, LIGHT_SCREEN
	dbw 22, AIR_CUTTER
	dbw 24, PURSUIT
	dbw 26, PSYBEAM
	dbw 28, WILLOWISP
	dbw 31, U_TURN
	dbw 34, SAFEGUARD
	dbw 37, HEX
	dbw 40, PSYCHIC_M
	dbw 43, CALM_MIND
	dbw 46, HAZE
	dbw 49, DARK_PULSE
	dbw 52, ENERVATE
	dbw 55, SHADOW_BALL
	dbw 58, HURRICANE
	dbw 62, FUTURE_SIGHT
	db 0 ; no more level-up moves

MareepEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FLAAFFY
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, THUNDERSHOCK
	dbw 4, THUNDER_WAVE
	dbw 7, COTTON_SPORE
	dbw 10, CHARGE_BEAM
	dbw 13, CONFUSE_RAY
	dbw 16, ELECTRO_BALL
	dbw 19, ELECTRO_WEB
	dbw 22, DRAGON_RAGE
	dbw 25, LIGHT_SCREEN
	dbw 28, REFLECT
	dbw 31, TAKE_DOWN
	dbw 34, CHARGE
	dbw 37, DISCHARGE
	dbw 40, RECOVER
	dbw 43, POWER_GEM
	dbw 46, DRAGONBREATH
	dbw 49, DRAGON_CLAW
	dbw 52, FAERIEGLEAM
	dbw 55, AURA_SPHERE
	dbw 58, OUTRAGE
	dbw 62, THUNDER
	dbw 66, SHOCKSLAM
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, AMPHAROS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, THUNDERSHOCK
	dbw 4, THUNDER_WAVE
	dbw 7, COTTON_SPORE
	dbw 10, CHARGE_BEAM
	dbw 13, CONFUSE_RAY
	dbw 16, ELECTRO_BALL
	dbw 19, ELECTRO_WEB
	dbw 22, DRAGON_RAGE
	dbw 25, LIGHT_SCREEN
	dbw 28, REFLECT
	dbw 31, TAKE_DOWN
	dbw 34, CHARGE
	dbw 37, DISCHARGE
	dbw 40, RECOVER
	dbw 43, POWER_GEM
	dbw 46, DRAGONBREATH
	dbw 49, DRAGON_CLAW
	dbw 52, FAERIEGLEAM
	dbw 55, AURA_SPHERE
	dbw 58, OUTRAGE
	dbw 62, THUNDER
	dbw 66, SHOCKSLAM
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, AMPHAROSX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, THUNDERSHOCK
	dbw 4, THUNDER_WAVE
	dbw 7, COTTON_SPORE
	dbw 10, CHARGE_BEAM
	dbw 13, CONFUSE_RAY
	dbw 16, ELECTRO_BALL
	dbw 19, ELECTRO_WEB
	dbw 22, DRAGON_RAGE
	dbw 25, LIGHT_SCREEN
	dbw 28, REFLECT
	dbw 31, TAKE_DOWN
	dbw 34, CHARGE
	dbw 37, DISCHARGE
	dbw 40, RECOVER
	dbw 43, POWER_GEM
	dbw 46, DRAGONBREATH
	dbw 49, DRAGON_CLAW
	dbw 52, FAERIEGLEAM
	dbw 55, AURA_SPHERE
	dbw 58, OUTRAGE
	dbw 62, THUNDER
	dbw 66, SHOCKSLAM
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, PIXIE_DUST
	dbw 4, SWEET_SCENT
	dbw 7, STUN_SPORE
	dbw 10, POISONPOWDER
	dbw 13, MEGA_DRAIN
	dbw 16, SLEEP_POWDER
	dbw 19, DRAININGKISS
	dbw 22, RAZOR_LEAF
	dbw 25, FAE_VOICE
	dbw 28, SYNTHESIS
	dbw 31, GROWTH
	dbw 33, WEATHER_BALL
	dbw 35, SUNNY_DAY
	dbw 37, MOONBLAST
	dbw 40, GIGA_DRAIN
	dbw 43, CALM_MIND
	dbw 46, FAERIEGLEAM
	dbw 48, LEAF_BLADE
	dbw 50, HEAL_BELL
	dbw 52, LEECH_SEED
	dbw 55, SOLARBEAM
	dbw 58, SWORDS_DANCE
	dbw 60, PETAL_DANCE
	dbw 65, PLAY_ROUGH
	db 0 ; no more level-up moves

MarillEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, AZUMARILL
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 4, POUND
	dbw 7, DEFENSE_CURL
	dbw 10, CHARM
	dbw 13, ROLLOUT
	dbw 16, AQUA_JET
	dbw 19, BUBBLEBEAM
	dbw 22, SLAM
	dbw 25, AQUA_RING
	dbw 28, RAIN_DANCE
	dbw 31, DIZZY_PUNCH
	dbw 34, AQUA_TAIL
	dbw 37, KNOCK_OFF
	dbw 40, BELLY_DRUM
	dbw 43, PLAY_ROUGH
	dbw 46, SCALD
	dbw 49, FAERIEGLEAM
	dbw 52, BULK_UP
	dbw 55, DOUBLE_EDGE
	dbw 58, SUPERPOWER
	dbw 62, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 4, POUND
	dbw 7, DEFENSE_CURL
	dbw 10, CHARM
	dbw 13, ROLLOUT
	dbw 16, AQUA_JET
	dbw 19, BUBBLEBEAM
	dbw 22, SLAM
	dbw 25, AQUA_RING
	dbw 28, RAIN_DANCE
	dbw 31, DIZZY_PUNCH
	dbw 34, AQUA_TAIL
	dbw 37, KNOCK_OFF
	dbw 40, BELLY_DRUM
	dbw 43, PLAY_ROUGH
	dbw 46, SCALD
	dbw 49, FAERIEGLEAM
	dbw 52, BULK_UP
	dbw 55, DOUBLE_EDGE
	dbw 58, SUPERPOWER
	dbw 62, HYDRO_PUMP
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ROCK_THROW
	dbw 1, MIMIC
	dbw 4, FLAIL
	dbw 7, LOW_KICK
	dbw 10, ROLLOUT
	dbw 13, ROCK_TOMB
	dbw 16, CONVERSION
	dbw 19, MAGNITUDE
	dbw 22, COUNTER
	dbw 25, SANDSTORM
	dbw 28, SPIKES
	dbw 30, SUCKER_PUNCH
	dbw 32, SKETCH
	dbw 34, ROCK_BLAST
	dbw 36, SKETCH
	dbw 38, TAKE_DOWN
	dbw 40, ROCK_SLIDE
	dbw 43, CURSE
	dbw 46, BODY_PRESS
	dbw 50, DOUBLE_EDGE
	dbw 55, STONE_EDGE
	dbw 60, EXPLOSION
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, POUND
	dbw 1, WATER_GUN
	dbw 1, HYPNOSIS
	dbw 10, DOUBLESLAP
	dbw 13, MUD_SHOT
	dbw 16, WATER_PULSE
	dbw 19, YAWN
	dbw 22, BUBBLEBEAM
	dbw 25, ENCORE
	dbw 28, RAIN_DANCE
	dbw 31, PERISH_SONG
	dbw 34, HYPER_VOICE
	dbw 37, CALM_MIND
	dbw 40, SCALD
	dbw 43, MIST_BALL
	dbw 46, EARTHPOWER
	dbw 49, AQUA_RING
	dbw 52, HAZE
	dbw 55, SING
	dbw 60, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, SKIPLOOM
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, TACKLE
	dbw 1, ABSORB
	dbw 4, TAIL_WHIP
	dbw 7, PIXIE_DUST
	dbw 10, POISONPOWDER
	dbw 12, STUN_SPORE
	dbw 14, SLEEP_POWDER
	dbw 16, BULLET_SEED
	dbw 19, LEECH_SEED
	dbw 22, MEGA_DRAIN
	dbw 25, ACROBATICS
	dbw 28, COTTON_SPORE
	dbw 30, REFLECT
	dbw 32, LIGHT_SCREEN
	dbw 34, U_TURN
	dbw 36, SUNNY_DAY
	dbw 38, SYNTHESIS
	dbw 40, ENCORE
	dbw 43, GIGA_DRAIN
	dbw 46, LEAF_BLADE
	dbw 49, SWORDS_DANCE
	dbw 52, WEATHER_BALL
	dbw 55, SOLARBEAM
	dbw 58, DESTINY_BOND
	dbw 62, HURRICANE
	dbw 66, SKY_ATTACK
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, JUMPLUFF
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, TACKLE
	dbw 1, ABSORB
	dbw 4, TAIL_WHIP
	dbw 7, PIXIE_DUST
	dbw 10, POISONPOWDER
	dbw 12, STUN_SPORE
	dbw 14, SLEEP_POWDER
	dbw 16, BULLET_SEED
	dbw 19, LEECH_SEED
	dbw 22, MEGA_DRAIN
	dbw 25, ACROBATICS
	dbw 28, COTTON_SPORE
	dbw 30, REFLECT
	dbw 32, LIGHT_SCREEN
	dbw 34, U_TURN
	dbw 36, SUNNY_DAY
	dbw 38, SYNTHESIS
	dbw 40, ENCORE
	dbw 43, GIGA_DRAIN
	dbw 46, LEAF_BLADE
	dbw 49, SWORDS_DANCE
	dbw 52, WEATHER_BALL
	dbw 55, SOLARBEAM
	dbw 58, DESTINY_BOND
	dbw 62, HURRICANE
	dbw 66, SKY_ATTACK
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, TACKLE
	dbw 1, ABSORB
	dbw 4, TAIL_WHIP
	dbw 7, PIXIE_DUST
	dbw 10, POISONPOWDER
	dbw 12, STUN_SPORE
	dbw 14, SLEEP_POWDER
	dbw 16, BULLET_SEED
	dbw 19, LEECH_SEED
	dbw 22, MEGA_DRAIN
	dbw 25, ACROBATICS
	dbw 28, COTTON_SPORE
	dbw 30, REFLECT
	dbw 32, LIGHT_SCREEN
	dbw 34, U_TURN
	dbw 36, SUNNY_DAY
	dbw 38, SYNTHESIS
	dbw 40, ENCORE
	dbw 43, GIGA_DRAIN
	dbw 46, LEAF_BLADE
	dbw 49, SWORDS_DANCE
	dbw 52, WEATHER_BALL
	dbw 55, SOLARBEAM
	dbw 58, DESTINY_BOND
	dbw 62, HURRICANE
	dbw 66, SKY_ATTACK
	db 0 ; no more level-up moves

AipomEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, AMBIPOM
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 1, SAND_ATTACK
	dbw 4, ASTONISH
	dbw 7, COMET_PUNCH
	dbw 10, FURY_SWIPES
	dbw 13, DOUBLESLAP
	dbw 16, PURSUIT
	dbw 19, SCREECH
	dbw 22, ARM_THRUST
	dbw 25, AGILITY
	dbw 28, ACROBATICS
	dbw 31, BATON_PASS
	dbw 34, KNOCK_OFF
	dbw 37, GLARE
	dbw 40, U_TURN
	dbw 43, TAUNT
	dbw 46, TRIPLE_KICK
	dbw 49, SUCKER_PUNCH
	dbw 52, ENCORE
	dbw 55, DOUBLE_EDGE
	dbw 60, BEAT_UP
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	dbww EVOLVE_ITEM, SUN_STONE, SUNFLORA
	dbbw EVOLVE_LEVEL, 30, SUNFLORA
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 1, EMBER
	dbw 4, LEECH_SEED
	dbw 7, STUN_SPORE
	dbw 10, MEGA_DRAIN
	dbw 13, INGRAIN
	dbw 16, MAGICAL_LEAF
	dbw 19, WILLOWISP
	dbw 22, FIRE_SPIN
	dbw 25, SYNTHESIS
	dbw 28, SUNNY_DAY
	dbw 31, WEATHER_BALL
	dbw 34, MYSTICAL_FIRE
	dbw 37, GIGA_DRAIN
	dbw 40, SLEEP_POWDER
	dbw 43, STRENGTH_SAP
	dbw 46, FLAMETHROWER
	dbw 49, EARTHPOWER
	dbw 52, SOLARBEAM
	dbw 55, HEAT_WAVE
	dbw 60, FIRE_BLAST
	dbw 65, FRENZY_PLANT
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 1, EMBER
	dbw 4, LEECH_SEED
	dbw 7, STUN_SPORE
	dbw 10, MEGA_DRAIN
	dbw 13, INGRAIN
	dbw 16, MAGICAL_LEAF
	dbw 19, WILLOWISP
	dbw 22, FIRE_SPIN
	dbw 25, SYNTHESIS
	dbw 28, SUNNY_DAY
	dbw 31, WEATHER_BALL
	dbw 34, MYSTICAL_FIRE
	dbw 37, GIGA_DRAIN
	dbw 40, SLEEP_POWDER
	dbw 43, STRENGTH_SAP
	dbw 46, FLAMETHROWER
	dbw 49, EARTHPOWER
	dbw 52, SOLARBEAM
	dbw 55, HEAT_WAVE
	dbw 60, FIRE_BLAST
	dbw 65, FRENZY_PLANT
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	dbww EVOLVE_ITEM, SUN_STONE, YANMA2
	dbbw EVOLVE_LEVEL, 42, YANMEGA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, STRING_SHOT
	dbw 1, TWISTER
	dbw 4, QUICK_ATTACK
	dbw 7, LEECH_LIFE
	dbw 10, SUPERSONIC
	dbw 13, SONICBOOM
	dbw 16, AIR_CUTTER
	dbw 19, DETECT
	dbw 22, HYPNOSIS
	dbw 25, SILVER_WIND
	dbw 28, ANCIENTPOWER
	dbw 31, U_TURN
	dbw 34, SCREECH
	dbw 37, DRAGONBREATH
	dbw 40, SIGNAL_BEAM
	dbw 43, DRAGON_DANCE
	dbw 46, DRAGON_CLAW
	dbw 49, UPROAR
	dbw 52, CALM_MIND
	dbw 55, MEGAHORN
	dbw 60, HURRICANE
	dbw 65, OUTRAGE
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

WooperEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, QUAGSIRE
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 4, SAND_ATTACK
	dbw 7, MUD_SLAP
	dbw 10, MUD_SHOT
	dbw 13, YAWN
	dbw 16, SLAM
	dbw 19, BULLDOZE
	dbw 22, WATER_PULSE
	dbw 25, AQUA_RING
	dbw 28, AMNESIA
	dbw 31, RAIN_DANCE
	dbw 34, TOXIC
	dbw 37, AQUA_TAIL
	dbw 40, MUDDY_WATER
	dbw 43, RECOVER
	dbw 46, EARTHPOWER
	dbw 49, CURSE
	dbw 52, HAZE
	dbw 55, SCALD
	dbw 60, HYDRO_PUMP
	dbw 66, FISSURE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 4, SAND_ATTACK
	dbw 7, MUD_SLAP
	dbw 10, MUD_SHOT
	dbw 13, YAWN
	dbw 16, SLAM
	dbw 19, BULLDOZE
	dbw 22, WATER_PULSE
	dbw 25, AQUA_RING
	dbw 28, AMNESIA
	dbw 31, RAIN_DANCE
	dbw 34, TOXIC
	dbw 37, AQUA_TAIL
	dbw 40, MUDDY_WATER
	dbw 43, RECOVER
	dbw 46, EARTHPOWER
	dbw 49, CURSE
	dbw 52, HAZE
	dbw 55, SCALD
	dbw 60, HYDRO_PUMP
	dbw 66, FISSURE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, CONFUSION
	dbw 4, SAND_ATTACK
	dbw 7, QUICK_ATTACK
	dbw 10, CONFUSE_RAY
	dbw 13, SWIFT
	dbw 16, PSYBEAM
	dbw 19, FAE_VOICE
	dbw 22, BATON_PASS
	dbw 25, MORNING_SUN
	dbw 28, LIGHT_SCREEN
	dbw 31, MEDITATE
	dbw 34, REFLECT
	dbw 37, MIST_BALL
	dbw 40, PSYCHIC_M
	dbw 43, FAERIEGLEAM
	dbw 46, POWER_GEM
	dbw 50, SHADOW_BALL
	dbw 55, PSYCH_UP
	dbw 60, RECOVER
	dbw 65, FUTURE_SIGHT
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, BITE
	dbw 4, SAND_ATTACK
	dbw 7, QUICK_ATTACK
	dbw 10, CONFUSE_RAY
	dbw 13, SNARL
	dbw 16, PURSUIT
	dbw 19, FAINT_ATTACK
	dbw 22, NIGHT_SHADE
	dbw 25, BATON_PASS
	dbw 28, MEAN_LOOK
	dbw 31, SCREECH
	dbw 34, MOONLIGHT
	dbw 37, KNOCK_OFF
	dbw 40, COSMIC_POWER
	dbw 43, TOXIC
	dbw 46, SUCKER_PUNCH
	dbw 50, MOONBLAST
	dbw 55, DARK_PULSE
	dbw 60, REST
	dbw 65, TAUNT
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, HONCHKROW
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, ASTONISH
	dbw 1, GUST
	dbw 4, BITE
	dbw 7, HAZE
	dbw 10, PURSUIT
	dbw 13, MEAN_LOOK
	dbw 16, SNARL
	dbw 19, FAINT_ATTACK
	dbw 22, TAUNT
	dbw 25, AIR_CUTTER
	dbw 28, FOCUS_ENERGY
	dbw 31, GLARE
	dbw 34, KNOCK_OFF
	dbw 37, SUCKER_PUNCH
	dbw 40, NIGHT_SLASH
	dbw 43, DRILL_PECK
	dbw 46, DARK_PULSE
	dbw 49, CALM_MIND
	dbw 52, WHIRLWIND
	dbw 55, HURRICANE
	dbw 60, SKY_ATTACK
	dbw 65, BEAT_UP
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 4, GROWL
	dbw 7, YAWN
	dbw 10, CONFUSION
	dbw 13, DISABLE
	dbw 16, WATER_PULSE
	dbw 19, PSYBEAM
	dbw 22, SAFEGUARD
	dbw 25, RECOVER
	dbw 28, MEDITATE
	dbw 31, POWER_GEM
	dbw 34, MUDDY_WATER
	dbw 37, PSYCHIC_M
	dbw 40, SLUDGE_WAVE
	dbw 43, GRASS_KNOT
	dbw 46, HEAL_BELL
	dbw 50, RAIN_DANCE
	dbw 60, HYDRO_PUMP
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	dbbw EVOLVE_LEVEL, 41, MISMAGIUS
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, LICK
	dbw 1, CONFUSION
	dbw 4, ASTONISH
	dbw 7, SPITE
	dbw 10, PSYWAVE
	dbw 13, CONFUSE_RAY
	dbw 16, NIGHT_SHADE
	dbw 19, WILLOWISP
	dbw 22, FROSTBITE
	dbw 25, HEX
	dbw 28, PSYBEAM
	dbw 31, MEAN_LOOK
	dbw 34, MYSTICAL_FIRE
	dbw 37, TAUNT
	dbw 40, SHADOW_BALL
	dbw 43, PAIN_SPLIT
	dbw 46, CALM_MIND
	dbw 49, POWER_GEM
	dbw 52, GLARE
	dbw 55, PERISH_SONG
	dbw 58, MOONBLAST
	dbw 62, DESTINY_BOND
	db 0 ; no more level-up moves

UnownEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, UNOWNX
	db 0 ; no more evolutions
	dbw 1, HIDDEN_POWER
	dbw 4, NIGHT_SHADE
	dbw 7, CONFUSION
	dbw 10, SHADOWSNEAK
	dbw 13, CONFUSE_RAY
	dbw 16, FAINT_ATTACK
	dbw 19, ANCIENTPOWER
	dbw 22, WILLOWISP
	dbw 25, HEX
	dbw 28, SHADOW_CLAW
	dbw 31, MEAN_LOOK
	dbw 34, GLARE
	dbw 37, NIGHT_SLASH
	dbw 40, DARK_PULSE
	dbw 43, COSMIC_POWER
	dbw 46, SHADOW_BALL
	dbw 49, POWER_GEM
	dbw 52, RECOVER
	dbw 55, PSYCHIC_M
	dbw 58, CURSE
	dbw 62, SHADOW_FORCE
	dbw 66, FUTURE_SIGHT
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COUNTER
	dbw 1, MIRROR_COAT
	dbw 1, SAFEGUARD
	dbw 1, DESTINY_BOND
	dbw 1, CHARM
	dbw 1, ENCORE
	dbw 1, SPLASH
	dbw 1, AMNESIA
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	dbbw EVOLVE_LEVEL, 41, FARIGIRAF
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 4, CONFUSION
	dbw 7, BITE
	dbw 10, PSYWAVE
	dbw 13, STOMP
	dbw 16, AGILITY
	dbw 19, FAINT_ATTACK
	dbw 22, PSYBEAM
	dbw 25, REFLECT
	dbw 28, LIGHT_SCREEN
	dbw 31, BATON_PASS
	dbw 34, CRUNCH
	dbw 37, ZEN_HEADBUTT
	dbw 40, PSYCHIC_M
	dbw 43, CALM_MIND
	dbw 46, HYPER_VOICE
	dbw 49, BODY_SLAM
	dbw 52, RECOVER
	dbw 55, SUCKER_PUNCH
	dbw 58, DARK_PULSE
	dbw 62, DOUBLE_EDGE
	dbw 66, FUTURE_SIGHT
	dbw 70, THRASH
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, STRING_SHOT
	dbw 1, PROTECT
	dbw 4, HARDEN
	dbw 7, BIDE
	dbw 10, SELFDESTRUCT
	dbw 13, TWINEEDLE
	dbw 16, RAPID_SPIN
	dbw 19, TAKE_DOWN
	dbw 22, SPIKES
	dbw 25, LEECH_SEED
	dbw 28, SPIKE_CANNON
	dbw 31, CURSE
	dbw 34, STUN_SPORE
	dbw 37, GYRO_BALL
	dbw 40, U_TURN
	dbw 43, TOXIC
	dbw 46, BODY_PRESS
	dbw 49, VICEGRIP
	dbw 52, EXPLOSION
	dbw 55, HEAVY_SLAM
	dbw 58, DOUBLE_EDGE
	dbw 62, MEGAHORN
	dbw 66, ZAP_CANNON
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, STRING_SHOT
	dbw 1, PROTECT
	dbw 4, HARDEN
	dbw 7, BIDE
	dbw 10, SELFDESTRUCT
	dbw 13, TWINEEDLE
	dbw 16, RAPID_SPIN
	dbw 19, TAKE_DOWN
	dbw 22, SPIKES
	dbw 25, LEECH_SEED
	dbw 28, SPIKE_CANNON
	dbw 31, CURSE
	dbw 34, STUN_SPORE
	dbw 37, GYRO_BALL
	dbw 40, U_TURN
	dbw 43, TOXIC
	dbw 46, BODY_PRESS
	dbw 49, VICEGRIP
	dbw 52, EXPLOSION
	dbw 55, HEAVY_SLAM
	dbw 58, DOUBLE_EDGE
	dbw 62, MEGAHORN
	dbw 66, ZAP_CANNON
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FLAIL
	dbw 1, SAND_ATTACK
	dbw 1, DEFENSE_CURL
	dbw 4, MUD_SLAP
	dbw 7, ROLLOUT
	dbw 10, GLARE
	dbw 13, SPITE
	dbw 16, SCREECH
	dbw 19, HEADBUTT
	dbw 22, BULLDOZE
	dbw 25, YAWN
	dbw 28, ANCIENTPOWER
	dbw 31, DRAININGKISS
	dbw 34, SANDSTORM
	dbw 37, BODY_SLAM
	dbw 40, BULK_UP
	dbw 43, EARTHQUAKE
	dbw 46, COSMIC_POWER
	dbw 49, PLAY_ROUGH
	dbw 52, MOONLIGHT
	dbw 55, EARTHPOWER
	dbw 58, ROCK_SLIDE
	dbw 62, DRAGONBREATH
	dbw 66, DOUBLE_EDGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

GligarEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, GLISCOR
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, SAND_ATTACK
	dbw 1, HARDEN
	dbw 4, QUICK_ATTACK
	dbw 7, MUD_SLAP
	dbw 10, FURY_CUTTER
	dbw 13, KNOCK_OFF
	dbw 16, BULLDOZE
	dbw 19, POISON_TAIL
	dbw 22, ACROBATICS
	dbw 25, FOCUS_ENERGY
	dbw 28, MAGNITUDE
	dbw 31, SANDSTORM
	dbw 34, U_TURN
	dbw 37, NIGHT_SLASH
	dbw 40, SCREECH
	dbw 43, POISON_JAB
	dbw 46, EARTHQUAKE
	dbw 49, SWORDS_DANCE
	dbw 52, TOXIC
	dbw 55, CRABHAMMER
	dbw 58, SKY_ATTACK
	dbw 62, FISSURE
	dbw 66, GUILLOTINE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, STEELIXX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, BIND
	dbw 4, ROCK_THROW
	dbw 7, SCREECH
	dbw 10, ROLLOUT
	dbw 13, ROCK_TOMB
	dbw 16, CURSE
	dbw 19, BREAKING_SWIPE
	dbw 22, BULLDOZE
	dbw 25, GYRO_BALL
	dbw 28, SANDSTORM
	dbw 31, REST
	dbw 37, CRUNCH
	dbw 40, ROCK_SLIDE
	dbw 43, BODY_PRESS
	dbw 46, EARTHQUAKE
	dbw 50, HEAVY_SLAM
	dbw 55, IRON_TAIL
	dbw 60, DOUBLE_EDGE
	dbw 65, COSMIC_POWER
	dbw 70, FISSURE
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, GRANBULL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCARY_FACE
	dbw 1, TAIL_WHIP
	dbw 4, CHARM
	dbw 7, BITE
	dbw 10, ROAR
	dbw 13, FAINT_ATTACK
	dbw 16, HEADBUTT
	dbw 19, HYPER_FANG
	dbw 22, GLARE
	dbw 25, DIZZY_PUNCH
	dbw 28, FACADE
	dbw 31, KNOCK_OFF
	dbw 34, CRUNCH
	dbw 37, PLAY_ROUGH
	dbw 40, REST
	dbw 43, BULK_UP
	dbw 46, BODY_SLAM
	dbw 49, SUCKER_PUNCH
	dbw 52, DRAIN_PUNCH
	dbw 55, SWORDS_DANCE
	dbw 58, DOUBLE_EDGE
	dbw 62, THRASH
	dbw 66, OUTRAGE
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCARY_FACE
	dbw 1, TAIL_WHIP
	dbw 4, CHARM
	dbw 7, BITE
	dbw 10, ROAR
	dbw 13, FAINT_ATTACK
	dbw 16, HEADBUTT
	dbw 19, HYPER_FANG
	dbw 22, GLARE
	dbw 25, DIZZY_PUNCH
	dbw 28, FACADE
	dbw 31, KNOCK_OFF
	dbw 34, CRUNCH
	dbw 37, PLAY_ROUGH
	dbw 40, REST
	dbw 43, BULK_UP
	dbw 46, BODY_SLAM
	dbw 49, SUCKER_PUNCH
	dbw 52, DRAIN_PUNCH
	dbw 55, SWORDS_DANCE
	dbw 58, DOUBLE_EDGE
	dbw 62, THRASH
	dbw 66, OUTRAGE
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions	
	dbw 1, TACKLE
	dbw 1, POISON_STING
	dbw 1, WATER_GUN
	dbw 4, HARDEN
	dbw 7, DEFENSE_CURL
	dbw 10, MINIMIZE
	dbw 13, ROLLOUT
	dbw 16, SPIKES
	dbw 19, BUBBLEBEAM
	dbw 22, TOXIC
	dbw 25, HAZE
	dbw 28, SPIKE_CANNON
	dbw 31, AQUA_RING
	dbw 34, SELFDESTRUCT
	dbw 37, ACID_ARMOR
	dbw 40, SCALD
	dbw 43, PAIN_SPLIT
	dbw 46, POISON_JAB
	dbw 49, RECOVER
	dbw 52, BODY_PRESS
	dbw 55, DESTINY_BOND
	dbw 58, SLUDGE_WAVE
	dbw 62, HYDRO_PUMP
	dbw 66, EXPLOSION
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, SCIZORX
	db 0 ; no more evolutions
	dbw 1, BULLET_PUNCH
	dbw 1, LEER
	dbw 1, STRING_SHOT
	dbw 4, FOCUS_ENERGY
	dbw 7, FALSE_SWIPE
	dbw 10, FURY_CUTTER
	dbw 13, METAL_CLAW
	dbw 16, PURSUIT
	dbw 19, AERIAL_ACE
	dbw 22, AGILITY
	dbw 25, SLASH
	dbw 28, U_TURN
	dbw 31, KNOCK_OFF
	dbw 34, PSYCHO_CUT
	dbw 37, DOUBLE_TEAM
	dbw 40, NIGHT_SLASH
	dbw 43, VICEGRIP
	dbw 46, LEAF_BLADE
	dbw 50, SWORDS_DANCE
	dbw 55, BATON_PASS
	dbw 60, IRON_TAIL
	dbw 65, GUILLOTINE
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, WITHDRAW
	dbw 1, BIDE
	dbw 4, WRAP
	dbw 7, ROCK_THROW
	dbw 10, ENCORE
	dbw 13, ROLLOUT
	dbw 16, SAFEGUARD
	dbw 19, SPIKES
	dbw 22, TOXIC
	dbw 25, LEECH_SEED
	dbw 28, COUNTER
	dbw 31, REST
	dbw 34, MIRROR_COAT
	dbw 37, CURSE
	dbw 40, AMNESIA
	dbw 43, BATON_PASS
	dbw 46, ROCK_SLIDE
	dbw 49, COSMIC_POWER
	dbw 52, KNOCK_OFF
	dbw 55, SUBSTITUTE
	dbw 58, STONE_EDGE
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, HERACROSSX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, ARM_THRUST
	dbw 4, FURY_ATTACK
	dbw 7, ENDURE
	dbw 10, DOUBLE_KICK
	dbw 13, HORN_ATTACK
	dbw 16, FURY_CUTTER
	dbw 19, TWINEEDLE
	dbw 22, COUNTER
	dbw 25, ROCK_BLAST
	dbw 28, FACADE
	dbw 31, FLAIL
	dbw 34, KNOCK_OFF
	dbw 37, TRIPLE_KICK
	dbw 40, CROSS_CHOP
	dbw 43, ROCK_SLIDE
	dbw 46, NIGHT_SLASH
	dbw 49, SWORDS_DANCE
	dbw 52, THRASH
	dbw 55, MEGAHORN
	dbw 58, STONE_EDGE
	dbw 62, SUBMISSION
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, WEAVILE
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, TAUNT
	dbw 4, QUICK_ATTACK
	dbw 7, METAL_CLAW
	dbw 10, ICE_BALL
	dbw 13, FAINT_ATTACK
	dbw 16, FURY_SWIPES
	dbw 19, PURSUIT
	dbw 22, ICY_WIND
	dbw 25, SCREECH
	dbw 28, KNOCK_OFF
	dbw 31, ICICLE_SPEAR
	dbw 34, PSYCHO_CUT
	dbw 37, SUCKER_PUNCH
	dbw 40, ICICLE_CRASH
	dbw 43, SWORDS_DANCE
	dbw 46, NIGHT_SLASH
	dbw 49, SHADOW_CLAW
	dbw 52, AGILITY
	dbw 55, SLASH
	dbw 58, BEAT_UP
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, SWEET_SCENT
	dbw 4, BITE
	dbw 7, CHARM
	dbw 10, FURY_SWIPES
	dbw 13, FAINT_ATTACK
	dbw 16, HEADBUTT
	dbw 19, SCARY_FACE
	dbw 22, BULLDOZE
	dbw 25, CRUSH_CLAW
	dbw 28, REST
	dbw 30, SNORE
	dbw 32, FACADE
	dbw 35, SLASH
	dbw 38, CRUNCH
	dbw 41, PLAY_ROUGH
	dbw 44, BULK_UP
	dbw 47, NIGHT_SLASH
	dbw 50, EARTHQUAKE
	dbw 53, SWORDS_DANCE
	dbw 56, SHADOW_CLAW
	dbw 59, ROCK_SLIDE
	dbw 62, THRASH
	dbw 66, DOUBLE_EDGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	dbbw EVOLVE_LEVEL, 48, URSALUNA
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, SWEET_SCENT
	dbw 4, BITE
	dbw 7, CHARM
	dbw 10, FURY_SWIPES
	dbw 13, FAINT_ATTACK
	dbw 16, HEADBUTT
	dbw 19, SCARY_FACE
	dbw 22, BULLDOZE
	dbw 25, CRUSH_CLAW
	dbw 28, REST
	dbw 30, SNORE
	dbw 32, FACADE
	dbw 35, SLASH
	dbw 38, CRUNCH
	dbw 41, PLAY_ROUGH
	dbw 44, BULK_UP
	dbw 47, NIGHT_SLASH
	dbw 50, EARTHQUAKE
	dbw 53, SWORDS_DANCE
	dbw 56, SHADOW_CLAW
	dbw 59, ROCK_SLIDE
	dbw 62, THRASH
	dbw 66, DOUBLE_EDGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGCARGO
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 1, YAWN
	dbw 4, EMBER
	dbw 7, HARDEN
	dbw 10, ROCK_THROW
	dbw 13, FIRE_SPIN
	dbw 16, ANCIENTPOWER
	dbw 19, MUD_SHOT
	dbw 22, WILLOWISP
	dbw 25, SUNNY_DAY
	dbw 28, SANDSTORM
	dbw 31, MYSTICAL_FIRE
	dbw 34, AMNESIA
	dbw 37, LAVA_PLUME
	dbw 40, RECOVER
	dbw 43, POWER_GEM
	dbw 46, COSMIC_POWER
	dbw 49, EARTHPOWER
	dbw 52, FLAMETHROWER
	dbw 55, HEAT_WAVE
	dbw 60, FIRE_BLAST
	dbw 65, BLAST_BURN
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, MAGCARGOX
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 1, YAWN
	dbw 4, EMBER
	dbw 7, HARDEN
	dbw 10, ROCK_THROW
	dbw 13, FIRE_SPIN
	dbw 16, ANCIENTPOWER
	dbw 19, MUD_SHOT
	dbw 22, WILLOWISP
	dbw 25, SUNNY_DAY
	dbw 28, SANDSTORM
	dbw 31, MYSTICAL_FIRE
	dbw 34, AMNESIA
	dbw 37, LAVA_PLUME
	dbw 40, RECOVER
	dbw 43, POWER_GEM
	dbw 46, COSMIC_POWER
	dbw 49, EARTHPOWER
	dbw 52, FLAMETHROWER
	dbw 55, HEAT_WAVE
	dbw 60, FIRE_BLAST
	dbw 65, BLAST_BURN
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PILOSWINE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 1, MUD_SLAP
	dbw 4, SAND_ATTACK
	dbw 7, ICE_BALL
	dbw 10, FLAIL
	dbw 13, BULLDOZE
	dbw 16, ICE_FANG
	dbw 19, TAKE_DOWN
	dbw 22, ICY_WIND
	dbw 25, HAIL
	dbw 28, CURSE
	dbw 31, ICICLE_SPEAR
	dbw 34, ROCK_SLIDE
	dbw 37, BODY_SLAM
	dbw 40, ICICLE_CRASH
	dbw 43, BULK_UP
	dbw 46, EARTHQUAKE
	dbw 49, THRASH
	dbw 52, DOUBLE_EDGE
	dbw 55, STONE_EDGE
	dbw 60, HEAVY_SLAM
	dbw 65, MEGAHORN
	dbw 70, FISSURE
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, MAMOSWINE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 1, MUD_SLAP
	dbw 4, SAND_ATTACK
	dbw 7, ICE_BALL
	dbw 10, FLAIL
	dbw 13, BULLDOZE
	dbw 16, ICE_FANG
	dbw 19, TAKE_DOWN
	dbw 22, ICY_WIND
	dbw 25, HAIL
	dbw 28, CURSE
	dbw 31, ICICLE_SPEAR
	dbw 34, ROCK_SLIDE
	dbw 37, BODY_SLAM
	dbw 40, ICICLE_CRASH
	dbw 43, BULK_UP
	dbw 46, EARTHQUAKE
	dbw 49, THRASH
	dbw 52, DOUBLE_EDGE
	dbw 55, STONE_EDGE
	dbw 60, HEAVY_SLAM
	dbw 65, MEGAHORN
	dbw 70, FISSURE
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, BUBBLE
	dbw 4, WATER_GUN
	dbw 7, DEFENSE_CURL
	dbw 10, AQUA_RING
	dbw 13, ROLLOUT
	dbw 16, RECOVER
	dbw 19, BUBBLEBEAM
	dbw 22, FROSTBITE
	dbw 25, ANCIENTPOWER
	dbw 28, RAPID_SPIN
	dbw 31, SPIKES
	dbw 34, SAFEGUARD
	dbw 37, FLAIL
	dbw 40, COSMIC_POWER
	dbw 43, POWER_GEM
	dbw 46, HEAL_BELL
	dbw 49, MIRROR_COAT
	dbw 52, MIST_BALL
	dbw 55, EARTHPOWER
	dbw 58, SCALD
	dbw 62, HYDRO_PUMP
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, FOCUS_ENERGY
	dbw 4, SMOKESCREEN
	dbw 7, WATER_PULSE
	dbw 10, AURORA_BEAM
	dbw 13, LOCK_ON
	dbw 16, PSYBEAM
	dbw 19, BUBBLEBEAM
	dbw 22, CHARGE_BEAM
	dbw 25, OCTAZOOKA
	dbw 28, MYSTICAL_FIRE
	dbw 31, SCALD
	dbw 34, MEDITATE
	dbw 37, ICE_BEAM
	dbw 40, FLAMETHROWER
	dbw 43, RECOVER
	dbw 46, SIGNAL_BEAM
	dbw 49, HYDRO_PUMP
	dbw 52, ZAP_CANNON
	dbw 55, FIRE_BLAST
	dbw 58, SOLARBEAM
	dbw 62, HYPER_BEAM
	dbw 66, WATER_SPOUT
	dbw 70, ERUPTION
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, OCTILLERY2
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, FOCUS_ENERGY
	dbw 4, SMOKESCREEN
	dbw 7, WATER_PULSE
	dbw 10, AURORA_BEAM
	dbw 13, LOCK_ON
	dbw 16, PSYBEAM
	dbw 19, BUBBLEBEAM
	dbw 22, CHARGE_BEAM
	dbw 25, OCTAZOOKA
	dbw 28, MYSTICAL_FIRE
	dbw 31, SCALD
	dbw 34, MEDITATE
	dbw 37, ICE_BEAM
	dbw 40, FLAMETHROWER
	dbw 43, RECOVER
	dbw 46, SIGNAL_BEAM
	dbw 49, HYDRO_PUMP
	dbw 52, ZAP_CANNON
	dbw 55, FIRE_BLAST
	dbw 58, SOLARBEAM
	dbw 62, HYPER_BEAM
	dbw 66, WATER_SPOUT
	dbw 70, ERUPTION
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PRESENT
	dbw 1, POWDER_SNOW
	dbw 1, GUST
	dbw 4, QUICK_ATTACK
	dbw 7, ICE_BALL
	dbw 10, ICY_WIND
	dbw 13, SPIKES
	dbw 16, RAPID_SPIN
	dbw 19, FROSTBITE
	dbw 22, AURORA_BEAM
	dbw 25, HAZE
	dbw 28, WING_ATTACK
	dbw 30, RAZOR_WIND
	dbw 32, REFLECT
	dbw 34, LIGHT_SCREEN
	dbw 36, ENCORE
	dbw 38, DRILL_PECK
	dbw 40, ICE_BEAM
	dbw 43, HAIL
	dbw 46, ICICLE_CRASH
	dbw 49, BATON_PASS
	dbw 52, BELLY_DRUM
	dbw 55, BLIZZARD
	dbw 60, SKY_ATTACK
	dbw 65, HURRICANE
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, BUBBLE
	dbw 1, SUPERSONIC
	dbw 4, GUST
	dbw 7, WATER_PULSE
	dbw 10, CONFUSE_RAY
	dbw 13, PSYBEAM
	dbw 16, AIR_CUTTER
	dbw 19, BUBBLEBEAM
	dbw 22, AQUA_RING
	dbw 25, AGILITY
	dbw 28, HAZE
	dbw 31, LIGHT_SCREEN
	dbw 34, RAIN_DANCE
	dbw 37, MIST_BALL
	dbw 40, MIRROR_COAT
	dbw 43, MEDITATE
	dbw 46, MOONLIGHT
	dbw 49, AMNESIA
	dbw 52, HYDRO_PUMP
	dbw 56, SIGNAL_BEAM
	dbw 60, HURRICANE
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, SKARMORY2
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 1, SAND_ATTACK
	dbw 4, METAL_CLAW
	dbw 7, FURY_ATTACK
	dbw 10, WHIRLWIND
	dbw 13, STEEL_WING
	dbw 16, SPIKES
	dbw 19, AGILITY
	dbw 22, WING_ATTACK
	dbw 25, CURSE
	dbw 28, RECOVER
	dbw 31, SAFEGUARD
	dbw 34, U_TURN
	dbw 37, TOXIC
	dbw 40, DRILL_PECK
	dbw 43, BODY_PRESS
	dbw 46, VICEGRIP
	dbw 49, SWORDS_DANCE
	dbw 52, KNOCK_OFF
	dbw 55, SKY_ATTACK
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, HOUNDOOM
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 4, SMOG
	dbw 7, BITE
	dbw 10, ROAR
	dbw 13, FIRE_SPIN
	dbw 16, FAINT_ATTACK
	dbw 19, SNARL
	dbw 22, FIRE_FANG
	dbw 25, WILLOWISP
	dbw 28, PURSUIT
	dbw 31, TAUNT
	dbw 34, MYSTICAL_FIRE
	dbw 37, CRUNCH
	dbw 40, FLAMETHROWER
	dbw 43, SUNNY_DAY
	dbw 46, SUCKER_PUNCH
	dbw 49, DARK_PULSE
	dbw 52, CALM_MIND
	dbw 55, ICE_FANG
	dbw 58, HEAT_WAVE
	dbw 62, FIRE_BLAST
	dbw 66, BEAT_UP
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, HOUNDOOMX
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 4, SMOG
	dbw 7, BITE
	dbw 10, ROAR
	dbw 13, FIRE_SPIN
	dbw 16, FAINT_ATTACK
	dbw 19, SNARL
	dbw 22, FIRE_FANG
	dbw 25, WILLOWISP
	dbw 28, PURSUIT
	dbw 31, TAUNT
	dbw 34, MYSTICAL_FIRE
	dbw 37, CRUNCH
	dbw 40, FLAMETHROWER
	dbw 43, SUNNY_DAY
	dbw 46, SUCKER_PUNCH
	dbw 49, DARK_PULSE
	dbw 52, CALM_MIND
	dbw 55, ICE_FANG
	dbw 58, HEAT_WAVE
	dbw 62, FIRE_BLAST
	dbw 66, BEAT_UP
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, LEER
	dbw 4, SMOKESCREEN
	dbw 7, BUBBLE
	dbw 10, TWISTER
	dbw 13, FOCUS_ENERGY
	dbw 16, AQUA_JET
	dbw 19, BUBBLEBEAM
	dbw 22, DRAGON_RAGE
	dbw 25, AGILITY
	dbw 28, POISON_TAIL
	dbw 31, RAZOR_WIND
	dbw 34, RAIN_DANCE
	dbw 37, OCTAZOOKA
	dbw 40, DRAGONBREATH
	dbw 43, MIST_BALL
	dbw 46, WATERFALL
	dbw 50, DRAGON_DANCE
	dbw 55, RECOVER
	dbw 60, HYDRO_PUMP
	dbw 65, AMNESIA
	dbw 70, OUTRAGE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, DEFENSE_CURL
	dbw 4, SAND_ATTACK
	dbw 7, FLAIL
	dbw 10, ROLLOUT
	dbw 13, FURY_ATTACK
	dbw 16, BULLDOZE
	dbw 19, HORN_ATTACK
	dbw 22, SLAM
	dbw 25, RAPID_SPIN
	dbw 28, TAKE_DOWN
	dbw 31, KNOCK_OFF
	dbw 34, CHARM
	dbw 37, GYRO_BALL
	dbw 40, EARTHQUAKE
	dbw 43, SANDSTORM
	dbw 46, BULK_UP
	dbw 49, ROCK_SLIDE
	dbw 52, PLAY_ROUGH
	dbw 55, HEAVY_SLAM
	dbw 58, DOUBLE_EDGE
	dbw 62, MEGAHORN
	dbw 66, STONE_EDGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, DEFENSE_CURL
	dbw 4, SAND_ATTACK
	dbw 7, FLAIL
	dbw 10, ROLLOUT
	dbw 13, FURY_ATTACK
	dbw 16, BULLDOZE
	dbw 19, HORN_ATTACK
	dbw 22, SLAM
	dbw 25, RAPID_SPIN
	dbw 28, TAKE_DOWN
	dbw 31, KNOCK_OFF
	dbw 34, CHARM
	dbw 37, GYRO_BALL
	dbw 40, EARTHQUAKE
	dbw 43, SANDSTORM
	dbw 46, BULK_UP
	dbw 49, ROCK_SLIDE
	dbw 52, PLAY_ROUGH
	dbw 55, HEAVY_SLAM
	dbw 58, DOUBLE_EDGE
	dbw 62, MEGAHORN
	dbw 66, STONE_EDGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	dbww EVOLVE_ITEM, UP_GRADE, PORYGONZ
	dbbw EVOLVE_LEVEL, 42, PORYGONZ
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 1, CONVERSION2
	dbw 1, SHARPEN
	dbw 4, THUNDERSHOCK
	dbw 7, THUNDER_WAVE
	dbw 10, AGILITY
	dbw 13, CHARGE_BEAM
	dbw 16, RECOVER
	dbw 19, PSYBEAM
	dbw 22, SHOCK_WAVE
	dbw 25, SIGNAL_BEAM
	dbw 28, LOCK_ON
	dbw 31, CHARGE
	dbw 34, TRI_ATTACK
	dbw 37, DISCHARGE
	dbw 40, THUNDERBOLT
	dbw 43, MIRROR_COAT
	dbw 46, HYPER_VOICE
	dbw 50, ZAP_CANNON
	dbw 55, TRANSFORM
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, WYRDEER
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, ASTONISH
	dbw 4, SAND_ATTACK
	dbw 7, CONFUSION
	dbw 10, HYPNOSIS
	dbw 13, STOMP
	dbw 16, NIGHT_SHADE
	dbw 19, CONFUSE_RAY
	dbw 22, PSYBEAM
	dbw 25, WILLOWISP
	dbw 28, HEX
	dbw 31, REFLECT
	dbw 34, LIGHT_SCREEN
	dbw 37, ZEN_HEADBUTT
	dbw 40, TAKE_DOWN
	dbw 43, PSYCHIC_M
	dbw 46, MEDITATE
	dbw 49, DREAM_EATER
	dbw 52, SWORDS_DANCE
	dbw 55, EARTHPOWER
	dbw 58, DOUBLE_EDGE
	dbw 62, MEGAHORN
	dbw 66, FUTURE_SIGHT
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
	dbw 1, FOCUS_ENERGY
	dbw 4, FORESIGHT
	dbw 7, LOW_KICK
	dbw 10, MACH_PUNCH
	dbw 13, DOUBLE_KICK
	dbw 16, RAPID_SPIN
	dbw 19, ROCK_SMASH
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FOCUS_ENERGY
	dbw 1, LOW_KICK
	dbw 4, QUICK_ATTACK
	dbw 7, AGILITY
	dbw 10, RAPID_SPIN
	dbw 13, MACH_PUNCH
	dbw 16, DOUBLE_KICK
	dbw 19, ROLLING_KICK
	dbw 22, PURSUIT
	dbw 25, FAINT_ATTACK
	dbw 28, FORCE_PALM
	dbw 31, TRIPLE_KICK
	dbw 34, DIZZY_PUNCH
	dbw 37, GYRO_BALL
	dbw 40, BLAZE_KICK
	dbw 43, SUCKER_PUNCH
	dbw 46, BULK_UP
	dbw 50, COUNTER
	dbw 55, BATON_PASS
	dbw 60, DETECT
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, LICK
	dbw 4, POWDER_SNOW
	dbw 7, CONFUSION
	dbw 10, LOVELY_KISS
	dbw 13, SWEET_KISS
	dbw 16, DOUBLESLAP
	dbw 19, DRAININGKISS
	dbw 22, FROSTBITE
	dbw 25, ICE_PUNCH
	dbw 28, PSYBEAM
	dbw 31, MEAN_LOOK
	dbw 34, HEX
	dbw 37, MEDITATE
	dbw 40, PSYCHIC_M
	dbw 43, ICE_BEAM
	dbw 46, CALM_MIND
	dbw 50, HYPER_VOICE
	dbw 55, PERISH_SONG
	dbw 60, DREAM_EATER
	dbw 65, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 4, QUICK_ATTACK
	dbw 7, THUNDER_WAVE
	dbw 10, MACH_PUNCH
	dbw 13, CHARGE_BEAM
	dbw 16, LIGHT_SCREEN
	dbw 19, ELECTRO_BALL
	dbw 22, SCREECH
	dbw 25, THUNDERPUNCH
	dbw 28, DIZZY_PUNCH
	dbw 31, LOW_KICK
	dbw 34, DISCHARGE
	dbw 37, CONFUSE_RAY
	dbw 40, THUNDERBOLT
	dbw 43, CROSS_CHOP
	dbw 46, FAERIEGLEAM
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
	dbw 4, SMOG
	dbw 7, SMOKESCREEN
	dbw 10, MACH_PUNCH
	dbw 13, FIRE_SPIN
	dbw 16, FLAME_WHEEL
	dbw 19, SCARY_FACE
	dbw 22, FIRE_PUNCH
	dbw 25, WILLOWISP
	dbw 28, FAINT_ATTACK
	dbw 31, LOW_KICK
	dbw 34, LAVA_PLUME
	dbw 37, CONFUSE_RAY
	dbw 40, FLAMETHROWER
	dbw 43, SLUDGE_WAVE
	dbw 46, MYSTICAL_FIRE
	dbw 50, BRICK_BREAK
	dbw 55, SUNNY_DAY
	dbw 60, PSYCHIC_M
	dbw 65, FIRE_BLAST
	dbw 70, ERUPTION
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, DEFENSE_CURL
	dbw 4, TAIL_WHIP
	dbw 7, ROLLOUT
	dbw 10, STOMP
	dbw 13, MILK_DRINK
	dbw 16, SCARY_FACE
	dbw 19, HEADBUTT
	dbw 22, CHARM
	dbw 25, MAGNITUDE
	dbw 28, BODY_SLAM
	dbw 31, HEAL_BELL
	dbw 34, ZEN_HEADBUTT
	dbw 37, BULK_UP
	dbw 40, PLAY_ROUGH
	dbw 43, COUNTER
	dbw 46, EARTHQUAKE
	dbw 49, COSMIC_POWER
	dbw 52, DOUBLE_EDGE
	dbw 55, GYRO_BALL
	dbw 60, HEAVY_SLAM
	dbw 65, OUTRAGE
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 7, CHARM
	dbw 10, SWEET_KISS
	dbw 13, SOFTBOILED
	dbw 16, DOUBLESLAP
	dbw 19, SEISMIC_TOSS
	dbw 22, MINIMIZE
	dbw 25, SING
	dbw 28, HEAL_BELL
	dbw 31, EGG_BOMB
	dbw 34, LIGHT_SCREEN
	dbw 37, REFLECT
	dbw 40, CALM_MIND
	dbw 43, HYPER_VOICE
	dbw 46, COUNTER
	dbw 50, MOONBLAST
	dbw 55, SUBSTITUTE
	dbw 60, METRONOME
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, LEER
	dbw 1, QUICK_ATTACK
	dbw 4, BITE
	dbw 8, CHARGE_BEAM
	dbw 12, SPARK
	dbw 16, ROAR
	dbw 20, SHOCK_WAVE
	dbw 24, THUNDER_WAVE
	dbw 28, FAINT_ATTACK
	dbw 32, REFLECT
	dbw 36, CALM_MIND
	dbw 40, VOLT_SWITCH
	dbw 44, THUNDER_FANG
	dbw 48, EXTRASENSORY
	dbw 52, THUNDERBOLT
	dbw 56, CRUNCH
	dbw 60, EXTREMESPEED
	dbw 65, THUNDER
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 1, BITE
	dbw 4, SMOKESCREEN
	dbw 8, FLAME_CHARGE
	dbw 12, STOMP
	dbw 16, ROAR
	dbw 20, FIRE_SPIN
	dbw 24, FIRE_FANG
	dbw 28, SCARY_FACE
	dbw 32, SUNNY_DAY
	dbw 36, CRUNCH
	dbw 40, FLAME_WHEEL
	dbw 44, LAVA_PLUME
	dbw 48, EXTRASENSORY
	dbw 52, CALM_MIND
	dbw 56, FLAMETHROWER
	dbw 60, SACRED_FIRE
	dbw 65, EXTREMESPEED
	dbw 70, FIRE_BLAST
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, LEER
	dbw 1, GUST
	dbw 4, WATER_PULSE
	dbw 8, BITE
	dbw 12, AURORA_BEAM
	dbw 16, ROAR
	dbw 20, BUBBLEBEAM
	dbw 24, SAFEGUARD
	dbw 28, ICE_FANG
	dbw 32, CALM_MIND
	dbw 36, RECOVER
	dbw 40, MIST_BALL
	dbw 44, CRUNCH
	dbw 48, EXTRASENSORY
	dbw 52, RAIN_DANCE
	dbw 56, MIRROR_COAT
	dbw 60, HYDRO_PUMP
	dbw 65, EXTREMESPEED
	dbw 70, BLIZZARD
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, BITE
	dbw 1, LEER
	dbw 4, SAND_ATTACK
	dbw 7, ROCK_THROW
	dbw 10, SCREECH
	dbw 13, BULLDOZE
	dbw 16, FAINT_ATTACK
	dbw 19, SANDSTORM
	dbw 22, SCARY_FACE
	dbw 25, ROCK_BLAST
	dbw 28, PURSUIT
	dbw 31, SPIKES
	dbw 34, CRUNCH
	dbw 37, POWER_GEM
	dbw 40, ROCK_SLIDE
	dbw 43, DARK_PULSE
	dbw 46, KNOCK_OFF
	dbw 49, EARTHPOWER
	dbw 52, DRAGON_DANCE
	dbw 55, THRASH
	dbw 58, STONE_EDGE
	dbw 62, OUTRAGE
	dbw 66, BEAT_UP
	dbw 70, FISSURE
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, BITE
	dbw 1, LEER
	dbw 4, SAND_ATTACK
	dbw 7, ROCK_THROW
	dbw 10, SCREECH
	dbw 13, BULLDOZE
	dbw 16, FAINT_ATTACK
	dbw 19, SANDSTORM
	dbw 22, SCARY_FACE
	dbw 25, ROCK_BLAST
	dbw 28, PURSUIT
	dbw 31, SPIKES
	dbw 34, CRUNCH
	dbw 37, POWER_GEM
	dbw 40, ROCK_SLIDE
	dbw 43, DARK_PULSE
	dbw 46, KNOCK_OFF
	dbw 49, EARTHPOWER
	dbw 52, DRAGON_DANCE
	dbw 55, THRASH
	dbw 58, STONE_EDGE
	dbw 62, OUTRAGE
	dbw 66, BEAT_UP
	dbw 70, FISSURE
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	dbww EVOLVE_ITEM, JOHTOITE_X, TYRANITARX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, BITE
	dbw 1, LEER
	dbw 4, SAND_ATTACK
	dbw 7, ROCK_THROW
	dbw 10, SCREECH
	dbw 13, BULLDOZE
	dbw 16, FAINT_ATTACK
	dbw 19, SANDSTORM
	dbw 22, SCARY_FACE
	dbw 25, ROCK_BLAST
	dbw 28, PURSUIT
	dbw 31, SPIKES
	dbw 34, CRUNCH
	dbw 37, POWER_GEM
	dbw 40, ROCK_SLIDE
	dbw 43, DARK_PULSE
	dbw 46, KNOCK_OFF
	dbw 49, EARTHPOWER
	dbw 52, DRAGON_DANCE
	dbw 55, THRASH
	dbw 58, STONE_EDGE
	dbw 62, OUTRAGE
	dbw 66, BEAT_UP
	dbw 70, FISSURE
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, WHIRLWIND
	dbw 1, CONFUSION
	dbw 4, WATER_GUN
	dbw 8, MIST
	dbw 12, SAFEGUARD
	dbw 16, BUBBLEBEAM
	dbw 20, AIR_CUTTER
	dbw 24, ANCIENTPOWER
	dbw 28, CALM_MIND
	dbw 32, EXTRASENSORY
	dbw 36, RECOVER
	dbw 40, MIST_BALL
	dbw 44, PSYCHIC_M
	dbw 48, RAIN_DANCE
	dbw 52, HYDRO_PUMP
	dbw 56, FUTURE_SIGHT
	dbw 60, AEROBLAST
	dbw 65, HURRICANE
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, EMBER
	dbw 1, WHIRLWIND
	dbw 4, WEATHER_BALL
	dbw 8, SAFEGUARD
	dbw 12, FIRE_SPIN
	dbw 16, FLAME_CHARGE
	dbw 20, WING_ATTACK
	dbw 24, ANCIENTPOWER
	dbw 28, CALM_MIND
	dbw 32, EXTRASENSORY
	dbw 36, RECOVER
	dbw 40, FLAME_WHEEL
	dbw 44, SUNNY_DAY
	dbw 48, DRILL_PECK
	dbw 52, HEAT_WAVE
	dbw 56, FUTURE_SIGHT
	dbw 60, SACRED_FIRE
	dbw 65, SKY_ATTACK
	dbw 70, FIRE_BLAST
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEECH_SEED
	dbw 1, PIXIE_DUST
	dbw 1, CONFUSION
	dbw 4, MAGICAL_LEAF
	dbw 8, STUN_SPORE
	dbw 12, SLEEP_POWDER
	dbw 16, ANCIENTPOWER
	dbw 20, FAE_VOICE
	dbw 24, PSYBEAM
	dbw 28, SAFEGUARD
	dbw 32, BATON_PASS
	dbw 36, MOONBLAST
	dbw 40, RECOVER
	dbw 44, GIGA_DRAIN
	dbw 48, HEAL_BELL
	dbw 52, CALM_MIND
	dbw 56, PSYCHIC_M
	dbw 60, FUTURE_SIGHT
	dbw 65, PERISH_SONG
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

MunchlaxEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SNORLAX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LICK
	dbw 1, DEFENSE_CURL
	dbw 4, METRONOME
	dbw 7, AMNESIA
	dbw 10, YAWN
	dbw 13, BITE
	dbw 16, STOMP
	dbw 19, HEADBUTT
	dbw 22, SNORE
	dbw 25, REST
	dbw 28, COUNTER
	dbw 31, CRUSH_CLAW
	dbw 34, BODY_SLAM
	dbw 37, ZEN_HEADBUTT
	dbw 40, BULK_UP
	dbw 43, HEAVY_SLAM
	dbw 46, CRUNCH
	dbw 50, BELLY_DRUM
	dbw 55, EARTHQUAKE
	dbw 60, OUTRAGE
	dbw 65, DOUBLE_EDGE
	db 0 ; no more level-up moves

ENDSECTION
