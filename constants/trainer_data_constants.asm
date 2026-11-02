; TrainerClassAttributes struct members (see data/trainers/attributes.asm)
rsreset
DEF TRNATTR_ITEM1           rw ; 0
DEF TRNATTR_ITEM2           rw ; 1
DEF TRNATTR_BASEMONEY       rb ; 2
DEF TRNATTR_AI_MOVE_WEIGHTS rw ; 3
DEF TRNATTR_AI_ITEM_SWITCH  rw ; 5
DEF NUM_TRAINER_ATTRIBUTES EQU _RS

; TRNATTR_AI_MOVE_WEIGHTS bit flags (wEnemyTrainerAIFlags)
; AIScoringPointers indexes (see engine/battle/ai/move.asm)
	const_def
	shift_const AI_BASIC
	shift_const AI_SETUP
	shift_const AI_TYPES
	shift_const AI_OFFENSIVE
	shift_const AI_SMART
	shift_const AI_OPPORTUNIST
	shift_const AI_AGGRESSIVE
	shift_const AI_CAUTIOUS
	shift_const AI_STATUS
	shift_const AI_RISKY
	shift_const AI_ABILITY
DEF NO_AI EQU 0

; TRNATTR_AI_ITEM_SWITCH bit flags
	const_def
	shift_const SWITCH_OFTEN     ; 0
	shift_const SWITCH_RARELY    ; 1
	shift_const SWITCH_SOMETIMES ; 2
	const_skip
	shift_const ALWAYS_USE       ; 4
	shift_const UNKNOWN_USE      ; 5
	shift_const CONTEXT_USE      ; 6

; Party flags byte, after a trainer party's name (see data/trainers/parties.asm)
	const_def 4
	const TRAINERTYPE_DOUBLE_F ; 4: a double battle (claude/double-battles-plan.md)
	const TRAINERTYPE_HARD_F   ; 5: a Hard mode team follows the Normal one

; Per-Pokemon flags byte in trainer parties and random lists: which optional
; fields follow the level and species, in this order (macros/data.asm)
	const_def
	const MONFLAG_ITEM_F     ; 0: dw item
	const MONFLAG_ABILITY_F  ; 1: db ability (resolved to the species' slot)
	const MONFLAG_MOVES_F    ; 2: db count (1-4), then that many dw moves
	const MONFLAG_DVS_F      ; 3: db atk/def, spd/spc
	const MONFLAG_EVS_F      ; 4: db EV spread (EVS_* preset)
	const MONFLAG_NICKNAME_F ; 5: "NAME@"
	const MONFLAG_SHINY_F    ; 6: no data; sets the spd/spc DVs to SHINY_SPDSPC_DV
DEF END_PARTY_MONS EQU $ff ; in place of a flags byte: no more Pokemon (bit 7 is never a flag)
DEF RANDOM_TEAM EQU $fe    ; in place of the first flags byte: count, random list follow

; dvs presets (dvs PRESET): atk/def byte << 8 | spd/spc byte
; A spd/spc byte of SHINY_SPDSPC_DV ($ff) makes a Pokemon shiny, HP_SPDSPC_DV ($fe)
; gives it its Hidden Power type's colors, so plain presets avoid both.
; PERFECT: 15 everywhere but Special 13 (keeps the HP DV at 15).
DEF DVS_PERFECT EQU $fffd
; HP_<TYPE>: Hidden Power of that type at 70 power (Speed 14, Special 15);
; HP_<TYPE>_COLOR: the same type, 69 power, in its Hidden Power colors
for _t, 16
	REDEF _hp_type EQUS STRSUB("FIGHTINGFLYING  POISON  GROUND  ROCK    BUG     GHOST   STEEL   FIRE    WATER   GRASS   ELECTRICPSYCHIC ICE     DRAGON  DARK    ", _t * 8 + 1, 8)
	REDEF _hp_type EQUS STRRPL("{_hp_type}", " ", "")
	DEF DVS_HP_{_hp_type} EQU (($c | (_t >> 2)) << 12 | ($c | (_t & 3)) << 8) | $ef
	DEF DVS_HP_{_hp_type}_COLOR EQU (DVS_HP_{_hp_type} & $ff00) | HP_SPDSPC_DV
endr

; ev_spread presets (rows of TrainerEVSpreads, data/trainers/ev_spreads.asm)
	const_def 1
	const EVS_ATK_SPE ; 1
	const EVS_SAT_SPE ; 2
	const EVS_HP_ATK  ; 3
	const EVS_HP_SAT  ; 4
	const EVS_HP_DEF  ; 5
	const EVS_HP_SDF  ; 6
	const EVS_ALL     ; 7
DEF NUM_EV_SPREADS EQU const_value - 1
