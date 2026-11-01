	db 0 ; species ID placeholder
	;BST: 400
	db  70,  75,  65,  90,  50,  50
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 120 ; catch rate
	db 131 ; base exp
	dw NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/poliwhirl/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, GRASS_KNOT, BLIZZARD, HYPER_BEAM, ICY_WIND, EARTHQUAKE, PSYCHIC_M, MUD_SLAP, ICE_PUNCH, THIEF, BRICK_BREAK, ANCIENTPOWER, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
