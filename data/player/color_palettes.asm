; Player outfit colors: the front pic / back pic / trainer card palette for each
; wPlayerColor (PLAYER_COLOR_*), indexed by it. Two colors each: skin, then the
; outfit color (white and black are added around them).
; The overworld sprite uses the matching PAL_OW_* (wPlayerColor is that index).
; These are the player's own, separate from the trainer class palettes. The
; ones that used to borrow a trainer's colors kept the same values.

PlayerColorPalettes:
; entries correspond to PLAYER_COLOR_* constants
	table_width PAL_COLOR_SIZE * 2
	RGB 31, 19, 14,  27, 05, 03 ; red (its own)
	RGB 27, 17, 14,  07, 05, 31 ; blue (was Falkner's)
	RGB 31, 18, 13,  07, 15, 08 ; green (was Erika's)
	RGB 30, 21, 14,  22, 15, 00 ; brown (was chris.pal)
	RGB 31, 23, 07,  13, 08, 15 ; purple (was Glacia's)
	RGB 25, 17, 05,  13, 12, 15 ; gray (was Drake's)
	RGB 31, 19, 14,  29, 08, 16 ; pink (its own)
	RGB 30, 22, 17,  00, 18, 15 ; teal (was kris.pal)
	RGB 31, 19, 14,  27, 05, 03 ; yellow (unused: not in the color menu; same as red)
	RGB 29, 19, 16,  20, 10, 05 ; orange (was Misty's)
	RGB 31, 19, 14,  05, 16, 30 ; azure (its own)
	RGB 31, 19, 14,  27, 05, 03 ; white (unused: not in the color menu; same as red)
	RGB 31, 19, 14,  06, 06, 09 ; black (its own)
	assert_table_length NUM_PLAYER_COLORS
