	db 0 ; species ID placeholder

	db  70,  75,  95,  60,  65,  85
	evs  0,   1,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, GHOST ; type
	db 45 ; catch rate
	db 98 ; base exp
	dw GOLD_LEAF, NUGGET ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/sableye/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, DARK_PULSE, SUNNY_DAY, RAIN_DANCE, DIG, PSYCHIC_M, ICE_PUNCH, THUNDERPUNCH, DREAM_EATER, THIEF, FIRE_PUNCH, ROCK_TOMB, WILLOWISP, BRICK_BREAK, CUT, FLASH
	; end
