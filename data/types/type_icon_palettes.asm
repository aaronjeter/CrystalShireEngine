; Colors for each icon in gfx/type_icons/type_icons.png, as OBJ palettes.
; Color 0 is transparent; 1 = fill, 2 = border and text shadow, 3 = text (white).
; entries correspond to TYPEICON_* constants
TypeIconPalettes:
	table_width PAL_COLOR_SIZE * 4
	RGB 31, 31, 31,  21, 21, 15,  11, 11, 08,  31, 31, 31 ; NORMAL
	RGB 31, 31, 31,  24, 06, 05,  13, 03, 02,  31, 31, 31 ; FIGHT
	RGB 31, 31, 31,  21, 18, 30,  11, 09, 16,  31, 31, 31 ; FLYING
	RGB 31, 31, 31,  20, 08, 20,  11, 04, 11,  31, 31, 31 ; POISON
	RGB 31, 31, 31,  28, 24, 13,  15, 13, 07,  31, 31, 31 ; GROUND
	RGB 31, 31, 31,  23, 20, 07,  12, 11, 03,  31, 31, 31 ; ROCK
	RGB 31, 31, 31,  21, 23, 04,  11, 12, 02,  31, 31, 31 ; BUG
	RGB 31, 31, 31,  14, 11, 19,  07, 06, 10,  31, 31, 31 ; GHOST
	RGB 31, 31, 31,  23, 23, 26,  12, 12, 14,  31, 31, 31 ; STEEL
	RGB 31, 31, 31,  30, 16, 06,  16, 08, 03,  31, 31, 31 ; FIRE
	RGB 31, 31, 31,  13, 18, 30,  07, 09, 16,  31, 31, 31 ; WATER
	RGB 31, 31, 31,  15, 25, 10,  08, 13, 05,  31, 31, 31 ; GRASS
	RGB 31, 31, 31,  31, 26, 06,  17, 14, 03,  31, 31, 31 ; ELECTR
	RGB 31, 31, 31,  31, 11, 17,  17, 06, 09,  31, 31, 31 ; PSYCHC
	RGB 31, 31, 31,  19, 27, 27,  10, 14, 14,  31, 31, 31 ; ICE
	RGB 31, 31, 31,  14, 07, 31,  07, 03, 17,  31, 31, 31 ; DRAGON
	RGB 31, 31, 31,  14, 11, 09,  07, 06, 04,  31, 31, 31 ; DARK
	RGB 31, 31, 31,  29, 19, 21,  16, 10, 11,  31, 31, 31 ; FAIRY
	RGB 31, 31, 31,  13, 20, 18,  07, 11, 09,  31, 31, 31 ; ???
	RGB 31, 31, 31,  28, 11, 05,  15, 06, 02,  31, 31, 31 ; PHYS.
	RGB 31, 31, 31,  09, 13, 26,  04, 07, 14,  31, 31, 31 ; SPEC.
	RGB 31, 31, 31,  18, 18, 19,  09, 09, 10,  31, 31, 31 ; STATUS
	assert_table_length NUM_TYPE_ICONS
