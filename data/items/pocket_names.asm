ItemPocketNames:
; entries correspond to item type constants
	table_width 2
	dw .Item
	dw .Key
	dw .Ball
	dw .TM
	dw .Medicine
	dw .Berry
	dw .Held
	dw .Training
	dw .Treasure
	assert_table_length NUM_ITEM_TYPES

.Item:     db "Item Pocket@"
.Key:      db "Key Pocket@"
.Ball:     db "Ball Pocket@"
.TM:       db "TM Pocket@"
.Medicine: db "Medicine Pocket@"
.Berry:    db "Berry Pocket@"
.Held:     db "Held Item Pocket@"
.Training: db "Training Pocket@"
.Treasure: db "Treasure Pocket@"
