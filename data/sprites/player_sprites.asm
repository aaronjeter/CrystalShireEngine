PlayerStateSprites:
; entries correspond to CHARACTER_* constants
	table_width 2
	dw ChrisStateSprites
	dw KrisStateSprites
	dw BrendanStateSprites
	dw MayStateSprites
	assert_table_length NUM_PLAYER_CHARACTERS

ChrisStateSprites:
	db PLAYER_NORMAL,    SPRITE_CHRIS
	db PLAYER_BIKE,      SPRITE_CHRIS_BIKE
	db PLAYER_SURF,      SPRITE_SURF
	db PLAYER_SURF_PIKA, SPRITE_SURFING_PIKACHU
	db -1 ; end

KrisStateSprites:
	db PLAYER_NORMAL,    SPRITE_KRIS
	db PLAYER_BIKE,      SPRITE_KRIS_BIKE
	db PLAYER_SURF,      SPRITE_SURF
	db PLAYER_SURF_PIKA, SPRITE_SURFING_PIKACHU
	db -1 ; end

BrendanStateSprites:
	db PLAYER_NORMAL,    SPRITE_BRENDAN
	db PLAYER_BIKE,      SPRITE_BRENDAN_BIKE
	db PLAYER_SURF,      SPRITE_SURF
	db PLAYER_SURF_PIKA, SPRITE_SURFING_PIKACHU
	db -1 ; end

MayStateSprites:
	db PLAYER_NORMAL,    SPRITE_MAY
	db PLAYER_BIKE,      SPRITE_MAY_BIKE
	db PLAYER_SURF,      SPRITE_SURF
	db PLAYER_SURF_PIKA, SPRITE_SURFING_PIKACHU
	db -1 ; end
