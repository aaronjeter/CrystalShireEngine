	db 0 ; species ID placeholder
	;BST: 500
	db  80,  82,  78,  85,  95,  80
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 174 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/golduck/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, GRASS_KNOT, BLIZZARD, HYPER_BEAM, ICY_WIND, IRON_TAIL, DIG, MUD_SLAP, ICE_PUNCH, SWIFT, ZEN_HEADBUTT, SCALD, BRICK_BREAK, LIGHT_SCREEN, REFLECT, SURF, STRENGTH, FLASH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
