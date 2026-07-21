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
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, THUNDER_WAVE
	dbw 15, TWISTER
	dbw 24, SLAM
	dbw 28, DRAGON_RAGE	
	dbw 30, AGILITY
	dbw 32, SAFEGUARD
	dbw 40, DRAGON_CLAW
	dbw 45, CRUNCH
	dbw 50, EXTREMESPEED
	dbw 55, DETECT
	dbw 60, OUTRAGE	
	dbw 65, DRAGON_DANCE
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

DragoniteyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, THUNDER_WAVE
	dbw 15, TWISTER
	dbw 24, SLAM
	dbw 28, DRAGON_RAGE	
	dbw 30, AGILITY
	dbw 32, SAFEGUARD
	dbw 40, DRAGON_CLAW
	dbw 45, CRUNCH
	dbw 50, EXTREMESPEED
	dbw 55, DETECT
	dbw 60, OUTRAGE	
	dbw 65, DRAGON_DANCE
	dbw 70, SKY_ATTACK
	dbw 75, FAERIEGLEAM
	dbw 80, SCALD
	db 0 ; no more level-up moves

VenusaurxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 7, LEECH_SEED
	dbw 10, VINE_WHIP
	dbw 12, POISONPOWDER
	dbw 16, SLEEP_POWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF		
	dbw 28, VENOSHOCK
	dbw 32, GROWTH
	dbw 36, STOMP
	dbw 40, LEAF_BLADE
	dbw 45, SLUDGE_WAVE
	dbw 50, SOLARBEAM
	dbw 55, BULK_UP
	dbw 60, TOXIC
	dbw 65, SLUDGE_BOMB
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

CharizardxEvosAttacks:
	db 0 ; no more evolutions	
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, METAL_CLAW
	dbw 14, SMOKESCREEN
	dbw 18, RAGE
	dbw 20, SCARY_FACE
	dbw 24, FIRE_FANG	
	dbw 30, AIR_CUTTER
	dbw 36, SLASH
	dbw 40, FLAMETHROWER	
	dbw 45, DRAGONBREATH
	dbw 50, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 60, FIRE_BLAST
	dbw 65, OUTRAGE
	dbw 70, BLAST_BURN
	dbw 75, DRAGON_CLAW
	dbw 80, SACRED_FIRE
	db 0 ; no more level-up moves

CharizardyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, METAL_CLAW
	dbw 14, SMOKESCREEN
	dbw 18, RAGE
	dbw 20, SCARY_FACE
	dbw 24, FIRE_FANG	
	dbw 30, AIR_CUTTER
	dbw 36, SLASH
	dbw 40, FLAMETHROWER	
	dbw 45, DRAGONBREATH
	dbw 50, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 60, FIRE_BLAST
	dbw 65, OUTRAGE
	dbw 70, BLAST_BURN
	dbw 75, SKY_ATTACK
	dbw 80, SACRED_FIRE
	db 0 ; no more level-up moves

BlastoisexEvosAttacks:
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
	db 0 ; no more level-up moves

BeedrillxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 10, FURY_ATTACK
	dbw 16, RAGE
	dbw 20, LEER
	dbw 24, TWINEEDLE
	dbw 28, FAINT_ATTACK
	dbw 32, MEAN_LOOK
	dbw 36, DRAGON_DANCE
	dbw 40, PURSUIT
	dbw 45, PIN_MISSILE	
	dbw 50, SLUDGE_BOMB
	dbw 55, TOXIC
	dbw 60, MEGAHORN
	dbw 70, SWORDS_DANCE
	dbw 75, BEAT_UP
	db 0 ; no more level-up moves

AlakazamxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	dbw 16, DISABLE
	dbw 20, GROWL
	dbw 24, PSYBEAM
	dbw 28, RECOVER
	dbw 32, SHADOW_PUNCH
	dbw 36, PSYCH_UP
	dbw 40, PSYCHIC_M	
	dbw 45, FOCUS_PUNCH
	dbw 50, MEDITATE
	dbw 55, REFLECT	
	dbw 60, LIGHT_SCREEN
	dbw 65, FLASHCANNON
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

SlowbroxEvosAttacks:
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

GengarxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, POISON_GAS
	dbw 12, ASTONISH
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, VENOSHOCK
	dbw 28, HEX
	dbw 32, DREAM_EATER
	dbw 36, GROWTH
	dbw 40, SHADOW_BALL
	dbw 45, SLUDGE_WAVE	
	dbw 50, DARK_PULSE
	dbw 55, NIGHTMARE
	dbw 60, PERISH_SONG
	dbw 65, MEAN_LOOK
	dbw 70, DESTINY_BOND
	db 0 ; no more level-up moves

PinsirxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 13, BIND
	dbw 18, FURY_ATTACK
	dbw 24, TWINEEDLE
	dbw 28, HARDEN
	dbw 36, SLASH
	dbw 40, PURSUIT
	dbw 45, MEGAHORN
	dbw 50, DRAGON_DANCE
	dbw 55, SUBMISSION
	dbw 60, GUILLOTINE	
	dbw 65, DOUBLE_EDGE
	dbw 70, SUBMISSION
	dbw 75, SKY_ATTACK
	db 0 ; no more level-up moves

GyaradosxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THRASH
	dbw 20, BITE
	dbw 25, ICE_FANG
	dbw 28, AQUA_JET
	dbw 32, FIRE_FANG
	dbw 36, THUNDER_FANG
	dbw 40, DRAGON_CLAW
	dbw 45, CRUNCH	
	dbw 50, DRAGON_DANCE
	dbw 55, RAIN_DANCE
	dbw 60, HYDRO_PUMP
	dbw 65, HYPER_BEAM
	dbw 70, OUTRAGE
	dbw 75, BEAT_UP
	db 0 ; no more level-up moves

AerodactylxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 8, ROCK_THROW
	dbw 12, BITE
	dbw 16, SUPERSONIC
	dbw 20, SCARY_FACE
	dbw 24, WING_ATTACK	
	dbw 28, ANCIENTPOWER	
	dbw 32, ROCK_TOMB
	dbw 36, DRAGON_DANCE
	dbw 40, DRILL_PECK
	dbw 45, ROCK_SLIDE	
	dbw 50, CRUNCH
	dbw 55, DRAGON_CLAW
	dbw 60, STONE_EDGE
	dbw 65, SKY_ATTACK
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

AmpharosxEvosAttacks:
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

SteelixxEvosAttacks:
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

ScizorxEvosAttacks:
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

HeracrossxEvosAttacks:
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

HoundoomxEvosAttacks:
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

TyranitarxEvosAttacks:
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

AggronxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 4, HARDEN
	dbw 7, SAND_ATTACK
	dbw 16, ROAR
	dbw 20, HEADBUTT
	dbw 24, MAGNITUDE
	dbw 28, PROTECT
	dbw 32, MUD_SLAP
	dbw 36, BULK_UP
	dbw 40, VICEGRIP
	dbw 45, ROCK_SLIDE
	dbw 50, EARTHQUAKE
	dbw 55, COSMIC_POWER
	dbw 60, GUILLOTINE
	dbw 65, STONE_EDGE
	dbw 70, FISSURE	
	db 0 ; no more level-up moves

CameruptxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 10, EMBER
	dbw 16, FOCUS_ENERGY
	dbw 20, ROCK_TOMB
	dbw 24, MAGNITUDE
	dbw 28, FIRE_SPIN
	dbw 32, AMNESIA
	dbw 36, RECOVER
	dbw 40, EARTHQUAKE
	dbw 45, FLAMETHROWER
	dbw 50, ROCK_SLIDE
	dbw 55, DOUBLE_EDGE
	dbw 60, FIRE_BLAST
	dbw 65, FISSURE
	dbw 70, ERUPTION
	db 0 ; no more level-up moves

AltariaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 8, SING
	dbw 12, PIXIE_DUST
	dbw 16, TWISTER
	dbw 20, SAFEGUARD	
	dbw 24, FAE_VOICE
	dbw 28, MIRROR_MOVE
	dbw 32, DRAGON_RAGE
	dbw 36, MIST
	dbw 40, DRAGON_CLAW
	dbw 45, PLAY_ROUGH	
	dbw 50, DRAGON_DANCE
	dbw 55, RECOVER
	dbw 60, OUTRAGE
	dbw 65, PERISH_SONG
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

AbsolxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 5, LEER
	dbw 8, QUICK_ATTACK
	dbw 12, BITE
	dbw 20, FURY_CUTTER
	dbw 24, FAINT_ATTACK
	dbw 28, SWORDS_DANCE
	dbw 32, DOUBLE_TEAM
	dbw 36, SLASH
	dbw 40, PURSUIT	
	dbw 45, PLAY_ROUGH
	dbw 50, DRAGON_DANCE
	dbw 55, PERISH_SONG	
	dbw 60, SKY_ATTACK
	dbw 65, BEAT_UP
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

GlaliexEvosAttacks:
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
	dbw 36, ICE_BEAM
	dbw 40, SHADOW_BALL
	dbw 42, BULK_UP
	dbw 45, HAIL
	dbw 50, BLIZZARD	
	dbw 55, PROTECT
	dbw 60, DESTINY_BOND
	dbw 65, PERISH_SONG
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

SalamencexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 5, BITE
	dbw 9, LEER
	dbw 13, TWISTER
	dbw 17, HEADBUTT
	dbw 21, SCARY_FACE
	dbw 25, FIRE_FANG
	dbw 33, CRUSH_CLAW
	dbw 36, DRAGON_CLAW
	dbw 37, FLAMETHROWER
	dbw 41, CRUNCH
	dbw 45, DRAGON_DANCE
	dbw 49, DRAGONBREATH
	dbw 53, OUTRAGE
	dbw 56, FLAME_WHEEL
	dbw 60, HYPER_BEAM
	dbw 65, HURRICANE
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

MetagrossxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 10, SCARY_FACE
	dbw 12, BITE
	dbw 16, SPIKES
	dbw 20, HEADBUTT
	dbw 24, BULLET_PUNCH
	dbw 28, PSYBEAM
	dbw 32, REFLECT
	dbw 36, PURSUIT
	dbw 40, PSYCHIC_M
	dbw 45, METEOR_MASH
	dbw 50, COSMIC_POWER
	dbw 55, ZEN_HEADBUTT
	dbw 60, FLASHCANNON
	dbw 65, AGILITY
	dbw 70, REFLECT
	db 0 ; no more level-up moves

KinglerxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, METAL_CLAW
	dbw 8, LEER
	dbw 12, SCRATCH
	dbw 16, HARDEN
	dbw 20, BUBBLEBEAM
	dbw 24, STOMP
	dbw 28, ROCK_SMASH
	dbw 32, PROTECT
	dbw 36, CURSE
	dbw 40, VICEGRIP
	dbw 45, AQUA_JET
	dbw 50, CRABHAMMER
	dbw 55, AMNESIA
	dbw 60, GUILLOTINE
	dbw 65, ACID_ARMOR
	dbw 70, BULK_UP	
	db 0 ; no more level-up moves

TropiusxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, LEECH_SEED
	dbw 7, GROWTH
	dbw 12, SWEET_SCENT
	dbw 16, WHIRLWIND
	dbw 20, SUNNY_DAY
	dbw 24, RAZOR_LEAF
	dbw 28, AERIAL_ACE	
	dbw 32, MAGICAL_LEAF
	dbw 36, DRAGON_DANCE
	dbw 40, LEAF_BLADE
	dbw 45, BODY_SLAM	
	dbw 50, SOLARBEAM	
	dbw 55, SYNTHESIS
	dbw 60, SKY_ATTACK
	dbw 65, FRENZY_PLANT
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

SwalotxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 5, POISON_GAS
	dbw 12, TACKLE
	dbw 20, SLUDGE
	dbw 24, MUD_SHOT
	dbw 28, ENCORE
	dbw 30, VENOSHOCK
	dbw 32, TOXIC
	dbw 36, POISON_JAB
	dbw 40, BODY_SLAM
	dbw 45, BULK_UP
	dbw 50, REST
	dbw 55, EARTHQUAKE
	dbw 60, SNORE
	dbw 65, SLEEP_TALK
	dbw 70, SUBSTITUTE
	db 0 ; no more level-up moves

FlygonxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 9, SAND_ATTACK
	dbw 16, SANDSTORM
	dbw 20, DIG
	dbw 24, FAINT_ATTACK	
	dbw 28, MUD_SHOT
	dbw 32, ROCK_TOMB
	dbw 36, POISON_FANG
	dbw 40, DRAGON_CLAW
	dbw 45, EARTHQUAKE
	dbw 50, CRUNCH	
	dbw 55, DRAGON_DANCE
	dbw 60, FIRE_BLAST
	dbw 65, OUTRAGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

ChimechoxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, PSYWAVE
	dbw 7, ASTONISH
	dbw 12, GROWL
	dbw 16, CONFUSION
	dbw 20, HEAL_BELL
	dbw 24, PSYBEAM
	dbw 28, CALM_MIND
	dbw 32, MAGICAL_LEAF
	dbw 36, SAFEGUARD
	dbw 40, EXTRASENSORY
	dbw 45, FLASHCANNON
	dbw 50, RECOVER
	dbw 55, BARRIER
	dbw 60, FUTURE_SIGHT
	dbw 65, ICY_WIND
	dbw 70, WILLOWISP
	db 0 ; no more level-up moves

VictreebelxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 6, GROWTH
	dbw 11, WRAP
	dbw 16, SLEEP_POWDER
	dbw 20, POISONPOWDER	
	dbw 24, RAZOR_LEAF
	dbw 28, VENOSHOCK
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

UnownxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HIDDEN_POWER
	dbw 5, NIGHT_SHADE
	dbw 10, CURSE
	dbw 16, SHADOWSNEAK
	dbw 20, CONFUSE_RAY
	dbw 24, FAINT_ATTACK	
	dbw 28, SHADOW_CLAW
	dbw 30, HEX
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

ButterfreexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, STRING_SHOT
	dbw 10, PIXIE_DUST
	dbw 12, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 20, SUPERSONIC
	dbw 24, FAE_VOICE
	dbw 28, SILVER_WIND
	dbw 32, VENOSHOCK
	dbw 36, CALM_MIND
	dbw 40, SIGNAL_BEAM
	dbw 45, MOONBLAST
	dbw 50, EXTRASENSORY
	dbw 55, SAFEGUARD
	dbw 60, MOONLIGHT
	dbw 65, GIGA_DRAIN
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

LedianxEvosAttacks:
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

MagcargoxEvosAttacks:
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

SceptilexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POUND
	dbw 6, ABSORB
	dbw 12, QUICK_ATTACK
	dbw 16, SCREECH
	dbw 20, LEECH_SEED
	dbw 24, RAZOR_LEAF
	dbw 28, FAINT_ATTACK
	dbw 32, FURY_CUTTER
	dbw 36, LEAF_BLADE
	dbw 40, GIGA_DRAIN	
	dbw 45, DRAGONBREATH
	dbw 50, PURSUIT
	dbw 55, DRAGON_DANCE
	dbw 60, FRENZY_PLANT
	dbw 65, SOLARBEAM
	dbw 70, SUNNY_DAY
	db 0 ; no more level-up moves

BlazikenxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, EMBER
	dbw 12, PECK
	dbw 16, LOW_KICK
	dbw 20, MACH_PUNCH
	dbw 24, FIRE_SPIN	
	dbw 28, MIRROR_MOVE
	dbw 32, DOUBLE_KICK
	dbw 36, BULK_UP
	dbw 40, BLAZE_KICK
	dbw 45, CROSS_CHOP
	dbw 50, DRILL_PECK	
	dbw 55, MIMIC
	dbw 60, MEGA_KICK
	dbw 65, HI_JUMP_KICK
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

SwampertxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, SAND_ATTACK
	dbw 10, CLAMP
	dbw 14, BIDE
	dbw 20, SLAM
	dbw 24, MUD_SHOT
	dbw 28, WATER_PULSE	
	dbw 32, WHIRLPOOL
	dbw 36, RAIN_DANCE
	dbw 40, MUDDY_WATER	
	dbw 45, EARTHQUAKE
	dbw 50, BULK_UP
	dbw 55, WATERFALL
	dbw 60, HYDRO_PUMP
	dbw 65, OUTRAGE
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

GardevoirxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 6, CONFUSION
	dbw 12, CHARM
	dbw 16, TELEPORT
	dbw 20, CONFUSE_RAY
	dbw 24, DRAININGKISS
	dbw 28, PSYBEAM
	dbw 32, HYPNOSIS
	dbw 36, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 45, DREAM_EATER
	dbw 50, MOONBLAST
	dbw 55, RECOVER	
	dbw 60, SUBSTITUTE
	dbw 65, LUSTER_PURGE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

PidgeotxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 8, GUST
	dbw 12, QUICK_ATTACK
	dbw 16, WHIRLWIND
	dbw 24, AERIAL_ACE
	dbw 28, SLAM
	dbw 30, STEEL_WING
	dbw 36, MIRROR_MOVE
	dbw 40, RAZOR_WIND
	dbw 45, EXTREMESPEED
	dbw 50, BULK_UP
	dbw 55, DRAGONBREATH
	dbw 60, HURRICANE
	dbw 65, HYPER_VOICE
	dbw 70, SKY_ATTACK
	dbw 80, AEROBLAST
	db 0 ; no more level-up moves

MercuryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, POWDER_SNOW
	dbw 8, GROWL
	dbw 12, PIXIE_DUST
	dbw 16, ICY_WIND
	dbw 20, RAIN_DANCE
	dbw 24, BUBBLEBEAM
	dbw 25, AURORA_BEAM
	dbw 28, DRAININGKISS
	dbw 32, RECOVER
	dbw 36, CALM_MIND
	dbw 40, SCALD
	dbw 45, ICE_BEAM	
	dbw 50, FAERIEGLEAM
	dbw 55, HEAL_BELL
	dbw 60, HYDRO_PUMP
	dbw 65, MOONBLAST
	dbw 70, BLIZZARD
	dbw 75, HYDRO_CANNON
	db 0 ; no more level-up moves

VenusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 1, LEECH_SEED
	dbw 8, VINE_WHIP
	dbw 12, ROCK_THROW
	dbw 16, SPIKES
	dbw 20, SANDSTORM
	dbw 24, MAGNITUDE
	dbw 25, ROCK_TOMB
	dbw 28, NEEDLE_ARM
	dbw 32, RECOVER
	dbw 36, BULK_UP
	dbw 40, EARTHQUAKE
	dbw 45, LEAF_BLADE
	dbw 50, ROCK_SLIDE
	dbw 55, RECOVER
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
	dbw 25, SNARL
	dbw 28, DRAGON_RAGE
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