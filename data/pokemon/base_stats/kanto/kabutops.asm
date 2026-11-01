	db 0 ; species ID placeholder
	;bst 535
	db  80, 115, 115,  80,  65,  80
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 201 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/kabutops/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, GIGA_DRAIN, DIG, SANDSTORM, THIEF, FURY_CUTTER, HAIL, BUBBLEBEAM, BRICK_BREAK, CUT, SURF, WHIRLPOOL, ICE_BEAM
	; end
