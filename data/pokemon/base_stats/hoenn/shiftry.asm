	db 0 ; species ID placeholder
	;BST: 480
	db  90, 100,  60,  80,  90,  60
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, DARK ; type
	db 45 ; catch rate
	db 181 ; base exp
	dw ORAN_BERRY, LEAF_STONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/shiftry/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, DARK_PULSE, GRASS_KNOT, HYPER_BEAM, GIGA_DRAIN, TAUNT, DIG, SHADOW_BALL, THIEF, AERIAL_ACE, MAGICAL_LEAF, BRICK_BREAK, CUT, STRENGTH, FLASH
	; end
