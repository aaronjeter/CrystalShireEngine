TrainerEVSpreads:
; ev_spread presets (EVS_* in constants/trainer_data_constants.asm)
; Hard mode counts every EV as 255 (CalcMonStatC), so these only show on Normal.
	table_width NUM_STATS
	;   hp, atk, def, spd, sat, sdf
	db   6, 252,   0, 252,   0,   0 ; EVS_ATK_SPE
	db   6,   0,   0, 252, 252,   0 ; EVS_SAT_SPE
	db 252, 252,   0,   6,   0,   0 ; EVS_HP_ATK
	db 252,   0,   0,   6, 252,   0 ; EVS_HP_SAT
	db 252,   0, 252,   0,   0,   6 ; EVS_HP_DEF
	db 252,   0,   6,   0,   0, 252 ; EVS_HP_SDF
	db  85,  85,  85,  85,  85,  85 ; EVS_ALL
	assert_table_length NUM_EV_SPREADS
