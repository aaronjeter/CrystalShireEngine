; Value macros

; Many arbitrary percentages are simple base-10 or base-16 values:
; -  10 = 4 percent
; -  15 = 6 percent
; - $10 = 6 percent + 1 = 7 percent - 1
; -  20 = 8 percent
; -  25 = 10 percent
; -  30 = 12 percent
; -  40 = 16 percent
; -  50 = 20 percent - 1
; -  60 = 24 percent - 1
; -  70 = 28 percent - 1
; -  80 = 31 percent + 1 = 32 percent - 1
; -  85 = 33 percent + 1 = 34 percent - 1
; - 100 = 39 percent + 1 = 40 percent - 2
; - 120 = 47 percent + 1
; - 123 = 49 percent - 1
; - 160 = 63 percent
; - 180 = 71 percent - 1 = 70 percent + 2
; - 200 = 79 percent - 1
; - 230 = 90 percent + 1
DEF percent EQUS "* $ff / 100"

; e.g. 1 out_of 2 == 50 percent + 1 == $80
DEF out_of EQUS "* $100 /"

MACRO assert_power_of_2
	assert (\1) & ((\1) - 1) == 0, "\1 must be a power of 2"
ENDM

; Constant data (db, dw, dl) macros

MACRO dwb
	dw \1
	db \2
ENDM

MACRO dbw
	db \1
	dw \2
ENDM

MACRO dbbbw
	db \1, \2, \3
	dw \4
ENDM

MACRO dwbb
	dw \1
	db \2, \3
ENDM

MACRO dbwbb
	db \1
	dw \2
	db \3, \4
ENDM

MACRO dbwbw
	db \1
	dw \2
	db \3
	dw \4
ENDM

MACRO dbwb
	db \1
	dw \2
	db \3
ENDM

MACRO dbwbbbw
	db \1
	dw \2
	db \3
	db \4
	db \5
	dw \6
ENDM



MACRO dn ; nybbles
	rept _NARG / 2
		db ((\1) << 4) | (\2)
		shift 2
	endr
ENDM

MACRO dc ; "crumbs"
	rept _NARG / 4
		db ((\1) << 6) | ((\2) << 4) | ((\3) << 2) | (\4)
		shift 4
	endr
ENDM

MACRO bigdw ; big-endian word
	rept _NARG
		db HIGH(\1), LOW(\1)
		shift
	endr
ENDM

MACRO bigdt ; big-endian "tribyte"
	rept _NARG
		db LOW((\1) >> 16), HIGH(\1), LOW(\1)
		shift
	endr
ENDM

MACRO bigdd ; big-endian "double word"
	rept _NARG
		db HIGH((\1) >> 16), LOW((\1) >> 16), HIGH(\1), LOW(\1)
		shift
	endr
ENDM

MACRO dba ; dbw bank, address
	rept _NARG
		dbw BANK(\1), \1
		shift
	endr
ENDM

MACRO dba_lz ; dbw bank, address | $8000 (bit 15 marks LZ-compressed data)
	rept _NARG
		dbw BANK(\1), \1 | $8000
		assert !(\1 & $8000), "dba_lz cannot point above ROMX"
		shift
	endr
ENDM

MACRO dab ; dwb address, bank
	rept _NARG
		dwb \1, BANK(\1)
		shift
	endr
ENDM

MACRO bcd
	rept _NARG
		dn ((\1) % 100) / 10, (\1) % 10
		shift
	endr
ENDM

MACRO sine_table
; \1 samples of sin(x) from x=0 to x<0.5 turns (pi radians)
	for x, \1
		dw sin(x * 0.5 / (\1))
	endr
ENDM

; Trainer parties (data/trainers/parties.asm, random_parties.asm)
;	party FALKNER3, "Falkner"      ; ID checked against the party's place in its group;
;	                               ; optional third argument DOUBLES
;	mon 8, SKARMORY                ; level offset (added to wBaseLevel), species
;		item LEFTOVERS             ; the lines below are optional, in any order
;		ability STURDY             ; must be one of the species' three abilities
;		moves DRILL_PECK, TOXIC    ; 1-4 moves, the rest stay empty (none: level-up moves)
;		dvs PERFECT                ; a DVS_* preset, or dvs ATK, DEF, SPD, SPC (0-15 each)
;		ev_spread HP_ATK           ; an EVS_* preset (none: no EVs)
;		nickname "SKARM"
;		shiny
;	hard                           ; optional: the Hard mode team follows (same lines);
;	mon 10, SKARMORY               ; without it, Hard uses the team above
;	end_party
; A random team: random_mons COUNT, LIST instead of mon lines (either team).
; Lists: random_list LIST, then mon lines (with optional lines), then end_random_list.

DEF _pm_open = 0
DEF _party_open = 0
DEF _rl_open = 0
DEF _rl_next = 0
DEF _party_n = 0

MACRO _pm_flush
; writes the open Pokemon: [size if in a random list], flags, level, species, fields
	if _pm_open
		if _pm_flags & (1 << MONFLAG_SHINY_F) && _pm_flags & (1 << MONFLAG_DVS_F)
			assert LOW(_pm_dvs) != HP_SPDSPC_DV, "{_pm_where}: shiny can't use a _COLOR dvs preset"
		endc
		if _rl_open
			db .__rl_mon_end{d:_rl_mons} - .__rl_mon{d:_rl_mons}
.__rl_mon{d:_rl_mons}
		endc
		db _pm_flags, _pm_level
		dw _pm_species
		if _pm_flags & (1 << MONFLAG_ITEM_F)
			dw _pm_item
		endc
		if _pm_flags & (1 << MONFLAG_ABILITY_F)
			assert DEF(___species_has_ability_{d:_pm_species}_{d:_pm_ability}), "{_pm_where}: the species doesn't have that ability"
			db _pm_ability
		endc
		if _pm_flags & (1 << MONFLAG_MOVES_F)
			db _pm_nmoves
			for _i, 1, _pm_nmoves + 1
				dw _pm_move{d:_i}
			endr
		endc
		if _pm_flags & (1 << MONFLAG_DVS_F)
			db HIGH(_pm_dvs), LOW(_pm_dvs)
		endc
		if _pm_flags & (1 << MONFLAG_EVS_F)
			db _pm_evs
		endc
		if _pm_flags & (1 << MONFLAG_NICKNAME_F)
			db "{_pm_nick}@"
		endc
		if _rl_open
.__rl_mon_end{d:_rl_mons}
		endc
		DEF _pm_open = 0
	endc
ENDM

MACRO party
; party ID, "NAME"[, DOUBLES]
; Data: dw size (after this word), "NAME@", flags (TRAINERTYPE_*_F), the team,
; then the Hard team if the HARD flag is set. A team is Pokemon ending in
; END_PARTY_MONS, or RANDOM_TEAM, count, list.
	assert !_party_open, "party \1: the previous party has no end_party"
	assert !_rl_open, "party \1: the previous random list has no end_random_list"
	DEF _party_expected = current_list_item + 1
	assert (\1) == _party_expected, "party \1 is party {d:_party_expected} of its group"
	DEF current_list_item = _party_expected
	DEF _party_n += 1
	dw .__party_end{d:_party_n} - .__party_start{d:_party_n}
.__party_start{d:_party_n}
	assert CHARLEN(\2) <= NAME_LENGTH - 1, "party \1: the name is longer than NAME_LENGTH - 1 characters"
	db \2, "@"
	db _party_flags{d:_party_n}
	REDEF _party_name EQUS "\1"
	DEF _party_flags = 0
	if _NARG == 3
		assert !STRCMP("\3", "DOUBLES"), "party \1: unknown option \3"
		DEF _party_flags |= 1 << TRAINERTYPE_DOUBLE_F
	else
		assert _NARG == 2, "party \1: expected an ID, a name and optionally DOUBLES"
	endc
	DEF _party_open = 1
	DEF _party_hard = 0
	REDEF _party_team EQUS ""
	_team_start
ENDM

MACRO _team_start
	DEF _party_mons = 0
	DEF _party_random = 0
ENDM

MACRO _team_end
; closes the current team and checks its size
	_pm_flush
	assert _party_mons, "{_party_name}{_party_team} has no Pokemon"
	if !_party_random
		db END_PARTY_MONS
	endc
	assert _party_mons <= PARTY_LENGTH, "{_party_name}{_party_team} has {d:_party_mons} Pokemon (1-6)"
	if _party_flags & (1 << TRAINERTYPE_DOUBLE_F)
		assert _party_mons >= 2, "doubles party {_party_name}{_party_team} has fewer than 2 Pokemon"
	endc
ENDM

MACRO hard
; the Hard mode team follows
	assert _party_open && !_party_hard, "hard: once per party, after its Normal team"
	_team_end
	DEF _party_hard = 1
	DEF _party_flags |= 1 << TRAINERTYPE_HARD_F
	REDEF _party_team EQUS " (hard)"
	_team_start
ENDM

MACRO random_mons
; random_mons COUNT, LIST: COUNT different Pokemon from random_list LIST
	assert _party_open && !_party_mons, "random_mons must start a team"
	db RANDOM_TEAM, \1, \2
	assert (\1) >= 1 && (\1) <= _rl_count_\2, "{_party_name}: random_mons \1 from \2"
	DEF _party_mons = \1
	DEF _party_random = 1
ENDM

MACRO mon
; mon LEVEL, SPECIES (LEVEL is added to wBaseLevel)
	_pm_flush
	if _rl_open
		DEF _rl_mons += 1
		REDEF _pm_where EQUS "random list {_rl_name} entry {d:_rl_mons}"
	else
		assert _party_open, "mon \2 outside a party or random list"
		assert !_party_random, "{_party_name}: a random team can't list Pokemon"
		DEF _party_mons += 1
		REDEF _pm_where EQUS "{_party_name}{_party_team} Pokemon {d:_party_mons} (\2)"
	endc
	DEF _pm_open = 1
	DEF _pm_flags = 0
	DEF _pm_level = \1
	DEF _pm_species = \2
ENDM

MACRO _pm_field
; marks optional field \1 (MONFLAG_\1_F) as set; it may appear once per Pokemon
	assert _pm_open, "\2: not after a mon line"
	assert !(_pm_flags & (1 << MONFLAG_\1_F)), "{_pm_where}: \2 given twice"
	DEF _pm_flags |= 1 << MONFLAG_\1_F
ENDM

MACRO item
	_pm_field ITEM, item
	DEF _pm_item = \1
ENDM

MACRO ability
; ability NAME (without ABILITY_): one of the species' three abilities (checked
; against data/abilities/species_abilities.asm); ReadTrainerParty picks its slot
	_pm_field ABILITY, ability
	DEF _pm_ability = ABILITY_\1
ENDM

MACRO moves
; 1-4 moves; the remaining slots stay empty
	_pm_field MOVES, moves
	assert _NARG >= 1 && _NARG <= NUM_MOVES, "{_pm_where}: moves takes 1-4 moves"
	DEF _pm_nmoves = _NARG
	for _i, 1, _NARG + 1
		assert (\1) != NO_MOVE, "{_pm_where}: list only real moves"
		DEF _pm_move{d:_i} = \1
		shift
	endr
ENDM

MACRO dvs
; dvs PRESET (DVS_PRESET in constants/trainer_data_constants.asm) or dvs ATK, DEF, SPD, SPC
	_pm_field DVS, dvs
	if _NARG == 1
		DEF _pm_dvs = DVS_\1
	else
		assert _NARG == 4, "{_pm_where}: dvs takes a preset or 4 values"
		assert (\1) < 16 && (\2) < 16 && (\3) < 16 && (\4) < 16, "{_pm_where}: DVs are 0-15"
		DEF _pm_dvs = (\1) << 12 | (\2) << 8 | (\3) << 4 | (\4)
	endc
ENDM

MACRO ev_spread
; ev_spread PRESET (EVS_PRESET)
	_pm_field EVS, ev_spread
	DEF _pm_evs = EVS_\1
ENDM

MACRO nickname
	_pm_field NICKNAME, nickname
	DEF _max_nick = MON_NAME_LENGTH - 1
	assert CHARLEN(\1) >= 1 && CHARLEN(\1) <= _max_nick, "{_pm_where}: nickname is 1-{d:_max_nick} characters"
	REDEF _pm_nick EQUS \1
ENDM

MACRO shiny
	_pm_field SHINY, shiny
ENDM

MACRO end_party
	assert _party_open, "end_party without a party"
	_team_end
	DEF _party_flags{d:_party_n} EQU _party_flags
.__party_end{d:_party_n}
	DEF _party_open = 0
ENDM

MACRO random_list
; random_list LIST: the lists must come in the order of their constants
	assert !_rl_open && !_party_open, "random_list \1: close the previous list or party first"
	assert (\1) == _rl_next, "random_list \1 is out of order"
	DEF _rl_next += 1
	REDEF _rl_name EQUS "\1"
RandomList_\1:
	db _rl_count_\1
	DEF _rl_open = 1
	DEF _rl_mons = 0
ENDM

MACRO end_random_list
	_pm_flush
	assert _rl_mons >= 1 && _rl_mons <= 255, "random list {_rl_name} needs 1-255 Pokemon"
	DEF _rl_count_{_rl_name} EQU _rl_mons
	DEF _rl_open = 0
ENDM
