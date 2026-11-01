	db 0 ; species ID placeholder
	;BST: 450
	db  80,  90,  80,  80,  60,  60
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 127 ; catch rate
	db 128 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/mightyena/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, DIG, SHADOW_BALL, THIEF, POISON_FANG, BRICK_BREAK, STRENGTH
	; end
