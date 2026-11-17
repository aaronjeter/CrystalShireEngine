NonTrainerCallerNames:
; entries correspond to PHONECONTACT_* constants (see constants/trainer_constants.asm)
	table_width 2
	dw .none
	dw .mom
	dw .bikeshop
	dw .bill
	dw .elm
	dw .buena
	dw .oak
	dw .birch
	assert_table_length NUM_NONTRAINER_PHONECONTACTS + 1

.none:     db "----------@"
.mom:      db "Mom:@"
.bill:     db "Bill:@"
.elm:      db "Prof.Elm:@"
.oak:      db "Prof.Oak:@"
.birch:    db "Prof.Birch:@"
.bikeshop: db "Bike Shop:@"
.buena:    db "Buena:<LF>   Disc Jockey@"
