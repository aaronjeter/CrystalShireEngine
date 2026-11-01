SECTION "Evolutions and Attacks Mega", ROMX

EvosAttacksPointersMega::
	dw Bayleef2EvosAttacks
	dw Meganium2EvosAttacks
	dw DragonitexEvosAttacks
	dw DragoniteyEvosAttacks
	dw VenusaurxEvosAttacks
	dw CharizardxEvosAttacks
	dw CharizardyEvosAttacks
	dw BlastoisexEvosAttacks
	dw BeedrillxEvosAttacks
	dw AlakazamxEvosAttacks
	dw SlowbroxEvosAttacks
	dw GengarxEvosAttacks
	dw PinsirxEvosAttacks
	dw GyaradosxEvosAttacks
	dw AerodactylxEvosAttacks
	dw AmpharosxEvosAttacks
	dw SteelixxEvosAttacks
	dw ScizorxEvosAttacks
	dw HeracrossxEvosAttacks
	dw HoundoomxEvosAttacks
	dw TyranitarxEvosAttacks
	dw AggronxEvosAttacks
	dw CameruptxEvosAttacks
	dw AltariaxEvosAttacks
	dw AbsolxEvosAttacks
	dw GlaliexEvosAttacks
	dw SalamencexEvosAttacks
	dw MetagrossxEvosAttacks
	dw KinglerxEvosAttacks
	dw TropiusxEvosAttacks
	dw SwalotxEvosAttacks
	dw FlygonxEvosAttacks
	dw ChimechoxEvosAttacks
	dw VictreebelxEvosAttacks
	dw UnownxEvosAttacks	
	dw ButterfreexEvosAttacks
	dw LedianxEvosAttacks
	dw MagcargoxEvosAttacks
	dw SceptilexEvosAttacks
	dw BlazikenxEvosAttacks
	dw SwampertxEvosAttacks
	dw GardevoirxEvosAttacks
	dw PidgeotxEvosAttacks
	dw MercuryEvosAttacks
	dw VenusEvosAttacks
	dw MarsEvosAttacks
	dw JupiterEvosAttacks
.IndirectEnd::

Bayleef2EvosAttacks:
	dbbw EVOLVE_LEVEL, 32, MEGANIUM2
	dbww EVOLVE_ITEM, LEAF_STONE, BAYLEEF
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, ABSORB
	dbw 8, GROWL
	dbw 12, LEECH_SEED
	dbw 16, VINE_WHIP
	dbw 20, RAIN_DANCE
	dbw 24, BUBBLEBEAM
	dbw 28, RAZOR_LEAF
	dbw 32, AURORA_BEAM
	dbw 36, COSMIC_POWER
	dbw 40, GIGA_DRAIN
	dbw 45, MIST_BALL
	dbw 50, RECOVER	
	dbw 55, ICE_BEAM
	dbw 60, HYDRO_PUMP
	dbw 65, MIRROR_COAT
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

Meganium2EvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, MEGANIUM
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, ABSORB
	dbw 8, GROWL
	dbw 12, LEECH_SEED
	dbw 16, VINE_WHIP
	dbw 20, RAIN_DANCE
	dbw 24, BUBBLEBEAM
	dbw 28, RAZOR_LEAF
	dbw 32, AURORA_BEAM
	dbw 36, COSMIC_POWER
	dbw 40, GIGA_DRAIN
	dbw 45, MIST_BALL
	dbw 50, RECOVER	
	dbw 55, ICE_BEAM
	dbw 60, HYDRO_PUMP
	dbw 65, MIRROR_COAT
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

DragonitexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WING_ATTACK
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, THUNDER_WAVE
	dbw 8, TWISTER
	dbw 12, AQUA_JET
	dbw 16, WATER_PULSE
	dbw 20, DRAGON_RAGE
	dbw 24, SLAM
	dbw 28, AGILITY
	dbw 31, AQUA_TAIL
	dbw 34, SAFEGUARD
	dbw 37, DRAGONBREATH
	dbw 40, DRAGON_CLAW
	dbw 43, CRUNCH
	dbw 46, EXTREMESPEED
	dbw 50, DETECT
	dbw 55, DRAGON_DANCE
	dbw 60, OUTRAGE
	dbw 65, HYPER_BEAM
	dbw 70, SKY_ATTACK
	dbw 75, HURRICANE
	db 0 ; no more level-up moves

DragoniteyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WING_ATTACK
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, THUNDER_WAVE
	dbw 8, TWISTER
	dbw 12, AQUA_JET
	dbw 16, WATER_PULSE
	dbw 20, DRAGON_RAGE
	dbw 24, SLAM
	dbw 28, AGILITY
	dbw 31, AQUA_TAIL
	dbw 34, SAFEGUARD
	dbw 37, DRAGONBREATH
	dbw 40, DRAGON_CLAW
	dbw 43, CRUNCH
	dbw 46, EXTREMESPEED
	dbw 50, DETECT
	dbw 55, DRAGON_DANCE
	dbw 60, OUTRAGE
	dbw 65, HYPER_BEAM
	dbw 70, SKY_ATTACK
	dbw 75, HYPER_VOICE
	dbw 78, FAERIEGLEAM
	dbw 80, SCALD
	db 0 ; no more level-up moves

VenusaurxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, LEECH_SEED
	dbw 7, VINE_WHIP
	dbw 10, POISONPOWDER
	dbw 13, ACID_SPRAY
	dbw 16, SLEEP_POWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF
	dbw 28, GROWTH
	dbw 30, SAFEGUARD
	dbw 32, VENOSHOCK
	dbw 35, AMNESIA
	dbw 38, WEATHER_BALL
	dbw 41, GIGA_DRAIN
	dbw 44, LEAF_BLADE
	dbw 47, SLUDGE_WAVE
	dbw 50, INGRAIN
	dbw 53, BULK_UP
	dbw 56, SOLARBEAM
	dbw 58, TOXIC
	dbw 60, STRENGTH_SAP
	dbw 64, PETAL_DANCE
	dbw 68, EARTHPOWER
	dbw 72, FRENZY_PLANT
	db 0 ; no more level-up moves

CharizardxEvosAttacks:
	db 0 ; no more evolutions	
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 4, EMBER
	dbw 7, SMOKESCREEN
	dbw 10, METAL_CLAW
	dbw 13, SCARY_FACE
	dbw 16, FLAME_CHARGE
	dbw 20, DRAGON_RAGE
	dbw 22, FIRE_FANG
	dbw 25, FIRE_SPIN
	dbw 28, BREAKING_SWIPE
	dbw 31, AIR_CUTTER
	dbw 34, ACROBATICS
	dbw 37, MYSTICAL_FIRE
	dbw 40, FLAMETHROWER
	dbw 43, DRAGONBREATH
	dbw 46, DRAGON_CLAW
	dbw 49, DRAGON_DANCE
	dbw 52, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 58, HEAT_CRASH
	dbw 61, FIRE_BLAST
	dbw 64, OUTRAGE
	dbw 68, HURRICANE
	dbw 72, HEAT_WAVE
	dbw 76, BLAST_BURN
	dbw 80, SACRED_FIRE
	db 0 ; no more level-up moves

CharizardyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 4, EMBER
	dbw 7, SMOKESCREEN
	dbw 10, METAL_CLAW
	dbw 13, SCARY_FACE
	dbw 16, FLAME_CHARGE
	dbw 20, DRAGON_RAGE
	dbw 22, FIRE_FANG
	dbw 25, FIRE_SPIN
	dbw 28, BREAKING_SWIPE
	dbw 31, AIR_CUTTER
	dbw 34, ACROBATICS
	dbw 37, MYSTICAL_FIRE
	dbw 40, FLAMETHROWER
	dbw 43, DRAGONBREATH
	dbw 46, DRAGON_CLAW
	dbw 49, DRAGON_DANCE
	dbw 52, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 58, HEAT_CRASH
	dbw 61, FIRE_BLAST
	dbw 64, OUTRAGE
	dbw 68, HURRICANE
	dbw 72, HEAT_WAVE
	dbw 76, BLAST_BURN
	dbw 78, SKY_ATTACK
	dbw 80, SACRED_FIRE
	db 0 ; no more level-up moves

BlastoisexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, BUBBLE
	dbw 7, WITHDRAW
	dbw 10, WATER_GUN
	dbw 13, BITE
	dbw 16, RAPID_SPIN
	dbw 19, PROTECT
	dbw 22, BUBBLEBEAM
	dbw 25, YAWN
	dbw 28, GYRO_BALL
	dbw 31, ICE_FANG
	dbw 34, RAIN_DANCE
	dbw 37, AQUA_TAIL
	dbw 40, FLASHCANNON
	dbw 43, MIST_BALL
	dbw 46, HAZE
	dbw 48, REST
	dbw 50, BODY_PRESS
	dbw 53, AQUA_RING
	dbw 56, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 64, HEAVY_SLAM
	dbw 68, AURA_SPHERE
	dbw 72, HYDRO_CANNON
	db 0 ; no more level-up moves

BeedrillxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, POISON_STING
	dbw 10, FURY_ATTACK
	dbw 13, QUICK_ATTACK
	dbw 16, TWINEEDLE
	dbw 19, FOCUS_ENERGY
	dbw 22, PURSUIT
	dbw 25, KNOCK_OFF
	dbw 28, ACROBATICS
	dbw 31, U_TURN
	dbw 34, POISON_JAB
	dbw 37, SWORDS_DANCE
	dbw 40, NIGHT_SLASH
	dbw 43, SUCKER_PUNCH
	dbw 46, COUP_DE_GRACE
	dbw 49, DRAGON_DANCE
	dbw 52, TOXIC
	dbw 55, BRICK_BREAK
	dbw 58, DOUBLE_EDGE
	dbw 61, MEGAHORN
	dbw 65, EXTREMESPEED
	dbw 75, BEAT_UP
	db 0 ; no more level-up moves

AlakazamxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 10, KINESIS
	dbw 13, DISABLE
	dbw 16, CHARGE_BEAM
	dbw 19, PSYBEAM
	dbw 22, REFLECT
	dbw 25, RECOVER
	dbw 28, LIGHT_SCREEN
	dbw 31, PSYCH_UP
	dbw 34, TAUNT
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, SIGNAL_BEAM
	dbw 46, MEDITATE
	dbw 49, FLASHCANNON
	dbw 52, GRASS_KNOT
	dbw 55, ENCORE
	dbw 60, AURA_SPHERE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

SlowbroxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 4, GROWL
	dbw 7, YAWN
	dbw 10, CONFUSION
	dbw 13, DISABLE
	dbw 16, WATER_PULSE
	dbw 19, WITHDRAW
	dbw 22, CURSE
	dbw 25, ZEN_HEADBUTT
	dbw 28, AMNESIA
	dbw 31, RECOVER
	dbw 34, BODY_PRESS
	dbw 37, PSYCHIC_M
	dbw 40, AQUA_TAIL
	dbw 43, DRAIN_PUNCH
	dbw 46, SAFEGUARD
	dbw 50, RAIN_DANCE
	dbw 55, HYDRO_PUMP
	dbw 60, FUTURE_SIGHT
	dbw 70, SKULL_BASH
	db 0 ; no more level-up moves

GengarxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 1, CONFUSE_RAY
	dbw 4, POISON_GAS
	dbw 7, ASTONISH
	dbw 10, SPITE
	dbw 13, NIGHT_SHADE
	dbw 16, CURSE
	dbw 19, HEX
	dbw 22, MEAN_LOOK
	dbw 25, VENOSHOCK
	dbw 28, ACID_SPRAY
	dbw 31, NIGHTMARE
	dbw 34, PAIN_SPLIT
	dbw 37, MEDITATE
	dbw 40, SHADOW_BALL
	dbw 43, SLUDGE_WAVE
	dbw 46, DARK_PULSE
	dbw 50, TAUNT
	dbw 55, DESTINY_BOND
	dbw 60, PERISH_SONG
	dbw 65, DREAM_EATER
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

PinsirxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, HARDEN
	dbw 4, FOCUS_ENERGY
	dbw 7, BIND
	dbw 10, FURY_ATTACK
	dbw 13, SEISMIC_TOSS
	dbw 16, TWINEEDLE
	dbw 19, FALSE_SWIPE
	dbw 22, PURSUIT
	dbw 25, KNOCK_OFF
	dbw 28, SLASH
	dbw 31, FURY_CUTTER
	dbw 34, SWORDS_DANCE
	dbw 37, VITAL_THROW
	dbw 40, VICEGRIP
	dbw 43, THRASH
	dbw 46, SUBMISSION
	dbw 50, DRAGON_DANCE
	dbw 55, MEGAHORN
	dbw 60, DOUBLE_EDGE
	dbw 65, GUILLOTINE
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

GyaradosxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, TWISTER
	dbw 1, THRASH
	dbw 20, BITE
	dbw 23, AQUA_JET
	dbw 26, SCARY_FACE
	dbw 29, ICE_FANG
	dbw 32, AQUA_TAIL
	dbw 35, FIRE_FANG
	dbw 38, THUNDER_FANG
	dbw 41, RAIN_DANCE
	dbw 44, DRAGON_CLAW
	dbw 47, CRUNCH
	dbw 50, DRAGON_DANCE
	dbw 55, HYDRO_PUMP
	dbw 60, HYPER_BEAM
	dbw 65, OUTRAGE
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

AerodactylxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, BITE
	dbw 4, ROCK_THROW
	dbw 7, SUPERSONIC
	dbw 10, SCARY_FACE
	dbw 13, WING_ATTACK
	dbw 16, ANCIENTPOWER
	dbw 19, ROCK_TOMB
	dbw 22, PURSUIT
	dbw 25, AGILITY
	dbw 28, TAKE_DOWN
	dbw 31, TAUNT
	dbw 34, CRUNCH
	dbw 37, ROCK_SLIDE
	dbw 40, DRILL_PECK
	dbw 43, DRAGON_DANCE
	dbw 46, DRAGON_CLAW
	dbw 50, DOUBLE_EDGE
	dbw 55, STONE_EDGE
	dbw 60, SKY_ATTACK
	db 0 ; no more level-up moves

AmpharosxEvosAttacks:
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

SteelixxEvosAttacks:
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

ScizorxEvosAttacks:
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

HeracrossxEvosAttacks:
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

HoundoomxEvosAttacks:
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

TyranitarxEvosAttacks:
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

AggronxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, METAL_CLAW
	dbw 4, MUD_SLAP
	dbw 7, ROCK_THROW
	dbw 10, HEADBUTT
	dbw 13, ROCK_TOMB
	dbw 16, ROAR
	dbw 19, BULLDOZE
	dbw 22, TAKE_DOWN
	dbw 25, SCREECH
	dbw 28, CURSE
	dbw 31, GYRO_BALL
	dbw 34, ROCK_SLIDE
	dbw 37, VICEGRIP
	dbw 40, COSMIC_POWER
	dbw 43, BODY_PRESS
	dbw 46, EARTHQUAKE
	dbw 49, DOUBLE_EDGE
	dbw 52, HEAVY_SLAM
	dbw 55, TOXIC
	dbw 60, IRON_TAIL
	dbw 65, STONE_EDGE
	dbw 70, SKULL_BASH
	db 0 ; no more level-up moves

CameruptxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, MUD_SLAP
	dbw 7, FLAME_CHARGE
	dbw 10, BULLDOZE
	dbw 13, FIRE_SPIN
	dbw 16, ROCK_TOMB
	dbw 19, TAKE_DOWN
	dbw 22, LAVA_PLUME
	dbw 25, EARTHPOWER
	dbw 28, CURSE
	dbw 31, YAWN
	dbw 34, ROCK_SLIDE
	dbw 37, AMNESIA
	dbw 40, RECOVER
	dbw 43, FLAMETHROWER
	dbw 46, EARTHQUAKE
	dbw 49, HEAT_CRASH
	dbw 52, DOUBLE_EDGE
	dbw 55, FIRE_BLAST
	dbw 60, ERUPTION
	dbw 65, FISSURE
	db 0 ; no more level-up moves

AltariaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PECK
	dbw 4, PIXIE_DUST
	dbw 8, SING
	dbw 11, FURY_ATTACK
	dbw 14, FAE_VOICE
	dbw 18, TWISTER
	dbw 22, SAFEGUARD
	dbw 26, DRAGONBREATH
	dbw 30, MIST
	dbw 33, COTTON_SPORE
	dbw 36, TAKE_DOWN
	dbw 39, HEAL_BELL
	dbw 42, DRAGON_CLAW
	dbw 45, MOONBLAST
	dbw 48, PLAY_ROUGH
	dbw 51, DRAGON_DANCE
	dbw 54, RECOVER
	dbw 57, DOUBLE_EDGE
	dbw 60, OUTRAGE
	dbw 65, PERISH_SONG
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

AbsolxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 4, QUICK_ATTACK
	dbw 8, BITE
	dbw 11, FURY_CUTTER
	dbw 14, KNOCK_OFF
	dbw 17, FAINT_ATTACK
	dbw 20, DETECT
	dbw 23, TAUNT
	dbw 26, RAZOR_WIND
	dbw 29, SWORDS_DANCE
	dbw 32, SLASH
	dbw 35, FOCUS_ENERGY
	dbw 38, PSYCHO_CUT
	dbw 41, SUCKER_PUNCH
	dbw 44, NIGHT_SLASH
	dbw 47, PLAY_ROUGH
	dbw 50, PERISH_SONG
	dbw 54, FUTURE_SIGHT
	dbw 60, BEAT_UP
	db 0 ; no more level-up moves

GlaliexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, LEER
	dbw 1, ASTONISH
	dbw 5, BITE
	dbw 9, ICE_BALL
	dbw 13, FROSTBITE
	dbw 17, HEADBUTT
	dbw 21, ICY_WIND
	dbw 25, ICE_FANG
	dbw 28, PROTECT
	dbw 30, ICICLE_SPEAR
	dbw 33, SPIKES
	dbw 36, CRUNCH
	dbw 39, HAIL
	dbw 42, BULK_UP
	dbw 45, ICICLE_CRASH
	dbw 48, FREEZE_DRY
	dbw 51, DOUBLE_EDGE
	dbw 55, BLIZZARD
	dbw 60, EXPLOSION
	db 0 ; no more level-up moves

SalamencexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 1, BITE
	dbw 5, TWISTER
	dbw 9, HEADBUTT
	dbw 13, SCARY_FACE
	dbw 17, BREAKING_SWIPE
	dbw 21, FIRE_FANG
	dbw 25, CRUSH_CLAW
	dbw 29, ZEN_HEADBUTT
	dbw 30, PROTECT
	dbw 33, DRAGON_CLAW
	dbw 36, DRAGONBREATH
	dbw 39, CRUNCH
	dbw 42, FOCUS_ENERGY
	dbw 45, DRAGON_DANCE
	dbw 48, FLAMETHROWER
	dbw 50, FLY
	dbw 55, DOUBLE_EDGE
	dbw 60, OUTRAGE
	dbw 65, HURRICANE
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

MetagrossxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 9, SCARY_FACE
	dbw 13, HEADBUTT
	dbw 17, PSYBEAM
	dbw 20, BULLET_PUNCH
	dbw 24, TAKE_DOWN
	dbw 28, REFLECT
	dbw 31, ICE_PUNCH
	dbw 34, THUNDERPUNCH
	dbw 37, ZEN_HEADBUTT
	dbw 40, AGILITY
	dbw 43, PSYCHIC_M
	dbw 45, METEOR_MASH
	dbw 49, COSMIC_POWER
	dbw 53, FLASHCANNON
	dbw 60, EXPLOSION
	dbw 65, HYPER_BEAM
	db 0 ; no more level-up moves

KinglerxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, LEER
	dbw 4, HARDEN
	dbw 7, METAL_CLAW
	dbw 10, CLAMP
	dbw 13, ROCK_SMASH
	dbw 16, AQUA_JET
	dbw 19, STOMP
	dbw 22, CRUSH_CLAW
	dbw 25, RAZORSHELL
	dbw 28, KNOCK_OFF
	dbw 31, FLAIL
	dbw 34, VICEGRIP
	dbw 37, CURSE
	dbw 40, SWORDS_DANCE
	dbw 43, NIGHT_SLASH
	dbw 46, CRABHAMMER
	dbw 50, AGILITY
	dbw 55, BULK_UP
	dbw 60, ACID_ARMOR
	dbw 65, BODY_PRESS
	dbw 70, GUILLOTINE
	db 0 ; no more level-up moves

TropiusxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, GUST
	dbw 1, LEECH_SEED
	dbw 6, GROWTH
	dbw 10, STOMP
	dbw 14, RAZOR_LEAF
	dbw 18, SWEET_SCENT
	dbw 21, WHIRLWIND
	dbw 24, MAGICAL_LEAF
	dbw 27, SUNNY_DAY
	dbw 30, AERIAL_ACE
	dbw 33, AIR_CUTTER
	dbw 36, SYNTHESIS
	dbw 39, BODY_SLAM
	dbw 42, DRAGON_DANCE
	dbw 45, LEAF_BLADE
	dbw 48, GIGA_DRAIN
	dbw 54, SOLARBEAM
	dbw 60, OUTRAGE
	dbw 65, SKY_ATTACK
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

SwalotxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, POISON_GAS
	dbw 1, YAWN
	dbw 4, ACID
	dbw 7, ACID_SPRAY
	dbw 10, AMNESIA
	dbw 13, ENCORE
	dbw 16, SLUDGE
	dbw 19, MUD_SHOT
	dbw 22, VENOSHOCK
	dbw 25, TOXIC
	dbw 28, PAIN_SPLIT
	dbw 31, COSMIC_POWER
	dbw 34, BODY_SLAM
	dbw 37, REST
	dbw 40, SLUDGE_WAVE
	dbw 43, POISON_JAB
	dbw 46, SLEEP_TALK
	dbw 49, EARTHPOWER
	dbw 52, HAZE
	dbw 55, BULK_UP
	dbw 60, EARTHQUAKE
	db 0 ; no more level-up moves

FlygonxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, SAND_ATTACK
	dbw 1, ASTONISH
	dbw 5, MUD_SLAP
	dbw 9, MUD_SHOT
	dbw 13, FAINT_ATTACK
	dbw 17, BULLDOZE
	dbw 21, ROCK_TOMB
	dbw 25, DRAGONBREATH
	dbw 29, DIG
	dbw 33, SCREECH
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 44, EARTHQUAKE
	dbw 48, SANDSTORM
	dbw 52, DRAGON_DANCE
	dbw 56, STONE_EDGE
	dbw 60, OUTRAGE
	dbw 65, FISSURE
	db 0 ; no more level-up moves

ChimechoxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 5, CONFUSION
	dbw 9, YAWN
	dbw 13, UPROAR
	dbw 17, PSYBEAM
	dbw 21, HEAL_BELL
	dbw 25, SAFEGUARD
	dbw 29, LIGHT_SCREEN
	dbw 32, REFLECT
	dbw 35, CALM_MIND
	dbw 38, EXTRASENSORY
	dbw 41, PSYCHIC_M
	dbw 44, RECOVER
	dbw 47, FLASHCANNON
	dbw 50, HYPER_VOICE
	dbw 54, SHADOW_BALL
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

VictreebelxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 4, GROWTH
	dbw 7, WRAP
	dbw 10, BULLET_SEED
	dbw 13, SLEEP_POWDER
	dbw 16, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 22, RAZOR_LEAF
	dbw 25, KNOCK_OFF
	dbw 28, VENOSHOCK
	dbw 31, SUNNY_DAY
	dbw 34, SUCKER_PUNCH
	dbw 37, LEECH_SEED
	dbw 40, POISON_JAB
	dbw 43, LEAF_BLADE
	dbw 46, SWORDS_DANCE
	dbw 49, WEATHER_BALL
	dbw 52, SYNTHESIS
	dbw 55, SOLARBEAM
	dbw 60, PETAL_DANCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

UnownxEvosAttacks:
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

ButterfreexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, STRING_SHOT
	dbw 1, CONFUSION
	dbw 10, PIXIE_DUST
	dbw 12, POISONPOWDER
	dbw 14, STUN_SPORE
	dbw 16, SLEEP_POWDER
	dbw 18, SUPERSONIC
	dbw 21, PSYBEAM
	dbw 24, FAE_VOICE
	dbw 26, WHIRLWIND
	dbw 28, SILVER_WIND
	dbw 31, YAWN
	dbw 34, VENOSHOCK
	dbw 36, CALM_MIND
	dbw 38, SAFEGUARD
	dbw 40, SIGNAL_BEAM
	dbw 43, MOONBLAST
	dbw 46, LIGHT_SCREEN
	dbw 49, EXTRASENSORY
	dbw 52, MOONLIGHT
	dbw 56, GIGA_DRAIN
	dbw 60, LUSTER_PURGE
	dbw 65, BATON_PASS
	db 0 ; no more level-up moves

LedianxEvosAttacks:
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

MagcargoxEvosAttacks:
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

SceptilexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, LEER
	dbw 1, ABSORB
	dbw 4, QUICK_ATTACK
	dbw 7, MEGA_DRAIN
	dbw 10, DETECT
	dbw 13, FURY_CUTTER
	dbw 16, LEECH_SEED
	dbw 19, RAZOR_LEAF
	dbw 22, FAINT_ATTACK
	dbw 25, DRAGON_RAGE
	dbw 28, SUBSTITUTE
	dbw 31, FALSE_SWIPE
	dbw 34, LEAF_BLADE
	dbw 37, DRAGONBREATH
	dbw 40, GIGA_DRAIN
	dbw 43, NIGHT_SLASH
	dbw 46, SUNNY_DAY
	dbw 49, DRAGON_CLAW
	dbw 52, SWORDS_DANCE
	dbw 55, DRAGON_DANCE
	dbw 58, SOLARBEAM
	dbw 62, OUTRAGE
	dbw 66, FRENZY_PLANT
	dbw 70, PETAL_DANCE
	db 0 ; no more level-up moves

BlazikenxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, QUICK_ATTACK
	dbw 7, PECK
	dbw 10, FLAME_CHARGE
	dbw 13, DETECT
	dbw 16, DOUBLE_KICK
	dbw 19, MACH_PUNCH
	dbw 22, ROLLING_KICK
	dbw 25, AERIAL_ACE
	dbw 28, FOCUS_ENERGY
	dbw 31, SLASH
	dbw 34, BULK_UP
	dbw 37, BLAZE_KICK
	dbw 40, MYSTICAL_FIRE
	dbw 43, JUMP_KICK
	dbw 46, SUNNY_DAY
	dbw 49, FLAMETHROWER
	dbw 52, SWORDS_DANCE
	dbw 55, AURA_SPHERE
	dbw 58, HEAT_WAVE
	dbw 62, HI_JUMP_KICK
	dbw 66, MEGA_KICK
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

SwampertxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 4, MUD_SLAP
	dbw 7, ROCK_THROW
	dbw 10, MUD_SHOT
	dbw 13, WATER_PULSE
	dbw 16, BULLDOZE
	dbw 19, YAWN
	dbw 22, ROCK_SLIDE
	dbw 25, TAKE_DOWN
	dbw 28, AMNESIA
	dbw 31, SPIKES
	dbw 34, RAIN_DANCE
	dbw 37, MUDDY_WATER
	dbw 40, SCREECH
	dbw 43, CURSE
	dbw 46, AQUA_TAIL
	dbw 49, EARTHPOWER
	dbw 52, BODY_PRESS
	dbw 55, WATERFALL
	dbw 60, HYDRO_PUMP
	dbw 65, STONE_EDGE
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

GardevoirxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PIXIE_DUST
	dbw 1, CONFUSION
	dbw 4, TELEPORT
	dbw 7, FAE_VOICE
	dbw 10, CHARM
	dbw 13, CONFUSE_RAY
	dbw 16, DRAININGKISS
	dbw 19, HYPNOSIS
	dbw 22, PSYBEAM
	dbw 25, SAFEGUARD
	dbw 28, LIGHT_SCREEN
	dbw 31, REFLECT
	dbw 34, MYSTICAL_FIRE
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, HYPER_VOICE
	dbw 46, MOONBLAST
	dbw 49, DREAM_EATER
	dbw 52, RECOVER
	dbw 55, HEAL_BELL
	dbw 58, FAERIEGLEAM
	dbw 62, FUTURE_SIGHT
	dbw 66, LUSTER_PURGE
	db 0 ; no more level-up moves

PidgeotxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 5, GUST
	dbw 9, QUICK_ATTACK
	dbw 13, TWISTER
	dbw 16, WHIRLWIND
	dbw 19, WING_ATTACK
	dbw 22, AERIAL_ACE
	dbw 25, RAZOR_WIND
	dbw 28, AGILITY
	dbw 30, TAUNT
	dbw 32, STEEL_WING
	dbw 34, HYPER_VOICE
	dbw 37, MIRROR_MOVE
	dbw 40, ACROBATICS
	dbw 43, DRAGONBREATH
	dbw 46, EXTREMESPEED
	dbw 49, U_TURN
	dbw 52, BULK_UP
	dbw 55, DRILL_PECK
	dbw 60, HURRICANE
	dbw 65, SKY_ATTACK
	dbw 70, HEAT_WAVE
	dbw 75, UPROAR
	dbw 80, AEROBLAST
	db 0 ; no more level-up moves

MercuryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, POWDER_SNOW
	dbw 8, GROWL
	dbw 12, PIXIE_DUST
	dbw 16, FROSTBITE
	dbw 20, RAIN_DANCE
	dbw 24, BUBBLEBEAM
	dbw 25, AURORA_BEAM
	dbw 28, DRAININGKISS
	dbw 32, RECOVER
	dbw 36, CALM_MIND
	dbw 40, MIST_BALL
	dbw 45, ICE_BEAM
	dbw 50, FAERIEGLEAM
	dbw 55, HEAL_BELL
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, MOONBLAST
	dbw 75, HYDRO_CANNON
	db 0 ; no more level-up moves

VenusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 1, LEECH_SEED
	dbw 8, VINE_WHIP
	dbw 12, ROCK_THROW
	dbw 16, STUN_SPORE
	dbw 20, SANDSTORM
	dbw 24, MAGNITUDE
	dbw 25, NEEDLE_ARM
	dbw 28, ROCK_TOMB
	dbw 32, RECOVER
	dbw 36, BULK_UP
	dbw 40, EARTHQUAKE
	dbw 45, LEAF_BLADE
	dbw 50, ROCK_SLIDE
	dbw 55, HEAL_BELL
	dbw 60, TOXIC
	dbw 65, PETAL_DANCE
	dbw 70, STONE_EDGE
	dbw 75, FISSURE
	db 0 ; no more level-up moves

MarsEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, TWISTER
	dbw 8, BITE
	dbw 12, GROWL
	dbw 16, WILLOWISP
	dbw 20, SUNNY_DAY
	dbw 24, FIRE_SPIN
	dbw 25, DRAGON_RAGE
	dbw 28, SNARL
	dbw 32, REFLECT
	dbw 36, CALM_MIND
	dbw 40, FLAMETHROWER
	dbw 45, DRAGONBREATH
	dbw 50, CHARGE
	dbw 55, DARK_PULSE
	dbw 60, RECOVER
	dbw 65, BEAT_UP
	dbw 70, SOLARBEAM
	dbw 75, BLAST_BURN
	db 0 ; no more level-up moves

JupiterEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GUST
	dbw 8, CONFUSION
	dbw 12, GROWL
	dbw 16, THUNDER_WAVE
	dbw 20, SILVER_WIND
	dbw 24, SHOCK_WAVE
	dbw 25, AIR_CUTTER
	dbw 28, PSYBEAM
	dbw 32, LIGHT_SCREEN
	dbw 36, CALM_MIND
	dbw 40, THUNDERBOLT
	dbw 45, RAZOR_WIND
	dbw 50, CHARGE
	dbw 55, RAIN_DANCE
	dbw 60, THUNDER
	dbw 65, HURRICANE
	dbw 70, PSYCHIC_M
	dbw 75, AEROBLAST
	db 0 ; no more level-up moves

ENDSECTION