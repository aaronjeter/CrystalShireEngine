	db 0 ; species ID placeholder
	;BST: 300
	db  40,  50,  40,  90,  40,  40
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 255 ; catch rate
	db 77 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/poliwag/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, GRASS_KNOT, BLIZZARD, HYPER_BEAM, ICY_WIND, EARTHQUAKE, PSYCHIC_M, MUD_SLAP, ICE_PUNCH, THIEF, BRICK_BREAK, ANCIENTPOWER, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
