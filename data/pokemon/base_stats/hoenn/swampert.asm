	db 0 ; species ID placeholder

	db 100, 110,  90,  60,  85,  90
	evs  0,   3,   0,   0,   0,   0
	;   hp   atk  def  spd sat  sdf

	db WATER, GROUND ; type
	db 45 ; catch rate
	db 210 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/swampert/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm ROAR, TOXIC, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, REST, ATTRACT, SURF, STRENGTH, ROCK_SMASH, WATERFALL
	; end
