	db 0 ; species ID placeholder

	db  40,  45,  35,  70,  65,  55
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 65 ; base exp
	dw SILVER_LEAF, GOLD_LEAF ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/treecko/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, GRASS_KNOT, HYPER_BEAM, IRON_TAIL, EARTHQUAKE, DIG, THUNDERPUNCH, AERIAL_ACE, MAGICAL_LEAF, BRICK_BREAK, ANCIENTPOWER, ROCK_SLIDE, CUT, STRENGTH, FLASH
	; end
