	db 0 ; species ID placeholder

	db 100, 150, 140,  90, 100,  90
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 3 ; catch rate
	db 218 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/groudon/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, HYPER_BEAM, IRON_TAIL, THUNDER, DIG, SANDSTORM, FIRE_FANG, ROCK_TOMB, SHOCK_WAVE, AERIAL_ACE, DRAGON_CLAW, BRICK_BREAK, ROCK_SLIDE, SHADOW_CLAW, CUT, STRENGTH, FLAMETHROWER, THUNDERBOLT
	; end
