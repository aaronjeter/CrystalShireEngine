	db 0 ; species ID placeholder
	;bst 550
	db  99,  78,  110,  71,  82,  110
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING ; type
	db 200 ; catch rate
	db 169 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/tropiusx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, GRASS_KNOT, HYPER_BEAM, EARTHQUAKE, STEEL_WING, CALM_MIND, DRAGON_CLAW, BRICK_BREAK, ANCIENTPOWER, CUT, FLY, STRENGTH, FLASH
	; end
