; Challenge facilities (engine/events/facility.asm, data/events/facilities.asm)

DEF FACILITY_TEAM_SIZE EQU 4 ; Pokémon the player enters
DEF FACILITY_ROUNDS    EQU 3 ; battles in a world rank
DEF FACILITY_LITTLE_CUP_LEVEL EQU 20

; facility categories
	const_def
	const FACILITY_ANY    ; everything (but Eggs)
	const FACILITY_LITTLE_CUP ; LittleCupMons
	const FACILITY_MIDDLE_CUP ; has a pre-evolution and evolves further
	const FACILITY_TYPE_CUP   ; parameter: a type
	const FACILITY_REGION_CUP ; parameter: FACILITY_JOHTO, FACILITY_KANTO or FACILITY_HOENN
DEF NUM_FACILITY_CATEGORIES EQU const_value

; battle styles
	const_def
	const FACILITY_SINGLES
	const FACILITY_DOUBLES

; FacilityEligibility bits (data/pokemon/facility_eligibility.asm)
DEF FACILITY_LITTLE_F EQU 0
DEF FACILITY_MIDDLE_F EQU 1
DEF FACILITY_LITTLE EQU 1 << FACILITY_LITTLE_F
DEF FACILITY_MIDDLE EQU 1 << FACILITY_MIDDLE_F
DEF FACILITY_REGION_SHIFT EQU 2
DEF FACILITY_REGION_MASK EQU %11 << FACILITY_REGION_SHIFT
DEF FACILITY_JOHTO EQU 0 << FACILITY_REGION_SHIFT
DEF FACILITY_KANTO EQU 1 << FACILITY_REGION_SHIFT
DEF FACILITY_HOENN EQU 2 << FACILITY_REGION_SHIFT

; facility records (data/events/facilities.asm)
	const_def
	const FACILITY_TEST ; Test Room prototype
	const FACILITY_INTRO_KANTO ; Viridian's Trainer House
	const FACILITY_INTRO_JOHTO ; Earl's Academy, Violet
	const FACILITY_INTRO_HOENN ; Rustboro's Trainers' School
DEF NUM_FACILITIES EQU const_value

; a facility record: category, parameter, level, style, prize (2), cleared flag (2), then class, id and
; overworld sprite per round
DEF FACILITY_CATEGORY EQU 0
DEF FACILITY_PARAM    EQU 1
DEF FACILITY_LEVEL    EQU 2
DEF FACILITY_STYLE    EQU 3
DEF FACILITY_PRIZE    EQU 4
DEF FACILITY_FLAG     EQU 6
DEF FACILITY_TRAINERS EQU 8
DEF FACILITY_TRAINER_LENGTH EQU 3
DEF FACILITY_RECORD_LENGTH EQU FACILITY_TRAINERS + FACILITY_ROUNDS * FACILITY_TRAINER_LENGTH
