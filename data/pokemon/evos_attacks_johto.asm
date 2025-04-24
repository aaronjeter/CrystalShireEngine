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
	dw TreeckoEvosAttacks
	dw GrovyleEvosAttacks
	dw SceptileEvosAttacks
	dw TorchicEvosAttacks
	dw CombuskenEvosAttacks
	dw BlazikenEvosAttacks
	dw MudkipEvosAttacks
	dw MarshtompEvosAttacks
	dw SwampertEvosAttacks
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
	dbw 40, CURSE
	dbw 45, DRAGONBREATH
	dbw 50, GIGA_DRAIN
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
	dbw 40, CURSE
	dbw 45, DRAGONBREATH
	dbw 50, GIGA_DRAIN
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
	dbw 40, CURSE
	dbw 45, DRAGONBREATH
	dbw 50, GIGA_DRAIN
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 14, QUICK_ATTACK
	dbw 18, FIRE_SPIN
	dbw 22, FAINT_ATTACK
	dbw 26, SLAM
	dbw 32, FLAME_WHEEL
	dbw 36, PURSUIT
	dbw 40, FLAMETHROWER
	dbw 45, OUTRAGE
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 14, QUICK_ATTACK
	dbw 18, FIRE_SPIN
	dbw 22, FAINT_ATTACK
	dbw 26, SLAM
	dbw 32, FLAME_WHEEL
	dbw 36, PURSUIT
	dbw 40, FLAMETHROWER
	dbw 45, OUTRAGE
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 14, QUICK_ATTACK
	dbw 18, FIRE_SPIN
	dbw 22, FAINT_ATTACK
	dbw 26, SLAM
	dbw 32, FLAME_WHEEL
	dbw 36, PURSUIT
	dbw 40, FLAMETHROWER
	dbw 45, OUTRAGE
	dbw 50, FIRE_BLAST
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
	dbw 26, FAINT_ATTACK
	dbw 32, CRUNCH
	dbw 36, SLASH
	dbw 40, SCREECH
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
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
	dbw 26, FAINT_ATTACK
	dbw 32, CRUNCH
	dbw 36, SLASH
	dbw 40, SCREECH
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
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
	dbw 26, FAINT_ATTACK
	dbw 32, CRUNCH
	dbw 36, SLASH
	dbw 40, SCREECH
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

SentretEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FURRET
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, DEFENSE_CURL
	dbw 10, SAND_ATTACK
	dbw 12, QUICK_ATTACK
	dbw 15, FURY_SWIPES
	dbw 20, HYPER_FANG
	dbw 25, DIG
	dbw 30, BODY_SLAM
	dbw 36, CRUNCH
	dbw 40, REST
	dbw 42, AMNESIA
	dbw 46, THRASH
	dbw 50, CURSE
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, DEFENSE_CURL
	dbw 10, SAND_ATTACK
	dbw 12, QUICK_ATTACK
	dbw 15, FURY_SWIPES
	dbw 20, HYPER_FANG
	dbw 25, DIG
	dbw 30, BODY_SLAM
	dbw 36, CRUNCH
	dbw 40, REST
	dbw 42, AMNESIA
	dbw 46, THRASH
	dbw 50, CURSE
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
	dbw 42, SWIFT
	dbw 45, SKY_ATTACK
	dbw 50, FUTURE_SIGHT
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
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
	dbw 42, SWIFT
	dbw 45, SKY_ATTACK
	dbw 50, FUTURE_SIGHT
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
	dbw 28, SAFEGUARD
	dbw 30, BATON_PASS
	dbw 32, TWINEEDLE
	dbw 36, SWIFT
	dbw 40, AGILITY
	dbw 42, CROSS_CHOP
	dbw 45, MEGAHORN
	dbw 50, DOUBLE_EDGE
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
	dbw 28, SAFEGUARD
	dbw 30, BATON_PASS
	dbw 32, TWINEEDLE
	dbw 36, SWIFT
	dbw 40, AGILITY
	dbw 42, CROSS_CHOP
	dbw 45, MEGAHORN
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 6, SCARY_FACE
	dbw 11, CONSTRICT
	dbw 16, NIGHT_SHADE
	dbw 20, MEGA_DRAIN
	dbw 24, SLUDGE
	dbw 28, TWINEEDLE
	dbw 30, SPIDER_WEB
	dbw 32, PSYBEAM
	dbw 36, AGILITY
	dbw 40, SLUDGE_BOMB
	dbw 42, PURSUIT
	dbw 45, PSYCHIC_M
	dbw 50, MEGAHORN
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 6, SCARY_FACE
	dbw 11, CONSTRICT
	dbw 16, NIGHT_SHADE
	dbw 20, MEGA_DRAIN
	dbw 24, SLUDGE
	dbw 28, TWINEEDLE
	dbw 30, SPIDER_WEB
	dbw 32, PSYBEAM
	dbw 36, AGILITY
	dbw 40, SLUDGE_BOMB
	dbw 42, PURSUIT
	dbw 45, PSYCHIC_M
	dbw 50, MEGAHORN
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
	dbw 30, CRUNCH
	dbw 32, SLUDGE_BOMB
	dbw 36, MEAN_LOOK
	dbw 40, HAZE
	dbw 45, SKY_ATTACK
	dbw 50, BELLY_DRUM
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, LANTURN
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, THUNDER_WAVE
	dbw 5, SUPERSONIC
	dbw 12, THUNDERSHOCK
	dbw 16, WATER_GUN
	dbw 20, BUBBLEBEAM
	dbw 25, SPARK
	dbw 29, CONFUSE_RAY
	dbw 32, THUNDERBOLT
	dbw 37, AURORA_BEAM
	dbw 41, HYDRO_PUMP
	dbw 44, RAIN_DANCE
	dbw 47, THUNDER
	dbw 50, PROTECT
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, THUNDER_WAVE
	dbw 5, SUPERSONIC
	dbw 12, THUNDERSHOCK
	dbw 16, WATER_GUN
	dbw 20, BUBBLEBEAM
	dbw 25, SPARK
	dbw 29, CONFUSE_RAY
	dbw 32, THUNDERBOLT
	dbw 37, AURORA_BEAM
	dbw 41, HYDRO_PUMP
	dbw 44, RAIN_DANCE
	dbw 47, THUNDER
	dbw 50, PROTECT
	db 0 ; no more level-up moves

PichuEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	dbbw EVOLVE_LEVEL, 20, PIKACHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, SWEET_KISS
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 11, QUICK_ATTACK
	dbw 15, DOUBLE_TEAM
	dbw 20, SLAM
	dbw 26, THUNDERBOLT
	dbw 31, AGILITY
	dbw 36, SWIFT
	dbw 40, MEDITATE
	dbw 41, THUNDER
	dbw 50, LIGHT_SCREEN
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	dbbw EVOLVE_LEVEL, 20, CLEFAIRY
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, SWEET_KISS
	dbw 4, ENCORE
	dbw 8, SING
	dbw 12, DOUBLESLAP
	dbw 16, FAE_VOICE
	dbw 18, MINIMIZE
	dbw 20, METRONOME
	dbw 22, DEFENSE_CURL
	dbw 24, GLARE
	dbw 30, SWIFT
	dbw 36, MOONLIGHT
	dbw 40, REFLECT
	dbw 45, LIGHT_SCREEN
	dbw 50, MEDITATE
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	dbbw EVOLVE_LEVEL, 20, JIGGLYPUFF
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 5, POUND
	dbw 10, SWEET_KISS
	dbw 16, ROLLOUT
	dbw 20, WILLOWISP
	dbw 24, FAE_VOICE
	dbw 28, REST
	dbw 32, BODY_SLAM
	dbw 36, SWIFT
	dbw 40, GLARE
	dbw 45, CURSE
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	dbbw EVOLVE_LEVEL, 25, TOGETIC
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 5, POUND
	dbw 10, SWEET_KISS
	dbw 12, METRONOME
	dbw 25, ENCORE
	dbw 20, SAFEGUARD
	dbw 24, FAE_VOICE
	dbw 32, SWIFT
	dbw 40, WILLOWISP
	dbw 50, OUTRAGE	
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 5, POUND
	dbw 10, SWEET_KISS
	dbw 12, METRONOME
	dbw 25, ENCORE
	dbw 20, SAFEGUARD
	dbw 24, FAE_VOICE
	dbw 28, WING_ATTACK
	dbw 32, SWIFT
	dbw 36, RAZOR_WIND
	dbw 40, WILLOWISP
	dbw 45, SKY_ATTACK
	dbw 50, OUTRAGE	
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
	dbw 32, PSYCHIC_M
	dbw 36, RAZOR_WIND
	dbw 40, MEDITATE
	dbw 42, PURSUIT
	dbw 45, DRILL_PECK
	dbw 50, FUTURE_SIGHT
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
	dbw 32, PSYCHIC_M
	dbw 36, RAZOR_WIND
	dbw 40, MEDITATE
	dbw 42, PURSUIT
	dbw 45, DRILL_PECK
	dbw 50, FUTURE_SIGHT
	db 0 ; no more level-up moves

MareepEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FLAAFFY
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 8, THUNDERSHOCK
	dbw 12, COTTON_SPORE
	dbw 18, THUNDER_WAVE
	dbw 22, SPARK
	dbw 26, LIGHT_SCREEN
	dbw 31, THUNDERBOLT
	dbw 36, DRAGONBREATH
	dbw 40, RECOVER
	dbw 42, RAIN_DANCE
	dbw 45, THUNDER
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, AMPHAROS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 8, THUNDERSHOCK
	dbw 12, COTTON_SPORE
	dbw 18, THUNDER_WAVE
	dbw 22, SPARK
	dbw 26, LIGHT_SCREEN
	dbw 31, THUNDERBOLT
	dbw 36, DRAGONBREATH
	dbw 40, RECOVER
	dbw 42, RAIN_DANCE
	dbw 45, THUNDER
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 8, THUNDERSHOCK
	dbw 12, COTTON_SPORE
	dbw 18, THUNDER_WAVE
	dbw 22, SPARK
	dbw 26, LIGHT_SCREEN
	dbw 31, THUNDERBOLT
	dbw 36, DRAGONBREATH
	dbw 40, RECOVER
	dbw 42, RAIN_DANCE
	dbw 45, THUNDER
	dbw 50, OUTRAGE
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
	dbw 21, RAZOR_LEAF
	dbw 26, FAE_VOICE
	dbw 31, GIGA_DRAIN
	dbw 35, SYNTHESIS
	dbw 40, PETAL_DANCE
	dbw 42, SWIFT
	dbw 45, SUNNY_DAY
	dbw 50, SOLARBEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, AZUMARILL
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 3, DEFENSE_CURL
	dbw 6, TAIL_WHIP
	dbw 10, POUND
	dbw 16, ROLLOUT
	dbw 20, BUBBLEBEAM
	dbw 24, DIZZY_PUNCH
	dbw 28, BELLY_DRUM
	dbw 32, SWIFT
	dbw 36, RAIN_DANCE
	dbw 40, DOUBLE_EDGE
	dbw 42, PERISH_SONG
	dbw 45, AMNESIA
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 3, DEFENSE_CURL
	dbw 6, TAIL_WHIP
	dbw 10, POUND
	dbw 16, ROLLOUT
	dbw 20, BUBBLEBEAM
	dbw 24, DIZZY_PUNCH
	dbw 28, BELLY_DRUM
	dbw 32, SWIFT
	dbw 36, RAIN_DANCE
	dbw 40, DOUBLE_EDGE
	dbw 42, PERISH_SONG
	dbw 45, AMNESIA
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ROCK_THROW
	dbw 1, MIMIC
	dbw 10, FLAIL
	dbw 15, LOW_KICK
	dbw 20, ROLLOUT
	dbw 25, MAGNITUDE
	dbw 28, SKETCH
	dbw 32, ROCK_SLIDE
	dbw 36, PURSUIT
	dbw 40, BODY_SLAM
	dbw 45, SKETCH
	dbw 50, SUBMISSION
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 19, BUBBLEBEAM
	dbw 25, RAIN_DANCE
	dbw 31, BODY_SLAM
	dbw 37, AMNESIA
	dbw 40, PERISH_SONG
	dbw 43, HYDRO_PUMP
	dbw 45, MEDITATE
	dbw 50, SWAGGER	
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, SKIPLOOM
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 5, LEECH_SEED
	dbw 5, TAIL_WHIP
	dbw 8, GUST
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
	dbw 50, AMNESIA
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, JUMPLUFF
	dbw 1, SPLASH
	dbw 5, LEECH_SEED
	dbw 5, TAIL_WHIP
	dbw 8, GUST
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
	dbw 50, AMNESIA
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 5, LEECH_SEED
	dbw 5, TAIL_WHIP
	dbw 8, GUST
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
	dbw 50, AMNESIA
	db 0 ; no more level-up moves

AipomEvosAttacks:
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
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TWISTER
	dbw 1, STRING_SHOT
	dbw 7, QUICK_ATTACK
	dbw 13, DOUBLE_TEAM
	dbw 15, SONICBOOM
	dbw 18, GUST
	dbw 22, DETECT
	dbw 25, DRAGON_RAGE
	dbw 28, SUPERSONIC
	dbw 31, DRAGONBREATH
	dbw 34, PIN_MISSILE
	dbw 37, RAZOR_WIND
	dbw 40, SCREECH
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
	dbw 16, SLAM
	dbw 20, BUBBLEBEAM
	dbw 24, DIG
	dbw 28, AMNESIA
	dbw 32, CURSE
	dbw 36, EARTHQUAKE
	dbw 40, RAIN_DANCE
	dbw 42, MIST
	dbw 45, HYDRO_PUMP
	dbw 50, HAZE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, POUND
	dbw 16, SLAM
	dbw 20, BUBBLEBEAM
	dbw 24, DIG
	dbw 28, AMNESIA
	dbw 32, CURSE
	dbw 36, EARTHQUAKE
	dbw 40, RAIN_DANCE
	dbw 42, MIST
	dbw 45, HYDRO_PUMP
	dbw 50, HAZE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, PSYBEAM
	dbw 20, CONFUSE_RAY
	dbw 24, FAE_VOICE
	dbw 28, BATON_PASS
	dbw 32, PSYCHIC_M
	dbw 36, SWIFT
	dbw 40, MEDITATE
	dbw 45, MORNING_SUN
	dbw 50, SHADOW_BALL
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, FAINT_ATTACK
	dbw 20, CONFUSE_RAY
	dbw 24, NIGHT_SHADE
	dbw 28, BATON_PASS
	dbw 32, PURSUIT
	dbw 36, GLARE
	dbw 40, MOONLIGHT
	dbw 45, AMNESIA
	dbw 50, CURSE
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 6, BITE
	dbw 12, HAZE
	dbw 16, WING_ATTACK
	dbw 20, FAINT_ATTACK
	dbw 24, NIGHT_SHADE
	dbw 28, GLARE
	dbw 32, PURSUIT
	dbw 36, RAZOR_WIND
	dbw 40, MEAN_LOOK
	dbw 42, DRILL_PECK
	dbw 45, SLASH
	dbw 50, SHADOW_BALL
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, GROWL
	dbw 12, WATER_GUN
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, HEADBUTT
	dbw 32, PSYCHIC_M
	dbw 36, MEDITATE
	dbw 40, FLAMETHROWER
	dbw 45, HYDRO_PUMP
	dbw 50, FIRE_BLAST	
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK	
	dbw 6, SPITE
	dbw 12, PSYWAVE
	dbw 15, POISON_GAS
	dbw 18, WILLOWISP
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
	dbw 25, PSYBEAM
	dbw 30, WILLOWISP
	dbw 32, PURSUIT
	dbw 36, SHADOW_BALL
	dbw 40, FUTURE_SIGHT
	dbw 42, DOUBLE_TEAM
	dbw 45, DESTINY_BOND
	dbw 50, GLARE
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
	dbw 36, PURSUIT
	dbw 40, MEDITATE
	dbw 42, PSYCHIC_M
	dbw 45, CRUNCH
	dbw 50, BODY_SLAM
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
	dbw 32, TWINEEDLE
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
	dbw 32, TWINEEDLE
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
	dbw 45, CURSE
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 6, SAND_ATTACK
	dbw 13, HARDEN
	dbw 16, MUD_SLAP
	dbw 20, WING_ATTACK
	dbw 24, MAGNITUDE
	dbw 28, FAINT_ATTACK
	dbw 32, SLASH
	dbw 36, RAZOR_WIND
	dbw 40, EARTHQUAKE
	dbw 42, SKY_ATTACK
	dbw 45, FISSURE
	dbw 50, GUILLOTINE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCREECH
	dbw 10, BIND
	dbw 14, ROCK_THROW
	dbw 20, MAGNITUDE
	dbw 23, HARDEN
	dbw 27, RAGE
	dbw 30, SANDSTORM
	dbw 36, ROCK_SLIDE
	dbw 40, EARTHQUAKE	
	dbw 42, CRUNCH
	dbw 45, VICEGRIP
	dbw 50, FISSURE
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
	dbw 32, CRUNCH
	dbw 36, SWIFT
	dbw 40, THRASH
	dbw 42, BODY_SLAM
	dbw 45, AGILITY
	dbw 50, REST
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
	dbw 32, CRUNCH
	dbw 36, SWIFT
	dbw 40, THRASH
	dbw 42, BODY_SLAM
	dbw 45, AGILITY
	dbw 50, REST
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
	dbw 50, SLUDGE_BOMB
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, STRING_SHOT
	dbw 6, FOCUS_ENERGY
	dbw 12, BITE
	dbw 18, FALSE_SWIPE
	dbw 22, TWINEEDLE
	dbw 24, AGILITY
	dbw 30, SLASH
	dbw 36, RAZOR_WIND
	dbw 42, SWORDS_DANCE
	dbw 48, DOUBLE_TEAM
	dbw 50, GUILLOTINE
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
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, HORN_ATTACK
	dbw 12, ENDURE
	dbw 19, TWINEEDLE
	dbw 22, MACH_PUNCH
	dbw 27, COUNTER
	dbw 32, CROSS_CHOP
	dbw 36, SEISMIC_TOSS
	dbw 40, REVERSAL
	dbw 42, MEGAHORN
	dbw 45, PURSUIT
	dbw 50, SWORDS_DANCE
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 9, QUICK_ATTACK
	dbw 16, ICE_PUNCH	
	dbw 20, FAINT_ATTACK
	dbw 24, MACH_PUNCH
	dbw 28, FURY_SWIPES
	dbw 32, ICE_BEAM
	dbw 36, PURSUIT
	dbw 40, AGILITY
	dbw 42, SLASH
	dbw 45, BEAT_UP
	dbw 50, SWORDS_DANCE
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
	dbw 32, SLASH
	dbw 36, SNORE
	dbw 40, CRUNCH
	dbw 42, MAGNITUDE
	dbw 45, PURSUIT
	dbw 50, THRASH
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
	dbw 32, SLASH
	dbw 36, SNORE
	dbw 40, CRUNCH
	dbw 42, MAGNITUDE
	dbw 45, PURSUIT
	dbw 50, THRASH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGCARGO
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 8, EMBER
	dbw 15, ROCK_THROW
	dbw 22, CURSE
	dbw 26, AMNESIA
	dbw 32, FLAMETHROWER
	dbw 36, ROCK_SLIDE
	dbw 40, MAGNITUDE
	dbw 42, PROTECT
	dbw 45, SKULL_BASH
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 8, EMBER
	dbw 15, ROCK_THROW
	dbw 22, CURSE
	dbw 26, AMNESIA
	dbw 32, FLAMETHROWER
	dbw 36, ROCK_SLIDE
	dbw 40, MAGNITUDE
	dbw 42, PROTECT
	dbw 45, SKULL_BASH
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, PILOSWINE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 10, ENDURE
	dbw 15, CURSE
	dbw 20, MAGNITUDE
	dbw 24, AURORA_BEAM
	dbw 28, SLAM
	dbw 32, EARTHQUAKE
	dbw 36, ICE_BEAM
	dbw 40, TAKE_DOWN
	dbw 42, MIST
	dbw 45, BLIZZARD
	dbw 50, AMNESIA
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POWDER_SNOW
	dbw 10, ENDURE
	dbw 15, CURSE
	dbw 20, MAGNITUDE
	dbw 24, AURORA_BEAM
	dbw 28, SLAM
	dbw 32, EARTHQUAKE
	dbw 36, ICE_BEAM
	dbw 40, TAKE_DOWN
	dbw 42, MIST
	dbw 45, BLIZZARD
	dbw 50, AMNESIA
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, DEFENSE_CURL
	dbw 16, ANCIENTPOWER
	dbw 19, RECOVER
	dbw 22, ICY_WIND
	dbw 25, BUBBLEBEAM
	dbw 28, ROLLOUT
	dbw 31, AMNESIA
	dbw 34, ROCK_SLIDE
	dbw 37, MIRROR_COAT
	dbw 40, HYDRO_PUMP
	dbw 42, SPIKES
	dbw 45, RAIN_DANCE
	dbw 50, RAPID_SPIN
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
	dbw 32, ICE_BEAM
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
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 8, SAND_ATTACK
	dbw 12, METAL_CLAW
	dbw 16, WING_ATTACK
	dbw 20, AGILITY
	dbw 24, SPIKES
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
	dbw 26, FIRE_SPIN
	dbw 32, FLAME_WHEEL
	dbw 36, CRUNCH
	dbw 40, FLAMETHROWER
	dbw 42, PURSUIT
	dbw 45, TAKE_DOWN
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 7, ROAR
	dbw 13, SMOG
	dbw 15, BITE
	dbw 22, FAINT_ATTACK
	dbw 26, FIRE_SPIN
	dbw 32, FLAME_WHEEL
	dbw 36, CRUNCH
	dbw 40, FLAMETHROWER
	dbw 42, PURSUIT
	dbw 45, TAKE_DOWN
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 8, SMOKESCREEN
	dbw 12, TWISTER
	dbw 16, BUBBLEBEAM
	dbw 20, AURORA_BEAM
	dbw 24, DRAGON_RAGE
	dbw 28, AGILITY
	dbw 32, DRAGONBREATH
	dbw 36, THRASH
	dbw 40, OUTRAGE
	dbw 45, HYDRO_PUMP
	dbw 50, RECOVER
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
	dbw 32, EARTHQUAKE
	dbw 36, BODY_SLAM
	dbw 40, SWIFT
	dbw 42, RAPID_SPIN
	dbw 45, MEGAHORN
	dbw 50, FISSURE
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
	dbw 32, EARTHQUAKE
	dbw 36, BODY_SLAM
	dbw 40, SWIFT
	dbw 42, RAPID_SPIN
	dbw 45, MEGAHORN
	dbw 50, FISSURE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONVERSION2
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 9, AGILITY
	dbw 16, SPARK
	dbw 20, PSYBEAM
	dbw 24, RECOVER
	dbw 28, TRI_ATTACK
	dbw 32, LOCK_ON
	dbw 36, THUNDERBOLT
	dbw 40, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
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
	dbw 42, EARTHQUAKE
	dbw 45, DREAM_EATER
	dbw 50, PURSUIT
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
	dbw 42, DETECT
	dbw 45, COUNTER
	dbw 50, BATON_PASS
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
	dbw 30, PSYBEAM
	dbw 36, ICY_WIND
	dbw 40, ICE_BEAM
	dbw 42, PSYCHIC_M
	dbw 45, PERISH_SONG
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 16, THUNDERPUNCH
	dbw 17, LIGHT_SCREEN
	dbw 20, MACH_PUNCH
	dbw 24, DIZZY_PUNCH	
	dbw 28, THUNDER_WAVE
	dbw 32, THUNDERBOLT
	dbw 36, SWIFT
	dbw 40, AGILITY
	dbw 45, CONFUSE_RAY
	dbw 50, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 16, FIRE_PUNCH
	dbw 18, SMOG
	dbw 20, MACH_PUNCH
	dbw 24, SMOKESCREEN
	dbw 28, WILLOWISP
	dbw 30, SUNNY_DAY
	dbw 36, FLAMETHROWER
	dbw 40, CONFUSE_RAY
	dbw 45, SLUDGE_BOMB
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 5, DEFENSE_CURL
	dbw 8, RAGE
	dbw 16, STOMP
	dbw 19, MILK_DRINK
	dbw 26, ROLLOUT
	dbw 32, BIDE
	dbw 34, HEAL_BELL
	dbw 36, CURSE
	dbw 40, BODY_SLAM
	dbw 42, OUTRAGE
	dbw 45, EARTHQUAKE
	dbw 48, SUBMISSION
	dbw 50, DOUBLE_EDGE
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
	dbw 35, EGG_BOMB
	dbw 40, DEFENSE_CURL
	dbw 42, LIGHT_SCREEN
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, TACKLE
	dbw 16, SPARK
	dbw 21, ROAR
	dbw 26, FAINT_ATTACK
	dbw 31, CRUNCH
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
	dbw 16, FIRE_SPIN
	dbw 21, ROAR
	dbw 26, FAINT_ATTACK
	dbw 31, CRUNCH
	dbw 36, FLAMETHROWER
	dbw 41, SUNNY_DAY
	dbw 46, PURSUIT
	dbw 51, FIRE_BLAST
	dbw 56, SOLARBEAM
	dbw 60, EARTHQUAKE
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TACKLE
	dbw 16, BUBBLEBEAM
	dbw 21, ROAR
	dbw 26, AURORA_BEAM
	dbw 31, SAFEGUARD
	dbw 36, RECOVER
	dbw 41, RAIN_DANCE
	dbw 46, SWIFT
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
	dbw 50, THRASH
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
	dbw 50, THRASH
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
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
	dbw 50, THRASH
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
	dbw 40, HYDRO_PUMP
	dbw 45, AEROBLAST
	dbw 50, RAIN_DANCE
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, EMBER
	dbw 11, SAFEGUARD
	dbw 22, WING_ATTACK
	dbw 27, FIRE_SPIN
	dbw 33, ANCIENTPOWER
	dbw 37, RECOVER
	dbw 40, FIRE_BLAST
	dbw 45, SACRED_FIRE
	dbw 50, SUNNY_DAY
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEECH_SEED
	dbw 1, PIXIE_DUST
	dbw 8, VINE_WHIP
	dbw 10, POISONPOWDER
	dbw 15, STUN_SPORE
	dbw 18, FAE_VOICE
	dbw 20, ANCIENTPOWER
	dbw 24, RAZOR_LEAF
	dbw 28, SLEEP_POWDER
	dbw 32, PSYBEAM
	dbw 36, SWIFT
	dbw 40, RECOVER
	dbw 42, BATON_PASS
	dbw 45, HEAL_BELL
	dbw 48, SAFEGUARD
	dbw 50, MEDITATE
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
	dbw 12, DEFENSE_CURL
	dbw 15, ROLLOUT
	dbw 22, BELLY_DRUM
	dbw 25, HEADBUTT
	dbw 30, SNORE
	dbw 30, REST
	dbw 36, BODY_SLAM	
	dbw 42, EARTHQUAKE
	dbw 45, HYPER_BEAM
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

TreeckoEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, GROVYLE
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POUND
	dbw 6, ABSORB
	dbw 11, QUICK_ATTACK
	dbw 16, RAZOR_LEAF
	dbw 20, FAINT_ATTACK
	dbw 24, MEGA_DRAIN
	dbw 28, AGILITY
	dbw 32, SLAM
	dbw 36, DETECT
	dbw 40, GIGA_DRAIN
	dbw 42, PURSUIT
	dbw 45, FALSE_SWIPE
	dbw 50, DRAGONBREATH
	db 0 ; no more level-up moves

GrovyleEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SCEPTILE
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POUND
	dbw 6, ABSORB
	dbw 11, QUICK_ATTACK
	dbw 16, RAZOR_LEAF
	dbw 20, FAINT_ATTACK
	dbw 24, MEGA_DRAIN
	dbw 28, AGILITY
	dbw 32, SLAM
	dbw 36, DETECT
	dbw 40, GIGA_DRAIN
	dbw 42, PURSUIT
	dbw 45, FALSE_SWIPE
	dbw 50, DRAGONBREATH
	db 0 ; no more level-up moves

SceptileEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POUND
	dbw 6, ABSORB
	dbw 11, QUICK_ATTACK
	dbw 16, RAZOR_LEAF
	dbw 20, FAINT_ATTACK
	dbw 24, MEGA_DRAIN
	dbw 28, AGILITY
	dbw 32, SLAM
	dbw 36, DETECT
	dbw 40, GIGA_DRAIN
	dbw 42, PURSUIT
	dbw 45, FALSE_SWIPE
	dbw 50, DRAGONBREATH
	db 0 ; no more level-up moves

TorchicEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, COMBUSKEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 10, EMBER
	dbw 12, PECK
	dbw 16, DOUBLE_KICK
	dbw 20, FIRE_SPIN
	dbw 24, MACH_PUNCH
	dbw 28, MIRROR_MOVE
	dbw 32, FLAMETHROWER
	dbw 36, SLASH
	dbw 40, CROSS_CHOP
	dbw 42, DRILL_PECK
	dbw 45, CURSE
	dbw 50, SUBMISSION
	db 0 ; no more level-up moves

CombuskenEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, BLAZIKEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 10, EMBER
	dbw 12, PECK
	dbw 16, DOUBLE_KICK
	dbw 20, FIRE_SPIN
	dbw 24, MACH_PUNCH
	dbw 28, MIRROR_MOVE
	dbw 32, FLAMETHROWER
	dbw 36, SLASH
	dbw 40, CROSS_CHOP
	dbw 42, DRILL_PECK
	dbw 45, CURSE
	dbw 50, SUBMISSION
	db 0 ; no more level-up moves

BlazikenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 10, EMBER
	dbw 12, PECK
	dbw 16, DOUBLE_KICK
	dbw 20, FIRE_SPIN
	dbw 24, MACH_PUNCH
	dbw 28, MIRROR_MOVE
	dbw 32, FLAMETHROWER
	dbw 36, SLASH
	dbw 40, CROSS_CHOP
	dbw 42, DRILL_PECK
	dbw 45, CURSE
	dbw 50, SUBMISSION
	db 0 ; no more level-up moves

MudkipEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, MARSHTOMP
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, SAND_ATTACK
	dbw 10, CLAMP
	dbw 14, BIDE
	dbw 16, MUD_SLAP
	dbw 20, BUBBLEBEAM
	dbw 24, SLAM
	dbw 28, WHIRLPOOL
	dbw 32, PROTECT
	dbw 36, RAIN_DANCE
	dbw 42, HYDRO_PUMP
	dbw 45, EARTHQUAKE
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

MarshtompEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SWAMPERT
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, SAND_ATTACK
	dbw 10, CLAMP
	dbw 14, BIDE
	dbw 16, MUD_SLAP
	dbw 20, BUBBLEBEAM
	dbw 24, SLAM
	dbw 28, WHIRLPOOL
	dbw 32, PROTECT
	dbw 36, RAIN_DANCE
	dbw 42, HYDRO_PUMP
	dbw 45, EARTHQUAKE
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

SwampertEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, SAND_ATTACK
	dbw 10, CLAMP
	dbw 14, BIDE
	dbw 16, MUD_SLAP
	dbw 20, BUBBLEBEAM
	dbw 24, SLAM
	dbw 28, WHIRLPOOL
	dbw 32, PROTECT
	dbw 36, RAIN_DANCE
	dbw 42, HYDRO_PUMP
	dbw 45, EARTHQUAKE
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

ENDSECTION
