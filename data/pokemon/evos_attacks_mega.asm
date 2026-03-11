SECTION "Evolutions and Attacks Mega", ROMX

EvosAttacksPointersMega::
	dw RaichuxEvosAttacks
	dw RaichuyEvosAttacks
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
	dw JynxxEvosAttacks
.IndirectEnd::

RaichuxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, OUTRAGE
	dbw 1, VOLT_TACKLE
	dbw 1, SWIFT
	dbw 1, BEAT_UP
	db 0 ; no more level-up moves

RaichuyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FAERIEGLEAM
	dbw 1, VOLT_TACKLE
	dbw 1, FLASHCANNON
	dbw 1, THUNDERBOLT
	db 0 ; no more level-up moves

DragonitexEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DRAGON_DANCE
	dbw 1, DRAGON_CLAW
	dbw 1, PLAY_ROUGH
	dbw 1, THUNDERBOLT
	db 0 ; no more level-up moves

DragoniteyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DRAGON_DANCE
	dbw 1, DRAGONBREATH
	dbw 1, FAERIEGLEAM
	dbw 1, SCALD
	db 0 ; no more level-up moves

VenusaurxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 7, LEECH_SEED
	dbw 10, VINE_WHIP
	dbw 12, POISONPOWDER
	dbw 16, SLEEP_POWDER
	dbw 20, RAZOR_LEAF
	dbw 24, SYNTHESIS	
	dbw 26, SLUDGE
	dbw 30, GROWTH
	dbw 36, LEAF_BLADE
	dbw 40, SLUDGE_BOMB
	dbw 44, SOLARBEAM
	dbw 50, SUNNY_DAY
	dbw 55, TOXIC
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

CharizardxEvosAttacks:
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
	dbw 36, FLAMETHROWER	
	dbw 40, DRAGONBREATH
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, BLAST_BURN
	dbw 62, DRAGON_CLAW
	dbw 64, FIRE_BLAST
	dbw 70, DRAGON_DANCE
	db 0 ; no more level-up moves

CharizardyEvosAttacks:
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
	dbw 36, FLAMETHROWER	
	dbw 40, DRAGONBREATH
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, BLAST_BURN
	dbw 65, SKY_ATTACK
	db 0 ; no more level-up moves

BlastoisexEvosAttacks:
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
	db 0 ; no more level-up moves

BeedrillxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FURY_ATTACK
	dbw 1, STRING_SHOT
	dbw 10, FURY_ATTACK
	dbw 16, FAINT_ATTACK
	dbw 20, TWINEEDLE
	dbw 24, RAGE
	dbw 32, DRAGON_DANCE
	dbw 36, PURSUIT
	dbw 40, PIN_MISSILE	
	dbw 42, AGILITY
	dbw 45, SLUDGE_BOMB
	dbw 50, MEGAHORN
	dbw 55, MEAN_LOOK
	dbw 60, SWORDS_DANCE
	db 0 ; no more level-up moves

AlakazamxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	dbw 16, DISABLE
	dbw 24, PSYBEAM
	dbw 26, RECOVER
	dbw 32, MEDITATE
	dbw 36, PSYCHIC_M
	dbw 40, FLASHCANNON
	dbw 42, FOCUS_PUNCH
	dbw 45, REFLECT	
	dbw 50, LIGHT_SCREEN
	dbw 55, AURA_SPHERE
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

SlowbroxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, GROWL
	dbw 12, WATER_GUN
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, PSYWAVE
	dbw 32, AMNESIA
	dbw 36, PSYCHIC_M
	dbw 40, REST
	dbw 42, SCALD
	dbw 45, SKULL_BASH
	dbw 50, HYDRO_PUMP
	dbw 55, FUTURE_SIGHT
	dbw 60, RAIN_DANCE
	db 0 ; no more level-up moves

GengarxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, ACID
	dbw 12, ASTONISH
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 28, SHADOW_CLAW
	dbw 30, DREAM_EATER
	dbw 36, SHADOW_BALL
	dbw 40, SLUDGE_WAVE
	dbw 42, GROWTH
	dbw 45, DARK_PULSE
	dbw 50, NIGHTMARE
	dbw 55, PERISH_SONG
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

PinsirxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 13, BIND
	dbw 19, TWINEEDLE
	dbw 25, HARDEN
	dbw 31, SLASH
	dbw 36, PURSUIT
	dbw 40, SWORDS_DANCE
	dbw 42, MEGAHORN
	dbw 45, SUBMISSION
	dbw 50, GUILLOTINE	
	db 0 ; no more level-up moves

GyaradosxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THRASH
	dbw 20, BITE
	dbw 25, ICE_FANG
	dbw 28, AQUA_JET
	dbw 30, FIRE_FANG
	dbw 32, THUNDER_FANG
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 42, RAIN_DANCE
	dbw 45, DRAGON_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, HYPER_BEAM
	dbw 60, OUTRAGE
	db 0 ; no more level-up moves

AerodactylxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 8, ROCK_THROW
	dbw 12, BITE
	dbw 16, SUPERSONIC
	dbw 20, WING_ATTACK	
	dbw 24, ANCIENTPOWER
	dbw 28, SCARY_FACE
	dbw 32, ROCK_TOMB
	dbw 36, DRILL_PECK
	dbw 40, ROCK_SLIDE
	dbw 43, DRAGON_DANCE
	dbw 45, CRUNCH
	dbw 50, DRAGON_CLAW
	dbw 55, SANDSTORM
	dbw 60, HYPER_BEAM
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

SteelixxEvosAttacks:
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

ScizorxEvosAttacks:
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

HeracrossxEvosAttacks:
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

HoundoomxEvosAttacks:
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

TyranitarxEvosAttacks:
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

AggronxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 4, HARDEN
	dbw 7, SAND_ATTACK
	dbw 16, ROAR
	dbw 20, HEADBUTT	
	dbw 24, MAGNITUDE
	dbw 28, PROTECT
	dbw 32, BULK_UP
	dbw 36, VICEGRIP
	dbw 40, ROCK_SLIDE
	dbw 42, EARTHQUAKE
	dbw 45, COSMIC_POWER
	dbw 50, FLASHCANNON
	dbw 55, FISSURE
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

CameruptxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 10, EMBER
	dbw 16, FOCUS_ENERGY
	dbw 20, ROCK_TOMB
	dbw 24, MAGNITUDE
	dbw 29, FIRE_SPIN
	dbw 32, AMNESIA
	dbw 35, EARTHQUAKE
	dbw 38, FLAMETHROWER
	dbw 40, ROCK_SLIDE
	dbw 42, DOUBLE_EDGE
	dbw 45, FIRE_BLAST
	dbw 50, RECOVER
	dbw 55, ERUPTION
	dbw 60, FISSURE
	db 0 ; no more level-up moves

AltariaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 8, SING
	dbw 12, PIXIE_DUST
	dbw 16, TWISTER
	dbw 20, SAFEGUARD
	dbw 22, MIST
	dbw 24, FAE_VOICE
	dbw 28, DRAGON_RAGE
	dbw 32, MIRROR_MOVE
	dbw 36, DRAGON_CLAW
	dbw 40, PLAY_ROUGH	
	dbw 42, DRAGON_DANCE
	dbw 45, PERISH_SONG
	dbw 50, RECOVER
	dbw 55, OUTRAGE
	dbw 60, LUSTER_PURGE
	db 0 ; no more level-up moves

AbsolxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 5, LEER
	dbw 8, QUICK_ATTACK
	dbw 12, BITE
	dbw 17, FURY_CUTTER
	dbw 21, FAINT_ATTACK
	dbw 26, SWORDS_DANCE
	dbw 31, DOUBLE_TEAM
	dbw 33, PURSUIT
	dbw 36, SLASH
	dbw 40, PLAY_ROUGH
	dbw 41, FUTURE_SIGHT
	dbw 45, PERISH_SONG
	dbw 47, EXTREMESPEED
	dbw 50, DRAGON_DANCE
	dbw 60, SKY_ATTACK
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
	dbw 34, COSMIC_POWER
	dbw 36, ICE_BEAM
	dbw 40, SHADOW_BALL
	dbw 42, BULK_UP
	dbw 45, HAIL
	dbw 50, BLIZZARD	
	dbw 55, PROTECT
	dbw 60, DESTINY_BOND
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
	db 0 ; no more level-up moves

MetagrossxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 10, SCARY_FACE
	dbw 12, BITE
	dbw 16, SPIKES
	dbw 20, HEADBUTT
	dbw 22, BULLET_PUNCH
	dbw 24, PSYBEAM
	dbw 28, REFLECT
	dbw 32, PURSUIT
	dbw 36, PSYCHIC_M
	dbw 40, METEOR_MASH
	dbw 42, COSMIC_POWER
	dbw 45, ZEN_HEADBUTT
	dbw 50, FLASHCANNON
	dbw 55, AGILITY
	dbw 60, REFLECT
	db 0 ; no more level-up moves

KinglerxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, METAL_CLAW
	dbw 5, LEER
	dbw 10, SCRATCH
	dbw 16, HARDEN
	dbw 20, BUBBLEBEAM
	dbw 23, STOMP
	dbw 27, ROCK_SMASH
	dbw 30, VICEGRIP
	dbw 34, PROTECT
	dbw 40, GUILLOTINE	
	dbw 45, CRABHAMMER
	dbw 50, CURSE
	dbw 60, AQUA_JET
	db 0 ; no more level-up moves

TropiusxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, LEECH_SEED
	dbw 7, GROWTH
	dbw 11, SWEET_SCENT
	dbw 17, RAZOR_LEAF
	dbw 21, AERIAL_ACE
	dbw 27, WHIRLWIND
	dbw 31, MAGICAL_LEAF
	dbw 33, BODY_SLAM
	dbw 36, LEAF_BLADE
	dbw 40, DRAGON_DANCE
	dbw 41, SOLARBEAM
	dbw 45, SUNNY_DAY
	dbw 47, SYNTHESIS
	dbw 50, SKY_ATTACK
	dbw 60, HURRICANE
	db 0 ; no more level-up moves

SwalotxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 5, POISON_GAS
	dbw 16, SLUDGE
	dbw 20, MUD_SHOT
	dbw 24, ENCORE
	dbw 28, TOXIC
	dbw 32, POISON_JAB
	dbw 36, BODY_SLAM
	dbw 40, BULK_UP
	dbw 42, REST
	dbw 45, EARTHQUAKE
	dbw 50, SNORE
	dbw 55, SLEEP_TALK
	dbw 60, SUBSTITUTE
	db 0 ; no more level-up moves

FlygonxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 9, SAND_ATTACK
	dbw 16, FAINT_ATTACK
	dbw 20, DIG
	dbw 24, SANDSTORM
	dbw 28, MUD_SHOT
	dbw 32, CRUNCH
	dbw 36, DRAGON_CLAW
	dbw 40, EARTHQUAKE
	dbw 42, DRAGON_DANCE
	dbw 45, CRUNCH
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

ChimechoxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, PSYWAVE
	dbw 7, ASTONISH
	dbw 11, GROWL
	dbw 15, CONFUSION
	dbw 17, HEAL_BELL
	dbw 21, PSYBEAM
	dbw 27, CALM_MIND
	dbw 31, MAGICAL_LEAF
	dbw 33, EXTRASENSORY
	dbw 36, SAFEGUARD
	dbw 40, COSMIC_POWER
	dbw 41, RECOVER
	dbw 45, BARRIER
	dbw 47, ICY_WIND
	dbw 50, FUTURE_SIGHT
	db 0 ; no more level-up moves

VictreebelxEvosAttacks:
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
	dbw 36, SLUDGE_BOMB
	dbw 40, NATURE_POWER
	dbw 42, LEECH_SEED
	dbw 45, BODY_SLAM
	dbw 50, SOLARBEAM
	dbw 55, TOXIC
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

UnownxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HIDDEN_POWER
	dbw 5, NIGHT_SHADE
	dbw 10, CURSE
	dbw 15, FAINT_ATTACK
	dbw 20, CONFUSE_RAY
	dbw 22, SHADOWSNEAK
	dbw 25, SHADOW_CLAW
	dbw 30, WILLOWISP
	dbw 32, DARK_PULSE
	dbw 36, SHADOW_BALL
	dbw 40, COSMIC_POWER
	dbw 42, GLARE
	dbw 45, PURSUIT
	dbw 50, SHADOW_FORCE
	dbw 55, RECOVER
	dbw 60, DRAGON_DANCE
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
	dbw 32, PSYBEAM
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

JynxxEvosAttacks:
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

ENDSECTION