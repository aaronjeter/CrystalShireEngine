	db 0 ; species ID placeholder
	;BST: 555
	db  95, 115,  80,  90,  95,  80
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ROCK ; type
	db 75 ; catch rate
	db 213 ; base exp
	dw ASPEAR_BERRY, ASPEAR_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/harcanine/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, IRON_TAIL, DRAGONBREATH, DIG, SANDSTORM, FIRE_BLAST, SWIFT, THUNDER_FANG, ROCK_TOMB, WILLOWISP, BRICK_BREAK, ANCIENTPOWER, FLAMETHROWER
	; end
