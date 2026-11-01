	db 0 ; species ID placeholder

	db  105,  125, 125,  50,  50, 125
	evs   0,    0,   2,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db STEEL, STEEL ; type
	db 3 ; catch rate
	db 215 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/registeel/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, BODY_SLAM, RAIN_DANCE, THUNDER, ICE_PUNCH, SANDSTORM, DRAIN_PUNCH, THUNDERPUNCH, FIRE_PUNCH, ROCK_TOMB, SHOCK_WAVE, AERIAL_ACE, BRICK_BREAK, ROCK_SLIDE, STRENGTH, THUNDERBOLT
	; end
