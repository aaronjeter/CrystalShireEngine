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
	const FACILITY_HALL_KANTO ; Vermilion's Challenge Hall
	const FACILITY_HALL_JOHTO ; Goldenrod's Challenge Hall
	const FACILITY_HALL_HOENN ; Mauville's Challenge Hall
	const FACILITY_HARD_KANTO ; Saffron's Challenge Hall
	const FACILITY_HARD_JOHTO ; Route 40's Challenge Hall (by the old Battle Tower)
	const FACILITY_HARD_HOENN ; Lilycove's Challenge Hall
	const FACILITY_ELITE ; the Battle Resort's Battle Tower (streaks; engine/events/battle_tower_streaks.asm)
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

; BP shops (data/events/bp_shops.asm)
	const_def
	const BPSHOP_TIER1    ; cheap: vitamins, Rare Candy, PP Up, Ability Capsule
	const BPSHOP_TIER2    ; utility
	const BPSHOP_TIER3    ; solid held items
	const BPSHOP_TIER4    ; premium
	const BPSHOP_COSMETIC ; Silver Leaf, Gold Leaf, Marvel Scale
DEF NUM_BPSHOPS EQU const_value

; the Battle Tower's elite streaks (engine/events/battle_tower_streaks.asm)
DEF TOWER_SET_LENGTH    EQU 7    ; battles in a set
DEF TOWER_BOSS_BATTLE   EQU 49   ; the Tower head's battle (in a streak)
DEF MAX_TOWER_STREAK    EQU 9999
DEF TOWER_FIRST_SET_BP  EQU 7    ; BP for a streak's first set
DEF TOWER_SET_BP        EQU 10   ; BP for each later set
DEF TOWER_TEAM_MON_LENGTH EQU 6  ; a locked Pokémon: species index (2), DVs (2), OT ID (2)
DEF NUM_TOWER_TRAINERS EQU 12   ; TowerTrainers
DEF TOWER_TRAINER_LENGTH EQU 3  ; class, id, sprite

; wTowerState bits
	const_def
	const TOWER_IN_SET_F   ; a set was started (a reset in the middle ends the streak)
	const TOWER_STREAK_F   ; a streak is on: the team in wTowerTeam is locked
	const TOWER_PRIZE7_F   ; the first 7-win prize was given
	const TOWER_PRIZE49_F  ; the first 49-win prize was given

; TowerCheck results
	const_def
	const TOWER_NO_STREAK    ; start a new streak
	const TOWER_RESUME       ; a streak is on: continue with the locked team
	const TOWER_INTERRUPTED  ; the last set wasn't finished: the streak ended

; TowerMilestone results
	const_def
	const TOWER_MILESTONE_NONE
	const TOWER_MILESTONE_7_FIRST
	const TOWER_MILESTONE_7
	const TOWER_MILESTONE_49_FIRST
	const TOWER_MILESTONE_49
