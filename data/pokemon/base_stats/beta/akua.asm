	db 0 ; species ID placeholder
	;BST: 405
	db  59,  63,  58,  80,  80,  65
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 142 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/akua/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, GRASS_KNOT, HYPER_BEAM, IRON_TAIL, DIG, ROCK_TOMB, BRICK_BREAK, ANCIENTPOWER, WATERFALL
	; end
