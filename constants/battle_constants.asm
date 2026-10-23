; significant level values
DEF MAX_LEVEL EQU 100
DEF MIN_LEVEL EQU 2
DEF EGG_LEVEL EQU 5

; maximum moves known per mon
DEF NUM_MOVES EQU 4

; significant stat values
DEF BASE_STAT_LEVEL EQU 7
DEF MAX_STAT_LEVEL EQU 13

; turns that sleep lasts
DEF REST_SLEEP_TURNS EQU 2
DEF TREEMON_SLEEP_TURNS EQU 7

; default move priority
DEF BASE_PRIORITY EQU 1

; type effectiveness factors, scaled by 10
DEF SUPER_EFFECTIVE    EQU 20
DEF MORE_EFFECTIVE     EQU 15
DEF EFFECTIVE          EQU 10
DEF NOT_VERY_EFFECTIVE EQU 05
DEF NO_EFFECT          EQU 00

; wTypeModifier
DEF EFFECTIVENESS_MASK EQU %01111111
	const_def 7
	shift_const STAB_DAMAGE

; enemy AI behavior
DEF BASE_AI_SWITCH_SCORE EQU 10

; wPlayerStatLevels and wEnemyStatLevels indexes (see wram.asm)
; GetStatName arguments (see data/battle/stat_names.asm)
	const_def
	const ATTACK
	const DEFENSE
	const SPEED
	const SP_ATTACK
	const SP_DEFENSE
	const ACCURACY
	const EVASION
	const ABILITY ; used for BattleCommand_Curse
DEF NUM_LEVEL_STATS EQU const_value

; move struct members (see data/moves/moves.asm)
rsreset
DEF MOVE_ANIM   rb ; 0
DEF MOVE_EFFECT rb ; 1
DEF MOVE_POWER  rb ; 2
DEF MOVE_TYPE   rb ; 3
DEF MOVE_ACC    rb ; 4
DEF MOVE_PP     rb ; 5
DEF MOVE_CHANCE rb ; 6
DEF MOVE_LENGTH EQU _RS

; stat constants
; indexes for:
; - wPlayerStats and wEnemyStats (see wram.asm)
; - party_struct and battle_struct members (see macros/ram.asm)
	const_def 1
	const STAT_HP
	const STAT_ATK
	const STAT_DEF
	const STAT_SPD
	const STAT_SATK
DEF NUM_EXP_STATS EQU const_value - 1
	const STAT_SDEF
DEF NUM_STATS EQU const_value - 1
DEF NUM_BATTLE_STATS EQU NUM_STATS - 1 ; don't count HP

; stat formula constants
DEF STAT_MIN_NORMAL EQU 5
DEF STAT_MIN_HP EQU 10

DEF MAX_STAT_VALUE EQU 999

; shiny dvs
DEF ATKDEFDV_SHINY EQU $ff
DEF SPDSPCDV_SHINY EQU $ff

; battle classes (wBattleMode values)
	const_def 1
	const WILD_BATTLE
	const TRAINER_BATTLE

; battle types (wBattleType values)
	const_def
	const BATTLETYPE_NORMAL
	const BATTLETYPE_CANLOSE
	const BATTLETYPE_DEBUG
	const BATTLETYPE_TUTORIAL
	const BATTLETYPE_FISH
	const BATTLETYPE_ROAMING
	const BATTLETYPE_CONTEST
	const BATTLETYPE_FORCESHINY
	const BATTLETYPE_TREE
	const BATTLETYPE_TRAP
	const BATTLETYPE_FORCEITEM
	const BATTLETYPE_CELEBI
	const BATTLETYPE_SUICUNE
	const BATTLETYPE_CUP

; BattleVarPairs indexes (see home/battle_vars.asm)
	const_def
	const BATTLE_VARS_SUBSTATUS1
	const BATTLE_VARS_SUBSTATUS2
	const BATTLE_VARS_SUBSTATUS3
	const BATTLE_VARS_SUBSTATUS4
	const BATTLE_VARS_SUBSTATUS5
	const BATTLE_VARS_SUBSTATUS1_OPP
	const BATTLE_VARS_SUBSTATUS2_OPP
	const BATTLE_VARS_SUBSTATUS3_OPP
	const BATTLE_VARS_SUBSTATUS4_OPP
	const BATTLE_VARS_SUBSTATUS5_OPP
	const BATTLE_VARS_STATUS
	const BATTLE_VARS_STATUS_OPP
	const BATTLE_VARS_MOVE_ANIM
	const BATTLE_VARS_MOVE_EFFECT
	const BATTLE_VARS_MOVE_POWER
	const BATTLE_VARS_MOVE_TYPE
	const BATTLE_VARS_MOVE
	const BATTLE_VARS_LAST_COUNTER_MOVE
	const BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	const BATTLE_VARS_LAST_MOVE
	const BATTLE_VARS_LAST_MOVE_OPP
	const BATTLE_VARS_ABILITY
	const BATTLE_VARS_ABILITY_OPP
DEF NUM_BATTLE_VARS EQU const_value

; BattleVarLocations indexes (see home/battle_vars.asm)
	const_def
	const PLAYER_SUBSTATUS_1
	const ENEMY_SUBSTATUS_1
	const PLAYER_SUBSTATUS_2
	const ENEMY_SUBSTATUS_2
	const PLAYER_SUBSTATUS_3
	const ENEMY_SUBSTATUS_3
	const PLAYER_SUBSTATUS_4
	const ENEMY_SUBSTATUS_4
	const PLAYER_SUBSTATUS_5
	const ENEMY_SUBSTATUS_5
	const PLAYER_STATUS
	const ENEMY_STATUS
	const PLAYER_MOVE_ANIMATION
	const ENEMY_MOVE_ANIMATION
	const PLAYER_MOVE_EFFECT
	const ENEMY_MOVE_EFFECT
	const PLAYER_MOVE_POWER
	const ENEMY_MOVE_POWER
	const PLAYER_MOVE_TYPE
	const ENEMY_MOVE_TYPE
	const PLAYER_CUR_MOVE
	const ENEMY_CUR_MOVE
	const PLAYER_COUNTER_MOVE
	const ENEMY_COUNTER_MOVE
	const PLAYER_LAST_MOVE
	const ENEMY_LAST_MOVE
	const PLAYER_ABILITY
	const ENEMY_ABILITY
assert const_value % 2 == 0
DEF NUM_BATTLE_VAR_LOCATION_PAIRS EQU const_value / 2

; status condition bit flags
DEF SLP_MASK EQU %111 ; 0-7 turns
	const_def 3
	const PSN
	const BRN
	const FRZ
	const PAR

DEF ALL_STATUS EQU (1 << PSN) | (1 << BRN) | (1 << FRZ) | (1 << PAR) | SLP_MASK

; wPlayerSubStatus1 or wEnemySubStatus1 bit flags
	const_def
	const SUBSTATUS_NIGHTMARE
	const SUBSTATUS_CURSE
	const SUBSTATUS_PROTECT
	const SUBSTATUS_IDENTIFIED
	const SUBSTATUS_PERISH
	const SUBSTATUS_ENDURE
	const SUBSTATUS_ROLLOUT
	const SUBSTATUS_IN_LOVE

; wPlayerSubStatus2 or wEnemySubStatus2 bit flags
	const_def
	const SUBSTATUS_CURLED

; wPlayerSubStatus3 or wEnemySubStatus3 bit flags
	const_def
	const SUBSTATUS_BIDE
	const SUBSTATUS_RAMPAGE
	const SUBSTATUS_IN_LOOP
	const SUBSTATUS_FLINCHED
	const SUBSTATUS_CHARGED
	const SUBSTATUS_UNDERGROUND
	const SUBSTATUS_FLYING
	const SUBSTATUS_CONFUSED

; wPlayerSubStatus4 or wEnemySubStatus4 bit flags
	const_def
	const SUBSTATUS_X_ACCURACY
	const SUBSTATUS_MIST
	const SUBSTATUS_FOCUS_ENERGY
	const_skip
	const SUBSTATUS_SUBSTITUTE
	const SUBSTATUS_RECHARGE
	const SUBSTATUS_RAGE
	const SUBSTATUS_LEECH_SEED

; wPlayerSubStatus5 or wEnemySubStatus5 bit flags
	const_def
	const SUBSTATUS_TOXIC
	const_skip
	const_skip
	const SUBSTATUS_TRANSFORMED
	const SUBSTATUS_ENCORED
	const SUBSTATUS_LOCK_ON
	const SUBSTATUS_DESTINY_BOND
	const SUBSTATUS_CANT_RUN

; wPlayerScreens or wEnemyScreens bit flags
	const_def
	const SCREENS_SPIKES
	const_skip
	const SCREENS_SAFEGUARD
	const SCREENS_LIGHT_SCREEN
	const SCREENS_REFLECT
	const SCREENS_UNUSED

; values in wBattleWeather
	const_def
	const WEATHER_NONE
	const WEATHER_RAIN
	const WEATHER_SUN
	const WEATHER_SANDSTORM
	const WEATHER_HAIL
	const WEATHER_RAIN_END
	const WEATHER_SUN_END
	const WEATHER_SANDSTORM_END
	const WEATHER_HAIL_END

; wBattleAction
	const_def
	const BATTLEACTION_MOVE1
	const BATTLEACTION_MOVE2
	const BATTLEACTION_MOVE3
	const BATTLEACTION_MOVE4
	const BATTLEACTION_SWITCH1
	const BATTLEACTION_SWITCH2
	const BATTLEACTION_SWITCH3
	const BATTLEACTION_SWITCH4
	const BATTLEACTION_SWITCH5
	const BATTLEACTION_SWITCH6
	const_skip
	const_skip
	const_skip
	const BATTLEACTION_SKIPTURN
	const BATTLEACTION_STRUGGLE
	const BATTLEACTION_FORFEIT

; wBattlePlayerAction
	const_def
	const BATTLEPLAYERACTION_USEMOVE
	const BATTLEPLAYERACTION_USEITEM
	const BATTLEPLAYERACTION_SWITCH

; wBattleResult
	const_def
	const WIN
	const LOSE
	const DRAW

DEF BATTLERESULT_CAUGHT_CELEBI EQU 6
DEF BATTLERESULT_BOX_FULL EQU 7
DEF BATTLERESULT_BITMASK EQU (1 << BATTLERESULT_CAUGHT_CELEBI) | (1 << BATTLERESULT_BOX_FULL)

; link_battle_record struct
DEF LINK_BATTLE_RECORD_LENGTH EQU 2 + (NAME_LENGTH - 1) + 2 * 3
DEF NUM_LINK_BATTLE_RECORDS EQU 5

; battle_struct members (see macros/ram.asm; asserted in engine/battle/battler_swap.asm)
rsreset
DEF BATTLEMON_SPECIES    rb
DEF BATTLEMON_ITEM       rb
DEF BATTLEMON_MOVES      rb NUM_MOVES
DEF BATTLEMON_DVS        rw
DEF BATTLEMON_PP         rb NUM_MOVES
DEF BATTLEMON_HAPPINESS  rb
DEF BATTLEMON_LEVEL      rb
DEF BATTLEMON_STATUS     rb 2
DEF BATTLEMON_HP         rw
DEF BATTLEMON_MAX_HP     rw
DEF BATTLEMON_STATS      rw NUM_BATTLE_STATS ; big endian: attack, defense, speed, sp.atk, sp.def
DEF BATTLEMON_TYPE1      rb
DEF BATTLEMON_TYPE2      rb
DEF BATTLE_STRUCT_LENGTH EQU _RS

; battler slots for double battles (see engine/battle/battler_swap.asm)
	const_def
	const BATTLER_SLOT_P1 ; 0
	const BATTLER_SLOT_P2 ; 1
	const BATTLER_SLOT_E1 ; 2
	const BATTLER_SLOT_E2 ; 3
DEF NUM_BATTLER_SLOTS EQU const_value
DEF BATTLER_SLOT_ENEMY_F EQU 1 ; set for the enemy's slots

; Per-battler links to other battlers (double battles; wPlayerBattlerLinks/wEnemyBattlerLinks).
; Each is a mask of battler slots (1 << BATTLER_SLOT_*); 0 means none.
rsreset
DEF BATTLER_LINK_TARGET        rb ; the chosen target(s) of this battler's move
DEF BATTLER_LINK_SEEDED_BY     rb ; Leech Seed: the seeder's slot gets the HP
DEF BATTLER_LINK_TRAPPED_BY    rb ; Wrap, Bind...: ends when the trapper leaves
DEF BATTLER_LINK_MEAN_LOOK_BY  rb ; Mean Look, Spider Web: ends when the user leaves
DEF BATTLER_LINK_ATTRACTED_TO  rb ; ends when either leaves
DEF BATTLER_LINK_LOCKED_ON_TO  rb ; Lock-On, Mind Reader: ends when either leaves
DEF BATTLER_LINK_LAST_ATTACKER rb ; who last damaged this battler (Counter, Mirror Coat, Bide, Destiny Bond)
DEF NUM_BATTLER_LINKS EQU _RS

; Battler slot layout (wBattlerSlots): one field per BattlerSwapList entry, in the same order
; (engine/battle/battler_swap.asm asserts it). Read a stored battler's field at
; wBattlerSlots + slot * BATTLER_SLOT_SIZE + BSLOT_*, in WRAMX bank BANK(wBattlerSlots).
rsreset
DEF BSLOT_MOVE_STRUCT        rb MOVE_LENGTH
DEF BSLOT_NICKNAME           rb MON_NAME_LENGTH
DEF BSLOT_MON                rb BATTLE_STRUCT_LENGTH ; + BATTLEMON_*
DEF BSLOT_ABILITY            rb
DEF BSLOT_PARTY_INDEX        rb ; wCurBattleMon / wCurOTMon
DEF BSLOT_TEMP_SPECIES       rb
DEF BSLOT_SUBSTATUS          rb 5
DEF BSLOT_COUNTS             rb 8 ; rollout through protect
DEF BSLOT_DAMAGE_TAKEN       rw
DEF BSLOT_STATS              rb NUM_BATTLE_STATS * 2 + 1 ; + padding
DEF BSLOT_STAT_LEVELS        rb NUM_LEVEL_STATS
DEF BSLOT_TURNS_TAKEN        rb
DEF BSLOT_SUBSTITUTE_HP      rb
DEF BSLOT_CUR_MOVE           rb
DEF BSLOT_CUR_MOVE_NUM       rb
DEF BSLOT_DISABLED_MOVE      rb
DEF BSLOT_LAST_COUNTER_MOVE  rb
DEF BSLOT_MINIMIZED          rb
DEF BSLOT_IS_SWITCHING       rb
DEF BSLOT_LAST_MOVE          rb
DEF BSLOT_FUTURE_SIGHT_COUNT rb
DEF BSLOT_FUTURE_SIGHT_DAMAGE rw
DEF BSLOT_RAGE_COUNTER       rb
DEF BSLOT_TRAPPING_MOVE      rb
DEF BSLOT_WRAP_COUNT         rb
DEF BSLOT_CHARGING           rb
DEF BSLOT_JUST_GOT_FROZEN    rb
DEF BSLOT_LINKS              rb NUM_BATTLER_LINKS ; + BATTLER_LINK_*
; player slots only
DEF BSLOT_USED_MOVES         rb NUM_MOVES
DEF BSLOT_LAST_PLAYER_MON    rb
; enemy slots only (one-sided fields don't overlap; each slot has the same layout)
DEF BSLOT_BASE_STATS         rb NUM_EXP_STATS + 2 ; base stats, catch rate, base EXP
DEF BSLOT_ABILITY_SLOT       rb
DEF BSLOT_BACKUP_DVS         rw
DEF BSLOT_AI_SWITCH          rb 3 ; switch score, param, index
DEF BSLOT_BACKUP_BASE_STATS  rb NUM_EXP_STATS + 2
DEF BSLOT_PARTICIPANTS       rb ; wBattleParticipantsNotFainted
DEF BSLOT_PARTICIPANTS_ALL   rb ; wBattleParticipantsIncludingFainted
DEF BSLOT_HP_AT_PLAYER_SWITCH rw
DEF BSLOT_AI_ITEM_STATE      rb
DEF BATTLER_SLOT_SIZE EQU _RS

; entrance ability target kinds (engine/battle/entrance_abilities.asm; double battles)
	const_def
	const ENTRANCE_FIELD        ; weather
	const ENTRANCE_SELF         ; the mon itself (stat boosts, status cures)
	const ENTRANCE_OWN_SIDE     ; its side (Safeguard, Reflect)
	const ENTRANCE_FOE_SIDE     ; the foes' side (Spikes)
	const ENTRANCE_EACH_FOE     ; each foe on the field, in turn (Intimidate, Leech...)
	const ENTRANCE_OPPOSITE_FOE ; the foe in the opposite slot, else the other foe (Impostor)
DEF NUM_ENTRANCE_KINDS EQU const_value

; MoveAttributes target types (data/moves/move_attributes.asm; double battles)
	const_def
	const MOVE_TARGET_SELECTED   ; 0
	const MOVE_TARGET_BOTH_FOES  ; 1
	const MOVE_TARGET_ALL_OTHERS ; 2
	const MOVE_TARGET_USER       ; 3
	const MOVE_TARGET_USER_SIDE  ; 4
	const MOVE_TARGET_FOE_SIDE   ; 5
	const MOVE_TARGET_RANDOM_FOE ; 6
	const MOVE_TARGET_ALL        ; 7
	const MOVE_TARGET_FIELD      ; 8
	const MOVE_TARGET_COUNTER    ; 9
DEF NUM_MOVE_TARGETS EQU const_value

; MoveAttributes flags
	const_def
	shift_const MOVEFLAG_CONTACT ; 0
	shift_const MOVEFLAG_PUNCH   ; 1
	shift_const MOVEFLAG_BITE    ; 2
	shift_const MOVEFLAG_SLICING ; 3
	shift_const MOVEFLAG_SOUND   ; 4
