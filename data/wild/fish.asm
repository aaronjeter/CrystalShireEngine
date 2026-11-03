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
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, TENTACOOL
	dbbw 100 percent,     2, KRABBY
.Shore_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, TENTACOOL
	dbbw  90 percent + 1, 5, KRABBY
	dbbw 100 percent,     0, TIME_GROUP
.Shore_Super:
	dbbw  40 percent,     8, KRABBY
	dbbw  70 percent,     1, TIME_GROUP
	dbbw  90 percent + 1, 8, TENTACRUEL
	dbbw 100 percent,     8, KINGLER

.Ocean_Old:
	dbbw  70 percent + 1, 2, KRABBY
	dbbw  85 percent + 1, 2, HORSEA
	dbbw 100 percent,     2, TENTACOOL
.Ocean_Good:
	dbbw  35 percent,     5, HORSEA
	dbbw  70 percent,     5, KRABBY
	dbbw  90 percent + 1, 5, CHINCHOU
	dbbw 100 percent,     5, SHELLDER
.Ocean_Super:
	dbbw  40 percent,     8, CHINCHOU
	dbbw  70 percent,     8, SHELLDER
	dbbw  90 percent + 1, 8, TENTACRUEL
	dbbw 100 percent,     8, LANTURN

.Lake_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, GOLDEEN
	dbbw 100 percent,     2, REMORAID
.Lake_Good:
	dbbw  35 percent,     5, GOLDEEN
	dbbw  70 percent,     5, MAGIKARP
	dbbw  90 percent + 1, 5, POLIWAG
	dbbw 100 percent,     5, REMORAID
.Lake_Super:
	dbbw  40 percent,     8, GOLDEEN
	dbbw  70 percent,     8, REMORAID
	dbbw  90 percent + 1, 8, SEAKING
	dbbw 100 percent,     8, POLIWHIRL

.Pond_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, POLIWAG
	dbbw 100 percent,     2, SUNBOU
.Pond_Good:
	dbbw  35 percent,     5, POLIWAG
	dbbw  70 percent,     5, MAGIKARP
	dbbw  90 percent + 1, 5, WOOPER
	dbbw 100 percent,     5, SUNBOU
.Pond_Super:
	dbbw  40 percent,     8, POLIWAG
	dbbw  70 percent,     8, SUNBOU
	dbbw  90 percent + 1, 8, QUAGSIRE
	dbbw 100 percent,     8, POLIWHIRL

.Dratini_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, MAGIKARP
	dbbw 100 percent,     2, GOLDEEN
.Dratini_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, GOLDEEN
	dbbw  90 percent + 1, 5, POLIWAG
	dbbw 100 percent,     5, DRATINI
.Dratini_Super:
	dbbw  40 percent,     8, MAGIKARP
	dbbw  70 percent,     8, DRATINI
	dbbw  90 percent + 1, 8, SEAKING
	dbbw 100 percent,     8, DRAGONAIR

.Qwilfish_Swarm_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, MAGIKARP
	dbbw 100 percent,     2, QWILFISH
.Qwilfish_Swarm_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, QWILFISH
	dbbw  90 percent + 1, 5, QWILFISH
	dbbw 100 percent,     5, QWILFISH
.Qwilfish_Swarm_Super:
	dbbw  40 percent,     8, QWILFISH
	dbbw  70 percent,     8, QWILFISH
	dbbw  90 percent + 1, 8, QWILFISH
	dbbw 100 percent,     8, QWILFISH

.Remoraid_Swarm_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, MAGIKARP
	dbbw 100 percent,     2, REMORAID
.Remoraid_Swarm_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, REMORAID
	dbbw  90 percent + 1, 5, REMORAID
	dbbw 100 percent,     5, REMORAID
.Remoraid_Swarm_Super:
	dbbw  40 percent,     8, REMORAID
	dbbw  70 percent,     8, REMORAID
	dbbw  90 percent + 1, 8, REMORAID
	dbbw 100 percent,     8, REMORAID

.Gyarados_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, GOLDEEN
	dbbw 100 percent,     2, MAGIKARP
.Gyarados_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, GOLDEEN
	dbbw  90 percent + 1, 5, MAGIKARP
	dbbw 100 percent,     5, GYARADOS
.Gyarados_Super:
	dbbw  40 percent,     8, MAGIKARP
	dbbw  70 percent,     8, GYARADOS
	dbbw  90 percent + 1, 8, GOLDEEN
	dbbw 100 percent,     8, MAGIKARP

.Dratini_2_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, MAGIKARP
	dbbw 100 percent,     2, DRATINI
.Dratini_2_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, DRATINI
	dbbw  90 percent + 1, 5, DRATINI
	dbbw 100 percent,     5, DRATINI
.Dratini_2_Super:
	dbbw  40 percent,     8, DRATINI
	dbbw  70 percent,     8, DRATINI
	dbbw  90 percent + 1, 8, DRATINI
	dbbw 100 percent,     8, DRAGONAIR

.WhirlIslands_Old:
	dbbw  70 percent + 1, 2, HORSEA
	dbbw  85 percent + 1, 2, HORSEA
	dbbw 100 percent,     2, KRABBY
.WhirlIslands_Good:
	dbbw  35 percent,     5, HORSEA
	dbbw  70 percent,     5, KRABBY
	dbbw  90 percent + 1, 5, KRABBY
	dbbw 100 percent,     5, HORSEA
.WhirlIslands_Super:
	dbbw  40 percent,     8, KRABBY
	dbbw  70 percent,     8, CORSOLA
	dbbw  90 percent + 1, 8, KINGLER
	dbbw 100 percent,     8, SEADRA

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, TENTACOOL
	dbbw 100 percent,     2, QWILFISH
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, TENTACOOL
	dbbw  90 percent + 1, 5, QWILFISH
	dbbw 100 percent,     5, TENTACOOL
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super:
	dbbw  40 percent,     8, TENTACOOL
	dbbw  70 percent,     8, TENTACOOL
	dbbw  90 percent + 1, 8, MAGIKARP
	dbbw 100 percent,     8, QWILFISH

.Remoraid_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, MAGIKARP
	dbbw 100 percent,     2, POLIWAG
.Remoraid_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, POLIWAG
	dbbw  90 percent + 1, 5, POLIWAG
	dbbw 100 percent,     5, POLIWAG
.Remoraid_Super:
	dbbw  40 percent,     8, POLIWAG
	dbbw  70 percent,     8, POLIWAG
	dbbw  90 percent + 1, 8, MAGIKARP
	dbbw 100 percent,     8, REMORAID

.Hoenn_Shore_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, TENTACOOL
	dbbw 100 percent,     2, LUVDISC
.Hoenn_Shore_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, TENTACOOL
	dbbw  90 percent + 1, 5, WAILMER
	dbbw 100 percent,     5, STARYU
.Hoenn_Shore_Super:
	dbbw  40 percent,     8, WAILMER
	dbbw  70 percent,     8, CARVANHA
	dbbw  90 percent + 1, 8, STARYU
	dbbw 100 percent,     8, TENTACRUEL

.Hoenn_Ocean_Old:
	dbbw  70 percent + 1, 2, TENTACOOL
	dbbw  85 percent + 1, 2, SUNBOU
	dbbw 100 percent,     2, CLAMPERL
.Hoenn_Ocean_Good:
	dbbw  35 percent,     5, TENTACOOL
	dbbw  70 percent,     5, SUNBOU
	dbbw  90 percent + 1, 5, HORSEA
	dbbw 100 percent,     5, CLAMPERL
.Hoenn_Ocean_Super:
	dbbw  40 percent,     8, TENTACOOL
	dbbw  70 percent,     8, SUNBOU
	dbbw  90 percent + 1, 8, HORSEA
	dbbw 100 percent,     8, CLAMPERL

.Hoenn_Lake_Old:
	dbbw  70 percent + 1, 2, BARBOACH
	dbbw  85 percent + 1, 2, GOLDEEN
	dbbw 100 percent,     2, CORPHISH
.Hoenn_Lake_Good:
	dbbw  35 percent,     5, BARBOACH
	dbbw  70 percent,     5, GOLDEEN
	dbbw  90 percent + 1, 5, CORPHISH
	dbbw 100 percent,     5, MAGIKARP
.Hoenn_Lake_Super:
	dbbw  40 percent,     8, BARBOACH
	dbbw  70 percent,     8, GOLDEEN
	dbbw  90 percent + 1, 8, WHISCASH
	dbbw 100 percent,     8, CRAWDAUNT

.Hoenn_Pond_Old:
	dbbw  70 percent + 1, 2, BARBOACH
	dbbw  85 percent + 1, 2, GOLDEEN
	dbbw 100 percent,     2, CORPHISH
.Hoenn_Pond_Good:
	dbbw  35 percent,     5, BARBOACH
	dbbw  70 percent,     5, GOLDEEN
	dbbw  90 percent + 1, 5, CORPHISH
	dbbw 100 percent,     5, PSYDUCK
.Hoenn_Pond_Super:
	dbbw  40 percent,     8, BARBOACH
	dbbw  70 percent,     8, GOLDEEN
	dbbw  90 percent + 1, 8, CORPHISH
	dbbw 100 percent,     8, GOLDUCK

.Hoenn_Cave_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, GOLDEEN
	dbbw 100 percent,     2, BARBOACH
.Hoenn_Cave_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, BARBOACH
	dbbw  90 percent + 1, 5, GOLDEEN
	dbbw 100 percent,     5, RELICANTH
.Hoenn_Cave_Super:
	dbbw  40 percent,     8, BARBOACH
	dbbw  70 percent,     8, WHISCASH
	dbbw  90 percent + 1, 8, GOLDEEN
	dbbw 100 percent,     8, RELICANTH

.Hoenn_River_Old:
	dbbw  70 percent + 1, 2, MAGIKARP
	dbbw  85 percent + 1, 2, GOLDEEN
	dbbw 100 percent,     2, BARBOACH
.Hoenn_River_Good:
	dbbw  35 percent,     5, MAGIKARP
	dbbw  70 percent,     5, GOLDEEN
	dbbw  90 percent + 1, 5, CARVANHA
	dbbw 100 percent,     5, FEEBAS
.Hoenn_River_Super:
	dbbw  40 percent,     8, CARVANHA
	dbbw  70 percent,     8, BARBOACH
	dbbw  90 percent + 1, 8, FEEBAS
	dbbw 100 percent,     8, FEEBAS

TimeFishGroups:
	;     day             nite
	dbwbw 5, CORSOLA,    5, STARYU     ; 0
	dbwbw 8, CORSOLA,    8, STARYU     ; 1
