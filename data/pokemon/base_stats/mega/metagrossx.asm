	db 0 ; species ID placeholder
	;BST: 650
	db  80, 135, 130, 100, 105, 100
	evs  0,   0,   3,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 250 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/metagrossx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, RAIN_DANCE, EARTHQUAKE, SHADOW_BALL, SANDSTORM, ROCK_TOMB, AERIAL_ACE, BRICK_BREAK, LIGHT_SCREEN, ROCK_SLIDE, CUT, STRENGTH, FLASH
	; end
