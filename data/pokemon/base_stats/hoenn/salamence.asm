	db 0 ; species ID placeholder

	db  95, 135,  80, 100, 110,  80
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/salamence/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, BRICK_BREAK, FLAMETHROWER, FIRE_BLAST, ROCK_TOMB, AERIAL_ACE, REST, ATTRACT, STEEL_WING, CUT, FLY, STRENGTH, ROCK_SMASH, FIRE_FANG
	; end
