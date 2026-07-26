	db 0 ; species ID placeholder

	db  70,  75,  95,  60,  65,  85
	evs  0,   1,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, GHOST ; type
	db 45 ; catch rate
	db 98 ; base exp
	dw NUGGET, NUGGET ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/sableye/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, REST, ATTRACT, THIEF, CUT, FLASH, ROCK_SMASH, ROCK_TOMB, SHOCK_WAVE, WILLOWISP, MAGICAL_LEAF, BRICK_BREAK, ANCIENTPOWER
	; end
