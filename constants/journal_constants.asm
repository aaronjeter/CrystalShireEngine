; Journal missions (engine/menus/journal.asm, data/events/journal_missions.asm).
; A mission's progress is read from the game's state each time: it has a start
; check (it shows in the journal once that passes) and one check per step; a
; step is done when its check passes.

; mission checks: db MC_*; dw argument
	const_def
	const MC_NONE        ; always passes
	const MC_EVENT       ; event flag set
	const MC_NOT_EVENT   ; event flag not set
	const MC_ENGINE      ; engine flag set
	const MC_JOHTO_BADGES ; at least n Johto badges
	const MC_KANTO_BADGES ; at least n Kanto badges
	const MC_HOENN_BADGES ; at least n Hoenn badges
	const MC_BADGES      ; at least n badges in total
	const MC_ITEM        ; item (index) in the bag or key items
	const MC_HALL_OF_FAME ; a Hall of Fame entry for League n (LEAGUE_*)
	const MC_REMATCH     ; League n's rematch won
	const MC_TOWER       ; Battle Tower best streak of at least n
	const MC_DEFENSES    ; at least n World Cup title defenses
	const MC_CAUGHT      ; species (index) caught, per the Pokédex
	const MC_CALL        ; routine (in the journal's section) returns carry
DEF NUM_MISSION_CHECKS EQU const_value

; mission regions (the detail page's label)
	const_def
	const MREGION_JOHTO
	const MREGION_KANTO
	const MREGION_HOENN
	const MREGION_WORLD
DEF NUM_MISSION_REGIONS EQU const_value

DEF MAX_MISSION_STEPS EQU 7 ; rows on the detail page
DEF MISSION_TITLE_LENGTH EQU 15 ; the list shows NEW after it

; wJournalState entries
DEF MISSION_STARTED_F EQU 7
DEF MISSION_DONE_F    EQU 6
DEF MISSION_STEPS_MASK EQU %1111 ; steps done

; journal tabs
	const_def
	const JOURNALTAB_ACTIVE
	const JOURNALTAB_DONE
DEF NUM_JOURNAL_TABS EQU const_value

DEF JOURNAL_LIST_ROWS EQU 6

; journal region filters: all, then MREGION_* + 1
DEF JOURNALREGION_ALL EQU 0
DEF NUM_JOURNAL_REGIONS EQU NUM_MISSION_REGIONS + 1

; missions, in journal order (data/events/journal_missions.asm)
	const_def
; main goals
	const MISSION_JOHTO_CHALLENGE
	const MISSION_KANTO_CHALLENGE
	const MISSION_HOENN_CHALLENGE
	const MISSION_WORLD_CUP
; story
	const MISSION_MYSTERY_EGG
	const MISSION_TOGEPI_EGG
	const MISSION_ROCKETS_SIGNAL
	const MISSION_JANES_TRAIL
; legendaries
	const MISSION_RED_GYARADOS
	const MISSION_BELL_TOWER
	const MISSION_WHIRL_ISLANDS
	const MISSION_LEGENDARY_BIRDS
	const MISSION_MEWTWO
	const MISSION_REGI_TRIO
	const MISSION_WEATHER_DUO
	const MISSION_METEOR_PEAK
	const MISSION_DESERT_SHRINE
; errands
	const MISSION_PARCELS
	const MISSION_FAST_SHIP
; challenges
	const MISSION_JOHTO_AIDES
	const MISSION_KANTO_AIDES
	const MISSION_HOENN_AIDES
	const MISSION_JOHTO_HALLS
	const MISSION_KANTO_HALLS
	const MISSION_HOENN_HALLS
	const MISSION_BATTLE_TOWER
	const MISSION_LEAGUE_REMATCHES
	const MISSION_TITLE_DEFENSE
DEF NUM_MISSIONS EQU const_value
