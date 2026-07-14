DEF TIME_GROUP EQU 0 ; use the nth TimeFishGroups entry

MACRO fishgroup
; chance, old rod, good rod, super rod
	db \1
	dw \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	fishgroup 50 percent + 1, .Remoraid_Swarm_Old,   .Remoraid_Swarm_Good,   .Remoraid_Swarm_Super
	fishgroup 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	fishgroup 50 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	fishgroup 50 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super
	fishgroup 50 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super
	fishgroup 50 percent + 1, .Hoenn_Shore_Old,      .Hoenn_Shore_Good,      .Hoenn_Shore_Super
	fishgroup 50 percent + 1, .Hoenn_Ocean_Old,      .Hoenn_Ocean_Good,      .Hoenn_Ocean_Super
	fishgroup 50 percent + 1, .Hoenn_Lake_Old,       .Hoenn_Lake_Good,       .Hoenn_Lake_Super
	fishgroup 50 percent + 1, .Hoenn_Pond_Old,       .Hoenn_Pond_Good,       .Hoenn_Pond_Super
	fishgroup 50 percent + 1, .Hoenn_Cave_Old,       .Hoenn_Cave_Good,       .Hoenn_Cave_Super
	fishgroup 50 percent + 1, .Hoenn_River_Old,      .Hoenn_River_Good,      .Hoenn_River_Super
	assert_table_length NUM_FISHGROUPS

.Shore_Old:
	dbbw  70 percent + 1, 10, TENTACOOL
	dbbw  85 percent + 1, 10, KRABBY
	dbbw 100 percent,     10, SQUIRTLE
.Shore_Good:
	dbbw  35 percent,     20, TENTACOOL
	dbbw  70 percent,     20, KRABBY
	dbbw  90 percent + 1, 20, SQUIRTLE
	dbbw 100 percent,     0, TIME_GROUP
.Shore_Super:
	dbbw  40 percent,     40, KRABBY
	dbbw  70 percent,     1, TIME_GROUP
	dbbw  90 percent + 1, 40, STARYU
	dbbw 100 percent,     40, KINGLER

.Ocean_Old:
	dbbw  70 percent + 1, 10, KRABBY
	dbbw  85 percent + 1, 10, HORSEA
	dbbw 100 percent,     10, TENTACOOL
.Ocean_Good:
	dbbw  35 percent,     20, HORSEA
	dbbw  70 percent,     20, KRABBY
	dbbw  90 percent + 1, 20, CHINCHOU
	dbbw 100 percent,     20, SHELLDER
.Ocean_Super:
	dbbw  40 percent,     40, CHINCHOU
	dbbw  70 percent,     40, SHELLDER
	dbbw  90 percent + 1, 40, TENTACRUEL
	dbbw 100 percent,     40, LANTURN

.Lake_Old:
	dbbw  70 percent + 1, 10, BARBOACH
	dbbw  85 percent + 1, 10, HORSEA
	dbbw 100 percent,     10, REMORAID
.Lake_Good:
	dbbw  35 percent,     20, BARBOACH
	dbbw  70 percent,     20, HORSEA
	dbbw  90 percent + 1, 20, REMORAID
	dbbw 100 percent,     20, GOLDEEN
.Lake_Super:
	dbbw  40 percent,     40, BARBOACH
	dbbw  70 percent,     40, GOLDEEN
	dbbw  90 percent + 1, 40, HORSEA
	dbbw 100 percent,     40, REMORAID

.Pond_Old:
	dbbw  70 percent + 1, 10, BARBOACH
	dbbw  85 percent + 1, 10, QWILFISH
	dbbw 100 percent,     10, SUNBOU
.Pond_Good:
	dbbw  35 percent,     20, BARBOACH
	dbbw  70 percent,     20, QWILFISH
	dbbw  90 percent + 1, 20, SUNBOU
	dbbw 100 percent,     20, POLIWAG
.Pond_Super:
	dbbw  40 percent,     40, BARBOACH
	dbbw  70 percent,     40, POLIWAG
	dbbw  90 percent + 1, 40, SUNBOU
	dbbw 100 percent,     40, QWILFISH

.Dratini_Old:
	dbbw  70 percent + 1, 10, MAGIKARP
	dbbw  85 percent + 1, 10, DRATINI
	dbbw 100 percent,     10, DRATINI
.Dratini_Good:
	dbbw  35 percent,     20, MAGIKARP
	dbbw  70 percent,     20, MAGIKARP
	dbbw  90 percent + 1, 20, DRATINI
	dbbw 100 percent,     20, DRATINI
.Dratini_Super:
	dbbw  40 percent,     40, DRATINI
	dbbw  70 percent,     40, DRATINI
	dbbw  90 percent + 1, 40, DRATINI
	dbbw 100 percent,     40, DRAGONAIR

.Qwilfish_Swarm_Old:
	dbbw  70 percent + 1, 5, MAGIKARP
	dbbw  85 percent + 1, 5, MAGIKARP
	dbbw 100 percent,     5, QWILFISH
.Qwilfish_Swarm_Good:
	dbbw  35 percent,     20, MAGIKARP
	dbbw  70 percent,     20, QWILFISH
	dbbw  90 percent + 1, 20, QWILFISH
	dbbw 100 percent,     20, QWILFISH
.Qwilfish_Swarm_Super:
	dbbw  40 percent,     40, QWILFISH
	dbbw  70 percent,     40, QWILFISH
	dbbw  90 percent + 1, 40, QWILFISH
	dbbw 100 percent,     40, QWILFISH

.Remoraid_Swarm_Old:
	dbbw  70 percent + 1, 10, MAGIKARP
	dbbw  85 percent + 1, 10, MAGIKARP
	dbbw 100 percent,     10, REMORAID
.Remoraid_Swarm_Good:
	dbbw  35 percent,     20, MAGIKARP
	dbbw  70 percent,     20, REMORAID
	dbbw  90 percent + 1, 20, REMORAID
	dbbw 100 percent,     20, REMORAID
.Remoraid_Swarm_Super:
	dbbw  40 percent,     40, REMORAID
	dbbw  70 percent,     40, REMORAID
	dbbw  90 percent + 1, 40, REMORAID
	dbbw 100 percent,     40, REMORAID

.Gyarados_Old:
	dbbw  70 percent + 1, 10, MAGIKARP
	dbbw  85 percent + 1, 10, BARBOACH
	dbbw 100 percent,     10, MAGIKARP
.Gyarados_Good:
	dbbw  35 percent,     20, MAGIKARP
	dbbw  70 percent,     20, BARBOACH
	dbbw  90 percent + 1, 20, MAGIKARP
	dbbw 100 percent,     20, GYARADOS
.Gyarados_Super:
	dbbw  40 percent,     40, MAGIKARP
	dbbw  70 percent,     40, GYARADOS
	dbbw  90 percent + 1, 40, BARBOACH
	dbbw 100 percent,     40, MAGIKARP

.Dratini_2_Old:
	dbbw  70 percent + 1, 10, MAGIKARP
	dbbw  85 percent + 1, 10, MAGIKARP
	dbbw 100 percent,     10, DRATINI
.Dratini_2_Good:
	dbbw  35 percent,     10, MAGIKARP
	dbbw  70 percent,     10, DRATINI
	dbbw  90 percent + 1, 10, DRATINI
	dbbw 100 percent,     10, DRATINI
.Dratini_2_Super:
	dbbw  40 percent,     10, DRATINI
	dbbw  70 percent,     10, DRATINI
	dbbw  90 percent + 1, 10, DRATINI
	dbbw 100 percent,     10, DRAGONAIR

.WhirlIslands_Old:
	dbbw  70 percent + 1, 10, HORSEA
	dbbw  85 percent + 1, 10, HORSEA
	dbbw 100 percent,     10, KRABBY
.WhirlIslands_Good:
	dbbw  35 percent,     20, HORSEA
	dbbw  70 percent,     20, KRABBY
	dbbw  90 percent + 1, 20, KRABBY
	dbbw 100 percent,     20, HORSEA
.WhirlIslands_Super:
	dbbw  40 percent,     40, KRABBY
	dbbw  70 percent,     40, CORSOLA
	dbbw  90 percent + 1, 40, KINGLER
	dbbw 100 percent,     40, SEADRA

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old:
	dbbw  70 percent + 1, 10, MAGIKARP
	dbbw  85 percent + 1, 10, MAGIKARP
	dbbw 100 percent,     10, TENTACOOL
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good:
	dbbw  35 percent,     20, MAGIKARP
	dbbw  70 percent,     20, TENTACOOL
	dbbw  90 percent + 1, 20, TENTACOOL
	dbbw 100 percent,     20, TENTACOOL
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super:
	dbbw  40 percent,     40, TENTACOOL
	dbbw  70 percent,     40, TENTACOOL
	dbbw  90 percent + 1, 40, MAGIKARP
	dbbw 100 percent,     40, QWILFISH

.Remoraid_Old:
	dbbw  70 percent + 1, 10, MAGIKARP
	dbbw  85 percent + 1, 10, MAGIKARP
	dbbw 100 percent,     10, POLIWAG
.Remoraid_Good:
	dbbw  35 percent,     20, MAGIKARP
	dbbw  70 percent,     20, POLIWAG
	dbbw  90 percent + 1, 20, POLIWAG
	dbbw 100 percent,     20, POLIWAG
.Remoraid_Super:
	dbbw  40 percent,     40, POLIWAG
	dbbw  70 percent,     40, POLIWAG
	dbbw  90 percent + 1, 40, MAGIKARP
	dbbw 100 percent,     40, REMORAID

.Hoenn_Shore_Old:
	dbbw  70 percent + 1, 10, MAGIKARP
	dbbw  85 percent + 1, 10, TENTACOOL
	dbbw 100 percent,     10, SQUIRTLE
.Hoenn_Shore_Good:
	dbbw  35 percent,     20, MAGIKARP
	dbbw  70 percent,     20, TENTACOOL
	dbbw  90 percent + 1, 20, WAILMER
	dbbw 100 percent,     20, STARYU
.Hoenn_Shore_Super:
	dbbw  40 percent,     40, MAGIKARP
	dbbw  70 percent,     40, TENTACOOL
	dbbw  90 percent + 1, 40, WAILMER
	dbbw 100 percent,     40, STARYU

.Hoenn_Ocean_Old:
	dbbw  70 percent + 1, 10, TENTACOOL
	dbbw  85 percent + 1, 10, SUNBOU
	dbbw 100 percent,     10, CLAMPERL
.Hoenn_Ocean_Good:
	dbbw  35 percent,     20, TENTACOOL
	dbbw  70 percent,     20, SUNBOU
	dbbw  90 percent + 1, 20, HORSEA
	dbbw 100 percent,     20, CLAMPERL
.Hoenn_Ocean_Super:
	dbbw  40 percent,     40, TENTACOOL
	dbbw  70 percent,     40, SUNBOU
	dbbw  90 percent + 1, 40, HORSEA
	dbbw 100 percent,     40, CLAMPERL

.Hoenn_Lake_Old:
	dbbw  70 percent + 1, 10, BARBOACH
	dbbw  85 percent + 1, 10, GOLDEEN
	dbbw 100 percent,     10, CORPHISH
.Hoenn_Lake_Good:
	dbbw  35 percent,     20, BARBOACH
	dbbw  70 percent,     20, GOLDEEN
	dbbw  90 percent + 1, 20, CORPHISH
	dbbw 100 percent,     20, MUDKIP
.Hoenn_Lake_Super:
	dbbw  40 percent,     40, BARBOACH
	dbbw  70 percent,     40, GOLDEEN
	dbbw  90 percent + 1, 40, CORPHISH
	dbbw 100 percent,     40, MUDKIP

.Hoenn_Pond_Old:
	dbbw  70 percent + 1, 10, BARBOACH
	dbbw  85 percent + 1, 10, GOLDEEN
	dbbw 100 percent,     10, CORPHISH
.Hoenn_Pond_Good:
	dbbw  35 percent,     20, BARBOACH
	dbbw  70 percent,     20, GOLDEEN
	dbbw  90 percent + 1, 20, CORPHISH
	dbbw 100 percent,     20, PSYDUCK
.Hoenn_Pond_Super:
	dbbw  40 percent,     40, BARBOACH
	dbbw  70 percent,     40, GOLDEEN
	dbbw  90 percent + 1, 40, CORPHISH
	dbbw 100 percent,     40, GOLDUCK

.Hoenn_Cave_Old:
	dbbw  70 percent + 1, 10, MAGIKARP
	dbbw  85 percent + 1, 10, ANORITH
	dbbw 100 percent,     10, CHINCHOU
.Hoenn_Cave_Good:
	dbbw  35 percent,     20, MAGIKARP
	dbbw  70 percent,     20, ANORITH
	dbbw  90 percent + 1, 20, CHINCHOU
	dbbw 100 percent,     20, RELICANTH
.Hoenn_Cave_Super:
	dbbw  40 percent,     40, CHINCHOU
	dbbw  70 percent,     40, ANORITH
	dbbw  90 percent + 1, 40, RELICANTH
	dbbw 100 percent,     40, RELICANTH

.Hoenn_River_Old:
	dbbw  70 percent + 1, 10, MAGIKARP
	dbbw  85 percent + 1, 10, GOLDEEN
	dbbw 100 percent,     10, DRATINI
.Hoenn_River_Good:
	dbbw  35 percent,     20, MAGIKARP
	dbbw  70 percent,     20, GOLDEEN
	dbbw  90 percent + 1, 20, MUDKIP
	dbbw 100 percent,     20, FEEBAS
.Hoenn_River_Super:
	dbbw  40 percent,     40, MAGIKARP
	dbbw  70 percent,     40, MUDKIP
	dbbw  90 percent + 1, 40, FEEBAS
	dbbw 100 percent,     40, FEEBAS

TimeFishGroups:
	;     day             nite
	dbwbw 20, CORSOLA,    20, STARYU     ; 0
	dbwbw 40, CORSOLA,    40, STARYU     ; 1
