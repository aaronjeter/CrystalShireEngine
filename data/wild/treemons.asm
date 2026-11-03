TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_RockCave
	dw TreeMonSet_RockKanto
	dw TreeMonSet_RockHoenn
	assert_table_length NUM_TREEMON_SETS
	dw TreeMonSet_City ; unused

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	dbbw 50, 2, SPEAROW
	dbbw 15, 2, SPEAROW
	dbbw 15, 2, SPEAROW
	dbbw 10, 2, AIPOM
	dbbw  5, 2, AIPOM
	dbbw  5, 2, AIPOM
	db -1
; rare
	dbbw 50, 2, SPEAROW
	dbbw 15, 2, HERACROSS
	dbbw 15, 2, HERACROSS
	dbbw 10, 2, AIPOM
	dbbw  5, 2, AIPOM
	dbbw  5, 2, AIPOM
	db -1

TreeMonSet_Town:
; common
	dbbw 50, 2, SPEAROW
	dbbw 15, 2, EKANS
	dbbw 15, 2, SPEAROW
	dbbw 10, 2, AIPOM
	dbbw  5, 2, AIPOM
	dbbw  5, 2, AIPOM
	db -1
; rare
	dbbw 50, 2, SPEAROW
	dbbw 15, 2, HERACROSS
	dbbw 15, 2, HERACROSS
	dbbw 10, 2, AIPOM
	dbbw  5, 2, AIPOM
	dbbw  5, 2, AIPOM
	db -1

TreeMonSet_Route:
; common
	dbbw 50, 2, HOOTHOOT
	dbbw 15, 2, SPINARAK
	dbbw 15, 2, LEDYBA
	dbbw 10, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	db -1
; rare
	dbbw 50, 2, HOOTHOOT
	dbbw 15, 2, PINECO
	dbbw 15, 2, PINECO
	dbbw 10, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	db -1

TreeMonSet_Kanto:
; common
	dbbw 50, 2, HOOTHOOT
	dbbw 15, 2, EKANS
	dbbw 15, 2, HOOTHOOT
	dbbw 10, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	db -1
; rare
	dbbw 50, 2, HOOTHOOT
	dbbw 15, 2, PINECO
	dbbw 15, 2, PINECO
	dbbw 10, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	db -1

TreeMonSet_Lake:
; common
	dbbw 50, 2, HOOTHOOT
	dbbw 15, 2, VENONAT
	dbbw 15, 2, HOOTHOOT
	dbbw 10, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	db -1
; rare
	dbbw 50, 2, HOOTHOOT
	dbbw 15, 2, PINECO
	dbbw 15, 2, PINECO
	dbbw 10, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	dbbw  5, 2, EXEGGCUTE
	db -1

TreeMonSet_Forest:
; common
	dbbw 50, 2, HOOTHOOT
	dbbw 15, 2, PINECO
	dbbw 15, 2, PINECO
	dbbw 10, 2, NOCTOWL
	dbbw  5, 2, BUTTERFREE
	dbbw  5, 2, BEEDRILL
	db -1
; rare
	dbbw 50, 2, HOOTHOOT
	dbbw 15, 2, CATERPIE
	dbbw 15, 2, WEEDLE
	dbbw 10, 2, HOOTHOOT
	dbbw  5, 2, METAPOD
	dbbw  5, 2, KAKUNA
	db -1

TreeMonSet_Rock:
	dbbw 90, 3, KRABBY
	dbbw 10, 3, SHUCKLE
	db -1

; Rock Smash sets added by the wild audit (Nov 3, 2026)
TreeMonSet_RockCave:
	dbbw 60, 3, GEODUDE
	dbbw 30, 3, DUNSPARCE
	dbbw 10, 3, SHUCKLE
	db -1

TreeMonSet_RockKanto:
	dbbw 60, 3, GEODUDE
	dbbw 30, 3, ONIX
	dbbw 10, 3, SHUCKLE
	db -1

TreeMonSet_RockHoenn:
	dbbw 50, 3, GEODUDE
	dbbw 30, 3, NOSEPASS
	dbbw 10, 3, ARON
	dbbw 10, 3, SHUCKLE
	db -1
