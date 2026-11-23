; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemDescriptions (see data/items/descriptions.asm)
; - ItemAttributes (see data/items/attributes.asm)
; - ItemEffects (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM      ; 0000
	const TOWN_MAP
	const MOON_STONE
	const ESCAPE_ROPE
	const REPEL
	const FIRE_STONE
	const THUNDERSTONE
	const WATER_STONE
	const X_ACCURACY
	const LEAF_STONE
	const POKE_DOLL
	const GUARD_SPEC
	const SUPER_REPEL
	const MAX_REPEL
	const DIRE_HIT
	const X_ATTACK
	const X_DEFEND
	const X_SPEED
	const X_SPECIAL
	const POKE_FLUTE
	const EXP_SHARE
	const DAWN_STONE
	const ICE_STONE
	const KANTOITE_X
	const KANTOITE_Y
	const JOHTOITE_X
	const HOENNITE_X
	const NORMAL_BOX
	const GORGEOUS_BOX
	const SUN_STONE
	const ITEM_AB
	const ITEM_BE
	const ITEM_DC
	const ITEM_C3
	const ITEM_FA
DEF NUM_ITEM_POCKET EQU const_value - 1

	const_align 8
DEF FIRST_MEDICINE_ITEM EQU const_value
	const ANTIDOTE
	const BURN_HEAL
	const ICE_HEAL
	const AWAKENING
	const PARLYZ_HEAL
	const FULL_RESTORE
	const MAX_POTION
	const HYPER_POTION
	const SUPER_POTION
	const POTION
	const MAX_ELIXER
	const FULL_HEAL
	const REVIVE
	const MAX_REVIVE
	const FRESH_WATER
	const SODA_POP
	const LEMONADE
	const ETHER
	const MAX_ETHER
	const ELIXER
	const MOOMOO_MILK
	const RAGECANDYBAR
	const ENERGYPOWDER
	const ENERGY_ROOT
	const HEAL_POWDER
	const REVIVAL_HERB
	const BERRY_JUICE
	const SACRED_ASH
DEF NUM_MEDICINE_POCKET EQU const_value - FIRST_MEDICINE_ITEM
assert NUM_MEDICINE_POCKET <= $ff

	const_align 8
DEF FIRST_BERRY_ITEM EQU const_value
	const PECHA_BERRY
	const CHERI_BERRY
	const ASPEAR_BERRY
	const RAWST_BERRY
	const PERSIM_BERRY
	const CHESTO_BERRY
	const RED_APRICORN
	const BLU_APRICORN
	const YLW_APRICORN
	const GRN_APRICORN
	const WHT_APRICORN
	const BLK_APRICORN
	const PNK_APRICORN
	const LUM_BERRY
	const LEPPA_BERRY
	const LIECHI_BERRY
	const GANLON_BERRY
	const SALAC_BERRY
	const ORAN_BERRY
	const SITRUS_BERRY
	const PETAYA_BERRY
	const APICOT_BERRY
DEF NUM_BERRY_POCKET EQU const_value - FIRST_BERRY_ITEM
assert NUM_BERRY_POCKET <= $ff

	const_align 8
DEF FIRST_HELD_ITEM EQU const_value
	const BRIGHTPOWDER
	const MARVEL_SCALE
	const LUCKY_PUNCH
	const METAL_POWDER
	const QUICK_CLAW
	const SOFT_SAND
	const SHARP_BEAK
	const POISON_BARB
	const KINGS_ROCK
	const SILVERPOWDER
	const AMULET_COIN
	const CLEANSE_TAG
	const MYSTIC_WATER
	const TWISTEDSPOON
	const BLACKBELT_I
	const BLACKGLASSES
	const PINK_BOW
	const STICK
	const SMOKE_BALL
	const NEVERMELTICE
	const MAGNET
	const EVERSTONE
	const SPELL_TAG
	const MIRACLE_SEED
	const THICK_CLUB
	const FOCUS_BAND
	const HARD_STONE
	const LUCKY_EGG
	const CHARCOAL
	const SCOPE_LENS
	const METAL_COAT
	const DRAGON_FANG
	const LEFTOVERS
	const DRAGON_SCALE
	const BERSERK_GENE
	const LIGHT_BALL
	const POLKADOT_BOW
	const UP_GRADE
	const FLAME_ORB
	const TOXIC_ORB
	const EVIOLITE
	const WIDE_LENS
	const BLACK_SLUDGE
	const LIFE_ORB
	const FOCUS_SASH
	const ROCKY_HELMET
	const EXPERT_BELT
	const MUSCLE_BAND
	const WISE_GLASSES
	const SHELL_BELL
	const BIG_ROOT
	const BINDING_BAND
	const MACHO_BRACE
	const POWER_WEIGHT
	const POWER_BRACER
	const POWER_BELT
	const POWER_ANKLET
	const POWER_LENS
	const POWER_BAND
	const CHOICE_BAND
	const CHOICE_SPECS
	const CHOICE_SCARF
	const ASSAULT_VEST
	const WEAKNESS_POLICY
	const AIR_BALLOON
	const LIGHT_CLAY
	const WHITE_HERB
	const MENTAL_HERB
	const POWER_HERB
	const METRONOME_ITEM
	const LOADED_DICE
	const ABSORB_BULB
	const CELL_BATTERY
	const SNOWBALL
	const LUMINOUS_MOSS
	const SAFETY_GOGGLES
	const ZOOM_LENS
DEF NUM_HELD_POCKET EQU const_value - FIRST_HELD_ITEM
assert NUM_HELD_POCKET <= $ff

	const_align 8
DEF FIRST_TRAINING_ITEM EQU const_value
	const HP_UP
	const PROTEIN
	const IRON
	const CARBOS
	const CALCIUM
	const RARE_CANDY
	const PP_UP
	const ZINC
	const ABILITY_CAPSULE
	const ABILITY_PATCH
	const EXP_CANDY_S
	const EXP_CANDY_M
	const EXP_CANDY_L
	const EXP_CANDY_XL
DEF NUM_TRAINING_POCKET EQU const_value - FIRST_TRAINING_ITEM
assert NUM_TRAINING_POCKET <= $ff

	const_align 8
DEF FIRST_TREASURE_ITEM EQU const_value
	const NUGGET
	const HELIX_FOSSIL
	const DOME_FOSSIL
	const SILVER_LEAF
	const GOLD_LEAF
	const TINYMUSHROOM
	const BIG_MUSHROOM
	const OLD_AMBER
	const ROOT_FOSSIL
	const SLOWPOKETAIL
	const PEARL
	const BIG_PEARL
	const CLAW_FOSSIL
	const STARDUST
	const STAR_PIECE
	const URSA_FOSSIL
	const FIN_FOSSIL
	const FANG_FOSSIL
	const BRICK_PIECE
DEF NUM_TREASURE_POCKET EQU const_value - FIRST_TREASURE_ITEM
assert NUM_TREASURE_POCKET <= $ff

	const_align 8 ; Key items assume the value of HIGH(FIRST_KEY_ITEM) when storing in bag.
DEF FIRST_KEY_ITEM EQU const_value
	const BICYCLE      ; 0100
	const COIN_CASE    ; 0101
	const ITEMFINDER   ; 0102
	const OLD_ROD      ; 0103
	const GOOD_ROD     ; 0104
	const SUPER_ROD    ; 0105
	const RED_SCALE    ; 0106
	const SECRETPOTION ; 0107
	const S_S_TICKET   ; 0108
	const MYSTERY_EGG  ; 0109
	const CLEAR_BELL   ; 010A
	const SILVER_WING  ; 010B
	const GS_BALL      ; 010C
	const BLUE_CARD    ; 010D
	const CARD_KEY     ; 010E
	const MACHINE_PART ; 010F
	const EGG_TICKET   ; 0110
	const LOST_ITEM    ; 0111
	const BASEMENT_KEY ; 0112
	const PASS         ; 0113
	const SQUIRTBOTTLE ; 0114
	const RAINBOW_WING ; 0115
	const BIRD_WHISTLE
	const LANTERN
	const HATCHET
	const PICKAXE
	const FLIPPERS
	const SHINY_CHARM
	const ELM_PARCEL   ; first-time travel: a parcel for each other region's professor
	const OAK_PARCEL
	const BIRCH_PARCEL
	const VS_SEEKER
DEF NUM_KEY_ITEM_POCKET EQU const_value - FIRST_KEY_ITEM
assert NUM_KEY_ITEM_POCKET <= $ff

	const_align 8; Ball items assume the value of HIGH(FIRST_BALL_ITEM) when storing in bag.
DEF FIRST_BALL_ITEM EQU const_value
	const MASTER_BALL  ; 0200
	const ULTRA_BALL   ; 0201
	const GREAT_BALL   ; 0202
	const POKE_BALL    ; 0203
	const HEAVY_BALL   ; 0204
	const LEVEL_BALL   ; 0205
	const LURE_BALL    ; 0206
	const FAST_BALL    ; 0207
	const FRIEND_BALL  ; 0208
	const MOON_BALL    ; 0209
	const LOVE_BALL    ; 020A
	const PARK_BALL    ; 020B
DEF NUM_BALL_ITEM_POCKET EQU const_value - FIRST_BALL_ITEM
assert NUM_BALL_ITEM_POCKET <= $ff
DEF NUM_ITEMS EQU const_value - 1

DEF __tmhm_value__ = 1

MACRO add_tmnum
	DEF \1_TMNUM EQU __tmhm_value__
	DEF __tmhm_value__ += 1
ENDM

MACRO add_tm
; Defines three constants:
; - TM_\1: the item id, starting at $bf
; - \1_TMNUM: the learnable TM/HM flag, starting at 1
; - TM##_MOVE: alias for the move id, equal to the value of \1
	const TM_\1
	DEF TM{02d:__tmhm_value__}_MOVE = \1
	add_tmnum \1
ENDM

	const_align 8 ; TMHM items assume the value of HIGH(FIRST_TMHM_ITEM) when storing in bag.
DEF FIRST_TMHM_ITEM EQU const_value
; see data/moves/tmhm_moves.asm for moves
DEF TM01 EQU const_value
	add_tm DYNAMICPUNCH ; 0300
	add_tm HEADBUTT     ; 0301
	add_tm CURSE        ; 0302
	add_tm ROLLOUT      ; 0303
	add_tm ROAR         ; 0304
	add_tm TOXIC        ; 0305
	add_tm ZAP_CANNON   ; 0306
	add_tm ROCK_SMASH   ; 0307
	add_tm DARK_PULSE     ; 0308
	add_tm HIDDEN_POWER ; 0309
	add_tm SUNNY_DAY    ; 030A
	add_tm GRASS_KNOT  ; 030B
	add_tm BODY_SLAM        ; 030C
	add_tm BLIZZARD     ; 030D
	add_tm HYPER_BEAM   ; 030E
	add_tm ICY_WIND     ; 030F
	add_tm PROTECT      ; 0310
	add_tm RAIN_DANCE   ; 0311
	add_tm GIGA_DRAIN   ; 0312
	add_tm FLASHCANNON       ; 0313
	add_tm TAUNT  ; 0314
	add_tm SOLARBEAM    ; 0315
	add_tm IRON_TAIL    ; 0316
	add_tm DRAGONBREATH ; 0317
	add_tm THUNDER      ; 0318
	add_tm EARTHQUAKE   ; 0319
	add_tm RETURN       ; 031A
	add_tm DIG          ; 031B
	add_tm PSYCHIC_M    ; 031C
	add_tm SHADOW_BALL  ; 031D
	add_tm MUD_SLAP     ; 031E
	add_tm SUBSTITUTE  ; 031F
	add_tm ICE_PUNCH    ; 0320
	add_tm HYPER_VOICE      ; 0321
	add_tm SLEEP_TALK   ; 0322
	add_tm SLUDGE_BOMB  ; 0323
	add_tm SANDSTORM    ; 0324
	add_tm FIRE_BLAST   ; 0325
	add_tm SWIFT        ; 0326
	add_tm DRAIN_PUNCH ; 0327
	add_tm THUNDERPUNCH ; 0328
	add_tm DREAM_EATER  ; 0329
	add_tm ZEN_HEADBUTT       ; 032A
	add_tm REST         ; 032B
	add_tm ATTRACT      ; 032C
	add_tm THIEF        ; 032D
	add_tm STEEL_WING   ; 032E
	add_tm FIRE_PUNCH   ; 032F
	add_tm FURY_CUTTER  ; 0330
	add_tm FACADE    ; 0331
	;new tms
	add_tm HAIL
	add_tm FIRE_FANG
	add_tm ICE_FANG
	add_tm THUNDER_FANG
	add_tm POISON_FANG
	add_tm ROCK_TOMB
	add_tm BULK_UP
	add_tm SHOCK_WAVE
	add_tm WILLOWISP
	add_tm AERIAL_ACE	
	add_tm CALM_MIND
	add_tm SCALD
	add_tm BUBBLEBEAM
	add_tm MAGICAL_LEAF
	add_tm DRAGON_CLAW
	add_tm BRICK_BREAK
	add_tm ANCIENTPOWER
	add_tm LIGHT_SCREEN
	add_tm REFLECT		
	add_tm ROCK_SLIDE		
	add_tm PLAY_ROUGH
	add_tm POISON_JAB	
	add_tm SLUDGE_WAVE
	add_tm EARTHPOWER	
	add_tm SHADOW_CLAW
	
DEF NUM_TMS EQU __tmhm_value__ - 1

MACRO add_hm
; Defines three constants:
; - HM_\1: the item id, starting at $f3
; - \1_TMNUM: the learnable TM/HM flag, starting at 51
; - HM##_MOVE: alias for the move id, equal to the value of \1
	const HM_\1
	DEF HM_VALUE = __tmhm_value__ - NUM_TMS
	DEF HM{02d:HM_VALUE}_MOVE = \1
	add_tmnum \1
ENDM

DEF HM01 EQU const_value
	add_hm CUT       ; 0332
	add_hm FLY       ; 0333
	add_hm SURF      ; 0334
	add_hm STRENGTH  ; 0335
	add_hm FLASH     ; 0336
	add_hm WHIRLPOOL ; 0337
	add_hm WATERFALL ; 0338
DEF NUM_HMS EQU __tmhm_value__ - NUM_TMS - 1

assert (NUM_TMS + NUM_HMS) < $ff, "TMs/HMs can't exceed 255 due to GetTMHMNumber."

; wTMsHMs: one bit per TM and HM at fixed places (TMs from bit 0, HMs from bit
; MAX_TMS), so TMs and HMs added later keep the saved bits where they are
DEF MAX_TMS EQU 100
DEF MAX_HMS EQU 8
DEF NUM_TMHM_BITS EQU MAX_TMS + MAX_HMS
	assert NUM_TMS <= MAX_TMS, "more TMs than wTMsHMs has room for"
	assert NUM_HMS <= MAX_HMS, "more HMs than wTMsHMs has room for"

MACRO add_mt
; Defines two constants:
; - \1_TMNUM: the learnable TM/HM flag, starting at 58
; - MT##_MOVE: alias for the move id, equal to the value of \1
	DEF MT_VALUE = __tmhm_value__ - NUM_TMS - NUM_HMS
	DEF MT{02d:MT_VALUE}_MOVE = \1
	add_tmnum \1
ENDM

DEF MT01 EQU const_value
	add_mt FLAMETHROWER
	add_mt THUNDERBOLT
	add_mt ICE_BEAM
	add_mt KNOCK_OFF
	add_mt U_TURN
	add_mt VOLT_SWITCH
	add_mt AQUA_TAIL
	add_mt AQUA_RING
	add_mt HEAL_BELL
	add_mt SAFEGUARD
	add_mt ELECTRO_WEB
	add_mt SNARL
	add_mt THUNDER_WAVE
	add_mt ENCORE
DEF NUM_TUTORS = __tmhm_value__ - NUM_TMS - NUM_HMS - 1

DEF NUM_TM_HM_TUTOR EQU NUM_TMS + NUM_HMS + NUM_TUTORS

DEF USE_SCRIPT_VAR EQU $00
DEF ITEM_FROM_MEM  EQU $ffff

; leftovers from red
DEF SAFARI_BALL    EQU $08 ; MOON_STONE
DEF MOON_STONE_RED EQU $0a ; BURN_HEAL
DEF FULL_HEAL_RED  EQU $34 ; X_SPEED
