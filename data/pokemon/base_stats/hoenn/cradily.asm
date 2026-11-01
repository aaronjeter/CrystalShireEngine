	db 0 ; species ID placeholder
	;bst 535
	db  96,  61, 117,  43, 101, 117
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GRASS ; type
	db 45 ; catch rate
	db 199 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/cradily/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, GRASS_KNOT, HYPER_BEAM, EARTHQUAKE, SLUDGE_BOMB, SANDSTORM, ROCK_TOMB, STRENGTH
	; end
