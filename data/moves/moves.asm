; Characteristics of each move.

MACRO move
	; the animation byte will be filled when the move is loaded
	db \1 ; effect
	db \2 ; power
	db \3 | \4 ; type 
	db \5 percent ; accuracy
	db \6 ; pp
	db \7 percent ; effect chance
	assert \6 <= 40, "PP must be 40 or less"
ENDM

Moves::
; entries correspond to constants/move_constants.asm
	indirect_table MOVE_LENGTH - 1, 1
	indirect_entries GEN1_MOVES, MovesGen1
	indirect_entries GEN2_MOVES, MovesGen2
	indirect_table_end

PUSHS

SECTION "Moves Gen 1", ROMX

MovesGen1:
	move EFFECT_NORMAL_HIT,         40, FAIRY,			PHYSICAL,       100, 35,   0      ;POUND
	move EFFECT_DEFENSE_DOWN_HIT,   50, FIGHTING,		PHYSICAL,        90, 25,  50      ;KARATE_CHOP
	move EFFECT_MULTI_HIT,          20, FAIRY,			PHYSICAL,       100, 15,   0      ;DOUBLESLAP
	move EFFECT_MULTI_HIT,          20, NORMAL,			PHYSICAL,	    100, 15,   0      ;COMET_PUNCH
	move EFFECT_NORMAL_HIT,         80, NORMAL,			PHYSICAL,	     90, 20,   0      ;MEGA_PUNCH
	move EFFECT_PAY_DAY,            65, NORMAL,			PHYSICAL,		100, 20,   0      ;PAY_DAY
	move EFFECT_BURN_HIT,           70, FIRE,           PHYSICAL,		100, 15,  25      ;FIRE_PUNCH
	move EFFECT_FREEZE_HIT,         70, ICE,			PHYSICAL,		100, 15,  25      ;ICE_PUNCH
	move EFFECT_PARALYZE_HIT,       70, ELECTRIC,       PHYSICAL,		100, 15,  25      ;THUNDERPUNCH
	move EFFECT_NORMAL_HIT,         40, NORMAL,         PHYSICAL,		100, 35,   0      ;SCRATCH
	move EFFECT_NORMAL_HIT,         85, STEEL,          PHYSICAL,		100, 15,   0      ;VICEGRIP
	move EFFECT_DEFENSE_DOWN_HIT,  120, STEEL,          PHYSICAL,		 80, 10, 100      ;GUILLOTINE
	move EFFECT_SP_DEF_DOWN_HIT ,   55, FLYING,         SPECIAL,		100, 15, 100      ;RAZOR_WIND
	move EFFECT_ATTACK_UP_2,         0, NORMAL,         STATUS,			100, 30,   0      ;SWORDS_DANCE
	move EFFECT_DEFENSE_DOWN_HIT,   55, STEEL,          PHYSICAL,		100, 15, 100      ;CUT
	move EFFECT_GUST,               40, FLYING,         SPECIAL,		100, 35,   0      ;GUST
	move EFFECT_NORMAL_HIT,         65, FLYING,         PHYSICAL,		100, 35,   0      ;WING_ATTACK
	move EFFECT_FORCE_SWITCH,        0, NORMAL,         STATUS,			100, 20,   0      ;WHIRLWIND
	move EFFECT_FLY,                90, FLYING,         PHYSICAL,		 95, 15,   0      ;FLY
	move EFFECT_TRAP_TARGET,        35, NORMAL,         PHYSICAL,		100, 20,   0      ;BIND
	move EFFECT_NORMAL_HIT,         80, NORMAL,         PHYSICAL,		 85, 20,   0      ;SLAM
	move EFFECT_NORMAL_HIT,         40, GRASS,          PHYSICAL,		100, 20,   0      ;VINE_WHIP
	move EFFECT_STOMP,              65, NORMAL,         PHYSICAL,		100, 20,  30      ;STOMP
	move EFFECT_DOUBLE_HIT,         30, FIGHTING,       PHYSICAL,		100, 30,   0      ;DOUBLE_KICK
	move EFFECT_NORMAL_HIT,        120, NORMAL,         PHYSICAL,		 80, 10,   0      ;MEGA_KICK
	move EFFECT_JUMP_KICK,          80, FIGHTING,       PHYSICAL,		 90, 25,   0      ;JUMP_KICK
	move EFFECT_FLINCH_HIT,         60, FIGHTING,       PHYSICAL,		 85, 15,  30      ;ROLLING_KICK
	move EFFECT_ACCURACY_DOWN_HIT,  35, GROUND,         PHYSICAL,		100, 15,  25      ;SAND_ATTACK
	move EFFECT_FLINCH_HIT,         70, NORMAL,         PHYSICAL,		100, 15,  30      ;HEADBUTT
	move EFFECT_NORMAL_HIT,         65, NORMAL,         PHYSICAL,		100, 25,   0      ;HORN_ATTACK
	move EFFECT_MULTI_HIT,          20, NORMAL,         PHYSICAL,		 90, 20,   0      ;FURY_ATTACK
	move EFFECT_OHKO,                1, NORMAL,         PHYSICAL,		 30,  5,   0      ;HORN_DRILL
	move EFFECT_FLINCH_HIT,         35, NORMAL,         PHYSICAL,		 95, 35,  25      ;TACKLE
	move EFFECT_PARALYZE_HIT,       85, NORMAL,         PHYSICAL,		100, 15,  15      ;BODY_SLAM
	move EFFECT_TRAP_TARGET,        35, GRASS,          PHYSICAL,		100, 20,   0      ;WRAP
	move EFFECT_RECOIL_HIT,        100, NORMAL,         PHYSICAL,		 90, 20,   0      ;TAKE_DOWN
	move EFFECT_RAMPAGE,           100, NORMAL,         PHYSICAL,		100, 20,   0      ;THRASH
	move EFFECT_RECOIL_HIT,        120, NORMAL,         PHYSICAL,		100, 15,   0      ;DOUBLE_EDGE
	move EFFECT_DEFENSE_DOWN_HIT,   30, NORMAL,         PHYSICAL,		100, 30, 100      ;TAIL_WHIP
	move EFFECT_POISON_HIT,         35, POISON,         PHYSICAL,		100, 35,  30      ;POISON_STING
	move EFFECT_POISON_MULTI_HIT,   30, BUG,            PHYSICAL,		100, 20,  20      ;TWINEEDLE
	move EFFECT_MULTI_HIT,          30, BUG,            SPECIAL,		 90, 20,   0      ;PIN_MISSILE
	move EFFECT_DEFENSE_DOWN_2,      0, NORMAL,         STATUS,			100, 30,   0      ;LEER
	move EFFECT_FLINCH_HIT,         40, DARK,           PHYSICAL,		100, 25,  10      ;BITE
	move EFFECT_ATTACK_DOWN_2,       0, NORMAL,         STATUS,			100, 40,   0      ;GROWL
	move EFFECT_FORCE_SWITCH,        0, NORMAL,         STATUS,			100, 20,   0      ;ROAR
	move EFFECT_SLEEP,               0, NORMAL,         STATUS,			 60, 15,   0      ;SING
	move EFFECT_CONFUSE,             0, NORMAL,         STATUS,			 80, 20,   0      ;SUPERSONIC
	move EFFECT_STATIC_DAMAGE,      20, NORMAL,         SPECIAL,		 90, 20,   0      ;SONICBOOM
	move EFFECT_DISABLE,             0, NORMAL,         STATUS,			 55, 20,   0      ;DISABLE
	move EFFECT_DEFENSE_DOWN_HIT,   30, POISON,         PHYSICAL,		100, 30, 100      ;ACID
	move EFFECT_BURN_HIT,           35, FIRE,           SPECIAL,		100, 25,  20      ;EMBER
	move EFFECT_BURN_HIT,           80, FIRE,           SPECIAL,		100, 15,  10      ;FLAMETHROWER
	move EFFECT_MIST,                0, ICE,            STATUS,			100, 30,   0      ;MIST
	move EFFECT_NORMAL_HIT,         40, WATER,          SPECIAL,		100, 25,   0      ;WATER_GUN
	move EFFECT_NORMAL_HIT,        100, WATER,          SPECIAL,		 90, 10,   0      ;HYDRO_PUMP
	move EFFECT_SPEED_UP_HIT,       80, WATER,          SPECIAL,		100, 15,  25      ;SURF
	move EFFECT_FREEZE_HIT,         80, ICE,            SPECIAL,		100, 10,  10      ;ICE_BEAM
	move EFFECT_BLIZZARD,          120, ICE,            SPECIAL,		 80, 10,  25      ;BLIZZARD
	move EFFECT_CONFUSE_HIT,        65, PSYCHIC_TYPE,   SPECIAL,		100, 20,  10      ;PSYBEAM
	move EFFECT_SPEED_DOWN_HIT,     55, WATER,          SPECIAL,		100, 20, 100      ;BUBBLEBEAM
	move EFFECT_ATTACK_DOWN_HIT,    50, ICE,            SPECIAL,		100, 20, 100      ;AURORA_BEAM
	move EFFECT_HYPER_BEAM,        180, NORMAL,         SPECIAL,		100, 10,   0      ;HYPER_BEAM
	move EFFECT_NORMAL_HIT,         40, FLYING,         PHYSICAL,		100, 35,   0      ;PECK
	move EFFECT_NORMAL_HIT,         90, FLYING,         PHYSICAL,		100, 20,   0      ;DRILL_PECK
	move EFFECT_RECOIL_HIT,        100, FIGHTING,       PHYSICAL,		100, 25,   0      ;SUBMISSION
	move EFFECT_FLINCH_HIT,         40, FIGHTING,       PHYSICAL,		 90, 20,  10      ;LOW_KICK
	move EFFECT_COUNTER,             1, FIGHTING,       PHYSICAL,		100, 20,   0      ;COUNTER
	move EFFECT_LEVEL_DAMAGE,        1, FIGHTING,       PHYSICAL,		100, 20,   0      ;SEISMIC_TOSS
	move EFFECT_ATTACK_UP_HIT,      55, ROCK,           PHYSICAL,		100, 15, 100      ;STRENGTH
	move EFFECT_LEECH_HIT,          35, GRASS,          SPECIAL,		100, 20,   0      ;ABSORB
	move EFFECT_LEECH_HIT,          55, GRASS,          SPECIAL,		100, 15,   0      ;MEGA_DRAIN
	move EFFECT_LEECH_SEED,          0, GRASS,          STATUS,			100, 10,   0      ;LEECH_SEED
	move EFFECT_GROWTH,		         0, NORMAL,         STATUS,			100, 40,   0      ;GROWTH
	move EFFECT_SP_DEF_DOWN_HIT,    55, GRASS,          SPECIAL,		100, 25, 100      ;RAZOR_LEAF
	move EFFECT_SOLARBEAM,         120, GRASS,          SPECIAL,		100, 10,   0      ;SOLARBEAM
	move EFFECT_POISON,              0, POISON,         STATUS,			100, 35,   0      ;POISONPOWDER
	move EFFECT_PARALYZE,            0, GRASS,          STATUS,			100, 30,   0      ;STUN_SPORE
	move EFFECT_SLEEP,               0, GRASS,          STATUS,			 70, 15,   0      ;SLEEP_POWDER
	move EFFECT_RAMPAGE,           100, GRASS,          PHYSICAL,		100, 20,   0      ;PETAL_DANCE
	move EFFECT_SPEED_DOWN_HIT,     35, BUG,            SPECIAL,		100, 40, 100      ;STRING_SHOT
	move EFFECT_STATIC_DAMAGE,      40, DRAGON,         SPECIAL,		100, 10,   0      ;DRAGON_RAGE
	move EFFECT_TRAP_TARGET,        60, FIRE,           SPECIAL,		100, 15,   0      ;FIRE_SPIN
	move EFFECT_PARALYZE_HIT,       35, ELECTRIC,       SPECIAL,		100, 30,  10      ;THUNDERSHOCK
	move EFFECT_PARALYZE_HIT,       85, ELECTRIC,       SPECIAL,		100, 15,  10      ;THUNDERBOLT
	move EFFECT_PARALYZE,            0, ELECTRIC,       STATUS,			 90, 20,   0      ;THUNDER_WAVE
	move EFFECT_THUNDER,           120, ELECTRIC,       SPECIAL,		 80, 10,  50      ;THUNDER
	move EFFECT_NORMAL_HIT,         55, ROCK,           PHYSICAL,		 90, 15,   0      ;ROCK_THROW
	move EFFECT_EARTHQUAKE,         85, GROUND,         PHYSICAL,		100, 10,   0      ;EARTHQUAKE
	move EFFECT_NORMAL_HIT,        120, GROUND,         PHYSICAL,		 80, 10,   0      ;FISSURE
	move EFFECT_FLY,                80, GROUND,         PHYSICAL,		100, 10,   0      ;DIG
	move EFFECT_TOXIC,               0, POISON,         STATUS,			 85, 10,   0      ;TOXIC
	move EFFECT_CONFUSE_HIT,        40, PSYCHIC_TYPE,   SPECIAL,		100, 25,  25      ;CONFUSION
	move EFFECT_SP_DEF_DOWN_HIT,    80, PSYCHIC_TYPE,   SPECIAL,		100, 10,  25      ;PSYCHIC_TYPE_M
	move EFFECT_SLEEP,               0, PSYCHIC_TYPE,   STATUS,			 60, 20,   0      ;HYPNOSIS
	move EFFECT_SP_ATK_UP_2,         0, PSYCHIC_TYPE,   STATUS,			100, 40,   0      ;MEDITATE
	move EFFECT_SPEED_UP_2,          0, PSYCHIC_TYPE,   STATUS,			100, 30,   0      ;AGILITY
	move EFFECT_PRIORITY_HIT,       40, NORMAL,         PHYSICAL,		100, 30,   0      ;QUICK_ATTACK
	move EFFECT_RAGE,               20, NORMAL,         PHYSICAL,		100, 20,   0      ;RAGE
	move EFFECT_TELEPORT,            0, PSYCHIC_TYPE,   STATUS,			100, 20,   0      ;TELEPORT
	move EFFECT_LEVEL_DAMAGE,        1, GHOST,          SPECIAL,		100, 15,   0      ;NIGHT_SHADE
	move EFFECT_MIMIC,               0, NORMAL,         STATUS,			100, 10,   0      ;MIMIC
	move EFFECT_DEFENSE_DOWN_2,      0, NORMAL,         STATUS,			 85, 40,   0      ;SCREECH
	move EFFECT_EVASION_UP,          0, NORMAL,         STATUS,			100, 15,   0      ;DOUBLE_TEAM
	move EFFECT_HEAL,                0, NORMAL,         STATUS,			100, 20,   0      ;RECOVER
	move EFFECT_DEFENSE_UP,          0, NORMAL,         STATUS,			100, 30,   0      ;HARDEN
	move EFFECT_EVASION_UP,          0, NORMAL,         STATUS,			100, 20,   0      ;MINIMIZE
	move EFFECT_ACCURACY_DOWN,       0, NORMAL,         STATUS,			100, 20,   0      ;SMOKESCREEN
	move EFFECT_CONFUSE,             0, GHOST,          STATUS,			100, 10,   0      ;CONFUSE_RAY
	move EFFECT_DEFENSE_UP,          0, WATER,          STATUS,			100, 40,   0      ;WITHDRAW
	move EFFECT_DEFENSE_CURL,        0, NORMAL,         STATUS,			100, 40,   0      ;DEFENSE_CURL
	move EFFECT_DEFENSE_UP_2,        0, PSYCHIC_TYPE,   STATUS,			100, 30,   0      ;BARRIER
	move EFFECT_LIGHT_SCREEN,        0, PSYCHIC_TYPE,   STATUS,			100, 30,   0      ;LIGHT_SCREEN
	move EFFECT_RESET_STATS,         0, ICE,            STATUS,			100, 30,   0      ;HAZE
	move EFFECT_REFLECT,             0, PSYCHIC_TYPE,   STATUS,			100, 20,   0      ;REFLECT
	move EFFECT_FOCUS_ENERGY,        0, NORMAL,         STATUS,			100, 30,   0      ;FOCUS_ENERGY
	move EFFECT_BIDE,                0, NORMAL,         SPECIAL,		100, 10,   0      ;BIDE
	move EFFECT_METRONOME,           0, NORMAL,         SPECIAL,		100, 10,   0      ;METRONOME
	move EFFECT_MIRROR_MOVE,         0, FLYING,         SPECIAL,		100, 20,   0      ;MIRROR_MOVE
	move EFFECT_SELFDESTRUCT,      200, NORMAL,         PHYSICAL,		100,  5,   0      ;SELFDESTRUCT
	move EFFECT_NORMAL_HIT,        100, GRASS,          SPECIAL,		 90, 10,   0      ;EGG_BOMB
	move EFFECT_PARALYZE_HIT,       30, GHOST,          PHYSICAL,		100, 30,  25      ;LICK
	move EFFECT_POISON_HIT,         45, POISON,         SPECIAL,		100, 20,  50      ;SMOG
	move EFFECT_POISON_HIT,         65, POISON,         PHYSICAL,		100, 20,  25      ;SLUDGE
	move EFFECT_FLINCH_HIT,         55, GROUND,         PHYSICAL,		 85, 20,  20      ;BONE_CLUB
	move EFFECT_SP_DEF_DOWN_HIT,   100, FIRE,           SPECIAL,		 90, 10, 100      ;FIRE_BLAST
	move EFFECT_NORMAL_HIT,         90, WATER,          PHYSICAL,		100, 15, 100      ;WATERFALL
	move EFFECT_TRAP_TARGET,        35, WATER,          PHYSICAL,		100, 10,   0      ;CLAMP
	move EFFECT_ALWAYS_HIT,         60, FAIRY,          PHYSICAL,		100, 20,   0      ;SWIFT
	move EFFECT_SKULL_BASH,        120, STEEL,          PHYSICAL,		100, 15,   0      ;SKULL_BASH
	move EFFECT_MULTI_HIT,          30, STEEL,          PHYSICAL,		100, 15,   0      ;SPIKE_CANNON
	move EFFECT_SPEED_DOWN_HIT,     35, NORMAL,         PHYSICAL,		100, 35,  50      ;CONSTRICT
	move EFFECT_SP_DEF_UP_2,         0, PSYCHIC_TYPE,   STATUS,			100, 20,   0      ;AMNESIA
	move EFFECT_ACCURACY_DOWN,       0, PSYCHIC_TYPE,   STATUS,			 80, 15,   0      ;KINESIS
	move EFFECT_HEAL,                0, NORMAL,         STATUS,			100, 10,   0      ;SOFTBOILED
	move EFFECT_JUMP_KICK,         110, FIGHTING,       PHYSICAL,		 90, 20,   0      ;HI_JUMP_KICK
	move EFFECT_PARALYZE,            0, NORMAL,         STATUS,			100, 30,   0      ;GLARE
	move EFFECT_DREAM_EATER,       120, GHOST,          SPECIAL,		100, 15,   0      ;DREAM_EATER
	move EFFECT_POISON_HIT,         35, POISON,         SPECIAL,		100, 30,  25      ;POISON_GAS
	move EFFECT_MULTI_HIT,          25, NORMAL,         PHYSICAL,		 85, 20,   0      ;BARRAGE
	move EFFECT_LEECH_HIT,          35, BUG,            SPECIAL,		100, 15,   0      ;LEECH_LIFE
	move EFFECT_SLEEP,               0, NORMAL,         STATUS,			 75, 10,   0      ;LOVELY_KISS
	move EFFECT_NORMAL_HIT,        100, FLYING,         PHYSICAL,		 90, 10,   0      ;SKY_ATTACK
	move EFFECT_TRANSFORM,           0, NORMAL,         STATUS,			100, 10,   0      ;TRANSFORM
	move EFFECT_SPEED_DOWN_HIT,     35, WATER,          SPECIAL,		100, 30, 100      ;BUBBLE
	move EFFECT_CONFUSE_HIT,        75, FAIRY,          PHYSICAL,		100, 10,  25      ;DIZZY_PUNCH
	move EFFECT_SLEEP,               0, GRASS,          STATUS,			 80, 15,   0      ;SPORE
	move EFFECT_ACCURACY_DOWN_2,     0, NORMAL,         STATUS,			 75, 20,   0      ;FLASH
	move EFFECT_LEVEL_DAMAGE,        1, PSYCHIC_TYPE,   SPECIAL,		100, 15,   0      ;PSYWAVE
	move EFFECT_SPLASH,              0, NORMAL,         SPECIAL,		100, 40,   0      ;SPLASH
	move EFFECT_DEFENSE_UP_2,        0, POISON,         STATUS,			100, 40,   0      ;ACID_ARMOR
	move EFFECT_NORMAL_HIT,         90, WATER,          PHYSICAL,		100, 10,   0      ;CRABHAMMER
	move EFFECT_SELFDESTRUCT,      250, NORMAL,         PHYSICAL,		100,  5,   0      ;EXPLOSION
	move EFFECT_MULTI_HIT,          18, NORMAL,         PHYSICAL,		 90, 15,   0      ;FURY_SWIPES
	move EFFECT_DOUBLE_HIT,         50, GROUND,         PHYSICAL,		 90, 10,   0      ;BONEMERANG
	move EFFECT_HEAL,                0, PSYCHIC_TYPE,   STATUS,			100, 10,   0      ;REST
	move EFFECT_FLINCH_HIT,         80, ROCK,           PHYSICAL,		100, 10,  10      ;ROCK_SLIDE
	move EFFECT_FLINCH_HIT,         80, NORMAL,         PHYSICAL,		100, 15,  10      ;HYPER_FANG
	move EFFECT_ATTACK_UP,           0, NORMAL,         STATUS,			100, 30,   0      ;SHARPEN
	move EFFECT_CONVERSION,          0, NORMAL,         STATUS,			100, 30,   0      ;CONVERSION
	move EFFECT_TRI_ATTACK,         80, NORMAL,         SPECIAL,		100, 10,  25      ;TRI_ATTACK
	move EFFECT_SUPER_FANG,          1, NORMAL,         SPECIAL,		 90, 10,   0      ;SUPER_FANG
	move EFFECT_NORMAL_HIT,         80, NORMAL,         PHYSICAL,		100, 20,   0      ;SLASH
	move EFFECT_SUBSTITUTE,          0, NORMAL,         STATUS,			100, 10,   0      ;SUBSTITUTE
	move EFFECT_RECOIL_HIT,         50, NORMAL,         PHYSICAL,		100,  1,   0      ;STRUGGLE
.IndirectEnd::


SECTION "Moves Gen 2", ROMX

MovesGen2:
	move EFFECT_SKETCH,              0, NORMAL,         STATUS,			100,  1,   0      ;SKETCH
	move EFFECT_TRIPLE_KICK,        15, FIGHTING,       PHYSICAL,		 90, 10,   0      ;TRIPLE_KICK
	move EFFECT_THIEF,              60, DARK,           PHYSICAL,		100, 10, 100      ;THIEF
	move EFFECT_MEAN_LOOK,           0, BUG,            STATUS,			100, 10,   0      ;SPIDER_WEB
	move EFFECT_LOCK_ON,             0, NORMAL,         STATUS,			100,  5,   0      ;MIND_READER
	move EFFECT_NIGHTMARE,           0, GHOST,          STATUS,			100, 15,   0      ;NIGHTMARE
	move EFFECT_FLAME_WHEEL,        80, FIRE,           PHYSICAL,		100, 25,  10      ;FLAME_WHEEL
	move EFFECT_SNORE,              40, NORMAL,         PHYSICAL,		100, 15,  30      ;SNORE
	move EFFECT_CURSE,               0, CURSE_TYPE,     STATUS,			100, 10,   0      ;CURSE
	move EFFECT_REVERSAL,            1, NORMAL,         PHYSICAL,		100, 15,   0      ;FLAIL
	move EFFECT_CONVERSION2,         0, NORMAL,         STATUS,			100, 30,   0      ;CONVERSION2
	move EFFECT_NORMAL_HIT,        100, FLYING,         SPECIAL,		 95, 10,   0      ;AEROBLAST
	move EFFECT_SPEED_DOWN_2,        0, GRASS,          STATUS,			100, 40,   0      ;COTTON_SPORE
	move EFFECT_REVERSAL,            1, FIGHTING,       SPECIAL,		100, 15,   0      ;REVERSAL
	move EFFECT_SPITE,               0, GHOST,          STATUS,			100, 10,   0      ;SPITE
	move EFFECT_FREEZE_HIT,         35, ICE,            SPECIAL,		100, 25,  25      ;POWDER_SNOW
	move EFFECT_PROTECT,             0, NORMAL,         STATUS,			100, 10,   0      ;PROTECT
	move EFFECT_PRIORITY_HIT,       40, FIGHTING,       PHYSICAL,		100, 30,   0      ;MACH_PUNCH
	move EFFECT_SPEED_DOWN_2,        0, NORMAL,         STATUS,			 90, 10,   0      ;SCARY_FACE
	move EFFECT_ALWAYS_HIT,         60, DARK,           PHYSICAL,		100, 20,   0      ;FAINT_ATTACK
	move EFFECT_CONFUSE,             0, NORMAL,         STATUS,			100, 10,   0      ;SWEET_KISS
	move EFFECT_BELLY_DRUM,          0, NORMAL,         STATUS,			100, 10,   0      ;BELLY_DRUM
	move EFFECT_POISON_HIT,         80, POISON,         PHYSICAL,		100, 10,  25      ;SLUDGE_BOMB
	move EFFECT_ACCURACY_DOWN_HIT,  40, GROUND,         SPECIAL,		100, 10, 100      ;MUD_SLAP
	move EFFECT_ACCURACY_DOWN_HIT,  70, WATER,          SPECIAL,		100, 10,  50      ;OCTAZOOKA
	move EFFECT_SPIKES,              0, GROUND,         STATUS,			100, 20,   0      ;SPIKES
	move EFFECT_PARALYZE_HIT,      150, ELECTRIC,       SPECIAL,		 65, 10, 100      ;ZAP_CANNON
	move EFFECT_FORESIGHT,           0, NORMAL,         STATUS,			100, 40,   0      ;FORESIGHT
	move EFFECT_DESTINY_BOND,        0, GHOST,          STATUS,			100,  5,   0      ;DESTINY_BOND
	move EFFECT_PERISH_SONG,         0, NORMAL,         STATUS,			100,  5,   0      ;PERISH_SONG
	move EFFECT_FREEZE,              0, ICE,            STATUS,			 90, 15, 100      ;ICY_WIND
	move EFFECT_PROTECT,             0, FIGHTING,       STATUS,			100,  5,   0      ;DETECT
	move EFFECT_MULTI_HIT,          25, GROUND,         PHYSICAL,		100, 10,   0      ;BONE_RUSH
	move EFFECT_LOCK_ON,             0, NORMAL,         STATUS,			100,  5,   0      ;LOCK_ON
	move EFFECT_RAMPAGE,           100, DRAGON,         PHYSICAL,		100, 15,   0      ;OUTRAGE
	move EFFECT_SANDSTORM,           0, ROCK,           STATUS,			100, 10,   0      ;SANDSTORM
	move EFFECT_LEECH_HIT,          80, GRASS,          SPECIAL,		100, 10,   0      ;GIGA_DRAIN
	move EFFECT_ENDURE,              0, NORMAL,         STATUS,			100, 10,   0      ;ENDURE
	move EFFECT_SP_ATK_DOWN_2,       0, NORMAL,         STATUS,			100, 20,   0      ;CHARM
	move EFFECT_ROLLOUT,            30, ROCK,           PHYSICAL,		 90, 20,   0      ;ROLLOUT
	move EFFECT_FALSE_SWIPE,        60, NORMAL,         PHYSICAL,		100, 40,   0      ;FALSE_SWIPE
	move EFFECT_SWAGGER,             0, NORMAL,         STATUS,			 90, 15, 100      ;SWAGGER
	move EFFECT_HEAL,                0, NORMAL,         STATUS,			100, 10,   0      ;MILK_DRINK
	move EFFECT_PARALYZE_HIT,       65, ELECTRIC,       SPECIAL,		 90, 20,  25      ;SPARK
	move EFFECT_DEFENSE_DOWN_HIT,   55, BUG,            PHYSICAL,		100, 20, 100      ;FURY_CUTTER
	move EFFECT_DEFENSE_UP_HIT,     60, STEEL,          PHYSICAL,		 90, 25,  50      ;STEEL_WING
	move EFFECT_MEAN_LOOK,           0, NORMAL,         STATUS,			100,  5,   0      ;MEAN_LOOK
	move EFFECT_ATTRACT,             0, NORMAL,         STATUS,			100, 15,   0      ;ATTRACT
	move EFFECT_SLEEP_TALK,          0, NORMAL,         STATUS,			100, 10,   0      ;SLEEP_TALK
	move EFFECT_HEAL_BELL,           0, NORMAL,         STATUS,			100,  5,   0      ;HEAL_BELL
	move EFFECT_RETURN,              1, NORMAL,         PHYSICAL,		100, 20,   0      ;RETURN
	move EFFECT_PRESENT,             1, NORMAL,         PHYSICAL,		 90, 15,   0      ;PRESENT
	move EFFECT_FRUSTRATION,         1, NORMAL,         PHYSICAL,		100, 20,   0      ;FRUSTRATION
	move EFFECT_SAFEGUARD,           0, NORMAL,         STATUS,			100, 25,   0      ;SAFEGUARD
	move EFFECT_PAIN_SPLIT,          0, NORMAL,         STATUS,			100, 20,   0      ;PAIN_SPLIT
	move EFFECT_SACRED_FIRE,       100, FIRE,           PHYSICAL,		 95, 10,  50      ;SACRED_FIRE
	move EFFECT_MAGNITUDE,           1, GROUND,         PHYSICAL,		100, 30,   0      ;MAGNITUDE
	move EFFECT_CONFUSE_HIT,       100, FIGHTING,       PHYSICAL,		 75, 10, 100      ;DYNAMICPUNCH
	move EFFECT_NORMAL_HIT,        120, BUG,            PHYSICAL,		 80, 10,   0      ;MEGAHORN
	move EFFECT_PARALYZE_HIT,       80, DRAGON,         SPECIAL,		100, 20,  25      ;DRAGONBREATH
	move EFFECT_BATON_PASS,          0, NORMAL,         STATUS,			100, 40,   0      ;BATON_PASS
	move EFFECT_ENCORE,              0, NORMAL,         STATUS,			100,  5,   0      ;ENCORE
	move EFFECT_PURSUIT,            80, DARK,           PHYSICAL,		100, 20,   0      ;PURSUIT
	move EFFECT_RAPID_SPIN,         60, NORMAL,         PHYSICAL,		100, 40,   0      ;RAPID_SPIN
	move EFFECT_EVASION_DOWN,        0, NORMAL,         STATUS,			100, 20,   0      ;SWEET_SCENT
	move EFFECT_DEFENSE_DOWN_HIT,  100, STEEL,          PHYSICAL,		 90, 15,  30      ;IRON_TAIL
	move EFFECT_ATTACK_UP_HIT,      25, STEEL,          PHYSICAL,		 95, 35, 100      ;METAL_CLAW
	move EFFECT_ALWAYS_HIT,         85, FIGHTING,       PHYSICAL,		100, 10,   0      ;VITAL_THROW
	move EFFECT_MORNING_SUN,         0, NORMAL,         STATUS,			100,  5,   0      ;MORNING_SUN
	move EFFECT_SYNTHESIS,           0, GRASS,          STATUS,			100,  5,   0      ;SYNTHESIS
	move EFFECT_MOONLIGHT,           0, NORMAL,         STATUS,			100,  5,   0      ;MOONLIGHT
	move EFFECT_HIDDEN_POWER,        1, NORMAL,         SPECIAL,		100, 15,   0      ;HIDDEN_POWER
	move EFFECT_NORMAL_HIT,         85, FIGHTING,       PHYSICAL,		100, 15,   0      ;CROSS_CHOP
	move EFFECT_TWISTER,            40, DRAGON,         SPECIAL,		100, 20,  20      ;TWISTER
	move EFFECT_RAIN_DANCE,          0, WATER,          STATUS,			 90,  5,   0      ;RAIN_DANCE
	move EFFECT_SUNNY_DAY,           0, FIRE,           STATUS,			 90,  5,   0      ;SUNNY_DAY
	move EFFECT_DEFENSE_DOWN_HIT,   80, DARK,           PHYSICAL,		100, 15,  25      ;CRUNCH
	move EFFECT_MIRROR_COAT,         1, PSYCHIC_TYPE,   SPECIAL,		100, 20,   0      ;MIRROR_COAT
	move EFFECT_PSYCH_UP,            0, NORMAL,         STATUS,			100, 10,   0      ;PSYCH_UP
	move EFFECT_PRIORITY_HIT,       80, NORMAL,         PHYSICAL,		100, 10,   0      ;EXTREMESPEED
	move EFFECT_ALL_UP_HIT,         60, ROCK,           SPECIAL,		100, 10,  10      ;ANCIENTPOWER
	move EFFECT_SP_DEF_DOWN_HIT,    80, GHOST,          SPECIAL,		100, 15,  25      ;SHADOW_BALL
	move EFFECT_FUTURE_SIGHT,      200, PSYCHIC_TYPE,   SPECIAL,		100, 15,   0      ;FUTURE_SIGHT
	move EFFECT_DEFENSE_DOWN_HIT,   55, FIGHTING,       PHYSICAL,		100, 15, 100      ;ROCK_SMASH
	move EFFECT_TRAP_TARGET,        75, WATER,          SPECIAL,		100, 15,   0      ;WHIRLPOOL
	move EFFECT_FLINCH_HIT,        100, DARK,           PHYSICAL,		 90, 10,  10      ;BEAT_UP
	move EFFECT_BURN,                0, FIRE,           STATUS,			 90, 15,   0      ;WILLOWISP
	move EFFECT_ACCURACY_DOWN_HIT,  35, FAIRY,          SPECIAL,		100, 25,  25      ;PIXIE_DUST
	move EFFECT_SP_ATK_DOWN_HIT,    50, FAIRY,          SPECIAL,		100, 20, 100      ;FAE_VOICE
	move EFFECT_RAMPAGE,           100, NORMAL,         SPECIAL,		100, 10,   0      ;UPROAR
	move EFFECT_BURN_HIT,          100, FIRE,           SPECIAL,		 90, 10,  10      ;HEAT_WAVE
	move EFFECT_HAIL,		         0, ICE,            STATUS,			100, 10,   0      ;HAIL 
	move EFFECT_FLINCH_HIT,         80, FIGHTING,       SPECIAL,		100, 20,  10      ;FOCUS_PUNCH 
	move EFFECT_NORMAL_HIT,         85, GRASS,		    PHYSICAL,		100, 20,   0      ;NATURE_POWER 
	move EFFECT_CHARGE,              0, ELECTRIC,       STATUS,	    	100, 20,   0      ;CHARGE 
	move EFFECT_RECOIL_HIT,        100, FIGHTING,       SPECIAL,		100, 10,   0      ;SUPERPOWER 
	move EFFECT_DEFENSE_DOWN_HIT,   75, FIGHTING,       PHYSICAL,		100, 15,  50      ;BRICK_BREAK 
	move EFFECT_RECOIL_HIT,        100, FIRE,           SPECIAL,		100, 10,   0      ;ERUPTION
	move EFFECT_MULTI_HIT,          15, FIGHTING,       PHYSICAL,		100, 20,   0      ;ARM_THRUST
	move EFFECT_NORMAL_HIT,        120, FAIRY,          SPECIAL,		 85, 10,   0      ;LUSTER_PURGE
	move EFFECT_SP_DEF_DOWN_HIT,    80, WATER,          SPECIAL,		100, 10,  50      ;MIST_BALL
	move EFFECT_BURN_HIT,           80, FIRE,           PHYSICAL,		100, 10,  15      ;BLAZE_KICK
	move EFFECT_ROLLOUT,            30, ICE,            PHYSICAL,		 90, 20,   0      ;ICE_BALL
	move EFFECT_FLINCH_HIT,         60, GRASS,          PHYSICAL,		100, 15,  30      ;NEEDLE_ARM
	move EFFECT_NORMAL_HIT,         90, NORMAL,         SPECIAL,		100, 10,   0      ;HYPER_VOICE
	move EFFECT_POISON_HIT,         65, POISON,         PHYSICAL,		100, 15,  50      ;POISON_FANG 
	move EFFECT_DEFENSE_DOWN_HIT,   75, NORMAL,         PHYSICAL,		100, 10,  50      ;CRUSH_CLAW
	move EFFECT_HYPER_BEAM,        150, FIRE,           SPECIAL,		 90, 10,   0      ;BLAST_BURN
	move EFFECT_HYPER_BEAM,        150, WATER,          SPECIAL,		 90, 10,   0      ;HYDRO_CANNON
	move EFFECT_ATTACK_UP_HIT,      85, STEEL,          PHYSICAL,		100, 10,  10      ;METEOR_MASH
	move EFFECT_FLINCH_HIT,         30, GHOST,          PHYSICAL,		100, 15,  30      ;ASTONISH
	move EFFECT_NORMAL_HIT,         65, FLYING,         SPECIAL,		100, 25,   0      ;AIR_CUTTER
	move EFFECT_SPEED_DOWN_HIT,     60, ROCK,           PHYSICAL,		 95, 15, 100      ;ROCK_TOMB
	move EFFECT_ALL_UP_HIT,         60, BUG,            SPECIAL,		100, 10,  10      ;SILVER_WIND
	move EFFECT_COSMIC_POWER,        0, PSYCHIC_TYPE,   STATUS,			100, 20,   0      ;COSMIC_POWER
	move EFFECT_RECOIL_HIT,        100, WATER,          SPECIAL,		100, 10,   0      ;WATER_SPOUT 
	move EFFECT_CONFUSE_HIT,        80, BUG,            SPECIAL,		100, 15,  10      ;SIGNAL_BEAM
	move EFFECT_ALWAYS_HIT,         65, GHOST,          PHYSICAL,		100, 20,   0      ;SHADOW_PUNCH
	move EFFECT_FLINCH_HIT,         80, PSYCHIC_TYPE,   SPECIAL,		100, 30,  15      ;EXTRASENSORY
	move EFFECT_ACCURACY_DOWN_HIT,  80, WATER,          SPECIAL,		 95, 10,  10      ;MUDDY_WATER
	move EFFECT_MULTI_HIT,          15, GRASS,          PHYSICAL,		100, 30,   0      ;BULLET_SEED
	move EFFECT_ALWAYS_HIT,         60, FLYING,         SPECIAL,		100, 20,   0      ;AERIAL_ACE
	move EFFECT_MULTI_HIT,          25, ICE,            PHYSICAL,		100, 30,   0      ;ICICLE_SPEAR
	move EFFECT_ATTACK_UP_HIT,      80, DRAGON,         PHYSICAL,		100, 15,  10      ;DRAGON_CLAW
	move EFFECT_HYPER_BEAM,        150, GRASS,          SPECIAL,		 90, 10,   0      ;FRENZY_PLANT
	move EFFECT_BULK_UP,             0, FIGHTING,       STATUS,			100, 20,   0      ;BULK_UP
	move EFFECT_SPEED_DOWN_HIT,     55, GROUND,         SPECIAL,		100, 15, 100      ;MUD_SHOT
	move EFFECT_POISON_HIT,         65, POISON,         PHYSICAL,		100, 25,  10      ;POISON_TAIL
	move EFFECT_RECOIL_HIT,        120, ELECTRIC,       PHYSICAL,		100, 15,   0      ;VOLT_TACKLE
	move EFFECT_ALWAYS_HIT,         60, GRASS,          SPECIAL,		100, 20,   0      ;MAGICAL_LEAF
	move EFFECT_CALM_MIND,           0, PSYCHIC_TYPE,   STATUS,			100, 20,   0      ;CALM_MIND 
	move EFFECT_NORMAL_HIT,         85, GRASS,          PHYSICAL,		100, 15,   0      ;LEAF_BLADE
	move EFFECT_DRAGON_DANCE,        0, DRAGON,         STATUS,			100, 20,   0      ;DRAGON_DANCE 
	move EFFECT_MULTI_HIT,          25, ROCK,           PHYSICAL,		 80, 10,   0      ;ROCK_BLAST
	move EFFECT_ALWAYS_HIT,         60, ELECTRIC,       SPECIAL,		100, 20,   0      ;SHOCK_WAVE
	move EFFECT_CONFUSE_HIT,        60, WATER,          SPECIAL,		100, 20,  20      ;WATER_PULSE
	move EFFECT_PARALYZE_HIT,       70, ELECTRIC,       PHYSICAL,		100, 20,  20      ;THUNDER_FANG
	move EFFECT_FREEZE_HIT,         70, ICE,            PHYSICAL,		100, 20,  20      ;ICE_FANG
	move EFFECT_BURN_HIT,           70, FIRE,           PHYSICAL,		100, 20,  20      ;FIRE_FANG
	move EFFECT_LEECH_HIT,          55, FAIRY,          SPECIAL,		100, 15,   0      ;DRAININGKISS
	move EFFECT_SP_ATK_DOWN_HIT,    85, FAIRY,          SPECIAL,		100, 15,  25      ;MOONBLAST
	move EFFECT_ATTACK_DOWN_HIT,    85, FAIRY,          PHYSICAL,		100, 15,  25      ;PLAY_ROUGH
	move EFFECT_ALWAYS_HIT,         80, FIGHTING,       SPECIAL,		100, 20,   0      ;AURA_SPHERE
	move EFFECT_NORMAL_HIT,         70, GHOST,          PHYSICAL,		100, 20,   0      ;SHADOW_CLAW
	move EFFECT_FLINCH_HIT,         80, ICE,            PHYSICAL,		 95, 20,  20      ;ICICLE_CRASH
	move EFFECT_POISON_HIT,         80, POISON,         PHYSICAL,		100, 20,  30      ;POISON_JAB
	move EFFECT_NORMAL_HIT,         80, ROCK,           SPECIAL,		100, 20,   0      ;POWER_GEM
	move EFFECT_NORMAL_HIT,         70, PSYCHIC_TYPE,   PHYSICAL,		100, 20,   0      ;PSYCHO_CUT
	move EFFECT_FLINCH_HIT,         80, PSYCHIC_TYPE,   PHYSICAL,		 95, 20,  20      ;ZEN_HEADBUTT
	move EFFECT_SP_DEF_DOWN_HIT,    80, STEEL,          SPECIAL,		100, 20,  20      ;FLASHCANNON
	move EFFECT_PRIORITY_HIT,       40, WATER,          PHYSICAL,		100, 20,   0      ;AQUA_JET
	move EFFECT_FLINCH_HIT,         80, DARK,           SPECIAL,		100, 20,  20      ;DARK_PULSE
	move EFFECT_NORMAL_HIT,         90, FAIRY,			SPECIAL,        100, 15,   0      ;FAERIEGLEAM (DAZZLING_GLEAM)
	move EFFECT_POISON_HIT,         80, POISON,         SPECIAL,		100, 15,  25      ;SLUDGEWAVE
	move EFFECT_PRIORITY_HIT,       40, STEEL,          PHYSICAL,		100, 20,   0      ;BULLET_PUNCH
	move EFFECT_THUNDER,           120, FLYING,         SPECIAL,		 80, 10,  50      ;HURRICANE
	move EFFECT_PRIORITY_HIT,       40, GHOST,          PHYSICAL,		100, 20,   0      ;SHADOWSNEAK
	move EFFECT_NORMAL_HIT,        100, GHOST,          PHYSICAL,		 90, 15,   0      ;SHADOWFORCE
	move EFFECT_NORMAL_HIT,        100, ROCK,           PHYSICAL,		 90, 15,   0      ;STONE_EDGE
	move EFFECT_BURN_HIT,           80, WATER,          SPECIAL,		100, 15,  25      ;SCALD
	move EFFECT_DEFENSE_DOWN_HIT,   75, WATER,          PHYSICAL,		100, 15,  50      ;RAZOR_SHELL
	move EFFECT_SP_DEF_DOWN_HIT ,   80, GROUND,         SPECIAL,		100, 15,  25      ;EARTH_POWER
	move EFFECT_JUMP_KICK,         110, ELECTRIC,       PHYSICAL,		 90, 25,   0      ;SHOCKSLAM
	move EFFECT_SP_ATK_DOWN_HIT,    50, DARK,           SPECIAL,		100, 15, 100      ;SNARL
.IndirectEnd::

POPS
