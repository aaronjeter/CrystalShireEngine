	db 0 ; species ID placeholder

	db 105, 125, 150,  50,  50, 100
	evs  0,   0,   3,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK ; type
	db 3 ; catch rate
	db 217 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/regirock/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, THUNDER, DIG, ICE_PUNCH, DRAIN_PUNCH, THUNDERPUNCH, FIRE_PUNCH, SHOCK_WAVE, BRICK_BREAK, STRENGTH, THUNDERBOLT
	; end
