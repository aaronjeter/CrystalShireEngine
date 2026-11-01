	db 0 ; species ID placeholder
	;BST: 340
	db  70,  70,  40,  60,  60,  40
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, DARK ; type
	db 120 ; catch rate
	db 141 ; base exp
	dw SILVER_LEAF, LEAF_STONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/nuzleaf/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, DARK_PULSE, GRASS_KNOT, HYPER_BEAM, GIGA_DRAIN, TAUNT, DIG, SHADOW_BALL, THIEF, AERIAL_ACE, MAGICAL_LEAF, BRICK_BREAK, CUT, STRENGTH, FLASH
	; end
